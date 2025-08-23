open Types
open Service_metadata
module AllocateStaticIp =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : allocate_static_ip_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.allocate_static_ip_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128AllocateStaticIp" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:allocate_static_ip_result_of_yojson
            ~error_deserializer
  end
module AttachCertificateToDistribution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : attach_certificate_to_distribution_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.attach_certificate_to_distribution_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128AttachCertificateToDistribution"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:attach_certificate_to_distribution_result_of_yojson
            ~error_deserializer
  end
module AttachDisk =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : attach_disk_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.attach_disk_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128AttachDisk" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:attach_disk_result_of_yojson
            ~error_deserializer
  end
module AttachInstancesToLoadBalancer =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : attach_instances_to_load_balancer_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.attach_instances_to_load_balancer_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128AttachInstancesToLoadBalancer"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:attach_instances_to_load_balancer_result_of_yojson
            ~error_deserializer
  end
module AttachLoadBalancerTlsCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : attach_load_balancer_tls_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.attach_load_balancer_tls_certificate_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128AttachLoadBalancerTlsCertificate"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:attach_load_balancer_tls_certificate_result_of_yojson
            ~error_deserializer
  end
module AttachStaticIp =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : attach_static_ip_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.attach_static_ip_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128AttachStaticIp" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:attach_static_ip_result_of_yojson
            ~error_deserializer
  end
module CloseInstancePublicPorts =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : close_instance_public_ports_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.close_instance_public_ports_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CloseInstancePublicPorts" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:close_instance_public_ports_result_of_yojson
            ~error_deserializer
  end
module CopySnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : copy_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.copy_snapshot_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CopySnapshot" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:copy_snapshot_result_of_yojson
            ~error_deserializer
  end
module CreateBucket =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_bucket_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_bucket_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateBucket" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_bucket_result_of_yojson
            ~error_deserializer
  end
module CreateBucketAccessKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_bucket_access_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_bucket_access_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateBucketAccessKey" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_bucket_access_key_result_of_yojson
            ~error_deserializer
  end
module CreateCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_certificate_result_of_yojson
            ~error_deserializer
  end
module CreateCloudFormationStack =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_cloud_formation_stack_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_cloud_formation_stack_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateCloudFormationStack"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_cloud_formation_stack_result_of_yojson
            ~error_deserializer
  end
module CreateContactMethod =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_contact_method_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_contact_method_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateContactMethod" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_contact_method_result_of_yojson
            ~error_deserializer
  end
module CreateContainerService =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_container_service_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_container_service_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateContainerService" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_container_service_result_of_yojson
            ~error_deserializer
  end
module CreateContainerServiceDeployment =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : create_container_service_deployment_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_container_service_deployment_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateContainerServiceDeployment"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_container_service_deployment_result_of_yojson
            ~error_deserializer
  end
module CreateContainerServiceRegistryLogin =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_container_service_registry_login_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateContainerServiceRegistryLogin"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_container_service_registry_login_result_of_yojson
            ~error_deserializer
  end
module CreateDisk =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_disk_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_disk_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateDisk" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_disk_result_of_yojson
            ~error_deserializer
  end
module CreateDiskFromSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_disk_from_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_disk_from_snapshot_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateDiskFromSnapshot" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_disk_from_snapshot_result_of_yojson
            ~error_deserializer
  end
module CreateDiskSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_disk_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_disk_snapshot_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateDiskSnapshot" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_disk_snapshot_result_of_yojson
            ~error_deserializer
  end
module CreateDistribution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_distribution_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_distribution_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateDistribution" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_distribution_result_of_yojson
            ~error_deserializer
  end
module CreateDomain =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_domain_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_domain_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateDomain" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_domain_result_of_yojson
            ~error_deserializer
  end
module CreateDomainEntry =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_domain_entry_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_domain_entry_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateDomainEntry" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_domain_entry_result_of_yojson
            ~error_deserializer
  end
module CreateGUISessionAccessDetails =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_gui_session_access_details_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_gui_session_access_details_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateGUISessionAccessDetails"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_gui_session_access_details_result_of_yojson
            ~error_deserializer
  end
module CreateInstances =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_instances_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_instances_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateInstances" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_instances_result_of_yojson
            ~error_deserializer
  end
module CreateInstancesFromSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_instances_from_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_instances_from_snapshot_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateInstancesFromSnapshot"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_instances_from_snapshot_result_of_yojson
            ~error_deserializer
  end
module CreateInstanceSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_instance_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_instance_snapshot_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateInstanceSnapshot" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_instance_snapshot_result_of_yojson
            ~error_deserializer
  end
module CreateKeyPair =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_key_pair_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_key_pair_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateKeyPair" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_key_pair_result_of_yojson
            ~error_deserializer
  end
module CreateLoadBalancer =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_load_balancer_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_load_balancer_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateLoadBalancer" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_load_balancer_result_of_yojson
            ~error_deserializer
  end
module CreateLoadBalancerTlsCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : create_load_balancer_tls_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_load_balancer_tls_certificate_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateLoadBalancerTlsCertificate"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_load_balancer_tls_certificate_result_of_yojson
            ~error_deserializer
  end
module CreateRelationalDatabase =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_relational_database_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_relational_database_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateRelationalDatabase" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_relational_database_result_of_yojson
            ~error_deserializer
  end
module CreateRelationalDatabaseFromSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : create_relational_database_from_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_relational_database_from_snapshot_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateRelationalDatabaseFromSnapshot"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_relational_database_from_snapshot_result_of_yojson
            ~error_deserializer
  end
module CreateRelationalDatabaseSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : create_relational_database_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_relational_database_snapshot_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128CreateRelationalDatabaseSnapshot"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_relational_database_snapshot_result_of_yojson
            ~error_deserializer
  end
module DeleteAlarm =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_alarm_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_alarm_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteAlarm" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_alarm_result_of_yojson
            ~error_deserializer
  end
module DeleteAutoSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_auto_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_auto_snapshot_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteAutoSnapshot" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_auto_snapshot_result_of_yojson
            ~error_deserializer
  end
module DeleteBucket =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_bucket_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_bucket_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteBucket" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_bucket_result_of_yojson
            ~error_deserializer
  end
module DeleteBucketAccessKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_bucket_access_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_bucket_access_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteBucketAccessKey" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_bucket_access_key_result_of_yojson
            ~error_deserializer
  end
module DeleteCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_certificate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteCertificate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_certificate_result_of_yojson
            ~error_deserializer
  end
module DeleteContactMethod =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_contact_method_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_contact_method_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteContactMethod" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_contact_method_result_of_yojson
            ~error_deserializer
  end
module DeleteContainerImage =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_container_image_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_container_image_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteContainerImage" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_container_image_result_of_yojson
            ~error_deserializer
  end
module DeleteContainerService =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_container_service_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_container_service_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteContainerService" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_container_service_result_of_yojson
            ~error_deserializer
  end
module DeleteDisk =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_disk_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_disk_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteDisk" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_disk_result_of_yojson
            ~error_deserializer
  end
module DeleteDiskSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_disk_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_disk_snapshot_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteDiskSnapshot" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_disk_snapshot_result_of_yojson
            ~error_deserializer
  end
module DeleteDistribution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_distribution_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_distribution_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteDistribution" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_distribution_result_of_yojson
            ~error_deserializer
  end
module DeleteDomain =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_domain_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_domain_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteDomain" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_domain_result_of_yojson
            ~error_deserializer
  end
module DeleteDomainEntry =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_domain_entry_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_domain_entry_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteDomainEntry" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_domain_entry_result_of_yojson
            ~error_deserializer
  end
module DeleteInstance =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_instance_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_instance_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteInstance" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_instance_result_of_yojson
            ~error_deserializer
  end
module DeleteInstanceSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_instance_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_instance_snapshot_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteInstanceSnapshot" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_instance_snapshot_result_of_yojson
            ~error_deserializer
  end
module DeleteKeyPair =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_key_pair_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_key_pair_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteKeyPair" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_key_pair_result_of_yojson
            ~error_deserializer
  end
module DeleteKnownHostKeys =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_known_host_keys_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_known_host_keys_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteKnownHostKeys" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_known_host_keys_result_of_yojson
            ~error_deserializer
  end
module DeleteLoadBalancer =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_load_balancer_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_load_balancer_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteLoadBalancer" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_load_balancer_result_of_yojson
            ~error_deserializer
  end
module DeleteLoadBalancerTlsCertificate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_load_balancer_tls_certificate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_load_balancer_tls_certificate_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteLoadBalancerTlsCertificate"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_load_balancer_tls_certificate_result_of_yojson
            ~error_deserializer
  end
module DeleteRelationalDatabase =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_relational_database_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_relational_database_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteRelationalDatabase" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_relational_database_result_of_yojson
            ~error_deserializer
  end
module DeleteRelationalDatabaseSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_relational_database_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_relational_database_snapshot_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DeleteRelationalDatabaseSnapshot"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_relational_database_snapshot_result_of_yojson
            ~error_deserializer
  end
module DetachCertificateFromDistribution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : detach_certificate_from_distribution_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.detach_certificate_from_distribution_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DetachCertificateFromDistribution"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:detach_certificate_from_distribution_result_of_yojson
            ~error_deserializer
  end
module DetachDisk =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : detach_disk_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.detach_disk_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DetachDisk" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:detach_disk_result_of_yojson
            ~error_deserializer
  end
module DetachInstancesFromLoadBalancer =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : detach_instances_from_load_balancer_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.detach_instances_from_load_balancer_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DetachInstancesFromLoadBalancer"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:detach_instances_from_load_balancer_result_of_yojson
            ~error_deserializer
  end
module DetachStaticIp =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : detach_static_ip_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.detach_static_ip_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DetachStaticIp" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:detach_static_ip_result_of_yojson
            ~error_deserializer
  end
module DisableAddOn =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disable_add_on_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.disable_add_on_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DisableAddOn" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:disable_add_on_result_of_yojson
            ~error_deserializer
  end
module DownloadDefaultKeyPair =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.download_default_key_pair_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128DownloadDefaultKeyPair" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:download_default_key_pair_result_of_yojson
            ~error_deserializer
  end
module EnableAddOn =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : enable_add_on_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.enable_add_on_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128EnableAddOn" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:enable_add_on_result_of_yojson
            ~error_deserializer
  end
module ExportSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : export_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.export_snapshot_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128ExportSnapshot" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:export_snapshot_result_of_yojson
            ~error_deserializer
  end
module GetActiveNames =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_active_names_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_active_names_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetActiveNames" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_active_names_result_of_yojson
            ~error_deserializer
  end
module GetAlarms =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_alarms_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_alarms_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetAlarms" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_alarms_result_of_yojson
            ~error_deserializer
  end
module GetAutoSnapshots =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_auto_snapshots_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_auto_snapshots_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetAutoSnapshots" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_auto_snapshots_result_of_yojson
            ~error_deserializer
  end
module GetBlueprints =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_blueprints_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_blueprints_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetBlueprints" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_blueprints_result_of_yojson
            ~error_deserializer
  end
module GetBucketAccessKeys =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_bucket_access_keys_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_bucket_access_keys_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetBucketAccessKeys" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_bucket_access_keys_result_of_yojson
            ~error_deserializer
  end
module GetBucketBundles =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_bucket_bundles_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_bucket_bundles_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetBucketBundles" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_bucket_bundles_result_of_yojson
            ~error_deserializer
  end
module GetBucketMetricData =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_bucket_metric_data_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_bucket_metric_data_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetBucketMetricData" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_bucket_metric_data_result_of_yojson
            ~error_deserializer
  end
module GetBuckets =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_buckets_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_buckets_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetBuckets" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_buckets_result_of_yojson
            ~error_deserializer
  end
module GetBundles =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_bundles_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_bundles_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetBundles" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_bundles_result_of_yojson
            ~error_deserializer
  end
module GetCertificates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_certificates_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_certificates_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetCertificates" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_certificates_result_of_yojson
            ~error_deserializer
  end
module GetCloudFormationStackRecords =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_cloud_formation_stack_records_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_cloud_formation_stack_records_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetCloudFormationStackRecords"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_cloud_formation_stack_records_result_of_yojson
            ~error_deserializer
  end
module GetContactMethods =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_contact_methods_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_contact_methods_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetContactMethods" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_contact_methods_result_of_yojson
            ~error_deserializer
  end
module GetContainerAPIMetadata =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_container_api_metadata_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetContainerAPIMetadata" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_container_api_metadata_result_of_yojson
            ~error_deserializer
  end
module GetContainerImages =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_container_images_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_container_images_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetContainerImages" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_container_images_result_of_yojson
            ~error_deserializer
  end
module GetContainerLog =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_container_log_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_container_log_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetContainerLog" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_container_log_result_of_yojson
            ~error_deserializer
  end
module GetContainerServiceDeployments =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_container_service_deployments_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_container_service_deployments_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetContainerServiceDeployments"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_container_service_deployments_result_of_yojson
            ~error_deserializer
  end
module GetContainerServiceMetricData =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_container_service_metric_data_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_container_service_metric_data_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetContainerServiceMetricData"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_container_service_metric_data_result_of_yojson
            ~error_deserializer
  end
module GetContainerServicePowers =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_container_service_powers_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetContainerServicePowers"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_container_service_powers_result_of_yojson
            ~error_deserializer
  end
module GetContainerServices =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_container_services_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_container_services_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetContainerServices" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:container_services_list_result_of_yojson
            ~error_deserializer
  end
module GetCostEstimate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_cost_estimate_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_cost_estimate_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetCostEstimate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_cost_estimate_result_of_yojson
            ~error_deserializer
  end
module GetDisk =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_disk_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_disk_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetDisk" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_disk_result_of_yojson
            ~error_deserializer
  end
module GetDisks =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_disks_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_disks_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetDisks" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_disks_result_of_yojson
            ~error_deserializer
  end
module GetDiskSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_disk_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_disk_snapshot_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetDiskSnapshot" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_disk_snapshot_result_of_yojson
            ~error_deserializer
  end
module GetDiskSnapshots =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_disk_snapshots_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_disk_snapshots_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetDiskSnapshots" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_disk_snapshots_result_of_yojson
            ~error_deserializer
  end
module GetDistributionBundles =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_distribution_bundles_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetDistributionBundles" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_distribution_bundles_result_of_yojson
            ~error_deserializer
  end
module GetDistributionLatestCacheReset =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_distribution_latest_cache_reset_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_distribution_latest_cache_reset_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetDistributionLatestCacheReset"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_distribution_latest_cache_reset_result_of_yojson
            ~error_deserializer
  end
module GetDistributionMetricData =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_distribution_metric_data_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_distribution_metric_data_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetDistributionMetricData"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_distribution_metric_data_result_of_yojson
            ~error_deserializer
  end
module GetDistributions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_distributions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_distributions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetDistributions" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_distributions_result_of_yojson
            ~error_deserializer
  end
module GetDomain =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_domain_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_domain_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetDomain" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_domain_result_of_yojson
            ~error_deserializer
  end
module GetDomains =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_domains_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_domains_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetDomains" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_domains_result_of_yojson
            ~error_deserializer
  end
module GetExportSnapshotRecords =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_export_snapshot_records_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_export_snapshot_records_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetExportSnapshotRecords" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_export_snapshot_records_result_of_yojson
            ~error_deserializer
  end
module GetInstance =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_instance_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_instance_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetInstance" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_instance_result_of_yojson
            ~error_deserializer
  end
module GetInstanceAccessDetails =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_instance_access_details_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_instance_access_details_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetInstanceAccessDetails" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_instance_access_details_result_of_yojson
            ~error_deserializer
  end
module GetInstanceMetricData =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_instance_metric_data_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_instance_metric_data_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetInstanceMetricData" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_instance_metric_data_result_of_yojson
            ~error_deserializer
  end
module GetInstancePortStates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_instance_port_states_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_instance_port_states_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetInstancePortStates" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_instance_port_states_result_of_yojson
            ~error_deserializer
  end
module GetInstances =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_instances_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_instances_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetInstances" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_instances_result_of_yojson
            ~error_deserializer
  end
module GetInstanceSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_instance_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_instance_snapshot_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetInstanceSnapshot" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_instance_snapshot_result_of_yojson
            ~error_deserializer
  end
module GetInstanceSnapshots =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_instance_snapshots_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_instance_snapshots_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetInstanceSnapshots" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_instance_snapshots_result_of_yojson
            ~error_deserializer
  end
module GetInstanceState =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_instance_state_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_instance_state_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetInstanceState" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_instance_state_result_of_yojson
            ~error_deserializer
  end
module GetKeyPair =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_key_pair_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_key_pair_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetKeyPair" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_key_pair_result_of_yojson
            ~error_deserializer
  end
module GetKeyPairs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_key_pairs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_key_pairs_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetKeyPairs" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_key_pairs_result_of_yojson
            ~error_deserializer
  end
module GetLoadBalancer =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_load_balancer_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_load_balancer_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetLoadBalancer" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_load_balancer_result_of_yojson
            ~error_deserializer
  end
module GetLoadBalancerMetricData =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_load_balancer_metric_data_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_load_balancer_metric_data_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetLoadBalancerMetricData"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_load_balancer_metric_data_result_of_yojson
            ~error_deserializer
  end
module GetLoadBalancers =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_load_balancers_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_load_balancers_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetLoadBalancers" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_load_balancers_result_of_yojson
            ~error_deserializer
  end
module GetLoadBalancerTlsCertificates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_load_balancer_tls_certificates_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_load_balancer_tls_certificates_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetLoadBalancerTlsCertificates"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_load_balancer_tls_certificates_result_of_yojson
            ~error_deserializer
  end
module GetLoadBalancerTlsPolicies =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_load_balancer_tls_policies_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_load_balancer_tls_policies_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetLoadBalancerTlsPolicies"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_load_balancer_tls_policies_result_of_yojson
            ~error_deserializer
  end
module GetOperation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_operation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_operation_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetOperation" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_operation_result_of_yojson
            ~error_deserializer
  end
module GetOperations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_operations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_operations_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetOperations" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_operations_result_of_yojson
            ~error_deserializer
  end
module GetOperationsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_operations_for_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_operations_for_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetOperationsForResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_operations_for_resource_result_of_yojson
            ~error_deserializer
  end
module GetRegions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_regions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_regions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRegions" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_regions_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabase =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_relational_database_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_database_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabase" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_database_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabaseBlueprints =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_relational_database_blueprints_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_database_blueprints_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabaseBlueprints"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_database_blueprints_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabaseBundles =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_relational_database_bundles_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_database_bundles_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabaseBundles"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_database_bundles_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabaseEvents =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_relational_database_events_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_database_events_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabaseEvents"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_database_events_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabaseLogEvents =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_relational_database_log_events_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_database_log_events_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabaseLogEvents"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_database_log_events_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabaseLogStreams =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_relational_database_log_streams_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_database_log_streams_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabaseLogStreams"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_database_log_streams_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabaseMasterUserPassword =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_relational_database_master_user_password_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_database_master_user_password_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabaseMasterUserPassword"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_database_master_user_password_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabaseMetricData =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_relational_database_metric_data_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_database_metric_data_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabaseMetricData"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_database_metric_data_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabaseParameters =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_relational_database_parameters_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_database_parameters_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabaseParameters"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_database_parameters_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabases =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_relational_databases_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_databases_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabases" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_databases_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabaseSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_relational_database_snapshot_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_database_snapshot_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabaseSnapshot"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_database_snapshot_result_of_yojson
            ~error_deserializer
  end
module GetRelationalDatabaseSnapshots =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_relational_database_snapshots_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_relational_database_snapshots_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetRelationalDatabaseSnapshots"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_relational_database_snapshots_result_of_yojson
            ~error_deserializer
  end
module GetSetupHistory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_setup_history_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_setup_history_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetSetupHistory" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_setup_history_result_of_yojson
            ~error_deserializer
  end
module GetStaticIp =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_static_ip_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_static_ip_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetStaticIp" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_static_ip_result_of_yojson
            ~error_deserializer
  end
module GetStaticIps =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_static_ips_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_static_ips_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128GetStaticIps" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_static_ips_result_of_yojson
            ~error_deserializer
  end
module ImportKeyPair =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : import_key_pair_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.import_key_pair_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128ImportKeyPair" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:import_key_pair_result_of_yojson
            ~error_deserializer
  end
module IsVpcPeered =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.is_vpc_peered_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128IsVpcPeered" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:is_vpc_peered_result_of_yojson
            ~error_deserializer
  end
module OpenInstancePublicPorts =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : open_instance_public_ports_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.open_instance_public_ports_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128OpenInstancePublicPorts" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:open_instance_public_ports_result_of_yojson
            ~error_deserializer
  end
module PeerVpc =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.peer_vpc_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128PeerVpc" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:peer_vpc_result_of_yojson
            ~error_deserializer
  end
module PutAlarm =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_alarm_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_alarm_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128PutAlarm" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_alarm_result_of_yojson
            ~error_deserializer
  end
module PutInstancePublicPorts =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_instance_public_ports_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_instance_public_ports_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128PutInstancePublicPorts" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_instance_public_ports_result_of_yojson
            ~error_deserializer
  end
module RebootInstance =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : reboot_instance_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.reboot_instance_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128RebootInstance" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:reboot_instance_result_of_yojson
            ~error_deserializer
  end
module RebootRelationalDatabase =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : reboot_relational_database_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.reboot_relational_database_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128RebootRelationalDatabase" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:reboot_relational_database_result_of_yojson
            ~error_deserializer
  end
module RegisterContainerImage =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : register_container_image_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.register_container_image_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128RegisterContainerImage" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:register_container_image_result_of_yojson
            ~error_deserializer
  end
module ReleaseStaticIp =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : release_static_ip_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.release_static_ip_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128ReleaseStaticIp" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:release_static_ip_result_of_yojson
            ~error_deserializer
  end
module ResetDistributionCache =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : reset_distribution_cache_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.reset_distribution_cache_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128ResetDistributionCache" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:reset_distribution_cache_result_of_yojson
            ~error_deserializer
  end
module SendContactMethodVerification =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : send_contact_method_verification_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.send_contact_method_verification_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128SendContactMethodVerification"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:send_contact_method_verification_result_of_yojson
            ~error_deserializer
  end
module SetIpAddressType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : set_ip_address_type_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.set_ip_address_type_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128SetIpAddressType" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:set_ip_address_type_result_of_yojson
            ~error_deserializer
  end
module SetResourceAccessForBucket =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : set_resource_access_for_bucket_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.set_resource_access_for_bucket_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128SetResourceAccessForBucket"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:set_resource_access_for_bucket_result_of_yojson
            ~error_deserializer
  end
module SetupInstanceHttps =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : setup_instance_https_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.setup_instance_https_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128SetupInstanceHttps" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:setup_instance_https_result_of_yojson
            ~error_deserializer
  end
module StartGUISession =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_gui_session_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.start_gui_session_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128StartGUISession" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_gui_session_result_of_yojson
            ~error_deserializer
  end
module StartInstance =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_instance_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.start_instance_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128StartInstance" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_instance_result_of_yojson
            ~error_deserializer
  end
module StartRelationalDatabase =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_relational_database_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_relational_database_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128StartRelationalDatabase" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_relational_database_result_of_yojson
            ~error_deserializer
  end
module StopGUISession =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_gui_session_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.stop_gui_session_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128StopGUISession" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:stop_gui_session_result_of_yojson
            ~error_deserializer
  end
module StopInstance =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_instance_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.stop_instance_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128StopInstance" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:stop_instance_result_of_yojson
            ~error_deserializer
  end
module StopRelationalDatabase =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_relational_database_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.stop_relational_database_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128StopRelationalDatabase" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:stop_relational_database_result_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
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
            ~shape_name:"Lightsail_20161128TagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resource_result_of_yojson
            ~error_deserializer
  end
module TestAlarm =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : test_alarm_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.test_alarm_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128TestAlarm" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:test_alarm_result_of_yojson
            ~error_deserializer
  end
module UnpeerVpc =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.unpeer_vpc_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128UnpeerVpc" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:unpeer_vpc_result_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
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
            ~shape_name:"Lightsail_20161128UntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_result_of_yojson
            ~error_deserializer
  end
module UpdateBucket =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_bucket_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_bucket_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128UpdateBucket" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_bucket_result_of_yojson
            ~error_deserializer
  end
module UpdateBucketBundle =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_bucket_bundle_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_bucket_bundle_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128UpdateBucketBundle" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_bucket_bundle_result_of_yojson
            ~error_deserializer
  end
module UpdateContainerService =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_container_service_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_container_service_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128UpdateContainerService" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_container_service_result_of_yojson
            ~error_deserializer
  end
module UpdateDistribution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_distribution_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_distribution_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128UpdateDistribution" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_distribution_result_of_yojson
            ~error_deserializer
  end
module UpdateDistributionBundle =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_distribution_bundle_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_distribution_bundle_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128UpdateDistributionBundle" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_distribution_bundle_result_of_yojson
            ~error_deserializer
  end
module UpdateDomainEntry =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_domain_entry_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_domain_entry_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128UpdateDomainEntry" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_domain_entry_result_of_yojson
            ~error_deserializer
  end
module UpdateInstanceMetadataOptions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_instance_metadata_options_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_instance_metadata_options_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128UpdateInstanceMetadataOptions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_instance_metadata_options_result_of_yojson
            ~error_deserializer
  end
module UpdateLoadBalancerAttribute =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_load_balancer_attribute_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_load_balancer_attribute_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128UpdateLoadBalancerAttribute"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_load_balancer_attribute_result_of_yojson
            ~error_deserializer
  end
module UpdateRelationalDatabase =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_relational_database_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_relational_database_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128UpdateRelationalDatabase" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_relational_database_result_of_yojson
            ~error_deserializer
  end
module UpdateRelationalDatabaseParameters =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "AccountSetupInProgressException") ->
              `AccountSetupInProgressException
                (account_setup_in_progress_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "OperationFailureException") ->
              `OperationFailureException
                (operation_failure_exception_of_yojson tree path)
          | (_, "ServiceException") ->
              `ServiceException (service_exception_of_yojson tree path)
          | (_, "UnauthenticatedException") ->
              `UnauthenticatedException
                (unauthenticated_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : update_relational_database_parameters_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_relational_database_parameters_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Lightsail_20161128UpdateRelationalDatabaseParameters"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_relational_database_parameters_result_of_yojson
            ~error_deserializer
  end