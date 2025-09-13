open Types
open Service_metadata

module AddTags = struct
  let error_to_string = function
    | `ChannelARNInvalidException _ -> "com.amazonaws.cloudtrail#ChannelARNInvalidException"
    | `ChannelNotFoundException _ -> "com.amazonaws.cloudtrail#ChannelNotFoundException"
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InvalidTagParameterException _ -> "com.amazonaws.cloudtrail#InvalidTagParameterException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudtrail#ResourceNotFoundException"
    | `ResourceTypeNotSupportedException _ ->
        "com.amazonaws.cloudtrail#ResourceTypeNotSupportedException"
    | `TagsLimitExceededException _ -> "com.amazonaws.cloudtrail#TagsLimitExceededException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ChannelARNInvalidException" ->
          `ChannelARNInvalidException
            (Json_deserializers.channel_arn_invalid_exception_of_yojson tree path)
      | _, "ChannelNotFoundException" ->
          `ChannelNotFoundException
            (Json_deserializers.channel_not_found_exception_of_yojson tree path)
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InvalidTagParameterException" ->
          `InvalidTagParameterException
            (Json_deserializers.invalid_tag_parameter_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceTypeNotSupportedException" ->
          `ResourceTypeNotSupportedException
            (Json_deserializers.resource_type_not_supported_exception_of_yojson tree path)
      | _, "TagsLimitExceededException" ->
          `TagsLimitExceededException
            (Json_deserializers.tags_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_request) =
    let input = Json_serializers.add_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.AddTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.add_tags_response_of_yojson ~error_deserializer
end

module CancelQuery = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InactiveQueryException _ -> "com.amazonaws.cloudtrail#InactiveQueryException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `QueryIdNotFoundException _ -> "com.amazonaws.cloudtrail#QueryIdNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InactiveQueryException" ->
          `InactiveQueryException (Json_deserializers.inactive_query_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "QueryIdNotFoundException" ->
          `QueryIdNotFoundException
            (Json_deserializers.query_id_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_query_request) =
    let input = Json_serializers.cancel_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.CancelQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.cancel_query_response_of_yojson
      ~error_deserializer
end

module CreateChannel = struct
  let error_to_string = function
    | `ChannelAlreadyExistsException _ -> "com.amazonaws.cloudtrail#ChannelAlreadyExistsException"
    | `ChannelMaxLimitExceededException _ ->
        "com.amazonaws.cloudtrail#ChannelMaxLimitExceededException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InvalidEventDataStoreCategoryException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreCategoryException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `InvalidSourceException _ -> "com.amazonaws.cloudtrail#InvalidSourceException"
    | `InvalidTagParameterException _ -> "com.amazonaws.cloudtrail#InvalidTagParameterException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `TagsLimitExceededException _ -> "com.amazonaws.cloudtrail#TagsLimitExceededException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ChannelAlreadyExistsException" ->
          `ChannelAlreadyExistsException
            (Json_deserializers.channel_already_exists_exception_of_yojson tree path)
      | _, "ChannelMaxLimitExceededException" ->
          `ChannelMaxLimitExceededException
            (Json_deserializers.channel_max_limit_exceeded_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreCategoryException" ->
          `InvalidEventDataStoreCategoryException
            (Json_deserializers.invalid_event_data_store_category_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSourceException" ->
          `InvalidSourceException (Json_deserializers.invalid_source_exception_of_yojson tree path)
      | _, "InvalidTagParameterException" ->
          `InvalidTagParameterException
            (Json_deserializers.invalid_tag_parameter_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "TagsLimitExceededException" ->
          `TagsLimitExceededException
            (Json_deserializers.tags_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_channel_request) =
    let input = Json_serializers.create_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.CreateChannel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_channel_response_of_yojson
      ~error_deserializer
end

module CreateDashboard = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InsufficientEncryptionPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientEncryptionPolicyException"
    | `InvalidQueryStatementException _ -> "com.amazonaws.cloudtrail#InvalidQueryStatementException"
    | `InvalidTagParameterException _ -> "com.amazonaws.cloudtrail#InvalidTagParameterException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.cloudtrail#ServiceQuotaExceededException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InsufficientEncryptionPolicyException" ->
          `InsufficientEncryptionPolicyException
            (Json_deserializers.insufficient_encryption_policy_exception_of_yojson tree path)
      | _, "InvalidQueryStatementException" ->
          `InvalidQueryStatementException
            (Json_deserializers.invalid_query_statement_exception_of_yojson tree path)
      | _, "InvalidTagParameterException" ->
          `InvalidTagParameterException
            (Json_deserializers.invalid_tag_parameter_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_dashboard_request) =
    let input = Json_serializers.create_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.CreateDashboard" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_dashboard_response_of_yojson
      ~error_deserializer
end

module CreateEventDataStore = struct
  let error_to_string = function
    | `CloudTrailAccessNotEnabledException _ ->
        "com.amazonaws.cloudtrail#CloudTrailAccessNotEnabledException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `EventDataStoreAlreadyExistsException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreAlreadyExistsException"
    | `EventDataStoreMaxLimitExceededException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreMaxLimitExceededException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InsufficientEncryptionPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientEncryptionPolicyException"
    | `InvalidEventSelectorsException _ -> "com.amazonaws.cloudtrail#InvalidEventSelectorsException"
    | `InvalidKmsKeyIdException _ -> "com.amazonaws.cloudtrail#InvalidKmsKeyIdException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `InvalidTagParameterException _ -> "com.amazonaws.cloudtrail#InvalidTagParameterException"
    | `KmsException _ -> "com.amazonaws.cloudtrail#KmsException"
    | `KmsKeyNotFoundException _ -> "com.amazonaws.cloudtrail#KmsKeyNotFoundException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.cloudtrail#OrganizationNotInAllFeaturesModeException"
    | `OrganizationsNotInUseException _ -> "com.amazonaws.cloudtrail#OrganizationsNotInUseException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailAccessNotEnabledException" ->
          `CloudTrailAccessNotEnabledException
            (Json_deserializers.cloud_trail_access_not_enabled_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EventDataStoreAlreadyExistsException" ->
          `EventDataStoreAlreadyExistsException
            (Json_deserializers.event_data_store_already_exists_exception_of_yojson tree path)
      | _, "EventDataStoreMaxLimitExceededException" ->
          `EventDataStoreMaxLimitExceededException
            (Json_deserializers.event_data_store_max_limit_exceeded_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InsufficientEncryptionPolicyException" ->
          `InsufficientEncryptionPolicyException
            (Json_deserializers.insufficient_encryption_policy_exception_of_yojson tree path)
      | _, "InvalidEventSelectorsException" ->
          `InvalidEventSelectorsException
            (Json_deserializers.invalid_event_selectors_exception_of_yojson tree path)
      | _, "InvalidKmsKeyIdException" ->
          `InvalidKmsKeyIdException
            (Json_deserializers.invalid_kms_key_id_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTagParameterException" ->
          `InvalidTagParameterException
            (Json_deserializers.invalid_tag_parameter_exception_of_yojson tree path)
      | _, "KmsException" -> `KmsException (Json_deserializers.kms_exception_of_yojson tree path)
      | _, "KmsKeyNotFoundException" ->
          `KmsKeyNotFoundException
            (Json_deserializers.kms_key_not_found_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "OrganizationNotInAllFeaturesModeException" ->
          `OrganizationNotInAllFeaturesModeException
            (Json_deserializers.organization_not_in_all_features_mode_exception_of_yojson tree path)
      | _, "OrganizationsNotInUseException" ->
          `OrganizationsNotInUseException
            (Json_deserializers.organizations_not_in_use_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_event_data_store_request) =
    let input = Json_serializers.create_event_data_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.CreateEventDataStore"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_event_data_store_response_of_yojson
      ~error_deserializer
end

module CreateTrail = struct
  let error_to_string = function
    | `CloudTrailAccessNotEnabledException _ ->
        "com.amazonaws.cloudtrail#CloudTrailAccessNotEnabledException"
    | `CloudTrailInvalidClientTokenIdException _ ->
        "com.amazonaws.cloudtrail#CloudTrailInvalidClientTokenIdException"
    | `CloudWatchLogsDeliveryUnavailableException _ ->
        "com.amazonaws.cloudtrail#CloudWatchLogsDeliveryUnavailableException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InsufficientEncryptionPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientEncryptionPolicyException"
    | `InsufficientS3BucketPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientS3BucketPolicyException"
    | `InsufficientSnsTopicPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientSnsTopicPolicyException"
    | `InvalidCloudWatchLogsLogGroupArnException _ ->
        "com.amazonaws.cloudtrail#InvalidCloudWatchLogsLogGroupArnException"
    | `InvalidCloudWatchLogsRoleArnException _ ->
        "com.amazonaws.cloudtrail#InvalidCloudWatchLogsRoleArnException"
    | `InvalidKmsKeyIdException _ -> "com.amazonaws.cloudtrail#InvalidKmsKeyIdException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudtrail#InvalidParameterCombinationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `InvalidS3BucketNameException _ -> "com.amazonaws.cloudtrail#InvalidS3BucketNameException"
    | `InvalidS3PrefixException _ -> "com.amazonaws.cloudtrail#InvalidS3PrefixException"
    | `InvalidSnsTopicNameException _ -> "com.amazonaws.cloudtrail#InvalidSnsTopicNameException"
    | `InvalidTagParameterException _ -> "com.amazonaws.cloudtrail#InvalidTagParameterException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `KmsException _ -> "com.amazonaws.cloudtrail#KmsException"
    | `KmsKeyDisabledException _ -> "com.amazonaws.cloudtrail#KmsKeyDisabledException"
    | `KmsKeyNotFoundException _ -> "com.amazonaws.cloudtrail#KmsKeyNotFoundException"
    | `MaximumNumberOfTrailsExceededException _ ->
        "com.amazonaws.cloudtrail#MaximumNumberOfTrailsExceededException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.cloudtrail#OrganizationNotInAllFeaturesModeException"
    | `OrganizationsNotInUseException _ -> "com.amazonaws.cloudtrail#OrganizationsNotInUseException"
    | `S3BucketDoesNotExistException _ -> "com.amazonaws.cloudtrail#S3BucketDoesNotExistException"
    | `TagsLimitExceededException _ -> "com.amazonaws.cloudtrail#TagsLimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.cloudtrail#ThrottlingException"
    | `TrailAlreadyExistsException _ -> "com.amazonaws.cloudtrail#TrailAlreadyExistsException"
    | `TrailNotProvidedException _ -> "com.amazonaws.cloudtrail#TrailNotProvidedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailAccessNotEnabledException" ->
          `CloudTrailAccessNotEnabledException
            (Json_deserializers.cloud_trail_access_not_enabled_exception_of_yojson tree path)
      | _, "CloudTrailInvalidClientTokenIdException" ->
          `CloudTrailInvalidClientTokenIdException
            (Json_deserializers.cloud_trail_invalid_client_token_id_exception_of_yojson tree path)
      | _, "CloudWatchLogsDeliveryUnavailableException" ->
          `CloudWatchLogsDeliveryUnavailableException
            (Json_deserializers.cloud_watch_logs_delivery_unavailable_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InsufficientEncryptionPolicyException" ->
          `InsufficientEncryptionPolicyException
            (Json_deserializers.insufficient_encryption_policy_exception_of_yojson tree path)
      | _, "InsufficientS3BucketPolicyException" ->
          `InsufficientS3BucketPolicyException
            (Json_deserializers.insufficient_s3_bucket_policy_exception_of_yojson tree path)
      | _, "InsufficientSnsTopicPolicyException" ->
          `InsufficientSnsTopicPolicyException
            (Json_deserializers.insufficient_sns_topic_policy_exception_of_yojson tree path)
      | _, "InvalidCloudWatchLogsLogGroupArnException" ->
          `InvalidCloudWatchLogsLogGroupArnException
            (Json_deserializers.invalid_cloud_watch_logs_log_group_arn_exception_of_yojson tree path)
      | _, "InvalidCloudWatchLogsRoleArnException" ->
          `InvalidCloudWatchLogsRoleArnException
            (Json_deserializers.invalid_cloud_watch_logs_role_arn_exception_of_yojson tree path)
      | _, "InvalidKmsKeyIdException" ->
          `InvalidKmsKeyIdException
            (Json_deserializers.invalid_kms_key_id_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3BucketNameException" ->
          `InvalidS3BucketNameException
            (Json_deserializers.invalid_s3_bucket_name_exception_of_yojson tree path)
      | _, "InvalidS3PrefixException" ->
          `InvalidS3PrefixException
            (Json_deserializers.invalid_s3_prefix_exception_of_yojson tree path)
      | _, "InvalidSnsTopicNameException" ->
          `InvalidSnsTopicNameException
            (Json_deserializers.invalid_sns_topic_name_exception_of_yojson tree path)
      | _, "InvalidTagParameterException" ->
          `InvalidTagParameterException
            (Json_deserializers.invalid_tag_parameter_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "KmsException" -> `KmsException (Json_deserializers.kms_exception_of_yojson tree path)
      | _, "KmsKeyDisabledException" ->
          `KmsKeyDisabledException
            (Json_deserializers.kms_key_disabled_exception_of_yojson tree path)
      | _, "KmsKeyNotFoundException" ->
          `KmsKeyNotFoundException
            (Json_deserializers.kms_key_not_found_exception_of_yojson tree path)
      | _, "MaximumNumberOfTrailsExceededException" ->
          `MaximumNumberOfTrailsExceededException
            (Json_deserializers.maximum_number_of_trails_exceeded_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "OrganizationNotInAllFeaturesModeException" ->
          `OrganizationNotInAllFeaturesModeException
            (Json_deserializers.organization_not_in_all_features_mode_exception_of_yojson tree path)
      | _, "OrganizationsNotInUseException" ->
          `OrganizationsNotInUseException
            (Json_deserializers.organizations_not_in_use_exception_of_yojson tree path)
      | _, "S3BucketDoesNotExistException" ->
          `S3BucketDoesNotExistException
            (Json_deserializers.s3_bucket_does_not_exist_exception_of_yojson tree path)
      | _, "TagsLimitExceededException" ->
          `TagsLimitExceededException
            (Json_deserializers.tags_limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TrailAlreadyExistsException" ->
          `TrailAlreadyExistsException
            (Json_deserializers.trail_already_exists_exception_of_yojson tree path)
      | _, "TrailNotProvidedException" ->
          `TrailNotProvidedException
            (Json_deserializers.trail_not_provided_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_trail_request) =
    let input = Json_serializers.create_trail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.CreateTrail" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_trail_response_of_yojson
      ~error_deserializer
end

module DeleteChannel = struct
  let error_to_string = function
    | `ChannelARNInvalidException _ -> "com.amazonaws.cloudtrail#ChannelARNInvalidException"
    | `ChannelNotFoundException _ -> "com.amazonaws.cloudtrail#ChannelNotFoundException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ChannelARNInvalidException" ->
          `ChannelARNInvalidException
            (Json_deserializers.channel_arn_invalid_exception_of_yojson tree path)
      | _, "ChannelNotFoundException" ->
          `ChannelNotFoundException
            (Json_deserializers.channel_not_found_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_channel_request) =
    let input = Json_serializers.delete_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.DeleteChannel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_channel_response_of_yojson
      ~error_deserializer
end

module DeleteDashboard = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudtrail#ResourceNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_dashboard_request) =
    let input = Json_serializers.delete_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.DeleteDashboard" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_dashboard_response_of_yojson
      ~error_deserializer
end

module DeleteEventDataStore = struct
  let error_to_string = function
    | `ChannelExistsForEDSException _ -> "com.amazonaws.cloudtrail#ChannelExistsForEDSException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreFederationEnabledException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreFederationEnabledException"
    | `EventDataStoreHasOngoingImportException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreHasOngoingImportException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `EventDataStoreTerminationProtectedException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreTerminationProtectedException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ChannelExistsForEDSException" ->
          `ChannelExistsForEDSException
            (Json_deserializers.channel_exists_for_eds_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreFederationEnabledException" ->
          `EventDataStoreFederationEnabledException
            (Json_deserializers.event_data_store_federation_enabled_exception_of_yojson tree path)
      | _, "EventDataStoreHasOngoingImportException" ->
          `EventDataStoreHasOngoingImportException
            (Json_deserializers.event_data_store_has_ongoing_import_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "EventDataStoreTerminationProtectedException" ->
          `EventDataStoreTerminationProtectedException
            (Json_deserializers.event_data_store_termination_protected_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_event_data_store_request) =
    let input = Json_serializers.delete_event_data_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.DeleteEventDataStore"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_event_data_store_response_of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ResourceARNNotValidException _ -> "com.amazonaws.cloudtrail#ResourceARNNotValidException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudtrail#ResourceNotFoundException"
    | `ResourcePolicyNotFoundException _ ->
        "com.amazonaws.cloudtrail#ResourcePolicyNotFoundException"
    | `ResourceTypeNotSupportedException _ ->
        "com.amazonaws.cloudtrail#ResourceTypeNotSupportedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceARNNotValidException" ->
          `ResourceARNNotValidException
            (Json_deserializers.resource_arn_not_valid_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourcePolicyNotFoundException" ->
          `ResourcePolicyNotFoundException
            (Json_deserializers.resource_policy_not_found_exception_of_yojson tree path)
      | _, "ResourceTypeNotSupportedException" ->
          `ResourceTypeNotSupportedException
            (Json_deserializers.resource_type_not_supported_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.DeleteResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer
end

module DeleteTrail = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InvalidHomeRegionException _ -> "com.amazonaws.cloudtrail#InvalidHomeRegionException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ThrottlingException _ -> "com.amazonaws.cloudtrail#ThrottlingException"
    | `TrailNotFoundException _ -> "com.amazonaws.cloudtrail#TrailNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InvalidHomeRegionException" ->
          `InvalidHomeRegionException
            (Json_deserializers.invalid_home_region_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TrailNotFoundException" ->
          `TrailNotFoundException (Json_deserializers.trail_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_trail_request) =
    let input = Json_serializers.delete_trail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.DeleteTrail" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_trail_response_of_yojson
      ~error_deserializer
end

module DeregisterOrganizationDelegatedAdmin = struct
  let error_to_string = function
    | `AccountNotFoundException _ -> "com.amazonaws.cloudtrail#AccountNotFoundException"
    | `AccountNotRegisteredException _ -> "com.amazonaws.cloudtrail#AccountNotRegisteredException"
    | `CloudTrailAccessNotEnabledException _ ->
        "com.amazonaws.cloudtrail#CloudTrailAccessNotEnabledException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NotOrganizationManagementAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationManagementAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.cloudtrail#OrganizationNotInAllFeaturesModeException"
    | `OrganizationsNotInUseException _ -> "com.amazonaws.cloudtrail#OrganizationsNotInUseException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccountNotFoundException" ->
          `AccountNotFoundException
            (Json_deserializers.account_not_found_exception_of_yojson tree path)
      | _, "AccountNotRegisteredException" ->
          `AccountNotRegisteredException
            (Json_deserializers.account_not_registered_exception_of_yojson tree path)
      | _, "CloudTrailAccessNotEnabledException" ->
          `CloudTrailAccessNotEnabledException
            (Json_deserializers.cloud_trail_access_not_enabled_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotOrganizationManagementAccountException" ->
          `NotOrganizationManagementAccountException
            (Json_deserializers.not_organization_management_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "OrganizationNotInAllFeaturesModeException" ->
          `OrganizationNotInAllFeaturesModeException
            (Json_deserializers.organization_not_in_all_features_mode_exception_of_yojson tree path)
      | _, "OrganizationsNotInUseException" ->
          `OrganizationsNotInUseException
            (Json_deserializers.organizations_not_in_use_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_organization_delegated_admin_request) =
    let input =
      Json_serializers.deregister_organization_delegated_admin_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CloudTrail_20131101.DeregisterOrganizationDelegatedAdmin" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.deregister_organization_delegated_admin_response_of_yojson
      ~error_deserializer
end

module DescribeQuery = struct
  let error_to_string = function
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `QueryIdNotFoundException _ -> "com.amazonaws.cloudtrail#QueryIdNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "QueryIdNotFoundException" ->
          `QueryIdNotFoundException
            (Json_deserializers.query_id_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_query_request) =
    let input = Json_serializers.describe_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.DescribeQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_query_response_of_yojson
      ~error_deserializer
end

module DescribeTrails = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_trails_request) =
    let input = Json_serializers.describe_trails_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.DescribeTrails" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_trails_response_of_yojson
      ~error_deserializer
end

module DisableFederation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudtrail#AccessDeniedException"
    | `CloudTrailAccessNotEnabledException _ ->
        "com.amazonaws.cloudtrail#CloudTrailAccessNotEnabledException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cloudtrail#ConcurrentModificationException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.cloudtrail#OrganizationNotInAllFeaturesModeException"
    | `OrganizationsNotInUseException _ -> "com.amazonaws.cloudtrail#OrganizationsNotInUseException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "CloudTrailAccessNotEnabledException" ->
          `CloudTrailAccessNotEnabledException
            (Json_deserializers.cloud_trail_access_not_enabled_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "OrganizationNotInAllFeaturesModeException" ->
          `OrganizationNotInAllFeaturesModeException
            (Json_deserializers.organization_not_in_all_features_mode_exception_of_yojson tree path)
      | _, "OrganizationsNotInUseException" ->
          `OrganizationsNotInUseException
            (Json_deserializers.organizations_not_in_use_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_federation_request) =
    let input = Json_serializers.disable_federation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.DisableFederation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.disable_federation_response_of_yojson
      ~error_deserializer
end

module EnableFederation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudtrail#AccessDeniedException"
    | `CloudTrailAccessNotEnabledException _ ->
        "com.amazonaws.cloudtrail#CloudTrailAccessNotEnabledException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cloudtrail#ConcurrentModificationException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreFederationEnabledException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreFederationEnabledException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.cloudtrail#OrganizationNotInAllFeaturesModeException"
    | `OrganizationsNotInUseException _ -> "com.amazonaws.cloudtrail#OrganizationsNotInUseException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "CloudTrailAccessNotEnabledException" ->
          `CloudTrailAccessNotEnabledException
            (Json_deserializers.cloud_trail_access_not_enabled_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreFederationEnabledException" ->
          `EventDataStoreFederationEnabledException
            (Json_deserializers.event_data_store_federation_enabled_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "OrganizationNotInAllFeaturesModeException" ->
          `OrganizationNotInAllFeaturesModeException
            (Json_deserializers.organization_not_in_all_features_mode_exception_of_yojson tree path)
      | _, "OrganizationsNotInUseException" ->
          `OrganizationsNotInUseException
            (Json_deserializers.organizations_not_in_use_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_federation_request) =
    let input = Json_serializers.enable_federation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.EnableFederation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.enable_federation_response_of_yojson
      ~error_deserializer
end

module GenerateQuery = struct
  let error_to_string = function
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `GenerateResponseException _ -> "com.amazonaws.cloudtrail#GenerateResponseException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "GenerateResponseException" ->
          `GenerateResponseException
            (Json_deserializers.generate_response_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : generate_query_request) =
    let input = Json_serializers.generate_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GenerateQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.generate_query_response_of_yojson
      ~error_deserializer
end

module GetChannel = struct
  let error_to_string = function
    | `ChannelARNInvalidException _ -> "com.amazonaws.cloudtrail#ChannelARNInvalidException"
    | `ChannelNotFoundException _ -> "com.amazonaws.cloudtrail#ChannelNotFoundException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ChannelARNInvalidException" ->
          `ChannelARNInvalidException
            (Json_deserializers.channel_arn_invalid_exception_of_yojson tree path)
      | _, "ChannelNotFoundException" ->
          `ChannelNotFoundException
            (Json_deserializers.channel_not_found_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_channel_request) =
    let input = Json_serializers.get_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GetChannel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_channel_response_of_yojson
      ~error_deserializer
end

module GetDashboard = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudtrail#ResourceNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_dashboard_request) =
    let input = Json_serializers.get_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GetDashboard" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_dashboard_response_of_yojson
      ~error_deserializer
end

module GetEventConfiguration = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InvalidEventDataStoreCategoryException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreCategoryException"
    | `InvalidEventDataStoreStatusException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudtrail#InvalidParameterCombinationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreCategoryException" ->
          `InvalidEventDataStoreCategoryException
            (Json_deserializers.invalid_event_data_store_category_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreStatusException" ->
          `InvalidEventDataStoreStatusException
            (Json_deserializers.invalid_event_data_store_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_event_configuration_request) =
    let input = Json_serializers.get_event_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GetEventConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_event_configuration_response_of_yojson
      ~error_deserializer
end

module GetEventDataStore = struct
  let error_to_string = function
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_event_data_store_request) =
    let input = Json_serializers.get_event_data_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GetEventDataStore" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_event_data_store_response_of_yojson
      ~error_deserializer
end

module GetEventSelectors = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `TrailNotFoundException _ -> "com.amazonaws.cloudtrail#TrailNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "TrailNotFoundException" ->
          `TrailNotFoundException (Json_deserializers.trail_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_event_selectors_request) =
    let input = Json_serializers.get_event_selectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GetEventSelectors" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_event_selectors_response_of_yojson
      ~error_deserializer
end

module GetImport = struct
  let error_to_string = function
    | `ImportNotFoundException _ -> "com.amazonaws.cloudtrail#ImportNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ImportNotFoundException" ->
          `ImportNotFoundException
            (Json_deserializers.import_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_import_request) =
    let input = Json_serializers.get_import_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GetImport" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_import_response_of_yojson
      ~error_deserializer
end

module GetInsightSelectors = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `InsightNotEnabledException _ -> "com.amazonaws.cloudtrail#InsightNotEnabledException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudtrail#InvalidParameterCombinationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ThrottlingException _ -> "com.amazonaws.cloudtrail#ThrottlingException"
    | `TrailNotFoundException _ -> "com.amazonaws.cloudtrail#TrailNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "InsightNotEnabledException" ->
          `InsightNotEnabledException
            (Json_deserializers.insight_not_enabled_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TrailNotFoundException" ->
          `TrailNotFoundException (Json_deserializers.trail_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_insight_selectors_request) =
    let input = Json_serializers.get_insight_selectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GetInsightSelectors"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_insight_selectors_response_of_yojson
      ~error_deserializer
end

module GetQueryResults = struct
  let error_to_string = function
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InsufficientEncryptionPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientEncryptionPolicyException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.cloudtrail#InvalidMaxResultsException"
    | `InvalidNextTokenException _ -> "com.amazonaws.cloudtrail#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `QueryIdNotFoundException _ -> "com.amazonaws.cloudtrail#QueryIdNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InsufficientEncryptionPolicyException" ->
          `InsufficientEncryptionPolicyException
            (Json_deserializers.insufficient_encryption_policy_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "QueryIdNotFoundException" ->
          `QueryIdNotFoundException
            (Json_deserializers.query_id_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_query_results_request) =
    let input = Json_serializers.get_query_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GetQueryResults" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_query_results_response_of_yojson
      ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ResourceARNNotValidException _ -> "com.amazonaws.cloudtrail#ResourceARNNotValidException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudtrail#ResourceNotFoundException"
    | `ResourcePolicyNotFoundException _ ->
        "com.amazonaws.cloudtrail#ResourcePolicyNotFoundException"
    | `ResourceTypeNotSupportedException _ ->
        "com.amazonaws.cloudtrail#ResourceTypeNotSupportedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceARNNotValidException" ->
          `ResourceARNNotValidException
            (Json_deserializers.resource_arn_not_valid_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourcePolicyNotFoundException" ->
          `ResourcePolicyNotFoundException
            (Json_deserializers.resource_policy_not_found_exception_of_yojson tree path)
      | _, "ResourceTypeNotSupportedException" ->
          `ResourceTypeNotSupportedException
            (Json_deserializers.resource_type_not_supported_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GetResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer
end

module GetTrail = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `TrailNotFoundException _ -> "com.amazonaws.cloudtrail#TrailNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "TrailNotFoundException" ->
          `TrailNotFoundException (Json_deserializers.trail_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_trail_request) =
    let input = Json_serializers.get_trail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GetTrail" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_trail_response_of_yojson
      ~error_deserializer
end

module GetTrailStatus = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `TrailNotFoundException _ -> "com.amazonaws.cloudtrail#TrailNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "TrailNotFoundException" ->
          `TrailNotFoundException (Json_deserializers.trail_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_trail_status_request) =
    let input = Json_serializers.get_trail_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.GetTrailStatus" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_trail_status_response_of_yojson
      ~error_deserializer
end

module ListChannels = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.cloudtrail#InvalidNextTokenException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_channels_request) =
    let input = Json_serializers.list_channels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.ListChannels" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_channels_response_of_yojson
      ~error_deserializer
end

module ListDashboards = struct
  let error_to_string = function
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_dashboards_request) =
    let input = Json_serializers.list_dashboards_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.ListDashboards" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_dashboards_response_of_yojson
      ~error_deserializer
end

module ListEventDataStores = struct
  let error_to_string = function
    | `InvalidMaxResultsException _ -> "com.amazonaws.cloudtrail#InvalidMaxResultsException"
    | `InvalidNextTokenException _ -> "com.amazonaws.cloudtrail#InvalidNextTokenException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_event_data_stores_request) =
    let input = Json_serializers.list_event_data_stores_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.ListEventDataStores"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_event_data_stores_response_of_yojson
      ~error_deserializer
end

module ListImportFailures = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.cloudtrail#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_import_failures_request) =
    let input = Json_serializers.list_import_failures_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.ListImportFailures"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_import_failures_response_of_yojson
      ~error_deserializer
end

module ListImports = struct
  let error_to_string = function
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `InvalidNextTokenException _ -> "com.amazonaws.cloudtrail#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_imports_request) =
    let input = Json_serializers.list_imports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.ListImports" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_imports_response_of_yojson
      ~error_deserializer
end

module ListInsightsMetricData = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_insights_metric_data_request) =
    let input = Json_serializers.list_insights_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.ListInsightsMetricData"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_insights_metric_data_response_of_yojson
      ~error_deserializer
end

module ListPublicKeys = struct
  let error_to_string = function
    | `InvalidTimeRangeException _ -> "com.amazonaws.cloudtrail#InvalidTimeRangeException"
    | `InvalidTokenException _ -> "com.amazonaws.cloudtrail#InvalidTokenException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidTimeRangeException" ->
          `InvalidTimeRangeException
            (Json_deserializers.invalid_time_range_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_public_keys_request) =
    let input = Json_serializers.list_public_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.ListPublicKeys" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_public_keys_response_of_yojson
      ~error_deserializer
end

module ListQueries = struct
  let error_to_string = function
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InvalidDateRangeException _ -> "com.amazonaws.cloudtrail#InvalidDateRangeException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.cloudtrail#InvalidMaxResultsException"
    | `InvalidNextTokenException _ -> "com.amazonaws.cloudtrail#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `InvalidQueryStatusException _ -> "com.amazonaws.cloudtrail#InvalidQueryStatusException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InvalidDateRangeException" ->
          `InvalidDateRangeException
            (Json_deserializers.invalid_date_range_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidQueryStatusException" ->
          `InvalidQueryStatusException
            (Json_deserializers.invalid_query_status_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_queries_request) =
    let input = Json_serializers.list_queries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.ListQueries" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_queries_response_of_yojson
      ~error_deserializer
end

module ListTags = struct
  let error_to_string = function
    | `ChannelARNInvalidException _ -> "com.amazonaws.cloudtrail#ChannelARNInvalidException"
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InvalidTokenException _ -> "com.amazonaws.cloudtrail#InvalidTokenException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudtrail#ResourceNotFoundException"
    | `ResourceTypeNotSupportedException _ ->
        "com.amazonaws.cloudtrail#ResourceTypeNotSupportedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ChannelARNInvalidException" ->
          `ChannelARNInvalidException
            (Json_deserializers.channel_arn_invalid_exception_of_yojson tree path)
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceTypeNotSupportedException" ->
          `ResourceTypeNotSupportedException
            (Json_deserializers.resource_type_not_supported_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_request) =
    let input = Json_serializers.list_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.ListTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_response_of_yojson
      ~error_deserializer
end

module ListTrails = struct
  let error_to_string = function
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_trails_request) =
    let input = Json_serializers.list_trails_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.ListTrails" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_trails_response_of_yojson
      ~error_deserializer
end

module LookupEvents = struct
  let error_to_string = function
    | `InvalidEventCategoryException _ -> "com.amazonaws.cloudtrail#InvalidEventCategoryException"
    | `InvalidLookupAttributesException _ ->
        "com.amazonaws.cloudtrail#InvalidLookupAttributesException"
    | `InvalidMaxResultsException _ -> "com.amazonaws.cloudtrail#InvalidMaxResultsException"
    | `InvalidNextTokenException _ -> "com.amazonaws.cloudtrail#InvalidNextTokenException"
    | `InvalidTimeRangeException _ -> "com.amazonaws.cloudtrail#InvalidTimeRangeException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidEventCategoryException" ->
          `InvalidEventCategoryException
            (Json_deserializers.invalid_event_category_exception_of_yojson tree path)
      | _, "InvalidLookupAttributesException" ->
          `InvalidLookupAttributesException
            (Json_deserializers.invalid_lookup_attributes_exception_of_yojson tree path)
      | _, "InvalidMaxResultsException" ->
          `InvalidMaxResultsException
            (Json_deserializers.invalid_max_results_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidTimeRangeException" ->
          `InvalidTimeRangeException
            (Json_deserializers.invalid_time_range_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : lookup_events_request) =
    let input = Json_serializers.lookup_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.LookupEvents" ~service
      ~context ~input ~output_deserializer:Json_deserializers.lookup_events_response_of_yojson
      ~error_deserializer
end

module PutEventConfiguration = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InsufficientIAMAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientIAMAccessPermissionException"
    | `InvalidEventDataStoreCategoryException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreCategoryException"
    | `InvalidEventDataStoreStatusException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudtrail#InvalidParameterCombinationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ThrottlingException _ -> "com.amazonaws.cloudtrail#ThrottlingException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InsufficientIAMAccessPermissionException" ->
          `InsufficientIAMAccessPermissionException
            (Json_deserializers.insufficient_iam_access_permission_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreCategoryException" ->
          `InvalidEventDataStoreCategoryException
            (Json_deserializers.invalid_event_data_store_category_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreStatusException" ->
          `InvalidEventDataStoreStatusException
            (Json_deserializers.invalid_event_data_store_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_event_configuration_request) =
    let input = Json_serializers.put_event_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.PutEventConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_event_configuration_response_of_yojson
      ~error_deserializer
end

module PutEventSelectors = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InvalidEventSelectorsException _ -> "com.amazonaws.cloudtrail#InvalidEventSelectorsException"
    | `InvalidHomeRegionException _ -> "com.amazonaws.cloudtrail#InvalidHomeRegionException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ThrottlingException _ -> "com.amazonaws.cloudtrail#ThrottlingException"
    | `TrailNotFoundException _ -> "com.amazonaws.cloudtrail#TrailNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InvalidEventSelectorsException" ->
          `InvalidEventSelectorsException
            (Json_deserializers.invalid_event_selectors_exception_of_yojson tree path)
      | _, "InvalidHomeRegionException" ->
          `InvalidHomeRegionException
            (Json_deserializers.invalid_home_region_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TrailNotFoundException" ->
          `TrailNotFoundException (Json_deserializers.trail_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_event_selectors_request) =
    let input = Json_serializers.put_event_selectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.PutEventSelectors" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_event_selectors_response_of_yojson
      ~error_deserializer
end

module PutInsightSelectors = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `InsufficientEncryptionPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientEncryptionPolicyException"
    | `InsufficientS3BucketPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientS3BucketPolicyException"
    | `InvalidHomeRegionException _ -> "com.amazonaws.cloudtrail#InvalidHomeRegionException"
    | `InvalidInsightSelectorsException _ ->
        "com.amazonaws.cloudtrail#InvalidInsightSelectorsException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudtrail#InvalidParameterCombinationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `KmsException _ -> "com.amazonaws.cloudtrail#KmsException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `S3BucketDoesNotExistException _ -> "com.amazonaws.cloudtrail#S3BucketDoesNotExistException"
    | `ThrottlingException _ -> "com.amazonaws.cloudtrail#ThrottlingException"
    | `TrailNotFoundException _ -> "com.amazonaws.cloudtrail#TrailNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "InsufficientEncryptionPolicyException" ->
          `InsufficientEncryptionPolicyException
            (Json_deserializers.insufficient_encryption_policy_exception_of_yojson tree path)
      | _, "InsufficientS3BucketPolicyException" ->
          `InsufficientS3BucketPolicyException
            (Json_deserializers.insufficient_s3_bucket_policy_exception_of_yojson tree path)
      | _, "InvalidHomeRegionException" ->
          `InvalidHomeRegionException
            (Json_deserializers.invalid_home_region_exception_of_yojson tree path)
      | _, "InvalidInsightSelectorsException" ->
          `InvalidInsightSelectorsException
            (Json_deserializers.invalid_insight_selectors_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "KmsException" -> `KmsException (Json_deserializers.kms_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "S3BucketDoesNotExistException" ->
          `S3BucketDoesNotExistException
            (Json_deserializers.s3_bucket_does_not_exist_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TrailNotFoundException" ->
          `TrailNotFoundException (Json_deserializers.trail_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_insight_selectors_request) =
    let input = Json_serializers.put_insight_selectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.PutInsightSelectors"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_insight_selectors_response_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ResourceARNNotValidException _ -> "com.amazonaws.cloudtrail#ResourceARNNotValidException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudtrail#ResourceNotFoundException"
    | `ResourcePolicyNotValidException _ ->
        "com.amazonaws.cloudtrail#ResourcePolicyNotValidException"
    | `ResourceTypeNotSupportedException _ ->
        "com.amazonaws.cloudtrail#ResourceTypeNotSupportedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceARNNotValidException" ->
          `ResourceARNNotValidException
            (Json_deserializers.resource_arn_not_valid_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourcePolicyNotValidException" ->
          `ResourcePolicyNotValidException
            (Json_deserializers.resource_policy_not_valid_exception_of_yojson tree path)
      | _, "ResourceTypeNotSupportedException" ->
          `ResourceTypeNotSupportedException
            (Json_deserializers.resource_type_not_supported_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.PutResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module RegisterOrganizationDelegatedAdmin = struct
  let error_to_string = function
    | `AccountNotFoundException _ -> "com.amazonaws.cloudtrail#AccountNotFoundException"
    | `AccountRegisteredException _ -> "com.amazonaws.cloudtrail#AccountRegisteredException"
    | `CannotDelegateManagementAccountException _ ->
        "com.amazonaws.cloudtrail#CannotDelegateManagementAccountException"
    | `CloudTrailAccessNotEnabledException _ ->
        "com.amazonaws.cloudtrail#CloudTrailAccessNotEnabledException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `DelegatedAdminAccountLimitExceededException _ ->
        "com.amazonaws.cloudtrail#DelegatedAdminAccountLimitExceededException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InsufficientIAMAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientIAMAccessPermissionException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NotOrganizationManagementAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationManagementAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.cloudtrail#OrganizationNotInAllFeaturesModeException"
    | `OrganizationsNotInUseException _ -> "com.amazonaws.cloudtrail#OrganizationsNotInUseException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccountNotFoundException" ->
          `AccountNotFoundException
            (Json_deserializers.account_not_found_exception_of_yojson tree path)
      | _, "AccountRegisteredException" ->
          `AccountRegisteredException
            (Json_deserializers.account_registered_exception_of_yojson tree path)
      | _, "CannotDelegateManagementAccountException" ->
          `CannotDelegateManagementAccountException
            (Json_deserializers.cannot_delegate_management_account_exception_of_yojson tree path)
      | _, "CloudTrailAccessNotEnabledException" ->
          `CloudTrailAccessNotEnabledException
            (Json_deserializers.cloud_trail_access_not_enabled_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DelegatedAdminAccountLimitExceededException" ->
          `DelegatedAdminAccountLimitExceededException
            (Json_deserializers.delegated_admin_account_limit_exceeded_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InsufficientIAMAccessPermissionException" ->
          `InsufficientIAMAccessPermissionException
            (Json_deserializers.insufficient_iam_access_permission_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotOrganizationManagementAccountException" ->
          `NotOrganizationManagementAccountException
            (Json_deserializers.not_organization_management_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "OrganizationNotInAllFeaturesModeException" ->
          `OrganizationNotInAllFeaturesModeException
            (Json_deserializers.organization_not_in_all_features_mode_exception_of_yojson tree path)
      | _, "OrganizationsNotInUseException" ->
          `OrganizationsNotInUseException
            (Json_deserializers.organizations_not_in_use_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_organization_delegated_admin_request) =
    let input = Json_serializers.register_organization_delegated_admin_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CloudTrail_20131101.RegisterOrganizationDelegatedAdmin" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.register_organization_delegated_admin_response_of_yojson
      ~error_deserializer
end

module RemoveTags = struct
  let error_to_string = function
    | `ChannelARNInvalidException _ -> "com.amazonaws.cloudtrail#ChannelARNInvalidException"
    | `ChannelNotFoundException _ -> "com.amazonaws.cloudtrail#ChannelNotFoundException"
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InvalidTagParameterException _ -> "com.amazonaws.cloudtrail#InvalidTagParameterException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudtrail#ResourceNotFoundException"
    | `ResourceTypeNotSupportedException _ ->
        "com.amazonaws.cloudtrail#ResourceTypeNotSupportedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ChannelARNInvalidException" ->
          `ChannelARNInvalidException
            (Json_deserializers.channel_arn_invalid_exception_of_yojson tree path)
      | _, "ChannelNotFoundException" ->
          `ChannelNotFoundException
            (Json_deserializers.channel_not_found_exception_of_yojson tree path)
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InvalidTagParameterException" ->
          `InvalidTagParameterException
            (Json_deserializers.invalid_tag_parameter_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceTypeNotSupportedException" ->
          `ResourceTypeNotSupportedException
            (Json_deserializers.resource_type_not_supported_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_tags_request) =
    let input = Json_serializers.remove_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.RemoveTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.remove_tags_response_of_yojson
      ~error_deserializer
end

module RestoreEventDataStore = struct
  let error_to_string = function
    | `CloudTrailAccessNotEnabledException _ ->
        "com.amazonaws.cloudtrail#CloudTrailAccessNotEnabledException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreMaxLimitExceededException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreMaxLimitExceededException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InvalidEventDataStoreStatusException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreStatusException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.cloudtrail#OrganizationNotInAllFeaturesModeException"
    | `OrganizationsNotInUseException _ -> "com.amazonaws.cloudtrail#OrganizationsNotInUseException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailAccessNotEnabledException" ->
          `CloudTrailAccessNotEnabledException
            (Json_deserializers.cloud_trail_access_not_enabled_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreMaxLimitExceededException" ->
          `EventDataStoreMaxLimitExceededException
            (Json_deserializers.event_data_store_max_limit_exceeded_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreStatusException" ->
          `InvalidEventDataStoreStatusException
            (Json_deserializers.invalid_event_data_store_status_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "OrganizationNotInAllFeaturesModeException" ->
          `OrganizationNotInAllFeaturesModeException
            (Json_deserializers.organization_not_in_all_features_mode_exception_of_yojson tree path)
      | _, "OrganizationsNotInUseException" ->
          `OrganizationsNotInUseException
            (Json_deserializers.organizations_not_in_use_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_event_data_store_request) =
    let input = Json_serializers.restore_event_data_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.RestoreEventDataStore"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_event_data_store_response_of_yojson
      ~error_deserializer
end

module SearchSampleQueries = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_sample_queries_request) =
    let input = Json_serializers.search_sample_queries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.SearchSampleQueries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_sample_queries_response_of_yojson
      ~error_deserializer
end

module StartDashboardRefresh = struct
  let error_to_string = function
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudtrail#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.cloudtrail#ServiceQuotaExceededException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_dashboard_refresh_request) =
    let input = Json_serializers.start_dashboard_refresh_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.StartDashboardRefresh"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_dashboard_refresh_response_of_yojson
      ~error_deserializer
end

module StartEventDataStoreIngestion = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InvalidEventDataStoreCategoryException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreCategoryException"
    | `InvalidEventDataStoreStatusException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreStatusException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreCategoryException" ->
          `InvalidEventDataStoreCategoryException
            (Json_deserializers.invalid_event_data_store_category_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreStatusException" ->
          `InvalidEventDataStoreStatusException
            (Json_deserializers.invalid_event_data_store_status_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_event_data_store_ingestion_request) =
    let input = Json_serializers.start_event_data_store_ingestion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CloudTrail_20131101.StartEventDataStoreIngestion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_event_data_store_ingestion_response_of_yojson
      ~error_deserializer
end

module StartImport = struct
  let error_to_string = function
    | `AccountHasOngoingImportException _ ->
        "com.amazonaws.cloudtrail#AccountHasOngoingImportException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `ImportNotFoundException _ -> "com.amazonaws.cloudtrail#ImportNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InsufficientEncryptionPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientEncryptionPolicyException"
    | `InvalidEventDataStoreCategoryException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreCategoryException"
    | `InvalidEventDataStoreStatusException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreStatusException"
    | `InvalidImportSourceException _ -> "com.amazonaws.cloudtrail#InvalidImportSourceException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccountHasOngoingImportException" ->
          `AccountHasOngoingImportException
            (Json_deserializers.account_has_ongoing_import_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "ImportNotFoundException" ->
          `ImportNotFoundException
            (Json_deserializers.import_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InsufficientEncryptionPolicyException" ->
          `InsufficientEncryptionPolicyException
            (Json_deserializers.insufficient_encryption_policy_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreCategoryException" ->
          `InvalidEventDataStoreCategoryException
            (Json_deserializers.invalid_event_data_store_category_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreStatusException" ->
          `InvalidEventDataStoreStatusException
            (Json_deserializers.invalid_event_data_store_status_exception_of_yojson tree path)
      | _, "InvalidImportSourceException" ->
          `InvalidImportSourceException
            (Json_deserializers.invalid_import_source_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_import_request) =
    let input = Json_serializers.start_import_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.StartImport" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_import_response_of_yojson
      ~error_deserializer
end

module StartLogging = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InvalidHomeRegionException _ -> "com.amazonaws.cloudtrail#InvalidHomeRegionException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ThrottlingException _ -> "com.amazonaws.cloudtrail#ThrottlingException"
    | `TrailNotFoundException _ -> "com.amazonaws.cloudtrail#TrailNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InvalidHomeRegionException" ->
          `InvalidHomeRegionException
            (Json_deserializers.invalid_home_region_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TrailNotFoundException" ->
          `TrailNotFoundException (Json_deserializers.trail_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_logging_request) =
    let input = Json_serializers.start_logging_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.StartLogging" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_logging_response_of_yojson
      ~error_deserializer
end

module StartQuery = struct
  let error_to_string = function
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InsufficientEncryptionPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientEncryptionPolicyException"
    | `InsufficientS3BucketPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientS3BucketPolicyException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `InvalidQueryStatementException _ -> "com.amazonaws.cloudtrail#InvalidQueryStatementException"
    | `InvalidS3BucketNameException _ -> "com.amazonaws.cloudtrail#InvalidS3BucketNameException"
    | `InvalidS3PrefixException _ -> "com.amazonaws.cloudtrail#InvalidS3PrefixException"
    | `MaxConcurrentQueriesException _ -> "com.amazonaws.cloudtrail#MaxConcurrentQueriesException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `S3BucketDoesNotExistException _ -> "com.amazonaws.cloudtrail#S3BucketDoesNotExistException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InsufficientEncryptionPolicyException" ->
          `InsufficientEncryptionPolicyException
            (Json_deserializers.insufficient_encryption_policy_exception_of_yojson tree path)
      | _, "InsufficientS3BucketPolicyException" ->
          `InsufficientS3BucketPolicyException
            (Json_deserializers.insufficient_s3_bucket_policy_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidQueryStatementException" ->
          `InvalidQueryStatementException
            (Json_deserializers.invalid_query_statement_exception_of_yojson tree path)
      | _, "InvalidS3BucketNameException" ->
          `InvalidS3BucketNameException
            (Json_deserializers.invalid_s3_bucket_name_exception_of_yojson tree path)
      | _, "InvalidS3PrefixException" ->
          `InvalidS3PrefixException
            (Json_deserializers.invalid_s3_prefix_exception_of_yojson tree path)
      | _, "MaxConcurrentQueriesException" ->
          `MaxConcurrentQueriesException
            (Json_deserializers.max_concurrent_queries_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "S3BucketDoesNotExistException" ->
          `S3BucketDoesNotExistException
            (Json_deserializers.s3_bucket_does_not_exist_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_query_request) =
    let input = Json_serializers.start_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.StartQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_query_response_of_yojson
      ~error_deserializer
end

module StopEventDataStoreIngestion = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InvalidEventDataStoreCategoryException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreCategoryException"
    | `InvalidEventDataStoreStatusException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreStatusException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreCategoryException" ->
          `InvalidEventDataStoreCategoryException
            (Json_deserializers.invalid_event_data_store_category_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreStatusException" ->
          `InvalidEventDataStoreStatusException
            (Json_deserializers.invalid_event_data_store_status_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_event_data_store_ingestion_request) =
    let input = Json_serializers.stop_event_data_store_ingestion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CloudTrail_20131101.StopEventDataStoreIngestion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_event_data_store_ingestion_response_of_yojson
      ~error_deserializer
end

module StopImport = struct
  let error_to_string = function
    | `ImportNotFoundException _ -> "com.amazonaws.cloudtrail#ImportNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ImportNotFoundException" ->
          `ImportNotFoundException
            (Json_deserializers.import_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_import_request) =
    let input = Json_serializers.stop_import_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.StopImport" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_import_response_of_yojson
      ~error_deserializer
end

module StopLogging = struct
  let error_to_string = function
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InvalidHomeRegionException _ -> "com.amazonaws.cloudtrail#InvalidHomeRegionException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `ThrottlingException _ -> "com.amazonaws.cloudtrail#ThrottlingException"
    | `TrailNotFoundException _ -> "com.amazonaws.cloudtrail#TrailNotFoundException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InvalidHomeRegionException" ->
          `InvalidHomeRegionException
            (Json_deserializers.invalid_home_region_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TrailNotFoundException" ->
          `TrailNotFoundException (Json_deserializers.trail_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_logging_request) =
    let input = Json_serializers.stop_logging_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.StopLogging" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_logging_response_of_yojson
      ~error_deserializer
end

module UpdateChannel = struct
  let error_to_string = function
    | `ChannelAlreadyExistsException _ -> "com.amazonaws.cloudtrail#ChannelAlreadyExistsException"
    | `ChannelARNInvalidException _ -> "com.amazonaws.cloudtrail#ChannelARNInvalidException"
    | `ChannelNotFoundException _ -> "com.amazonaws.cloudtrail#ChannelNotFoundException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InvalidEventDataStoreCategoryException _ ->
        "com.amazonaws.cloudtrail#InvalidEventDataStoreCategoryException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ChannelAlreadyExistsException" ->
          `ChannelAlreadyExistsException
            (Json_deserializers.channel_already_exists_exception_of_yojson tree path)
      | _, "ChannelARNInvalidException" ->
          `ChannelARNInvalidException
            (Json_deserializers.channel_arn_invalid_exception_of_yojson tree path)
      | _, "ChannelNotFoundException" ->
          `ChannelNotFoundException
            (Json_deserializers.channel_not_found_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InvalidEventDataStoreCategoryException" ->
          `InvalidEventDataStoreCategoryException
            (Json_deserializers.invalid_event_data_store_category_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_channel_request) =
    let input = Json_serializers.update_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.UpdateChannel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_channel_response_of_yojson
      ~error_deserializer
end

module UpdateDashboard = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InsufficientEncryptionPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientEncryptionPolicyException"
    | `InvalidQueryStatementException _ -> "com.amazonaws.cloudtrail#InvalidQueryStatementException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudtrail#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.cloudtrail#ServiceQuotaExceededException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InsufficientEncryptionPolicyException" ->
          `InsufficientEncryptionPolicyException
            (Json_deserializers.insufficient_encryption_policy_exception_of_yojson tree path)
      | _, "InvalidQueryStatementException" ->
          `InvalidQueryStatementException
            (Json_deserializers.invalid_query_statement_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_dashboard_request) =
    let input = Json_serializers.update_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.UpdateDashboard" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_dashboard_response_of_yojson
      ~error_deserializer
end

module UpdateEventDataStore = struct
  let error_to_string = function
    | `CloudTrailAccessNotEnabledException _ ->
        "com.amazonaws.cloudtrail#CloudTrailAccessNotEnabledException"
    | `EventDataStoreAlreadyExistsException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreAlreadyExistsException"
    | `EventDataStoreARNInvalidException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreARNInvalidException"
    | `EventDataStoreHasOngoingImportException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreHasOngoingImportException"
    | `EventDataStoreNotFoundException _ ->
        "com.amazonaws.cloudtrail#EventDataStoreNotFoundException"
    | `InactiveEventDataStoreException _ ->
        "com.amazonaws.cloudtrail#InactiveEventDataStoreException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InsufficientEncryptionPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientEncryptionPolicyException"
    | `InvalidEventSelectorsException _ -> "com.amazonaws.cloudtrail#InvalidEventSelectorsException"
    | `InvalidInsightSelectorsException _ ->
        "com.amazonaws.cloudtrail#InvalidInsightSelectorsException"
    | `InvalidKmsKeyIdException _ -> "com.amazonaws.cloudtrail#InvalidKmsKeyIdException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `KmsException _ -> "com.amazonaws.cloudtrail#KmsException"
    | `KmsKeyNotFoundException _ -> "com.amazonaws.cloudtrail#KmsKeyNotFoundException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.cloudtrail#OrganizationNotInAllFeaturesModeException"
    | `OrganizationsNotInUseException _ -> "com.amazonaws.cloudtrail#OrganizationsNotInUseException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailAccessNotEnabledException" ->
          `CloudTrailAccessNotEnabledException
            (Json_deserializers.cloud_trail_access_not_enabled_exception_of_yojson tree path)
      | _, "EventDataStoreAlreadyExistsException" ->
          `EventDataStoreAlreadyExistsException
            (Json_deserializers.event_data_store_already_exists_exception_of_yojson tree path)
      | _, "EventDataStoreARNInvalidException" ->
          `EventDataStoreARNInvalidException
            (Json_deserializers.event_data_store_arn_invalid_exception_of_yojson tree path)
      | _, "EventDataStoreHasOngoingImportException" ->
          `EventDataStoreHasOngoingImportException
            (Json_deserializers.event_data_store_has_ongoing_import_exception_of_yojson tree path)
      | _, "EventDataStoreNotFoundException" ->
          `EventDataStoreNotFoundException
            (Json_deserializers.event_data_store_not_found_exception_of_yojson tree path)
      | _, "InactiveEventDataStoreException" ->
          `InactiveEventDataStoreException
            (Json_deserializers.inactive_event_data_store_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InsufficientEncryptionPolicyException" ->
          `InsufficientEncryptionPolicyException
            (Json_deserializers.insufficient_encryption_policy_exception_of_yojson tree path)
      | _, "InvalidEventSelectorsException" ->
          `InvalidEventSelectorsException
            (Json_deserializers.invalid_event_selectors_exception_of_yojson tree path)
      | _, "InvalidInsightSelectorsException" ->
          `InvalidInsightSelectorsException
            (Json_deserializers.invalid_insight_selectors_exception_of_yojson tree path)
      | _, "InvalidKmsKeyIdException" ->
          `InvalidKmsKeyIdException
            (Json_deserializers.invalid_kms_key_id_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "KmsException" -> `KmsException (Json_deserializers.kms_exception_of_yojson tree path)
      | _, "KmsKeyNotFoundException" ->
          `KmsKeyNotFoundException
            (Json_deserializers.kms_key_not_found_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "OrganizationNotInAllFeaturesModeException" ->
          `OrganizationNotInAllFeaturesModeException
            (Json_deserializers.organization_not_in_all_features_mode_exception_of_yojson tree path)
      | _, "OrganizationsNotInUseException" ->
          `OrganizationsNotInUseException
            (Json_deserializers.organizations_not_in_use_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_event_data_store_request) =
    let input = Json_serializers.update_event_data_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.UpdateEventDataStore"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_event_data_store_response_of_yojson
      ~error_deserializer
end

module UpdateTrail = struct
  let error_to_string = function
    | `CloudTrailAccessNotEnabledException _ ->
        "com.amazonaws.cloudtrail#CloudTrailAccessNotEnabledException"
    | `CloudTrailARNInvalidException _ -> "com.amazonaws.cloudtrail#CloudTrailARNInvalidException"
    | `CloudTrailInvalidClientTokenIdException _ ->
        "com.amazonaws.cloudtrail#CloudTrailInvalidClientTokenIdException"
    | `CloudWatchLogsDeliveryUnavailableException _ ->
        "com.amazonaws.cloudtrail#CloudWatchLogsDeliveryUnavailableException"
    | `ConflictException _ -> "com.amazonaws.cloudtrail#ConflictException"
    | `InsufficientDependencyServiceAccessPermissionException _ ->
        "com.amazonaws.cloudtrail#InsufficientDependencyServiceAccessPermissionException"
    | `InsufficientEncryptionPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientEncryptionPolicyException"
    | `InsufficientS3BucketPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientS3BucketPolicyException"
    | `InsufficientSnsTopicPolicyException _ ->
        "com.amazonaws.cloudtrail#InsufficientSnsTopicPolicyException"
    | `InvalidCloudWatchLogsLogGroupArnException _ ->
        "com.amazonaws.cloudtrail#InvalidCloudWatchLogsLogGroupArnException"
    | `InvalidCloudWatchLogsRoleArnException _ ->
        "com.amazonaws.cloudtrail#InvalidCloudWatchLogsRoleArnException"
    | `InvalidEventSelectorsException _ -> "com.amazonaws.cloudtrail#InvalidEventSelectorsException"
    | `InvalidHomeRegionException _ -> "com.amazonaws.cloudtrail#InvalidHomeRegionException"
    | `InvalidKmsKeyIdException _ -> "com.amazonaws.cloudtrail#InvalidKmsKeyIdException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudtrail#InvalidParameterCombinationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudtrail#InvalidParameterException"
    | `InvalidS3BucketNameException _ -> "com.amazonaws.cloudtrail#InvalidS3BucketNameException"
    | `InvalidS3PrefixException _ -> "com.amazonaws.cloudtrail#InvalidS3PrefixException"
    | `InvalidSnsTopicNameException _ -> "com.amazonaws.cloudtrail#InvalidSnsTopicNameException"
    | `InvalidTrailNameException _ -> "com.amazonaws.cloudtrail#InvalidTrailNameException"
    | `KmsException _ -> "com.amazonaws.cloudtrail#KmsException"
    | `KmsKeyDisabledException _ -> "com.amazonaws.cloudtrail#KmsKeyDisabledException"
    | `KmsKeyNotFoundException _ -> "com.amazonaws.cloudtrail#KmsKeyNotFoundException"
    | `NoManagementAccountSLRExistsException _ ->
        "com.amazonaws.cloudtrail#NoManagementAccountSLRExistsException"
    | `NotOrganizationMasterAccountException _ ->
        "com.amazonaws.cloudtrail#NotOrganizationMasterAccountException"
    | `OperationNotPermittedException _ -> "com.amazonaws.cloudtrail#OperationNotPermittedException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.cloudtrail#OrganizationNotInAllFeaturesModeException"
    | `OrganizationsNotInUseException _ -> "com.amazonaws.cloudtrail#OrganizationsNotInUseException"
    | `S3BucketDoesNotExistException _ -> "com.amazonaws.cloudtrail#S3BucketDoesNotExistException"
    | `ThrottlingException _ -> "com.amazonaws.cloudtrail#ThrottlingException"
    | `TrailNotFoundException _ -> "com.amazonaws.cloudtrail#TrailNotFoundException"
    | `TrailNotProvidedException _ -> "com.amazonaws.cloudtrail#TrailNotProvidedException"
    | `UnsupportedOperationException _ -> "com.amazonaws.cloudtrail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudTrailAccessNotEnabledException" ->
          `CloudTrailAccessNotEnabledException
            (Json_deserializers.cloud_trail_access_not_enabled_exception_of_yojson tree path)
      | _, "CloudTrailARNInvalidException" ->
          `CloudTrailARNInvalidException
            (Json_deserializers.cloud_trail_arn_invalid_exception_of_yojson tree path)
      | _, "CloudTrailInvalidClientTokenIdException" ->
          `CloudTrailInvalidClientTokenIdException
            (Json_deserializers.cloud_trail_invalid_client_token_id_exception_of_yojson tree path)
      | _, "CloudWatchLogsDeliveryUnavailableException" ->
          `CloudWatchLogsDeliveryUnavailableException
            (Json_deserializers.cloud_watch_logs_delivery_unavailable_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InsufficientDependencyServiceAccessPermissionException" ->
          `InsufficientDependencyServiceAccessPermissionException
            (Json_deserializers
             .insufficient_dependency_service_access_permission_exception_of_yojson tree path)
      | _, "InsufficientEncryptionPolicyException" ->
          `InsufficientEncryptionPolicyException
            (Json_deserializers.insufficient_encryption_policy_exception_of_yojson tree path)
      | _, "InsufficientS3BucketPolicyException" ->
          `InsufficientS3BucketPolicyException
            (Json_deserializers.insufficient_s3_bucket_policy_exception_of_yojson tree path)
      | _, "InsufficientSnsTopicPolicyException" ->
          `InsufficientSnsTopicPolicyException
            (Json_deserializers.insufficient_sns_topic_policy_exception_of_yojson tree path)
      | _, "InvalidCloudWatchLogsLogGroupArnException" ->
          `InvalidCloudWatchLogsLogGroupArnException
            (Json_deserializers.invalid_cloud_watch_logs_log_group_arn_exception_of_yojson tree path)
      | _, "InvalidCloudWatchLogsRoleArnException" ->
          `InvalidCloudWatchLogsRoleArnException
            (Json_deserializers.invalid_cloud_watch_logs_role_arn_exception_of_yojson tree path)
      | _, "InvalidEventSelectorsException" ->
          `InvalidEventSelectorsException
            (Json_deserializers.invalid_event_selectors_exception_of_yojson tree path)
      | _, "InvalidHomeRegionException" ->
          `InvalidHomeRegionException
            (Json_deserializers.invalid_home_region_exception_of_yojson tree path)
      | _, "InvalidKmsKeyIdException" ->
          `InvalidKmsKeyIdException
            (Json_deserializers.invalid_kms_key_id_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3BucketNameException" ->
          `InvalidS3BucketNameException
            (Json_deserializers.invalid_s3_bucket_name_exception_of_yojson tree path)
      | _, "InvalidS3PrefixException" ->
          `InvalidS3PrefixException
            (Json_deserializers.invalid_s3_prefix_exception_of_yojson tree path)
      | _, "InvalidSnsTopicNameException" ->
          `InvalidSnsTopicNameException
            (Json_deserializers.invalid_sns_topic_name_exception_of_yojson tree path)
      | _, "InvalidTrailNameException" ->
          `InvalidTrailNameException
            (Json_deserializers.invalid_trail_name_exception_of_yojson tree path)
      | _, "KmsException" -> `KmsException (Json_deserializers.kms_exception_of_yojson tree path)
      | _, "KmsKeyDisabledException" ->
          `KmsKeyDisabledException
            (Json_deserializers.kms_key_disabled_exception_of_yojson tree path)
      | _, "KmsKeyNotFoundException" ->
          `KmsKeyNotFoundException
            (Json_deserializers.kms_key_not_found_exception_of_yojson tree path)
      | _, "NoManagementAccountSLRExistsException" ->
          `NoManagementAccountSLRExistsException
            (Json_deserializers.no_management_account_slr_exists_exception_of_yojson tree path)
      | _, "NotOrganizationMasterAccountException" ->
          `NotOrganizationMasterAccountException
            (Json_deserializers.not_organization_master_account_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "OrganizationNotInAllFeaturesModeException" ->
          `OrganizationNotInAllFeaturesModeException
            (Json_deserializers.organization_not_in_all_features_mode_exception_of_yojson tree path)
      | _, "OrganizationsNotInUseException" ->
          `OrganizationsNotInUseException
            (Json_deserializers.organizations_not_in_use_exception_of_yojson tree path)
      | _, "S3BucketDoesNotExistException" ->
          `S3BucketDoesNotExistException
            (Json_deserializers.s3_bucket_does_not_exist_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TrailNotFoundException" ->
          `TrailNotFoundException (Json_deserializers.trail_not_found_exception_of_yojson tree path)
      | _, "TrailNotProvidedException" ->
          `TrailNotProvidedException
            (Json_deserializers.trail_not_provided_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_trail_request) =
    let input = Json_serializers.update_trail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudTrail_20131101.UpdateTrail" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_trail_response_of_yojson
      ~error_deserializer
end
