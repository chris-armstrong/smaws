open Types
open Service_metadata

module GetAccountSettings = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_account_settings_request) =
    let input = Json_serializers.get_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetAccountSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_settings_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_account_settings_request) =
    let input = Json_serializers.get_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.GetAccountSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_settings_result_of_yojson
      ~error_deserializer
end

module GetDevice = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_device_request) =
    let input = Json_serializers.get_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetDevice" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_device_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_device_request) =
    let input = Json_serializers.get_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.GetDevice"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_device_result_of_yojson
      ~error_deserializer
end

module GetDeviceInstance = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_device_instance_request) =
    let input = Json_serializers.get_device_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetDeviceInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_device_instance_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_device_instance_request) =
    let input = Json_serializers.get_device_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.GetDeviceInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_device_instance_result_of_yojson
      ~error_deserializer
end

module GetDevicePool = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_device_pool_request) =
    let input = Json_serializers.get_device_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetDevicePool" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_device_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_device_pool_request) =
    let input = Json_serializers.get_device_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.GetDevicePool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_device_pool_result_of_yojson ~error_deserializer
end

module GetDevicePoolCompatibility = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_device_pool_compatibility_request) =
    let input = Json_serializers.get_device_pool_compatibility_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetDevicePoolCompatibility"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_device_pool_compatibility_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_device_pool_compatibility_request) =
    let input = Json_serializers.get_device_pool_compatibility_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.GetDevicePoolCompatibility" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_device_pool_compatibility_result_of_yojson
      ~error_deserializer
end

module GetInstanceProfile = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instance_profile_request) =
    let input = Json_serializers.get_instance_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetInstanceProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_instance_profile_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_instance_profile_request) =
    let input = Json_serializers.get_instance_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.GetInstanceProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_instance_profile_result_of_yojson
      ~error_deserializer
end

module GetJob = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_job_request) =
    let input = Json_serializers.get_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_job_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_job_request) =
    let input = Json_serializers.get_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.GetJob"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_job_result_of_yojson
      ~error_deserializer
end

module GetNetworkProfile = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_network_profile_request) =
    let input = Json_serializers.get_network_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetNetworkProfile" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_network_profile_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_network_profile_request) =
    let input = Json_serializers.get_network_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.GetNetworkProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_network_profile_result_of_yojson
      ~error_deserializer
end

module GetOfferingStatus = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotEligibleException _ -> "com.amazonaws.devicefarm#NotEligibleException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotEligibleException" ->
          `NotEligibleException (Json_deserializers.not_eligible_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_offering_status_request) =
    let input = Json_serializers.get_offering_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetOfferingStatus" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_offering_status_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_offering_status_request) =
    let input = Json_serializers.get_offering_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.GetOfferingStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_offering_status_result_of_yojson
      ~error_deserializer
end

module GetProject = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_project_request) =
    let input = Json_serializers.get_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetProject" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_project_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_project_request) =
    let input = Json_serializers.get_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.GetProject"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_project_result_of_yojson
      ~error_deserializer
end

module GetRemoteAccessSession = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_remote_access_session_request) =
    let input = Json_serializers.get_remote_access_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetRemoteAccessSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_remote_access_session_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_remote_access_session_request) =
    let input = Json_serializers.get_remote_access_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.GetRemoteAccessSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_remote_access_session_result_of_yojson
      ~error_deserializer
end

module GetRun = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_run_request) =
    let input = Json_serializers.get_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetRun" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_run_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_run_request) =
    let input = Json_serializers.get_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.GetRun"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_run_result_of_yojson
      ~error_deserializer
end

module GetSuite = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_suite_request) =
    let input = Json_serializers.get_suite_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetSuite" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_suite_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_suite_request) =
    let input = Json_serializers.get_suite_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.GetSuite"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_suite_result_of_yojson
      ~error_deserializer
end

module GetTest = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_test_request) =
    let input = Json_serializers.get_test_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetTest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_test_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_test_request) =
    let input = Json_serializers.get_test_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.GetTest"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_test_result_of_yojson
      ~error_deserializer
end

module GetTestGridProject = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `InternalServiceException _ -> "com.amazonaws.devicefarm#InternalServiceException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_test_grid_project_request) =
    let input = Json_serializers.get_test_grid_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetTestGridProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_test_grid_project_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_test_grid_project_request) =
    let input = Json_serializers.get_test_grid_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.GetTestGridProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_test_grid_project_result_of_yojson
      ~error_deserializer
end

module GetTestGridSession = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `InternalServiceException _ -> "com.amazonaws.devicefarm#InternalServiceException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_test_grid_session_request) =
    let input = Json_serializers.get_test_grid_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetTestGridSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_test_grid_session_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_test_grid_session_request) =
    let input = Json_serializers.get_test_grid_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.GetTestGridSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_test_grid_session_result_of_yojson
      ~error_deserializer
end

module GetUpload = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_upload_request) =
    let input = Json_serializers.get_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetUpload" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_upload_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_upload_request) =
    let input = Json_serializers.get_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.GetUpload"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_upload_result_of_yojson
      ~error_deserializer
end

module GetVPCEConfiguration = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_vpce_configuration_request) =
    let input = Json_serializers.get_vpce_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.GetVPCEConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_vpce_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_vpce_configuration_request) =
    let input = Json_serializers.get_vpce_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.GetVPCEConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_vpce_configuration_result_of_yojson
      ~error_deserializer
end

module InstallToRemoteAccessSession = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : install_to_remote_access_session_request) =
    let input = Json_serializers.install_to_remote_access_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DeviceFarm_20150623.InstallToRemoteAccessSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.install_to_remote_access_session_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : install_to_remote_access_session_request) =
    let input = Json_serializers.install_to_remote_access_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.InstallToRemoteAccessSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.install_to_remote_access_session_result_of_yojson
      ~error_deserializer
end

module ListArtifacts = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_artifacts_request) =
    let input = Json_serializers.list_artifacts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListArtifacts" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_artifacts_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_artifacts_request) =
    let input = Json_serializers.list_artifacts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListArtifacts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_artifacts_result_of_yojson ~error_deserializer
end

module ListDeviceInstances = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_device_instances_request) =
    let input = Json_serializers.list_device_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListDeviceInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_device_instances_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_device_instances_request) =
    let input = Json_serializers.list_device_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListDeviceInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_device_instances_result_of_yojson
      ~error_deserializer
end

module ListDevicePools = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_device_pools_request) =
    let input = Json_serializers.list_device_pools_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListDevicePools" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_device_pools_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_device_pools_request) =
    let input = Json_serializers.list_device_pools_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListDevicePools" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_device_pools_result_of_yojson ~error_deserializer
end

module ListDevices = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_devices_request) =
    let input = Json_serializers.list_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListDevices" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_devices_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_devices_request) =
    let input = Json_serializers.list_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.ListDevices"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_devices_result_of_yojson
      ~error_deserializer
end

module ListInstanceProfiles = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_instance_profiles_request) =
    let input = Json_serializers.list_instance_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListInstanceProfiles"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_instance_profiles_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_instance_profiles_request) =
    let input = Json_serializers.list_instance_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListInstanceProfiles" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_instance_profiles_result_of_yojson
      ~error_deserializer
end

module ListJobs = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_jobs_request) =
    let input = Json_serializers.list_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListJobs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_jobs_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_jobs_request) =
    let input = Json_serializers.list_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.ListJobs"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_jobs_result_of_yojson
      ~error_deserializer
end

module ListNetworkProfiles = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_network_profiles_request) =
    let input = Json_serializers.list_network_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListNetworkProfiles"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_network_profiles_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_network_profiles_request) =
    let input = Json_serializers.list_network_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListNetworkProfiles" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_network_profiles_result_of_yojson
      ~error_deserializer
end

module ListOfferingPromotions = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotEligibleException _ -> "com.amazonaws.devicefarm#NotEligibleException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotEligibleException" ->
          `NotEligibleException (Json_deserializers.not_eligible_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_offering_promotions_request) =
    let input = Json_serializers.list_offering_promotions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListOfferingPromotions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_offering_promotions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_offering_promotions_request) =
    let input = Json_serializers.list_offering_promotions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListOfferingPromotions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_offering_promotions_result_of_yojson
      ~error_deserializer
end

module ListOfferings = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotEligibleException _ -> "com.amazonaws.devicefarm#NotEligibleException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotEligibleException" ->
          `NotEligibleException (Json_deserializers.not_eligible_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_offerings_request) =
    let input = Json_serializers.list_offerings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListOfferings" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_offerings_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_offerings_request) =
    let input = Json_serializers.list_offerings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListOfferings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_offerings_result_of_yojson ~error_deserializer
end

module ListOfferingTransactions = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotEligibleException _ -> "com.amazonaws.devicefarm#NotEligibleException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotEligibleException" ->
          `NotEligibleException (Json_deserializers.not_eligible_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_offering_transactions_request) =
    let input = Json_serializers.list_offering_transactions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListOfferingTransactions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_offering_transactions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_offering_transactions_request) =
    let input = Json_serializers.list_offering_transactions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListOfferingTransactions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_offering_transactions_result_of_yojson
      ~error_deserializer
end

module ListProjects = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_projects_request) =
    let input = Json_serializers.list_projects_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListProjects" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_projects_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_projects_request) =
    let input = Json_serializers.list_projects_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.ListProjects"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_projects_result_of_yojson ~error_deserializer
end

module ListRemoteAccessSessions = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_remote_access_sessions_request) =
    let input = Json_serializers.list_remote_access_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListRemoteAccessSessions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_remote_access_sessions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_remote_access_sessions_request) =
    let input = Json_serializers.list_remote_access_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListRemoteAccessSessions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_remote_access_sessions_result_of_yojson
      ~error_deserializer
end

module ListRuns = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_runs_request) =
    let input = Json_serializers.list_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListRuns" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_runs_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_runs_request) =
    let input = Json_serializers.list_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.ListRuns"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_runs_result_of_yojson
      ~error_deserializer
end

module ListSamples = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_samples_request) =
    let input = Json_serializers.list_samples_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListSamples" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_samples_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_samples_request) =
    let input = Json_serializers.list_samples_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.ListSamples"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_samples_result_of_yojson
      ~error_deserializer
end

module ListSuites = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_suites_request) =
    let input = Json_serializers.list_suites_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListSuites" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_suites_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_suites_request) =
    let input = Json_serializers.list_suites_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.ListSuites"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_suites_result_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `TagOperationException _ -> "com.amazonaws.devicefarm#TagOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TagOperationException" ->
          `TagOperationException (Json_deserializers.tag_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTestGridProjects = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `InternalServiceException _ -> "com.amazonaws.devicefarm#InternalServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_test_grid_projects_request) =
    let input = Json_serializers.list_test_grid_projects_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListTestGridProjects"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_test_grid_projects_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_test_grid_projects_request) =
    let input = Json_serializers.list_test_grid_projects_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListTestGridProjects" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_test_grid_projects_result_of_yojson
      ~error_deserializer
end

module ListTestGridSessionActions = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `InternalServiceException _ -> "com.amazonaws.devicefarm#InternalServiceException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_test_grid_session_actions_request) =
    let input = Json_serializers.list_test_grid_session_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListTestGridSessionActions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_test_grid_session_actions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_test_grid_session_actions_request) =
    let input = Json_serializers.list_test_grid_session_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListTestGridSessionActions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_test_grid_session_actions_result_of_yojson
      ~error_deserializer
end

module ListTestGridSessionArtifacts = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `InternalServiceException _ -> "com.amazonaws.devicefarm#InternalServiceException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_test_grid_session_artifacts_request) =
    let input = Json_serializers.list_test_grid_session_artifacts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DeviceFarm_20150623.ListTestGridSessionArtifacts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_test_grid_session_artifacts_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_test_grid_session_artifacts_request) =
    let input = Json_serializers.list_test_grid_session_artifacts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListTestGridSessionArtifacts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_test_grid_session_artifacts_result_of_yojson
      ~error_deserializer
end

module ListTestGridSessions = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `InternalServiceException _ -> "com.amazonaws.devicefarm#InternalServiceException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_test_grid_sessions_request) =
    let input = Json_serializers.list_test_grid_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListTestGridSessions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_test_grid_sessions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_test_grid_sessions_request) =
    let input = Json_serializers.list_test_grid_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListTestGridSessions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_test_grid_sessions_result_of_yojson
      ~error_deserializer
end

module ListTests = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tests_request) =
    let input = Json_serializers.list_tests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListTests" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tests_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tests_request) =
    let input = Json_serializers.list_tests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.ListTests"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_tests_result_of_yojson
      ~error_deserializer
end

module ListUniqueProblems = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_unique_problems_request) =
    let input = Json_serializers.list_unique_problems_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListUniqueProblems"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_unique_problems_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_unique_problems_request) =
    let input = Json_serializers.list_unique_problems_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListUniqueProblems" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_unique_problems_result_of_yojson
      ~error_deserializer
end

module ListUploads = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_uploads_request) =
    let input = Json_serializers.list_uploads_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListUploads" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_uploads_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_uploads_request) =
    let input = Json_serializers.list_uploads_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.ListUploads"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_uploads_result_of_yojson
      ~error_deserializer
end

module ListVPCEConfigurations = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_vpce_configurations_request) =
    let input = Json_serializers.list_vpce_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ListVPCEConfigurations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_vpce_configurations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_vpce_configurations_request) =
    let input = Json_serializers.list_vpce_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.ListVPCEConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_vpce_configurations_result_of_yojson
      ~error_deserializer
end

module PurchaseOffering = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotEligibleException _ -> "com.amazonaws.devicefarm#NotEligibleException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotEligibleException" ->
          `NotEligibleException (Json_deserializers.not_eligible_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : purchase_offering_request) =
    let input = Json_serializers.purchase_offering_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.PurchaseOffering" ~service
      ~context ~input ~output_deserializer:Json_deserializers.purchase_offering_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : purchase_offering_request) =
    let input = Json_serializers.purchase_offering_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.PurchaseOffering" ~service ~context ~input
      ~output_deserializer:Json_deserializers.purchase_offering_result_of_yojson ~error_deserializer
end

module RenewOffering = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotEligibleException _ -> "com.amazonaws.devicefarm#NotEligibleException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotEligibleException" ->
          `NotEligibleException (Json_deserializers.not_eligible_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : renew_offering_request) =
    let input = Json_serializers.renew_offering_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.RenewOffering" ~service
      ~context ~input ~output_deserializer:Json_deserializers.renew_offering_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : renew_offering_request) =
    let input = Json_serializers.renew_offering_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.RenewOffering" ~service ~context ~input
      ~output_deserializer:Json_deserializers.renew_offering_result_of_yojson ~error_deserializer
end

module ScheduleRun = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `IdempotencyException _ -> "com.amazonaws.devicefarm#IdempotencyException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "IdempotencyException" ->
          `IdempotencyException (Json_deserializers.idempotency_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : schedule_run_request) =
    let input = Json_serializers.schedule_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.ScheduleRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.schedule_run_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : schedule_run_request) =
    let input = Json_serializers.schedule_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.ScheduleRun"
      ~service ~context ~input ~output_deserializer:Json_deserializers.schedule_run_result_of_yojson
      ~error_deserializer
end

module StopJob = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_job_request) =
    let input = Json_serializers.stop_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.StopJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_job_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : stop_job_request) =
    let input = Json_serializers.stop_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.StopJob"
      ~service ~context ~input ~output_deserializer:Json_deserializers.stop_job_result_of_yojson
      ~error_deserializer
end

module StopRemoteAccessSession = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_remote_access_session_request) =
    let input = Json_serializers.stop_remote_access_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.StopRemoteAccessSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_remote_access_session_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_remote_access_session_request) =
    let input = Json_serializers.stop_remote_access_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.StopRemoteAccessSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_remote_access_session_result_of_yojson
      ~error_deserializer
end

module StopRun = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_run_request) =
    let input = Json_serializers.stop_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.StopRun" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_run_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : stop_run_request) =
    let input = Json_serializers.stop_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.StopRun"
      ~service ~context ~input ~output_deserializer:Json_deserializers.stop_run_result_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `TagOperationException _ -> "com.amazonaws.devicefarm#TagOperationException"
    | `TagPolicyException _ -> "com.amazonaws.devicefarm#TagPolicyException"
    | `TooManyTagsException _ -> "com.amazonaws.devicefarm#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TagOperationException" ->
          `TagOperationException (Json_deserializers.tag_operation_exception_of_yojson tree path)
      | _, "TagPolicyException" ->
          `TagPolicyException (Json_deserializers.tag_policy_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `TagOperationException _ -> "com.amazonaws.devicefarm#TagOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TagOperationException" ->
          `TagOperationException (Json_deserializers.tag_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateDeviceInstance = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_device_instance_request) =
    let input = Json_serializers.update_device_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.UpdateDeviceInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_device_instance_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_device_instance_request) =
    let input = Json_serializers.update_device_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.UpdateDeviceInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_device_instance_result_of_yojson
      ~error_deserializer
end

module UpdateDevicePool = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_device_pool_request) =
    let input = Json_serializers.update_device_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.UpdateDevicePool" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_device_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_device_pool_request) =
    let input = Json_serializers.update_device_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.UpdateDevicePool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_device_pool_result_of_yojson
      ~error_deserializer
end

module UpdateInstanceProfile = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_instance_profile_request) =
    let input = Json_serializers.update_instance_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.UpdateInstanceProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_instance_profile_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_instance_profile_request) =
    let input = Json_serializers.update_instance_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.UpdateInstanceProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_instance_profile_result_of_yojson
      ~error_deserializer
end

module UpdateNetworkProfile = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_network_profile_request) =
    let input = Json_serializers.update_network_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.UpdateNetworkProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_network_profile_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_network_profile_request) =
    let input = Json_serializers.update_network_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.UpdateNetworkProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_network_profile_result_of_yojson
      ~error_deserializer
end

module UpdateProject = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_project_request) =
    let input = Json_serializers.update_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.UpdateProject" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_project_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_project_request) =
    let input = Json_serializers.update_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.UpdateProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_project_result_of_yojson ~error_deserializer
end

module UpdateTestGridProject = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `InternalServiceException _ -> "com.amazonaws.devicefarm#InternalServiceException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_test_grid_project_request) =
    let input = Json_serializers.update_test_grid_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.UpdateTestGridProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_test_grid_project_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_test_grid_project_request) =
    let input = Json_serializers.update_test_grid_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.UpdateTestGridProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_test_grid_project_result_of_yojson
      ~error_deserializer
end

module UpdateUpload = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_upload_request) =
    let input = Json_serializers.update_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.UpdateUpload" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_upload_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_upload_request) =
    let input = Json_serializers.update_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.UpdateUpload"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_upload_result_of_yojson ~error_deserializer
end

module UpdateVPCEConfiguration = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `InvalidOperationException _ -> "com.amazonaws.devicefarm#InvalidOperationException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_vpce_configuration_request) =
    let input = Json_serializers.update_vpce_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.UpdateVPCEConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_vpce_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_vpce_configuration_request) =
    let input = Json_serializers.update_vpce_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.UpdateVPCEConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_vpce_configuration_result_of_yojson
      ~error_deserializer
end

module DeleteVPCEConfiguration = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `InvalidOperationException _ -> "com.amazonaws.devicefarm#InvalidOperationException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_vpce_configuration_request) =
    let input = Json_serializers.delete_vpce_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.DeleteVPCEConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_vpce_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_vpce_configuration_request) =
    let input = Json_serializers.delete_vpce_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.DeleteVPCEConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_vpce_configuration_result_of_yojson
      ~error_deserializer
end

module DeleteUpload = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_upload_request) =
    let input = Json_serializers.delete_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.DeleteUpload" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_upload_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_upload_request) =
    let input = Json_serializers.delete_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.DeleteUpload"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_upload_result_of_yojson ~error_deserializer
end

module DeleteTestGridProject = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `CannotDeleteException _ -> "com.amazonaws.devicefarm#CannotDeleteException"
    | `InternalServiceException _ -> "com.amazonaws.devicefarm#InternalServiceException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "CannotDeleteException" ->
          `CannotDeleteException (Json_deserializers.cannot_delete_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_test_grid_project_request) =
    let input = Json_serializers.delete_test_grid_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.DeleteTestGridProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_test_grid_project_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_test_grid_project_request) =
    let input = Json_serializers.delete_test_grid_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.DeleteTestGridProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_test_grid_project_result_of_yojson
      ~error_deserializer
end

module DeleteRun = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_run_request) =
    let input = Json_serializers.delete_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.DeleteRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_run_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_run_request) =
    let input = Json_serializers.delete_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.DeleteRun"
      ~service ~context ~input ~output_deserializer:Json_deserializers.delete_run_result_of_yojson
      ~error_deserializer
end

module DeleteRemoteAccessSession = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_remote_access_session_request) =
    let input = Json_serializers.delete_remote_access_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.DeleteRemoteAccessSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_remote_access_session_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_remote_access_session_request) =
    let input = Json_serializers.delete_remote_access_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.DeleteRemoteAccessSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_remote_access_session_result_of_yojson
      ~error_deserializer
end

module DeleteProject = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_project_request) =
    let input = Json_serializers.delete_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.DeleteProject" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_project_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_project_request) =
    let input = Json_serializers.delete_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.DeleteProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_project_result_of_yojson ~error_deserializer
end

module DeleteNetworkProfile = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_network_profile_request) =
    let input = Json_serializers.delete_network_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.DeleteNetworkProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_network_profile_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_network_profile_request) =
    let input = Json_serializers.delete_network_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.DeleteNetworkProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_network_profile_result_of_yojson
      ~error_deserializer
end

module DeleteInstanceProfile = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_instance_profile_request) =
    let input = Json_serializers.delete_instance_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.DeleteInstanceProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_instance_profile_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_instance_profile_request) =
    let input = Json_serializers.delete_instance_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.DeleteInstanceProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_instance_profile_result_of_yojson
      ~error_deserializer
end

module DeleteDevicePool = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_device_pool_request) =
    let input = Json_serializers.delete_device_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.DeleteDevicePool" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_device_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_device_pool_request) =
    let input = Json_serializers.delete_device_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.DeleteDevicePool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_device_pool_result_of_yojson
      ~error_deserializer
end

module CreateVPCEConfiguration = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_vpce_configuration_request) =
    let input = Json_serializers.create_vpce_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.CreateVPCEConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_vpce_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_vpce_configuration_request) =
    let input = Json_serializers.create_vpce_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.CreateVPCEConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_vpce_configuration_result_of_yojson
      ~error_deserializer
end

module CreateUpload = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_upload_request) =
    let input = Json_serializers.create_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.CreateUpload" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_upload_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_upload_request) =
    let input = Json_serializers.create_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DeviceFarm_20150623.CreateUpload"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_upload_result_of_yojson ~error_deserializer
end

module CreateTestGridUrl = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `InternalServiceException _ -> "com.amazonaws.devicefarm#InternalServiceException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_test_grid_url_request) =
    let input = Json_serializers.create_test_grid_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.CreateTestGridUrl" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_test_grid_url_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_test_grid_url_request) =
    let input = Json_serializers.create_test_grid_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.CreateTestGridUrl" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_test_grid_url_result_of_yojson
      ~error_deserializer
end

module CreateTestGridProject = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `InternalServiceException _ -> "com.amazonaws.devicefarm#InternalServiceException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_test_grid_project_request) =
    let input = Json_serializers.create_test_grid_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.CreateTestGridProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_test_grid_project_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_test_grid_project_request) =
    let input = Json_serializers.create_test_grid_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.CreateTestGridProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_test_grid_project_result_of_yojson
      ~error_deserializer
end

module CreateRemoteAccessSession = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_remote_access_session_request) =
    let input = Json_serializers.create_remote_access_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.CreateRemoteAccessSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_remote_access_session_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_remote_access_session_request) =
    let input = Json_serializers.create_remote_access_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.CreateRemoteAccessSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_remote_access_session_result_of_yojson
      ~error_deserializer
end

module CreateProject = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | `TagOperationException _ -> "com.amazonaws.devicefarm#TagOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _, "TagOperationException" ->
          `TagOperationException (Json_deserializers.tag_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_project_request) =
    let input = Json_serializers.create_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.CreateProject" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_project_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_project_request) =
    let input = Json_serializers.create_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.CreateProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_project_result_of_yojson ~error_deserializer
end

module CreateNetworkProfile = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_network_profile_request) =
    let input = Json_serializers.create_network_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.CreateNetworkProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_network_profile_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_network_profile_request) =
    let input = Json_serializers.create_network_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.CreateNetworkProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_network_profile_result_of_yojson
      ~error_deserializer
end

module CreateInstanceProfile = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_instance_profile_request) =
    let input = Json_serializers.create_instance_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.CreateInstanceProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_instance_profile_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_instance_profile_request) =
    let input = Json_serializers.create_instance_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.CreateInstanceProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_instance_profile_result_of_yojson
      ~error_deserializer
end

module CreateDevicePool = struct
  let error_to_string = function
    | `ArgumentException _ -> "com.amazonaws.devicefarm#ArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.devicefarm#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.devicefarm#NotFoundException"
    | `ServiceAccountException _ -> "com.amazonaws.devicefarm#ServiceAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArgumentException" ->
          `ArgumentException (Json_deserializers.argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceAccountException" ->
          `ServiceAccountException
            (Json_deserializers.service_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_device_pool_request) =
    let input = Json_serializers.create_device_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DeviceFarm_20150623.CreateDevicePool" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_device_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_device_pool_request) =
    let input = Json_serializers.create_device_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DeviceFarm_20150623.CreateDevicePool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_device_pool_result_of_yojson
      ~error_deserializer
end
