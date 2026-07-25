open Types
open Service_metadata

module UpdateWorkgroup = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InsufficientCapacityException _ ->
        "com.amazonaws.redshiftserverless#InsufficientCapacityException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `Ipv6CidrBlockNotFoundException _ ->
        "com.amazonaws.redshiftserverless#Ipv6CidrBlockNotFoundException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InsufficientCapacityException" ->
          `InsufficientCapacityException
            (Json_deserializers.insufficient_capacity_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "Ipv6CidrBlockNotFoundException" ->
          `Ipv6CidrBlockNotFoundException
            (Json_deserializers.ipv6_cidr_block_not_found_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_workgroup_request) =
    let input = Json_serializers.update_workgroup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.UpdateWorkgroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_workgroup_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_workgroup_request) =
    let input = Json_serializers.update_workgroup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.UpdateWorkgroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workgroup_response_of_yojson
      ~error_deserializer
end

module UpdateUsageLimit = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_usage_limit_request) =
    let input = Json_serializers.update_usage_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.UpdateUsageLimit" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_usage_limit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_usage_limit_request) =
    let input = Json_serializers.update_usage_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.UpdateUsageLimit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_usage_limit_response_of_yojson
      ~error_deserializer
end

module UpdateSnapshotCopyConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_snapshot_copy_configuration_request) =
    let input = Json_serializers.update_snapshot_copy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RedshiftServerless.UpdateSnapshotCopyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_snapshot_copy_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_snapshot_copy_configuration_request) =
    let input = Json_serializers.update_snapshot_copy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.UpdateSnapshotCopyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_snapshot_copy_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateSnapshot = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_snapshot_request) =
    let input = Json_serializers.update_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.UpdateSnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_snapshot_request) =
    let input = Json_serializers.update_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.UpdateSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_snapshot_response_of_yojson ~error_deserializer
end

module UpdateScheduledAction = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_scheduled_action_request) =
    let input = Json_serializers.update_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.UpdateScheduledAction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_scheduled_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_scheduled_action_request) =
    let input = Json_serializers.update_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.UpdateScheduledAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_scheduled_action_response_of_yojson
      ~error_deserializer
end

module UpdateNamespace = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_namespace_request) =
    let input = Json_serializers.update_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.UpdateNamespace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_namespace_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_namespace_request) =
    let input = Json_serializers.update_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.UpdateNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_namespace_response_of_yojson
      ~error_deserializer
end

module UpdateLakehouseConfiguration = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `DryRunException _ -> "com.amazonaws.redshiftserverless#DryRunException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DryRunException" ->
          `DryRunException (Json_deserializers.dry_run_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_lakehouse_configuration_request) =
    let input = Json_serializers.update_lakehouse_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RedshiftServerless.UpdateLakehouseConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_lakehouse_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_lakehouse_configuration_request) =
    let input = Json_serializers.update_lakehouse_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.UpdateLakehouseConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_lakehouse_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateEndpointAccess = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_endpoint_access_request) =
    let input = Json_serializers.update_endpoint_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.UpdateEndpointAccess"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_endpoint_access_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_endpoint_access_request) =
    let input = Json_serializers.update_endpoint_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.UpdateEndpointAccess" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_endpoint_access_response_of_yojson
      ~error_deserializer
end

module RestoreTableFromSnapshot = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_table_from_snapshot_request) =
    let input = Json_serializers.restore_table_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.RestoreTableFromSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_table_from_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : restore_table_from_snapshot_request) =
    let input = Json_serializers.restore_table_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.RestoreTableFromSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_table_from_snapshot_response_of_yojson
      ~error_deserializer
end

module RestoreTableFromRecoveryPoint = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_table_from_recovery_point_request) =
    let input = Json_serializers.restore_table_from_recovery_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RedshiftServerless.RestoreTableFromRecoveryPoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_table_from_recovery_point_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : restore_table_from_recovery_point_request) =
    let input = Json_serializers.restore_table_from_recovery_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.RestoreTableFromRecoveryPoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_table_from_recovery_point_response_of_yojson
      ~error_deserializer
end

module RestoreFromSnapshot = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.redshiftserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_from_snapshot_request) =
    let input = Json_serializers.restore_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.RestoreFromSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_from_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : restore_from_snapshot_request) =
    let input = Json_serializers.restore_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.RestoreFromSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_from_snapshot_response_of_yojson
      ~error_deserializer
end

module RestoreFromRecoveryPoint = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_from_recovery_point_request) =
    let input = Json_serializers.restore_from_recovery_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.RestoreFromRecoveryPoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_from_recovery_point_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : restore_from_recovery_point_request) =
    let input = Json_serializers.restore_from_recovery_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.RestoreFromRecoveryPoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_from_recovery_point_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `TooManyTagsException _ -> "com.amazonaws.redshiftserverless#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftServerless.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftServerless.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateCustomDomainAssociation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_custom_domain_association_request) =
    let input = Json_serializers.update_custom_domain_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RedshiftServerless.UpdateCustomDomainAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_custom_domain_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_custom_domain_association_request) =
    let input = Json_serializers.update_custom_domain_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.UpdateCustomDomainAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_custom_domain_association_response_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.redshiftserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.PutResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.PutResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module ListWorkgroups = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workgroups_request) =
    let input = Json_serializers.list_workgroups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListWorkgroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_workgroups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workgroups_request) =
    let input = Json_serializers.list_workgroups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListWorkgroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workgroups_response_of_yojson ~error_deserializer
end

module ListUsageLimits = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `InvalidPaginationException _ -> "com.amazonaws.redshiftserverless#InvalidPaginationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidPaginationException" ->
          `InvalidPaginationException
            (Json_deserializers.invalid_pagination_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_usage_limits_request) =
    let input = Json_serializers.list_usage_limits_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListUsageLimits" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_usage_limits_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_usage_limits_request) =
    let input = Json_serializers.list_usage_limits_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListUsageLimits" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_usage_limits_response_of_yojson
      ~error_deserializer
end

module ListTracks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `InvalidPaginationException _ -> "com.amazonaws.redshiftserverless#InvalidPaginationException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidPaginationException" ->
          `InvalidPaginationException
            (Json_deserializers.invalid_pagination_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tracks_request) =
    let input = Json_serializers.list_tracks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListTracks" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tracks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tracks_request) =
    let input = Json_serializers.list_tracks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftServerless.ListTracks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tracks_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTableRestoreStatus = struct
  let error_to_string = function
    | `InvalidPaginationException _ -> "com.amazonaws.redshiftserverless#InvalidPaginationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidPaginationException" ->
          `InvalidPaginationException
            (Json_deserializers.invalid_pagination_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_table_restore_status_request) =
    let input = Json_serializers.list_table_restore_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListTableRestoreStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_table_restore_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_table_restore_status_request) =
    let input = Json_serializers.list_table_restore_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListTableRestoreStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_table_restore_status_response_of_yojson
      ~error_deserializer
end

module ListSnapshots = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_snapshots_request) =
    let input = Json_serializers.list_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListSnapshots" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_snapshots_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_snapshots_request) =
    let input = Json_serializers.list_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftServerless.ListSnapshots"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_snapshots_response_of_yojson ~error_deserializer
end

module ListSnapshotCopyConfigurations = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `InvalidPaginationException _ -> "com.amazonaws.redshiftserverless#InvalidPaginationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidPaginationException" ->
          `InvalidPaginationException
            (Json_deserializers.invalid_pagination_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_snapshot_copy_configurations_request) =
    let input = Json_serializers.list_snapshot_copy_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RedshiftServerless.ListSnapshotCopyConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_snapshot_copy_configurations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_snapshot_copy_configurations_request) =
    let input = Json_serializers.list_snapshot_copy_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListSnapshotCopyConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_snapshot_copy_configurations_response_of_yojson
      ~error_deserializer
end

module ListScheduledActions = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `InvalidPaginationException _ -> "com.amazonaws.redshiftserverless#InvalidPaginationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidPaginationException" ->
          `InvalidPaginationException
            (Json_deserializers.invalid_pagination_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_scheduled_actions_request) =
    let input = Json_serializers.list_scheduled_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListScheduledActions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_scheduled_actions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_scheduled_actions_request) =
    let input = Json_serializers.list_scheduled_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListScheduledActions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_scheduled_actions_response_of_yojson
      ~error_deserializer
end

module ListReservations = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_reservations_request) =
    let input = Json_serializers.list_reservations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListReservations" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_reservations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_reservations_request) =
    let input = Json_serializers.list_reservations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListReservations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_reservations_response_of_yojson
      ~error_deserializer
end

module ListReservationOfferings = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_reservation_offerings_request) =
    let input = Json_serializers.list_reservation_offerings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListReservationOfferings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_reservation_offerings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_reservation_offerings_request) =
    let input = Json_serializers.list_reservation_offerings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListReservationOfferings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_reservation_offerings_response_of_yojson
      ~error_deserializer
end

module ListRecoveryPoints = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_recovery_points_request) =
    let input = Json_serializers.list_recovery_points_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListRecoveryPoints" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_recovery_points_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_recovery_points_request) =
    let input = Json_serializers.list_recovery_points_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListRecoveryPoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_recovery_points_response_of_yojson
      ~error_deserializer
end

module ListNamespaces = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_namespaces_request) =
    let input = Json_serializers.list_namespaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListNamespaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_namespaces_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_namespaces_request) =
    let input = Json_serializers.list_namespaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListNamespaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_namespaces_response_of_yojson ~error_deserializer
end

module ListManagedWorkgroups = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_managed_workgroups_request) =
    let input = Json_serializers.list_managed_workgroups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListManagedWorkgroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_managed_workgroups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_managed_workgroups_request) =
    let input = Json_serializers.list_managed_workgroups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListManagedWorkgroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_managed_workgroups_response_of_yojson
      ~error_deserializer
end

module ListEndpointAccess = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_endpoint_access_request) =
    let input = Json_serializers.list_endpoint_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.ListEndpointAccess" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_endpoint_access_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_endpoint_access_request) =
    let input = Json_serializers.list_endpoint_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListEndpointAccess" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_endpoint_access_response_of_yojson
      ~error_deserializer
end

module ListCustomDomainAssociations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `InvalidPaginationException _ -> "com.amazonaws.redshiftserverless#InvalidPaginationException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidPaginationException" ->
          `InvalidPaginationException
            (Json_deserializers.invalid_pagination_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_custom_domain_associations_request) =
    let input = Json_serializers.list_custom_domain_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RedshiftServerless.ListCustomDomainAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_custom_domain_associations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_custom_domain_associations_request) =
    let input = Json_serializers.list_custom_domain_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ListCustomDomainAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_custom_domain_associations_response_of_yojson
      ~error_deserializer
end

module GetWorkgroup = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_workgroup_request) =
    let input = Json_serializers.get_workgroup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetWorkgroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_workgroup_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_workgroup_request) =
    let input = Json_serializers.get_workgroup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftServerless.GetWorkgroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_workgroup_response_of_yojson ~error_deserializer
end

module GetUsageLimit = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_usage_limit_request) =
    let input = Json_serializers.get_usage_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetUsageLimit" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_usage_limit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_usage_limit_request) =
    let input = Json_serializers.get_usage_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftServerless.GetUsageLimit"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_usage_limit_response_of_yojson ~error_deserializer
end

module GetTrack = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `DryRunException _ -> "com.amazonaws.redshiftserverless#DryRunException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DryRunException" ->
          `DryRunException (Json_deserializers.dry_run_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_track_request) =
    let input = Json_serializers.get_track_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetTrack" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_track_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_track_request) =
    let input = Json_serializers.get_track_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftServerless.GetTrack"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_track_response_of_yojson
      ~error_deserializer
end

module GetTableRestoreStatus = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_table_restore_status_request) =
    let input = Json_serializers.get_table_restore_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetTableRestoreStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_table_restore_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_table_restore_status_request) =
    let input = Json_serializers.get_table_restore_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.GetTableRestoreStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_table_restore_status_response_of_yojson
      ~error_deserializer
end

module GetSnapshot = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_snapshot_request) =
    let input = Json_serializers.get_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetSnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_snapshot_request) =
    let input = Json_serializers.get_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftServerless.GetSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_snapshot_response_of_yojson ~error_deserializer
end

module GetScheduledAction = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_scheduled_action_request) =
    let input = Json_serializers.get_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetScheduledAction" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_scheduled_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_scheduled_action_request) =
    let input = Json_serializers.get_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.GetScheduledAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_scheduled_action_response_of_yojson
      ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.GetResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer
end

module GetReservationOffering = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_reservation_offering_request) =
    let input = Json_serializers.get_reservation_offering_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetReservationOffering"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_reservation_offering_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_reservation_offering_request) =
    let input = Json_serializers.get_reservation_offering_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.GetReservationOffering" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_reservation_offering_response_of_yojson
      ~error_deserializer
end

module GetReservation = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_reservation_request) =
    let input = Json_serializers.get_reservation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetReservation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_reservation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_reservation_request) =
    let input = Json_serializers.get_reservation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.GetReservation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_reservation_response_of_yojson ~error_deserializer
end

module GetRecoveryPoint = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_recovery_point_request) =
    let input = Json_serializers.get_recovery_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetRecoveryPoint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_recovery_point_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_recovery_point_request) =
    let input = Json_serializers.get_recovery_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.GetRecoveryPoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_recovery_point_response_of_yojson
      ~error_deserializer
end

module GetNamespace = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_namespace_request) =
    let input = Json_serializers.get_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetNamespace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_namespace_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_namespace_request) =
    let input = Json_serializers.get_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftServerless.GetNamespace"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_namespace_response_of_yojson ~error_deserializer
end

module GetIdentityCenterAuthToken = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `DryRunException _ -> "com.amazonaws.redshiftserverless#DryRunException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DryRunException" ->
          `DryRunException (Json_deserializers.dry_run_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_identity_center_auth_token_request) =
    let input = Json_serializers.get_identity_center_auth_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetIdentityCenterAuthToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_identity_center_auth_token_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_identity_center_auth_token_request) =
    let input = Json_serializers.get_identity_center_auth_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.GetIdentityCenterAuthToken" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_identity_center_auth_token_response_of_yojson
      ~error_deserializer
end

module GetEndpointAccess = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_endpoint_access_request) =
    let input = Json_serializers.get_endpoint_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetEndpointAccess" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_endpoint_access_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_endpoint_access_request) =
    let input = Json_serializers.get_endpoint_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.GetEndpointAccess" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_endpoint_access_response_of_yojson
      ~error_deserializer
end

module GetCustomDomainAssociation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_custom_domain_association_request) =
    let input = Json_serializers.get_custom_domain_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetCustomDomainAssociation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_custom_domain_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_custom_domain_association_request) =
    let input = Json_serializers.get_custom_domain_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.GetCustomDomainAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_custom_domain_association_response_of_yojson
      ~error_deserializer
end

module GetCredentials = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_credentials_request) =
    let input = Json_serializers.get_credentials_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.GetCredentials" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_credentials_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_credentials_request) =
    let input = Json_serializers.get_credentials_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.GetCredentials" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_credentials_response_of_yojson ~error_deserializer
end

module DeleteWorkgroup = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_workgroup_request) =
    let input = Json_serializers.delete_workgroup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.DeleteWorkgroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_workgroup_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_workgroup_request) =
    let input = Json_serializers.delete_workgroup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.DeleteWorkgroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workgroup_response_of_yojson
      ~error_deserializer
end

module DeleteUsageLimit = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_usage_limit_request) =
    let input = Json_serializers.delete_usage_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.DeleteUsageLimit" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_usage_limit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_usage_limit_request) =
    let input = Json_serializers.delete_usage_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.DeleteUsageLimit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_usage_limit_response_of_yojson
      ~error_deserializer
end

module DeleteSnapshotCopyConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_snapshot_copy_configuration_request) =
    let input = Json_serializers.delete_snapshot_copy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RedshiftServerless.DeleteSnapshotCopyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_snapshot_copy_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_snapshot_copy_configuration_request) =
    let input = Json_serializers.delete_snapshot_copy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.DeleteSnapshotCopyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_snapshot_copy_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteSnapshot = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_snapshot_request) =
    let input = Json_serializers.delete_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.DeleteSnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_snapshot_request) =
    let input = Json_serializers.delete_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.DeleteSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_snapshot_response_of_yojson ~error_deserializer
end

module DeleteScheduledAction = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_scheduled_action_request) =
    let input = Json_serializers.delete_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.DeleteScheduledAction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_scheduled_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_scheduled_action_request) =
    let input = Json_serializers.delete_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.DeleteScheduledAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_scheduled_action_response_of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.DeleteResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer
end

module DeleteNamespace = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_namespace_request) =
    let input = Json_serializers.delete_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.DeleteNamespace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_namespace_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_namespace_request) =
    let input = Json_serializers.delete_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.DeleteNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_namespace_response_of_yojson
      ~error_deserializer
end

module DeleteEndpointAccess = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_endpoint_access_request) =
    let input = Json_serializers.delete_endpoint_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.DeleteEndpointAccess"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_endpoint_access_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_endpoint_access_request) =
    let input = Json_serializers.delete_endpoint_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.DeleteEndpointAccess" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_endpoint_access_response_of_yojson
      ~error_deserializer
end

module DeleteCustomDomainAssociation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_custom_domain_association_request) =
    let input = Json_serializers.delete_custom_domain_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RedshiftServerless.DeleteCustomDomainAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_custom_domain_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_custom_domain_association_request) =
    let input = Json_serializers.delete_custom_domain_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.DeleteCustomDomainAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_custom_domain_association_response_of_yojson
      ~error_deserializer
end

module CreateWorkgroup = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InsufficientCapacityException _ ->
        "com.amazonaws.redshiftserverless#InsufficientCapacityException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `Ipv6CidrBlockNotFoundException _ ->
        "com.amazonaws.redshiftserverless#Ipv6CidrBlockNotFoundException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.redshiftserverless#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InsufficientCapacityException" ->
          `InsufficientCapacityException
            (Json_deserializers.insufficient_capacity_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "Ipv6CidrBlockNotFoundException" ->
          `Ipv6CidrBlockNotFoundException
            (Json_deserializers.ipv6_cidr_block_not_found_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_workgroup_request) =
    let input = Json_serializers.create_workgroup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.CreateWorkgroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_workgroup_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workgroup_request) =
    let input = Json_serializers.create_workgroup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.CreateWorkgroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workgroup_response_of_yojson
      ~error_deserializer
end

module CreateUsageLimit = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.redshiftserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_usage_limit_request) =
    let input = Json_serializers.create_usage_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.CreateUsageLimit" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_usage_limit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_usage_limit_request) =
    let input = Json_serializers.create_usage_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.CreateUsageLimit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_usage_limit_response_of_yojson
      ~error_deserializer
end

module CreateSnapshotCopyConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.redshiftserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_snapshot_copy_configuration_request) =
    let input = Json_serializers.create_snapshot_copy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RedshiftServerless.CreateSnapshotCopyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_snapshot_copy_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_snapshot_copy_configuration_request) =
    let input = Json_serializers.create_snapshot_copy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.CreateSnapshotCopyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_snapshot_copy_configuration_response_of_yojson
      ~error_deserializer
end

module CreateSnapshot = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.redshiftserverless#ServiceQuotaExceededException"
    | `TooManyTagsException _ -> "com.amazonaws.redshiftserverless#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_snapshot_request) =
    let input = Json_serializers.create_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.CreateSnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_snapshot_request) =
    let input = Json_serializers.create_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.CreateSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_snapshot_response_of_yojson ~error_deserializer
end

module CreateScheduledAction = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_scheduled_action_request) =
    let input = Json_serializers.create_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.CreateScheduledAction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_scheduled_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_scheduled_action_request) =
    let input = Json_serializers.create_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.CreateScheduledAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_scheduled_action_response_of_yojson
      ~error_deserializer
end

module CreateReservation = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.redshiftserverless#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `TooManyTagsException _ -> "com.amazonaws.redshiftserverless#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_reservation_request) =
    let input = Json_serializers.create_reservation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.CreateReservation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_reservation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_reservation_request) =
    let input = Json_serializers.create_reservation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.CreateReservation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_reservation_response_of_yojson
      ~error_deserializer
end

module CreateNamespace = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `TooManyTagsException _ -> "com.amazonaws.redshiftserverless#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_namespace_request) =
    let input = Json_serializers.create_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.CreateNamespace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_namespace_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_namespace_request) =
    let input = Json_serializers.create_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.CreateNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_namespace_response_of_yojson
      ~error_deserializer
end

module CreateEndpointAccess = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.redshiftserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_endpoint_access_request) =
    let input = Json_serializers.create_endpoint_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftServerless.CreateEndpointAccess"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_endpoint_access_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_endpoint_access_request) =
    let input = Json_serializers.create_endpoint_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.CreateEndpointAccess" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_endpoint_access_response_of_yojson
      ~error_deserializer
end

module CreateCustomDomainAssociation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.redshiftserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.redshiftserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_custom_domain_association_request) =
    let input = Json_serializers.create_custom_domain_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RedshiftServerless.CreateCustomDomainAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_custom_domain_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_custom_domain_association_request) =
    let input = Json_serializers.create_custom_domain_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.CreateCustomDomainAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_custom_domain_association_response_of_yojson
      ~error_deserializer
end

module ConvertRecoveryPointToSnapshot = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.redshiftserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.redshiftserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.redshiftserverless#ServiceQuotaExceededException"
    | `TooManyTagsException _ -> "com.amazonaws.redshiftserverless#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.redshiftserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : convert_recovery_point_to_snapshot_request) =
    let input = Json_serializers.convert_recovery_point_to_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RedshiftServerless.ConvertRecoveryPointToSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.convert_recovery_point_to_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : convert_recovery_point_to_snapshot_request) =
    let input = Json_serializers.convert_recovery_point_to_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftServerless.ConvertRecoveryPointToSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.convert_recovery_point_to_snapshot_response_of_yojson
      ~error_deserializer
end
