open Types
open Service_metadata

module CancelTaskExecution = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_task_execution_request) =
    let input = Json_serializers.cancel_task_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CancelTaskExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.cancel_task_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_task_execution_request) =
    let input = Json_serializers.cancel_task_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.CancelTaskExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_task_execution_response_of_yojson
      ~error_deserializer
end

module CreateAgent = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_agent_request) =
    let input = Json_serializers.create_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateAgent" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_agent_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_agent_request) =
    let input = Json_serializers.create_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.CreateAgent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_agent_response_of_yojson
      ~error_deserializer
end

module CreateLocationAzureBlob = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_azure_blob_request) =
    let input = Json_serializers.create_location_azure_blob_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateLocationAzureBlob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_location_azure_blob_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_azure_blob_request) =
    let input = Json_serializers.create_location_azure_blob_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.CreateLocationAzureBlob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_azure_blob_response_of_yojson
      ~error_deserializer
end

module CreateLocationEfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_efs_request) =
    let input = Json_serializers.create_location_efs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateLocationEfs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_location_efs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_efs_request) =
    let input = Json_serializers.create_location_efs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.CreateLocationEfs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_efs_response_of_yojson
      ~error_deserializer
end

module CreateLocationFsxLustre = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_fsx_lustre_request) =
    let input = Json_serializers.create_location_fsx_lustre_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateLocationFsxLustre" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_location_fsx_lustre_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_fsx_lustre_request) =
    let input = Json_serializers.create_location_fsx_lustre_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.CreateLocationFsxLustre" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_fsx_lustre_response_of_yojson
      ~error_deserializer
end

module CreateLocationFsxOntap = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_fsx_ontap_request) =
    let input = Json_serializers.create_location_fsx_ontap_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateLocationFsxOntap" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_location_fsx_ontap_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_fsx_ontap_request) =
    let input = Json_serializers.create_location_fsx_ontap_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.CreateLocationFsxOntap" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_fsx_ontap_response_of_yojson
      ~error_deserializer
end

module CreateLocationFsxOpenZfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_fsx_open_zfs_request) =
    let input = Json_serializers.create_location_fsx_open_zfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateLocationFsxOpenZfs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_location_fsx_open_zfs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_fsx_open_zfs_request) =
    let input = Json_serializers.create_location_fsx_open_zfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.CreateLocationFsxOpenZfs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_fsx_open_zfs_response_of_yojson
      ~error_deserializer
end

module CreateLocationFsxWindows = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_fsx_windows_request) =
    let input = Json_serializers.create_location_fsx_windows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateLocationFsxWindows" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_location_fsx_windows_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_fsx_windows_request) =
    let input = Json_serializers.create_location_fsx_windows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.CreateLocationFsxWindows" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_fsx_windows_response_of_yojson
      ~error_deserializer
end

module CreateLocationHdfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_hdfs_request) =
    let input = Json_serializers.create_location_hdfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateLocationHdfs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_location_hdfs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_hdfs_request) =
    let input = Json_serializers.create_location_hdfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.CreateLocationHdfs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_hdfs_response_of_yojson
      ~error_deserializer
end

module CreateLocationNfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_nfs_request) =
    let input = Json_serializers.create_location_nfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateLocationNfs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_location_nfs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_nfs_request) =
    let input = Json_serializers.create_location_nfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.CreateLocationNfs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_nfs_response_of_yojson
      ~error_deserializer
end

module CreateLocationObjectStorage = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_object_storage_request) =
    let input = Json_serializers.create_location_object_storage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateLocationObjectStorage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_object_storage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_object_storage_request) =
    let input = Json_serializers.create_location_object_storage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.CreateLocationObjectStorage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_object_storage_response_of_yojson
      ~error_deserializer
end

module CreateLocationS3 = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_s3_request) =
    let input = Json_serializers.create_location_s3_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateLocationS3" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_location_s3_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_s3_request) =
    let input = Json_serializers.create_location_s3_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.CreateLocationS3"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_s3_response_of_yojson
      ~error_deserializer
end

module CreateLocationSmb = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_location_smb_request) =
    let input = Json_serializers.create_location_smb_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateLocationSmb" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_location_smb_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_location_smb_request) =
    let input = Json_serializers.create_location_smb_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.CreateLocationSmb"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_location_smb_response_of_yojson
      ~error_deserializer
end

module CreateTask = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_task_request) =
    let input = Json_serializers.create_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.CreateTask" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_task_request) =
    let input = Json_serializers.create_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.CreateTask" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_task_response_of_yojson
      ~error_deserializer
end

module DeleteAgent = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_agent_request) =
    let input = Json_serializers.delete_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DeleteAgent" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_agent_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_agent_request) =
    let input = Json_serializers.delete_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.DeleteAgent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_agent_response_of_yojson
      ~error_deserializer
end

module DeleteLocation = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_location_request) =
    let input = Json_serializers.delete_location_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DeleteLocation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_location_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_location_request) =
    let input = Json_serializers.delete_location_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.DeleteLocation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_location_response_of_yojson ~error_deserializer
end

module DeleteTask = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_task_request) =
    let input = Json_serializers.delete_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DeleteTask" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_task_request) =
    let input = Json_serializers.delete_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.DeleteTask" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_task_response_of_yojson
      ~error_deserializer
end

module DescribeAgent = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_agent_request) =
    let input = Json_serializers.describe_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeAgent" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_agent_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_agent_request) =
    let input = Json_serializers.describe_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.DescribeAgent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_agent_response_of_yojson ~error_deserializer
end

module DescribeLocationAzureBlob = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_location_azure_blob_request) =
    let input = Json_serializers.describe_location_azure_blob_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeLocationAzureBlob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_azure_blob_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_location_azure_blob_request) =
    let input = Json_serializers.describe_location_azure_blob_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.DescribeLocationAzureBlob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_azure_blob_response_of_yojson
      ~error_deserializer
end

module DescribeLocationEfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_location_efs_request) =
    let input = Json_serializers.describe_location_efs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeLocationEfs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_efs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_location_efs_request) =
    let input = Json_serializers.describe_location_efs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.DescribeLocationEfs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_efs_response_of_yojson
      ~error_deserializer
end

module DescribeLocationFsxLustre = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_location_fsx_lustre_request) =
    let input = Json_serializers.describe_location_fsx_lustre_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeLocationFsxLustre" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_fsx_lustre_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_location_fsx_lustre_request) =
    let input = Json_serializers.describe_location_fsx_lustre_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.DescribeLocationFsxLustre" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_fsx_lustre_response_of_yojson
      ~error_deserializer
end

module DescribeLocationFsxOntap = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_location_fsx_ontap_request) =
    let input = Json_serializers.describe_location_fsx_ontap_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeLocationFsxOntap" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_fsx_ontap_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_location_fsx_ontap_request) =
    let input = Json_serializers.describe_location_fsx_ontap_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.DescribeLocationFsxOntap" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_fsx_ontap_response_of_yojson
      ~error_deserializer
end

module DescribeLocationFsxOpenZfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_location_fsx_open_zfs_request) =
    let input = Json_serializers.describe_location_fsx_open_zfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeLocationFsxOpenZfs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_fsx_open_zfs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_location_fsx_open_zfs_request) =
    let input = Json_serializers.describe_location_fsx_open_zfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.DescribeLocationFsxOpenZfs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_fsx_open_zfs_response_of_yojson
      ~error_deserializer
end

module DescribeLocationFsxWindows = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_location_fsx_windows_request) =
    let input = Json_serializers.describe_location_fsx_windows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeLocationFsxWindows"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_fsx_windows_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_location_fsx_windows_request) =
    let input = Json_serializers.describe_location_fsx_windows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.DescribeLocationFsxWindows" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_fsx_windows_response_of_yojson
      ~error_deserializer
end

module DescribeLocationHdfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_location_hdfs_request) =
    let input = Json_serializers.describe_location_hdfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeLocationHdfs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_hdfs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_location_hdfs_request) =
    let input = Json_serializers.describe_location_hdfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.DescribeLocationHdfs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_hdfs_response_of_yojson
      ~error_deserializer
end

module DescribeLocationNfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_location_nfs_request) =
    let input = Json_serializers.describe_location_nfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeLocationNfs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_nfs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_location_nfs_request) =
    let input = Json_serializers.describe_location_nfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.DescribeLocationNfs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_nfs_response_of_yojson
      ~error_deserializer
end

module DescribeLocationObjectStorage = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_location_object_storage_request) =
    let input = Json_serializers.describe_location_object_storage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeLocationObjectStorage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_object_storage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_location_object_storage_request) =
    let input = Json_serializers.describe_location_object_storage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.DescribeLocationObjectStorage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_object_storage_response_of_yojson
      ~error_deserializer
end

module DescribeLocationS3 = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_location_s3_request) =
    let input = Json_serializers.describe_location_s3_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeLocationS3" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_s3_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_location_s3_request) =
    let input = Json_serializers.describe_location_s3_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.DescribeLocationS3"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_s3_response_of_yojson
      ~error_deserializer
end

module DescribeLocationSmb = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_location_smb_request) =
    let input = Json_serializers.describe_location_smb_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeLocationSmb" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_smb_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_location_smb_request) =
    let input = Json_serializers.describe_location_smb_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.DescribeLocationSmb"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_location_smb_response_of_yojson
      ~error_deserializer
end

module DescribeTask = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_task_request) =
    let input = Json_serializers.describe_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeTask" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_task_request) =
    let input = Json_serializers.describe_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.DescribeTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_task_response_of_yojson ~error_deserializer
end

module DescribeTaskExecution = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_task_execution_request) =
    let input = Json_serializers.describe_task_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.DescribeTaskExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_task_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_task_execution_request) =
    let input = Json_serializers.describe_task_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.DescribeTaskExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_task_execution_response_of_yojson
      ~error_deserializer
end

module ListAgents = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_agents_request) =
    let input = Json_serializers.list_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.ListAgents" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_agents_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_agents_request) =
    let input = Json_serializers.list_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.ListAgents" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_agents_response_of_yojson
      ~error_deserializer
end

module ListLocations = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_locations_request) =
    let input = Json_serializers.list_locations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.ListLocations" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_locations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_locations_request) =
    let input = Json_serializers.list_locations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.ListLocations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_locations_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTaskExecutions = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_task_executions_request) =
    let input = Json_serializers.list_task_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.ListTaskExecutions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_task_executions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_task_executions_request) =
    let input = Json_serializers.list_task_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.ListTaskExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_task_executions_response_of_yojson
      ~error_deserializer
end

module ListTasks = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tasks_request) =
    let input = Json_serializers.list_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.ListTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tasks_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_tasks_request) =
    let input = Json_serializers.list_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.ListTasks" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tasks_response_of_yojson
      ~error_deserializer
end

module StartTaskExecution = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_task_execution_request) =
    let input = Json_serializers.start_task_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.StartTaskExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_task_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_task_execution_request) =
    let input = Json_serializers.start_task_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.StartTaskExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_task_execution_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateAgent = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_agent_request) =
    let input = Json_serializers.update_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateAgent" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_agent_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_agent_request) =
    let input = Json_serializers.update_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.UpdateAgent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_agent_response_of_yojson
      ~error_deserializer
end

module UpdateLocationAzureBlob = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_location_azure_blob_request) =
    let input = Json_serializers.update_location_azure_blob_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateLocationAzureBlob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_location_azure_blob_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_location_azure_blob_request) =
    let input = Json_serializers.update_location_azure_blob_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.UpdateLocationAzureBlob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_azure_blob_response_of_yojson
      ~error_deserializer
end

module UpdateLocationEfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_location_efs_request) =
    let input = Json_serializers.update_location_efs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateLocationEfs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_location_efs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_location_efs_request) =
    let input = Json_serializers.update_location_efs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.UpdateLocationEfs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_efs_response_of_yojson
      ~error_deserializer
end

module UpdateLocationFsxLustre = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_location_fsx_lustre_request) =
    let input = Json_serializers.update_location_fsx_lustre_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateLocationFsxLustre" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_location_fsx_lustre_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_location_fsx_lustre_request) =
    let input = Json_serializers.update_location_fsx_lustre_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.UpdateLocationFsxLustre" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_fsx_lustre_response_of_yojson
      ~error_deserializer
end

module UpdateLocationFsxOntap = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_location_fsx_ontap_request) =
    let input = Json_serializers.update_location_fsx_ontap_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateLocationFsxOntap" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_location_fsx_ontap_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_location_fsx_ontap_request) =
    let input = Json_serializers.update_location_fsx_ontap_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.UpdateLocationFsxOntap" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_fsx_ontap_response_of_yojson
      ~error_deserializer
end

module UpdateLocationFsxOpenZfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_location_fsx_open_zfs_request) =
    let input = Json_serializers.update_location_fsx_open_zfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateLocationFsxOpenZfs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_location_fsx_open_zfs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_location_fsx_open_zfs_request) =
    let input = Json_serializers.update_location_fsx_open_zfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.UpdateLocationFsxOpenZfs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_fsx_open_zfs_response_of_yojson
      ~error_deserializer
end

module UpdateLocationFsxWindows = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_location_fsx_windows_request) =
    let input = Json_serializers.update_location_fsx_windows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateLocationFsxWindows" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_location_fsx_windows_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_location_fsx_windows_request) =
    let input = Json_serializers.update_location_fsx_windows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.UpdateLocationFsxWindows" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_fsx_windows_response_of_yojson
      ~error_deserializer
end

module UpdateLocationHdfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_location_hdfs_request) =
    let input = Json_serializers.update_location_hdfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateLocationHdfs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_location_hdfs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_location_hdfs_request) =
    let input = Json_serializers.update_location_hdfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.UpdateLocationHdfs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_hdfs_response_of_yojson
      ~error_deserializer
end

module UpdateLocationNfs = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_location_nfs_request) =
    let input = Json_serializers.update_location_nfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateLocationNfs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_location_nfs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_location_nfs_request) =
    let input = Json_serializers.update_location_nfs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.UpdateLocationNfs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_nfs_response_of_yojson
      ~error_deserializer
end

module UpdateLocationObjectStorage = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_location_object_storage_request) =
    let input = Json_serializers.update_location_object_storage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateLocationObjectStorage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_object_storage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_location_object_storage_request) =
    let input = Json_serializers.update_location_object_storage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"FmrsService.UpdateLocationObjectStorage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_object_storage_response_of_yojson
      ~error_deserializer
end

module UpdateLocationS3 = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_location_s3_request) =
    let input = Json_serializers.update_location_s3_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateLocationS3" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_location_s3_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_location_s3_request) =
    let input = Json_serializers.update_location_s3_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.UpdateLocationS3"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_s3_response_of_yojson
      ~error_deserializer
end

module UpdateLocationSmb = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_location_smb_request) =
    let input = Json_serializers.update_location_smb_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateLocationSmb" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_location_smb_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_location_smb_request) =
    let input = Json_serializers.update_location_smb_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.UpdateLocationSmb"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_location_smb_response_of_yojson
      ~error_deserializer
end

module UpdateTask = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_task_request) =
    let input = Json_serializers.update_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateTask" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_task_request) =
    let input = Json_serializers.update_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.UpdateTask" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_task_response_of_yojson
      ~error_deserializer
end

module UpdateTaskExecution = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.datasync#InternalException"
    | `InvalidRequestException _ -> "com.amazonaws.datasync#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_task_execution_request) =
    let input = Json_serializers.update_task_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"FmrsService.UpdateTaskExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_task_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_task_execution_request) =
    let input = Json_serializers.update_task_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"FmrsService.UpdateTaskExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_task_execution_response_of_yojson
      ~error_deserializer
end
