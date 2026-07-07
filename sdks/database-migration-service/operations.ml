open Types
open Service_metadata

module AddTagsToResource = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_to_resource_message) =
    let input = Json_serializers.add_tags_to_resource_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.AddTagsToResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.add_tags_to_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_tags_to_resource_message) =
    let input = Json_serializers.add_tags_to_resource_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.AddTagsToResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_tags_to_resource_response_of_yojson
      ~error_deserializer
end

module ApplyPendingMaintenanceAction = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : apply_pending_maintenance_action_message) =
    let input = Json_serializers.apply_pending_maintenance_action_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.ApplyPendingMaintenanceAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.apply_pending_maintenance_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : apply_pending_maintenance_action_message) =
    let input = Json_serializers.apply_pending_maintenance_action_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ApplyPendingMaintenanceAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.apply_pending_maintenance_action_response_of_yojson
      ~error_deserializer
end

module BatchStartRecommendations = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_start_recommendations_request) =
    let input = Json_serializers.batch_start_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.BatchStartRecommendations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_start_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_start_recommendations_request) =
    let input = Json_serializers.batch_start_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.BatchStartRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_start_recommendations_response_of_yojson
      ~error_deserializer
end

module CancelMetadataModelConversion = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_metadata_model_conversion_message) =
    let input = Json_serializers.cancel_metadata_model_conversion_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.CancelMetadataModelConversion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_metadata_model_conversion_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_metadata_model_conversion_message) =
    let input = Json_serializers.cancel_metadata_model_conversion_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CancelMetadataModelConversion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_metadata_model_conversion_response_of_yojson
      ~error_deserializer
end

module CancelMetadataModelCreation = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_metadata_model_creation_message) =
    let input = Json_serializers.cancel_metadata_model_creation_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.CancelMetadataModelCreation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_metadata_model_creation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_metadata_model_creation_message) =
    let input = Json_serializers.cancel_metadata_model_creation_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CancelMetadataModelCreation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_metadata_model_creation_response_of_yojson
      ~error_deserializer
end

module CancelReplicationTaskAssessmentRun = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_replication_task_assessment_run_message) =
    let input = Json_serializers.cancel_replication_task_assessment_run_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.CancelReplicationTaskAssessmentRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.cancel_replication_task_assessment_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_replication_task_assessment_run_message) =
    let input = Json_serializers.cancel_replication_task_assessment_run_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CancelReplicationTaskAssessmentRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.cancel_replication_task_assessment_run_response_of_yojson
      ~error_deserializer
end

module CreateDataMigration = struct
  let error_to_string = function
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidOperationFault _ -> "com.amazonaws.databasemigrationservice#InvalidOperationFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidOperationFault" ->
          `InvalidOperationFault (Json_deserializers.invalid_operation_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_data_migration_message) =
    let input = Json_serializers.create_data_migration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.CreateDataMigration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_migration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_data_migration_message) =
    let input = Json_serializers.create_data_migration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CreateDataMigration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_migration_response_of_yojson
      ~error_deserializer
end

module CreateDataProvider = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_data_provider_message) =
    let input = Json_serializers.create_data_provider_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.CreateDataProvider" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_data_provider_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_data_provider_message) =
    let input = Json_serializers.create_data_provider_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CreateDataProvider" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_provider_response_of_yojson
      ~error_deserializer
end

module CreateEndpoint = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_endpoint_message) =
    let input = Json_serializers.create_endpoint_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.CreateEndpoint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_endpoint_message) =
    let input = Json_serializers.create_endpoint_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CreateEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_endpoint_response_of_yojson ~error_deserializer
end

module CreateEventSubscription = struct
  let error_to_string = function
    | `KMSAccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#KMSAccessDeniedFault"
    | `KMSDisabledFault _ -> "com.amazonaws.databasemigrationservice#KMSDisabledFault"
    | `KMSInvalidStateFault _ -> "com.amazonaws.databasemigrationservice#KMSInvalidStateFault"
    | `KMSNotFoundFault _ -> "com.amazonaws.databasemigrationservice#KMSNotFoundFault"
    | `KMSThrottlingFault _ -> "com.amazonaws.databasemigrationservice#KMSThrottlingFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `SNSInvalidTopicFault _ -> "com.amazonaws.databasemigrationservice#SNSInvalidTopicFault"
    | `SNSNoAuthorizationFault _ -> "com.amazonaws.databasemigrationservice#SNSNoAuthorizationFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "KMSAccessDeniedFault" ->
          `KMSAccessDeniedFault (Json_deserializers.kms_access_denied_fault_of_yojson tree path)
      | _, "KMSDisabledFault" ->
          `KMSDisabledFault (Json_deserializers.kms_disabled_fault_of_yojson tree path)
      | _, "KMSInvalidStateFault" ->
          `KMSInvalidStateFault (Json_deserializers.kms_invalid_state_fault_of_yojson tree path)
      | _, "KMSNotFoundFault" ->
          `KMSNotFoundFault (Json_deserializers.kms_not_found_fault_of_yojson tree path)
      | _, "KMSThrottlingFault" ->
          `KMSThrottlingFault (Json_deserializers.kms_throttling_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "SNSInvalidTopicFault" ->
          `SNSInvalidTopicFault (Json_deserializers.sns_invalid_topic_fault_of_yojson tree path)
      | _, "SNSNoAuthorizationFault" ->
          `SNSNoAuthorizationFault
            (Json_deserializers.sns_no_authorization_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_event_subscription_message) =
    let input = Json_serializers.create_event_subscription_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.CreateEventSubscription"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_event_subscription_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_event_subscription_message) =
    let input = Json_serializers.create_event_subscription_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CreateEventSubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_event_subscription_response_of_yojson
      ~error_deserializer
end

module CreateFleetAdvisorCollector = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_fleet_advisor_collector_request) =
    let input = Json_serializers.create_fleet_advisor_collector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.CreateFleetAdvisorCollector"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_fleet_advisor_collector_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_fleet_advisor_collector_request) =
    let input = Json_serializers.create_fleet_advisor_collector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CreateFleetAdvisorCollector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_fleet_advisor_collector_response_of_yojson
      ~error_deserializer
end

module CreateInstanceProfile = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_instance_profile_message) =
    let input = Json_serializers.create_instance_profile_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.CreateInstanceProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_instance_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_instance_profile_message) =
    let input = Json_serializers.create_instance_profile_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CreateInstanceProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_instance_profile_response_of_yojson
      ~error_deserializer
end

module CreateMigrationProject = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_migration_project_message) =
    let input = Json_serializers.create_migration_project_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.CreateMigrationProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_migration_project_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_migration_project_message) =
    let input = Json_serializers.create_migration_project_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CreateMigrationProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_migration_project_response_of_yojson
      ~error_deserializer
end

module CreateReplicationConfig = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.databasemigrationservice#InvalidSubnet"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ReplicationSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.databasemigrationservice#ReplicationSubnetGroupDoesNotCoverEnoughAZs"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "InvalidSubnet" -> `InvalidSubnet (Json_deserializers.invalid_subnet_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ReplicationSubnetGroupDoesNotCoverEnoughAZs" ->
          `ReplicationSubnetGroupDoesNotCoverEnoughAZs
            (Json_deserializers.replication_subnet_group_does_not_cover_enough_a_zs_of_yojson tree
               path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_replication_config_message) =
    let input = Json_serializers.create_replication_config_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.CreateReplicationConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_replication_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_replication_config_message) =
    let input = Json_serializers.create_replication_config_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CreateReplicationConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_replication_config_response_of_yojson
      ~error_deserializer
end

module CreateReplicationInstance = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InsufficientResourceCapacityFault _ ->
        "com.amazonaws.databasemigrationservice#InsufficientResourceCapacityFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.databasemigrationservice#InvalidSubnet"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ReplicationSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.databasemigrationservice#ReplicationSubnetGroupDoesNotCoverEnoughAZs"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `StorageQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#StorageQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InsufficientResourceCapacityFault" ->
          `InsufficientResourceCapacityFault
            (Json_deserializers.insufficient_resource_capacity_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "InvalidSubnet" -> `InvalidSubnet (Json_deserializers.invalid_subnet_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ReplicationSubnetGroupDoesNotCoverEnoughAZs" ->
          `ReplicationSubnetGroupDoesNotCoverEnoughAZs
            (Json_deserializers.replication_subnet_group_does_not_cover_enough_a_zs_of_yojson tree
               path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "StorageQuotaExceededFault" ->
          `StorageQuotaExceededFault
            (Json_deserializers.storage_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_replication_instance_message) =
    let input = Json_serializers.create_replication_instance_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.CreateReplicationInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_replication_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_replication_instance_message) =
    let input = Json_serializers.create_replication_instance_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CreateReplicationInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_replication_instance_response_of_yojson
      ~error_deserializer
end

module CreateReplicationSubnetGroup = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidSubnet _ -> "com.amazonaws.databasemigrationservice#InvalidSubnet"
    | `ReplicationSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.databasemigrationservice#ReplicationSubnetGroupDoesNotCoverEnoughAZs"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidSubnet" -> `InvalidSubnet (Json_deserializers.invalid_subnet_of_yojson tree path)
      | _, "ReplicationSubnetGroupDoesNotCoverEnoughAZs" ->
          `ReplicationSubnetGroupDoesNotCoverEnoughAZs
            (Json_deserializers.replication_subnet_group_does_not_cover_enough_a_zs_of_yojson tree
               path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_replication_subnet_group_message) =
    let input = Json_serializers.create_replication_subnet_group_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.CreateReplicationSubnetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_replication_subnet_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_replication_subnet_group_message) =
    let input = Json_serializers.create_replication_subnet_group_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CreateReplicationSubnetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_replication_subnet_group_response_of_yojson
      ~error_deserializer
end

module CreateReplicationTask = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_replication_task_message) =
    let input = Json_serializers.create_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.CreateReplicationTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_replication_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_replication_task_message) =
    let input = Json_serializers.create_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.CreateReplicationTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_replication_task_response_of_yojson
      ~error_deserializer
end

module DeleteCertificate = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_certificate_message) =
    let input = Json_serializers.delete_certificate_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_certificate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_certificate_message) =
    let input = Json_serializers.delete_certificate_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_certificate_response_of_yojson
      ~error_deserializer
end

module DeleteConnection = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_connection_message) =
    let input = Json_serializers.delete_connection_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_connection_message) =
    let input = Json_serializers.delete_connection_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_connection_response_of_yojson
      ~error_deserializer
end

module DeleteDataMigration = struct
  let error_to_string = function
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_data_migration_message) =
    let input = Json_serializers.delete_data_migration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteDataMigration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_data_migration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_data_migration_message) =
    let input = Json_serializers.delete_data_migration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteDataMigration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_data_migration_response_of_yojson
      ~error_deserializer
end

module DeleteDataProvider = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_data_provider_message) =
    let input = Json_serializers.delete_data_provider_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteDataProvider" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_data_provider_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_data_provider_message) =
    let input = Json_serializers.delete_data_provider_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteDataProvider" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_data_provider_response_of_yojson
      ~error_deserializer
end

module DeleteEndpoint = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_endpoint_message) =
    let input = Json_serializers.delete_endpoint_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteEndpoint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_endpoint_message) =
    let input = Json_serializers.delete_endpoint_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_endpoint_response_of_yojson ~error_deserializer
end

module DeleteEventSubscription = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_event_subscription_message) =
    let input = Json_serializers.delete_event_subscription_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteEventSubscription"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_event_subscription_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_event_subscription_message) =
    let input = Json_serializers.delete_event_subscription_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteEventSubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_event_subscription_response_of_yojson
      ~error_deserializer
end

module DeleteFleetAdvisorCollector = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `CollectorNotFoundFault _ -> "com.amazonaws.databasemigrationservice#CollectorNotFoundFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "CollectorNotFoundFault" ->
          `CollectorNotFoundFault (Json_deserializers.collector_not_found_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_collector_request) =
    let input = Json_serializers.delete_collector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteFleetAdvisorCollector"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_collector_request) =
    let input = Json_serializers.delete_collector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteFleetAdvisorCollector" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteFleetAdvisorDatabases = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidOperationFault _ -> "com.amazonaws.databasemigrationservice#InvalidOperationFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidOperationFault" ->
          `InvalidOperationFault (Json_deserializers.invalid_operation_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_fleet_advisor_databases_request) =
    let input = Json_serializers.delete_fleet_advisor_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteFleetAdvisorDatabases"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_fleet_advisor_databases_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_fleet_advisor_databases_request) =
    let input = Json_serializers.delete_fleet_advisor_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteFleetAdvisorDatabases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_fleet_advisor_databases_response_of_yojson
      ~error_deserializer
end

module DeleteInstanceProfile = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_instance_profile_message) =
    let input = Json_serializers.delete_instance_profile_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteInstanceProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_instance_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_instance_profile_message) =
    let input = Json_serializers.delete_instance_profile_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteInstanceProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_instance_profile_response_of_yojson
      ~error_deserializer
end

module DeleteMigrationProject = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_migration_project_message) =
    let input = Json_serializers.delete_migration_project_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteMigrationProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_migration_project_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_migration_project_message) =
    let input = Json_serializers.delete_migration_project_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteMigrationProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_migration_project_response_of_yojson
      ~error_deserializer
end

module DeleteReplicationConfig = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_replication_config_message) =
    let input = Json_serializers.delete_replication_config_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteReplicationConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_replication_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_replication_config_message) =
    let input = Json_serializers.delete_replication_config_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteReplicationConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_replication_config_response_of_yojson
      ~error_deserializer
end

module DeleteReplicationInstance = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_replication_instance_message) =
    let input = Json_serializers.delete_replication_instance_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteReplicationInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_replication_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_replication_instance_message) =
    let input = Json_serializers.delete_replication_instance_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteReplicationInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_replication_instance_response_of_yojson
      ~error_deserializer
end

module DeleteReplicationSubnetGroup = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_replication_subnet_group_message) =
    let input = Json_serializers.delete_replication_subnet_group_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DeleteReplicationSubnetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_replication_subnet_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_replication_subnet_group_message) =
    let input = Json_serializers.delete_replication_subnet_group_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteReplicationSubnetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_replication_subnet_group_response_of_yojson
      ~error_deserializer
end

module DeleteReplicationTask = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_replication_task_message) =
    let input = Json_serializers.delete_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DeleteReplicationTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_replication_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_replication_task_message) =
    let input = Json_serializers.delete_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteReplicationTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_replication_task_response_of_yojson
      ~error_deserializer
end

module DeleteReplicationTaskAssessmentRun = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_replication_task_assessment_run_message) =
    let input = Json_serializers.delete_replication_task_assessment_run_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DeleteReplicationTaskAssessmentRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_replication_task_assessment_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_replication_task_assessment_run_message) =
    let input = Json_serializers.delete_replication_task_assessment_run_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DeleteReplicationTaskAssessmentRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_replication_task_assessment_run_response_of_yojson
      ~error_deserializer
end

module DescribeAccountAttributes = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_account_attributes_message) =
    let input = Json_serializers.describe_account_attributes_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeAccountAttributes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_account_attributes_message) =
    let input = Json_serializers.describe_account_attributes_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeAccountAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_attributes_response_of_yojson
      ~error_deserializer
end

module DescribeApplicableIndividualAssessments = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_applicable_individual_assessments_message) =
    let input =
      Json_serializers.describe_applicable_individual_assessments_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeApplicableIndividualAssessments" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_applicable_individual_assessments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_applicable_individual_assessments_message) =
    let input =
      Json_serializers.describe_applicable_individual_assessments_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeApplicableIndividualAssessments" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_applicable_individual_assessments_response_of_yojson
      ~error_deserializer
end

module DescribeCertificates = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_certificates_message) =
    let input = Json_serializers.describe_certificates_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeCertificates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_certificates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_certificates_message) =
    let input = Json_serializers.describe_certificates_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeCertificates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_certificates_response_of_yojson
      ~error_deserializer
end

module DescribeConnections = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_connections_message) =
    let input = Json_serializers.describe_connections_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeConnections"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connections_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_connections_message) =
    let input = Json_serializers.describe_connections_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeConnections" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connections_response_of_yojson
      ~error_deserializer
end

module DescribeConversionConfiguration = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_conversion_configuration_message) =
    let input = Json_serializers.describe_conversion_configuration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeConversionConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_conversion_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_conversion_configuration_message) =
    let input = Json_serializers.describe_conversion_configuration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeConversionConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_conversion_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeDataMigrations = struct
  let error_to_string = function
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_data_migrations_message) =
    let input = Json_serializers.describe_data_migrations_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeDataMigrations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_data_migrations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_data_migrations_message) =
    let input = Json_serializers.describe_data_migrations_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeDataMigrations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_data_migrations_response_of_yojson
      ~error_deserializer
end

module DescribeDataProviders = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_data_providers_message) =
    let input = Json_serializers.describe_data_providers_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeDataProviders"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_data_providers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_data_providers_message) =
    let input = Json_serializers.describe_data_providers_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeDataProviders" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_data_providers_response_of_yojson
      ~error_deserializer
end

module DescribeEndpointSettings = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_endpoint_settings_message) =
    let input = Json_serializers.describe_endpoint_settings_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeEndpointSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoint_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_endpoint_settings_message) =
    let input = Json_serializers.describe_endpoint_settings_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeEndpointSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoint_settings_response_of_yojson
      ~error_deserializer
end

module DescribeEndpointTypes = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_endpoint_types_message) =
    let input = Json_serializers.describe_endpoint_types_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeEndpointTypes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoint_types_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_endpoint_types_message) =
    let input = Json_serializers.describe_endpoint_types_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeEndpointTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoint_types_response_of_yojson
      ~error_deserializer
end

module DescribeEndpoints = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_endpoints_message) =
    let input = Json_serializers.describe_endpoints_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeEndpoints" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_endpoints_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_endpoints_message) =
    let input = Json_serializers.describe_endpoints_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeEndpoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoints_response_of_yojson
      ~error_deserializer
end

module DescribeEngineVersions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_engine_versions_message) =
    let input = Json_serializers.describe_engine_versions_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeEngineVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_engine_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_engine_versions_message) =
    let input = Json_serializers.describe_engine_versions_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeEngineVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_engine_versions_response_of_yojson
      ~error_deserializer
end

module DescribeEventCategories = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_event_categories_message) =
    let input = Json_serializers.describe_event_categories_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeEventCategories"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_categories_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_event_categories_message) =
    let input = Json_serializers.describe_event_categories_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeEventCategories" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_categories_response_of_yojson
      ~error_deserializer
end

module DescribeEventSubscriptions = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_event_subscriptions_message) =
    let input = Json_serializers.describe_event_subscriptions_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeEventSubscriptions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_subscriptions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_event_subscriptions_message) =
    let input = Json_serializers.describe_event_subscriptions_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeEventSubscriptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_subscriptions_response_of_yojson
      ~error_deserializer
end

module DescribeEvents = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_events_message) =
    let input = Json_serializers.describe_events_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeEvents" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_events_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_events_message) =
    let input = Json_serializers.describe_events_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeEvents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_events_response_of_yojson ~error_deserializer
end

module DescribeExtensionPackAssociations = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_extension_pack_associations_message) =
    let input = Json_serializers.describe_extension_pack_associations_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeExtensionPackAssociations" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_extension_pack_associations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_extension_pack_associations_message) =
    let input = Json_serializers.describe_extension_pack_associations_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeExtensionPackAssociations" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_extension_pack_associations_response_of_yojson
      ~error_deserializer
end

module DescribeFleetAdvisorCollectors = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_advisor_collectors_request) =
    let input = Json_serializers.describe_fleet_advisor_collectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeFleetAdvisorCollectors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_advisor_collectors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_advisor_collectors_request) =
    let input = Json_serializers.describe_fleet_advisor_collectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeFleetAdvisorCollectors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_advisor_collectors_response_of_yojson
      ~error_deserializer
end

module DescribeFleetAdvisorDatabases = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_advisor_databases_request) =
    let input = Json_serializers.describe_fleet_advisor_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeFleetAdvisorDatabases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_advisor_databases_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_advisor_databases_request) =
    let input = Json_serializers.describe_fleet_advisor_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeFleetAdvisorDatabases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_advisor_databases_response_of_yojson
      ~error_deserializer
end

module DescribeFleetAdvisorLsaAnalysis = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_advisor_lsa_analysis_request) =
    let input = Json_serializers.describe_fleet_advisor_lsa_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeFleetAdvisorLsaAnalysis" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_advisor_lsa_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_advisor_lsa_analysis_request) =
    let input = Json_serializers.describe_fleet_advisor_lsa_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeFleetAdvisorLsaAnalysis" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_advisor_lsa_analysis_response_of_yojson
      ~error_deserializer
end

module DescribeFleetAdvisorSchemaObjectSummary = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_advisor_schema_object_summary_request) =
    let input =
      Json_serializers.describe_fleet_advisor_schema_object_summary_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeFleetAdvisorSchemaObjectSummary" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_fleet_advisor_schema_object_summary_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_advisor_schema_object_summary_request)
      =
    let input =
      Json_serializers.describe_fleet_advisor_schema_object_summary_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeFleetAdvisorSchemaObjectSummary" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_fleet_advisor_schema_object_summary_response_of_yojson
      ~error_deserializer
end

module DescribeFleetAdvisorSchemas = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleet_advisor_schemas_request) =
    let input = Json_serializers.describe_fleet_advisor_schemas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeFleetAdvisorSchemas"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_advisor_schemas_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fleet_advisor_schemas_request) =
    let input = Json_serializers.describe_fleet_advisor_schemas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeFleetAdvisorSchemas" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleet_advisor_schemas_response_of_yojson
      ~error_deserializer
end

module DescribeInstanceProfiles = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_instance_profiles_message) =
    let input = Json_serializers.describe_instance_profiles_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeInstanceProfiles"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_instance_profiles_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_instance_profiles_message) =
    let input = Json_serializers.describe_instance_profiles_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeInstanceProfiles" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_instance_profiles_response_of_yojson
      ~error_deserializer
end

module DescribeMetadataModel = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_metadata_model_message) =
    let input = Json_serializers.describe_metadata_model_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeMetadataModel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_metadata_model_message) =
    let input = Json_serializers.describe_metadata_model_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_response_of_yojson
      ~error_deserializer
end

module DescribeMetadataModelAssessments = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_metadata_model_assessments_message) =
    let input = Json_serializers.describe_metadata_model_assessments_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelAssessments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_assessments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_metadata_model_assessments_message) =
    let input = Json_serializers.describe_metadata_model_assessments_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelAssessments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_assessments_response_of_yojson
      ~error_deserializer
end

module DescribeMetadataModelChildren = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_metadata_model_children_message) =
    let input = Json_serializers.describe_metadata_model_children_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelChildren" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_children_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_metadata_model_children_message) =
    let input = Json_serializers.describe_metadata_model_children_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelChildren" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_children_response_of_yojson
      ~error_deserializer
end

module DescribeMetadataModelConversions = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_metadata_model_conversions_message) =
    let input = Json_serializers.describe_metadata_model_conversions_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelConversions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_conversions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_metadata_model_conversions_message) =
    let input = Json_serializers.describe_metadata_model_conversions_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelConversions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_conversions_response_of_yojson
      ~error_deserializer
end

module DescribeMetadataModelCreations = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_metadata_model_creations_message) =
    let input = Json_serializers.describe_metadata_model_creations_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelCreations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_creations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_metadata_model_creations_message) =
    let input = Json_serializers.describe_metadata_model_creations_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelCreations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_creations_response_of_yojson
      ~error_deserializer
end

module DescribeMetadataModelExportsAsScript = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_metadata_model_exports_as_script_message) =
    let input =
      Json_serializers.describe_metadata_model_exports_as_script_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelExportsAsScript" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_metadata_model_exports_as_script_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_metadata_model_exports_as_script_message) =
    let input =
      Json_serializers.describe_metadata_model_exports_as_script_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelExportsAsScript" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_metadata_model_exports_as_script_response_of_yojson
      ~error_deserializer
end

module DescribeMetadataModelExportsToTarget = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_metadata_model_exports_to_target_message) =
    let input =
      Json_serializers.describe_metadata_model_exports_to_target_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelExportsToTarget" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_metadata_model_exports_to_target_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_metadata_model_exports_to_target_message) =
    let input =
      Json_serializers.describe_metadata_model_exports_to_target_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelExportsToTarget" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_metadata_model_exports_to_target_response_of_yojson
      ~error_deserializer
end

module DescribeMetadataModelImports = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_metadata_model_imports_message) =
    let input = Json_serializers.describe_metadata_model_imports_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelImports" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_imports_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_metadata_model_imports_message) =
    let input = Json_serializers.describe_metadata_model_imports_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeMetadataModelImports" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metadata_model_imports_response_of_yojson
      ~error_deserializer
end

module DescribeMigrationProjects = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_migration_projects_message) =
    let input = Json_serializers.describe_migration_projects_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeMigrationProjects"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_migration_projects_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_migration_projects_message) =
    let input = Json_serializers.describe_migration_projects_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeMigrationProjects" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_migration_projects_response_of_yojson
      ~error_deserializer
end

module DescribeOrderableReplicationInstances = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_orderable_replication_instances_message) =
    let input =
      Json_serializers.describe_orderable_replication_instances_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeOrderableReplicationInstances" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_orderable_replication_instances_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_orderable_replication_instances_message) =
    let input =
      Json_serializers.describe_orderable_replication_instances_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeOrderableReplicationInstances" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_orderable_replication_instances_response_of_yojson
      ~error_deserializer
end

module DescribePendingMaintenanceActions = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_pending_maintenance_actions_message) =
    let input = Json_serializers.describe_pending_maintenance_actions_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribePendingMaintenanceActions" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_pending_maintenance_actions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_pending_maintenance_actions_message) =
    let input = Json_serializers.describe_pending_maintenance_actions_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribePendingMaintenanceActions" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_pending_maintenance_actions_response_of_yojson
      ~error_deserializer
end

module DescribeRecommendationLimitations = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_recommendation_limitations_request) =
    let input = Json_serializers.describe_recommendation_limitations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeRecommendationLimitations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_recommendation_limitations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_recommendation_limitations_request) =
    let input = Json_serializers.describe_recommendation_limitations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeRecommendationLimitations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_recommendation_limitations_response_of_yojson
      ~error_deserializer
end

module DescribeRecommendations = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_recommendations_request) =
    let input = Json_serializers.describe_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeRecommendations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_recommendations_request) =
    let input = Json_serializers.describe_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_recommendations_response_of_yojson
      ~error_deserializer
end

module DescribeRefreshSchemasStatus = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_refresh_schemas_status_message) =
    let input = Json_serializers.describe_refresh_schemas_status_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeRefreshSchemasStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_refresh_schemas_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_refresh_schemas_status_message) =
    let input = Json_serializers.describe_refresh_schemas_status_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeRefreshSchemasStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_refresh_schemas_status_response_of_yojson
      ~error_deserializer
end

module DescribeReplicationConfigs = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_replication_configs_message) =
    let input = Json_serializers.describe_replication_configs_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeReplicationConfigs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_replication_configs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_replication_configs_message) =
    let input = Json_serializers.describe_replication_configs_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationConfigs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_replication_configs_response_of_yojson
      ~error_deserializer
end

module DescribeReplicationInstanceTaskLogs = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_replication_instance_task_logs_message) =
    let input =
      Json_serializers.describe_replication_instance_task_logs_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationInstanceTaskLogs" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_replication_instance_task_logs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_replication_instance_task_logs_message) =
    let input =
      Json_serializers.describe_replication_instance_task_logs_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationInstanceTaskLogs" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_replication_instance_task_logs_response_of_yojson
      ~error_deserializer
end

module DescribeReplicationInstances = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_replication_instances_message) =
    let input = Json_serializers.describe_replication_instances_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_replication_instances_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_replication_instances_message) =
    let input = Json_serializers.describe_replication_instances_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_replication_instances_response_of_yojson
      ~error_deserializer
end

module DescribeReplicationSubnetGroups = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_replication_subnet_groups_message) =
    let input = Json_serializers.describe_replication_subnet_groups_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationSubnetGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_replication_subnet_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_replication_subnet_groups_message) =
    let input = Json_serializers.describe_replication_subnet_groups_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationSubnetGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_replication_subnet_groups_response_of_yojson
      ~error_deserializer
end

module DescribeReplicationTableStatistics = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_replication_table_statistics_message) =
    let input = Json_serializers.describe_replication_table_statistics_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationTableStatistics" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_replication_table_statistics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_replication_table_statistics_message) =
    let input = Json_serializers.describe_replication_table_statistics_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationTableStatistics" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_replication_table_statistics_response_of_yojson
      ~error_deserializer
end

module DescribeReplicationTaskAssessmentResults = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_replication_task_assessment_results_message) =
    let input =
      Json_serializers.describe_replication_task_assessment_results_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationTaskAssessmentResults" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_replication_task_assessment_results_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_replication_task_assessment_results_message)
      =
    let input =
      Json_serializers.describe_replication_task_assessment_results_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationTaskAssessmentResults" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_replication_task_assessment_results_response_of_yojson
      ~error_deserializer
end

module DescribeReplicationTaskAssessmentRuns = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_replication_task_assessment_runs_message) =
    let input =
      Json_serializers.describe_replication_task_assessment_runs_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationTaskAssessmentRuns" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_replication_task_assessment_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_replication_task_assessment_runs_message) =
    let input =
      Json_serializers.describe_replication_task_assessment_runs_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationTaskAssessmentRuns" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_replication_task_assessment_runs_response_of_yojson
      ~error_deserializer
end

module DescribeReplicationTaskIndividualAssessments = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_replication_task_individual_assessments_message) =
    let input =
      Json_serializers.describe_replication_task_individual_assessments_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationTaskIndividualAssessments" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_replication_task_individual_assessments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : describe_replication_task_individual_assessments_message) =
    let input =
      Json_serializers.describe_replication_task_individual_assessments_message_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationTaskIndividualAssessments" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_replication_task_individual_assessments_response_of_yojson
      ~error_deserializer
end

module DescribeReplicationTasks = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_replication_tasks_message) =
    let input = Json_serializers.describe_replication_tasks_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeReplicationTasks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_replication_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_replication_tasks_message) =
    let input = Json_serializers.describe_replication_tasks_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeReplicationTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_replication_tasks_response_of_yojson
      ~error_deserializer
end

module DescribeReplications = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_replications_message) =
    let input = Json_serializers.describe_replications_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeReplications"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_replications_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_replications_message) =
    let input = Json_serializers.describe_replications_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeReplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_replications_response_of_yojson
      ~error_deserializer
end

module DescribeSchemas = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_schemas_message) =
    let input = Json_serializers.describe_schemas_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeSchemas" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_schemas_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_schemas_message) =
    let input = Json_serializers.describe_schemas_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeSchemas" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_schemas_response_of_yojson
      ~error_deserializer
end

module DescribeTableStatistics = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_table_statistics_message) =
    let input = Json_serializers.describe_table_statistics_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.DescribeTableStatistics"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_table_statistics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_table_statistics_message) =
    let input = Json_serializers.describe_table_statistics_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.DescribeTableStatistics" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_table_statistics_response_of_yojson
      ~error_deserializer
end

module ExportMetadataModelAssessment = struct
  let error_to_string = function
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_metadata_model_assessment_message) =
    let input = Json_serializers.export_metadata_model_assessment_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.ExportMetadataModelAssessment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_metadata_model_assessment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : export_metadata_model_assessment_message) =
    let input = Json_serializers.export_metadata_model_assessment_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ExportMetadataModelAssessment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_metadata_model_assessment_response_of_yojson
      ~error_deserializer
end

module GetTargetSelectionRules = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_target_selection_rules_message) =
    let input = Json_serializers.get_target_selection_rules_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.GetTargetSelectionRules"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_target_selection_rules_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_target_selection_rules_message) =
    let input = Json_serializers.get_target_selection_rules_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.GetTargetSelectionRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_target_selection_rules_response_of_yojson
      ~error_deserializer
end

module ImportCertificate = struct
  let error_to_string = function
    | `InvalidCertificateFault _ -> "com.amazonaws.databasemigrationservice#InvalidCertificateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidCertificateFault" ->
          `InvalidCertificateFault
            (Json_deserializers.invalid_certificate_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_certificate_message) =
    let input = Json_serializers.import_certificate_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ImportCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.import_certificate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_certificate_message) =
    let input = Json_serializers.import_certificate_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ImportCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_certificate_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_message) =
    let input = Json_serializers.list_tags_for_resource_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_message) =
    let input = Json_serializers.list_tags_for_resource_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ModifyConversionConfiguration = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_conversion_configuration_message) =
    let input = Json_serializers.modify_conversion_configuration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.ModifyConversionConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_conversion_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_conversion_configuration_message) =
    let input = Json_serializers.modify_conversion_configuration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ModifyConversionConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_conversion_configuration_response_of_yojson
      ~error_deserializer
end

module ModifyDataMigration = struct
  let error_to_string = function
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_data_migration_message) =
    let input = Json_serializers.modify_data_migration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ModifyDataMigration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_data_migration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_data_migration_message) =
    let input = Json_serializers.modify_data_migration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ModifyDataMigration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_data_migration_response_of_yojson
      ~error_deserializer
end

module ModifyDataProvider = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_data_provider_message) =
    let input = Json_serializers.modify_data_provider_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ModifyDataProvider" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.modify_data_provider_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_data_provider_message) =
    let input = Json_serializers.modify_data_provider_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ModifyDataProvider" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_data_provider_response_of_yojson
      ~error_deserializer
end

module ModifyEndpoint = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_endpoint_message) =
    let input = Json_serializers.modify_endpoint_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ModifyEndpoint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.modify_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_endpoint_message) =
    let input = Json_serializers.modify_endpoint_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ModifyEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_endpoint_response_of_yojson ~error_deserializer
end

module ModifyEventSubscription = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `KMSAccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#KMSAccessDeniedFault"
    | `KMSDisabledFault _ -> "com.amazonaws.databasemigrationservice#KMSDisabledFault"
    | `KMSInvalidStateFault _ -> "com.amazonaws.databasemigrationservice#KMSInvalidStateFault"
    | `KMSNotFoundFault _ -> "com.amazonaws.databasemigrationservice#KMSNotFoundFault"
    | `KMSThrottlingFault _ -> "com.amazonaws.databasemigrationservice#KMSThrottlingFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `SNSInvalidTopicFault _ -> "com.amazonaws.databasemigrationservice#SNSInvalidTopicFault"
    | `SNSNoAuthorizationFault _ -> "com.amazonaws.databasemigrationservice#SNSNoAuthorizationFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "KMSAccessDeniedFault" ->
          `KMSAccessDeniedFault (Json_deserializers.kms_access_denied_fault_of_yojson tree path)
      | _, "KMSDisabledFault" ->
          `KMSDisabledFault (Json_deserializers.kms_disabled_fault_of_yojson tree path)
      | _, "KMSInvalidStateFault" ->
          `KMSInvalidStateFault (Json_deserializers.kms_invalid_state_fault_of_yojson tree path)
      | _, "KMSNotFoundFault" ->
          `KMSNotFoundFault (Json_deserializers.kms_not_found_fault_of_yojson tree path)
      | _, "KMSThrottlingFault" ->
          `KMSThrottlingFault (Json_deserializers.kms_throttling_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "SNSInvalidTopicFault" ->
          `SNSInvalidTopicFault (Json_deserializers.sns_invalid_topic_fault_of_yojson tree path)
      | _, "SNSNoAuthorizationFault" ->
          `SNSNoAuthorizationFault
            (Json_deserializers.sns_no_authorization_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_event_subscription_message) =
    let input = Json_serializers.modify_event_subscription_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ModifyEventSubscription"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_event_subscription_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_event_subscription_message) =
    let input = Json_serializers.modify_event_subscription_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ModifyEventSubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_event_subscription_response_of_yojson
      ~error_deserializer
end

module ModifyInstanceProfile = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_instance_profile_message) =
    let input = Json_serializers.modify_instance_profile_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ModifyInstanceProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_instance_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_instance_profile_message) =
    let input = Json_serializers.modify_instance_profile_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ModifyInstanceProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_instance_profile_response_of_yojson
      ~error_deserializer
end

module ModifyMigrationProject = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_migration_project_message) =
    let input = Json_serializers.modify_migration_project_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ModifyMigrationProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_migration_project_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_migration_project_message) =
    let input = Json_serializers.modify_migration_project_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ModifyMigrationProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_migration_project_response_of_yojson
      ~error_deserializer
end

module ModifyReplicationConfig = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `InvalidSubnet _ -> "com.amazonaws.databasemigrationservice#InvalidSubnet"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ReplicationSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.databasemigrationservice#ReplicationSubnetGroupDoesNotCoverEnoughAZs"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "InvalidSubnet" -> `InvalidSubnet (Json_deserializers.invalid_subnet_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ReplicationSubnetGroupDoesNotCoverEnoughAZs" ->
          `ReplicationSubnetGroupDoesNotCoverEnoughAZs
            (Json_deserializers.replication_subnet_group_does_not_cover_enough_a_zs_of_yojson tree
               path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_replication_config_message) =
    let input = Json_serializers.modify_replication_config_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ModifyReplicationConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_replication_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_replication_config_message) =
    let input = Json_serializers.modify_replication_config_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ModifyReplicationConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_replication_config_response_of_yojson
      ~error_deserializer
end

module ModifyReplicationInstance = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InsufficientResourceCapacityFault _ ->
        "com.amazonaws.databasemigrationservice#InsufficientResourceCapacityFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `StorageQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#StorageQuotaExceededFault"
    | `UpgradeDependencyFailureFault _ ->
        "com.amazonaws.databasemigrationservice#UpgradeDependencyFailureFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InsufficientResourceCapacityFault" ->
          `InsufficientResourceCapacityFault
            (Json_deserializers.insufficient_resource_capacity_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "StorageQuotaExceededFault" ->
          `StorageQuotaExceededFault
            (Json_deserializers.storage_quota_exceeded_fault_of_yojson tree path)
      | _, "UpgradeDependencyFailureFault" ->
          `UpgradeDependencyFailureFault
            (Json_deserializers.upgrade_dependency_failure_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_replication_instance_message) =
    let input = Json_serializers.modify_replication_instance_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ModifyReplicationInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_replication_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_replication_instance_message) =
    let input = Json_serializers.modify_replication_instance_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ModifyReplicationInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_replication_instance_response_of_yojson
      ~error_deserializer
end

module ModifyReplicationSubnetGroup = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidSubnet _ -> "com.amazonaws.databasemigrationservice#InvalidSubnet"
    | `ReplicationSubnetGroupDoesNotCoverEnoughAZs _ ->
        "com.amazonaws.databasemigrationservice#ReplicationSubnetGroupDoesNotCoverEnoughAZs"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `SubnetAlreadyInUse _ -> "com.amazonaws.databasemigrationservice#SubnetAlreadyInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidSubnet" -> `InvalidSubnet (Json_deserializers.invalid_subnet_of_yojson tree path)
      | _, "ReplicationSubnetGroupDoesNotCoverEnoughAZs" ->
          `ReplicationSubnetGroupDoesNotCoverEnoughAZs
            (Json_deserializers.replication_subnet_group_does_not_cover_enough_a_zs_of_yojson tree
               path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "SubnetAlreadyInUse" ->
          `SubnetAlreadyInUse (Json_deserializers.subnet_already_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_replication_subnet_group_message) =
    let input = Json_serializers.modify_replication_subnet_group_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.ModifyReplicationSubnetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_replication_subnet_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_replication_subnet_group_message) =
    let input = Json_serializers.modify_replication_subnet_group_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ModifyReplicationSubnetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_replication_subnet_group_response_of_yojson
      ~error_deserializer
end

module ModifyReplicationTask = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_replication_task_message) =
    let input = Json_serializers.modify_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ModifyReplicationTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_replication_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_replication_task_message) =
    let input = Json_serializers.modify_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ModifyReplicationTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_replication_task_response_of_yojson
      ~error_deserializer
end

module MoveReplicationTask = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : move_replication_task_message) =
    let input = Json_serializers.move_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.MoveReplicationTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.move_replication_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : move_replication_task_message) =
    let input = Json_serializers.move_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.MoveReplicationTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.move_replication_task_response_of_yojson
      ~error_deserializer
end

module RebootReplicationInstance = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reboot_replication_instance_message) =
    let input = Json_serializers.reboot_replication_instance_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.RebootReplicationInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reboot_replication_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reboot_replication_instance_message) =
    let input = Json_serializers.reboot_replication_instance_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.RebootReplicationInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reboot_replication_instance_response_of_yojson
      ~error_deserializer
end

module RefreshSchemas = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : refresh_schemas_message) =
    let input = Json_serializers.refresh_schemas_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.RefreshSchemas" ~service
      ~context ~input ~output_deserializer:Json_deserializers.refresh_schemas_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : refresh_schemas_message) =
    let input = Json_serializers.refresh_schemas_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.RefreshSchemas" ~service ~context ~input
      ~output_deserializer:Json_deserializers.refresh_schemas_response_of_yojson ~error_deserializer
end

module ReloadReplicationTables = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reload_replication_tables_message) =
    let input = Json_serializers.reload_replication_tables_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ReloadReplicationTables"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reload_replication_tables_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reload_replication_tables_message) =
    let input = Json_serializers.reload_replication_tables_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.ReloadReplicationTables" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reload_replication_tables_response_of_yojson
      ~error_deserializer
end

module ReloadTables = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reload_tables_message) =
    let input = Json_serializers.reload_tables_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.ReloadTables" ~service
      ~context ~input ~output_deserializer:Json_deserializers.reload_tables_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reload_tables_message) =
    let input = Json_serializers.reload_tables_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonDMSv20160101.ReloadTables"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reload_tables_response_of_yojson ~error_deserializer
end

module RemoveTagsFromResource = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_tags_from_resource_message) =
    let input = Json_serializers.remove_tags_from_resource_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.RemoveTagsFromResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_tags_from_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_tags_from_resource_message) =
    let input = Json_serializers.remove_tags_from_resource_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.RemoveTagsFromResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_tags_from_resource_response_of_yojson
      ~error_deserializer
end

module RunFleetAdvisorLsaAnalysis = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.RunFleetAdvisorLsaAnalysis"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.run_fleet_advisor_lsa_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.RunFleetAdvisorLsaAnalysis" ~service ~context ~input
      ~output_deserializer:Json_deserializers.run_fleet_advisor_lsa_analysis_response_of_yojson
      ~error_deserializer
end

module StartDataMigration = struct
  let error_to_string = function
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidOperationFault _ -> "com.amazonaws.databasemigrationservice#InvalidOperationFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidOperationFault" ->
          `InvalidOperationFault (Json_deserializers.invalid_operation_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_data_migration_message) =
    let input = Json_serializers.start_data_migration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.StartDataMigration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_data_migration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_data_migration_message) =
    let input = Json_serializers.start_data_migration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartDataMigration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_data_migration_response_of_yojson
      ~error_deserializer
end

module StartExtensionPackAssociation = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_extension_pack_association_message) =
    let input = Json_serializers.start_extension_pack_association_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.StartExtensionPackAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_extension_pack_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_extension_pack_association_message) =
    let input = Json_serializers.start_extension_pack_association_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartExtensionPackAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_extension_pack_association_response_of_yojson
      ~error_deserializer
end

module StartMetadataModelAssessment = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_metadata_model_assessment_message) =
    let input = Json_serializers.start_metadata_model_assessment_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.StartMetadataModelAssessment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_metadata_model_assessment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_metadata_model_assessment_message) =
    let input = Json_serializers.start_metadata_model_assessment_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartMetadataModelAssessment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_metadata_model_assessment_response_of_yojson
      ~error_deserializer
end

module StartMetadataModelConversion = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_metadata_model_conversion_message) =
    let input = Json_serializers.start_metadata_model_conversion_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.StartMetadataModelConversion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_metadata_model_conversion_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_metadata_model_conversion_message) =
    let input = Json_serializers.start_metadata_model_conversion_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartMetadataModelConversion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_metadata_model_conversion_response_of_yojson
      ~error_deserializer
end

module StartMetadataModelCreation = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_metadata_model_creation_message) =
    let input = Json_serializers.start_metadata_model_creation_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.StartMetadataModelCreation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_metadata_model_creation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_metadata_model_creation_message) =
    let input = Json_serializers.start_metadata_model_creation_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartMetadataModelCreation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_metadata_model_creation_response_of_yojson
      ~error_deserializer
end

module StartMetadataModelExportAsScript = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_metadata_model_export_as_script_message) =
    let input = Json_serializers.start_metadata_model_export_as_script_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.StartMetadataModelExportAsScript" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_metadata_model_export_as_script_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_metadata_model_export_as_script_message) =
    let input = Json_serializers.start_metadata_model_export_as_script_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartMetadataModelExportAsScript" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_metadata_model_export_as_script_response_of_yojson
      ~error_deserializer
end

module StartMetadataModelExportToTarget = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_metadata_model_export_to_target_message) =
    let input = Json_serializers.start_metadata_model_export_to_target_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.StartMetadataModelExportToTarget" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_metadata_model_export_to_target_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_metadata_model_export_to_target_message) =
    let input = Json_serializers.start_metadata_model_export_to_target_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartMetadataModelExportToTarget" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_metadata_model_export_to_target_response_of_yojson
      ~error_deserializer
end

module StartMetadataModelImport = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_metadata_model_import_message) =
    let input = Json_serializers.start_metadata_model_import_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.StartMetadataModelImport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_metadata_model_import_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_metadata_model_import_message) =
    let input = Json_serializers.start_metadata_model_import_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartMetadataModelImport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_metadata_model_import_response_of_yojson
      ~error_deserializer
end

module StartRecommendations = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_recommendations_request) =
    let input = Json_serializers.start_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.StartRecommendations"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_recommendations_request) =
    let input = Json_serializers.start_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartRecommendations" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartReplication = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_replication_message) =
    let input = Json_serializers.start_replication_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.StartReplication" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_replication_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_replication_message) =
    let input = Json_serializers.start_replication_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartReplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_replication_response_of_yojson
      ~error_deserializer
end

module StartReplicationTask = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_replication_task_message) =
    let input = Json_serializers.start_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.StartReplicationTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_replication_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_replication_task_message) =
    let input = Json_serializers.start_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartReplicationTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_replication_task_response_of_yojson
      ~error_deserializer
end

module StartReplicationTaskAssessment = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_replication_task_assessment_message) =
    let input = Json_serializers.start_replication_task_assessment_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.StartReplicationTaskAssessment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_replication_task_assessment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_replication_task_assessment_message) =
    let input = Json_serializers.start_replication_task_assessment_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartReplicationTaskAssessment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_replication_task_assessment_response_of_yojson
      ~error_deserializer
end

module StartReplicationTaskAssessmentRun = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSAccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#KMSAccessDeniedFault"
    | `KMSDisabledFault _ -> "com.amazonaws.databasemigrationservice#KMSDisabledFault"
    | `KMSFault _ -> "com.amazonaws.databasemigrationservice#KMSFault"
    | `KMSInvalidStateFault _ -> "com.amazonaws.databasemigrationservice#KMSInvalidStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `KMSNotFoundFault _ -> "com.amazonaws.databasemigrationservice#KMSNotFoundFault"
    | `ResourceAlreadyExistsFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceAlreadyExistsFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `S3AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#S3AccessDeniedFault"
    | `S3ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#S3ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSAccessDeniedFault" ->
          `KMSAccessDeniedFault (Json_deserializers.kms_access_denied_fault_of_yojson tree path)
      | _, "KMSDisabledFault" ->
          `KMSDisabledFault (Json_deserializers.kms_disabled_fault_of_yojson tree path)
      | _, "KMSFault" -> `KMSFault (Json_deserializers.kms_fault_of_yojson tree path)
      | _, "KMSInvalidStateFault" ->
          `KMSInvalidStateFault (Json_deserializers.kms_invalid_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "KMSNotFoundFault" ->
          `KMSNotFoundFault (Json_deserializers.kms_not_found_fault_of_yojson tree path)
      | _, "ResourceAlreadyExistsFault" ->
          `ResourceAlreadyExistsFault
            (Json_deserializers.resource_already_exists_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "S3AccessDeniedFault" ->
          `S3AccessDeniedFault (Json_deserializers.s3_access_denied_fault_of_yojson tree path)
      | _, "S3ResourceNotFoundFault" ->
          `S3ResourceNotFoundFault
            (Json_deserializers.s3_resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_replication_task_assessment_run_message) =
    let input = Json_serializers.start_replication_task_assessment_run_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.StartReplicationTaskAssessmentRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_replication_task_assessment_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_replication_task_assessment_run_message) =
    let input = Json_serializers.start_replication_task_assessment_run_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StartReplicationTaskAssessmentRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_replication_task_assessment_run_response_of_yojson
      ~error_deserializer
end

module StopDataMigration = struct
  let error_to_string = function
    | `FailedDependencyFault _ -> "com.amazonaws.databasemigrationservice#FailedDependencyFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "FailedDependencyFault" ->
          `FailedDependencyFault (Json_deserializers.failed_dependency_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_data_migration_message) =
    let input = Json_serializers.stop_data_migration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.StopDataMigration" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_data_migration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_data_migration_message) =
    let input = Json_serializers.stop_data_migration_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StopDataMigration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_data_migration_response_of_yojson
      ~error_deserializer
end

module StopReplication = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_replication_message) =
    let input = Json_serializers.stop_replication_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.StopReplication" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_replication_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_replication_message) =
    let input = Json_serializers.stop_replication_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StopReplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_replication_response_of_yojson
      ~error_deserializer
end

module StopReplicationTask = struct
  let error_to_string = function
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_replication_task_message) =
    let input = Json_serializers.stop_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.StopReplicationTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_replication_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_replication_task_message) =
    let input = Json_serializers.stop_replication_task_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.StopReplicationTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_replication_task_response_of_yojson
      ~error_deserializer
end

module TestConnection = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | `KMSKeyNotAccessibleFault _ ->
        "com.amazonaws.databasemigrationservice#KMSKeyNotAccessibleFault"
    | `ResourceNotFoundFault _ -> "com.amazonaws.databasemigrationservice#ResourceNotFoundFault"
    | `ResourceQuotaExceededFault _ ->
        "com.amazonaws.databasemigrationservice#ResourceQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceNotFoundFault" ->
          `ResourceNotFoundFault (Json_deserializers.resource_not_found_fault_of_yojson tree path)
      | _, "ResourceQuotaExceededFault" ->
          `ResourceQuotaExceededFault
            (Json_deserializers.resource_quota_exceeded_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_connection_message) =
    let input = Json_serializers.test_connection_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonDMSv20160101.TestConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.test_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : test_connection_message) =
    let input = Json_serializers.test_connection_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.TestConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.test_connection_response_of_yojson ~error_deserializer
end

module UpdateSubscriptionsToEventBridge = struct
  let error_to_string = function
    | `AccessDeniedFault _ -> "com.amazonaws.databasemigrationservice#AccessDeniedFault"
    | `InvalidResourceStateFault _ ->
        "com.amazonaws.databasemigrationservice#InvalidResourceStateFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedFault" ->
          `AccessDeniedFault (Json_deserializers.access_denied_fault_of_yojson tree path)
      | _, "InvalidResourceStateFault" ->
          `InvalidResourceStateFault
            (Json_deserializers.invalid_resource_state_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_subscriptions_to_event_bridge_message) =
    let input = Json_serializers.update_subscriptions_to_event_bridge_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonDMSv20160101.UpdateSubscriptionsToEventBridge" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_subscriptions_to_event_bridge_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_subscriptions_to_event_bridge_message) =
    let input = Json_serializers.update_subscriptions_to_event_bridge_message_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonDMSv20160101.UpdateSubscriptionsToEventBridge" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_subscriptions_to_event_bridge_response_of_yojson
      ~error_deserializer
end
