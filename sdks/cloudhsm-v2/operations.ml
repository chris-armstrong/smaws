open Types
open Service_metadata

module CopyBackupToRegion = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | `CloudHsmTagException _ -> "com.amazonaws.cloudhsmv2#CloudHsmTagException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "CloudHsmTagException" ->
          `CloudHsmTagException (Json_deserializers.cloud_hsm_tag_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : copy_backup_to_region_request) =
    let input = Json_serializers.copy_backup_to_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.CopyBackupToRegion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.copy_backup_to_region_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : copy_backup_to_region_request) =
    let input = Json_serializers.copy_backup_to_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"BaldrApiService.CopyBackupToRegion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.copy_backup_to_region_response_of_yojson
      ~error_deserializer
end

module CreateCluster = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | `CloudHsmTagException _ -> "com.amazonaws.cloudhsmv2#CloudHsmTagException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "CloudHsmTagException" ->
          `CloudHsmTagException (Json_deserializers.cloud_hsm_tag_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_cluster_request) =
    let input = Json_serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.CreateCluster" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_cluster_request) =
    let input = Json_serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.CreateCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson ~error_deserializer
end

module CreateHsm = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_hsm_request) =
    let input = Json_serializers.create_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.CreateHsm" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_hsm_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_hsm_request) =
    let input = Json_serializers.create_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.CreateHsm"
      ~service ~context ~input ~output_deserializer:Json_deserializers.create_hsm_response_of_yojson
      ~error_deserializer
end

module DeleteBackup = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_backup_request) =
    let input = Json_serializers.delete_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.DeleteBackup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_backup_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_backup_request) =
    let input = Json_serializers.delete_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.DeleteBackup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_backup_response_of_yojson ~error_deserializer
end

module DeleteCluster = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | `CloudHsmTagException _ -> "com.amazonaws.cloudhsmv2#CloudHsmTagException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "CloudHsmTagException" ->
          `CloudHsmTagException (Json_deserializers.cloud_hsm_tag_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cluster_request) =
    let input = Json_serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.DeleteCluster" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_cluster_request) =
    let input = Json_serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.DeleteCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson ~error_deserializer
end

module DeleteHsm = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_hsm_request) =
    let input = Json_serializers.delete_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.DeleteHsm" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_hsm_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_hsm_request) =
    let input = Json_serializers.delete_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.DeleteHsm"
      ~service ~context ~input ~output_deserializer:Json_deserializers.delete_hsm_response_of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.DeleteResourcePolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"BaldrApiService.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer
end

module DescribeBackups = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | `CloudHsmTagException _ -> "com.amazonaws.cloudhsmv2#CloudHsmTagException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "CloudHsmTagException" ->
          `CloudHsmTagException (Json_deserializers.cloud_hsm_tag_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_backups_request) =
    let input = Json_serializers.describe_backups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.DescribeBackups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_backups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_backups_request) =
    let input = Json_serializers.describe_backups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.DescribeBackups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_backups_response_of_yojson
      ~error_deserializer
end

module DescribeClusters = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | `CloudHsmTagException _ -> "com.amazonaws.cloudhsmv2#CloudHsmTagException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "CloudHsmTagException" ->
          `CloudHsmTagException (Json_deserializers.cloud_hsm_tag_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_clusters_request) =
    let input = Json_serializers.describe_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.DescribeClusters" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_clusters_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_clusters_request) =
    let input = Json_serializers.describe_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.DescribeClusters"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_clusters_response_of_yojson
      ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.GetResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"BaldrApiService.GetResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer
end

module InitializeCluster = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : initialize_cluster_request) =
    let input = Json_serializers.initialize_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.InitializeCluster" ~service
      ~context ~input ~output_deserializer:Json_deserializers.initialize_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : initialize_cluster_request) =
    let input = Json_serializers.initialize_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"BaldrApiService.InitializeCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.initialize_cluster_response_of_yojson
      ~error_deserializer
end

module ListTags = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | `CloudHsmTagException _ -> "com.amazonaws.cloudhsmv2#CloudHsmTagException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "CloudHsmTagException" ->
          `CloudHsmTagException (Json_deserializers.cloud_hsm_tag_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_request) =
    let input = Json_serializers.list_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.ListTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_request) =
    let input = Json_serializers.list_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.ListTags"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_tags_response_of_yojson
      ~error_deserializer
end

module ModifyBackupAttributes = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_backup_attributes_request) =
    let input = Json_serializers.modify_backup_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.ModifyBackupAttributes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_backup_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_backup_attributes_request) =
    let input = Json_serializers.modify_backup_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"BaldrApiService.ModifyBackupAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_backup_attributes_response_of_yojson
      ~error_deserializer
end

module ModifyCluster = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_cluster_request) =
    let input = Json_serializers.modify_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.ModifyCluster" ~service
      ~context ~input ~output_deserializer:Json_deserializers.modify_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_cluster_request) =
    let input = Json_serializers.modify_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.ModifyCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_cluster_response_of_yojson ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.PutResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"BaldrApiService.PutResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module RestoreBackup = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_backup_request) =
    let input = Json_serializers.restore_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.RestoreBackup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.restore_backup_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : restore_backup_request) =
    let input = Json_serializers.restore_backup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.RestoreBackup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_backup_response_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceLimitExceededException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceLimitExceededException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | `CloudHsmTagException _ -> "com.amazonaws.cloudhsmv2#CloudHsmTagException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceLimitExceededException" ->
          `CloudHsmResourceLimitExceededException
            (Json_deserializers.cloud_hsm_resource_limit_exceeded_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "CloudHsmTagException" ->
          `CloudHsmTagException (Json_deserializers.cloud_hsm_tag_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `CloudHsmAccessDeniedException _ -> "com.amazonaws.cloudhsmv2#CloudHsmAccessDeniedException"
    | `CloudHsmInternalFailureException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInternalFailureException"
    | `CloudHsmInvalidRequestException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmInvalidRequestException"
    | `CloudHsmResourceNotFoundException _ ->
        "com.amazonaws.cloudhsmv2#CloudHsmResourceNotFoundException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsmv2#CloudHsmServiceException"
    | `CloudHsmTagException _ -> "com.amazonaws.cloudhsmv2#CloudHsmTagException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmAccessDeniedException" ->
          `CloudHsmAccessDeniedException
            (Json_deserializers.cloud_hsm_access_denied_exception_of_yojson tree path)
      | _, "CloudHsmInternalFailureException" ->
          `CloudHsmInternalFailureException
            (Json_deserializers.cloud_hsm_internal_failure_exception_of_yojson tree path)
      | _, "CloudHsmInvalidRequestException" ->
          `CloudHsmInvalidRequestException
            (Json_deserializers.cloud_hsm_invalid_request_exception_of_yojson tree path)
      | _, "CloudHsmResourceNotFoundException" ->
          `CloudHsmResourceNotFoundException
            (Json_deserializers.cloud_hsm_resource_not_found_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "CloudHsmTagException" ->
          `CloudHsmTagException (Json_deserializers.cloud_hsm_tag_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BaldrApiService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"BaldrApiService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end
