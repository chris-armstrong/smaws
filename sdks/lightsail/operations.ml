open Types
open Service_metadata

module AllocateStaticIp = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : allocate_static_ip_request) =
    let input = Json_serializers.allocate_static_ip_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.AllocateStaticIp" ~service
      ~context ~input ~output_deserializer:Json_deserializers.allocate_static_ip_result_of_yojson
      ~error_deserializer
end

module AttachCertificateToDistribution = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : attach_certificate_to_distribution_request) =
    let input = Json_serializers.attach_certificate_to_distribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.AttachCertificateToDistribution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.attach_certificate_to_distribution_result_of_yojson
      ~error_deserializer
end

module AttachDisk = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : attach_disk_request) =
    let input = Json_serializers.attach_disk_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.AttachDisk" ~service
      ~context ~input ~output_deserializer:Json_deserializers.attach_disk_result_of_yojson
      ~error_deserializer
end

module AttachInstancesToLoadBalancer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : attach_instances_to_load_balancer_request) =
    let input = Json_serializers.attach_instances_to_load_balancer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.AttachInstancesToLoadBalancer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.attach_instances_to_load_balancer_result_of_yojson
      ~error_deserializer
end

module AttachLoadBalancerTlsCertificate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : attach_load_balancer_tls_certificate_request) =
    let input = Json_serializers.attach_load_balancer_tls_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.AttachLoadBalancerTlsCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.attach_load_balancer_tls_certificate_result_of_yojson
      ~error_deserializer
end

module AttachStaticIp = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : attach_static_ip_request) =
    let input = Json_serializers.attach_static_ip_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.AttachStaticIp" ~service
      ~context ~input ~output_deserializer:Json_deserializers.attach_static_ip_result_of_yojson
      ~error_deserializer
end

module CloseInstancePublicPorts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : close_instance_public_ports_request) =
    let input = Json_serializers.close_instance_public_ports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CloseInstancePublicPorts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.close_instance_public_ports_result_of_yojson
      ~error_deserializer
end

module CopySnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : copy_snapshot_request) =
    let input = Json_serializers.copy_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CopySnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.copy_snapshot_result_of_yojson
      ~error_deserializer
end

module CreateBucket = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_bucket_request) =
    let input = Json_serializers.create_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateBucket" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_bucket_result_of_yojson
      ~error_deserializer
end

module CreateBucketAccessKey = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_bucket_access_key_request) =
    let input = Json_serializers.create_bucket_access_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateBucketAccessKey"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_bucket_access_key_result_of_yojson
      ~error_deserializer
end

module CreateCertificate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_certificate_request) =
    let input = Json_serializers.create_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_certificate_result_of_yojson
      ~error_deserializer
end

module CreateCloudFormationStack = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_cloud_formation_stack_request) =
    let input = Json_serializers.create_cloud_formation_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateCloudFormationStack"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cloud_formation_stack_result_of_yojson
      ~error_deserializer
end

module CreateContactMethod = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_contact_method_request) =
    let input = Json_serializers.create_contact_method_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateContactMethod"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_contact_method_result_of_yojson
      ~error_deserializer
end

module CreateContainerService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_container_service_request) =
    let input = Json_serializers.create_container_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateContainerService"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_container_service_result_of_yojson
      ~error_deserializer
end

module CreateContainerServiceDeployment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_container_service_deployment_request) =
    let input = Json_serializers.create_container_service_deployment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.CreateContainerServiceDeployment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_container_service_deployment_result_of_yojson
      ~error_deserializer
end

module CreateContainerServiceRegistryLogin = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_container_service_registry_login_request) =
    let input =
      Json_serializers.create_container_service_registry_login_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.CreateContainerServiceRegistryLogin" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_container_service_registry_login_result_of_yojson
      ~error_deserializer
end

module CreateDisk = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_disk_request) =
    let input = Json_serializers.create_disk_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateDisk" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_disk_result_of_yojson
      ~error_deserializer
end

module CreateDiskFromSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_disk_from_snapshot_request) =
    let input = Json_serializers.create_disk_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateDiskFromSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_disk_from_snapshot_result_of_yojson
      ~error_deserializer
end

module CreateDiskSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_disk_snapshot_request) =
    let input = Json_serializers.create_disk_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateDiskSnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_disk_snapshot_result_of_yojson
      ~error_deserializer
end

module CreateDistribution = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_distribution_request) =
    let input = Json_serializers.create_distribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateDistribution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_distribution_result_of_yojson
      ~error_deserializer
end

module CreateDomain = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_domain_request) =
    let input = Json_serializers.create_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_domain_result_of_yojson
      ~error_deserializer
end

module CreateDomainEntry = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_domain_entry_request) =
    let input = Json_serializers.create_domain_entry_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateDomainEntry" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_domain_entry_result_of_yojson
      ~error_deserializer
end

module CreateGUISessionAccessDetails = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_gui_session_access_details_request) =
    let input = Json_serializers.create_gui_session_access_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.CreateGUISessionAccessDetails" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_gui_session_access_details_result_of_yojson
      ~error_deserializer
end

module CreateInstances = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_instances_request) =
    let input = Json_serializers.create_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateInstances" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_instances_result_of_yojson
      ~error_deserializer
end

module CreateInstancesFromSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_instances_from_snapshot_request) =
    let input = Json_serializers.create_instances_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateInstancesFromSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_instances_from_snapshot_result_of_yojson
      ~error_deserializer
end

module CreateInstanceSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_instance_snapshot_request) =
    let input = Json_serializers.create_instance_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateInstanceSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_instance_snapshot_result_of_yojson
      ~error_deserializer
end

module CreateKeyPair = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_key_pair_request) =
    let input = Json_serializers.create_key_pair_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateKeyPair" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_key_pair_result_of_yojson
      ~error_deserializer
end

module CreateLoadBalancer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_load_balancer_request) =
    let input = Json_serializers.create_load_balancer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateLoadBalancer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_load_balancer_result_of_yojson
      ~error_deserializer
end

module CreateLoadBalancerTlsCertificate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_load_balancer_tls_certificate_request) =
    let input = Json_serializers.create_load_balancer_tls_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.CreateLoadBalancerTlsCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_load_balancer_tls_certificate_result_of_yojson
      ~error_deserializer
end

module CreateRelationalDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_relational_database_request) =
    let input = Json_serializers.create_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.CreateRelationalDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_relational_database_result_of_yojson
      ~error_deserializer
end

module CreateRelationalDatabaseFromSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_relational_database_from_snapshot_request) =
    let input =
      Json_serializers.create_relational_database_from_snapshot_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.CreateRelationalDatabaseFromSnapshot" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_relational_database_from_snapshot_result_of_yojson
      ~error_deserializer
end

module CreateRelationalDatabaseSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_relational_database_snapshot_request) =
    let input = Json_serializers.create_relational_database_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.CreateRelationalDatabaseSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_relational_database_snapshot_result_of_yojson
      ~error_deserializer
end

module DeleteAlarm = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_alarm_request) =
    let input = Json_serializers.delete_alarm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteAlarm" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_alarm_result_of_yojson
      ~error_deserializer
end

module DeleteAutoSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_auto_snapshot_request) =
    let input = Json_serializers.delete_auto_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteAutoSnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_auto_snapshot_result_of_yojson
      ~error_deserializer
end

module DeleteBucket = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_bucket_request) =
    let input = Json_serializers.delete_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteBucket" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_bucket_result_of_yojson
      ~error_deserializer
end

module DeleteBucketAccessKey = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_bucket_access_key_request) =
    let input = Json_serializers.delete_bucket_access_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteBucketAccessKey"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_bucket_access_key_result_of_yojson
      ~error_deserializer
end

module DeleteCertificate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_certificate_request) =
    let input = Json_serializers.delete_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_certificate_result_of_yojson
      ~error_deserializer
end

module DeleteContactMethod = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_contact_method_request) =
    let input = Json_serializers.delete_contact_method_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteContactMethod"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_contact_method_result_of_yojson
      ~error_deserializer
end

module DeleteContainerImage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_container_image_request) =
    let input = Json_serializers.delete_container_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteContainerImage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_container_image_result_of_yojson
      ~error_deserializer
end

module DeleteContainerService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_container_service_request) =
    let input = Json_serializers.delete_container_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteContainerService"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_container_service_result_of_yojson
      ~error_deserializer
end

module DeleteDisk = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_disk_request) =
    let input = Json_serializers.delete_disk_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteDisk" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_disk_result_of_yojson
      ~error_deserializer
end

module DeleteDiskSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_disk_snapshot_request) =
    let input = Json_serializers.delete_disk_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteDiskSnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_disk_snapshot_result_of_yojson
      ~error_deserializer
end

module DeleteDistribution = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_distribution_request) =
    let input = Json_serializers.delete_distribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteDistribution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_distribution_result_of_yojson
      ~error_deserializer
end

module DeleteDomain = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_domain_request) =
    let input = Json_serializers.delete_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_domain_result_of_yojson
      ~error_deserializer
end

module DeleteDomainEntry = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_domain_entry_request) =
    let input = Json_serializers.delete_domain_entry_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteDomainEntry" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_domain_entry_result_of_yojson
      ~error_deserializer
end

module DeleteInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_instance_request) =
    let input = Json_serializers.delete_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_instance_result_of_yojson
      ~error_deserializer
end

module DeleteInstanceSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_instance_snapshot_request) =
    let input = Json_serializers.delete_instance_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteInstanceSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_instance_snapshot_result_of_yojson
      ~error_deserializer
end

module DeleteKeyPair = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_key_pair_request) =
    let input = Json_serializers.delete_key_pair_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteKeyPair" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_key_pair_result_of_yojson
      ~error_deserializer
end

module DeleteKnownHostKeys = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_known_host_keys_request) =
    let input = Json_serializers.delete_known_host_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteKnownHostKeys"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_known_host_keys_result_of_yojson
      ~error_deserializer
end

module DeleteLoadBalancer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_load_balancer_request) =
    let input = Json_serializers.delete_load_balancer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteLoadBalancer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_load_balancer_result_of_yojson
      ~error_deserializer
end

module DeleteLoadBalancerTlsCertificate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_load_balancer_tls_certificate_request) =
    let input = Json_serializers.delete_load_balancer_tls_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.DeleteLoadBalancerTlsCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_load_balancer_tls_certificate_result_of_yojson
      ~error_deserializer
end

module DeleteRelationalDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_relational_database_request) =
    let input = Json_serializers.delete_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DeleteRelationalDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_relational_database_result_of_yojson
      ~error_deserializer
end

module DeleteRelationalDatabaseSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_relational_database_snapshot_request) =
    let input = Json_serializers.delete_relational_database_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.DeleteRelationalDatabaseSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_relational_database_snapshot_result_of_yojson
      ~error_deserializer
end

module DetachCertificateFromDistribution = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detach_certificate_from_distribution_request) =
    let input = Json_serializers.detach_certificate_from_distribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.DetachCertificateFromDistribution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detach_certificate_from_distribution_result_of_yojson
      ~error_deserializer
end

module DetachDisk = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detach_disk_request) =
    let input = Json_serializers.detach_disk_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DetachDisk" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detach_disk_result_of_yojson
      ~error_deserializer
end

module DetachInstancesFromLoadBalancer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detach_instances_from_load_balancer_request) =
    let input = Json_serializers.detach_instances_from_load_balancer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.DetachInstancesFromLoadBalancer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detach_instances_from_load_balancer_result_of_yojson
      ~error_deserializer
end

module DetachStaticIp = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detach_static_ip_request) =
    let input = Json_serializers.detach_static_ip_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DetachStaticIp" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detach_static_ip_result_of_yojson
      ~error_deserializer
end

module DisableAddOn = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_add_on_request) =
    let input = Json_serializers.disable_add_on_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DisableAddOn" ~service
      ~context ~input ~output_deserializer:Json_deserializers.disable_add_on_result_of_yojson
      ~error_deserializer
end

module DownloadDefaultKeyPair = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : download_default_key_pair_request) =
    let input = Json_serializers.download_default_key_pair_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.DownloadDefaultKeyPair"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.download_default_key_pair_result_of_yojson
      ~error_deserializer
end

module EnableAddOn = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_add_on_request) =
    let input = Json_serializers.enable_add_on_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.EnableAddOn" ~service
      ~context ~input ~output_deserializer:Json_deserializers.enable_add_on_result_of_yojson
      ~error_deserializer
end

module ExportSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_snapshot_request) =
    let input = Json_serializers.export_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.ExportSnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.export_snapshot_result_of_yojson
      ~error_deserializer
end

module GetActiveNames = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_active_names_request) =
    let input = Json_serializers.get_active_names_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetActiveNames" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_active_names_result_of_yojson
      ~error_deserializer
end

module GetAlarms = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_alarms_request) =
    let input = Json_serializers.get_alarms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetAlarms" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_alarms_result_of_yojson ~error_deserializer
end

module GetAutoSnapshots = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_auto_snapshots_request) =
    let input = Json_serializers.get_auto_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetAutoSnapshots" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_auto_snapshots_result_of_yojson
      ~error_deserializer
end

module GetBlueprints = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_blueprints_request) =
    let input = Json_serializers.get_blueprints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetBlueprints" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_blueprints_result_of_yojson
      ~error_deserializer
end

module GetBucketAccessKeys = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_bucket_access_keys_request) =
    let input = Json_serializers.get_bucket_access_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetBucketAccessKeys"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_bucket_access_keys_result_of_yojson
      ~error_deserializer
end

module GetBucketBundles = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_bucket_bundles_request) =
    let input = Json_serializers.get_bucket_bundles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetBucketBundles" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_bucket_bundles_result_of_yojson
      ~error_deserializer
end

module GetBucketMetricData = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_bucket_metric_data_request) =
    let input = Json_serializers.get_bucket_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetBucketMetricData"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_bucket_metric_data_result_of_yojson
      ~error_deserializer
end

module GetBuckets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_buckets_request) =
    let input = Json_serializers.get_buckets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetBuckets" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_buckets_result_of_yojson
      ~error_deserializer
end

module GetBundles = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_bundles_request) =
    let input = Json_serializers.get_bundles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetBundles" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_bundles_result_of_yojson
      ~error_deserializer
end

module GetCertificates = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_certificates_request) =
    let input = Json_serializers.get_certificates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetCertificates" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_certificates_result_of_yojson
      ~error_deserializer
end

module GetCloudFormationStackRecords = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_cloud_formation_stack_records_request) =
    let input = Json_serializers.get_cloud_formation_stack_records_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetCloudFormationStackRecords" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cloud_formation_stack_records_result_of_yojson
      ~error_deserializer
end

module GetContactMethods = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_contact_methods_request) =
    let input = Json_serializers.get_contact_methods_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetContactMethods" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_contact_methods_result_of_yojson
      ~error_deserializer
end

module GetContainerAPIMetadata = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_container_api_metadata_request) =
    let input = Json_serializers.get_container_api_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetContainerAPIMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_container_api_metadata_result_of_yojson
      ~error_deserializer
end

module GetContainerImages = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_container_images_request) =
    let input = Json_serializers.get_container_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetContainerImages" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_container_images_result_of_yojson
      ~error_deserializer
end

module GetContainerLog = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_container_log_request) =
    let input = Json_serializers.get_container_log_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetContainerLog" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_container_log_result_of_yojson
      ~error_deserializer
end

module GetContainerServiceDeployments = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_container_service_deployments_request) =
    let input = Json_serializers.get_container_service_deployments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetContainerServiceDeployments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_container_service_deployments_result_of_yojson
      ~error_deserializer
end

module GetContainerServiceMetricData = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_container_service_metric_data_request) =
    let input = Json_serializers.get_container_service_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetContainerServiceMetricData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_container_service_metric_data_result_of_yojson
      ~error_deserializer
end

module GetContainerServicePowers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_container_service_powers_request) =
    let input = Json_serializers.get_container_service_powers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetContainerServicePowers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_container_service_powers_result_of_yojson
      ~error_deserializer
end

module GetContainerServices = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_container_services_request) =
    let input = Json_serializers.get_container_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetContainerServices"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.container_services_list_result_of_yojson
      ~error_deserializer
end

module GetCostEstimate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_cost_estimate_request) =
    let input = Json_serializers.get_cost_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetCostEstimate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_cost_estimate_result_of_yojson
      ~error_deserializer
end

module GetDisk = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_disk_request) =
    let input = Json_serializers.get_disk_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetDisk" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_disk_result_of_yojson ~error_deserializer
end

module GetDisks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_disks_request) =
    let input = Json_serializers.get_disks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetDisks" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_disks_result_of_yojson ~error_deserializer
end

module GetDiskSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_disk_snapshot_request) =
    let input = Json_serializers.get_disk_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetDiskSnapshot" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_disk_snapshot_result_of_yojson
      ~error_deserializer
end

module GetDiskSnapshots = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_disk_snapshots_request) =
    let input = Json_serializers.get_disk_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetDiskSnapshots" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_disk_snapshots_result_of_yojson
      ~error_deserializer
end

module GetDistributionBundles = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_distribution_bundles_request) =
    let input = Json_serializers.get_distribution_bundles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetDistributionBundles"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_distribution_bundles_result_of_yojson
      ~error_deserializer
end

module GetDistributionLatestCacheReset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_distribution_latest_cache_reset_request) =
    let input = Json_serializers.get_distribution_latest_cache_reset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetDistributionLatestCacheReset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_distribution_latest_cache_reset_result_of_yojson
      ~error_deserializer
end

module GetDistributionMetricData = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_distribution_metric_data_request) =
    let input = Json_serializers.get_distribution_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetDistributionMetricData"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_distribution_metric_data_result_of_yojson
      ~error_deserializer
end

module GetDistributions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_distributions_request) =
    let input = Json_serializers.get_distributions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetDistributions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_distributions_result_of_yojson
      ~error_deserializer
end

module GetDomain = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_domain_request) =
    let input = Json_serializers.get_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetDomain" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_domain_result_of_yojson ~error_deserializer
end

module GetDomains = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_domains_request) =
    let input = Json_serializers.get_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetDomains" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_domains_result_of_yojson
      ~error_deserializer
end

module GetExportSnapshotRecords = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_export_snapshot_records_request) =
    let input = Json_serializers.get_export_snapshot_records_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetExportSnapshotRecords"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_export_snapshot_records_result_of_yojson
      ~error_deserializer
end

module GetInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instance_request) =
    let input = Json_serializers.get_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_instance_result_of_yojson
      ~error_deserializer
end

module GetInstanceAccessDetails = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instance_access_details_request) =
    let input = Json_serializers.get_instance_access_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetInstanceAccessDetails"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_instance_access_details_result_of_yojson
      ~error_deserializer
end

module GetInstanceMetricData = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instance_metric_data_request) =
    let input = Json_serializers.get_instance_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetInstanceMetricData"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_instance_metric_data_result_of_yojson
      ~error_deserializer
end

module GetInstancePortStates = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instance_port_states_request) =
    let input = Json_serializers.get_instance_port_states_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetInstancePortStates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_instance_port_states_result_of_yojson
      ~error_deserializer
end

module GetInstances = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instances_request) =
    let input = Json_serializers.get_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetInstances" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_instances_result_of_yojson
      ~error_deserializer
end

module GetInstanceSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instance_snapshot_request) =
    let input = Json_serializers.get_instance_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetInstanceSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_instance_snapshot_result_of_yojson
      ~error_deserializer
end

module GetInstanceSnapshots = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instance_snapshots_request) =
    let input = Json_serializers.get_instance_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetInstanceSnapshots"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_instance_snapshots_result_of_yojson
      ~error_deserializer
end

module GetInstanceState = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instance_state_request) =
    let input = Json_serializers.get_instance_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetInstanceState" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_instance_state_result_of_yojson
      ~error_deserializer
end

module GetKeyPair = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_key_pair_request) =
    let input = Json_serializers.get_key_pair_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetKeyPair" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_key_pair_result_of_yojson
      ~error_deserializer
end

module GetKeyPairs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_key_pairs_request) =
    let input = Json_serializers.get_key_pairs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetKeyPairs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_key_pairs_result_of_yojson
      ~error_deserializer
end

module GetLoadBalancer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_load_balancer_request) =
    let input = Json_serializers.get_load_balancer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetLoadBalancer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_load_balancer_result_of_yojson
      ~error_deserializer
end

module GetLoadBalancerMetricData = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_load_balancer_metric_data_request) =
    let input = Json_serializers.get_load_balancer_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetLoadBalancerMetricData"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_load_balancer_metric_data_result_of_yojson
      ~error_deserializer
end

module GetLoadBalancers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_load_balancers_request) =
    let input = Json_serializers.get_load_balancers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetLoadBalancers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_load_balancers_result_of_yojson
      ~error_deserializer
end

module GetLoadBalancerTlsCertificates = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_load_balancer_tls_certificates_request) =
    let input = Json_serializers.get_load_balancer_tls_certificates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetLoadBalancerTlsCertificates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_load_balancer_tls_certificates_result_of_yojson
      ~error_deserializer
end

module GetLoadBalancerTlsPolicies = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_load_balancer_tls_policies_request) =
    let input = Json_serializers.get_load_balancer_tls_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetLoadBalancerTlsPolicies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_load_balancer_tls_policies_result_of_yojson
      ~error_deserializer
end

module GetOperation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_operation_request) =
    let input = Json_serializers.get_operation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetOperation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_operation_result_of_yojson
      ~error_deserializer
end

module GetOperations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_operations_request) =
    let input = Json_serializers.get_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetOperations" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_operations_result_of_yojson
      ~error_deserializer
end

module GetOperationsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_operations_for_resource_request) =
    let input = Json_serializers.get_operations_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetOperationsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_operations_for_resource_result_of_yojson
      ~error_deserializer
end

module GetRegions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_regions_request) =
    let input = Json_serializers.get_regions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetRegions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_regions_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_database_request) =
    let input = Json_serializers.get_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetRelationalDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relational_database_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabaseBlueprints = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_database_blueprints_request) =
    let input = Json_serializers.get_relational_database_blueprints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseBlueprints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relational_database_blueprints_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabaseBundles = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_database_bundles_request) =
    let input = Json_serializers.get_relational_database_bundles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseBundles" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relational_database_bundles_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabaseEvents = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_database_events_request) =
    let input = Json_serializers.get_relational_database_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetRelationalDatabaseEvents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relational_database_events_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabaseLogEvents = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_database_log_events_request) =
    let input = Json_serializers.get_relational_database_log_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseLogEvents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relational_database_log_events_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabaseLogStreams = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_database_log_streams_request) =
    let input = Json_serializers.get_relational_database_log_streams_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseLogStreams" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relational_database_log_streams_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabaseMasterUserPassword = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_database_master_user_password_request) =
    let input =
      Json_serializers.get_relational_database_master_user_password_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseMasterUserPassword" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_relational_database_master_user_password_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabaseMetricData = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_database_metric_data_request) =
    let input = Json_serializers.get_relational_database_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseMetricData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relational_database_metric_data_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabaseParameters = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_database_parameters_request) =
    let input = Json_serializers.get_relational_database_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseParameters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relational_database_parameters_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabases = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_databases_request) =
    let input = Json_serializers.get_relational_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetRelationalDatabases"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relational_databases_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabaseSnapshot = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_database_snapshot_request) =
    let input = Json_serializers.get_relational_database_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relational_database_snapshot_result_of_yojson
      ~error_deserializer
end

module GetRelationalDatabaseSnapshots = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relational_database_snapshots_request) =
    let input = Json_serializers.get_relational_database_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseSnapshots" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relational_database_snapshots_result_of_yojson
      ~error_deserializer
end

module GetSetupHistory = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_setup_history_request) =
    let input = Json_serializers.get_setup_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetSetupHistory" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_setup_history_result_of_yojson
      ~error_deserializer
end

module GetStaticIp = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_static_ip_request) =
    let input = Json_serializers.get_static_ip_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetStaticIp" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_static_ip_result_of_yojson
      ~error_deserializer
end

module GetStaticIps = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_static_ips_request) =
    let input = Json_serializers.get_static_ips_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.GetStaticIps" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_static_ips_result_of_yojson
      ~error_deserializer
end

module ImportKeyPair = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_key_pair_request) =
    let input = Json_serializers.import_key_pair_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.ImportKeyPair" ~service
      ~context ~input ~output_deserializer:Json_deserializers.import_key_pair_result_of_yojson
      ~error_deserializer
end

module IsVpcPeered = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : is_vpc_peered_request) =
    let input = Json_serializers.is_vpc_peered_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.IsVpcPeered" ~service
      ~context ~input ~output_deserializer:Json_deserializers.is_vpc_peered_result_of_yojson
      ~error_deserializer
end

module OpenInstancePublicPorts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : open_instance_public_ports_request) =
    let input = Json_serializers.open_instance_public_ports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.OpenInstancePublicPorts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.open_instance_public_ports_result_of_yojson
      ~error_deserializer
end

module PeerVpc = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : peer_vpc_request) =
    let input = Json_serializers.peer_vpc_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.PeerVpc" ~service ~context
      ~input ~output_deserializer:Json_deserializers.peer_vpc_result_of_yojson ~error_deserializer
end

module PutAlarm = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_alarm_request) =
    let input = Json_serializers.put_alarm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.PutAlarm" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_alarm_result_of_yojson ~error_deserializer
end

module PutInstancePublicPorts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_instance_public_ports_request) =
    let input = Json_serializers.put_instance_public_ports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.PutInstancePublicPorts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_instance_public_ports_result_of_yojson
      ~error_deserializer
end

module RebootInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reboot_instance_request) =
    let input = Json_serializers.reboot_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.RebootInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.reboot_instance_result_of_yojson
      ~error_deserializer
end

module RebootRelationalDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reboot_relational_database_request) =
    let input = Json_serializers.reboot_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.RebootRelationalDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reboot_relational_database_result_of_yojson
      ~error_deserializer
end

module RegisterContainerImage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_container_image_request) =
    let input = Json_serializers.register_container_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.RegisterContainerImage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_container_image_result_of_yojson
      ~error_deserializer
end

module ReleaseStaticIp = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : release_static_ip_request) =
    let input = Json_serializers.release_static_ip_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.ReleaseStaticIp" ~service
      ~context ~input ~output_deserializer:Json_deserializers.release_static_ip_result_of_yojson
      ~error_deserializer
end

module ResetDistributionCache = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reset_distribution_cache_request) =
    let input = Json_serializers.reset_distribution_cache_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.ResetDistributionCache"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reset_distribution_cache_result_of_yojson
      ~error_deserializer
end

module SendContactMethodVerification = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_contact_method_verification_request) =
    let input = Json_serializers.send_contact_method_verification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.SendContactMethodVerification" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_contact_method_verification_result_of_yojson
      ~error_deserializer
end

module SetIpAddressType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_ip_address_type_request) =
    let input = Json_serializers.set_ip_address_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.SetIpAddressType" ~service
      ~context ~input ~output_deserializer:Json_deserializers.set_ip_address_type_result_of_yojson
      ~error_deserializer
end

module SetResourceAccessForBucket = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_resource_access_for_bucket_request) =
    let input = Json_serializers.set_resource_access_for_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.SetResourceAccessForBucket"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_resource_access_for_bucket_result_of_yojson
      ~error_deserializer
end

module SetupInstanceHttps = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : setup_instance_https_request) =
    let input = Json_serializers.setup_instance_https_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.SetupInstanceHttps" ~service
      ~context ~input ~output_deserializer:Json_deserializers.setup_instance_https_result_of_yojson
      ~error_deserializer
end

module StartGUISession = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_gui_session_request) =
    let input = Json_serializers.start_gui_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.StartGUISession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_gui_session_result_of_yojson
      ~error_deserializer
end

module StartInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_instance_request) =
    let input = Json_serializers.start_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.StartInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_instance_result_of_yojson
      ~error_deserializer
end

module StartRelationalDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_relational_database_request) =
    let input = Json_serializers.start_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.StartRelationalDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_relational_database_result_of_yojson
      ~error_deserializer
end

module StopGUISession = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_gui_session_request) =
    let input = Json_serializers.stop_gui_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.StopGUISession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_gui_session_result_of_yojson
      ~error_deserializer
end

module StopInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_instance_request) =
    let input = Json_serializers.stop_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.StopInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_instance_result_of_yojson
      ~error_deserializer
end

module StopRelationalDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_relational_database_request) =
    let input = Json_serializers.stop_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.StopRelationalDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_relational_database_result_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_result_of_yojson
      ~error_deserializer
end

module TestAlarm = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_alarm_request) =
    let input = Json_serializers.test_alarm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.TestAlarm" ~service ~context
      ~input ~output_deserializer:Json_deserializers.test_alarm_result_of_yojson ~error_deserializer
end

module UnpeerVpc = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : unpeer_vpc_request) =
    let input = Json_serializers.unpeer_vpc_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.UnpeerVpc" ~service ~context
      ~input ~output_deserializer:Json_deserializers.unpeer_vpc_result_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_result_of_yojson
      ~error_deserializer
end

module UpdateBucket = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_bucket_request) =
    let input = Json_serializers.update_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.UpdateBucket" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_bucket_result_of_yojson
      ~error_deserializer
end

module UpdateBucketBundle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_bucket_bundle_request) =
    let input = Json_serializers.update_bucket_bundle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.UpdateBucketBundle" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_bucket_bundle_result_of_yojson
      ~error_deserializer
end

module UpdateContainerService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_container_service_request) =
    let input = Json_serializers.update_container_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.UpdateContainerService"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_container_service_result_of_yojson
      ~error_deserializer
end

module UpdateDistribution = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_distribution_request) =
    let input = Json_serializers.update_distribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.UpdateDistribution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_distribution_result_of_yojson
      ~error_deserializer
end

module UpdateDistributionBundle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_distribution_bundle_request) =
    let input = Json_serializers.update_distribution_bundle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.UpdateDistributionBundle"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_distribution_bundle_result_of_yojson
      ~error_deserializer
end

module UpdateDomainEntry = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_domain_entry_request) =
    let input = Json_serializers.update_domain_entry_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.UpdateDomainEntry" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_domain_entry_result_of_yojson
      ~error_deserializer
end

module UpdateInstanceMetadataOptions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_instance_metadata_options_request) =
    let input = Json_serializers.update_instance_metadata_options_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.UpdateInstanceMetadataOptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_instance_metadata_options_result_of_yojson
      ~error_deserializer
end

module UpdateLoadBalancerAttribute = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_load_balancer_attribute_request) =
    let input = Json_serializers.update_load_balancer_attribute_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.UpdateLoadBalancerAttribute"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_load_balancer_attribute_result_of_yojson
      ~error_deserializer
end

module UpdateRelationalDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_relational_database_request) =
    let input = Json_serializers.update_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Lightsail_20161128.UpdateRelationalDatabase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_relational_database_result_of_yojson
      ~error_deserializer
end

module UpdateRelationalDatabaseParameters = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lightsail#AccessDeniedException"
    | `AccountSetupInProgressException _ ->
        "com.amazonaws.lightsail#AccountSetupInProgressException"
    | `InvalidInputException _ -> "com.amazonaws.lightsail#InvalidInputException"
    | `NotFoundException _ -> "com.amazonaws.lightsail#NotFoundException"
    | `OperationFailureException _ -> "com.amazonaws.lightsail#OperationFailureException"
    | `ServiceException _ -> "com.amazonaws.lightsail#ServiceException"
    | `UnauthenticatedException _ -> "com.amazonaws.lightsail#UnauthenticatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountSetupInProgressException" ->
          `AccountSetupInProgressException
            (Json_deserializers.account_setup_in_progress_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "OperationFailureException" ->
          `OperationFailureException
            (Json_deserializers.operation_failure_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnauthenticatedException" ->
          `UnauthenticatedException
            (Json_deserializers.unauthenticated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_relational_database_parameters_request) =
    let input = Json_serializers.update_relational_database_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Lightsail_20161128.UpdateRelationalDatabaseParameters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_relational_database_parameters_result_of_yojson
      ~error_deserializer
end
