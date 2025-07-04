open Types
module CancelKeyDeletion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : cancel_key_deletion_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.cancel_key_deletion_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceCancelKeyDeletion" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:cancel_key_deletion_response_of_yojson
            ~error_deserializer
  end
module ConnectCustomKeyStore =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudHsmClusterInvalidConfigurationException") ->
              `CloudHsmClusterInvalidConfigurationException
                (cloud_hsm_cluster_invalid_configuration_exception_of_yojson
                   tree path)
          | (_, "CloudHsmClusterNotActiveException") ->
              `CloudHsmClusterNotActiveException
                (cloud_hsm_cluster_not_active_exception_of_yojson tree path)
          | (_, "CustomKeyStoreInvalidStateException") ->
              `CustomKeyStoreInvalidStateException
                (custom_key_store_invalid_state_exception_of_yojson tree path)
          | (_, "CustomKeyStoreNotFoundException") ->
              `CustomKeyStoreNotFoundException
                (custom_key_store_not_found_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : connect_custom_key_store_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.connect_custom_key_store_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceConnectCustomKeyStore" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:connect_custom_key_store_response_of_yojson
            ~error_deserializer
  end
module CreateAlias =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AlreadyExistsException") ->
              `AlreadyExistsException
                (already_exists_exception_of_yojson tree path)
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidAliasNameException") ->
              `InvalidAliasNameException
                (invalid_alias_name_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_alias_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_alias_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceCreateAlias" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module CreateCustomKeyStore =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudHsmClusterInUseException") ->
              `CloudHsmClusterInUseException
                (cloud_hsm_cluster_in_use_exception_of_yojson tree path)
          | (_, "CloudHsmClusterInvalidConfigurationException") ->
              `CloudHsmClusterInvalidConfigurationException
                (cloud_hsm_cluster_invalid_configuration_exception_of_yojson
                   tree path)
          | (_, "CloudHsmClusterNotActiveException") ->
              `CloudHsmClusterNotActiveException
                (cloud_hsm_cluster_not_active_exception_of_yojson tree path)
          | (_, "CloudHsmClusterNotFoundException") ->
              `CloudHsmClusterNotFoundException
                (cloud_hsm_cluster_not_found_exception_of_yojson tree path)
          | (_, "CustomKeyStoreNameInUseException") ->
              `CustomKeyStoreNameInUseException
                (custom_key_store_name_in_use_exception_of_yojson tree path)
          | (_, "IncorrectTrustAnchorException") ->
              `IncorrectTrustAnchorException
                (incorrect_trust_anchor_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "XksProxyIncorrectAuthenticationCredentialException") ->
              `XksProxyIncorrectAuthenticationCredentialException
                (xks_proxy_incorrect_authentication_credential_exception_of_yojson
                   tree path)
          | (_, "XksProxyInvalidConfigurationException") ->
              `XksProxyInvalidConfigurationException
                (xks_proxy_invalid_configuration_exception_of_yojson tree
                   path)
          | (_, "XksProxyInvalidResponseException") ->
              `XksProxyInvalidResponseException
                (xks_proxy_invalid_response_exception_of_yojson tree path)
          | (_, "XksProxyUriEndpointInUseException") ->
              `XksProxyUriEndpointInUseException
                (xks_proxy_uri_endpoint_in_use_exception_of_yojson tree path)
          | (_, "XksProxyUriInUseException") ->
              `XksProxyUriInUseException
                (xks_proxy_uri_in_use_exception_of_yojson tree path)
          | (_, "XksProxyUriUnreachableException") ->
              `XksProxyUriUnreachableException
                (xks_proxy_uri_unreachable_exception_of_yojson tree path)
          | (_, "XksProxyVpcEndpointServiceInUseException") ->
              `XksProxyVpcEndpointServiceInUseException
                (xks_proxy_vpc_endpoint_service_in_use_exception_of_yojson
                   tree path)
          | (_, "XksProxyVpcEndpointServiceInvalidConfigurationException") ->
              `XksProxyVpcEndpointServiceInvalidConfigurationException
                (xks_proxy_vpc_endpoint_service_invalid_configuration_exception_of_yojson
                   tree path)
          | (_, "XksProxyVpcEndpointServiceNotFoundException") ->
              `XksProxyVpcEndpointServiceNotFoundException
                (xks_proxy_vpc_endpoint_service_not_found_exception_of_yojson
                   tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_custom_key_store_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_custom_key_store_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceCreateCustomKeyStore" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_custom_key_store_response_of_yojson
            ~error_deserializer
  end
module CreateGrant =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_grant_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_grant_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceCreateGrant" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_grant_response_of_yojson
            ~error_deserializer
  end
module CreateKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudHsmClusterInvalidConfigurationException") ->
              `CloudHsmClusterInvalidConfigurationException
                (cloud_hsm_cluster_invalid_configuration_exception_of_yojson
                   tree path)
          | (_, "CustomKeyStoreInvalidStateException") ->
              `CustomKeyStoreInvalidStateException
                (custom_key_store_invalid_state_exception_of_yojson tree path)
          | (_, "CustomKeyStoreNotFoundException") ->
              `CustomKeyStoreNotFoundException
                (custom_key_store_not_found_exception_of_yojson tree path)
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "MalformedPolicyDocumentException") ->
              `MalformedPolicyDocumentException
                (malformed_policy_document_exception_of_yojson tree path)
          | (_, "TagException") ->
              `TagException (tag_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | (_, "XksKeyAlreadyInUseException") ->
              `XksKeyAlreadyInUseException
                (xks_key_already_in_use_exception_of_yojson tree path)
          | (_, "XksKeyInvalidConfigurationException") ->
              `XksKeyInvalidConfigurationException
                (xks_key_invalid_configuration_exception_of_yojson tree path)
          | (_, "XksKeyNotFoundException") ->
              `XksKeyNotFoundException
                (xks_key_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceCreateKey" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_key_response_of_yojson
            ~error_deserializer
  end
module Decrypt =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "IncorrectKeyException") ->
              `IncorrectKeyException
                (incorrect_key_exception_of_yojson tree path)
          | (_, "InvalidCiphertextException") ->
              `InvalidCiphertextException
                (invalid_ciphertext_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : decrypt_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.decrypt_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceDecrypt" ~service ~config:context.config
            ~http:context.http ~input
            ~output_deserializer:decrypt_response_of_yojson
            ~error_deserializer
  end
module DeleteAlias =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_alias_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_alias_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceDeleteAlias" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteCustomKeyStore =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CustomKeyStoreHasCMKsException") ->
              `CustomKeyStoreHasCMKsException
                (custom_key_store_has_cm_ks_exception_of_yojson tree path)
          | (_, "CustomKeyStoreInvalidStateException") ->
              `CustomKeyStoreInvalidStateException
                (custom_key_store_invalid_state_exception_of_yojson tree path)
          | (_, "CustomKeyStoreNotFoundException") ->
              `CustomKeyStoreNotFoundException
                (custom_key_store_not_found_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_custom_key_store_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_custom_key_store_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceDeleteCustomKeyStore" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_custom_key_store_response_of_yojson
            ~error_deserializer
  end
module DeleteImportedKeyMaterial =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_imported_key_material_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_imported_key_material_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceDeleteImportedKeyMaterial" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeriveSharedSecret =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : derive_shared_secret_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.derive_shared_secret_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceDeriveSharedSecret" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:derive_shared_secret_response_of_yojson
            ~error_deserializer
  end
module DescribeCustomKeyStores =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CustomKeyStoreNotFoundException") ->
              `CustomKeyStoreNotFoundException
                (custom_key_store_not_found_exception_of_yojson tree path)
          | (_, "InvalidMarkerException") ->
              `InvalidMarkerException
                (invalid_marker_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_custom_key_stores_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_custom_key_stores_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceDescribeCustomKeyStores" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_custom_key_stores_response_of_yojson
            ~error_deserializer
  end
module DescribeKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceDescribeKey" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_key_response_of_yojson
            ~error_deserializer
  end
module DisableKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disable_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.disable_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceDisableKey" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DisableKeyRotation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disable_key_rotation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disable_key_rotation_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceDisableKeyRotation" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DisconnectCustomKeyStore =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CustomKeyStoreInvalidStateException") ->
              `CustomKeyStoreInvalidStateException
                (custom_key_store_invalid_state_exception_of_yojson tree path)
          | (_, "CustomKeyStoreNotFoundException") ->
              `CustomKeyStoreNotFoundException
                (custom_key_store_not_found_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disconnect_custom_key_store_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disconnect_custom_key_store_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceDisconnectCustomKeyStore" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:disconnect_custom_key_store_response_of_yojson
            ~error_deserializer
  end
module EnableKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : enable_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.enable_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceEnableKey" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module EnableKeyRotation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : enable_key_rotation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.enable_key_rotation_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceEnableKeyRotation" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module Encrypt =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : encrypt_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.encrypt_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceEncrypt" ~service ~config:context.config
            ~http:context.http ~input
            ~output_deserializer:encrypt_response_of_yojson
            ~error_deserializer
  end
module GenerateDataKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : generate_data_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.generate_data_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceGenerateDataKey" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:generate_data_key_response_of_yojson
            ~error_deserializer
  end
module GenerateDataKeyPair =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : generate_data_key_pair_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.generate_data_key_pair_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceGenerateDataKeyPair" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:generate_data_key_pair_response_of_yojson
            ~error_deserializer
  end
module GenerateDataKeyPairWithoutPlaintext =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : generate_data_key_pair_without_plaintext_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.generate_data_key_pair_without_plaintext_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceGenerateDataKeyPairWithoutPlaintext"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:generate_data_key_pair_without_plaintext_response_of_yojson
            ~error_deserializer
  end
module GenerateDataKeyWithoutPlaintext =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : generate_data_key_without_plaintext_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.generate_data_key_without_plaintext_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceGenerateDataKeyWithoutPlaintext"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:generate_data_key_without_plaintext_response_of_yojson
            ~error_deserializer
  end
module GenerateMac =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : generate_mac_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.generate_mac_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceGenerateMac" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:generate_mac_response_of_yojson
            ~error_deserializer
  end
module GenerateRandom =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CustomKeyStoreInvalidStateException") ->
              `CustomKeyStoreInvalidStateException
                (custom_key_store_invalid_state_exception_of_yojson tree path)
          | (_, "CustomKeyStoreNotFoundException") ->
              `CustomKeyStoreNotFoundException
                (custom_key_store_not_found_exception_of_yojson tree path)
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : generate_random_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.generate_random_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceGenerateRandom" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:generate_random_response_of_yojson
            ~error_deserializer
  end
module GetKeyPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_key_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_key_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceGetKeyPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_key_policy_response_of_yojson
            ~error_deserializer
  end
module GetKeyRotationStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_key_rotation_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_key_rotation_status_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceGetKeyRotationStatus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_key_rotation_status_response_of_yojson
            ~error_deserializer
  end
module GetParametersForImport =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_parameters_for_import_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_parameters_for_import_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceGetParametersForImport" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_parameters_for_import_response_of_yojson
            ~error_deserializer
  end
module GetPublicKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_public_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_public_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceGetPublicKey" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_public_key_response_of_yojson
            ~error_deserializer
  end
module ImportKeyMaterial =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "ExpiredImportTokenException") ->
              `ExpiredImportTokenException
                (expired_import_token_exception_of_yojson tree path)
          | (_, "IncorrectKeyMaterialException") ->
              `IncorrectKeyMaterialException
                (incorrect_key_material_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidCiphertextException") ->
              `InvalidCiphertextException
                (invalid_ciphertext_exception_of_yojson tree path)
          | (_, "InvalidImportTokenException") ->
              `InvalidImportTokenException
                (invalid_import_token_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : import_key_material_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.import_key_material_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceImportKeyMaterial" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:import_key_material_response_of_yojson
            ~error_deserializer
  end
module ListAliases =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidMarkerException") ->
              `InvalidMarkerException
                (invalid_marker_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_aliases_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_aliases_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceListAliases" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_aliases_response_of_yojson
            ~error_deserializer
  end
module ListGrants =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidGrantIdException") ->
              `InvalidGrantIdException
                (invalid_grant_id_exception_of_yojson tree path)
          | (_, "InvalidMarkerException") ->
              `InvalidMarkerException
                (invalid_marker_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_grants_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_grants_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceListGrants" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_grants_response_of_yojson
            ~error_deserializer
  end
module ListKeyPolicies =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_key_policies_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_key_policies_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceListKeyPolicies" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_key_policies_response_of_yojson
            ~error_deserializer
  end
module ListKeyRotations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidMarkerException") ->
              `InvalidMarkerException
                (invalid_marker_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_key_rotations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_key_rotations_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceListKeyRotations" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_key_rotations_response_of_yojson
            ~error_deserializer
  end
module ListKeys =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidMarkerException") ->
              `InvalidMarkerException
                (invalid_marker_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_keys_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_keys_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceListKeys" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_keys_response_of_yojson
            ~error_deserializer
  end
module ListResourceTags =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidMarkerException") ->
              `InvalidMarkerException
                (invalid_marker_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_resource_tags_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_resource_tags_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceListResourceTags" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_resource_tags_response_of_yojson
            ~error_deserializer
  end
module ListRetirableGrants =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidMarkerException") ->
              `InvalidMarkerException
                (invalid_marker_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_retirable_grants_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_retirable_grants_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceListRetirableGrants" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_grants_response_of_yojson
            ~error_deserializer
  end
module PutKeyPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "MalformedPolicyDocumentException") ->
              `MalformedPolicyDocumentException
                (malformed_policy_document_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_key_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_key_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServicePutKeyPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module ReEncrypt =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "IncorrectKeyException") ->
              `IncorrectKeyException
                (incorrect_key_exception_of_yojson tree path)
          | (_, "InvalidCiphertextException") ->
              `InvalidCiphertextException
                (invalid_ciphertext_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : re_encrypt_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.re_encrypt_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceReEncrypt" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:re_encrypt_response_of_yojson
            ~error_deserializer
  end
module ReplicateKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AlreadyExistsException") ->
              `AlreadyExistsException
                (already_exists_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "MalformedPolicyDocumentException") ->
              `MalformedPolicyDocumentException
                (malformed_policy_document_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "TagException") ->
              `TagException (tag_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : replicate_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.replicate_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceReplicateKey" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:replicate_key_response_of_yojson
            ~error_deserializer
  end
module RetireGrant =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidGrantIdException") ->
              `InvalidGrantIdException
                (invalid_grant_id_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : retire_grant_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.retire_grant_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceRetireGrant" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RevokeGrant =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "InvalidGrantIdException") ->
              `InvalidGrantIdException
                (invalid_grant_id_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : revoke_grant_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.revoke_grant_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceRevokeGrant" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RotateKeyOnDemand =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : rotate_key_on_demand_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.rotate_key_on_demand_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceRotateKeyOnDemand" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:rotate_key_on_demand_response_of_yojson
            ~error_deserializer
  end
module ScheduleKeyDeletion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : schedule_key_deletion_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.schedule_key_deletion_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceScheduleKeyDeletion" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:schedule_key_deletion_response_of_yojson
            ~error_deserializer
  end
module Sign =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : sign_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.sign_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TrentServiceSign"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:sign_response_of_yojson ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "TagException") ->
              `TagException (tag_exception_of_yojson tree path)
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
            ~shape_name:"TrentServiceTagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "TagException") ->
              `TagException (tag_exception_of_yojson tree path)
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
            ~shape_name:"TrentServiceUntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UpdateAlias =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_alias_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_alias_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceUpdateAlias" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UpdateCustomKeyStore =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudHsmClusterInvalidConfigurationException") ->
              `CloudHsmClusterInvalidConfigurationException
                (cloud_hsm_cluster_invalid_configuration_exception_of_yojson
                   tree path)
          | (_, "CloudHsmClusterNotActiveException") ->
              `CloudHsmClusterNotActiveException
                (cloud_hsm_cluster_not_active_exception_of_yojson tree path)
          | (_, "CloudHsmClusterNotFoundException") ->
              `CloudHsmClusterNotFoundException
                (cloud_hsm_cluster_not_found_exception_of_yojson tree path)
          | (_, "CloudHsmClusterNotRelatedException") ->
              `CloudHsmClusterNotRelatedException
                (cloud_hsm_cluster_not_related_exception_of_yojson tree path)
          | (_, "CustomKeyStoreInvalidStateException") ->
              `CustomKeyStoreInvalidStateException
                (custom_key_store_invalid_state_exception_of_yojson tree path)
          | (_, "CustomKeyStoreNameInUseException") ->
              `CustomKeyStoreNameInUseException
                (custom_key_store_name_in_use_exception_of_yojson tree path)
          | (_, "CustomKeyStoreNotFoundException") ->
              `CustomKeyStoreNotFoundException
                (custom_key_store_not_found_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "XksProxyIncorrectAuthenticationCredentialException") ->
              `XksProxyIncorrectAuthenticationCredentialException
                (xks_proxy_incorrect_authentication_credential_exception_of_yojson
                   tree path)
          | (_, "XksProxyInvalidConfigurationException") ->
              `XksProxyInvalidConfigurationException
                (xks_proxy_invalid_configuration_exception_of_yojson tree
                   path)
          | (_, "XksProxyInvalidResponseException") ->
              `XksProxyInvalidResponseException
                (xks_proxy_invalid_response_exception_of_yojson tree path)
          | (_, "XksProxyUriEndpointInUseException") ->
              `XksProxyUriEndpointInUseException
                (xks_proxy_uri_endpoint_in_use_exception_of_yojson tree path)
          | (_, "XksProxyUriInUseException") ->
              `XksProxyUriInUseException
                (xks_proxy_uri_in_use_exception_of_yojson tree path)
          | (_, "XksProxyUriUnreachableException") ->
              `XksProxyUriUnreachableException
                (xks_proxy_uri_unreachable_exception_of_yojson tree path)
          | (_, "XksProxyVpcEndpointServiceInUseException") ->
              `XksProxyVpcEndpointServiceInUseException
                (xks_proxy_vpc_endpoint_service_in_use_exception_of_yojson
                   tree path)
          | (_, "XksProxyVpcEndpointServiceInvalidConfigurationException") ->
              `XksProxyVpcEndpointServiceInvalidConfigurationException
                (xks_proxy_vpc_endpoint_service_invalid_configuration_exception_of_yojson
                   tree path)
          | (_, "XksProxyVpcEndpointServiceNotFoundException") ->
              `XksProxyVpcEndpointServiceNotFoundException
                (xks_proxy_vpc_endpoint_service_not_found_exception_of_yojson
                   tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_custom_key_store_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_custom_key_store_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceUpdateCustomKeyStore" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_custom_key_store_response_of_yojson
            ~error_deserializer
  end
module UpdateKeyDescription =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_key_description_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_key_description_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceUpdateKeyDescription" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UpdatePrimaryRegion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "InvalidArnException") ->
              `InvalidArnException
                (invalid_arn_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_primary_region_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_primary_region_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceUpdatePrimaryRegion" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module Verify =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DependencyTimeoutException") ->
              `DependencyTimeoutException
                (dependency_timeout_exception_of_yojson tree path)
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidSignatureException") ->
              `KMSInvalidSignatureException
                (kms_invalid_signature_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : verify_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.verify_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceVerify" ~service ~config:context.config
            ~http:context.http ~input
            ~output_deserializer:verify_response_of_yojson
            ~error_deserializer
  end
module VerifyMac =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DisabledException") ->
              `DisabledException (disabled_exception_of_yojson tree path)
          | (_, "DryRunOperationException") ->
              `DryRunOperationException
                (dry_run_operation_exception_of_yojson tree path)
          | (_, "InvalidGrantTokenException") ->
              `InvalidGrantTokenException
                (invalid_grant_token_exception_of_yojson tree path)
          | (_, "InvalidKeyUsageException") ->
              `InvalidKeyUsageException
                (invalid_key_usage_exception_of_yojson tree path)
          | (_, "KeyUnavailableException") ->
              `KeyUnavailableException
                (key_unavailable_exception_of_yojson tree path)
          | (_, "KMSInternalException") ->
              `KMSInternalException
                (kms_internal_exception_of_yojson tree path)
          | (_, "KMSInvalidMacException") ->
              `KMSInvalidMacException
                (kms_invalid_mac_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : verify_mac_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.verify_mac_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TrentServiceVerifyMac" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:verify_mac_response_of_yojson
            ~error_deserializer
  end