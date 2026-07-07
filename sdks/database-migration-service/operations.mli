open Types

module AddTagsToResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_message ->
    ( add_tags_to_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_message ->
    ( add_tags_to_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds metadata tags to an DMS resource, including replication instance, endpoint, subnet group, \
   and migration task. These tags can also be used with cost allocation reporting to track cost \
   associated with DMS resources, or used in a Condition statement in an IAM policy for DMS. For \
   more information, see {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_Tag.html} \
   [Tag] } data type description.\n"]

module ApplyPendingMaintenanceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    apply_pending_maintenance_action_message ->
    ( apply_pending_maintenance_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    apply_pending_maintenance_action_message ->
    ( apply_pending_maintenance_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Applies a pending maintenance action to a resource (for example, to a replication instance).\n"]

module BatchStartRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_start_recommendations_request ->
    ( batch_start_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_start_recommendations_request ->
    ( batch_start_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Starts the analysis of up to 20 source databases to recommend target engines for each source \
   database. This is a batch version of \
   {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartRecommendations.html}StartRecommendations}.\n\
  \   \n\
  \    The result of analysis of each source database is reported individually in the response. \
   Because the batch request can result in a combination of successful and unsuccessful actions, \
   you should check for batch errors even when the call returns an HTTP status code of [200].\n\
  \    "]

module CancelMetadataModelConversion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_metadata_model_conversion_message ->
    ( cancel_metadata_model_conversion_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_metadata_model_conversion_message ->
    ( cancel_metadata_model_conversion_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels a single metadata model conversion operation that was started with \
   [StartMetadataModelConversion].\n"]

module CancelMetadataModelCreation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_metadata_model_creation_message ->
    ( cancel_metadata_model_creation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_metadata_model_creation_message ->
    ( cancel_metadata_model_creation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels a single metadata model creation operation that was started with \
   [StartMetadataModelCreation].\n"]

module CancelReplicationTaskAssessmentRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_replication_task_assessment_run_message ->
    ( cancel_replication_task_assessment_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_replication_task_assessment_run_message ->
    ( cancel_replication_task_assessment_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels a single premigration assessment run.\n\n\
  \ This operation prevents any individual assessments from running if they haven't started \
   running. It also attempts to cancel any individual assessments that are currently running.\n\
  \ "]

module CreateDataMigration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidOperationFault of invalid_operation_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_migration_message ->
    ( create_data_migration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidOperationFault of invalid_operation_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_migration_message ->
    ( create_data_migration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidOperationFault of invalid_operation_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a data migration using the provided settings.\n"]

module CreateDataProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_provider_message ->
    ( create_data_provider_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_provider_message ->
    ( create_data_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a data provider using the provided settings. A data provider stores a data store type \
   and location information about your database. \n"]

module CreateEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `S3AccessDeniedFault of s3_access_denied_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_message ->
    ( create_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_message ->
    ( create_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an endpoint using the provided settings.\n\n\
  \  For a MySQL source or target endpoint, don't explicitly specify the database using the \
   [DatabaseName] request parameter on the [CreateEndpoint] API call. Specifying [DatabaseName] \
   when you create a MySQL endpoint replicates all the task tables to this single database. For \
   MySQL endpoints, you specify the database only when you specify the schema in the table-mapping \
   rules of the DMS task.\n\
  \  \n\
  \   "]

module CreateEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `KMSAccessDeniedFault of kms_access_denied_fault
    | `KMSDisabledFault of kms_disabled_fault
    | `KMSInvalidStateFault of kms_invalid_state_fault
    | `KMSNotFoundFault of kms_not_found_fault
    | `KMSThrottlingFault of kms_throttling_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `SNSInvalidTopicFault of sns_invalid_topic_fault
    | `SNSNoAuthorizationFault of sns_no_authorization_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_event_subscription_message ->
    ( create_event_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `KMSAccessDeniedFault of kms_access_denied_fault
      | `KMSDisabledFault of kms_disabled_fault
      | `KMSInvalidStateFault of kms_invalid_state_fault
      | `KMSNotFoundFault of kms_not_found_fault
      | `KMSThrottlingFault of kms_throttling_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_event_subscription_message ->
    ( create_event_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `KMSAccessDeniedFault of kms_access_denied_fault
      | `KMSDisabledFault of kms_disabled_fault
      | `KMSInvalidStateFault of kms_invalid_state_fault
      | `KMSNotFoundFault of kms_not_found_fault
      | `KMSThrottlingFault of kms_throttling_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates an DMS event notification subscription. \n\n\
  \ You can specify the type of source ([SourceType]) you want to be notified of, provide a list \
   of DMS source IDs ([SourceIds]) that triggers the events, and provide a list of event \
   categories ([EventCategories]) for events you want to be notified of. If you specify both the \
   [SourceType] and [SourceIds], such as [SourceType = replication-instance] and [SourceIdentifier \
   =\n\
  \            my-replinstance], you will be notified of all the replication instance events for \
   the specified source. If you specify a [SourceType] but don't specify a [SourceIdentifier], you \
   receive notice of the events for that source type for all your DMS sources. If you don't \
   specify either [SourceType] nor [SourceIdentifier], you will be notified of events generated \
   from all DMS sources belonging to your customer account.\n\
  \ \n\
  \  For more information about DMS events, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html}Working with Events and \
   Notifications} in the {i Database Migration Service User Guide.} \n\
  \  "]

module CreateFleetAdvisorCollector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_advisor_collector_request ->
    ( create_fleet_advisor_collector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_advisor_collector_request ->
    ( create_fleet_advisor_collector_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Creates a Fleet Advisor collector using the specified parameters.\n\
  \   "]

module CreateInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_instance_profile_message ->
    ( create_instance_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_instance_profile_message ->
    ( create_instance_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates the instance profile using the specified parameters.\n"]

module CreateMigrationProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_migration_project_message ->
    ( create_migration_project_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_migration_project_message ->
    ( create_migration_project_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates the migration project using the specified parameters.\n\n\
  \ You can run this action only after you create an instance profile and data providers using \
   {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_CreateInstanceProfile.html}CreateInstanceProfile} \
   and \
   {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_CreateDataProvider.html}CreateDataProvider}.\n\
  \ "]

module CreateReplicationConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `InvalidSubnet of invalid_subnet
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
      replication_subnet_group_does_not_cover_enough_a_zs
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_replication_config_message ->
    ( create_replication_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `InvalidSubnet of invalid_subnet
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
        replication_subnet_group_does_not_cover_enough_a_zs
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_replication_config_message ->
    ( create_replication_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `InvalidSubnet of invalid_subnet
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
        replication_subnet_group_does_not_cover_enough_a_zs
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a configuration that you can later provide to configure and start an DMS Serverless \
   replication. You can also provide options to validate the configuration inputs before you start \
   the replication.\n"]

module CreateReplicationInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InsufficientResourceCapacityFault of insufficient_resource_capacity_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `InvalidSubnet of invalid_subnet
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
      replication_subnet_group_does_not_cover_enough_a_zs
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_replication_instance_message ->
    ( create_replication_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InsufficientResourceCapacityFault of insufficient_resource_capacity_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `InvalidSubnet of invalid_subnet
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
        replication_subnet_group_does_not_cover_enough_a_zs
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_replication_instance_message ->
    ( create_replication_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InsufficientResourceCapacityFault of insufficient_resource_capacity_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `InvalidSubnet of invalid_subnet
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
        replication_subnet_group_does_not_cover_enough_a_zs
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates the replication instance using the specified parameters.\n\n\
  \ DMS requires that your account have certain roles with appropriate permissions before you can \
   create a replication instance. For information on the required roles, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#CHAP_Security.APIRole}Creating \
   the IAM Roles to Use With the CLI and DMS API}. For information on the required permissions, \
   see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#CHAP_Security.IAMPermissions}IAM \
   Permissions Needed to Use DMS}.\n\
  \ \n\
  \   If you don't specify a version when creating a replication instance, DMS will create the \
   instance using the default engine version. For information about the default engine version, \
   see {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReleaseNotes.html}Release Notes}.\n\
  \   \n\
  \    "]

module CreateReplicationSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidSubnet of invalid_subnet
    | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
      replication_subnet_group_does_not_cover_enough_a_zs
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_replication_subnet_group_message ->
    ( create_replication_subnet_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidSubnet of invalid_subnet
      | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
        replication_subnet_group_does_not_cover_enough_a_zs
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_replication_subnet_group_message ->
    ( create_replication_subnet_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidSubnet of invalid_subnet
      | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
        replication_subnet_group_does_not_cover_enough_a_zs
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a replication subnet group given a list of the subnet IDs in a VPC.\n\n\
  \ The VPC needs to have at least one subnet in at least two availability zones in the Amazon Web \
   Services Region, otherwise the service will throw a \
   [ReplicationSubnetGroupDoesNotCoverEnoughAZs] exception.\n\
  \ \n\
  \  If a replication subnet group exists in your Amazon Web Services account, the \
   CreateReplicationSubnetGroup action returns the following error message: The Replication Subnet \
   Group already exists. In this case, delete the existing replication subnet group. To do so, use \
   the \
   {{:https://docs.aws.amazon.com/en_us/dms/latest/APIReference/API_DeleteReplicationSubnetGroup.html}DeleteReplicationSubnetGroup} \
   action. Optionally, choose Subnet groups in the DMS console, then choose your subnet group. \
   Next, choose Delete from Actions.\n\
  \  "]

module CreateReplicationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_replication_task_message ->
    ( create_replication_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_replication_task_message ->
    ( create_replication_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a replication task using the specified parameters.\n"]

module DeleteCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_certificate_message ->
    ( delete_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_certificate_message ->
    ( delete_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified certificate. \n"]

module DeleteConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_message ->
    ( delete_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_message ->
    ( delete_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the connection between a replication instance and an endpoint.\n"]

module DeleteDataMigration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_data_migration_message ->
    ( delete_data_migration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_data_migration_message ->
    ( delete_data_migration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified data migration.\n"]

module DeleteDataProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_data_provider_message ->
    ( delete_data_provider_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_data_provider_message ->
    ( delete_data_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified data provider.\n\n\
  \  All migration projects associated with the data provider must be deleted or modified before \
   you can delete the data provider.\n\
  \  \n\
  \   "]

module DeleteEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_message ->
    ( delete_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_message ->
    ( delete_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified endpoint.\n\n\
  \  All tasks associated with the endpoint must be deleted before you can delete the endpoint.\n\
  \  \n\
  \    \n\
  \    "]

module DeleteEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_event_subscription_message ->
    ( delete_event_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_event_subscription_message ->
    ( delete_event_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Deletes an DMS event subscription. \n"]

module DeleteFleetAdvisorCollector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `CollectorNotFoundFault of collector_not_found_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_collector_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `CollectorNotFoundFault of collector_not_found_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_collector_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `CollectorNotFoundFault of collector_not_found_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Deletes the specified Fleet Advisor collector.\n\
  \   "]

module DeleteFleetAdvisorDatabases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidOperationFault of invalid_operation_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_advisor_databases_request ->
    ( delete_fleet_advisor_databases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidOperationFault of invalid_operation_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_advisor_databases_request ->
    ( delete_fleet_advisor_databases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidOperationFault of invalid_operation_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Deletes the specified Fleet Advisor collector databases.\n\
  \   "]

module DeleteInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_instance_profile_message ->
    ( delete_instance_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_instance_profile_message ->
    ( delete_instance_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified instance profile.\n\n\
  \  All migration projects associated with the instance profile must be deleted or modified \
   before you can delete the instance profile.\n\
  \  \n\
  \   "]

module DeleteMigrationProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_migration_project_message ->
    ( delete_migration_project_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_migration_project_message ->
    ( delete_migration_project_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified migration project.\n\n\
  \  The migration project must be closed before you can delete it.\n\
  \  \n\
  \   "]

module DeleteReplicationConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_config_message ->
    ( delete_replication_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_config_message ->
    ( delete_replication_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an DMS Serverless replication configuration. This effectively deprovisions any and all \
   replications that use this configuration. You can't delete the configuration for an DMS \
   Serverless replication that is ongoing. You can delete the configuration when the replication \
   is in a non-RUNNING and non-STARTING state.\n"]

module DeleteReplicationInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_instance_message ->
    ( delete_replication_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_instance_message ->
    ( delete_replication_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified replication instance.\n\n\
  \  You must delete any migration tasks that are associated with the replication instance before \
   you can delete it.\n\
  \  \n\
  \    \n\
  \    "]

module DeleteReplicationSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_subnet_group_message ->
    ( delete_replication_subnet_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_subnet_group_message ->
    ( delete_replication_subnet_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a subnet group.\n"]

module DeleteReplicationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_task_message ->
    ( delete_replication_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_task_message ->
    ( delete_replication_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified replication task.\n"]

module DeleteReplicationTaskAssessmentRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_task_assessment_run_message ->
    ( delete_replication_task_assessment_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_task_assessment_run_message ->
    ( delete_replication_task_assessment_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the record of a single premigration assessment run.\n\n\
  \ This operation removes all metadata that DMS maintains about this assessment run. However, the \
   operation leaves untouched all information about this assessment run that is stored in your \
   Amazon S3 bucket.\n\
  \ "]

module DescribeAccountAttributes : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_attributes_message ->
    (describe_account_attributes_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_attributes_message ->
    ( describe_account_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all of the DMS attributes for a customer account. These attributes include DMS quotas for \
   the account and a unique account identifier in a particular DMS region. DMS quotas include a \
   list of resource quotas supported by the account, such as the number of replication instances \
   allowed. The description for each resource quota, includes the quota name, current usage toward \
   that quota, and the quota's maximum value. DMS uses the unique account identifier to name each \
   artifact used by DMS in the given region.\n\n\
  \ This command does not take any parameters.\n\
  \ "]

module DescribeApplicableIndividualAssessments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_applicable_individual_assessments_message ->
    ( describe_applicable_individual_assessments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_applicable_individual_assessments_message ->
    ( describe_applicable_individual_assessments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of individual assessments that you can specify for a new premigration \
   assessment run, given one or more parameters.\n\n\
  \ If you specify an existing migration task, this operation provides the default individual \
   assessments you can specify for that task. Otherwise, the specified parameters model elements \
   of a possible migration task on which to base a premigration assessment run.\n\
  \ \n\
  \  To use these migration task modeling parameters, you must specify an existing replication \
   instance, a source database engine, a target database engine, and a migration type. This \
   combination of parameters potentially limits the default individual assessments available for \
   an assessment run created for a corresponding migration task.\n\
  \  \n\
  \   If you specify no parameters, this operation provides a list of all possible individual \
   assessments that you can specify for an assessment run. If you specify any one of the task \
   modeling parameters, you must specify all of them or the operation cannot provide a list of \
   individual assessments. The only parameter that you can specify alone is for an existing \
   migration task. The specified task definition then determines the default list of individual \
   assessments that you can specify in an assessment run for the task.\n\
  \   "]

module DescribeCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_certificates_message ->
    ( describe_certificates_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_certificates_message ->
    ( describe_certificates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides a description of the certificate.\n"]

module DescribeConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connections_message ->
    ( describe_connections_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connections_message ->
    ( describe_connections_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the status of the connections that have been made between the replication instance \
   and an endpoint. Connections are created when you test an endpoint.\n"]

module DescribeConversionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_conversion_configuration_message ->
    ( describe_conversion_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_conversion_configuration_message ->
    ( describe_conversion_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns configuration parameters for a schema conversion project.\n"]

module DescribeDataMigrations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_migrations_message ->
    ( describe_data_migrations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_migrations_message ->
    ( describe_data_migrations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about data migrations.\n"]

module DescribeDataProviders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_providers_message ->
    ( describe_data_providers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_providers_message ->
    ( describe_data_providers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a paginated list of data providers for your account in the current region.\n"]

module DescribeEndpointSettings : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_settings_message ->
    (describe_endpoint_settings_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_settings_message ->
    ( describe_endpoint_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the possible endpoint settings available when you create an endpoint \
   for a specific database engine.\n"]

module DescribeEndpointTypes : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_types_message ->
    (describe_endpoint_types_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_types_message ->
    ( describe_endpoint_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the type of endpoints available.\n"]

module DescribeEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoints_message ->
    ( describe_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoints_message ->
    ( describe_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the endpoints for your account in the current region.\n"]

module DescribeEngineVersions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_versions_message ->
    (describe_engine_versions_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_versions_message ->
    ( describe_engine_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the replication instance versions used in the project.\n"]

module DescribeEventCategories : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_categories_message ->
    (describe_event_categories_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_categories_message ->
    ( describe_event_categories_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists categories for all event source types, or, if specified, for a specified source type. You \
   can see a list of the event categories and source types in \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html}Working with Events and \
   Notifications} in the {i Database Migration Service User Guide.} \n"]

module DescribeEventSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_subscriptions_message ->
    ( describe_event_subscriptions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_subscriptions_message ->
    ( describe_event_subscriptions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the event subscriptions for a customer account. The description of a subscription \
   includes [SubscriptionName], [SNSTopicARN], [CustomerID], [SourceType], [SourceID], \
   [CreationTime], and [Status]. \n\n\
  \ If you specify [SubscriptionName], this action lists the description for that subscription.\n\
  \ "]

module DescribeEvents : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_events_message ->
    (describe_events_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_events_message ->
    ( describe_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Lists events for a given source identifier and source type. You can also specify a start and \
   end time. For more information on DMS events, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html}Working with Events and \
   Notifications} in the {i Database Migration Service User Guide.} \n"]

module DescribeExtensionPackAssociations : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_extension_pack_associations_message ->
    (describe_extension_pack_associations_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_extension_pack_associations_message ->
    ( describe_extension_pack_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of extension pack associations for the specified migration project. An \
   extension pack is an add-on module that emulates functions present in a source database that \
   are required when converting objects to the target database.\n"]

module DescribeFleetAdvisorCollectors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_advisor_collectors_request ->
    ( describe_fleet_advisor_collectors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_advisor_collectors_request ->
    ( describe_fleet_advisor_collectors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Returns a list of the Fleet Advisor collectors in your account.\n\
  \   "]

module DescribeFleetAdvisorDatabases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_advisor_databases_request ->
    ( describe_fleet_advisor_databases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_advisor_databases_request ->
    ( describe_fleet_advisor_databases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Returns a list of Fleet Advisor databases in your account.\n\
  \   "]

module DescribeFleetAdvisorLsaAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_advisor_lsa_analysis_request ->
    ( describe_fleet_advisor_lsa_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_advisor_lsa_analysis_request ->
    ( describe_fleet_advisor_lsa_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Provides descriptions of large-scale assessment (LSA) analyses produced by your Fleet \
   Advisor collectors. \n\
  \   "]

module DescribeFleetAdvisorSchemaObjectSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_advisor_schema_object_summary_request ->
    ( describe_fleet_advisor_schema_object_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_advisor_schema_object_summary_request ->
    ( describe_fleet_advisor_schema_object_summary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Provides descriptions of the schemas discovered by your Fleet Advisor collectors.\n\
  \   "]

module DescribeFleetAdvisorSchemas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_advisor_schemas_request ->
    ( describe_fleet_advisor_schemas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleet_advisor_schemas_request ->
    ( describe_fleet_advisor_schemas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Returns a list of schemas detected by Fleet Advisor Collectors in your account.\n\
  \   "]

module DescribeInstanceProfiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_profiles_message ->
    ( describe_instance_profiles_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_profiles_message ->
    ( describe_instance_profiles_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of instance profiles for your account in the current region.\n"]

module DescribeMetadataModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_message ->
    ( describe_metadata_model_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_message ->
    ( describe_metadata_model_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets detailed information about the specified metadata model, including its definition and \
   corresponding converted objects in the target database if applicable.\n"]

module DescribeMetadataModelAssessments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_assessments_message ->
    ( describe_metadata_model_assessments_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_assessments_message ->
    ( describe_metadata_model_assessments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of metadata model assessments for your account in the current region.\n"]

module DescribeMetadataModelChildren : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_children_message ->
    ( describe_metadata_model_children_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_children_message ->
    ( describe_metadata_model_children_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of child metadata models for the specified metadata model in the database hierarchy.\n"]

module DescribeMetadataModelConversions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_conversions_message ->
    ( describe_metadata_model_conversions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_conversions_message ->
    ( describe_metadata_model_conversions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a paginated list of metadata model conversions for a migration project.\n"]

module DescribeMetadataModelCreations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_creations_message ->
    ( describe_metadata_model_creations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_creations_message ->
    ( describe_metadata_model_creations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of metadata model creation requests for a migration project.\n"]

module DescribeMetadataModelExportsAsScript : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_exports_as_script_message ->
    ( describe_metadata_model_exports_as_script_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_exports_as_script_message ->
    ( describe_metadata_model_exports_as_script_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a paginated list of metadata model exports.\n"]

module DescribeMetadataModelExportsToTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_exports_to_target_message ->
    ( describe_metadata_model_exports_to_target_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_exports_to_target_message ->
    ( describe_metadata_model_exports_to_target_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a paginated list of metadata model exports.\n"]

module DescribeMetadataModelImports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_imports_message ->
    ( describe_metadata_model_imports_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_metadata_model_imports_message ->
    ( describe_metadata_model_imports_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a paginated list of metadata model imports.\n"]

module DescribeMigrationProjects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_migration_projects_message ->
    ( describe_migration_projects_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_migration_projects_message ->
    ( describe_migration_projects_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of migration projects for your account in the current region.\n"]

module DescribeOrderableReplicationInstances : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_orderable_replication_instances_message ->
    ( describe_orderable_replication_instances_response,
      [> Smaws_Lib.Protocols.AwsJson.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_orderable_replication_instances_message ->
    ( describe_orderable_replication_instances_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the replication instance types that can be created in the specified \
   region.\n"]

module DescribePendingMaintenanceActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_pending_maintenance_actions_message ->
    ( describe_pending_maintenance_actions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_pending_maintenance_actions_message ->
    ( describe_pending_maintenance_actions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of upcoming maintenance events for replication instances in your account in the \
   current Region.\n"]

module DescribeRecommendationLimitations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_recommendation_limitations_request ->
    ( describe_recommendation_limitations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_recommendation_limitations_request ->
    ( describe_recommendation_limitations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Returns a paginated list of limitations for recommendations of target Amazon Web Services \
   engines.\n\
  \   "]

module DescribeRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_recommendations_request ->
    ( describe_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_recommendations_request ->
    ( describe_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Returns a paginated list of target engine recommendations for your source databases.\n\
  \   "]

module DescribeRefreshSchemasStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_refresh_schemas_status_message ->
    ( describe_refresh_schemas_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_refresh_schemas_status_message ->
    ( describe_refresh_schemas_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the status of the RefreshSchemas operation.\n"]

module DescribeReplicationConfigs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_configs_message ->
    ( describe_replication_configs_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_configs_message ->
    ( describe_replication_configs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns one or more existing DMS Serverless replication configurations as a list of structures.\n"]

module DescribeReplicationInstanceTaskLogs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_instance_task_logs_message ->
    ( describe_replication_instance_task_logs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_instance_task_logs_message ->
    ( describe_replication_instance_task_logs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the task logs for the specified task.\n"]

module DescribeReplicationInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_instances_message ->
    ( describe_replication_instances_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_instances_message ->
    ( describe_replication_instances_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about replication instances for your account in the current region.\n"]

module DescribeReplicationSubnetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_subnet_groups_message ->
    ( describe_replication_subnet_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_subnet_groups_message ->
    ( describe_replication_subnet_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the replication subnet groups.\n"]

module DescribeReplicationTableStatistics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_table_statistics_message ->
    ( describe_replication_table_statistics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_table_statistics_message ->
    ( describe_replication_table_statistics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns table and schema statistics for one or more provisioned replications that use a given \
   DMS Serverless replication configuration.\n"]

module DescribeReplicationTaskAssessmentResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_task_assessment_results_message ->
    ( describe_replication_task_assessment_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_task_assessment_results_message ->
    ( describe_replication_task_assessment_results_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the task assessment results from the Amazon S3 bucket that DMS creates in your Amazon \
   Web Services account. This action always returns the latest results.\n\n\
  \ For more information about DMS task assessments, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.AssessmentReport.html}Creating a \
   task assessment report} in the {i Database Migration Service User Guide}.\n\
  \ "]

module DescribeReplicationTaskAssessmentRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_task_assessment_runs_message ->
    ( describe_replication_task_assessment_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_task_assessment_runs_message ->
    ( describe_replication_task_assessment_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of premigration assessment runs based on filter settings.\n\n\
  \ These filter settings can specify a combination of premigration assessment runs, migration \
   tasks, replication instances, and assessment run status values.\n\
  \ \n\
  \   This operation doesn't return information about individual assessments. For this \
   information, see the [DescribeReplicationTaskIndividualAssessments] operation. \n\
  \   \n\
  \    "]

module DescribeReplicationTaskIndividualAssessments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_task_individual_assessments_message ->
    ( describe_replication_task_individual_assessments_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_task_individual_assessments_message ->
    ( describe_replication_task_individual_assessments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of individual assessments based on filter settings.\n\n\
  \ These filter settings can specify a combination of premigration assessment runs, migration \
   tasks, and assessment status values.\n\
  \ "]

module DescribeReplicationTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_tasks_message ->
    ( describe_replication_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_tasks_message ->
    ( describe_replication_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about replication tasks for your account in the current region.\n"]

module DescribeReplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replications_message ->
    ( describe_replications_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replications_message ->
    ( describe_replications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details on replication progress by returning status information for one or more \
   provisioned DMS Serverless replications.\n"]

module DescribeSchemas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_schemas_message ->
    ( describe_schemas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_schemas_message ->
    ( describe_schemas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the schema for the specified endpoint.\n\n \n "]

module DescribeTableStatistics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_table_statistics_message ->
    ( describe_table_statistics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_table_statistics_message ->
    ( describe_table_statistics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns table statistics on the database migration task, including table name, rows inserted, \
   rows updated, and rows deleted.\n\n\
  \ Note that the \"last updated\" column the DMS console only indicates the time that DMS last \
   updated the table statistics record for a table. It does not indicate the time of the last \
   update to the table.\n\
  \ "]

module ExportMetadataModelAssessment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_metadata_model_assessment_message ->
    ( export_metadata_model_assessment_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_metadata_model_assessment_message ->
    ( export_metadata_model_assessment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Saves a copy of a database migration assessment report to your Amazon S3 bucket. DMS can save \
   your assessment report as a comma-separated value (CSV) or a PDF file. \n"]

module GetTargetSelectionRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_target_selection_rules_message ->
    ( get_target_selection_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_target_selection_rules_message ->
    ( get_target_selection_rules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Converts source selection rules into their target counterparts for schema conversion operations.\n"]

module ImportCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidCertificateFault of invalid_certificate_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_certificate_message ->
    ( import_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidCertificateFault of invalid_certificate_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_certificate_message ->
    ( import_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidCertificateFault of invalid_certificate_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Uploads the specified certificate.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all metadata tags attached to an DMS resource, including replication instance, endpoint, \
   subnet group, and migration task. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_Tag.html} [Tag] } data type \
   description.\n"]

module ModifyConversionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_conversion_configuration_message ->
    ( modify_conversion_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_conversion_configuration_message ->
    ( modify_conversion_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the specified schema conversion configuration using the provided parameters. \n"]

module ModifyDataMigration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_data_migration_message ->
    ( modify_data_migration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_data_migration_message ->
    ( modify_data_migration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies an existing DMS data migration.\n"]

module ModifyDataProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_data_provider_message ->
    ( modify_data_provider_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_data_provider_message ->
    ( modify_data_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the specified data provider using the provided settings.\n\n\
  \  You must remove the data provider from all migration projects before you can modify it.\n\
  \  \n\
  \   "]

module ModifyEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_endpoint_message ->
    ( modify_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_endpoint_message ->
    ( modify_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the specified endpoint.\n\n\
  \  For a MySQL source or target endpoint, don't explicitly specify the database using the \
   [DatabaseName] request parameter on the [ModifyEndpoint] API call. Specifying [DatabaseName] \
   when you modify a MySQL endpoint replicates all the task tables to this single database. For \
   MySQL endpoints, you specify the database only when you specify the schema in the table-mapping \
   rules of the DMS task.\n\
  \  \n\
  \   "]

module ModifyEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `KMSAccessDeniedFault of kms_access_denied_fault
    | `KMSDisabledFault of kms_disabled_fault
    | `KMSInvalidStateFault of kms_invalid_state_fault
    | `KMSNotFoundFault of kms_not_found_fault
    | `KMSThrottlingFault of kms_throttling_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `SNSInvalidTopicFault of sns_invalid_topic_fault
    | `SNSNoAuthorizationFault of sns_no_authorization_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_event_subscription_message ->
    ( modify_event_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `KMSAccessDeniedFault of kms_access_denied_fault
      | `KMSDisabledFault of kms_disabled_fault
      | `KMSInvalidStateFault of kms_invalid_state_fault
      | `KMSNotFoundFault of kms_not_found_fault
      | `KMSThrottlingFault of kms_throttling_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_event_subscription_message ->
    ( modify_event_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `KMSAccessDeniedFault of kms_access_denied_fault
      | `KMSDisabledFault of kms_disabled_fault
      | `KMSInvalidStateFault of kms_invalid_state_fault
      | `KMSNotFoundFault of kms_not_found_fault
      | `KMSThrottlingFault of kms_throttling_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies an existing DMS event notification subscription. \n"]

module ModifyInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_instance_profile_message ->
    ( modify_instance_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_instance_profile_message ->
    ( modify_instance_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the specified instance profile using the provided parameters.\n\n\
  \  All migration projects associated with the instance profile must be deleted or modified \
   before you can modify the instance profile.\n\
  \  \n\
  \   "]

module ModifyMigrationProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_migration_project_message ->
    ( modify_migration_project_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_migration_project_message ->
    ( modify_migration_project_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the specified migration project using the provided parameters.\n\n\
  \  The migration project must be closed before you can modify it.\n\
  \  \n\
  \   "]

module ModifyReplicationConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `InvalidSubnet of invalid_subnet
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
      replication_subnet_group_does_not_cover_enough_a_zs
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_config_message ->
    ( modify_replication_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `InvalidSubnet of invalid_subnet
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
        replication_subnet_group_does_not_cover_enough_a_zs
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_config_message ->
    ( modify_replication_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `InvalidSubnet of invalid_subnet
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
        replication_subnet_group_does_not_cover_enough_a_zs
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing DMS Serverless replication configuration that you can use to start a \
   replication. This command includes input validation and logic to check the state of any \
   replication that uses this configuration. You can only modify a replication configuration \
   before any replication that uses it has started. As soon as you have initially started a \
   replication with a given configuiration, you can't modify that configuration, even if you stop \
   it.\n\n\
  \ Other run statuses that allow you to run this command include FAILED and CREATED. A \
   provisioning state that allows you to run this command is FAILED_PROVISION.\n\
  \ "]

module ModifyReplicationInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InsufficientResourceCapacityFault of insufficient_resource_capacity_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `UpgradeDependencyFailureFault of upgrade_dependency_failure_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_instance_message ->
    ( modify_replication_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InsufficientResourceCapacityFault of insufficient_resource_capacity_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `UpgradeDependencyFailureFault of upgrade_dependency_failure_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_instance_message ->
    ( modify_replication_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InsufficientResourceCapacityFault of insufficient_resource_capacity_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `UpgradeDependencyFailureFault of upgrade_dependency_failure_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the replication instance to apply new settings. You can change one or more parameters \
   by specifying these parameters and the new values in the request.\n\n\
  \ Some settings are applied during the maintenance window.\n\
  \ \n\
  \  \n\
  \  "]

module ModifyReplicationSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidSubnet of invalid_subnet
    | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
      replication_subnet_group_does_not_cover_enough_a_zs
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `SubnetAlreadyInUse of subnet_already_in_use ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_subnet_group_message ->
    ( modify_replication_subnet_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidSubnet of invalid_subnet
      | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
        replication_subnet_group_does_not_cover_enough_a_zs
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `SubnetAlreadyInUse of subnet_already_in_use ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_subnet_group_message ->
    ( modify_replication_subnet_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidSubnet of invalid_subnet
      | `ReplicationSubnetGroupDoesNotCoverEnoughAZs of
        replication_subnet_group_does_not_cover_enough_a_zs
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `SubnetAlreadyInUse of subnet_already_in_use ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the settings for the specified replication subnet group.\n"]

module ModifyReplicationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_task_message ->
    ( modify_replication_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_task_message ->
    ( modify_replication_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the specified replication task.\n\n\
  \ You can't modify the task endpoints. The task must be stopped before you can modify it. \n\
  \ \n\
  \  For more information about DMS tasks, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html}Working with Migration \
   Tasks} in the {i Database Migration Service User Guide}.\n\
  \  "]

module MoveReplicationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    move_replication_task_message ->
    ( move_replication_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    move_replication_task_message ->
    ( move_replication_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Moves a replication task from its current replication instance to a different target \
   replication instance using the specified parameters. The target replication instance must be \
   created with the same or later DMS version as the current replication instance.\n"]

module RebootReplicationInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_replication_instance_message ->
    ( reboot_replication_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_replication_instance_message ->
    ( reboot_replication_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reboots a replication instance. Rebooting results in a momentary outage, until the replication \
   instance becomes available again.\n"]

module RefreshSchemas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    refresh_schemas_message ->
    ( refresh_schemas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    refresh_schemas_message ->
    ( refresh_schemas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Populates the schema for the specified endpoint. This is an asynchronous operation and can take \
   several minutes. You can check the status of this operation by calling the \
   DescribeRefreshSchemasStatus operation.\n"]

module ReloadReplicationTables : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reload_replication_tables_message ->
    ( reload_replication_tables_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reload_replication_tables_message ->
    ( reload_replication_tables_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reloads the target database table with the source data for a given DMS Serverless replication \
   configuration.\n\n\
  \ You can only use this operation with a task in the RUNNING state, otherwise the service will \
   throw an [InvalidResourceStateFault] exception.\n\
  \ "]

module ReloadTables : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reload_tables_message ->
    ( reload_tables_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reload_tables_message ->
    ( reload_tables_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reloads the target database table with the source data. \n\n\
  \ You can only use this operation with a task in the [RUNNING] state, otherwise the service will \
   throw an [InvalidResourceStateFault] exception.\n\
  \ "]

module RemoveTagsFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_message ->
    ( remove_tags_from_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_message ->
    ( remove_tags_from_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes metadata tags from an DMS resource, including replication instance, endpoint, subnet \
   group, and migration task. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_Tag.html} [Tag] } data type \
   description.\n"]

module RunFleetAdvisorLsaAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( run_fleet_advisor_lsa_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( run_fleet_advisor_lsa_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Runs large-scale assessment (LSA) analysis on every Fleet Advisor collector in your account.\n\
  \   "]

module StartDataMigration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidOperationFault of invalid_operation_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_data_migration_message ->
    ( start_data_migration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidOperationFault of invalid_operation_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_data_migration_message ->
    ( start_data_migration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidOperationFault of invalid_operation_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts the specified data migration.\n"]

module StartExtensionPackAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_extension_pack_association_message ->
    ( start_extension_pack_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_extension_pack_association_message ->
    ( start_extension_pack_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Applies the extension pack to your target database. An extension pack is an add-on module that \
   emulates functions present in a source database that are required when converting objects to \
   the target database. \n"]

module StartMetadataModelAssessment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_assessment_message ->
    ( start_metadata_model_assessment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_assessment_message ->
    ( start_metadata_model_assessment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a database migration assessment report by assessing the migration complexity for your \
   source database. A database migration assessment report summarizes all of the schema conversion \
   tasks. It also details the action items for database objects that can't be converted to the \
   database engine of your target database instance. \n"]

module StartMetadataModelConversion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_conversion_message ->
    ( start_metadata_model_conversion_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_conversion_message ->
    ( start_metadata_model_conversion_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Converts your source database objects to a format compatible with the target database. \n"]

module StartMetadataModelCreation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_creation_message ->
    ( start_metadata_model_creation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_creation_message ->
    ( start_metadata_model_creation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates source metadata model of the given type with the specified properties for schema \
   conversion operations.\n\n\
  \  This action supports only these directions: from SQL Server to Aurora PostgreSQL, or from SQL \
   Server to RDS for PostgreSQL.\n\
  \  \n\
  \   "]

module StartMetadataModelExportAsScript : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_export_as_script_message ->
    ( start_metadata_model_export_as_script_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_export_as_script_message ->
    ( start_metadata_model_export_as_script_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Saves your converted code to a file as a SQL script, and stores this file on your Amazon S3 \
   bucket.\n"]

module StartMetadataModelExportToTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_export_to_target_message ->
    ( start_metadata_model_export_to_target_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_export_to_target_message ->
    ( start_metadata_model_export_to_target_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Applies converted database objects to your target database. \n"]

module StartMetadataModelImport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_import_message ->
    ( start_metadata_model_import_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_metadata_model_import_message ->
    ( start_metadata_model_import_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Loads the metadata for all the dependent database objects of the parent object.\n\n\
  \ This operation uses your project's Amazon S3 bucket as a metadata cache to improve performance.\n\
  \ "]

module StartRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_recommendations_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_recommendations_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web \
   Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the \
   Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; \
   resources. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
   Web Services DMS Fleet Advisor end of support}. \n\
  \ \n\
  \   Starts the analysis of your source database to provide recommendations of target engines.\n\
  \   \n\
  \    You can create recommendations for multiple source databases using \
   {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_BatchStartRecommendations.html}BatchStartRecommendations}.\n\
  \    "]

module StartReplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_replication_message ->
    ( start_replication_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_replication_message ->
    ( start_replication_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For a given DMS Serverless replication configuration, DMS connects to the source endpoint and \
   collects the metadata to analyze the replication workload. Using this metadata, DMS then \
   computes and provisions the required capacity and starts replicating to the target endpoint \
   using the server resources that DMS has provisioned for the DMS Serverless replication.\n"]

module StartReplicationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_replication_task_message ->
    ( start_replication_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_replication_task_message ->
    ( start_replication_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the replication task.\n\n\
  \ For more information about DMS tasks, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html}Working with Migration \
   Tasks } in the {i Database Migration Service User Guide.} \n\
  \ "]

module StartReplicationTaskAssessment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_replication_task_assessment_message ->
    ( start_replication_task_assessment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_replication_task_assessment_message ->
    ( start_replication_task_assessment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Starts the replication task assessment for unsupported data types in the source database. \n\n\
  \ You can only use this operation for a task if the following conditions are true:\n\
  \ \n\
  \  {ul\n\
  \        {-  The task must be in the [stopped] state.\n\
  \            \n\
  \             }\n\
  \        {-  The task must have successful connections to the source and target.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   If either of these conditions are not met, an [InvalidResourceStateFault] error will result. \n\
  \   \n\
  \    For information about DMS task assessments, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.AssessmentReport.html}Creating a \
   task assessment report} in the {i Database Migration Service User Guide}.\n\
  \    "]

module StartReplicationTaskAssessmentRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSAccessDeniedFault of kms_access_denied_fault
    | `KMSDisabledFault of kms_disabled_fault
    | `KMSFault of kms_fault
    | `KMSInvalidStateFault of kms_invalid_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `KMSNotFoundFault of kms_not_found_fault
    | `ResourceAlreadyExistsFault of resource_already_exists_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `S3AccessDeniedFault of s3_access_denied_fault
    | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_replication_task_assessment_run_message ->
    ( start_replication_task_assessment_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSAccessDeniedFault of kms_access_denied_fault
      | `KMSDisabledFault of kms_disabled_fault
      | `KMSFault of kms_fault
      | `KMSInvalidStateFault of kms_invalid_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `KMSNotFoundFault of kms_not_found_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_replication_task_assessment_run_message ->
    ( start_replication_task_assessment_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSAccessDeniedFault of kms_access_denied_fault
      | `KMSDisabledFault of kms_disabled_fault
      | `KMSFault of kms_fault
      | `KMSInvalidStateFault of kms_invalid_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `KMSNotFoundFault of kms_not_found_fault
      | `ResourceAlreadyExistsFault of resource_already_exists_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `S3AccessDeniedFault of s3_access_denied_fault
      | `S3ResourceNotFoundFault of s3_resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a new premigration assessment run for one or more individual assessments of a migration \
   task.\n\n\
  \ The assessments that you can specify depend on the source and target database engine and the \
   migration type defined for the given task. To run this operation, your migration task must \
   already be created. After you run this operation, you can review the status of each individual \
   assessment. You can also run the migration task manually after the assessment run and its \
   individual assessments complete.\n\
  \ "]

module StopDataMigration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `FailedDependencyFault of failed_dependency_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_data_migration_message ->
    ( stop_data_migration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_data_migration_message ->
    ( stop_data_migration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `FailedDependencyFault of failed_dependency_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the specified data migration.\n"]

module StopReplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_replication_message ->
    ( stop_replication_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_replication_message ->
    ( stop_replication_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For a given DMS Serverless replication configuration, DMS stops any and all ongoing DMS \
   Serverless replications. This command doesn't deprovision the stopped replications.\n"]

module StopReplicationTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_replication_task_message ->
    ( stop_replication_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_replication_task_message ->
    ( stop_replication_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the replication task.\n"]

module TestConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_connection_message ->
    ( test_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_connection_message ->
    ( test_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `ResourceQuotaExceededFault of resource_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Tests the connection between the replication instance and the endpoint.\n"]

module UpdateSubscriptionsToEventBridge : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedFault of access_denied_fault
    | `InvalidResourceStateFault of invalid_resource_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_subscriptions_to_event_bridge_message ->
    ( update_subscriptions_to_event_bridge_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_subscriptions_to_event_bridge_message ->
    ( update_subscriptions_to_event_bridge_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedFault of access_denied_fault
      | `InvalidResourceStateFault of invalid_resource_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Migrates 10 active and enabled Amazon SNS subscriptions at a time and converts them to \
   corresponding Amazon EventBridge rules. By default, this operation migrates subscriptions only \
   when all your replication instance versions are 3.4.5 or higher. If any replication instances \
   are from versions earlier than 3.4.5, the operation raises an error and tells you to upgrade \
   these instances to version 3.4.5 or higher. To enable migration regardless of version, set the \
   [Force] option to true. However, if you don't upgrade instances earlier than version 3.4.5, \
   some types of events might not be available when you use Amazon EventBridge.\n\n\
  \ To call this operation, make sure that you have certain permissions added to your user \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html#CHAP_Events-migrate-to-eventbridge}Migrating \
   event subscriptions to Amazon EventBridge} in the {i Amazon Web Services Database Migration \
   Service User Guide}.\n\
  \ "]
