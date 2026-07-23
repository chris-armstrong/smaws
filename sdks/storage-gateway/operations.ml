open Types
open Service_metadata

module UpdateAutomaticTapeCreationPolicy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_automatic_tape_creation_policy_input) =
    let input = Json_serializers.update_automatic_tape_creation_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.UpdateAutomaticTapeCreationPolicy" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_automatic_tape_creation_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_automatic_tape_creation_policy_input) =
    let input = Json_serializers.update_automatic_tape_creation_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateAutomaticTapeCreationPolicy" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_automatic_tape_creation_policy_output_of_yojson
      ~error_deserializer
end

module UpdateBandwidthRateLimit = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_bandwidth_rate_limit_input) =
    let input = Json_serializers.update_bandwidth_rate_limit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.UpdateBandwidthRateLimit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_bandwidth_rate_limit_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_bandwidth_rate_limit_input) =
    let input = Json_serializers.update_bandwidth_rate_limit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateBandwidthRateLimit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_bandwidth_rate_limit_output_of_yojson
      ~error_deserializer
end

module UpdateBandwidthRateLimitSchedule = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_bandwidth_rate_limit_schedule_input) =
    let input = Json_serializers.update_bandwidth_rate_limit_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.UpdateBandwidthRateLimitSchedule" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_bandwidth_rate_limit_schedule_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_bandwidth_rate_limit_schedule_input) =
    let input = Json_serializers.update_bandwidth_rate_limit_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateBandwidthRateLimitSchedule" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_bandwidth_rate_limit_schedule_output_of_yojson
      ~error_deserializer
end

module UpdateChapCredentials = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_chap_credentials_input) =
    let input = Json_serializers.update_chap_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.UpdateChapCredentials"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_chap_credentials_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_chap_credentials_input) =
    let input = Json_serializers.update_chap_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateChapCredentials" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_chap_credentials_output_of_yojson
      ~error_deserializer
end

module UpdateFileSystemAssociation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_file_system_association_input) =
    let input = Json_serializers.update_file_system_association_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.UpdateFileSystemAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_file_system_association_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_file_system_association_input) =
    let input = Json_serializers.update_file_system_association_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateFileSystemAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_file_system_association_output_of_yojson
      ~error_deserializer
end

module UpdateGatewayInformation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_gateway_information_input) =
    let input = Json_serializers.update_gateway_information_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.UpdateGatewayInformation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_gateway_information_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_gateway_information_input) =
    let input = Json_serializers.update_gateway_information_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateGatewayInformation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_gateway_information_output_of_yojson
      ~error_deserializer
end

module UpdateGatewaySoftwareNow = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_gateway_software_now_input) =
    let input = Json_serializers.update_gateway_software_now_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.UpdateGatewaySoftwareNow" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_gateway_software_now_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_gateway_software_now_input) =
    let input = Json_serializers.update_gateway_software_now_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateGatewaySoftwareNow" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_gateway_software_now_output_of_yojson
      ~error_deserializer
end

module UpdateMaintenanceStartTime = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_maintenance_start_time_input) =
    let input = Json_serializers.update_maintenance_start_time_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.UpdateMaintenanceStartTime" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_maintenance_start_time_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_maintenance_start_time_input) =
    let input = Json_serializers.update_maintenance_start_time_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateMaintenanceStartTime" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_maintenance_start_time_output_of_yojson
      ~error_deserializer
end

module UpdateNFSFileShare = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_nfs_file_share_input) =
    let input = Json_serializers.update_nfs_file_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.UpdateNFSFileShare"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_nfs_file_share_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_nfs_file_share_input) =
    let input = Json_serializers.update_nfs_file_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateNFSFileShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_nfs_file_share_output_of_yojson
      ~error_deserializer
end

module UpdateSMBFileShare = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_smb_file_share_input) =
    let input = Json_serializers.update_smb_file_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.UpdateSMBFileShare"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_smb_file_share_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_smb_file_share_input) =
    let input = Json_serializers.update_smb_file_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateSMBFileShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_smb_file_share_output_of_yojson
      ~error_deserializer
end

module UpdateSMBFileShareVisibility = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_smb_file_share_visibility_input) =
    let input = Json_serializers.update_smb_file_share_visibility_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.UpdateSMBFileShareVisibility" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_smb_file_share_visibility_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_smb_file_share_visibility_input) =
    let input = Json_serializers.update_smb_file_share_visibility_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateSMBFileShareVisibility" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_smb_file_share_visibility_output_of_yojson
      ~error_deserializer
end

module UpdateSMBLocalGroups = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_smb_local_groups_input) =
    let input = Json_serializers.update_smb_local_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.UpdateSMBLocalGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_smb_local_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_smb_local_groups_input) =
    let input = Json_serializers.update_smb_local_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateSMBLocalGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_smb_local_groups_output_of_yojson
      ~error_deserializer
end

module UpdateSMBSecurityStrategy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_smb_security_strategy_input) =
    let input = Json_serializers.update_smb_security_strategy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.UpdateSMBSecurityStrategy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_smb_security_strategy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_smb_security_strategy_input) =
    let input = Json_serializers.update_smb_security_strategy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateSMBSecurityStrategy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_smb_security_strategy_output_of_yojson
      ~error_deserializer
end

module UpdateSnapshotSchedule = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_snapshot_schedule_input) =
    let input = Json_serializers.update_snapshot_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.UpdateSnapshotSchedule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_snapshot_schedule_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_snapshot_schedule_input) =
    let input = Json_serializers.update_snapshot_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateSnapshotSchedule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_snapshot_schedule_output_of_yojson
      ~error_deserializer
end

module UpdateVTLDeviceType = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_vtl_device_type_input) =
    let input = Json_serializers.update_vtl_device_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.UpdateVTLDeviceType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_vtl_device_type_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_vtl_device_type_input) =
    let input = Json_serializers.update_vtl_device_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.UpdateVTLDeviceType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_vtl_device_type_output_of_yojson
      ~error_deserializer
end

module StartGateway = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_gateway_input) =
    let input = Json_serializers.start_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.StartGateway" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_gateway_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_gateway_input) =
    let input = Json_serializers.start_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.StartGateway" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_gateway_output_of_yojson ~error_deserializer
end

module StartCacheReport = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_cache_report_input) =
    let input = Json_serializers.start_cache_report_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.StartCacheReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_cache_report_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_cache_report_input) =
    let input = Json_serializers.start_cache_report_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.StartCacheReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_cache_report_output_of_yojson
      ~error_deserializer
end

module StartAvailabilityMonitorTest = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_availability_monitor_test_input) =
    let input = Json_serializers.start_availability_monitor_test_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.StartAvailabilityMonitorTest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_availability_monitor_test_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_availability_monitor_test_input) =
    let input = Json_serializers.start_availability_monitor_test_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.StartAvailabilityMonitorTest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_availability_monitor_test_output_of_yojson
      ~error_deserializer
end

module ShutdownGateway = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : shutdown_gateway_input) =
    let input = Json_serializers.shutdown_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ShutdownGateway"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.shutdown_gateway_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : shutdown_gateway_input) =
    let input = Json_serializers.shutdown_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ShutdownGateway" ~service ~context ~input
      ~output_deserializer:Json_deserializers.shutdown_gateway_output_of_yojson ~error_deserializer
end

module SetSMBGuestPassword = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_smb_guest_password_input) =
    let input = Json_serializers.set_smb_guest_password_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.SetSMBGuestPassword"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_smb_guest_password_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_smb_guest_password_input) =
    let input = Json_serializers.set_smb_guest_password_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.SetSMBGuestPassword" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_smb_guest_password_output_of_yojson
      ~error_deserializer
end

module SetLocalConsolePassword = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_local_console_password_input) =
    let input = Json_serializers.set_local_console_password_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.SetLocalConsolePassword" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_local_console_password_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_local_console_password_input) =
    let input = Json_serializers.set_local_console_password_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.SetLocalConsolePassword" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_local_console_password_output_of_yojson
      ~error_deserializer
end

module RetrieveTapeRecoveryPoint = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : retrieve_tape_recovery_point_input) =
    let input = Json_serializers.retrieve_tape_recovery_point_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.RetrieveTapeRecoveryPoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.retrieve_tape_recovery_point_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : retrieve_tape_recovery_point_input) =
    let input = Json_serializers.retrieve_tape_recovery_point_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.RetrieveTapeRecoveryPoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.retrieve_tape_recovery_point_output_of_yojson
      ~error_deserializer
end

module RetrieveTapeArchive = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : retrieve_tape_archive_input) =
    let input = Json_serializers.retrieve_tape_archive_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.RetrieveTapeArchive"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.retrieve_tape_archive_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : retrieve_tape_archive_input) =
    let input = Json_serializers.retrieve_tape_archive_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.RetrieveTapeArchive" ~service ~context ~input
      ~output_deserializer:Json_deserializers.retrieve_tape_archive_output_of_yojson
      ~error_deserializer
end

module ResetCache = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reset_cache_input) =
    let input = Json_serializers.reset_cache_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ResetCache" ~service
      ~context ~input ~output_deserializer:Json_deserializers.reset_cache_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reset_cache_input) =
    let input = Json_serializers.reset_cache_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ResetCache" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reset_cache_output_of_yojson ~error_deserializer
end

module RemoveTagsFromResource = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_tags_from_resource_input) =
    let input = Json_serializers.remove_tags_from_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.RemoveTagsFromResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_tags_from_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_tags_from_resource_input) =
    let input = Json_serializers.remove_tags_from_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.RemoveTagsFromResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_tags_from_resource_output_of_yojson
      ~error_deserializer
end

module RefreshCache = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : refresh_cache_input) =
    let input = Json_serializers.refresh_cache_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.RefreshCache" ~service
      ~context ~input ~output_deserializer:Json_deserializers.refresh_cache_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : refresh_cache_input) =
    let input = Json_serializers.refresh_cache_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.RefreshCache" ~service ~context ~input
      ~output_deserializer:Json_deserializers.refresh_cache_output_of_yojson ~error_deserializer
end

module NotifyWhenUploaded = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : notify_when_uploaded_input) =
    let input = Json_serializers.notify_when_uploaded_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.NotifyWhenUploaded"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.notify_when_uploaded_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : notify_when_uploaded_input) =
    let input = Json_serializers.notify_when_uploaded_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.NotifyWhenUploaded" ~service ~context ~input
      ~output_deserializer:Json_deserializers.notify_when_uploaded_output_of_yojson
      ~error_deserializer
end

module ListVolumes = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_volumes_input) =
    let input = Json_serializers.list_volumes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ListVolumes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_volumes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_volumes_input) =
    let input = Json_serializers.list_volumes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListVolumes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_volumes_output_of_yojson ~error_deserializer
end

module ListVolumeRecoveryPoints = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_volume_recovery_points_input) =
    let input = Json_serializers.list_volume_recovery_points_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.ListVolumeRecoveryPoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_volume_recovery_points_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_volume_recovery_points_input) =
    let input = Json_serializers.list_volume_recovery_points_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListVolumeRecoveryPoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_volume_recovery_points_output_of_yojson
      ~error_deserializer
end

module ListVolumeInitiators = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_volume_initiators_input) =
    let input = Json_serializers.list_volume_initiators_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ListVolumeInitiators"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_volume_initiators_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_volume_initiators_input) =
    let input = Json_serializers.list_volume_initiators_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListVolumeInitiators" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_volume_initiators_output_of_yojson
      ~error_deserializer
end

module ListTapes = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tapes_input) =
    let input = Json_serializers.list_tapes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ListTapes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tapes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tapes_input) =
    let input = Json_serializers.list_tapes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListTapes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tapes_output_of_yojson ~error_deserializer
end

module ListTapePools = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tape_pools_input) =
    let input = Json_serializers.list_tape_pools_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ListTapePools" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tape_pools_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tape_pools_input) =
    let input = Json_serializers.list_tape_pools_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListTapePools" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tape_pools_output_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module ListLocalDisks = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_local_disks_input) =
    let input = Json_serializers.list_local_disks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ListLocalDisks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_local_disks_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_local_disks_input) =
    let input = Json_serializers.list_local_disks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListLocalDisks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_local_disks_output_of_yojson ~error_deserializer
end

module ListGateways = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_gateways_input) =
    let input = Json_serializers.list_gateways_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ListGateways" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_gateways_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_gateways_input) =
    let input = Json_serializers.list_gateways_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListGateways" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_gateways_output_of_yojson ~error_deserializer
end

module ListFileSystemAssociations = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_file_system_associations_input) =
    let input = Json_serializers.list_file_system_associations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.ListFileSystemAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_file_system_associations_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_file_system_associations_input) =
    let input = Json_serializers.list_file_system_associations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListFileSystemAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_file_system_associations_output_of_yojson
      ~error_deserializer
end

module ListFileShares = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_file_shares_input) =
    let input = Json_serializers.list_file_shares_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ListFileShares"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_file_shares_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_file_shares_input) =
    let input = Json_serializers.list_file_shares_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListFileShares" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_file_shares_output_of_yojson ~error_deserializer
end

module ListCacheReports = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_cache_reports_input) =
    let input = Json_serializers.list_cache_reports_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ListCacheReports"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cache_reports_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cache_reports_input) =
    let input = Json_serializers.list_cache_reports_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListCacheReports" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cache_reports_output_of_yojson
      ~error_deserializer
end

module ListAutomaticTapeCreationPolicies = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_automatic_tape_creation_policies_input) =
    let input = Json_serializers.list_automatic_tape_creation_policies_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.ListAutomaticTapeCreationPolicies" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_automatic_tape_creation_policies_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_automatic_tape_creation_policies_input) =
    let input = Json_serializers.list_automatic_tape_creation_policies_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ListAutomaticTapeCreationPolicies" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_automatic_tape_creation_policies_output_of_yojson
      ~error_deserializer
end

module JoinDomain = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : join_domain_input) =
    let input = Json_serializers.join_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.JoinDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.join_domain_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : join_domain_input) =
    let input = Json_serializers.join_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.JoinDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.join_domain_output_of_yojson ~error_deserializer
end

module EvictFilesFailingUpload = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : evict_files_failing_upload_input) =
    let input = Json_serializers.evict_files_failing_upload_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.EvictFilesFailingUpload" ~service ~context ~input
      ~output_deserializer:Json_deserializers.evict_files_failing_upload_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : evict_files_failing_upload_input) =
    let input = Json_serializers.evict_files_failing_upload_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.EvictFilesFailingUpload" ~service ~context ~input
      ~output_deserializer:Json_deserializers.evict_files_failing_upload_output_of_yojson
      ~error_deserializer
end

module DisassociateFileSystem = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_file_system_input) =
    let input = Json_serializers.disassociate_file_system_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DisassociateFileSystem"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_file_system_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_file_system_input) =
    let input = Json_serializers.disassociate_file_system_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DisassociateFileSystem" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_file_system_output_of_yojson
      ~error_deserializer
end

module DisableGateway = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_gateway_input) =
    let input = Json_serializers.disable_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DisableGateway"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disable_gateway_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : disable_gateway_input) =
    let input = Json_serializers.disable_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DisableGateway" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disable_gateway_output_of_yojson ~error_deserializer
end

module DetachVolume = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detach_volume_input) =
    let input = Json_serializers.detach_volume_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DetachVolume" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detach_volume_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detach_volume_input) =
    let input = Json_serializers.detach_volume_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DetachVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detach_volume_output_of_yojson ~error_deserializer
end

module DescribeWorkingStorage = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_working_storage_input) =
    let input = Json_serializers.describe_working_storage_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DescribeWorkingStorage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_working_storage_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_working_storage_input) =
    let input = Json_serializers.describe_working_storage_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeWorkingStorage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_working_storage_output_of_yojson
      ~error_deserializer
end

module DescribeVTLDevices = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_vtl_devices_input) =
    let input = Json_serializers.describe_vtl_devices_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DescribeVTLDevices"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_vtl_devices_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_vtl_devices_input) =
    let input = Json_serializers.describe_vtl_devices_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeVTLDevices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_vtl_devices_output_of_yojson
      ~error_deserializer
end

module DescribeUploadBuffer = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_upload_buffer_input) =
    let input = Json_serializers.describe_upload_buffer_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DescribeUploadBuffer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_upload_buffer_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_upload_buffer_input) =
    let input = Json_serializers.describe_upload_buffer_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeUploadBuffer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_upload_buffer_output_of_yojson
      ~error_deserializer
end

module DescribeTapes = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_tapes_input) =
    let input = Json_serializers.describe_tapes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DescribeTapes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_tapes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_tapes_input) =
    let input = Json_serializers.describe_tapes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeTapes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tapes_output_of_yojson ~error_deserializer
end

module DescribeTapeRecoveryPoints = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_tape_recovery_points_input) =
    let input = Json_serializers.describe_tape_recovery_points_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DescribeTapeRecoveryPoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tape_recovery_points_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_tape_recovery_points_input) =
    let input = Json_serializers.describe_tape_recovery_points_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeTapeRecoveryPoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tape_recovery_points_output_of_yojson
      ~error_deserializer
end

module DescribeTapeArchives = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_tape_archives_input) =
    let input = Json_serializers.describe_tape_archives_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DescribeTapeArchives"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tape_archives_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_tape_archives_input) =
    let input = Json_serializers.describe_tape_archives_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeTapeArchives" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tape_archives_output_of_yojson
      ~error_deserializer
end

module DescribeStorediSCSIVolumes = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_storedi_scsi_volumes_input) =
    let input = Json_serializers.describe_storedi_scsi_volumes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DescribeStorediSCSIVolumes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_storedi_scsi_volumes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_storedi_scsi_volumes_input) =
    let input = Json_serializers.describe_storedi_scsi_volumes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeStorediSCSIVolumes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_storedi_scsi_volumes_output_of_yojson
      ~error_deserializer
end

module DescribeSnapshotSchedule = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_snapshot_schedule_input) =
    let input = Json_serializers.describe_snapshot_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DescribeSnapshotSchedule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_snapshot_schedule_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_snapshot_schedule_input) =
    let input = Json_serializers.describe_snapshot_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeSnapshotSchedule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_snapshot_schedule_output_of_yojson
      ~error_deserializer
end

module DescribeSMBSettings = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_smb_settings_input) =
    let input = Json_serializers.describe_smb_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DescribeSMBSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_smb_settings_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_smb_settings_input) =
    let input = Json_serializers.describe_smb_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeSMBSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_smb_settings_output_of_yojson
      ~error_deserializer
end

module DescribeSMBFileShares = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_smb_file_shares_input) =
    let input = Json_serializers.describe_smb_file_shares_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DescribeSMBFileShares"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_smb_file_shares_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_smb_file_shares_input) =
    let input = Json_serializers.describe_smb_file_shares_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeSMBFileShares" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_smb_file_shares_output_of_yojson
      ~error_deserializer
end

module DescribeNFSFileShares = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_nfs_file_shares_input) =
    let input = Json_serializers.describe_nfs_file_shares_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DescribeNFSFileShares"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_nfs_file_shares_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_nfs_file_shares_input) =
    let input = Json_serializers.describe_nfs_file_shares_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeNFSFileShares" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_nfs_file_shares_output_of_yojson
      ~error_deserializer
end

module DescribeMaintenanceStartTime = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_maintenance_start_time_input) =
    let input = Json_serializers.describe_maintenance_start_time_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DescribeMaintenanceStartTime" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_maintenance_start_time_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_maintenance_start_time_input) =
    let input = Json_serializers.describe_maintenance_start_time_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeMaintenanceStartTime" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_maintenance_start_time_output_of_yojson
      ~error_deserializer
end

module DescribeGatewayInformation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_gateway_information_input) =
    let input = Json_serializers.describe_gateway_information_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DescribeGatewayInformation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_gateway_information_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_gateway_information_input) =
    let input = Json_serializers.describe_gateway_information_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeGatewayInformation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_gateway_information_output_of_yojson
      ~error_deserializer
end

module DescribeFileSystemAssociations = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_file_system_associations_input) =
    let input = Json_serializers.describe_file_system_associations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DescribeFileSystemAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_file_system_associations_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_file_system_associations_input) =
    let input = Json_serializers.describe_file_system_associations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeFileSystemAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_file_system_associations_output_of_yojson
      ~error_deserializer
end

module DescribeChapCredentials = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_chap_credentials_input) =
    let input = Json_serializers.describe_chap_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DescribeChapCredentials" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_chap_credentials_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_chap_credentials_input) =
    let input = Json_serializers.describe_chap_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeChapCredentials" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_chap_credentials_output_of_yojson
      ~error_deserializer
end

module DescribeCachediSCSIVolumes = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_cachedi_scsi_volumes_input) =
    let input = Json_serializers.describe_cachedi_scsi_volumes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DescribeCachediSCSIVolumes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cachedi_scsi_volumes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_cachedi_scsi_volumes_input) =
    let input = Json_serializers.describe_cachedi_scsi_volumes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeCachediSCSIVolumes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cachedi_scsi_volumes_output_of_yojson
      ~error_deserializer
end

module DescribeCacheReport = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_cache_report_input) =
    let input = Json_serializers.describe_cache_report_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DescribeCacheReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cache_report_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_cache_report_input) =
    let input = Json_serializers.describe_cache_report_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeCacheReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cache_report_output_of_yojson
      ~error_deserializer
end

module DescribeCache = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_cache_input) =
    let input = Json_serializers.describe_cache_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DescribeCache" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_cache_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_cache_input) =
    let input = Json_serializers.describe_cache_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeCache" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cache_output_of_yojson ~error_deserializer
end

module DescribeBandwidthRateLimitSchedule = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_bandwidth_rate_limit_schedule_input) =
    let input = Json_serializers.describe_bandwidth_rate_limit_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DescribeBandwidthRateLimitSchedule" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_bandwidth_rate_limit_schedule_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_bandwidth_rate_limit_schedule_input) =
    let input = Json_serializers.describe_bandwidth_rate_limit_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeBandwidthRateLimitSchedule" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_bandwidth_rate_limit_schedule_output_of_yojson
      ~error_deserializer
end

module DescribeBandwidthRateLimit = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_bandwidth_rate_limit_input) =
    let input = Json_serializers.describe_bandwidth_rate_limit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DescribeBandwidthRateLimit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_bandwidth_rate_limit_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_bandwidth_rate_limit_input) =
    let input = Json_serializers.describe_bandwidth_rate_limit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeBandwidthRateLimit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_bandwidth_rate_limit_output_of_yojson
      ~error_deserializer
end

module DescribeAvailabilityMonitorTest = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_availability_monitor_test_input) =
    let input = Json_serializers.describe_availability_monitor_test_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DescribeAvailabilityMonitorTest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_availability_monitor_test_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_availability_monitor_test_input) =
    let input = Json_serializers.describe_availability_monitor_test_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DescribeAvailabilityMonitorTest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_availability_monitor_test_output_of_yojson
      ~error_deserializer
end

module DeleteVolume = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_volume_input) =
    let input = Json_serializers.delete_volume_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DeleteVolume" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_volume_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_volume_input) =
    let input = Json_serializers.delete_volume_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DeleteVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_volume_output_of_yojson ~error_deserializer
end

module DeleteTapePool = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_tape_pool_input) =
    let input = Json_serializers.delete_tape_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DeleteTapePool"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tape_pool_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_tape_pool_input) =
    let input = Json_serializers.delete_tape_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DeleteTapePool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tape_pool_output_of_yojson ~error_deserializer
end

module DeleteTapeArchive = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_tape_archive_input) =
    let input = Json_serializers.delete_tape_archive_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DeleteTapeArchive"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tape_archive_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_tape_archive_input) =
    let input = Json_serializers.delete_tape_archive_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DeleteTapeArchive" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tape_archive_output_of_yojson
      ~error_deserializer
end

module DeleteTape = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_tape_input) =
    let input = Json_serializers.delete_tape_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DeleteTape" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_tape_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_tape_input) =
    let input = Json_serializers.delete_tape_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DeleteTape" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tape_output_of_yojson ~error_deserializer
end

module DeleteSnapshotSchedule = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_snapshot_schedule_input) =
    let input = Json_serializers.delete_snapshot_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DeleteSnapshotSchedule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_snapshot_schedule_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_snapshot_schedule_input) =
    let input = Json_serializers.delete_snapshot_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DeleteSnapshotSchedule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_snapshot_schedule_output_of_yojson
      ~error_deserializer
end

module DeleteGateway = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_gateway_input) =
    let input = Json_serializers.delete_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DeleteGateway" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_gateway_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_gateway_input) =
    let input = Json_serializers.delete_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DeleteGateway" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_gateway_output_of_yojson ~error_deserializer
end

module DeleteFileShare = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_file_share_input) =
    let input = Json_serializers.delete_file_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DeleteFileShare"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_file_share_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_file_share_input) =
    let input = Json_serializers.delete_file_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DeleteFileShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_file_share_output_of_yojson ~error_deserializer
end

module DeleteChapCredentials = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_chap_credentials_input) =
    let input = Json_serializers.delete_chap_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DeleteChapCredentials"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_chap_credentials_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_chap_credentials_input) =
    let input = Json_serializers.delete_chap_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DeleteChapCredentials" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_chap_credentials_output_of_yojson
      ~error_deserializer
end

module DeleteCacheReport = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cache_report_input) =
    let input = Json_serializers.delete_cache_report_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.DeleteCacheReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cache_report_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_cache_report_input) =
    let input = Json_serializers.delete_cache_report_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DeleteCacheReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cache_report_output_of_yojson
      ~error_deserializer
end

module DeleteBandwidthRateLimit = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_bandwidth_rate_limit_input) =
    let input = Json_serializers.delete_bandwidth_rate_limit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DeleteBandwidthRateLimit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_bandwidth_rate_limit_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_bandwidth_rate_limit_input) =
    let input = Json_serializers.delete_bandwidth_rate_limit_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DeleteBandwidthRateLimit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_bandwidth_rate_limit_output_of_yojson
      ~error_deserializer
end

module DeleteAutomaticTapeCreationPolicy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_automatic_tape_creation_policy_input) =
    let input = Json_serializers.delete_automatic_tape_creation_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.DeleteAutomaticTapeCreationPolicy" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_automatic_tape_creation_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_automatic_tape_creation_policy_input) =
    let input = Json_serializers.delete_automatic_tape_creation_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.DeleteAutomaticTapeCreationPolicy" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_automatic_tape_creation_policy_output_of_yojson
      ~error_deserializer
end

module CreateTapes = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_tapes_input) =
    let input = Json_serializers.create_tapes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.CreateTapes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_tapes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_tapes_input) =
    let input = Json_serializers.create_tapes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CreateTapes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_tapes_output_of_yojson ~error_deserializer
end

module CreateTapeWithBarcode = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_tape_with_barcode_input) =
    let input = Json_serializers.create_tape_with_barcode_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.CreateTapeWithBarcode"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_tape_with_barcode_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_tape_with_barcode_input) =
    let input = Json_serializers.create_tape_with_barcode_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CreateTapeWithBarcode" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_tape_with_barcode_output_of_yojson
      ~error_deserializer
end

module CreateTapePool = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_tape_pool_input) =
    let input = Json_serializers.create_tape_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.CreateTapePool"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_tape_pool_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_tape_pool_input) =
    let input = Json_serializers.create_tape_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CreateTapePool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_tape_pool_output_of_yojson ~error_deserializer
end

module CreateStorediSCSIVolume = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_storedi_scsi_volume_input) =
    let input = Json_serializers.create_storedi_scsi_volume_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.CreateStorediSCSIVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_storedi_scsi_volume_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_storedi_scsi_volume_input) =
    let input = Json_serializers.create_storedi_scsi_volume_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CreateStorediSCSIVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_storedi_scsi_volume_output_of_yojson
      ~error_deserializer
end

module CreateSnapshotFromVolumeRecoveryPoint = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | `ServiceUnavailableError _ -> "com.amazonaws.storagegateway#ServiceUnavailableError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableError" ->
          `ServiceUnavailableError
            (Json_deserializers.service_unavailable_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_snapshot_from_volume_recovery_point_input) =
    let input =
      Json_serializers.create_snapshot_from_volume_recovery_point_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.CreateSnapshotFromVolumeRecoveryPoint" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.create_snapshot_from_volume_recovery_point_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_snapshot_from_volume_recovery_point_input) =
    let input =
      Json_serializers.create_snapshot_from_volume_recovery_point_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CreateSnapshotFromVolumeRecoveryPoint" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.create_snapshot_from_volume_recovery_point_output_of_yojson
      ~error_deserializer
end

module CreateSnapshot = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | `ServiceUnavailableError _ -> "com.amazonaws.storagegateway#ServiceUnavailableError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableError" ->
          `ServiceUnavailableError
            (Json_deserializers.service_unavailable_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_snapshot_input) =
    let input = Json_serializers.create_snapshot_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.CreateSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_snapshot_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_snapshot_input) =
    let input = Json_serializers.create_snapshot_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CreateSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_snapshot_output_of_yojson ~error_deserializer
end

module CreateSMBFileShare = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_smb_file_share_input) =
    let input = Json_serializers.create_smb_file_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.CreateSMBFileShare"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_smb_file_share_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_smb_file_share_input) =
    let input = Json_serializers.create_smb_file_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CreateSMBFileShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_smb_file_share_output_of_yojson
      ~error_deserializer
end

module CreateNFSFileShare = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_nfs_file_share_input) =
    let input = Json_serializers.create_nfs_file_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.CreateNFSFileShare"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_nfs_file_share_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_nfs_file_share_input) =
    let input = Json_serializers.create_nfs_file_share_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CreateNFSFileShare" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_nfs_file_share_output_of_yojson
      ~error_deserializer
end

module CreateCachediSCSIVolume = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_cachedi_scsi_volume_input) =
    let input = Json_serializers.create_cachedi_scsi_volume_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StorageGateway_20130630.CreateCachediSCSIVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cachedi_scsi_volume_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_cachedi_scsi_volume_input) =
    let input = Json_serializers.create_cachedi_scsi_volume_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CreateCachediSCSIVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cachedi_scsi_volume_output_of_yojson
      ~error_deserializer
end

module CancelRetrieval = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_retrieval_input) =
    let input = Json_serializers.cancel_retrieval_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.CancelRetrieval"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_retrieval_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : cancel_retrieval_input) =
    let input = Json_serializers.cancel_retrieval_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CancelRetrieval" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_retrieval_output_of_yojson ~error_deserializer
end

module CancelCacheReport = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_cache_report_input) =
    let input = Json_serializers.cancel_cache_report_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.CancelCacheReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_cache_report_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_cache_report_input) =
    let input = Json_serializers.cancel_cache_report_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CancelCacheReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_cache_report_output_of_yojson
      ~error_deserializer
end

module CancelArchival = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_archival_input) =
    let input = Json_serializers.cancel_archival_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.CancelArchival"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_archival_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : cancel_archival_input) =
    let input = Json_serializers.cancel_archival_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.CancelArchival" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_archival_output_of_yojson ~error_deserializer
end

module AttachVolume = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : attach_volume_input) =
    let input = Json_serializers.attach_volume_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.AttachVolume" ~service
      ~context ~input ~output_deserializer:Json_deserializers.attach_volume_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : attach_volume_input) =
    let input = Json_serializers.attach_volume_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.AttachVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.attach_volume_output_of_yojson ~error_deserializer
end

module AssociateFileSystem = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_file_system_input) =
    let input = Json_serializers.associate_file_system_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.AssociateFileSystem"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_file_system_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_file_system_input) =
    let input = Json_serializers.associate_file_system_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.AssociateFileSystem" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_file_system_output_of_yojson
      ~error_deserializer
end

module AssignTapePool = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : assign_tape_pool_input) =
    let input = Json_serializers.assign_tape_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.AssignTapePool"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.assign_tape_pool_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : assign_tape_pool_input) =
    let input = Json_serializers.assign_tape_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.AssignTapePool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.assign_tape_pool_output_of_yojson ~error_deserializer
end

module AddWorkingStorage = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_working_storage_input) =
    let input = Json_serializers.add_working_storage_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.AddWorkingStorage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_working_storage_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_working_storage_input) =
    let input = Json_serializers.add_working_storage_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.AddWorkingStorage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_working_storage_output_of_yojson
      ~error_deserializer
end

module AddUploadBuffer = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_upload_buffer_input) =
    let input = Json_serializers.add_upload_buffer_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.AddUploadBuffer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_upload_buffer_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : add_upload_buffer_input) =
    let input = Json_serializers.add_upload_buffer_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.AddUploadBuffer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_upload_buffer_output_of_yojson ~error_deserializer
end

module AddTagsToResource = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_to_resource_input) =
    let input = Json_serializers.add_tags_to_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.AddTagsToResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_tags_to_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_tags_to_resource_input) =
    let input = Json_serializers.add_tags_to_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.AddTagsToResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_tags_to_resource_output_of_yojson
      ~error_deserializer
end

module AddCache = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_cache_input) =
    let input = Json_serializers.add_cache_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.AddCache" ~service
      ~context ~input ~output_deserializer:Json_deserializers.add_cache_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_cache_input) =
    let input = Json_serializers.add_cache_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"StorageGateway_20130630.AddCache"
      ~service ~context ~input ~output_deserializer:Json_deserializers.add_cache_output_of_yojson
      ~error_deserializer
end

module ActivateGateway = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.storagegateway#InternalServerError"
    | `InvalidGatewayRequestException _ ->
        "com.amazonaws.storagegateway#InvalidGatewayRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidGatewayRequestException" ->
          `InvalidGatewayRequestException
            (Json_deserializers.invalid_gateway_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : activate_gateway_input) =
    let input = Json_serializers.activate_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StorageGateway_20130630.ActivateGateway"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.activate_gateway_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : activate_gateway_input) =
    let input = Json_serializers.activate_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"StorageGateway_20130630.ActivateGateway" ~service ~context ~input
      ~output_deserializer:Json_deserializers.activate_gateway_output_of_yojson ~error_deserializer
end
