open Types
open Service_metadata
module AddTags =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ChannelARNInvalidException") ->
              `ChannelARNInvalidException
                (channel_arn_invalid_exception_of_yojson tree path)
          | (_, "ChannelNotFoundException") ->
              `ChannelNotFoundException
                (channel_not_found_exception_of_yojson tree path)
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InvalidTagParameterException") ->
              `InvalidTagParameterException
                (invalid_tag_parameter_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourceTypeNotSupportedException") ->
              `ResourceTypeNotSupportedException
                (resource_type_not_supported_exception_of_yojson tree path)
          | (_, "TagsLimitExceededException") ->
              `TagsLimitExceededException
                (tags_limit_exceeded_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : add_tags_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.add_tags_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101AddTags" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:add_tags_response_of_yojson
            ~error_deserializer
  end
module CancelQuery =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InactiveQueryException") ->
              `InactiveQueryException
                (inactive_query_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "QueryIdNotFoundException") ->
              `QueryIdNotFoundException
                (query_id_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : cancel_query_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.cancel_query_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101CancelQuery" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:cancel_query_response_of_yojson
            ~error_deserializer
  end
module CreateChannel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ChannelAlreadyExistsException") ->
              `ChannelAlreadyExistsException
                (channel_already_exists_exception_of_yojson tree path)
          | (_, "ChannelMaxLimitExceededException") ->
              `ChannelMaxLimitExceededException
                (channel_max_limit_exceeded_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InvalidEventDataStoreCategoryException") ->
              `InvalidEventDataStoreCategoryException
                (invalid_event_data_store_category_exception_of_yojson tree
                   path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidSourceException") ->
              `InvalidSourceException
                (invalid_source_exception_of_yojson tree path)
          | (_, "InvalidTagParameterException") ->
              `InvalidTagParameterException
                (invalid_tag_parameter_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "TagsLimitExceededException") ->
              `TagsLimitExceededException
                (tags_limit_exceeded_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_channel_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_channel_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101CreateChannel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_channel_response_of_yojson
            ~error_deserializer
  end
module CreateDashboard =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InsufficientEncryptionPolicyException") ->
              `InsufficientEncryptionPolicyException
                (insufficient_encryption_policy_exception_of_yojson tree path)
          | (_, "InvalidQueryStatementException") ->
              `InvalidQueryStatementException
                (invalid_query_statement_exception_of_yojson tree path)
          | (_, "InvalidTagParameterException") ->
              `InvalidTagParameterException
                (invalid_tag_parameter_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_dashboard_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_dashboard_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101CreateDashboard" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_dashboard_response_of_yojson
            ~error_deserializer
  end
module CreateEventDataStore =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailAccessNotEnabledException") ->
              `CloudTrailAccessNotEnabledException
                (cloud_trail_access_not_enabled_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EventDataStoreAlreadyExistsException") ->
              `EventDataStoreAlreadyExistsException
                (event_data_store_already_exists_exception_of_yojson tree
                   path)
          | (_, "EventDataStoreMaxLimitExceededException") ->
              `EventDataStoreMaxLimitExceededException
                (event_data_store_max_limit_exceeded_exception_of_yojson tree
                   path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InsufficientEncryptionPolicyException") ->
              `InsufficientEncryptionPolicyException
                (insufficient_encryption_policy_exception_of_yojson tree path)
          | (_, "InvalidEventSelectorsException") ->
              `InvalidEventSelectorsException
                (invalid_event_selectors_exception_of_yojson tree path)
          | (_, "InvalidKmsKeyIdException") ->
              `InvalidKmsKeyIdException
                (invalid_kms_key_id_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidTagParameterException") ->
              `InvalidTagParameterException
                (invalid_tag_parameter_exception_of_yojson tree path)
          | (_, "KmsException") ->
              `KmsException (kms_exception_of_yojson tree path)
          | (_, "KmsKeyNotFoundException") ->
              `KmsKeyNotFoundException
                (kms_key_not_found_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "OrganizationNotInAllFeaturesModeException") ->
              `OrganizationNotInAllFeaturesModeException
                (organization_not_in_all_features_mode_exception_of_yojson
                   tree path)
          | (_, "OrganizationsNotInUseException") ->
              `OrganizationsNotInUseException
                (organizations_not_in_use_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_event_data_store_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_event_data_store_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101CreateEventDataStore" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_event_data_store_response_of_yojson
            ~error_deserializer
  end
module CreateTrail =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailAccessNotEnabledException") ->
              `CloudTrailAccessNotEnabledException
                (cloud_trail_access_not_enabled_exception_of_yojson tree path)
          | (_, "CloudTrailInvalidClientTokenIdException") ->
              `CloudTrailInvalidClientTokenIdException
                (cloud_trail_invalid_client_token_id_exception_of_yojson tree
                   path)
          | (_, "CloudWatchLogsDeliveryUnavailableException") ->
              `CloudWatchLogsDeliveryUnavailableException
                (cloud_watch_logs_delivery_unavailable_exception_of_yojson
                   tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InsufficientEncryptionPolicyException") ->
              `InsufficientEncryptionPolicyException
                (insufficient_encryption_policy_exception_of_yojson tree path)
          | (_, "InsufficientS3BucketPolicyException") ->
              `InsufficientS3BucketPolicyException
                (insufficient_s3_bucket_policy_exception_of_yojson tree path)
          | (_, "InsufficientSnsTopicPolicyException") ->
              `InsufficientSnsTopicPolicyException
                (insufficient_sns_topic_policy_exception_of_yojson tree path)
          | (_, "InvalidCloudWatchLogsLogGroupArnException") ->
              `InvalidCloudWatchLogsLogGroupArnException
                (invalid_cloud_watch_logs_log_group_arn_exception_of_yojson
                   tree path)
          | (_, "InvalidCloudWatchLogsRoleArnException") ->
              `InvalidCloudWatchLogsRoleArnException
                (invalid_cloud_watch_logs_role_arn_exception_of_yojson tree
                   path)
          | (_, "InvalidKmsKeyIdException") ->
              `InvalidKmsKeyIdException
                (invalid_kms_key_id_exception_of_yojson tree path)
          | (_, "InvalidParameterCombinationException") ->
              `InvalidParameterCombinationException
                (invalid_parameter_combination_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidS3BucketNameException") ->
              `InvalidS3BucketNameException
                (invalid_s3_bucket_name_exception_of_yojson tree path)
          | (_, "InvalidS3PrefixException") ->
              `InvalidS3PrefixException
                (invalid_s3_prefix_exception_of_yojson tree path)
          | (_, "InvalidSnsTopicNameException") ->
              `InvalidSnsTopicNameException
                (invalid_sns_topic_name_exception_of_yojson tree path)
          | (_, "InvalidTagParameterException") ->
              `InvalidTagParameterException
                (invalid_tag_parameter_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "KmsException") ->
              `KmsException (kms_exception_of_yojson tree path)
          | (_, "KmsKeyDisabledException") ->
              `KmsKeyDisabledException
                (kms_key_disabled_exception_of_yojson tree path)
          | (_, "KmsKeyNotFoundException") ->
              `KmsKeyNotFoundException
                (kms_key_not_found_exception_of_yojson tree path)
          | (_, "MaximumNumberOfTrailsExceededException") ->
              `MaximumNumberOfTrailsExceededException
                (maximum_number_of_trails_exceeded_exception_of_yojson tree
                   path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "OrganizationNotInAllFeaturesModeException") ->
              `OrganizationNotInAllFeaturesModeException
                (organization_not_in_all_features_mode_exception_of_yojson
                   tree path)
          | (_, "OrganizationsNotInUseException") ->
              `OrganizationsNotInUseException
                (organizations_not_in_use_exception_of_yojson tree path)
          | (_, "S3BucketDoesNotExistException") ->
              `S3BucketDoesNotExistException
                (s3_bucket_does_not_exist_exception_of_yojson tree path)
          | (_, "TagsLimitExceededException") ->
              `TagsLimitExceededException
                (tags_limit_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "TrailAlreadyExistsException") ->
              `TrailAlreadyExistsException
                (trail_already_exists_exception_of_yojson tree path)
          | (_, "TrailNotProvidedException") ->
              `TrailNotProvidedException
                (trail_not_provided_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_trail_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_trail_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101CreateTrail" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_trail_response_of_yojson
            ~error_deserializer
  end
module DeleteChannel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ChannelARNInvalidException") ->
              `ChannelARNInvalidException
                (channel_arn_invalid_exception_of_yojson tree path)
          | (_, "ChannelNotFoundException") ->
              `ChannelNotFoundException
                (channel_not_found_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_channel_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_channel_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101DeleteChannel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_channel_response_of_yojson
            ~error_deserializer
  end
module DeleteDashboard =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_dashboard_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_dashboard_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101DeleteDashboard" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_dashboard_response_of_yojson
            ~error_deserializer
  end
module DeleteEventDataStore =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ChannelExistsForEDSException") ->
              `ChannelExistsForEDSException
                (channel_exists_for_eds_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreFederationEnabledException") ->
              `EventDataStoreFederationEnabledException
                (event_data_store_federation_enabled_exception_of_yojson tree
                   path)
          | (_, "EventDataStoreHasOngoingImportException") ->
              `EventDataStoreHasOngoingImportException
                (event_data_store_has_ongoing_import_exception_of_yojson tree
                   path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "EventDataStoreTerminationProtectedException") ->
              `EventDataStoreTerminationProtectedException
                (event_data_store_termination_protected_exception_of_yojson
                   tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_event_data_store_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_event_data_store_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101DeleteEventDataStore" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_event_data_store_response_of_yojson
            ~error_deserializer
  end
module DeleteResourcePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ResourceARNNotValidException") ->
              `ResourceARNNotValidException
                (resource_arn_not_valid_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourcePolicyNotFoundException") ->
              `ResourcePolicyNotFoundException
                (resource_policy_not_found_exception_of_yojson tree path)
          | (_, "ResourceTypeNotSupportedException") ->
              `ResourceTypeNotSupportedException
                (resource_type_not_supported_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_resource_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_resource_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101DeleteResourcePolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_resource_policy_response_of_yojson
            ~error_deserializer
  end
module DeleteTrail =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InvalidHomeRegionException") ->
              `InvalidHomeRegionException
                (invalid_home_region_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "TrailNotFoundException") ->
              `TrailNotFoundException
                (trail_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_trail_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_trail_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101DeleteTrail" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_trail_response_of_yojson
            ~error_deserializer
  end
module DeregisterOrganizationDelegatedAdmin =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccountNotFoundException") ->
              `AccountNotFoundException
                (account_not_found_exception_of_yojson tree path)
          | (_, "AccountNotRegisteredException") ->
              `AccountNotRegisteredException
                (account_not_registered_exception_of_yojson tree path)
          | (_, "CloudTrailAccessNotEnabledException") ->
              `CloudTrailAccessNotEnabledException
                (cloud_trail_access_not_enabled_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotOrganizationManagementAccountException") ->
              `NotOrganizationManagementAccountException
                (not_organization_management_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "OrganizationNotInAllFeaturesModeException") ->
              `OrganizationNotInAllFeaturesModeException
                (organization_not_in_all_features_mode_exception_of_yojson
                   tree path)
          | (_, "OrganizationsNotInUseException") ->
              `OrganizationsNotInUseException
                (organizations_not_in_use_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : deregister_organization_delegated_admin_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deregister_organization_delegated_admin_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101DeregisterOrganizationDelegatedAdmin"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:deregister_organization_delegated_admin_response_of_yojson
            ~error_deserializer
  end
module DescribeQuery =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "QueryIdNotFoundException") ->
              `QueryIdNotFoundException
                (query_id_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_query_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_query_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101DescribeQuery" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_query_response_of_yojson
            ~error_deserializer
  end
module DescribeTrails =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_trails_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_trails_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101DescribeTrails" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_trails_response_of_yojson
            ~error_deserializer
  end
module DisableFederation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "CloudTrailAccessNotEnabledException") ->
              `CloudTrailAccessNotEnabledException
                (cloud_trail_access_not_enabled_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "OrganizationNotInAllFeaturesModeException") ->
              `OrganizationNotInAllFeaturesModeException
                (organization_not_in_all_features_mode_exception_of_yojson
                   tree path)
          | (_, "OrganizationsNotInUseException") ->
              `OrganizationsNotInUseException
                (organizations_not_in_use_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disable_federation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disable_federation_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101DisableFederation" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:disable_federation_response_of_yojson
            ~error_deserializer
  end
module EnableFederation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "CloudTrailAccessNotEnabledException") ->
              `CloudTrailAccessNotEnabledException
                (cloud_trail_access_not_enabled_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreFederationEnabledException") ->
              `EventDataStoreFederationEnabledException
                (event_data_store_federation_enabled_exception_of_yojson tree
                   path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "OrganizationNotInAllFeaturesModeException") ->
              `OrganizationNotInAllFeaturesModeException
                (organization_not_in_all_features_mode_exception_of_yojson
                   tree path)
          | (_, "OrganizationsNotInUseException") ->
              `OrganizationsNotInUseException
                (organizations_not_in_use_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : enable_federation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.enable_federation_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101EnableFederation" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:enable_federation_response_of_yojson
            ~error_deserializer
  end
module GenerateQuery =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "GenerateResponseException") ->
              `GenerateResponseException
                (generate_response_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : generate_query_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.generate_query_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GenerateQuery" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:generate_query_response_of_yojson
            ~error_deserializer
  end
module GetChannel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ChannelARNInvalidException") ->
              `ChannelARNInvalidException
                (channel_arn_invalid_exception_of_yojson tree path)
          | (_, "ChannelNotFoundException") ->
              `ChannelNotFoundException
                (channel_not_found_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_channel_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_channel_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GetChannel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_channel_response_of_yojson
            ~error_deserializer
  end
module GetDashboard =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_dashboard_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_dashboard_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GetDashboard" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_dashboard_response_of_yojson
            ~error_deserializer
  end
module GetEventConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InvalidEventDataStoreCategoryException") ->
              `InvalidEventDataStoreCategoryException
                (invalid_event_data_store_category_exception_of_yojson tree
                   path)
          | (_, "InvalidEventDataStoreStatusException") ->
              `InvalidEventDataStoreStatusException
                (invalid_event_data_store_status_exception_of_yojson tree
                   path)
          | (_, "InvalidParameterCombinationException") ->
              `InvalidParameterCombinationException
                (invalid_parameter_combination_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_event_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_event_configuration_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GetEventConfiguration" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_event_configuration_response_of_yojson
            ~error_deserializer
  end
module GetEventDataStore =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_event_data_store_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_event_data_store_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GetEventDataStore" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_event_data_store_response_of_yojson
            ~error_deserializer
  end
module GetEventSelectors =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "TrailNotFoundException") ->
              `TrailNotFoundException
                (trail_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_event_selectors_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_event_selectors_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GetEventSelectors" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_event_selectors_response_of_yojson
            ~error_deserializer
  end
module GetImport =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ImportNotFoundException") ->
              `ImportNotFoundException
                (import_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_import_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_import_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GetImport" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_import_response_of_yojson
            ~error_deserializer
  end
module GetInsightSelectors =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "InsightNotEnabledException") ->
              `InsightNotEnabledException
                (insight_not_enabled_exception_of_yojson tree path)
          | (_, "InvalidParameterCombinationException") ->
              `InvalidParameterCombinationException
                (invalid_parameter_combination_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "TrailNotFoundException") ->
              `TrailNotFoundException
                (trail_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_insight_selectors_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_insight_selectors_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GetInsightSelectors" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_insight_selectors_response_of_yojson
            ~error_deserializer
  end
module GetQueryResults =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InsufficientEncryptionPolicyException") ->
              `InsufficientEncryptionPolicyException
                (insufficient_encryption_policy_exception_of_yojson tree path)
          | (_, "InvalidMaxResultsException") ->
              `InvalidMaxResultsException
                (invalid_max_results_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "QueryIdNotFoundException") ->
              `QueryIdNotFoundException
                (query_id_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_query_results_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_query_results_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GetQueryResults" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_query_results_response_of_yojson
            ~error_deserializer
  end
module GetResourcePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ResourceARNNotValidException") ->
              `ResourceARNNotValidException
                (resource_arn_not_valid_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourcePolicyNotFoundException") ->
              `ResourcePolicyNotFoundException
                (resource_policy_not_found_exception_of_yojson tree path)
          | (_, "ResourceTypeNotSupportedException") ->
              `ResourceTypeNotSupportedException
                (resource_type_not_supported_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_resource_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_resource_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GetResourcePolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_resource_policy_response_of_yojson
            ~error_deserializer
  end
module GetTrail =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "TrailNotFoundException") ->
              `TrailNotFoundException
                (trail_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_trail_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_trail_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GetTrail" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_trail_response_of_yojson
            ~error_deserializer
  end
module GetTrailStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "TrailNotFoundException") ->
              `TrailNotFoundException
                (trail_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_trail_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_trail_status_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101GetTrailStatus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_trail_status_response_of_yojson
            ~error_deserializer
  end
module ListChannels =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_channels_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_channels_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101ListChannels" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_channels_response_of_yojson
            ~error_deserializer
  end
module ListDashboards =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_dashboards_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_dashboards_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101ListDashboards" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_dashboards_response_of_yojson
            ~error_deserializer
  end
module ListEventDataStores =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidMaxResultsException") ->
              `InvalidMaxResultsException
                (invalid_max_results_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_event_data_stores_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_event_data_stores_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101ListEventDataStores" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_event_data_stores_response_of_yojson
            ~error_deserializer
  end
module ListImportFailures =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_import_failures_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_import_failures_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101ListImportFailures" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_import_failures_response_of_yojson
            ~error_deserializer
  end
module ListImports =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_imports_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_imports_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101ListImports" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_imports_response_of_yojson
            ~error_deserializer
  end
module ListInsightsMetricData =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_insights_metric_data_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_insights_metric_data_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101ListInsightsMetricData" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_insights_metric_data_response_of_yojson
            ~error_deserializer
  end
module ListPublicKeys =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidTimeRangeException") ->
              `InvalidTimeRangeException
                (invalid_time_range_exception_of_yojson tree path)
          | (_, "InvalidTokenException") ->
              `InvalidTokenException
                (invalid_token_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_public_keys_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_public_keys_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101ListPublicKeys" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_public_keys_response_of_yojson
            ~error_deserializer
  end
module ListQueries =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InvalidDateRangeException") ->
              `InvalidDateRangeException
                (invalid_date_range_exception_of_yojson tree path)
          | (_, "InvalidMaxResultsException") ->
              `InvalidMaxResultsException
                (invalid_max_results_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidQueryStatusException") ->
              `InvalidQueryStatusException
                (invalid_query_status_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_queries_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_queries_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101ListQueries" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_queries_response_of_yojson
            ~error_deserializer
  end
module ListTags =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ChannelARNInvalidException") ->
              `ChannelARNInvalidException
                (channel_arn_invalid_exception_of_yojson tree path)
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InvalidTokenException") ->
              `InvalidTokenException
                (invalid_token_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourceTypeNotSupportedException") ->
              `ResourceTypeNotSupportedException
                (resource_type_not_supported_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_tags_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101ListTags" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_response_of_yojson
            ~error_deserializer
  end
module ListTrails =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_trails_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_trails_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101ListTrails" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_trails_response_of_yojson
            ~error_deserializer
  end
module LookupEvents =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidEventCategoryException") ->
              `InvalidEventCategoryException
                (invalid_event_category_exception_of_yojson tree path)
          | (_, "InvalidLookupAttributesException") ->
              `InvalidLookupAttributesException
                (invalid_lookup_attributes_exception_of_yojson tree path)
          | (_, "InvalidMaxResultsException") ->
              `InvalidMaxResultsException
                (invalid_max_results_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidTimeRangeException") ->
              `InvalidTimeRangeException
                (invalid_time_range_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : lookup_events_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.lookup_events_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101LookupEvents" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:lookup_events_response_of_yojson
            ~error_deserializer
  end
module PutEventConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InsufficientIAMAccessPermissionException") ->
              `InsufficientIAMAccessPermissionException
                (insufficient_iam_access_permission_exception_of_yojson tree
                   path)
          | (_, "InvalidEventDataStoreCategoryException") ->
              `InvalidEventDataStoreCategoryException
                (invalid_event_data_store_category_exception_of_yojson tree
                   path)
          | (_, "InvalidEventDataStoreStatusException") ->
              `InvalidEventDataStoreStatusException
                (invalid_event_data_store_status_exception_of_yojson tree
                   path)
          | (_, "InvalidParameterCombinationException") ->
              `InvalidParameterCombinationException
                (invalid_parameter_combination_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_event_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_event_configuration_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101PutEventConfiguration" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_event_configuration_response_of_yojson
            ~error_deserializer
  end
module PutEventSelectors =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InvalidEventSelectorsException") ->
              `InvalidEventSelectorsException
                (invalid_event_selectors_exception_of_yojson tree path)
          | (_, "InvalidHomeRegionException") ->
              `InvalidHomeRegionException
                (invalid_home_region_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "TrailNotFoundException") ->
              `TrailNotFoundException
                (trail_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_event_selectors_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_event_selectors_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101PutEventSelectors" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_event_selectors_response_of_yojson
            ~error_deserializer
  end
module PutInsightSelectors =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "InsufficientEncryptionPolicyException") ->
              `InsufficientEncryptionPolicyException
                (insufficient_encryption_policy_exception_of_yojson tree path)
          | (_, "InsufficientS3BucketPolicyException") ->
              `InsufficientS3BucketPolicyException
                (insufficient_s3_bucket_policy_exception_of_yojson tree path)
          | (_, "InvalidHomeRegionException") ->
              `InvalidHomeRegionException
                (invalid_home_region_exception_of_yojson tree path)
          | (_, "InvalidInsightSelectorsException") ->
              `InvalidInsightSelectorsException
                (invalid_insight_selectors_exception_of_yojson tree path)
          | (_, "InvalidParameterCombinationException") ->
              `InvalidParameterCombinationException
                (invalid_parameter_combination_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "KmsException") ->
              `KmsException (kms_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "S3BucketDoesNotExistException") ->
              `S3BucketDoesNotExistException
                (s3_bucket_does_not_exist_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "TrailNotFoundException") ->
              `TrailNotFoundException
                (trail_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_insight_selectors_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_insight_selectors_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101PutInsightSelectors" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_insight_selectors_response_of_yojson
            ~error_deserializer
  end
module PutResourcePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ResourceARNNotValidException") ->
              `ResourceARNNotValidException
                (resource_arn_not_valid_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourcePolicyNotValidException") ->
              `ResourcePolicyNotValidException
                (resource_policy_not_valid_exception_of_yojson tree path)
          | (_, "ResourceTypeNotSupportedException") ->
              `ResourceTypeNotSupportedException
                (resource_type_not_supported_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_resource_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_resource_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101PutResourcePolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_resource_policy_response_of_yojson
            ~error_deserializer
  end
module RegisterOrganizationDelegatedAdmin =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccountNotFoundException") ->
              `AccountNotFoundException
                (account_not_found_exception_of_yojson tree path)
          | (_, "AccountRegisteredException") ->
              `AccountRegisteredException
                (account_registered_exception_of_yojson tree path)
          | (_, "CannotDelegateManagementAccountException") ->
              `CannotDelegateManagementAccountException
                (cannot_delegate_management_account_exception_of_yojson tree
                   path)
          | (_, "CloudTrailAccessNotEnabledException") ->
              `CloudTrailAccessNotEnabledException
                (cloud_trail_access_not_enabled_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "DelegatedAdminAccountLimitExceededException") ->
              `DelegatedAdminAccountLimitExceededException
                (delegated_admin_account_limit_exceeded_exception_of_yojson
                   tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InsufficientIAMAccessPermissionException") ->
              `InsufficientIAMAccessPermissionException
                (insufficient_iam_access_permission_exception_of_yojson tree
                   path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotOrganizationManagementAccountException") ->
              `NotOrganizationManagementAccountException
                (not_organization_management_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "OrganizationNotInAllFeaturesModeException") ->
              `OrganizationNotInAllFeaturesModeException
                (organization_not_in_all_features_mode_exception_of_yojson
                   tree path)
          | (_, "OrganizationsNotInUseException") ->
              `OrganizationsNotInUseException
                (organizations_not_in_use_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : register_organization_delegated_admin_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.register_organization_delegated_admin_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101RegisterOrganizationDelegatedAdmin"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:register_organization_delegated_admin_response_of_yojson
            ~error_deserializer
  end
module RemoveTags =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ChannelARNInvalidException") ->
              `ChannelARNInvalidException
                (channel_arn_invalid_exception_of_yojson tree path)
          | (_, "ChannelNotFoundException") ->
              `ChannelNotFoundException
                (channel_not_found_exception_of_yojson tree path)
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InvalidTagParameterException") ->
              `InvalidTagParameterException
                (invalid_tag_parameter_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourceTypeNotSupportedException") ->
              `ResourceTypeNotSupportedException
                (resource_type_not_supported_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : remove_tags_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.remove_tags_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101RemoveTags" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:remove_tags_response_of_yojson
            ~error_deserializer
  end
module RestoreEventDataStore =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailAccessNotEnabledException") ->
              `CloudTrailAccessNotEnabledException
                (cloud_trail_access_not_enabled_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreMaxLimitExceededException") ->
              `EventDataStoreMaxLimitExceededException
                (event_data_store_max_limit_exceeded_exception_of_yojson tree
                   path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InvalidEventDataStoreStatusException") ->
              `InvalidEventDataStoreStatusException
                (invalid_event_data_store_status_exception_of_yojson tree
                   path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "OrganizationNotInAllFeaturesModeException") ->
              `OrganizationNotInAllFeaturesModeException
                (organization_not_in_all_features_mode_exception_of_yojson
                   tree path)
          | (_, "OrganizationsNotInUseException") ->
              `OrganizationsNotInUseException
                (organizations_not_in_use_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : restore_event_data_store_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.restore_event_data_store_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101RestoreEventDataStore" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:restore_event_data_store_response_of_yojson
            ~error_deserializer
  end
module SearchSampleQueries =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : search_sample_queries_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.search_sample_queries_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101SearchSampleQueries" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:search_sample_queries_response_of_yojson
            ~error_deserializer
  end
module StartDashboardRefresh =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_dashboard_refresh_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_dashboard_refresh_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101StartDashboardRefresh" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_dashboard_refresh_response_of_yojson
            ~error_deserializer
  end
module StartEventDataStoreIngestion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InvalidEventDataStoreCategoryException") ->
              `InvalidEventDataStoreCategoryException
                (invalid_event_data_store_category_exception_of_yojson tree
                   path)
          | (_, "InvalidEventDataStoreStatusException") ->
              `InvalidEventDataStoreStatusException
                (invalid_event_data_store_status_exception_of_yojson tree
                   path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_event_data_store_ingestion_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_event_data_store_ingestion_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101StartEventDataStoreIngestion"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_event_data_store_ingestion_response_of_yojson
            ~error_deserializer
  end
module StartImport =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccountHasOngoingImportException") ->
              `AccountHasOngoingImportException
                (account_has_ongoing_import_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "ImportNotFoundException") ->
              `ImportNotFoundException
                (import_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InsufficientEncryptionPolicyException") ->
              `InsufficientEncryptionPolicyException
                (insufficient_encryption_policy_exception_of_yojson tree path)
          | (_, "InvalidEventDataStoreCategoryException") ->
              `InvalidEventDataStoreCategoryException
                (invalid_event_data_store_category_exception_of_yojson tree
                   path)
          | (_, "InvalidEventDataStoreStatusException") ->
              `InvalidEventDataStoreStatusException
                (invalid_event_data_store_status_exception_of_yojson tree
                   path)
          | (_, "InvalidImportSourceException") ->
              `InvalidImportSourceException
                (invalid_import_source_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_import_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.start_import_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101StartImport" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_import_response_of_yojson
            ~error_deserializer
  end
module StartLogging =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InvalidHomeRegionException") ->
              `InvalidHomeRegionException
                (invalid_home_region_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "TrailNotFoundException") ->
              `TrailNotFoundException
                (trail_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_logging_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.start_logging_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101StartLogging" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_logging_response_of_yojson
            ~error_deserializer
  end
module StartQuery =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InsufficientEncryptionPolicyException") ->
              `InsufficientEncryptionPolicyException
                (insufficient_encryption_policy_exception_of_yojson tree path)
          | (_, "InsufficientS3BucketPolicyException") ->
              `InsufficientS3BucketPolicyException
                (insufficient_s3_bucket_policy_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidQueryStatementException") ->
              `InvalidQueryStatementException
                (invalid_query_statement_exception_of_yojson tree path)
          | (_, "InvalidS3BucketNameException") ->
              `InvalidS3BucketNameException
                (invalid_s3_bucket_name_exception_of_yojson tree path)
          | (_, "InvalidS3PrefixException") ->
              `InvalidS3PrefixException
                (invalid_s3_prefix_exception_of_yojson tree path)
          | (_, "MaxConcurrentQueriesException") ->
              `MaxConcurrentQueriesException
                (max_concurrent_queries_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "S3BucketDoesNotExistException") ->
              `S3BucketDoesNotExistException
                (s3_bucket_does_not_exist_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_query_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.start_query_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101StartQuery" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_query_response_of_yojson
            ~error_deserializer
  end
module StopEventDataStoreIngestion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InvalidEventDataStoreCategoryException") ->
              `InvalidEventDataStoreCategoryException
                (invalid_event_data_store_category_exception_of_yojson tree
                   path)
          | (_, "InvalidEventDataStoreStatusException") ->
              `InvalidEventDataStoreStatusException
                (invalid_event_data_store_status_exception_of_yojson tree
                   path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_event_data_store_ingestion_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.stop_event_data_store_ingestion_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101StopEventDataStoreIngestion"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:stop_event_data_store_ingestion_response_of_yojson
            ~error_deserializer
  end
module StopImport =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ImportNotFoundException") ->
              `ImportNotFoundException
                (import_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_import_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.stop_import_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101StopImport" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:stop_import_response_of_yojson
            ~error_deserializer
  end
module StopLogging =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InvalidHomeRegionException") ->
              `InvalidHomeRegionException
                (invalid_home_region_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "TrailNotFoundException") ->
              `TrailNotFoundException
                (trail_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_logging_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.stop_logging_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101StopLogging" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:stop_logging_response_of_yojson
            ~error_deserializer
  end
module UpdateChannel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ChannelAlreadyExistsException") ->
              `ChannelAlreadyExistsException
                (channel_already_exists_exception_of_yojson tree path)
          | (_, "ChannelARNInvalidException") ->
              `ChannelARNInvalidException
                (channel_arn_invalid_exception_of_yojson tree path)
          | (_, "ChannelNotFoundException") ->
              `ChannelNotFoundException
                (channel_not_found_exception_of_yojson tree path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InvalidEventDataStoreCategoryException") ->
              `InvalidEventDataStoreCategoryException
                (invalid_event_data_store_category_exception_of_yojson tree
                   path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_channel_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_channel_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101UpdateChannel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_channel_response_of_yojson
            ~error_deserializer
  end
module UpdateDashboard =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InsufficientEncryptionPolicyException") ->
              `InsufficientEncryptionPolicyException
                (insufficient_encryption_policy_exception_of_yojson tree path)
          | (_, "InvalidQueryStatementException") ->
              `InvalidQueryStatementException
                (invalid_query_statement_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_dashboard_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_dashboard_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101UpdateDashboard" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_dashboard_response_of_yojson
            ~error_deserializer
  end
module UpdateEventDataStore =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailAccessNotEnabledException") ->
              `CloudTrailAccessNotEnabledException
                (cloud_trail_access_not_enabled_exception_of_yojson tree path)
          | (_, "EventDataStoreAlreadyExistsException") ->
              `EventDataStoreAlreadyExistsException
                (event_data_store_already_exists_exception_of_yojson tree
                   path)
          | (_, "EventDataStoreARNInvalidException") ->
              `EventDataStoreARNInvalidException
                (event_data_store_arn_invalid_exception_of_yojson tree path)
          | (_, "EventDataStoreHasOngoingImportException") ->
              `EventDataStoreHasOngoingImportException
                (event_data_store_has_ongoing_import_exception_of_yojson tree
                   path)
          | (_, "EventDataStoreNotFoundException") ->
              `EventDataStoreNotFoundException
                (event_data_store_not_found_exception_of_yojson tree path)
          | (_, "InactiveEventDataStoreException") ->
              `InactiveEventDataStoreException
                (inactive_event_data_store_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InsufficientEncryptionPolicyException") ->
              `InsufficientEncryptionPolicyException
                (insufficient_encryption_policy_exception_of_yojson tree path)
          | (_, "InvalidEventSelectorsException") ->
              `InvalidEventSelectorsException
                (invalid_event_selectors_exception_of_yojson tree path)
          | (_, "InvalidInsightSelectorsException") ->
              `InvalidInsightSelectorsException
                (invalid_insight_selectors_exception_of_yojson tree path)
          | (_, "InvalidKmsKeyIdException") ->
              `InvalidKmsKeyIdException
                (invalid_kms_key_id_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "KmsException") ->
              `KmsException (kms_exception_of_yojson tree path)
          | (_, "KmsKeyNotFoundException") ->
              `KmsKeyNotFoundException
                (kms_key_not_found_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "OrganizationNotInAllFeaturesModeException") ->
              `OrganizationNotInAllFeaturesModeException
                (organization_not_in_all_features_mode_exception_of_yojson
                   tree path)
          | (_, "OrganizationsNotInUseException") ->
              `OrganizationsNotInUseException
                (organizations_not_in_use_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_event_data_store_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_event_data_store_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101UpdateEventDataStore" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_event_data_store_response_of_yojson
            ~error_deserializer
  end
module UpdateTrail =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CloudTrailAccessNotEnabledException") ->
              `CloudTrailAccessNotEnabledException
                (cloud_trail_access_not_enabled_exception_of_yojson tree path)
          | (_, "CloudTrailARNInvalidException") ->
              `CloudTrailARNInvalidException
                (cloud_trail_arn_invalid_exception_of_yojson tree path)
          | (_, "CloudTrailInvalidClientTokenIdException") ->
              `CloudTrailInvalidClientTokenIdException
                (cloud_trail_invalid_client_token_id_exception_of_yojson tree
                   path)
          | (_, "CloudWatchLogsDeliveryUnavailableException") ->
              `CloudWatchLogsDeliveryUnavailableException
                (cloud_watch_logs_delivery_unavailable_exception_of_yojson
                   tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InsufficientDependencyServiceAccessPermissionException") ->
              `InsufficientDependencyServiceAccessPermissionException
                (insufficient_dependency_service_access_permission_exception_of_yojson
                   tree path)
          | (_, "InsufficientEncryptionPolicyException") ->
              `InsufficientEncryptionPolicyException
                (insufficient_encryption_policy_exception_of_yojson tree path)
          | (_, "InsufficientS3BucketPolicyException") ->
              `InsufficientS3BucketPolicyException
                (insufficient_s3_bucket_policy_exception_of_yojson tree path)
          | (_, "InsufficientSnsTopicPolicyException") ->
              `InsufficientSnsTopicPolicyException
                (insufficient_sns_topic_policy_exception_of_yojson tree path)
          | (_, "InvalidCloudWatchLogsLogGroupArnException") ->
              `InvalidCloudWatchLogsLogGroupArnException
                (invalid_cloud_watch_logs_log_group_arn_exception_of_yojson
                   tree path)
          | (_, "InvalidCloudWatchLogsRoleArnException") ->
              `InvalidCloudWatchLogsRoleArnException
                (invalid_cloud_watch_logs_role_arn_exception_of_yojson tree
                   path)
          | (_, "InvalidEventSelectorsException") ->
              `InvalidEventSelectorsException
                (invalid_event_selectors_exception_of_yojson tree path)
          | (_, "InvalidHomeRegionException") ->
              `InvalidHomeRegionException
                (invalid_home_region_exception_of_yojson tree path)
          | (_, "InvalidKmsKeyIdException") ->
              `InvalidKmsKeyIdException
                (invalid_kms_key_id_exception_of_yojson tree path)
          | (_, "InvalidParameterCombinationException") ->
              `InvalidParameterCombinationException
                (invalid_parameter_combination_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidS3BucketNameException") ->
              `InvalidS3BucketNameException
                (invalid_s3_bucket_name_exception_of_yojson tree path)
          | (_, "InvalidS3PrefixException") ->
              `InvalidS3PrefixException
                (invalid_s3_prefix_exception_of_yojson tree path)
          | (_, "InvalidSnsTopicNameException") ->
              `InvalidSnsTopicNameException
                (invalid_sns_topic_name_exception_of_yojson tree path)
          | (_, "InvalidTrailNameException") ->
              `InvalidTrailNameException
                (invalid_trail_name_exception_of_yojson tree path)
          | (_, "KmsException") ->
              `KmsException (kms_exception_of_yojson tree path)
          | (_, "KmsKeyDisabledException") ->
              `KmsKeyDisabledException
                (kms_key_disabled_exception_of_yojson tree path)
          | (_, "KmsKeyNotFoundException") ->
              `KmsKeyNotFoundException
                (kms_key_not_found_exception_of_yojson tree path)
          | (_, "NoManagementAccountSLRExistsException") ->
              `NoManagementAccountSLRExistsException
                (no_management_account_slr_exists_exception_of_yojson tree
                   path)
          | (_, "NotOrganizationMasterAccountException") ->
              `NotOrganizationMasterAccountException
                (not_organization_master_account_exception_of_yojson tree
                   path)
          | (_, "OperationNotPermittedException") ->
              `OperationNotPermittedException
                (operation_not_permitted_exception_of_yojson tree path)
          | (_, "OrganizationNotInAllFeaturesModeException") ->
              `OrganizationNotInAllFeaturesModeException
                (organization_not_in_all_features_mode_exception_of_yojson
                   tree path)
          | (_, "OrganizationsNotInUseException") ->
              `OrganizationsNotInUseException
                (organizations_not_in_use_exception_of_yojson tree path)
          | (_, "S3BucketDoesNotExistException") ->
              `S3BucketDoesNotExistException
                (s3_bucket_does_not_exist_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "TrailNotFoundException") ->
              `TrailNotFoundException
                (trail_not_found_exception_of_yojson tree path)
          | (_, "TrailNotProvidedException") ->
              `TrailNotProvidedException
                (trail_not_provided_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_trail_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_trail_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CloudTrail_20131101UpdateTrail" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_trail_response_of_yojson
            ~error_deserializer
  end