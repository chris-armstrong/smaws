open Types

module AssociateGlossaryTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_glossary_terms_request ->
    ( associate_glossary_terms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_glossary_terms_request ->
    ( associate_glossary_terms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates one or more glossary terms with an asset in Glue Data Catalog.\n"]

module BatchCreatePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_create_partition_request ->
    ( batch_create_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_create_partition_request ->
    ( batch_create_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates one or more partitions in a batch operation.\n"]

module BatchDeleteConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_connection_request ->
    ( batch_delete_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_connection_request ->
    ( batch_delete_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a list of connection definitions from the Data Catalog.\n"]

module BatchDeletePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_partition_request ->
    ( batch_delete_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_partition_request ->
    ( batch_delete_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes one or more partitions in a batch operation.\n"]

module BatchDeleteTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_table_request ->
    ( batch_delete_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_table_request ->
    ( batch_delete_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes multiple tables at once.\n\n\
  \  After completing this operation, you no longer have access to the table versions and \
   partitions that belong to the deleted table. Glue deletes these \"orphaned\" resources \
   asynchronously in a timely manner, at the discretion of the service.\n\
  \  \n\
  \   To ensure the immediate deletion of all related resources, before calling \
   [BatchDeleteTable], use [DeleteTableVersion] or [BatchDeleteTableVersion], and \
   [DeletePartition] or [BatchDeletePartition], to delete any resources that belong to the table.\n\
  \   \n\
  \    "]

module BatchDeleteTableVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_table_version_request ->
    ( batch_delete_table_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_table_version_request ->
    ( batch_delete_table_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified batch of versions of a table.\n"]

module BatchGetBlueprints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_blueprints_request ->
    ( batch_get_blueprints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_blueprints_request ->
    ( batch_get_blueprints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about a list of blueprints.\n"]

module BatchGetCrawlers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_crawlers_request ->
    ( batch_get_crawlers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_crawlers_request ->
    ( batch_get_crawlers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource metadata for a given list of crawler names. After calling the \
   [ListCrawlers] operation, you can call this operation to access the data to which you have been \
   granted permissions. This operation supports all IAM permissions, including permission \
   conditions that uses tags.\n"]

module BatchGetCustomEntityTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_custom_entity_types_request ->
    ( batch_get_custom_entity_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_custom_entity_types_request ->
    ( batch_get_custom_entity_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details for the custom patterns specified by a list of names.\n"]

module BatchGetDataQualityResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_data_quality_result_request ->
    ( batch_get_data_quality_result_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_data_quality_result_request ->
    ( batch_get_data_quality_result_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of data quality results for the specified result IDs.\n"]

module BatchGetDevEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_dev_endpoints_request ->
    ( batch_get_dev_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_dev_endpoints_request ->
    ( batch_get_dev_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource metadata for a given list of development endpoint names. After \
   calling the [ListDevEndpoints] operation, you can call this operation to access the data to \
   which you have been granted permissions. This operation supports all IAM permissions, including \
   permission conditions that uses tags.\n"]

module BatchGetIterableForms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_iterable_forms_request ->
    ( batch_get_iterable_forms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_iterable_forms_request ->
    ( batch_get_iterable_forms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves multiple items from an iterable form on an asset in Glue Data Catalog in a single \
   request.\n"]

module BatchGetJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_jobs_request ->
    ( batch_get_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_jobs_request ->
    ( batch_get_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource metadata for a given list of job names. After calling the [ListJobs] \
   operation, you can call this operation to access the data to which you have been granted \
   permissions. This operation supports all IAM permissions, including permission conditions that \
   uses tags. \n"]

module BatchGetPartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidStateException of invalid_state_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_partition_request ->
    ( batch_get_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_partition_request ->
    ( batch_get_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves partitions in a batch request.\n"]

module BatchGetTableOptimizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_table_optimizer_request ->
    ( batch_get_table_optimizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_table_optimizer_request ->
    ( batch_get_table_optimizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the configuration for the specified table optimizers.\n"]

module BatchGetTriggers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_triggers_request ->
    ( batch_get_triggers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_triggers_request ->
    ( batch_get_triggers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource metadata for a given list of trigger names. After calling the \
   [ListTriggers] operation, you can call this operation to access the data to which you have been \
   granted permissions. This operation supports all IAM permissions, including permission \
   conditions that uses tags.\n"]

module BatchGetWorkflows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_workflows_request ->
    ( batch_get_workflows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_workflows_request ->
    ( batch_get_workflows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource metadata for a given list of workflow names. After calling the \
   [ListWorkflows] operation, you can call this operation to access the data to which you have \
   been granted permissions. This operation supports all IAM permissions, including permission \
   conditions that uses tags.\n"]

module BatchPutDataQualityStatisticAnnotation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_put_data_quality_statistic_annotation_request ->
    ( batch_put_data_quality_statistic_annotation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_put_data_quality_statistic_annotation_request ->
    ( batch_put_data_quality_statistic_annotation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Annotate datapoints over time for a specific data quality statistic. The API requires both \
   profileID and statisticID as part of the InclusionAnnotation input. The API only works for a \
   single statisticId across multiple profiles.\n"]

module BatchStopJobRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_stop_job_run_request ->
    ( batch_stop_job_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_stop_job_run_request ->
    ( batch_stop_job_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops one or more job runs for a specified job definition.\n"]

module BatchUpdatePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_update_partition_request ->
    ( batch_update_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_update_partition_request ->
    ( batch_update_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates one or more partitions in a batch operation.\n"]

module CancelDataQualityRuleRecommendationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_quality_rule_recommendation_run_request ->
    ( cancel_data_quality_rule_recommendation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_quality_rule_recommendation_run_request ->
    ( cancel_data_quality_rule_recommendation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Cancels the specified recommendation run that was being used to generate rules.\n"]

module CancelDataQualityRulesetEvaluationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_quality_ruleset_evaluation_run_request ->
    ( cancel_data_quality_ruleset_evaluation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_quality_ruleset_evaluation_run_request ->
    ( cancel_data_quality_ruleset_evaluation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Cancels a run where a ruleset is being evaluated against a data source.\n"]

module CancelMLTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_ml_task_run_request ->
    ( cancel_ml_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_ml_task_run_request ->
    ( cancel_ml_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels (stops) a task run. Machine learning task runs are asynchronous tasks that Glue runs on \
   your behalf as part of various machine learning workflows. You can cancel a machine learning \
   task run at any time by calling [CancelMLTaskRun] with a task run's parent transform's \
   [TransformID] and the task run's [TaskRunId]. \n"]

module CancelStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_statement_request ->
    ( cancel_statement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_statement_request ->
    ( cancel_statement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Cancels the statement.\n"]

module CheckSchemaVersionValidity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    check_schema_version_validity_input ->
    ( check_schema_version_validity_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    check_schema_version_validity_input ->
    ( check_schema_version_validity_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Validates the supplied schema. This call has no side effects, it simply validates using the \
   supplied schema using [DataFormat] as the format. Since it does not take a schema set name, no \
   compatibility checks are performed.\n"]

module CreateBlueprint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_blueprint_request ->
    ( create_blueprint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_blueprint_request ->
    ( create_blueprint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Registers a blueprint with Glue.\n"]

module CreateCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_catalog_request ->
    ( create_catalog_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_catalog_request ->
    ( create_catalog_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new catalog in the Glue Data Catalog.\n"]

module CreateClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_classifier_request ->
    ( create_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_classifier_request ->
    ( create_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a classifier in the user's account. This can be a [GrokClassifier], an [XMLClassifier], \
   a [JsonClassifier], or a [CsvClassifier], depending on which field of the request is present.\n"]

module CreateColumnStatisticsTaskSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_column_statistics_task_settings_request ->
    ( create_column_statistics_task_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_column_statistics_task_settings_request ->
    ( create_column_statistics_task_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates settings for a column statistics task.\n"]

module CreateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( create_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( create_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a connection definition in the Data Catalog.\n\n\
  \ Connections used for creating federated resources require the IAM [glue:PassConnection] \
   permission.\n\
  \ "]

module CreateCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_crawler_request ->
    ( create_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_crawler_request ->
    ( create_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new crawler with specified targets, role, configuration, and optional schedule. At \
   least one crawl target must be specified, in the [s3Targets] field, the [jdbcTargets] field, or \
   the [DynamoDBTargets] field.\n"]

module CreateCustomEntityType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_entity_type_request ->
    ( create_custom_entity_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_entity_type_request ->
    ( create_custom_entity_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a custom pattern that is used to detect sensitive data across the columns and rows of \
   your structured data.\n\n\
  \ Each custom pattern you create specifies a regular expression and an optional list of context \
   words. If no context words are passed only a regular expression is checked.\n\
  \ "]

module CreateDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_database_request ->
    ( create_database_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_database_request ->
    ( create_database_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new database in a Data Catalog.\n"]

module CreateDataQualityRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_quality_ruleset_request ->
    ( create_data_quality_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_quality_ruleset_request ->
    ( create_data_quality_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a data quality ruleset with DQDL rules applied to a specified Glue table.\n\n\
  \ You create the ruleset using the Data Quality Definition Language (DQDL). For more \
   information, see the Glue developer guide.\n\
  \ "]

module CreateDevEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dev_endpoint_request ->
    ( create_dev_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dev_endpoint_request ->
    ( create_dev_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new development endpoint.\n"]

module CreateGlossary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_glossary_request ->
    ( create_glossary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_glossary_request ->
    ( create_glossary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a business glossary in Glue Data Catalog. A glossary is a container for glossary terms \
   that define business concepts.\n"]

module CreateGlossaryTerm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_glossary_term_request ->
    ( create_glossary_term_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_glossary_term_request ->
    ( create_glossary_term_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a glossary term within a business glossary in Glue Data Catalog.\n"]

module CreateGlueIdentityCenterConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_glue_identity_center_configuration_request ->
    ( create_glue_identity_center_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_glue_identity_center_configuration_request ->
    ( create_glue_identity_center_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Glue Identity Center configuration to enable integration between Glue and Amazon \
   Web Services IAM Identity Center for authentication and authorization.\n"]

module CreateIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_integration_request ->
    ( create_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_integration_request ->
    ( create_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Zero-ETL integration in the caller's account between two resources with Amazon \
   Resource Names (ARNs): the [SourceArn] and [TargetArn].\n"]

module CreateIntegrationResourceProperty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_integration_resource_property_request ->
    ( create_integration_resource_property_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_integration_resource_property_request ->
    ( create_integration_resource_property_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API can be used for setting up the [ResourceProperty] of the Glue connection (for the \
   source) or Glue database ARN (for the target). These properties can include the role to access \
   the connection or database. To set both source and target properties the same API needs to be \
   invoked with the Glue connection ARN as [ResourceArn] with [SourceProcessingProperties] and the \
   Glue database ARN as [ResourceArn] with [TargetProcessingProperties] respectively.\n"]

module CreateIntegrationTableProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_integration_table_properties_request ->
    ( create_integration_table_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_integration_table_properties_request ->
    ( create_integration_table_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used to provide optional override properties for the the tables that need to be \
   replicated. These properties can include properties for filtering and partitioning for the \
   source and target tables. To set both source and target properties the same API need to be \
   invoked with the Glue connection ARN as [ResourceArn] with [SourceTableConfig], and the Glue \
   database ARN as [ResourceArn] with [TargetTableConfig] respectively.\n"]

module CreateJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_job_request ->
    ( create_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_job_request ->
    ( create_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new job definition.\n"]

module CreateMLTransform : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_ml_transform_request ->
    ( create_ml_transform_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_ml_transform_request ->
    ( create_ml_transform_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Glue machine learning transform. This operation creates the transform and all the \
   necessary parameters to train it.\n\n\
  \ Call this operation as the first step in the process of using a machine learning transform \
   (such as the [FindMatches] transform) for deduplicating data. You can provide an optional \
   [Description], in addition to the parameters that you want to use for your algorithm.\n\
  \ \n\
  \  You must also specify certain parameters for the tasks that Glue runs on your behalf as part \
   of learning from your data and creating a high-quality machine learning transform. These \
   parameters include [Role], and optionally, [AllocatedCapacity], [Timeout], and [MaxRetries]. \
   For more information, see \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html}Jobs}.\n\
  \  "]

module CreatePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_partition_request ->
    ( create_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_partition_request ->
    ( create_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new partition.\n"]

module CreatePartitionIndex : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_partition_index_request ->
    ( create_partition_index_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_partition_index_request ->
    ( create_partition_index_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a specified partition index in an existing table.\n"]

module CreateRegistry : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_registry_input ->
    ( create_registry_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_registry_input ->
    ( create_registry_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new registry which may be used to hold a collection of schemas.\n"]

module CreateSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_schema_input ->
    ( create_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_schema_input ->
    ( create_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new schema set and registers the schema definition. Returns an error if the schema \
   set already exists without actually registering the version.\n\n\
  \ When the schema set is created, a version checkpoint will be set to the first version. \
   Compatibility mode \"DISABLED\" restricts any additional schema versions from being added after \
   the first schema version. For all other compatibility modes, validation of compatibility \
   settings will be applied only from the second version onwards when the [RegisterSchemaVersion] \
   API is used.\n\
  \ \n\
  \  When this API is called without a [RegistryId], this will create an entry for a \
   \"default-registry\" in the registry database tables, if it is not already present.\n\
  \  "]

module CreateScript : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_script_request ->
    ( create_script_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_script_request ->
    ( create_script_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Transforms a directed acyclic graph (DAG) into code.\n"]

module CreateSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_security_configuration_request ->
    ( create_security_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_security_configuration_request ->
    ( create_security_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new security configuration. A security configuration is a set of security properties \
   that can be used by Glue. You can use a security configuration to encrypt data at rest. For \
   information about using security configurations in Glue, see \
   {{:https://docs.aws.amazon.com/glue/latest/dg/encryption-security-configuration.html}Encrypting \
   Data Written by Crawlers, Jobs, and Development Endpoints}.\n"]

module CreateSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_session_request ->
    ( create_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_session_request ->
    ( create_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new session.\n"]

module CreateTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_table_request ->
    ( create_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_table_request ->
    ( create_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new table definition in the Data Catalog.\n"]

module CreateTableOptimizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_table_optimizer_request ->
    ( create_table_optimizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_table_optimizer_request ->
    ( create_table_optimizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new table optimizer for a specific function. \n"]

module CreateTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_trigger_request ->
    ( create_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_trigger_request ->
    ( create_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new trigger.\n\n\
  \ Job arguments may be logged. Do not pass plaintext secrets as arguments. Retrieve secrets from \
   a Glue Connection, Amazon Web Services Secrets Manager or other secret management mechanism if \
   you intend to keep them within the Job.\n\
  \ "]

module CreateUsageProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_usage_profile_request ->
    ( create_usage_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_usage_profile_request ->
    ( create_usage_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an Glue usage profile.\n"]

module CreateUserDefinedFunction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_defined_function_request ->
    ( create_user_defined_function_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_defined_function_request ->
    ( create_user_defined_function_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new function definition in the Data Catalog.\n"]

module CreateWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workflow_request ->
    ( create_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workflow_request ->
    ( create_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new workflow.\n"]

module DeleteAsset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_asset_request ->
    ( delete_asset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_asset_request ->
    ( delete_asset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an asset from Glue Data Catalog.\n"]

module DeleteAssetType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_asset_type_request ->
    ( delete_asset_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_asset_type_request ->
    ( delete_asset_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an asset type from Glue Data Catalog.\n"]

module DeleteAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_attachment_request ->
    ( delete_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_attachment_request ->
    ( delete_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a form attachment from an asset in Glue Data Catalog.\n"]

module DeleteBlueprint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_blueprint_request ->
    ( delete_blueprint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_blueprint_request ->
    ( delete_blueprint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an existing blueprint.\n"]

module DeleteCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_catalog_request ->
    ( delete_catalog_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_catalog_request ->
    ( delete_catalog_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified catalog from the Glue Data Catalog.\n\n\
  \ After completing this operation, you no longer have access to the databases, tables (and all \
   table versions and partitions that might belong to the tables) and the user-defined functions \
   in the deleted catalog. Glue deletes these \"orphaned\" resources asynchronously in a timely \
   manner, at the discretion of the service.\n\
  \ \n\
  \  To ensure the immediate deletion of all related resources before calling the [DeleteCatalog] \
   operation, use [DeleteTableVersion] (or [BatchDeleteTableVersion]), [DeletePartition] (or \
   [BatchDeletePartition]), [DeleteTable] (or [BatchDeleteTable]), [DeleteUserDefinedFunction] and \
   [DeleteDatabase] to delete any resources that belong to the catalog.\n\
  \  "]

module DeleteClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_classifier_request ->
    ( delete_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_classifier_request ->
    ( delete_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a classifier from the Data Catalog.\n"]

module DeleteColumnStatisticsForPartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_for_partition_request ->
    ( delete_column_statistics_for_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_for_partition_request ->
    ( delete_column_statistics_for_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete the partition column statistics of a column.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is \
   [DeletePartition].\n\
  \ "]

module DeleteColumnStatisticsForTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_for_table_request ->
    ( delete_column_statistics_for_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_for_table_request ->
    ( delete_column_statistics_for_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves table statistics of columns.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is \
   [DeleteTable].\n\
  \ "]

module DeleteColumnStatisticsTaskSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_task_settings_request ->
    ( delete_column_statistics_task_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_task_settings_request ->
    ( delete_column_statistics_task_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes settings for a column statistics task.\n"]

module DeleteConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( delete_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( delete_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a connection from the Data Catalog.\n"]

module DeleteConnectionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_type_request ->
    ( delete_connection_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_type_request ->
    ( delete_connection_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a custom connection type in Glue.\n\n\
  \ The connection type must exist and be registered before it can be deleted. This operation \
   supports cleanup of connection type resources and helps maintain proper lifecycle management of \
   custom connection types.\n\
  \ "]

module DeleteCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CrawlerRunningException of crawler_running_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `SchedulerTransitioningException of scheduler_transitioning_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_crawler_request ->
    ( delete_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_crawler_request ->
    ( delete_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a specified crawler from the Glue Data Catalog, unless the crawler state is [RUNNING].\n"]

module DeleteCustomEntityType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_entity_type_request ->
    ( delete_custom_entity_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_entity_type_request ->
    ( delete_custom_entity_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a custom pattern by specifying its name.\n"]

module DeleteDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_database_request ->
    ( delete_database_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_database_request ->
    ( delete_database_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a specified database from a Data Catalog.\n\n\
  \  After completing this operation, you no longer have access to the tables (and all table \
   versions and partitions that might belong to the tables) and the user-defined functions in the \
   deleted database. Glue deletes these \"orphaned\" resources asynchronously in a timely manner, \
   at the discretion of the service.\n\
  \  \n\
  \   To ensure the immediate deletion of all related resources, before calling [DeleteDatabase], \
   use [DeleteTableVersion] or [BatchDeleteTableVersion], [DeletePartition] or \
   [BatchDeletePartition], [DeleteUserDefinedFunction], and [DeleteTable] or [BatchDeleteTable], \
   to delete any resources that belong to the database.\n\
  \   \n\
  \    "]

module DeleteDataQualityRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_data_quality_ruleset_request ->
    ( delete_data_quality_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_data_quality_ruleset_request ->
    ( delete_data_quality_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a data quality ruleset.\n"]

module DeleteDevEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_dev_endpoint_request ->
    ( delete_dev_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_dev_endpoint_request ->
    ( delete_dev_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified development endpoint.\n"]

module DeleteFormType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_form_type_request ->
    ( delete_form_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_form_type_request ->
    ( delete_form_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a form type from Glue Data Catalog. A form type cannot be deleted if it is still \
   referenced by an asset type.\n"]

module DeleteGlossary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_glossary_request ->
    ( delete_glossary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_glossary_request ->
    ( delete_glossary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a business glossary from Glue Data Catalog. A glossary cannot be deleted if it still \
   contains glossary terms.\n"]

module DeleteGlossaryTerm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_glossary_term_request ->
    ( delete_glossary_term_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_glossary_term_request ->
    ( delete_glossary_term_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a glossary term from Glue Data Catalog.\n"]

module DeleteGlueIdentityCenterConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_glue_identity_center_configuration_request ->
    ( delete_glue_identity_center_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_glue_identity_center_configuration_request ->
    ( delete_glue_identity_center_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the existing Glue Identity Center configuration, removing the integration between Glue \
   and Amazon Web Services IAM Identity Center.\n"]

module DeleteIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidIntegrationStateFault of invalid_integration_state_fault
    | `InvalidStateException of invalid_state_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_request ->
    ( delete_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidIntegrationStateFault of invalid_integration_state_fault
      | `InvalidStateException of invalid_state_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_request ->
    ( delete_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidIntegrationStateFault of invalid_integration_state_fault
      | `InvalidStateException of invalid_state_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified Zero-ETL integration.\n"]

module DeleteIntegrationResourceProperty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_resource_property_request ->
    ( delete_integration_resource_property_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_resource_property_request ->
    ( delete_integration_resource_property_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used for deleting the [ResourceProperty] of the Glue connection (for the source) or \
   Glue database ARN (for the target).\n"]

module DeleteIntegrationTableProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_table_properties_request ->
    ( delete_integration_table_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_table_properties_request ->
    ( delete_integration_table_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the table properties that have been created for the tables that need to be replicated.\n"]

module DeleteJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_job_request ->
    ( delete_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_job_request ->
    ( delete_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified job definition. If the job definition is not found, no exception is thrown.\n"]

module DeleteMLTransform : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ml_transform_request ->
    ( delete_ml_transform_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ml_transform_request ->
    ( delete_ml_transform_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Glue machine learning transform. Machine learning transforms are a special type of \
   transform that use machine learning to learn the details of the transformation to be performed \
   by learning from examples provided by humans. These transformations are then saved by Glue. If \
   you no longer need a transform, you can delete it by calling [DeleteMLTransforms]. However, any \
   Glue jobs that still reference the deleted transform will no longer succeed.\n"]

module DeletePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_partition_request ->
    ( delete_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_partition_request ->
    ( delete_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified partition.\n"]

module DeletePartitionIndex : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_partition_index_request ->
    ( delete_partition_index_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_partition_index_request ->
    ( delete_partition_index_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified partition index from an existing table.\n"]

module DeleteRegistry : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_registry_input ->
    ( delete_registry_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_registry_input ->
    ( delete_registry_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete the entire registry including schema and all of its versions. To get the status of the \
   delete operation, you can call the [GetRegistry] API after the asynchronous call. Deleting a \
   registry will deactivate all online operations for the registry such as the [UpdateRegistry], \
   [CreateSchema], [UpdateSchema], and [RegisterSchemaVersion] APIs. \n"]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConditionCheckFailureException of condition_check_failure_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConditionCheckFailureException of condition_check_failure_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConditionCheckFailureException of condition_check_failure_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified policy.\n"]

module DeleteSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_input ->
    ( delete_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_input ->
    ( delete_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the entire schema set, including the schema set and all of its versions. To get the \
   status of the delete operation, you can call [GetSchema] API after the asynchronous call. \
   Deleting a registry will deactivate all online operations for the schema, such as the \
   [GetSchemaByDefinition], and [RegisterSchemaVersion] APIs.\n"]

module DeleteSchemaVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_versions_input ->
    ( delete_schema_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_versions_input ->
    ( delete_schema_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Remove versions from the specified schema. A version number or range may be supplied. If the \
   compatibility mode forbids deleting of a version that is necessary, such as BACKWARDS_FULL, an \
   error is returned. Calling the [GetSchemaVersions] API after this call will list the status of \
   the deleted versions.\n\n\
  \ When the range of version numbers contain check pointed version, the API will return a 409 \
   conflict and will not proceed with the deletion. You have to remove the checkpoint first using \
   the [DeleteSchemaCheckpoint] API before using this API.\n\
  \ \n\
  \  You cannot use the [DeleteSchemaVersions] API to delete the first schema version in the \
   schema set. The first schema version can only be deleted by the [DeleteSchema] API. This \
   operation will also delete the attached [SchemaVersionMetadata] under the schema versions. Hard \
   deletes will be enforced on the database.\n\
  \  \n\
  \   If the compatibility mode forbids deleting of a version that is necessary, such as \
   BACKWARDS_FULL, an error is returned.\n\
  \   "]

module DeleteSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_security_configuration_request ->
    ( delete_security_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_security_configuration_request ->
    ( delete_security_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified security configuration.\n"]

module DeleteSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_session_request ->
    ( delete_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_session_request ->
    ( delete_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the session.\n"]

module DeleteTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_table_request ->
    ( delete_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_table_request ->
    ( delete_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a table definition from the Data Catalog.\n\n\
  \  After completing this operation, you no longer have access to the table versions and \
   partitions that belong to the deleted table. Glue deletes these \"orphaned\" resources \
   asynchronously in a timely manner, at the discretion of the service.\n\
  \  \n\
  \   To ensure the immediate deletion of all related resources, before calling [DeleteTable], use \
   [DeleteTableVersion] or [BatchDeleteTableVersion], and [DeletePartition] or \
   [BatchDeletePartition], to delete any resources that belong to the table.\n\
  \   \n\
  \    "]

module DeleteTableOptimizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_table_optimizer_request ->
    ( delete_table_optimizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_table_optimizer_request ->
    ( delete_table_optimizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an optimizer and all associated metadata for a table. The optimization will no longer \
   be performed on the table.\n"]

module DeleteTableVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_table_version_request ->
    ( delete_table_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_table_version_request ->
    ( delete_table_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified version of a table.\n"]

module DeleteTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_trigger_request ->
    ( delete_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_trigger_request ->
    ( delete_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified trigger. If the trigger is not found, no exception is thrown.\n"]

module DeleteUsageProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_profile_request ->
    ( delete_usage_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_profile_request ->
    ( delete_usage_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the Glue specified usage profile.\n"]

module DeleteUserDefinedFunction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_defined_function_request ->
    ( delete_user_defined_function_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_defined_function_request ->
    ( delete_user_defined_function_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an existing function definition from the Data Catalog.\n"]

module DeleteWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_workflow_request ->
    ( delete_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_workflow_request ->
    ( delete_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a workflow.\n"]

module DescribeConnectionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_type_request ->
    ( describe_connection_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_type_request ->
    ( describe_connection_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The [DescribeConnectionType] API provides full details of the supported options for a given \
   connection type in Glue. The response includes authentication configuration details that show \
   supported authentication types and properties, and RestConfiguration for custom REST-based \
   connection types registered via [RegisterConnectionType].\n\n\
  \ See also: [ListConnectionTypes], [RegisterConnectionType], [DeleteConnectionType] \n\
  \ "]

module DescribeEntity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_entity_request ->
    ( describe_entity_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_entity_request ->
    ( describe_entity_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details regarding the entity used with the connection type, with a description of the \
   data model for each field in the selected entity.\n\n\
  \  The response includes all the fields which make up the entity.\n\
  \ "]

module DescribeInboundIntegrations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `TargetResourceNotFound of target_resource_not_found
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_inbound_integrations_request ->
    ( describe_inbound_integrations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `TargetResourceNotFound of target_resource_not_found
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_inbound_integrations_request ->
    ( describe_inbound_integrations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `TargetResourceNotFound of target_resource_not_found
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of inbound integrations for the specified integration.\n"]

module DescribeIntegrations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_integrations_request ->
    ( describe_integrations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_integrations_request ->
    ( describe_integrations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The API is used to retrieve a list of integrations.\n"]

module DisassociateGlossaryTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_glossary_terms_request ->
    ( disassociate_glossary_terms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_glossary_terms_request ->
    ( disassociate_glossary_terms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association of one or more glossary terms from an asset in Glue Data Catalog.\n"]

module GetAsset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_asset_input ->
    ( get_asset_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_asset_input ->
    ( get_asset_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for an asset in Glue Data Catalog, including its forms, additional \
   attachments, and associated glossary terms.\n"]

module GetAssetType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_asset_type_request ->
    ( get_asset_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_asset_type_request ->
    ( get_asset_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves an asset type in Glue Data Catalog by its identifier.\n"]

module GetBlueprint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_request ->
    ( get_blueprint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_request ->
    ( get_blueprint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details of a blueprint.\n"]

module GetBlueprintRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_run_request ->
    ( get_blueprint_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_run_request ->
    ( get_blueprint_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details of a blueprint run.\n"]

module GetBlueprintRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_runs_request ->
    ( get_blueprint_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_runs_request ->
    ( get_blueprint_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details of blueprint runs for a specified blueprint.\n"]

module GetCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_catalog_request ->
    ( get_catalog_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_catalog_request ->
    ( get_catalog_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The name of the Catalog to retrieve. This should be all lowercase.\n"]

module GetCatalogImportStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_catalog_import_status_request ->
    ( get_catalog_import_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_catalog_import_status_request ->
    ( get_catalog_import_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the status of a migration operation.\n"]

module GetCatalogs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_catalogs_request ->
    ( get_catalogs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_catalogs_request ->
    ( get_catalogs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves all catalogs defined in a catalog in the Glue Data Catalog. For a Redshift-federated \
   catalog use case, this operation returns the list of catalogs mapped to Redshift databases in \
   the Redshift namespace catalog.\n"]

module GetClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_classifier_request ->
    ( get_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_classifier_request ->
    ( get_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieve a classifier by name.\n"]

module GetClassifiers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_classifiers_request ->
    ( get_classifiers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_classifiers_request ->
    ( get_classifiers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all classifier objects in the Data Catalog.\n"]

module GetColumnStatisticsForPartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_for_partition_request ->
    ( get_column_statistics_for_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_for_partition_request ->
    ( get_column_statistics_for_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves partition statistics of columns.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is \
   [GetPartition].\n\
  \ "]

module GetColumnStatisticsForTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_for_table_request ->
    ( get_column_statistics_for_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_for_table_request ->
    ( get_column_statistics_for_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves table statistics of columns.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is [GetTable].\n\
  \ "]

module GetColumnStatisticsTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_run_request ->
    ( get_column_statistics_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_run_request ->
    ( get_column_statistics_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get the associated metadata/information for a task run, given a task run ID.\n"]

module GetColumnStatisticsTaskRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_runs_request ->
    ( get_column_statistics_task_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_runs_request ->
    ( get_column_statistics_task_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about all runs associated with the specified table.\n"]

module GetColumnStatisticsTaskSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_settings_request ->
    ( get_column_statistics_task_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_settings_request ->
    ( get_column_statistics_task_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets settings for a column statistics task.\n"]

module GetConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_connection_request ->
    ( get_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_connection_request ->
    ( get_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a connection definition from the Data Catalog.\n"]

module GetConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_connections_request ->
    ( get_connections_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_connections_request ->
    ( get_connections_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of connection definitions from the Data Catalog.\n"]

module GetCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_crawler_request ->
    ( get_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_crawler_request ->
    ( get_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves metadata for a specified crawler.\n"]

module GetCrawlerMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_crawler_metrics_request ->
    ( get_crawler_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_crawler_metrics_request ->
    ( get_crawler_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves metrics about specified crawlers.\n"]

module GetCrawlers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_crawlers_request ->
    ( get_crawlers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_crawlers_request ->
    ( get_crawlers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves metadata for all crawlers defined in the customer account.\n"]

module GetCustomEntityType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_custom_entity_type_request ->
    ( get_custom_entity_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_custom_entity_type_request ->
    ( get_custom_entity_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details of a custom pattern by specifying its name.\n"]

module GetDashboardUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dashboard_url_request ->
    ( get_dashboard_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dashboard_url_request ->
    ( get_dashboard_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the URL for the Spark monitoring dashboard for a Glue resource.\n"]

module GetDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_database_request ->
    ( get_database_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_database_request ->
    ( get_database_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the definition of a specified database.\n"]

module GetDatabases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_databases_request ->
    ( get_databases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_databases_request ->
    ( get_databases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves all databases defined in a given Data Catalog.\n"]

module GetDataCatalogEncryptionSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_catalog_encryption_settings_request ->
    ( get_data_catalog_encryption_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_catalog_encryption_settings_request ->
    ( get_data_catalog_encryption_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the security configuration for a specified catalog.\n"]

module GetDataflowGraph : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dataflow_graph_request ->
    ( get_dataflow_graph_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dataflow_graph_request ->
    ( get_dataflow_graph_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Transforms a Python script into a directed acyclic graph (DAG). \n"]

module GetDataQualityModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_model_request ->
    ( get_data_quality_model_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_model_request ->
    ( get_data_quality_model_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve the training status of the model along with more information (CompletedOn, StartedOn, \
   FailureReason).\n"]

module GetDataQualityModelResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_model_result_request ->
    ( get_data_quality_model_result_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_model_result_request ->
    ( get_data_quality_model_result_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieve a statistic's predictions for a given Profile ID.\n"]

module GetDataQualityResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_result_request ->
    ( get_data_quality_result_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_result_request ->
    ( get_data_quality_result_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the result of a data quality rule evaluation.\n"]

module GetDataQualityRuleRecommendationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_rule_recommendation_run_request ->
    ( get_data_quality_rule_recommendation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_rule_recommendation_run_request ->
    ( get_data_quality_rule_recommendation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the specified recommendation run that was used to generate rules.\n"]

module GetDataQualityRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_ruleset_request ->
    ( get_data_quality_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_ruleset_request ->
    ( get_data_quality_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns an existing ruleset by identifier or name.\n"]

module GetDataQualityRulesetEvaluationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_ruleset_evaluation_run_request ->
    ( get_data_quality_ruleset_evaluation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_ruleset_evaluation_run_request ->
    ( get_data_quality_ruleset_evaluation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a specific run where a ruleset is evaluated against a data source.\n"]

module GetDevEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dev_endpoint_request ->
    ( get_dev_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dev_endpoint_request ->
    ( get_dev_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about a specified development endpoint.\n\n\
  \  When you create a development endpoint in a virtual private cloud (VPC), Glue returns only a \
   private IP address, and the public IP address field is not populated. When you create a non-VPC \
   development endpoint, Glue returns only a public IP address.\n\
  \  \n\
  \   "]

module GetDevEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dev_endpoints_request ->
    ( get_dev_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dev_endpoints_request ->
    ( get_dev_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves all the development endpoints in this Amazon Web Services account.\n\n\
  \  When you create a development endpoint in a virtual private cloud (VPC), Glue returns only a \
   private IP address and the public IP address field is not populated. When you create a non-VPC \
   development endpoint, Glue returns only a public IP address.\n\
  \  \n\
  \   "]

module GetEntityRecords : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_entity_records_request ->
    ( get_entity_records_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_entity_records_request ->
    ( get_entity_records_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used to query preview data from a given connection type or from a native Amazon S3 \
   based Glue Data Catalog.\n\n\
  \ Returns records as an array of JSON blobs. Each record is formatted using Jackson JsonNode \
   based on the field type defined by the [DescribeEntity] API.\n\
  \ \n\
  \  Spark connectors generate schemas according to the same data type mapping as in the \
   [DescribeEntity] API. Spark connectors convert data to the appropriate data types matching the \
   schema when returning rows.\n\
  \  "]

module GetFormType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_form_type_request ->
    ( get_form_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_form_type_request ->
    ( get_form_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a form type in Glue Data Catalog by its identifier.\n"]

module GetGlossary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_glossary_request ->
    ( get_glossary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_glossary_request ->
    ( get_glossary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a business glossary in Glue Data Catalog by its identifier.\n"]

module GetGlossaryTerm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_glossary_term_request ->
    ( get_glossary_term_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_glossary_term_request ->
    ( get_glossary_term_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a glossary term in Glue Data Catalog by its identifier.\n"]

module GetGlueIdentityCenterConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_glue_identity_center_configuration_request ->
    ( get_glue_identity_center_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_glue_identity_center_configuration_request ->
    ( get_glue_identity_center_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the current Glue Identity Center configuration details, including the associated \
   Identity Center instance and application information.\n"]

module GetIntegrationResourceProperty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_integration_resource_property_request ->
    ( get_integration_resource_property_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_integration_resource_property_request ->
    ( get_integration_resource_property_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used for fetching the [ResourceProperty] of the Glue connection (for the source) or \
   Glue database ARN (for the target)\n"]

module GetIntegrationTableProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_integration_table_properties_request ->
    ( get_integration_table_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_integration_table_properties_request ->
    ( get_integration_table_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used to retrieve optional override properties for the tables that need to be \
   replicated. These properties can include properties for filtering and partition for source and \
   target tables.\n"]

module GetJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_request ->
    ( get_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_request ->
    ( get_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves an existing job definition.\n"]

module GetJobBookmark : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_bookmark_request ->
    ( get_job_bookmark_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_bookmark_request ->
    ( get_job_bookmark_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information on a job bookmark entry.\n\n\
  \ For more information about enabling and using job bookmarks, see:\n\
  \ \n\
  \  {ul\n\
  \        {-   {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-continuations.html}Tracking \
   processed data using job bookmarks} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html}Job \
   parameters used by Glue} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html#aws-glue-api-jobs-job-Job}Job \
   structure} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module GetJobRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_run_request ->
    ( get_job_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_run_request ->
    ( get_job_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for a given job run. Job run history is accessible for 365 days for your \
   workflow and job run.\n"]

module GetJobRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_runs_request ->
    ( get_job_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_runs_request ->
    ( get_job_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves metadata for all runs of a given job definition.\n\n\
  \  [GetJobRuns] returns the job runs in chronological order, with the newest jobs returned first.\n\
  \ "]

module GetJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_jobs_request ->
    ( get_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_jobs_request ->
    ( get_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves all current job definitions.\n"]

module GetMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_mapping_request ->
    ( get_mapping_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_mapping_request ->
    ( get_mapping_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates mappings.\n"]

module GetMaterializedViewRefreshTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_materialized_view_refresh_task_run_request ->
    ( get_materialized_view_refresh_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_materialized_view_refresh_task_run_request ->
    ( get_materialized_view_refresh_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get the associated metadata/information for a task run, given a task run ID.\n"]

module GetMLTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ml_task_run_request ->
    ( get_ml_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ml_task_run_request ->
    ( get_ml_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets details for a specific task run on a machine learning transform. Machine learning task \
   runs are asynchronous tasks that Glue runs on your behalf as part of various machine learning \
   workflows. You can check the stats of any task run by calling [GetMLTaskRun] with the \
   [TaskRunID] and its parent transform's [TransformID].\n"]

module GetMLTaskRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ml_task_runs_request ->
    ( get_ml_task_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ml_task_runs_request ->
    ( get_ml_task_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of runs for a machine learning transform. Machine learning task runs are \
   asynchronous tasks that Glue runs on your behalf as part of various machine learning workflows. \
   You can get a sortable, filterable list of machine learning task runs by calling \
   [GetMLTaskRuns] with their parent transform's [TransformID] and other optional parameters as \
   documented in this section.\n\n\
  \ This operation returns a list of historic runs and must be paginated.\n\
  \ "]

module GetMLTransform : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ml_transform_request ->
    ( get_ml_transform_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ml_transform_request ->
    ( get_ml_transform_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets an Glue machine learning transform artifact and all its corresponding metadata. Machine \
   learning transforms are a special type of transform that use machine learning to learn the \
   details of the transformation to be performed by learning from examples provided by humans. \
   These transformations are then saved by Glue. You can retrieve their metadata by calling \
   [GetMLTransform].\n"]

module GetMLTransforms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ml_transforms_request ->
    ( get_ml_transforms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ml_transforms_request ->
    ( get_ml_transforms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a sortable, filterable list of existing Glue machine learning transforms. Machine learning \
   transforms are a special type of transform that use machine learning to learn the details of \
   the transformation to be performed by learning from examples provided by humans. These \
   transformations are then saved by Glue, and you can retrieve their metadata by calling \
   [GetMLTransforms].\n"]

module GetPartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_partition_request ->
    ( get_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_partition_request ->
    ( get_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about a specified partition.\n"]

module GetPartitionIndexes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_partition_indexes_request ->
    ( get_partition_indexes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_partition_indexes_request ->
    ( get_partition_indexes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the partition indexes associated with a table.\n"]

module GetPartitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidStateException of invalid_state_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_partitions_request ->
    ( get_partitions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_partitions_request ->
    ( get_partitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about the partitions in a table.\n"]

module GetPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_plan_request ->
    ( get_plan_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_plan_request ->
    ( get_plan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets code to perform a specified mapping.\n"]

module GetRegistry : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_registry_input ->
    ( get_registry_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_registry_input ->
    ( get_registry_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified registry in detail.\n"]

module GetResourcePolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policies_request ->
    ( get_resource_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policies_request ->
    ( get_resource_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the resource policies set on individual resources by Resource Access Manager during \
   cross-account permission grants. Also retrieves the Data Catalog resource policy.\n\n\
  \ If you enabled metadata encryption in Data Catalog settings, and you do not have permission on \
   the KMS key, the operation can't return the Data Catalog resource policy.\n\
  \ "]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a specified resource policy.\n"]

module GetSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_schema_input ->
    ( get_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_schema_input ->
    ( get_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified schema in detail.\n"]

module GetSchemaByDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_schema_by_definition_input ->
    ( get_schema_by_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_schema_by_definition_input ->
    ( get_schema_by_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a schema by the [SchemaDefinition]. The schema definition is sent to the Schema \
   Registry, canonicalized, and hashed. If the hash is matched within the scope of the \
   [SchemaName] or ARN (or the default registry, if none is supplied), that schema\226\128\153s \
   metadata is returned. Otherwise, a 404 or NotFound error is returned. Schema versions in \
   [Deleted] statuses will not be included in the results.\n"]

module GetSchemaVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_schema_version_input ->
    ( get_schema_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_schema_version_input ->
    ( get_schema_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get the specified schema by its unique ID assigned when a version of the schema is created or \
   registered. Schema versions in Deleted status will not be included in the results.\n"]

module GetSchemaVersionsDiff : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_schema_versions_diff_input ->
    ( get_schema_versions_diff_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_schema_versions_diff_input ->
    ( get_schema_versions_diff_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Fetches the schema version difference in the specified difference type between two stored \
   schema versions in the Schema Registry.\n\n\
  \ This API allows you to compare two schema versions between two schema definitions under the \
   same schema.\n\
  \ "]

module GetSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_security_configuration_request ->
    ( get_security_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_security_configuration_request ->
    ( get_security_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a specified security configuration.\n"]

module GetSecurityConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_security_configurations_request ->
    ( get_security_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_security_configurations_request ->
    ( get_security_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of all security configurations.\n"]

module GetSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_request ->
    ( get_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_session_request ->
    ( get_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the session.\n"]

module GetSessionEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_endpoint_request ->
    ( get_session_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_session_endpoint_request ->
    ( get_session_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the Spark Connect endpoint URL and authentication token for an interactive session.\n"]

module GetStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_statement_request ->
    ( get_statement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_statement_request ->
    ( get_statement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the statement.\n"]

module GetTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_request ->
    ( get_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_request ->
    ( get_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the [Table] definition in a Data Catalog for a specified table.\n"]

module GetTableOptimizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_optimizer_request ->
    ( get_table_optimizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_optimizer_request ->
    ( get_table_optimizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the configuration of all optimizers associated with a specified table.\n"]

module GetTables : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_tables_request ->
    ( get_tables_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_tables_request ->
    ( get_tables_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the definitions of some or all of the tables in a given [Database].\n"]

module GetTableVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_version_request ->
    ( get_table_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_version_request ->
    ( get_table_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a specified version of a table.\n"]

module GetTableVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_versions_request ->
    ( get_table_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_versions_request ->
    ( get_table_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of strings that identify available versions of a specified table.\n"]

module GetTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_tags_request ->
    ( get_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_tags_request ->
    ( get_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of tags associated with a resource.\n"]

module GetTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_trigger_request ->
    ( get_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_trigger_request ->
    ( get_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the definition of a trigger.\n"]

module GetTriggers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_triggers_request ->
    ( get_triggers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_triggers_request ->
    ( get_triggers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets all the triggers associated with a job.\n"]

module GetUnfilteredPartitionMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `PermissionTypeMismatchException of permission_type_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_partition_metadata_request ->
    ( get_unfiltered_partition_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_partition_metadata_request ->
    ( get_unfiltered_partition_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves partition metadata from the Data Catalog that contains unfiltered metadata.\n\n\
  \ For IAM authorization, the public IAM action associated with this API is [glue:GetPartition].\n\
  \ "]

module GetUnfilteredPartitionsMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `PermissionTypeMismatchException of permission_type_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_partitions_metadata_request ->
    ( get_unfiltered_partitions_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_partitions_metadata_request ->
    ( get_unfiltered_partitions_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves partition metadata from the Data Catalog that contains unfiltered metadata.\n\n\
  \ For IAM authorization, the public IAM action associated with this API is [glue:GetPartitions].\n\
  \ "]

module GetUnfilteredTableMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `PermissionTypeMismatchException of permission_type_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_table_metadata_request ->
    ( get_unfiltered_table_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_table_metadata_request ->
    ( get_unfiltered_table_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows a third-party analytical engine to retrieve unfiltered table metadata from the Data \
   Catalog.\n\n\
  \ For IAM authorization, the public IAM action associated with this API is [glue:GetTable].\n\
  \ "]

module GetUsageProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_usage_profile_request ->
    ( get_usage_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_usage_profile_request ->
    ( get_usage_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about the specified Glue usage profile.\n"]

module GetUserDefinedFunction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_user_defined_function_request ->
    ( get_user_defined_function_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_user_defined_function_request ->
    ( get_user_defined_function_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a specified function definition from the Data Catalog.\n"]

module GetUserDefinedFunctions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_user_defined_functions_request ->
    ( get_user_defined_functions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_user_defined_functions_request ->
    ( get_user_defined_functions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves multiple function definitions from the Data Catalog.\n"]

module GetWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_request ->
    ( get_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_request ->
    ( get_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves resource metadata for a workflow.\n"]

module GetWorkflowRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_run_request ->
    ( get_workflow_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_run_request ->
    ( get_workflow_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for a given workflow run. Job run history is accessible for 90 days for \
   your workflow and job run.\n"]

module GetWorkflowRunProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_run_properties_request ->
    ( get_workflow_run_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_run_properties_request ->
    ( get_workflow_run_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the workflow run properties which were set during the run.\n"]

module GetWorkflowRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_runs_request ->
    ( get_workflow_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_runs_request ->
    ( get_workflow_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves metadata for all runs of a given workflow.\n"]

module ImportCatalogToGlue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_catalog_to_glue_request ->
    ( import_catalog_to_glue_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_catalog_to_glue_request ->
    ( import_catalog_to_glue_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Imports an existing Amazon Athena Data Catalog to Glue.\n"]

module ListAssetTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_asset_types_request ->
    ( list_asset_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_asset_types_request ->
    ( list_asset_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the asset types defined in Glue Data Catalog.\n"]

module ListBlueprints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_blueprints_request ->
    ( list_blueprints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_blueprints_request ->
    ( list_blueprints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all the blueprint names in an account.\n"]

module ListColumnStatisticsTaskRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_column_statistics_task_runs_request ->
    ( list_column_statistics_task_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_column_statistics_task_runs_request ->
    ( list_column_statistics_task_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all task runs for a particular account.\n"]

module ListConnectionTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_connection_types_request ->
    ( list_connection_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_connection_types_request ->
    ( list_connection_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The [ListConnectionTypes] API provides a discovery mechanism to learn available connection \
   types in Glue. The response contains a list of connection types with high-level details of what \
   is supported for each connection type, including both built-in connection types and custom \
   connection types registered via [RegisterConnectionType]. The connection types listed are the \
   set of supported options for the [ConnectionType] value in the [CreateConnection] API.\n\n\
  \ See also: [DescribeConnectionType], [RegisterConnectionType], [DeleteConnectionType] \n\
  \ "]

module ListCrawlers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_crawlers_request ->
    ( list_crawlers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_crawlers_request ->
    ( list_crawlers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the names of all crawler resources in this Amazon Web Services account, or the \
   resources with the specified tag. This operation allows you to see which resources are \
   available in your account, and their names.\n\n\
  \ This operation takes the optional [Tags] field, which you can use as a filter on the response \
   so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only \
   resources with the tag are retrieved.\n\
  \ "]

module ListCrawls : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_crawls_request ->
    ( list_crawls_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_crawls_request ->
    ( list_crawls_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns all the crawls of a specified crawler. Returns only the crawls that have occurred since \
   the launch date of the crawler history feature, and only retains up to 12 months of crawls. \
   Older crawls will not be returned.\n\n\
  \ You may use this API to:\n\
  \ \n\
  \  {ul\n\
  \        {-  Retrive all the crawls of a specified crawler.\n\
  \            \n\
  \             }\n\
  \        {-  Retrieve all the crawls of a specified crawler within a limited count.\n\
  \            \n\
  \             }\n\
  \        {-  Retrieve all the crawls of a specified crawler in a specific time range.\n\
  \            \n\
  \             }\n\
  \        {-  Retrieve all the crawls of a specified crawler with a particular state, crawl ID, \
   or DPU hour value.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module ListCustomEntityTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_custom_entity_types_request ->
    ( list_custom_entity_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_custom_entity_types_request ->
    ( list_custom_entity_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all the custom patterns that have been created.\n"]

module ListDataQualityResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_results_request ->
    ( list_data_quality_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_results_request ->
    ( list_data_quality_results_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns all data quality execution results for your account.\n"]

module ListDataQualityRuleRecommendationRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_rule_recommendation_runs_request ->
    ( list_data_quality_rule_recommendation_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_rule_recommendation_runs_request ->
    ( list_data_quality_rule_recommendation_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the recommendation runs meeting the filter criteria.\n"]

module ListDataQualityRulesetEvaluationRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_ruleset_evaluation_runs_request ->
    ( list_data_quality_ruleset_evaluation_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_ruleset_evaluation_runs_request ->
    ( list_data_quality_ruleset_evaluation_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the runs meeting the filter criteria, where a ruleset is evaluated against a data \
   source.\n"]

module ListDataQualityRulesets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_rulesets_request ->
    ( list_data_quality_rulesets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_rulesets_request ->
    ( list_data_quality_rulesets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a paginated list of rulesets for the specified list of Glue tables.\n"]

module ListDataQualityStatisticAnnotations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_statistic_annotations_request ->
    ( list_data_quality_statistic_annotations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_statistic_annotations_request ->
    ( list_data_quality_statistic_annotations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieve annotations for a data quality statistic.\n"]

module ListDataQualityStatistics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_statistics_request ->
    ( list_data_quality_statistics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_statistics_request ->
    ( list_data_quality_statistics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of data quality statistics.\n"]

module ListDevEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dev_endpoints_request ->
    ( list_dev_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dev_endpoints_request ->
    ( list_dev_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the names of all [DevEndpoint] resources in this Amazon Web Services account, or the \
   resources with the specified tag. This operation allows you to see which resources are \
   available in your account, and their names.\n\n\
  \ This operation takes the optional [Tags] field, which you can use as a filter on the response \
   so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only \
   resources with the tag are retrieved.\n\
  \ "]

module ListEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_entities_request ->
    ( list_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_entities_request ->
    ( list_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the available entities supported by the connection type. \n"]

module ListFormTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_form_types_request ->
    ( list_form_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_form_types_request ->
    ( list_form_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the form types defined in Glue Data Catalog.\n"]

module ListGlossaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_glossaries_request ->
    ( list_glossaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_glossaries_request ->
    ( list_glossaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists business glossaries in Glue Data Catalog.\n"]

module ListGlossaryTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_glossary_terms_request ->
    ( list_glossary_terms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_glossary_terms_request ->
    ( list_glossary_terms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists glossary terms within a business glossary in Glue Data Catalog.\n"]

module ListIntegrationResourceProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_integration_resource_properties_request ->
    ( list_integration_resource_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_integration_resource_properties_request ->
    ( list_integration_resource_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List integration resource properties for a single customer. It supports the filters, maxRecords \
   and markers.\n"]

module ListIterableForms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_iterable_forms_request ->
    ( list_iterable_forms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_iterable_forms_request ->
    ( list_iterable_forms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the items in an iterable form on an asset in Glue Data Catalog. For example, lists the \
   columns of a table asset.\n"]

module ListJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_jobs_request ->
    ( list_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_jobs_request ->
    ( list_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the names of all job resources in this Amazon Web Services account, or the resources \
   with the specified tag. This operation allows you to see which resources are available in your \
   account, and their names.\n\n\
  \ This operation takes the optional [Tags] field, which you can use as a filter on the response \
   so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only \
   resources with the tag are retrieved.\n\
  \ "]

module ListMaterializedViewRefreshTaskRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_materialized_view_refresh_task_runs_request ->
    ( list_materialized_view_refresh_task_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_materialized_view_refresh_task_runs_request ->
    ( list_materialized_view_refresh_task_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all task runs for a particular account.\n"]

module ListMLTransforms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ml_transforms_request ->
    ( list_ml_transforms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ml_transforms_request ->
    ( list_ml_transforms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Retrieves a sortable, filterable list of existing Glue machine learning transforms in this \
   Amazon Web Services account, or the resources with the specified tag. This operation takes the \
   optional [Tags] field, which you can use as a filter of the responses so that tagged resources \
   can be retrieved as a group. If you choose to use tag filtering, only resources with the tags \
   are retrieved. \n"]

module ListRegistries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_registries_input ->
    ( list_registries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_registries_input ->
    ( list_registries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of registries that you have created, with minimal registry information. \
   Registries in the [Deleting] status will not be included in the results. Empty results will be \
   returned if there are no registries available.\n"]

module ListSchemas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_schemas_input ->
    ( list_schemas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_schemas_input ->
    ( list_schemas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of schemas with minimal details. Schemas in Deleting status will not be included \
   in the results. Empty results will be returned if there are no schemas available.\n\n\
  \ When the [RegistryId] is not provided, all the schemas across registries will be part of the \
   API response.\n\
  \ "]

module ListSchemaVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_schema_versions_input ->
    ( list_schema_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_schema_versions_input ->
    ( list_schema_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of schema versions that you have created, with minimal information. Schema \
   versions in Deleted status will not be included in the results. Empty results will be returned \
   if there are no schema versions available.\n"]

module ListSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_sessions_request ->
    ( list_sessions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sessions_request ->
    ( list_sessions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieve a list of sessions.\n"]

module ListStatements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_statements_request ->
    ( list_statements_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_statements_request ->
    ( list_statements_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists statements for the session.\n"]

module ListTableOptimizerRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_table_optimizer_runs_request ->
    ( list_table_optimizer_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_table_optimizer_runs_request ->
    ( list_table_optimizer_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the history of previous optimizer runs for a specific table.\n"]

module ListTriggers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_triggers_request ->
    ( list_triggers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_triggers_request ->
    ( list_triggers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the names of all trigger resources in this Amazon Web Services account, or the \
   resources with the specified tag. This operation allows you to see which resources are \
   available in your account, and their names.\n\n\
  \ This operation takes the optional [Tags] field, which you can use as a filter on the response \
   so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only \
   resources with the tag are retrieved.\n\
  \ "]

module ListUsageProfiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_usage_profiles_request ->
    ( list_usage_profiles_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_usage_profiles_request ->
    ( list_usage_profiles_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all the Glue usage profiles.\n"]

module ListWorkflows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workflows_request ->
    ( list_workflows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workflows_request ->
    ( list_workflows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists names of workflows created in the account.\n"]

module ModifyIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidIntegrationStateFault of invalid_integration_state_fault
    | `InvalidStateException of invalid_state_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_integration_request ->
    ( modify_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidIntegrationStateFault of invalid_integration_state_fault
      | `InvalidStateException of invalid_state_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_integration_request ->
    ( modify_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidIntegrationStateFault of invalid_integration_state_fault
      | `InvalidStateException of invalid_state_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies a Zero-ETL integration in the caller's account.\n"]

module PutAsset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_asset_request ->
    ( put_asset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_asset_request ->
    ( put_asset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an asset in Glue Data Catalog. If the asset already exists, this operation \
   updates it; otherwise, a new asset is created.\n"]

module PutAssetType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_asset_type_request ->
    ( put_asset_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_asset_type_request ->
    ( put_asset_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an asset type in Glue Data Catalog. An asset type defines the structure of \
   assets by specifying which forms they include. If an asset type with the given name already \
   exists, it is updated.\n"]

module PutAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_attachment_request ->
    ( put_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_attachment_request ->
    ( put_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches a form to an asset or an iterable form item in Glue Data Catalog. If an attachment \
   with the same name already exists, it is overwritten.\n"]

module PutDataCatalogEncryptionSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_data_catalog_encryption_settings_request ->
    ( put_data_catalog_encryption_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_data_catalog_encryption_settings_request ->
    ( put_data_catalog_encryption_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the security configuration for a specified catalog. After the configuration has been set, \
   the specified encryption is applied to every catalog write thereafter.\n"]

module PutDataQualityProfileAnnotation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_data_quality_profile_annotation_request ->
    ( put_data_quality_profile_annotation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_data_quality_profile_annotation_request ->
    ( put_data_quality_profile_annotation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Annotate all datapoints for a Profile.\n"]

module PutFormType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_form_type_request ->
    ( put_form_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_form_type_request ->
    ( put_form_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a form type in Glue Data Catalog. A form type defines the schema for \
   structured metadata that can be attached to assets.\n"]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConditionCheckFailureException of condition_check_failure_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConditionCheckFailureException of condition_check_failure_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConditionCheckFailureException of condition_check_failure_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Sets the Data Catalog resource policy for access control.\n"]

module PutSchemaVersionMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_schema_version_metadata_input ->
    ( put_schema_version_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_schema_version_metadata_input ->
    ( put_schema_version_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Puts the metadata key value pair for a specified schema version ID. A maximum of 10 key value \
   pairs will be allowed per schema version. They can be added over one or more calls.\n"]

module PutWorkflowRunProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_workflow_run_properties_request ->
    ( put_workflow_run_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_workflow_run_properties_request ->
    ( put_workflow_run_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Puts the specified workflow run properties for the given workflow run. If a property already \
   exists for the specified run, then it overrides the value otherwise adds the property to \
   existing properties.\n"]

module QuerySchemaVersionMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    query_schema_version_metadata_input ->
    ( query_schema_version_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    query_schema_version_metadata_input ->
    ( query_schema_version_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Queries for the schema version metadata information. \n"]

module RegisterConnectionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_connection_type_request ->
    ( register_connection_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_connection_type_request ->
    ( register_connection_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers a custom connection type in Glue based on the configuration provided. This operation \
   enables customers to configure custom connectors for any data source with REST-based APIs, \
   eliminating the need for building custom Lambda connectors.\n\n\
  \ The registered connection type stores details about how requests and responses are interpreted \
   by REST sources, including connection properties, authentication configuration, and REST \
   configuration with entity definitions. Once registered, customers can create connections using \
   this connection type and work with them the same way as natively supported Glue connectors.\n\
  \ \n\
  \  Supports multiple authentication types including Basic, OAuth2 (Client Credentials, JWT \
   Bearer, Authorization Code), and Custom Auth configurations.\n\
  \  "]

module RegisterSchemaVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_schema_version_input ->
    ( register_schema_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_schema_version_input ->
    ( register_schema_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a new version to the existing schema. Returns an error if new version of schema does not \
   meet the compatibility requirements of the schema set. This API will not create a new schema \
   set and will return a 404 error if the schema set is not already present in the Schema \
   Registry.\n\n\
  \ If this is the first schema definition to be registered in the Schema Registry, this API will \
   store the schema version and return immediately. Otherwise, this call has the potential to run \
   longer than other operations due to compatibility modes. You can call the [GetSchemaVersion] \
   API with the [SchemaVersionId] to check compatibility modes.\n\
  \ \n\
  \  If the same schema definition is already stored in Schema Registry as a version, the schema \
   ID of the existing schema is returned to the caller.\n\
  \  "]

module RemoveSchemaVersionMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_schema_version_metadata_input ->
    ( remove_schema_version_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_schema_version_metadata_input ->
    ( remove_schema_version_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a key value pair from the schema version metadata for the specified schema version ID.\n"]

module ResetJobBookmark : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_job_bookmark_request ->
    ( reset_job_bookmark_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_job_bookmark_request ->
    ( reset_job_bookmark_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Resets a bookmark entry.\n\n\
  \ For more information about enabling and using job bookmarks, see:\n\
  \ \n\
  \  {ul\n\
  \        {-   {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-continuations.html}Tracking \
   processed data using job bookmarks} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html}Job \
   parameters used by Glue} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html#aws-glue-api-jobs-job-Job}Job \
   structure} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module ResumeWorkflowRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalWorkflowStateException of illegal_workflow_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resume_workflow_run_request ->
    ( resume_workflow_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalWorkflowStateException of illegal_workflow_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resume_workflow_run_request ->
    ( resume_workflow_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalWorkflowStateException of illegal_workflow_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restarts selected nodes of a previous partially completed workflow run and resumes the workflow \
   run. The selected nodes and all nodes that are downstream from the selected nodes are run.\n"]

module RunStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
    | `SessionBusyException of session_busy_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    run_statement_request ->
    ( run_statement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `SessionBusyException of session_busy_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    run_statement_request ->
    ( run_statement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `SessionBusyException of session_busy_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Executes the statement.\n"]

module SearchAssets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_assets_input ->
    ( search_assets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_assets_input ->
    ( search_assets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches for assets in Glue Data Catalog using full-text search, filters, sorting, and \
   aggregations. Returns matching assets with relevance-ranked results.\n"]

module SearchTables : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_tables_request ->
    ( search_tables_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_tables_request ->
    ( search_tables_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches a set of tables based on properties in the table metadata as well as on the parent \
   database. You can search against text or filter conditions. \n\n\
  \ You can only get tables that you have access to based on the security policies defined in Lake \
   Formation. You need at least a read-only access to the table for it to be returned. If you do \
   not have access to all the columns in the table, these columns will not be searched against \
   when returning the list of tables back to you. If you have access to the columns but not the \
   data in the columns, those columns and the associated metadata for those columns will be \
   included in the search. \n\
  \ "]

module StartBlueprintRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalBlueprintStateException of illegal_blueprint_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_blueprint_run_request ->
    ( start_blueprint_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalBlueprintStateException of illegal_blueprint_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_blueprint_run_request ->
    ( start_blueprint_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalBlueprintStateException of illegal_blueprint_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a new run of the specified blueprint.\n"]

module StartColumnStatisticsTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_column_statistics_task_run_request ->
    ( start_column_statistics_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_column_statistics_task_run_request ->
    ( start_column_statistics_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a column statistics task run, for a specified table and columns.\n"]

module StartColumnStatisticsTaskRunSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_column_statistics_task_run_schedule_request ->
    ( start_column_statistics_task_run_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_column_statistics_task_run_schedule_request ->
    ( start_column_statistics_task_run_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a column statistics task run schedule.\n"]

module StartCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CrawlerRunningException of crawler_running_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_crawler_request ->
    ( start_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_crawler_request ->
    ( start_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a crawl using the specified crawler, regardless of what is scheduled. If the crawler is \
   already running, returns a \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-exceptions.html#aws-glue-api-exceptions-CrawlerRunningException}CrawlerRunningException}.\n"]

module StartCrawlerSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `NoScheduleException of no_schedule_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `SchedulerRunningException of scheduler_running_exception
    | `SchedulerTransitioningException of scheduler_transitioning_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_crawler_schedule_request ->
    ( start_crawler_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `NoScheduleException of no_schedule_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerRunningException of scheduler_running_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_crawler_schedule_request ->
    ( start_crawler_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `NoScheduleException of no_schedule_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerRunningException of scheduler_running_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the schedule state of the specified crawler to [SCHEDULED], unless the crawler is \
   already running or the schedule state is already [SCHEDULED].\n"]

module StartDataQualityRuleRecommendationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_data_quality_rule_recommendation_run_request ->
    ( start_data_quality_rule_recommendation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_data_quality_rule_recommendation_run_request ->
    ( start_data_quality_rule_recommendation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a recommendation run that is used to generate rules when you don't know what rules to \
   write. Glue Data Quality analyzes the data and comes up with recommendations for a potential \
   ruleset. You can then triage the ruleset and modify the generated ruleset to your liking.\n\n\
  \ Recommendation runs are automatically deleted after 90 days.\n\
  \ "]

module StartDataQualityRulesetEvaluationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_data_quality_ruleset_evaluation_run_request ->
    ( start_data_quality_ruleset_evaluation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_data_quality_ruleset_evaluation_run_request ->
    ( start_data_quality_ruleset_evaluation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Once you have a ruleset definition (either recommended or your own), you call this operation to \
   evaluate the ruleset against a data source (Glue table). The evaluation computes results which \
   you can retrieve with the [GetDataQualityResult] API.\n"]

module StartExportLabelsTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_export_labels_task_run_request ->
    ( start_export_labels_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_export_labels_task_run_request ->
    ( start_export_labels_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Begins an asynchronous task to export all labeled data for a particular transform. This task is \
   the only label-related API call that is not part of the typical active learning workflow. You \
   typically use [StartExportLabelsTaskRun] when you want to work with all of your existing labels \
   at the same time, such as when you want to remove or change labels that were previously \
   submitted as truth. This API operation accepts the [TransformId] whose labels you want to \
   export and an Amazon Simple Storage Service (Amazon S3) path to export the labels to. The \
   operation returns a [TaskRunId]. You can check on the status of your task run by calling the \
   [GetMLTaskRun] API.\n"]

module StartImportLabelsTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_import_labels_task_run_request ->
    ( start_import_labels_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_import_labels_task_run_request ->
    ( start_import_labels_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables you to provide additional labels (examples of truth) to be used to teach the machine \
   learning transform and improve its quality. This API operation is generally used as part of the \
   active learning workflow that starts with the [StartMLLabelingSetGenerationTaskRun] call and \
   that ultimately results in improving the quality of your machine learning transform. \n\n\
  \ After the [StartMLLabelingSetGenerationTaskRun] finishes, Glue machine learning will have \
   generated a series of questions for humans to answer. (Answering these questions is often \
   called 'labeling' in the machine learning workflows). In the case of the [FindMatches] \
   transform, these questions are of the form, \226\128\156What is the correct way to group these \
   rows together into groups composed entirely of matching records?\226\128\157 After the labeling \
   process is finished, users upload their answers/labels with a call to \
   [StartImportLabelsTaskRun]. After [StartImportLabelsTaskRun] finishes, all future runs of the \
   machine learning transform use the new and improved labels and perform a higher-quality \
   transformation.\n\
  \ \n\
  \  By default, [StartMLLabelingSetGenerationTaskRun] continually learns from and combines all \
   labels that you upload unless you set [Replace] to true. If you set [Replace] to true, \
   [StartImportLabelsTaskRun] deletes and forgets all previously uploaded labels and learns only \
   from the exact set that you upload. Replacing labels can be helpful if you realize that you \
   previously uploaded incorrect labels, and you believe that they are having a negative effect on \
   your transform quality.\n\
  \  \n\
  \   You can check on the status of your task run by calling the [GetMLTaskRun] operation. \n\
  \   "]

module StartJobRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_job_run_request ->
    ( start_job_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_job_run_request ->
    ( start_job_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a job run using a job definition.\n"]

module StartMaterializedViewRefreshTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `MaterializedViewRefreshTaskRunningException of
      materialized_view_refresh_task_running_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_materialized_view_refresh_task_run_request ->
    ( start_materialized_view_refresh_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `MaterializedViewRefreshTaskRunningException of
        materialized_view_refresh_task_running_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_materialized_view_refresh_task_run_request ->
    ( start_materialized_view_refresh_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `MaterializedViewRefreshTaskRunningException of
        materialized_view_refresh_task_running_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a materialized view refresh task run, for a specified table and columns.\n"]

module StartMLEvaluationTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `MLTransformNotReadyException of ml_transform_not_ready_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_ml_evaluation_task_run_request ->
    ( start_ml_evaluation_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `MLTransformNotReadyException of ml_transform_not_ready_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_ml_evaluation_task_run_request ->
    ( start_ml_evaluation_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `MLTransformNotReadyException of ml_transform_not_ready_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a task to estimate the quality of the transform. \n\n\
  \ When you provide label sets as examples of truth, Glue machine learning uses some of those \
   examples to learn from them. The rest of the labels are used as a test to estimate quality.\n\
  \ \n\
  \  Returns a unique identifier for the run. You can call [GetMLTaskRun] to get more information \
   about the stats of the [EvaluationTaskRun].\n\
  \  "]

module StartMLLabelingSetGenerationTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_ml_labeling_set_generation_task_run_request ->
    ( start_ml_labeling_set_generation_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_ml_labeling_set_generation_task_run_request ->
    ( start_ml_labeling_set_generation_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the active learning workflow for your machine learning transform to improve the \
   transform's quality by generating label sets and adding labels.\n\n\
  \ When the [StartMLLabelingSetGenerationTaskRun] finishes, Glue will have generated a \"labeling \
   set\" or a set of questions for humans to answer.\n\
  \ \n\
  \  In the case of the [FindMatches] transform, these questions are of the form, \226\128\156What \
   is the correct way to group these rows together into groups composed entirely of matching \
   records?\226\128\157 \n\
  \  \n\
  \   After the labeling process is finished, you can upload your labels with a call to \
   [StartImportLabelsTaskRun]. After [StartImportLabelsTaskRun] finishes, all future runs of the \
   machine learning transform will use the new and improved labels and perform a higher-quality \
   transformation.\n\
  \   \n\
  \    Note: The role used to write the generated labeling set to the [OutputS3Path] is the role \
   associated with the Machine Learning Transform, specified in the [CreateMLTransform] API.\n\
  \    "]

module StartTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_trigger_request ->
    ( start_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_trigger_request ->
    ( start_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an existing trigger. See \
   {{:https://docs.aws.amazon.com/glue/latest/dg/trigger-job.html}Triggering Jobs} for information \
   about how different types of trigger are started.\n"]

module StartWorkflowRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_workflow_run_request ->
    ( start_workflow_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_workflow_run_request ->
    ( start_workflow_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a new run of the specified workflow.\n"]

module StopColumnStatisticsTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ColumnStatisticsTaskNotRunningException of column_statistics_task_not_running_exception
    | `ColumnStatisticsTaskStoppingException of column_statistics_task_stopping_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_column_statistics_task_run_request ->
    ( stop_column_statistics_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ColumnStatisticsTaskNotRunningException of column_statistics_task_not_running_exception
      | `ColumnStatisticsTaskStoppingException of column_statistics_task_stopping_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_column_statistics_task_run_request ->
    ( stop_column_statistics_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ColumnStatisticsTaskNotRunningException of column_statistics_task_not_running_exception
      | `ColumnStatisticsTaskStoppingException of column_statistics_task_stopping_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a task run for the specified table.\n"]

module StopColumnStatisticsTaskRunSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_column_statistics_task_run_schedule_request ->
    ( stop_column_statistics_task_run_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_column_statistics_task_run_schedule_request ->
    ( stop_column_statistics_task_run_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a column statistics task run schedule.\n"]

module StopCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CrawlerNotRunningException of crawler_not_running_exception
    | `CrawlerStoppingException of crawler_stopping_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_crawler_request ->
    ( stop_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerNotRunningException of crawler_not_running_exception
      | `CrawlerStoppingException of crawler_stopping_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_crawler_request ->
    ( stop_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerNotRunningException of crawler_not_running_exception
      | `CrawlerStoppingException of crawler_stopping_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "If the specified crawler is running, stops the crawl.\n"]

module StopCrawlerSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `SchedulerNotRunningException of scheduler_not_running_exception
    | `SchedulerTransitioningException of scheduler_transitioning_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_crawler_schedule_request ->
    ( stop_crawler_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerNotRunningException of scheduler_not_running_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_crawler_schedule_request ->
    ( stop_crawler_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerNotRunningException of scheduler_not_running_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the schedule state of the specified crawler to [NOT_SCHEDULED], but does not stop the \
   crawler if it is already running.\n"]

module StopMaterializedViewRefreshTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidInputException of invalid_input_exception
    | `MaterializedViewRefreshTaskNotRunningException of
      materialized_view_refresh_task_not_running_exception
    | `MaterializedViewRefreshTaskStoppingException of
      materialized_view_refresh_task_stopping_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_materialized_view_refresh_task_run_request ->
    ( stop_materialized_view_refresh_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidInputException of invalid_input_exception
      | `MaterializedViewRefreshTaskNotRunningException of
        materialized_view_refresh_task_not_running_exception
      | `MaterializedViewRefreshTaskStoppingException of
        materialized_view_refresh_task_stopping_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_materialized_view_refresh_task_run_request ->
    ( stop_materialized_view_refresh_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidInputException of invalid_input_exception
      | `MaterializedViewRefreshTaskNotRunningException of
        materialized_view_refresh_task_not_running_exception
      | `MaterializedViewRefreshTaskStoppingException of
        materialized_view_refresh_task_stopping_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a materialized view refresh task run, for a specified table and columns.\n"]

module StopSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_session_request ->
    ( stop_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_session_request ->
    ( stop_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the session.\n"]

module StopTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_trigger_request ->
    ( stop_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_trigger_request ->
    ( stop_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a specified trigger.\n"]

module StopWorkflowRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalWorkflowStateException of illegal_workflow_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_workflow_run_request ->
    ( stop_workflow_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalWorkflowStateException of illegal_workflow_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_workflow_run_request ->
    ( stop_workflow_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalWorkflowStateException of illegal_workflow_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the execution of the specified workflow run.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds tags to a resource. A tag is a label you can assign to an Amazon Web Services resource. In \
   Glue, you can tag only certain resources. For information about what resources you can tag, see \
   {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html}Amazon Web Services Tags in \
   Glue}.\n"]

module TestConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_connection_request ->
    ( test_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_connection_request ->
    ( test_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Tests a connection to a service to validate the service credentials that you provide.\n\n\
  \ You can either provide an existing connection name or a [TestConnectionInput] for testing a \
   non-existing connection input. Providing both at the same time will cause an error.\n\
  \ \n\
  \  If the action is successful, the service sends back an HTTP 200 response.\n\
  \  "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from a resource.\n"]

module UpdateAsset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_asset_request ->
    ( update_asset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_asset_request ->
    ( update_asset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the name and description of an existing asset in Glue Data Catalog. Only the fields \
   that you provide are updated.\n"]

module UpdateBlueprint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalBlueprintStateException of illegal_blueprint_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_blueprint_request ->
    ( update_blueprint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalBlueprintStateException of illegal_blueprint_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_blueprint_request ->
    ( update_blueprint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalBlueprintStateException of illegal_blueprint_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a registered blueprint.\n"]

module UpdateCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_catalog_request ->
    ( update_catalog_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_catalog_request ->
    ( update_catalog_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing catalog's properties in the Glue Data Catalog.\n"]

module UpdateClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `VersionMismatchException of version_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_classifier_request ->
    ( update_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_classifier_request ->
    ( update_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing classifier (a [GrokClassifier], an [XMLClassifier], a [JsonClassifier], or \
   a [CsvClassifier], depending on which field is present).\n"]

module UpdateColumnStatisticsForPartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_for_partition_request ->
    ( update_column_statistics_for_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_for_partition_request ->
    ( update_column_statistics_for_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates partition statistics of columns.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is \
   [UpdatePartition].\n\
  \ "]

module UpdateColumnStatisticsForTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_for_table_request ->
    ( update_column_statistics_for_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_for_table_request ->
    ( update_column_statistics_for_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates table statistics of columns.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is \
   [UpdateTable].\n\
  \ "]

module UpdateColumnStatisticsTaskSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `VersionMismatchException of version_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_task_settings_request ->
    ( update_column_statistics_task_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_task_settings_request ->
    ( update_column_statistics_task_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates settings for a column statistics task.\n"]

module UpdateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    ( update_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    ( update_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a connection definition in the Data Catalog.\n"]

module UpdateCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CrawlerRunningException of crawler_running_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `VersionMismatchException of version_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_crawler_request ->
    ( update_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_crawler_request ->
    ( update_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a crawler. If a crawler is running, you must stop it using [StopCrawler] before \
   updating it.\n"]

module UpdateCrawlerSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `SchedulerTransitioningException of scheduler_transitioning_exception
    | `VersionMismatchException of version_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_crawler_schedule_request ->
    ( update_crawler_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception
      | `VersionMismatchException of version_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_crawler_schedule_request ->
    ( update_crawler_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception
      | `VersionMismatchException of version_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the schedule of a crawler using a [cron] expression. \n"]

module UpdateDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_database_request ->
    ( update_database_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_database_request ->
    ( update_database_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing database definition in a Data Catalog.\n"]

module UpdateDataQualityRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_data_quality_ruleset_request ->
    ( update_data_quality_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_data_quality_ruleset_request ->
    ( update_data_quality_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified data quality ruleset.\n"]

module UpdateDevEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_dev_endpoint_request ->
    ( update_dev_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_dev_endpoint_request ->
    ( update_dev_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a specified development endpoint.\n"]

module UpdateGlossary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_glossary_request ->
    ( update_glossary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_glossary_request ->
    ( update_glossary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a business glossary in Glue Data Catalog.\n"]

module UpdateGlossaryTerm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_glossary_term_request ->
    ( update_glossary_term_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_glossary_term_request ->
    ( update_glossary_term_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a glossary term in Glue Data Catalog.\n"]

module UpdateGlueIdentityCenterConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_glue_identity_center_configuration_request ->
    ( update_glue_identity_center_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_glue_identity_center_configuration_request ->
    ( update_glue_identity_center_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the existing Glue Identity Center configuration, allowing modification of scopes and \
   permissions for the integration.\n"]

module UpdateIntegrationResourceProperty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_integration_resource_property_request ->
    ( update_integration_resource_property_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_integration_resource_property_request ->
    ( update_integration_resource_property_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API can be used for updating the [ResourceProperty] of the Glue connection (for the \
   source) or Glue database ARN (for the target). These properties can include the role to access \
   the connection or database. Since the same resource can be used across multiple integrations, \
   updating resource properties will impact all the integrations using it.\n"]

module UpdateIntegrationTableProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_integration_table_properties_request ->
    ( update_integration_table_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_integration_table_properties_request ->
    ( update_integration_table_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used to provide optional override properties for the tables that need to be \
   replicated. These properties can include properties for filtering and partitioning for the \
   source and target tables. To set both source and target properties the same API need to be \
   invoked with the Glue connection ARN as [ResourceArn] with [SourceTableConfig], and the Glue \
   database ARN as [ResourceArn] with [TargetTableConfig] respectively.\n\n\
  \ The override will be reflected across all the integrations using same [ResourceArn] and source \
   table.\n\
  \ "]

module UpdateJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_job_request ->
    ( update_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_job_request ->
    ( update_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing job definition. The previous job definition is completely overwritten by \
   this information.\n"]

module UpdateJobFromSourceControl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_job_from_source_control_request ->
    ( update_job_from_source_control_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_job_from_source_control_request ->
    ( update_job_from_source_control_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Synchronizes a job from the source control repository. This operation takes the job artifacts \
   that are located in the remote repository and updates the Glue internal stores with these \
   artifacts.\n\n\
  \ This API supports optional parameters which take in the repository information.\n\
  \ "]

module UpdateMLTransform : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_ml_transform_request ->
    ( update_ml_transform_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_ml_transform_request ->
    ( update_ml_transform_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing machine learning transform. Call this operation to tune the algorithm \
   parameters to achieve better results.\n\n\
  \ After calling this operation, you can call the [StartMLEvaluationTaskRun] operation to assess \
   how well your new parameters achieved your goals (such as improving the quality of your machine \
   learning transform, or making it more cost-effective).\n\
  \ "]

module UpdatePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_partition_request ->
    ( update_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_partition_request ->
    ( update_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a partition.\n"]

module UpdateRegistry : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_registry_input ->
    ( update_registry_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_registry_input ->
    ( update_registry_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing registry which is used to hold a collection of schemas. The updated \
   properties relate to the registry, and do not modify any of the schemas within the registry. \n"]

module UpdateSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_schema_input ->
    ( update_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_schema_input ->
    ( update_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the description, compatibility setting, or version checkpoint for a schema set.\n\n\
  \ For updating the compatibility setting, the call will not validate compatibility for the \
   entire set of schema versions with the new compatibility setting. If the value for \
   [Compatibility] is provided, the [VersionNumber] (a checkpoint) is also required. The API will \
   validate the checkpoint version number for consistency.\n\
  \ \n\
  \  If the value for the [VersionNumber] (checkpoint) is provided, [Compatibility] is optional \
   and this can be used to set/reset a checkpoint for the schema.\n\
  \  \n\
  \   This update will happen only if the schema is in the AVAILABLE state.\n\
  \   "]

module UpdateSourceControlFromJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_source_control_from_job_request ->
    ( update_source_control_from_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_source_control_from_job_request ->
    ( update_source_control_from_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Synchronizes a job to the source control repository. This operation takes the job artifacts \
   from the Glue internal stores and makes a commit to the remote repository that is configured on \
   the job.\n\n\
  \ This API supports optional parameters which take in the repository information.\n\
  \ "]

module UpdateTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_table_request ->
    ( update_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_table_request ->
    ( update_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a metadata table in the Data Catalog.\n"]

module UpdateTableOptimizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_table_optimizer_request ->
    ( update_table_optimizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_table_optimizer_request ->
    ( update_table_optimizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the configuration for an existing table optimizer.\n"]

module UpdateTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_trigger_request ->
    ( update_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_trigger_request ->
    ( update_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a trigger definition.\n\n\
  \ Job arguments may be logged. Do not pass plaintext secrets as arguments. Retrieve secrets from \
   a Glue Connection, Amazon Web Services Secrets Manager or other secret management mechanism if \
   you intend to keep them within the Job.\n\
  \ "]

module UpdateUsageProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_usage_profile_request ->
    ( update_usage_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_usage_profile_request ->
    ( update_usage_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update an Glue usage profile.\n"]

module UpdateUserDefinedFunction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_defined_function_request ->
    ( update_user_defined_function_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_defined_function_request ->
    ( update_user_defined_function_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing function definition in the Data Catalog.\n"]

module UpdateWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workflow_request ->
    ( update_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workflow_request ->
    ( update_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing workflow.\n"]
