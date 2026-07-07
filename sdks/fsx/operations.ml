open Types
open Service_metadata

module AssociateFileSystemAliases = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_file_system_aliases_request) =
    let input = Json_serializers.associate_file_system_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.AssociateFileSystemAliases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_file_system_aliases_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_file_system_aliases_request) =
    let input = Json_serializers.associate_file_system_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.AssociateFileSystemAliases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_file_system_aliases_response_of_yojson
      ~error_deserializer
end

module CancelDataRepositoryTask = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `DataRepositoryTaskEnded _ -> "com.amazonaws.fsx#DataRepositoryTaskEnded"
    | `DataRepositoryTaskNotFound _ -> "com.amazonaws.fsx#DataRepositoryTaskNotFound"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "DataRepositoryTaskEnded" ->
          `DataRepositoryTaskEnded
            (Json_deserializers.data_repository_task_ended_of_yojson tree path)
      | _, "DataRepositoryTaskNotFound" ->
          `DataRepositoryTaskNotFound
            (Json_deserializers.data_repository_task_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_data_repository_task_request) =
    let input = Json_serializers.cancel_data_repository_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.CancelDataRepositoryTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_data_repository_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_data_repository_task_request) =
    let input = Json_serializers.cancel_data_repository_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CancelDataRepositoryTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_data_repository_task_response_of_yojson
      ~error_deserializer
end

module CopyBackup = struct
  let error_to_string = function
    | `BackupNotFound _ -> "com.amazonaws.fsx#BackupNotFound"
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `IncompatibleRegionForMultiAZ _ -> "com.amazonaws.fsx#IncompatibleRegionForMultiAZ"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `InvalidDestinationKmsKey _ -> "com.amazonaws.fsx#InvalidDestinationKmsKey"
    | `InvalidRegion _ -> "com.amazonaws.fsx#InvalidRegion"
    | `InvalidSourceKmsKey _ -> "com.amazonaws.fsx#InvalidSourceKmsKey"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | `SourceBackupUnavailable _ -> "com.amazonaws.fsx#SourceBackupUnavailable"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BackupNotFound" ->
          `BackupNotFound (Json_deserializers.backup_not_found_of_yojson tree path)
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "IncompatibleRegionForMultiAZ" ->
          `IncompatibleRegionForMultiAZ
            (Json_deserializers.incompatible_region_for_multi_a_z_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDestinationKmsKey" ->
          `InvalidDestinationKmsKey
            (Json_deserializers.invalid_destination_kms_key_of_yojson tree path)
      | _, "InvalidRegion" -> `InvalidRegion (Json_deserializers.invalid_region_of_yojson tree path)
      | _, "InvalidSourceKmsKey" ->
          `InvalidSourceKmsKey (Json_deserializers.invalid_source_kms_key_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _, "SourceBackupUnavailable" ->
          `SourceBackupUnavailable
            (Json_deserializers.source_backup_unavailable_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : copy_backup_request) =
    let input = Json_serializers.copy_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.CopyBackup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.copy_backup_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : copy_backup_request) =
    let input = Json_serializers.copy_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CopyBackup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.copy_backup_response_of_yojson ~error_deserializer
end

module CopySnapshotAndUpdateVolume = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : copy_snapshot_and_update_volume_request) =
    let input = Json_serializers.copy_snapshot_and_update_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.CopySnapshotAndUpdateVolume" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.copy_snapshot_and_update_volume_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : copy_snapshot_and_update_volume_request) =
    let input = Json_serializers.copy_snapshot_and_update_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CopySnapshotAndUpdateVolume" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.copy_snapshot_and_update_volume_response_of_yojson
      ~error_deserializer
end

module CreateAndAttachS3AccessPoint = struct
  let error_to_string = function
    | `AccessPointAlreadyOwnedByYou _ -> "com.amazonaws.fsx#AccessPointAlreadyOwnedByYou"
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `InvalidAccessPoint _ -> "com.amazonaws.fsx#InvalidAccessPoint"
    | `InvalidRequest _ -> "com.amazonaws.fsx#InvalidRequest"
    | `TooManyAccessPoints _ -> "com.amazonaws.fsx#TooManyAccessPoints"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | `VolumeNotFound _ -> "com.amazonaws.fsx#VolumeNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessPointAlreadyOwnedByYou" ->
          `AccessPointAlreadyOwnedByYou
            (Json_deserializers.access_point_already_owned_by_you_of_yojson tree path)
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidAccessPoint" ->
          `InvalidAccessPoint (Json_deserializers.invalid_access_point_of_yojson tree path)
      | _, "InvalidRequest" ->
          `InvalidRequest (Json_deserializers.invalid_request_of_yojson tree path)
      | _, "TooManyAccessPoints" ->
          `TooManyAccessPoints (Json_deserializers.too_many_access_points_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _, "VolumeNotFound" ->
          `VolumeNotFound (Json_deserializers.volume_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_and_attach_s3_access_point_request) =
    let input = Json_serializers.create_and_attach_s3_access_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateAndAttachS3AccessPoint" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_and_attach_s3_access_point_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_and_attach_s3_access_point_request) =
    let input = Json_serializers.create_and_attach_s3_access_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateAndAttachS3AccessPoint" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_and_attach_s3_access_point_response_of_yojson
      ~error_deserializer
end

module CreateBackup = struct
  let error_to_string = function
    | `BackupInProgress _ -> "com.amazonaws.fsx#BackupInProgress"
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | `VolumeNotFound _ -> "com.amazonaws.fsx#VolumeNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BackupInProgress" ->
          `BackupInProgress (Json_deserializers.backup_in_progress_of_yojson tree path)
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _, "VolumeNotFound" ->
          `VolumeNotFound (Json_deserializers.volume_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_backup_request) =
    let input = Json_serializers.create_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.CreateBackup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_backup_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_backup_request) =
    let input = Json_serializers.create_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateBackup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_backup_response_of_yojson ~error_deserializer
end

module CreateDataRepositoryAssociation = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_data_repository_association_request) =
    let input = Json_serializers.create_data_repository_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateDataRepositoryAssociation" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_data_repository_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_data_repository_association_request) =
    let input = Json_serializers.create_data_repository_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateDataRepositoryAssociation" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_data_repository_association_response_of_yojson
      ~error_deserializer
end

module CreateDataRepositoryTask = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `DataRepositoryTaskExecuting _ -> "com.amazonaws.fsx#DataRepositoryTaskExecuting"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "DataRepositoryTaskExecuting" ->
          `DataRepositoryTaskExecuting
            (Json_deserializers.data_repository_task_executing_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_data_repository_task_request) =
    let input = Json_serializers.create_data_repository_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateDataRepositoryTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_repository_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_data_repository_task_request) =
    let input = Json_serializers.create_data_repository_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateDataRepositoryTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_repository_task_response_of_yojson
      ~error_deserializer
end

module CreateFileCache = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `InvalidNetworkSettings _ -> "com.amazonaws.fsx#InvalidNetworkSettings"
    | `InvalidPerUnitStorageThroughput _ -> "com.amazonaws.fsx#InvalidPerUnitStorageThroughput"
    | `MissingFileCacheConfiguration _ -> "com.amazonaws.fsx#MissingFileCacheConfiguration"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidNetworkSettings" ->
          `InvalidNetworkSettings (Json_deserializers.invalid_network_settings_of_yojson tree path)
      | _, "InvalidPerUnitStorageThroughput" ->
          `InvalidPerUnitStorageThroughput
            (Json_deserializers.invalid_per_unit_storage_throughput_of_yojson tree path)
      | _, "MissingFileCacheConfiguration" ->
          `MissingFileCacheConfiguration
            (Json_deserializers.missing_file_cache_configuration_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_file_cache_request) =
    let input = Json_serializers.create_file_cache_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.CreateFileCache"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_file_cache_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_file_cache_request) =
    let input = Json_serializers.create_file_cache_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateFileCache" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_file_cache_response_of_yojson
      ~error_deserializer
end

module CreateFileSystem = struct
  let error_to_string = function
    | `ActiveDirectoryError _ -> "com.amazonaws.fsx#ActiveDirectoryError"
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `InvalidExportPath _ -> "com.amazonaws.fsx#InvalidExportPath"
    | `InvalidImportPath _ -> "com.amazonaws.fsx#InvalidImportPath"
    | `InvalidNetworkSettings _ -> "com.amazonaws.fsx#InvalidNetworkSettings"
    | `InvalidPerUnitStorageThroughput _ -> "com.amazonaws.fsx#InvalidPerUnitStorageThroughput"
    | `MissingFileSystemConfiguration _ -> "com.amazonaws.fsx#MissingFileSystemConfiguration"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActiveDirectoryError" ->
          `ActiveDirectoryError (Json_deserializers.active_directory_error_of_yojson tree path)
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidExportPath" ->
          `InvalidExportPath (Json_deserializers.invalid_export_path_of_yojson tree path)
      | _, "InvalidImportPath" ->
          `InvalidImportPath (Json_deserializers.invalid_import_path_of_yojson tree path)
      | _, "InvalidNetworkSettings" ->
          `InvalidNetworkSettings (Json_deserializers.invalid_network_settings_of_yojson tree path)
      | _, "InvalidPerUnitStorageThroughput" ->
          `InvalidPerUnitStorageThroughput
            (Json_deserializers.invalid_per_unit_storage_throughput_of_yojson tree path)
      | _, "MissingFileSystemConfiguration" ->
          `MissingFileSystemConfiguration
            (Json_deserializers.missing_file_system_configuration_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_file_system_request) =
    let input = Json_serializers.create_file_system_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.CreateFileSystem"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_file_system_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_file_system_request) =
    let input = Json_serializers.create_file_system_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateFileSystem" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_file_system_response_of_yojson
      ~error_deserializer
end

module CreateFileSystemFromBackup = struct
  let error_to_string = function
    | `ActiveDirectoryError _ -> "com.amazonaws.fsx#ActiveDirectoryError"
    | `BackupNotFound _ -> "com.amazonaws.fsx#BackupNotFound"
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `InvalidNetworkSettings _ -> "com.amazonaws.fsx#InvalidNetworkSettings"
    | `InvalidPerUnitStorageThroughput _ -> "com.amazonaws.fsx#InvalidPerUnitStorageThroughput"
    | `MissingFileSystemConfiguration _ -> "com.amazonaws.fsx#MissingFileSystemConfiguration"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActiveDirectoryError" ->
          `ActiveDirectoryError (Json_deserializers.active_directory_error_of_yojson tree path)
      | _, "BackupNotFound" ->
          `BackupNotFound (Json_deserializers.backup_not_found_of_yojson tree path)
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidNetworkSettings" ->
          `InvalidNetworkSettings (Json_deserializers.invalid_network_settings_of_yojson tree path)
      | _, "InvalidPerUnitStorageThroughput" ->
          `InvalidPerUnitStorageThroughput
            (Json_deserializers.invalid_per_unit_storage_throughput_of_yojson tree path)
      | _, "MissingFileSystemConfiguration" ->
          `MissingFileSystemConfiguration
            (Json_deserializers.missing_file_system_configuration_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_file_system_from_backup_request) =
    let input = Json_serializers.create_file_system_from_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateFileSystemFromBackup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_file_system_from_backup_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_file_system_from_backup_request) =
    let input = Json_serializers.create_file_system_from_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateFileSystemFromBackup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_file_system_from_backup_response_of_yojson
      ~error_deserializer
end

module CreateSnapshot = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | `VolumeNotFound _ -> "com.amazonaws.fsx#VolumeNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _, "VolumeNotFound" ->
          `VolumeNotFound (Json_deserializers.volume_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_snapshot_request) =
    let input = Json_serializers.create_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.CreateSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_snapshot_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_snapshot_request) =
    let input = Json_serializers.create_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_snapshot_response_of_yojson ~error_deserializer
end

module CreateStorageVirtualMachine = struct
  let error_to_string = function
    | `ActiveDirectoryError _ -> "com.amazonaws.fsx#ActiveDirectoryError"
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActiveDirectoryError" ->
          `ActiveDirectoryError (Json_deserializers.active_directory_error_of_yojson tree path)
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_storage_virtual_machine_request) =
    let input = Json_serializers.create_storage_virtual_machine_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateStorageVirtualMachine" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_storage_virtual_machine_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_storage_virtual_machine_request) =
    let input = Json_serializers.create_storage_virtual_machine_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateStorageVirtualMachine" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_storage_virtual_machine_response_of_yojson
      ~error_deserializer
end

module CreateVolume = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `MissingVolumeConfiguration _ -> "com.amazonaws.fsx#MissingVolumeConfiguration"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | `StorageVirtualMachineNotFound _ -> "com.amazonaws.fsx#StorageVirtualMachineNotFound"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "MissingVolumeConfiguration" ->
          `MissingVolumeConfiguration
            (Json_deserializers.missing_volume_configuration_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _, "StorageVirtualMachineNotFound" ->
          `StorageVirtualMachineNotFound
            (Json_deserializers.storage_virtual_machine_not_found_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_volume_request) =
    let input = Json_serializers.create_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.CreateVolume"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_volume_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_volume_request) =
    let input = Json_serializers.create_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_volume_response_of_yojson ~error_deserializer
end

module CreateVolumeFromBackup = struct
  let error_to_string = function
    | `BackupNotFound _ -> "com.amazonaws.fsx#BackupNotFound"
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `MissingVolumeConfiguration _ -> "com.amazonaws.fsx#MissingVolumeConfiguration"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | `StorageVirtualMachineNotFound _ -> "com.amazonaws.fsx#StorageVirtualMachineNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BackupNotFound" ->
          `BackupNotFound (Json_deserializers.backup_not_found_of_yojson tree path)
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "MissingVolumeConfiguration" ->
          `MissingVolumeConfiguration
            (Json_deserializers.missing_volume_configuration_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _, "StorageVirtualMachineNotFound" ->
          `StorageVirtualMachineNotFound
            (Json_deserializers.storage_virtual_machine_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_volume_from_backup_request) =
    let input = Json_serializers.create_volume_from_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateVolumeFromBackup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_volume_from_backup_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_volume_from_backup_request) =
    let input = Json_serializers.create_volume_from_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.CreateVolumeFromBackup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_volume_from_backup_response_of_yojson
      ~error_deserializer
end

module DeleteBackup = struct
  let error_to_string = function
    | `BackupBeingCopied _ -> "com.amazonaws.fsx#BackupBeingCopied"
    | `BackupInProgress _ -> "com.amazonaws.fsx#BackupInProgress"
    | `BackupNotFound _ -> "com.amazonaws.fsx#BackupNotFound"
    | `BackupRestoring _ -> "com.amazonaws.fsx#BackupRestoring"
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BackupBeingCopied" ->
          `BackupBeingCopied (Json_deserializers.backup_being_copied_of_yojson tree path)
      | _, "BackupInProgress" ->
          `BackupInProgress (Json_deserializers.backup_in_progress_of_yojson tree path)
      | _, "BackupNotFound" ->
          `BackupNotFound (Json_deserializers.backup_not_found_of_yojson tree path)
      | _, "BackupRestoring" ->
          `BackupRestoring (Json_deserializers.backup_restoring_of_yojson tree path)
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_backup_request) =
    let input = Json_serializers.delete_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.DeleteBackup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_backup_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_backup_request) =
    let input = Json_serializers.delete_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DeleteBackup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_backup_response_of_yojson ~error_deserializer
end

module DeleteDataRepositoryAssociation = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `DataRepositoryAssociationNotFound _ -> "com.amazonaws.fsx#DataRepositoryAssociationNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "DataRepositoryAssociationNotFound" ->
          `DataRepositoryAssociationNotFound
            (Json_deserializers.data_repository_association_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_data_repository_association_request) =
    let input = Json_serializers.delete_data_repository_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DeleteDataRepositoryAssociation" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_data_repository_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_data_repository_association_request) =
    let input = Json_serializers.delete_data_repository_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DeleteDataRepositoryAssociation" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_data_repository_association_response_of_yojson
      ~error_deserializer
end

module DeleteFileCache = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileCacheNotFound _ -> "com.amazonaws.fsx#FileCacheNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileCacheNotFound" ->
          `FileCacheNotFound (Json_deserializers.file_cache_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_file_cache_request) =
    let input = Json_serializers.delete_file_cache_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.DeleteFileCache"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_file_cache_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_file_cache_request) =
    let input = Json_serializers.delete_file_cache_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DeleteFileCache" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_file_cache_response_of_yojson
      ~error_deserializer
end

module DeleteFileSystem = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_file_system_request) =
    let input = Json_serializers.delete_file_system_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.DeleteFileSystem"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_file_system_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_file_system_request) =
    let input = Json_serializers.delete_file_system_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DeleteFileSystem" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_file_system_response_of_yojson
      ~error_deserializer
end

module DeleteSnapshot = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `SnapshotNotFound _ -> "com.amazonaws.fsx#SnapshotNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "SnapshotNotFound" ->
          `SnapshotNotFound (Json_deserializers.snapshot_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_snapshot_request) =
    let input = Json_serializers.delete_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.DeleteSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_snapshot_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_snapshot_request) =
    let input = Json_serializers.delete_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DeleteSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_snapshot_response_of_yojson ~error_deserializer
end

module DeleteStorageVirtualMachine = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `StorageVirtualMachineNotFound _ -> "com.amazonaws.fsx#StorageVirtualMachineNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "StorageVirtualMachineNotFound" ->
          `StorageVirtualMachineNotFound
            (Json_deserializers.storage_virtual_machine_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_storage_virtual_machine_request) =
    let input = Json_serializers.delete_storage_virtual_machine_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DeleteStorageVirtualMachine" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_storage_virtual_machine_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_storage_virtual_machine_request) =
    let input = Json_serializers.delete_storage_virtual_machine_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DeleteStorageVirtualMachine" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_storage_virtual_machine_response_of_yojson
      ~error_deserializer
end

module DeleteVolume = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | `VolumeNotFound _ -> "com.amazonaws.fsx#VolumeNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _, "VolumeNotFound" ->
          `VolumeNotFound (Json_deserializers.volume_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_volume_request) =
    let input = Json_serializers.delete_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.DeleteVolume"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_volume_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_volume_request) =
    let input = Json_serializers.delete_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DeleteVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_volume_response_of_yojson ~error_deserializer
end

module DescribeBackups = struct
  let error_to_string = function
    | `BackupNotFound _ -> "com.amazonaws.fsx#BackupNotFound"
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `VolumeNotFound _ -> "com.amazonaws.fsx#VolumeNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BackupNotFound" ->
          `BackupNotFound (Json_deserializers.backup_not_found_of_yojson tree path)
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "VolumeNotFound" ->
          `VolumeNotFound (Json_deserializers.volume_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_backups_request) =
    let input = Json_serializers.describe_backups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.DescribeBackups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_backups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_backups_request) =
    let input = Json_serializers.describe_backups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeBackups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_backups_response_of_yojson
      ~error_deserializer
end

module DescribeDataRepositoryAssociations = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `DataRepositoryAssociationNotFound _ -> "com.amazonaws.fsx#DataRepositoryAssociationNotFound"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `InvalidDataRepositoryType _ -> "com.amazonaws.fsx#InvalidDataRepositoryType"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "DataRepositoryAssociationNotFound" ->
          `DataRepositoryAssociationNotFound
            (Json_deserializers.data_repository_association_not_found_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidDataRepositoryType" ->
          `InvalidDataRepositoryType
            (Json_deserializers.invalid_data_repository_type_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_data_repository_associations_request) =
    let input = Json_serializers.describe_data_repository_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeDataRepositoryAssociations" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_data_repository_associations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_data_repository_associations_request) =
    let input = Json_serializers.describe_data_repository_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeDataRepositoryAssociations" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_data_repository_associations_response_of_yojson
      ~error_deserializer
end

module DescribeDataRepositoryTasks = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `DataRepositoryTaskNotFound _ -> "com.amazonaws.fsx#DataRepositoryTaskNotFound"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "DataRepositoryTaskNotFound" ->
          `DataRepositoryTaskNotFound
            (Json_deserializers.data_repository_task_not_found_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_data_repository_tasks_request) =
    let input = Json_serializers.describe_data_repository_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeDataRepositoryTasks" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_data_repository_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_data_repository_tasks_request) =
    let input = Json_serializers.describe_data_repository_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeDataRepositoryTasks" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_data_repository_tasks_response_of_yojson
      ~error_deserializer
end

module DescribeFileCaches = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileCacheNotFound _ -> "com.amazonaws.fsx#FileCacheNotFound"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileCacheNotFound" ->
          `FileCacheNotFound (Json_deserializers.file_cache_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_file_caches_request) =
    let input = Json_serializers.describe_file_caches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeFileCaches" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_file_caches_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_file_caches_request) =
    let input = Json_serializers.describe_file_caches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeFileCaches" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_file_caches_response_of_yojson
      ~error_deserializer
end

module DescribeFileSystemAliases = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_file_system_aliases_request) =
    let input = Json_serializers.describe_file_system_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeFileSystemAliases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_file_system_aliases_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_file_system_aliases_request) =
    let input = Json_serializers.describe_file_system_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeFileSystemAliases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_file_system_aliases_response_of_yojson
      ~error_deserializer
end

module DescribeFileSystems = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_file_systems_request) =
    let input = Json_serializers.describe_file_systems_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeFileSystems" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_file_systems_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_file_systems_request) =
    let input = Json_serializers.describe_file_systems_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeFileSystems" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_file_systems_response_of_yojson
      ~error_deserializer
end

module DescribeS3AccessPointAttachments = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `S3AccessPointAttachmentNotFound _ -> "com.amazonaws.fsx#S3AccessPointAttachmentNotFound"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "S3AccessPointAttachmentNotFound" ->
          `S3AccessPointAttachmentNotFound
            (Json_deserializers.s3_access_point_attachment_not_found_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_s3_access_point_attachments_request) =
    let input = Json_serializers.describe_s3_access_point_attachments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeS3AccessPointAttachments" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_s3_access_point_attachments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_s3_access_point_attachments_request) =
    let input = Json_serializers.describe_s3_access_point_attachments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeS3AccessPointAttachments" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_s3_access_point_attachments_response_of_yojson
      ~error_deserializer
end

module DescribeSharedVpcConfiguration = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_shared_vpc_configuration_request) =
    let input = Json_serializers.describe_shared_vpc_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeSharedVpcConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_shared_vpc_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_shared_vpc_configuration_request) =
    let input = Json_serializers.describe_shared_vpc_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeSharedVpcConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_shared_vpc_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeSnapshots = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `SnapshotNotFound _ -> "com.amazonaws.fsx#SnapshotNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "SnapshotNotFound" ->
          `SnapshotNotFound (Json_deserializers.snapshot_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_snapshots_request) =
    let input = Json_serializers.describe_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.DescribeSnapshots"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_snapshots_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_snapshots_request) =
    let input = Json_serializers.describe_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeSnapshots" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_snapshots_response_of_yojson
      ~error_deserializer
end

module DescribeStorageVirtualMachines = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `StorageVirtualMachineNotFound _ -> "com.amazonaws.fsx#StorageVirtualMachineNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "StorageVirtualMachineNotFound" ->
          `StorageVirtualMachineNotFound
            (Json_deserializers.storage_virtual_machine_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_storage_virtual_machines_request) =
    let input = Json_serializers.describe_storage_virtual_machines_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeStorageVirtualMachines" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_storage_virtual_machines_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_storage_virtual_machines_request) =
    let input = Json_serializers.describe_storage_virtual_machines_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeStorageVirtualMachines" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_storage_virtual_machines_response_of_yojson
      ~error_deserializer
end

module DescribeVolumes = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `VolumeNotFound _ -> "com.amazonaws.fsx#VolumeNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "VolumeNotFound" ->
          `VolumeNotFound (Json_deserializers.volume_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_volumes_request) =
    let input = Json_serializers.describe_volumes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.DescribeVolumes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_volumes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_volumes_request) =
    let input = Json_serializers.describe_volumes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DescribeVolumes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_volumes_response_of_yojson
      ~error_deserializer
end

module DetachAndDeleteS3AccessPoint = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `S3AccessPointAttachmentNotFound _ -> "com.amazonaws.fsx#S3AccessPointAttachmentNotFound"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "S3AccessPointAttachmentNotFound" ->
          `S3AccessPointAttachmentNotFound
            (Json_deserializers.s3_access_point_attachment_not_found_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detach_and_delete_s3_access_point_request) =
    let input = Json_serializers.detach_and_delete_s3_access_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DetachAndDeleteS3AccessPoint" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.detach_and_delete_s3_access_point_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detach_and_delete_s3_access_point_request) =
    let input = Json_serializers.detach_and_delete_s3_access_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DetachAndDeleteS3AccessPoint" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.detach_and_delete_s3_access_point_response_of_yojson
      ~error_deserializer
end

module DisassociateFileSystemAliases = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_file_system_aliases_request) =
    let input = Json_serializers.disassociate_file_system_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.DisassociateFileSystemAliases" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disassociate_file_system_aliases_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_file_system_aliases_request) =
    let input = Json_serializers.disassociate_file_system_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.DisassociateFileSystemAliases" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disassociate_file_system_aliases_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `NotServiceResourceError _ -> "com.amazonaws.fsx#NotServiceResourceError"
    | `ResourceDoesNotSupportTagging _ -> "com.amazonaws.fsx#ResourceDoesNotSupportTagging"
    | `ResourceNotFound _ -> "com.amazonaws.fsx#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "NotServiceResourceError" ->
          `NotServiceResourceError
            (Json_deserializers.not_service_resource_error_of_yojson tree path)
      | _, "ResourceDoesNotSupportTagging" ->
          `ResourceDoesNotSupportTagging
            (Json_deserializers.resource_does_not_support_tagging_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ReleaseFileSystemNfsV3Locks = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : release_file_system_nfs_v3_locks_request) =
    let input = Json_serializers.release_file_system_nfs_v3_locks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.ReleaseFileSystemNfsV3Locks" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.release_file_system_nfs_v3_locks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : release_file_system_nfs_v3_locks_request) =
    let input = Json_serializers.release_file_system_nfs_v3_locks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.ReleaseFileSystemNfsV3Locks" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.release_file_system_nfs_v3_locks_response_of_yojson
      ~error_deserializer
end

module RestoreVolumeFromSnapshot = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `VolumeNotFound _ -> "com.amazonaws.fsx#VolumeNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "VolumeNotFound" ->
          `VolumeNotFound (Json_deserializers.volume_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_volume_from_snapshot_request) =
    let input = Json_serializers.restore_volume_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.RestoreVolumeFromSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_volume_from_snapshot_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : restore_volume_from_snapshot_request) =
    let input = Json_serializers.restore_volume_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.RestoreVolumeFromSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_volume_from_snapshot_response_of_yojson
      ~error_deserializer
end

module StartMisconfiguredStateRecovery = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_misconfigured_state_recovery_request) =
    let input = Json_serializers.start_misconfigured_state_recovery_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.StartMisconfiguredStateRecovery" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.start_misconfigured_state_recovery_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_misconfigured_state_recovery_request) =
    let input = Json_serializers.start_misconfigured_state_recovery_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.StartMisconfiguredStateRecovery" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.start_misconfigured_state_recovery_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `NotServiceResourceError _ -> "com.amazonaws.fsx#NotServiceResourceError"
    | `ResourceDoesNotSupportTagging _ -> "com.amazonaws.fsx#ResourceDoesNotSupportTagging"
    | `ResourceNotFound _ -> "com.amazonaws.fsx#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "NotServiceResourceError" ->
          `NotServiceResourceError
            (Json_deserializers.not_service_resource_error_of_yojson tree path)
      | _, "ResourceDoesNotSupportTagging" ->
          `ResourceDoesNotSupportTagging
            (Json_deserializers.resource_does_not_support_tagging_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `NotServiceResourceError _ -> "com.amazonaws.fsx#NotServiceResourceError"
    | `ResourceDoesNotSupportTagging _ -> "com.amazonaws.fsx#ResourceDoesNotSupportTagging"
    | `ResourceNotFound _ -> "com.amazonaws.fsx#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "NotServiceResourceError" ->
          `NotServiceResourceError
            (Json_deserializers.not_service_resource_error_of_yojson tree path)
      | _, "ResourceDoesNotSupportTagging" ->
          `ResourceDoesNotSupportTagging
            (Json_deserializers.resource_does_not_support_tagging_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateDataRepositoryAssociation = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `DataRepositoryAssociationNotFound _ -> "com.amazonaws.fsx#DataRepositoryAssociationNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "DataRepositoryAssociationNotFound" ->
          `DataRepositoryAssociationNotFound
            (Json_deserializers.data_repository_association_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_data_repository_association_request) =
    let input = Json_serializers.update_data_repository_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.UpdateDataRepositoryAssociation" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_data_repository_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_data_repository_association_request) =
    let input = Json_serializers.update_data_repository_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.UpdateDataRepositoryAssociation" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_data_repository_association_response_of_yojson
      ~error_deserializer
end

module UpdateFileCache = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileCacheNotFound _ -> "com.amazonaws.fsx#FileCacheNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `MissingFileCacheConfiguration _ -> "com.amazonaws.fsx#MissingFileCacheConfiguration"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileCacheNotFound" ->
          `FileCacheNotFound (Json_deserializers.file_cache_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "MissingFileCacheConfiguration" ->
          `MissingFileCacheConfiguration
            (Json_deserializers.missing_file_cache_configuration_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_file_cache_request) =
    let input = Json_serializers.update_file_cache_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.UpdateFileCache"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_file_cache_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_file_cache_request) =
    let input = Json_serializers.update_file_cache_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.UpdateFileCache" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_file_cache_response_of_yojson
      ~error_deserializer
end

module UpdateFileSystem = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `FileSystemNotFound _ -> "com.amazonaws.fsx#FileSystemNotFound"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `InvalidNetworkSettings _ -> "com.amazonaws.fsx#InvalidNetworkSettings"
    | `MissingFileSystemConfiguration _ -> "com.amazonaws.fsx#MissingFileSystemConfiguration"
    | `ServiceLimitExceeded _ -> "com.amazonaws.fsx#ServiceLimitExceeded"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "FileSystemNotFound" ->
          `FileSystemNotFound (Json_deserializers.file_system_not_found_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidNetworkSettings" ->
          `InvalidNetworkSettings (Json_deserializers.invalid_network_settings_of_yojson tree path)
      | _, "MissingFileSystemConfiguration" ->
          `MissingFileSystemConfiguration
            (Json_deserializers.missing_file_system_configuration_of_yojson tree path)
      | _, "ServiceLimitExceeded" ->
          `ServiceLimitExceeded (Json_deserializers.service_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_file_system_request) =
    let input = Json_serializers.update_file_system_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.UpdateFileSystem"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_file_system_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_file_system_request) =
    let input = Json_serializers.update_file_system_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.UpdateFileSystem" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_file_system_response_of_yojson
      ~error_deserializer
end

module UpdateSharedVpcConfiguration = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_shared_vpc_configuration_request) =
    let input = Json_serializers.update_shared_vpc_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.UpdateSharedVpcConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_shared_vpc_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_shared_vpc_configuration_request) =
    let input = Json_serializers.update_shared_vpc_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.UpdateSharedVpcConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_shared_vpc_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateSnapshot = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `SnapshotNotFound _ -> "com.amazonaws.fsx#SnapshotNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "SnapshotNotFound" ->
          `SnapshotNotFound (Json_deserializers.snapshot_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_snapshot_request) =
    let input = Json_serializers.update_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.UpdateSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_snapshot_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_snapshot_request) =
    let input = Json_serializers.update_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.UpdateSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_snapshot_response_of_yojson ~error_deserializer
end

module UpdateStorageVirtualMachine = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `StorageVirtualMachineNotFound _ -> "com.amazonaws.fsx#StorageVirtualMachineNotFound"
    | `UnsupportedOperation _ -> "com.amazonaws.fsx#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "StorageVirtualMachineNotFound" ->
          `StorageVirtualMachineNotFound
            (Json_deserializers.storage_virtual_machine_not_found_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_storage_virtual_machine_request) =
    let input = Json_serializers.update_storage_virtual_machine_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSimbaAPIService_v20180301.UpdateStorageVirtualMachine" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_storage_virtual_machine_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_storage_virtual_machine_request) =
    let input = Json_serializers.update_storage_virtual_machine_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.UpdateStorageVirtualMachine" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_storage_virtual_machine_response_of_yojson
      ~error_deserializer
end

module UpdateVolume = struct
  let error_to_string = function
    | `BadRequest _ -> "com.amazonaws.fsx#BadRequest"
    | `IncompatibleParameterError _ -> "com.amazonaws.fsx#IncompatibleParameterError"
    | `InternalServerError _ -> "com.amazonaws.fsx#InternalServerError"
    | `MissingVolumeConfiguration _ -> "com.amazonaws.fsx#MissingVolumeConfiguration"
    | `VolumeNotFound _ -> "com.amazonaws.fsx#VolumeNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequest" -> `BadRequest (Json_deserializers.bad_request_of_yojson tree path)
      | _, "IncompatibleParameterError" ->
          `IncompatibleParameterError
            (Json_deserializers.incompatible_parameter_error_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "MissingVolumeConfiguration" ->
          `MissingVolumeConfiguration
            (Json_deserializers.missing_volume_configuration_of_yojson tree path)
      | _, "VolumeNotFound" ->
          `VolumeNotFound (Json_deserializers.volume_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_volume_request) =
    let input = Json_serializers.update_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSimbaAPIService_v20180301.UpdateVolume"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_volume_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_volume_request) =
    let input = Json_serializers.update_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSimbaAPIService_v20180301.UpdateVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_volume_response_of_yojson ~error_deserializer
end
