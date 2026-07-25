open Smaws_Lib.Json.SerializeHelpers
open Types

let message_string_to_yojson = string_to_yojson

let operation_timeout_exception_to_yojson (x : operation_timeout_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let nullable_boolean_to_yojson = bool_to_yojson

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson message_string_to_yojson x.message);
      ("FromFederationSource", option_to_yojson nullable_boolean_to_yojson x.from_federation_source);
    ]

let internal_service_exception_to_yojson (x : internal_service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let entity_not_found_exception_to_yojson (x : entity_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson message_string_to_yojson x.message);
      ("FromFederationSource", option_to_yojson nullable_boolean_to_yojson x.from_federation_source);
    ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let name_string_to_yojson = string_to_yojson

let update_workflow_response_to_yojson (x : update_workflow_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let nullable_integer_to_yojson = int_to_yojson
let generic_string_to_yojson = string_to_yojson
let id_string_to_yojson = string_to_yojson

let workflow_run_properties_to_yojson tree =
  map_to_yojson id_string_to_yojson generic_string_to_yojson tree

let workflow_description_string_to_yojson = string_to_yojson

let update_workflow_request_to_yojson (x : update_workflow_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson workflow_description_string_to_yojson x.description);
      ( "DefaultRunProperties",
        option_to_yojson workflow_run_properties_to_yojson x.default_run_properties );
      ("MaxConcurrentRuns", option_to_yojson nullable_integer_to_yojson x.max_concurrent_runs);
    ]

let glue_encryption_exception_to_yojson (x : glue_encryption_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_user_defined_function_response_to_yojson = unit_to_yojson
let ur_i_to_yojson = string_to_yojson

let resource_type_to_yojson (x : resource_type) =
  match x with JAR -> `String "JAR" | FILE -> `String "FILE" | ARCHIVE -> `String "ARCHIVE"

let resource_uri_to_yojson (x : resource_uri) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("Uri", option_to_yojson ur_i_to_yojson x.uri);
    ]

let resource_uri_list_to_yojson tree = list_to_yojson resource_uri_to_yojson tree

let principal_type_to_yojson (x : principal_type) =
  match x with USER -> `String "USER" | ROLE -> `String "ROLE" | GROUP -> `String "GROUP"

let function_type_to_yojson (x : function_type) =
  match x with
  | REGULAR_FUNCTION -> `String "REGULAR_FUNCTION"
  | AGGREGATE_FUNCTION -> `String "AGGREGATE_FUNCTION"
  | STORED_PROCEDURE -> `String "STORED_PROCEDURE"

let user_defined_function_input_to_yojson (x : user_defined_function_input) =
  assoc_to_yojson
    [
      ("FunctionName", option_to_yojson name_string_to_yojson x.function_name);
      ("ClassName", option_to_yojson name_string_to_yojson x.class_name);
      ("OwnerName", option_to_yojson name_string_to_yojson x.owner_name);
      ("FunctionType", option_to_yojson function_type_to_yojson x.function_type);
      ("OwnerType", option_to_yojson principal_type_to_yojson x.owner_type);
      ("ResourceUris", option_to_yojson resource_uri_list_to_yojson x.resource_uris);
    ]

let catalog_id_string_to_yojson = string_to_yojson

let update_user_defined_function_request_to_yojson (x : update_user_defined_function_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("FunctionName", Some (name_string_to_yojson x.function_name));
      ("FunctionInput", Some (user_defined_function_input_to_yojson x.function_input));
    ]

let operation_not_supported_exception_to_yojson (x : operation_not_supported_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_usage_profile_response_to_yojson (x : update_usage_profile_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let config_value_string_to_yojson = string_to_yojson
let allowed_values_string_list_to_yojson tree = list_to_yojson config_value_string_to_yojson tree

let configuration_object_to_yojson (x : configuration_object) =
  assoc_to_yojson
    [
      ("DefaultValue", option_to_yojson config_value_string_to_yojson x.default_value);
      ("AllowedValues", option_to_yojson allowed_values_string_list_to_yojson x.allowed_values);
      ("MinValue", option_to_yojson config_value_string_to_yojson x.min_value);
      ("MaxValue", option_to_yojson config_value_string_to_yojson x.max_value);
    ]

let configuration_map_to_yojson tree =
  map_to_yojson name_string_to_yojson configuration_object_to_yojson tree

let profile_configuration_to_yojson (x : profile_configuration) =
  assoc_to_yojson
    [
      ("SessionConfiguration", option_to_yojson configuration_map_to_yojson x.session_configuration);
      ("JobConfiguration", option_to_yojson configuration_map_to_yojson x.job_configuration);
    ]

let description_string_to_yojson = string_to_yojson

let update_usage_profile_request_to_yojson (x : update_usage_profile_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Configuration", Some (profile_configuration_to_yojson x.configuration));
    ]

let batch_window_to_yojson = int_to_yojson
let batch_size_to_yojson = int_to_yojson

let event_batching_condition_to_yojson (x : event_batching_condition) =
  assoc_to_yojson
    [
      ("BatchSize", Some (batch_size_to_yojson x.batch_size));
      ("BatchWindow", option_to_yojson batch_window_to_yojson x.batch_window);
    ]

let crawl_state_to_yojson (x : crawl_state) =
  match x with
  | RUNNING -> `String "RUNNING"
  | CANCELLING -> `String "CANCELLING"
  | CANCELLED -> `String "CANCELLED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | ERROR -> `String "ERROR"

let job_run_state_to_yojson (x : job_run_state) =
  match x with
  | STARTING -> `String "STARTING"
  | RUNNING -> `String "RUNNING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | TIMEOUT -> `String "TIMEOUT"
  | ERROR -> `String "ERROR"
  | WAITING -> `String "WAITING"
  | EXPIRED -> `String "EXPIRED"

let logical_operator_to_yojson (x : logical_operator) = match x with EQUALS -> `String "EQUALS"

let condition_to_yojson (x : condition) =
  assoc_to_yojson
    [
      ("LogicalOperator", option_to_yojson logical_operator_to_yojson x.logical_operator);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("State", option_to_yojson job_run_state_to_yojson x.state);
      ("CrawlerName", option_to_yojson name_string_to_yojson x.crawler_name);
      ("CrawlState", option_to_yojson crawl_state_to_yojson x.crawl_state);
    ]

let condition_list_to_yojson tree = list_to_yojson condition_to_yojson tree
let logical_to_yojson (x : logical) = match x with AND -> `String "AND" | ANY -> `String "ANY"

let predicate_to_yojson (x : predicate) =
  assoc_to_yojson
    [
      ("Logical", option_to_yojson logical_to_yojson x.logical);
      ("Conditions", option_to_yojson condition_list_to_yojson x.conditions);
    ]

let notify_delay_after_to_yojson = int_to_yojson

let notification_property_to_yojson (x : notification_property) =
  assoc_to_yojson
    [ ("NotifyDelayAfter", option_to_yojson notify_delay_after_to_yojson x.notify_delay_after) ]

let timeout_to_yojson = int_to_yojson

let generic_map_to_yojson tree =
  map_to_yojson generic_string_to_yojson generic_string_to_yojson tree

let action_to_yojson (x : action) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("Arguments", option_to_yojson generic_map_to_yojson x.arguments);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("CrawlerName", option_to_yojson name_string_to_yojson x.crawler_name);
    ]

let action_list_to_yojson tree = list_to_yojson action_to_yojson tree

let trigger_state_to_yojson (x : trigger_state) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | ACTIVATING -> `String "ACTIVATING"
  | ACTIVATED -> `String "ACTIVATED"
  | DEACTIVATING -> `String "DEACTIVATING"
  | DEACTIVATED -> `String "DEACTIVATED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"

let trigger_type_to_yojson (x : trigger_type) =
  match x with
  | SCHEDULED -> `String "SCHEDULED"
  | CONDITIONAL -> `String "CONDITIONAL"
  | ON_DEMAND -> `String "ON_DEMAND"
  | EVENT -> `String "EVENT"

let trigger_to_yojson (x : trigger) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("WorkflowName", option_to_yojson name_string_to_yojson x.workflow_name);
      ("Id", option_to_yojson id_string_to_yojson x.id);
      ("Type", option_to_yojson trigger_type_to_yojson x.type_);
      ("State", option_to_yojson trigger_state_to_yojson x.state);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Schedule", option_to_yojson generic_string_to_yojson x.schedule);
      ("Actions", option_to_yojson action_list_to_yojson x.actions);
      ("Predicate", option_to_yojson predicate_to_yojson x.predicate);
      ( "EventBatchingCondition",
        option_to_yojson event_batching_condition_to_yojson x.event_batching_condition );
    ]

let update_trigger_response_to_yojson (x : update_trigger_response) =
  assoc_to_yojson [ ("Trigger", option_to_yojson trigger_to_yojson x.trigger) ]

let trigger_update_to_yojson (x : trigger_update) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Schedule", option_to_yojson generic_string_to_yojson x.schedule);
      ("Actions", option_to_yojson action_list_to_yojson x.actions);
      ("Predicate", option_to_yojson predicate_to_yojson x.predicate);
      ( "EventBatchingCondition",
        option_to_yojson event_batching_condition_to_yojson x.event_batching_condition );
    ]

let update_trigger_request_to_yojson (x : update_trigger_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("TriggerUpdate", Some (trigger_update_to_yojson x.trigger_update));
    ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_table_optimizer_response_to_yojson = unit_to_yojson

let iceberg_orphan_file_deletion_configuration_to_yojson
    (x : iceberg_orphan_file_deletion_configuration) =
  assoc_to_yojson
    [
      ( "orphanFileRetentionPeriodInDays",
        option_to_yojson nullable_integer_to_yojson x.orphan_file_retention_period_in_days );
      ("location", option_to_yojson message_string_to_yojson x.location);
      ("runRateInHours", option_to_yojson nullable_integer_to_yojson x.run_rate_in_hours);
    ]

let orphan_file_deletion_configuration_to_yojson (x : orphan_file_deletion_configuration) =
  assoc_to_yojson
    [
      ( "icebergConfiguration",
        option_to_yojson iceberg_orphan_file_deletion_configuration_to_yojson
          x.iceberg_configuration );
    ]

let iceberg_retention_configuration_to_yojson (x : iceberg_retention_configuration) =
  assoc_to_yojson
    [
      ( "snapshotRetentionPeriodInDays",
        option_to_yojson nullable_integer_to_yojson x.snapshot_retention_period_in_days );
      ( "numberOfSnapshotsToRetain",
        option_to_yojson nullable_integer_to_yojson x.number_of_snapshots_to_retain );
      ("cleanExpiredFiles", option_to_yojson nullable_boolean_to_yojson x.clean_expired_files);
      ("runRateInHours", option_to_yojson nullable_integer_to_yojson x.run_rate_in_hours);
    ]

let retention_configuration_to_yojson (x : retention_configuration) =
  assoc_to_yojson
    [
      ( "icebergConfiguration",
        option_to_yojson iceberg_retention_configuration_to_yojson x.iceberg_configuration );
    ]

let compaction_strategy_to_yojson (x : compaction_strategy) =
  match x with BINPACK -> `String "binpack" | SORT -> `String "sort" | ZORDER -> `String "z-order"

let iceberg_compaction_configuration_to_yojson (x : iceberg_compaction_configuration) =
  assoc_to_yojson
    [
      ("strategy", option_to_yojson compaction_strategy_to_yojson x.strategy);
      ("minInputFiles", option_to_yojson nullable_integer_to_yojson x.min_input_files);
      ("deleteFileThreshold", option_to_yojson nullable_integer_to_yojson x.delete_file_threshold);
    ]

let compaction_configuration_to_yojson (x : compaction_configuration) =
  assoc_to_yojson
    [
      ( "icebergConfiguration",
        option_to_yojson iceberg_compaction_configuration_to_yojson x.iceberg_configuration );
    ]

let glue_connection_name_string_to_yojson = string_to_yojson

let table_optimizer_vpc_configuration_to_yojson (x : table_optimizer_vpc_configuration) =
  match x with
  | GlueConnectionName arg ->
      assoc_to_yojson [ ("glueConnectionName", Some (glue_connection_name_string_to_yojson arg)) ]

let arn_string_to_yojson = string_to_yojson

let table_optimizer_configuration_to_yojson (x : table_optimizer_configuration) =
  assoc_to_yojson
    [
      ("roleArn", option_to_yojson arn_string_to_yojson x.role_arn);
      ("enabled", option_to_yojson nullable_boolean_to_yojson x.enabled);
      ( "vpcConfiguration",
        option_to_yojson table_optimizer_vpc_configuration_to_yojson x.vpc_configuration );
      ( "compactionConfiguration",
        option_to_yojson compaction_configuration_to_yojson x.compaction_configuration );
      ( "retentionConfiguration",
        option_to_yojson retention_configuration_to_yojson x.retention_configuration );
      ( "orphanFileDeletionConfiguration",
        option_to_yojson orphan_file_deletion_configuration_to_yojson
          x.orphan_file_deletion_configuration );
    ]

let table_optimizer_type_to_yojson (x : table_optimizer_type) =
  match x with
  | COMPACTION -> `String "compaction"
  | RETENTION -> `String "retention"
  | ORPHAN_FILE_DELETION -> `String "orphan_file_deletion"

let update_table_optimizer_request_to_yojson (x : update_table_optimizer_request) =
  assoc_to_yojson
    [
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("Type", Some (table_optimizer_type_to_yojson x.type_));
      ( "TableOptimizerConfiguration",
        Some (table_optimizer_configuration_to_yojson x.table_optimizer_configuration) );
    ]

let resource_number_limit_exceeded_exception_to_yojson
    (x : resource_number_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let resource_not_ready_exception_to_yojson (x : resource_not_ready_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let federation_source_retryable_exception_to_yojson (x : federation_source_retryable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let federation_source_error_code_to_yojson (x : federation_source_error_code) =
  match x with
  | AccessDeniedException -> `String "AccessDeniedException"
  | EntityNotFoundException -> `String "EntityNotFoundException"
  | InvalidCredentialsException -> `String "InvalidCredentialsException"
  | InvalidInputException -> `String "InvalidInputException"
  | InvalidResponseException -> `String "InvalidResponseException"
  | OperationTimeoutException -> `String "OperationTimeoutException"
  | OperationNotSupportedException -> `String "OperationNotSupportedException"
  | InternalServiceException -> `String "InternalServiceException"
  | PartialFailureException -> `String "PartialFailureException"
  | ThrottlingException -> `String "ThrottlingException"

let federation_source_exception_to_yojson (x : federation_source_exception) =
  assoc_to_yojson
    [
      ( "FederationSourceErrorCode",
        option_to_yojson federation_source_error_code_to_yojson x.federation_source_error_code );
      ("Message", option_to_yojson message_string_to_yojson x.message);
    ]

let already_exists_exception_to_yojson (x : already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_table_response_to_yojson = unit_to_yojson
let encryption_key_id_string_to_yojson = string_to_yojson
let nullable_string_to_yojson = string_to_yojson

let string_to_string_map_to_yojson tree =
  map_to_yojson nullable_string_to_yojson nullable_string_to_yojson tree

let encrypted_key_metadata_string_to_yojson = string_to_yojson

let iceberg_encrypted_key_to_yojson (x : iceberg_encrypted_key) =
  assoc_to_yojson
    [
      ("KeyId", Some (encryption_key_id_string_to_yojson x.key_id));
      ( "EncryptedKeyMetadata",
        Some (encrypted_key_metadata_string_to_yojson x.encrypted_key_metadata) );
      ("EncryptedById", option_to_yojson encryption_key_id_string_to_yojson x.encrypted_by_id);
      ("Properties", option_to_yojson string_to_string_map_to_yojson x.properties);
    ]

let iceberg_update_action_to_yojson (x : iceberg_update_action) =
  match x with
  | ADD_SCHEMA -> `String "add-schema"
  | SET_CURRENT_SCHEMA -> `String "set-current-schema"
  | ADD_SPEC -> `String "add-spec"
  | SET_DEFAULT_SPEC -> `String "set-default-spec"
  | ADD_SORT_ORDER -> `String "add-sort-order"
  | SET_DEFAULT_SORT_ORDER -> `String "set-default-sort-order"
  | SET_LOCATION -> `String "set-location"
  | SET_PROPERTIES -> `String "set-properties"
  | REMOVE_PROPERTIES -> `String "remove-properties"
  | ADD_ENCRYPTION_KEY -> `String "add-encryption-key"
  | REMOVE_ENCRYPTION_KEY -> `String "remove-encryption-key"

let location_string_to_yojson = string_to_yojson

let iceberg_null_order_to_yojson (x : iceberg_null_order) =
  match x with NULLS_FIRST -> `String "nulls-first" | NULLS_LAST -> `String "nulls-last"

let iceberg_sort_direction_to_yojson (x : iceberg_sort_direction) =
  match x with ASC -> `String "asc" | DESC -> `String "desc"

let iceberg_transform_string_to_yojson = string_to_yojson
let integer_to_yojson = int_to_yojson

let iceberg_sort_field_to_yojson (x : iceberg_sort_field) =
  assoc_to_yojson
    [
      ("SourceId", Some (integer_to_yojson x.source_id));
      ("Transform", Some (iceberg_transform_string_to_yojson x.transform));
      ("Direction", Some (iceberg_sort_direction_to_yojson x.direction));
      ("NullOrder", Some (iceberg_null_order_to_yojson x.null_order));
    ]

let iceberg_sort_order_field_list_to_yojson tree = list_to_yojson iceberg_sort_field_to_yojson tree

let iceberg_sort_order_to_yojson (x : iceberg_sort_order) =
  assoc_to_yojson
    [
      ("OrderId", Some (integer_to_yojson x.order_id));
      ("Fields", Some (iceberg_sort_order_field_list_to_yojson x.fields));
    ]

let column_name_string_to_yojson = string_to_yojson

let iceberg_partition_field_to_yojson (x : iceberg_partition_field) =
  assoc_to_yojson
    [
      ("SourceId", Some (integer_to_yojson x.source_id));
      ("Transform", Some (iceberg_transform_string_to_yojson x.transform));
      ("Name", Some (column_name_string_to_yojson x.name));
      ("FieldId", option_to_yojson integer_to_yojson x.field_id);
    ]

let iceberg_partition_spec_field_list_to_yojson tree =
  list_to_yojson iceberg_partition_field_to_yojson tree

let iceberg_partition_spec_to_yojson (x : iceberg_partition_spec) =
  assoc_to_yojson
    [
      ("Fields", Some (iceberg_partition_spec_field_list_to_yojson x.fields));
      ("SpecId", option_to_yojson integer_to_yojson x.spec_id);
    ]

let iceberg_document_to_yojson = json_to_yojson
let comment_string_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson

let iceberg_struct_field_to_yojson (x : iceberg_struct_field) =
  assoc_to_yojson
    [
      ("Id", Some (integer_to_yojson x.id));
      ("Name", Some (column_name_string_to_yojson x.name));
      ("Type", Some (iceberg_document_to_yojson x.type_));
      ("Required", Some (boolean__to_yojson x.required));
      ("Doc", option_to_yojson comment_string_to_yojson x.doc);
      ("InitialDefault", option_to_yojson iceberg_document_to_yojson x.initial_default);
      ("WriteDefault", option_to_yojson iceberg_document_to_yojson x.write_default);
    ]

let iceberg_struct_field_list_to_yojson tree = list_to_yojson iceberg_struct_field_to_yojson tree

let iceberg_struct_type_enum_to_yojson (x : iceberg_struct_type_enum) =
  match x with STRUCT -> `String "struct"

let integer_list_to_yojson tree = list_to_yojson integer_to_yojson tree

let iceberg_schema_to_yojson (x : iceberg_schema) =
  assoc_to_yojson
    [
      ("SchemaId", option_to_yojson integer_to_yojson x.schema_id);
      ("IdentifierFieldIds", option_to_yojson integer_list_to_yojson x.identifier_field_ids);
      ("Type", option_to_yojson iceberg_struct_type_enum_to_yojson x.type_);
      ("Fields", Some (iceberg_struct_field_list_to_yojson x.fields));
    ]

let iceberg_table_update_to_yojson (x : iceberg_table_update) =
  assoc_to_yojson
    [
      ("Schema", Some (iceberg_schema_to_yojson x.schema));
      ("PartitionSpec", option_to_yojson iceberg_partition_spec_to_yojson x.partition_spec);
      ("SortOrder", option_to_yojson iceberg_sort_order_to_yojson x.sort_order);
      ("Location", Some (location_string_to_yojson x.location));
      ("Properties", option_to_yojson string_to_string_map_to_yojson x.properties);
      ("Action", option_to_yojson iceberg_update_action_to_yojson x.action);
      ("EncryptionKey", option_to_yojson iceberg_encrypted_key_to_yojson x.encryption_key);
      ("KeyId", option_to_yojson encryption_key_id_string_to_yojson x.key_id);
    ]

let iceberg_table_update_list_to_yojson tree = list_to_yojson iceberg_table_update_to_yojson tree

let update_iceberg_table_input_to_yojson (x : update_iceberg_table_input) =
  assoc_to_yojson [ ("Updates", Some (iceberg_table_update_list_to_yojson x.updates)) ]

let update_iceberg_input_to_yojson (x : update_iceberg_input) =
  assoc_to_yojson
    [
      ( "UpdateIcebergTableInput",
        Some (update_iceberg_table_input_to_yojson x.update_iceberg_table_input) );
    ]

let update_open_table_format_input_to_yojson (x : update_open_table_format_input) =
  assoc_to_yojson
    [
      ("UpdateIcebergInput", option_to_yojson update_iceberg_input_to_yojson x.update_iceberg_input);
    ]

let view_update_action_to_yojson (x : view_update_action) =
  match x with
  | ADD -> `String "ADD"
  | REPLACE -> `String "REPLACE"
  | ADD_OR_REPLACE -> `String "ADD_OR_REPLACE"
  | DROP -> `String "DROP"

let version_string_to_yojson = string_to_yojson
let transaction_id_string_to_yojson = string_to_yojson
let boolean_nullable_to_yojson = bool_to_yojson
let table_version_id_to_yojson = long_to_yojson
let view_sub_object_version_ids_list_to_yojson tree = list_to_yojson table_version_id_to_yojson tree
let view_sub_objects_list_to_yojson tree = list_to_yojson arn_string_to_yojson tree

let last_refresh_type_to_yojson (x : last_refresh_type) =
  match x with FULL -> `String "FULL" | INCREMENTAL -> `String "INCREMENTAL"

let refresh_seconds_to_yojson = long_to_yojson
let view_text_string_to_yojson = string_to_yojson
let view_dialect_version_string_to_yojson = string_to_yojson

let view_dialect_to_yojson (x : view_dialect) =
  match x with
  | REDSHIFT -> `String "REDSHIFT"
  | ATHENA -> `String "ATHENA"
  | SPARK -> `String "SPARK"

let view_representation_input_to_yojson (x : view_representation_input) =
  assoc_to_yojson
    [
      ("Dialect", option_to_yojson view_dialect_to_yojson x.dialect);
      ("DialectVersion", option_to_yojson view_dialect_version_string_to_yojson x.dialect_version);
      ("ViewOriginalText", option_to_yojson view_text_string_to_yojson x.view_original_text);
      ("ValidationConnection", option_to_yojson name_string_to_yojson x.validation_connection);
      ("ViewExpandedText", option_to_yojson view_text_string_to_yojson x.view_expanded_text);
    ]

let view_representation_input_list_to_yojson tree =
  list_to_yojson view_representation_input_to_yojson tree

let view_definition_input_to_yojson (x : view_definition_input) =
  assoc_to_yojson
    [
      ("IsProtected", option_to_yojson nullable_boolean_to_yojson x.is_protected);
      ("Definer", option_to_yojson arn_string_to_yojson x.definer);
      ( "Representations",
        option_to_yojson view_representation_input_list_to_yojson x.representations );
      ("ViewVersionId", option_to_yojson table_version_id_to_yojson x.view_version_id);
      ("ViewVersionToken", option_to_yojson version_string_to_yojson x.view_version_token);
      ("RefreshSeconds", option_to_yojson refresh_seconds_to_yojson x.refresh_seconds);
      ("LastRefreshType", option_to_yojson last_refresh_type_to_yojson x.last_refresh_type);
      ("SubObjects", option_to_yojson view_sub_objects_list_to_yojson x.sub_objects);
      ( "SubObjectVersionIds",
        option_to_yojson view_sub_object_version_ids_list_to_yojson x.sub_object_version_ids );
    ]

let table_identifier_to_yojson (x : table_identifier) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Region", option_to_yojson name_string_to_yojson x.region);
    ]

let parameters_map_value_to_yojson = string_to_yojson
let key_string_to_yojson = string_to_yojson

let parameters_map_to_yojson tree =
  map_to_yojson key_string_to_yojson parameters_map_value_to_yojson tree

let table_type_string_to_yojson = string_to_yojson
let column_type_string_to_yojson = string_to_yojson

let column_to_yojson (x : column) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Type", option_to_yojson column_type_string_to_yojson x.type_);
      ("Comment", option_to_yojson comment_string_to_yojson x.comment);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
    ]

let column_list_to_yojson tree = list_to_yojson column_to_yojson tree
let version_long_number_to_yojson = long_to_yojson
let schema_version_id_string_to_yojson = string_to_yojson
let schema_registry_name_string_to_yojson = string_to_yojson
let glue_resource_arn_to_yojson = string_to_yojson

let schema_id_to_yojson (x : schema_id) =
  assoc_to_yojson
    [
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
    ]

let schema_reference_to_yojson (x : schema_reference) =
  assoc_to_yojson
    [
      ("SchemaId", option_to_yojson schema_id_to_yojson x.schema_id);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("SchemaVersionNumber", option_to_yojson version_long_number_to_yojson x.schema_version_number);
    ]

let column_values_string_to_yojson = string_to_yojson

let location_map_to_yojson tree =
  map_to_yojson column_values_string_to_yojson column_values_string_to_yojson tree

let column_value_string_list_to_yojson tree = list_to_yojson column_values_string_to_yojson tree
let name_string_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let skewed_info_to_yojson (x : skewed_info) =
  assoc_to_yojson
    [
      ("SkewedColumnNames", option_to_yojson name_string_list_to_yojson x.skewed_column_names);
      ( "SkewedColumnValues",
        option_to_yojson column_value_string_list_to_yojson x.skewed_column_values );
      ( "SkewedColumnValueLocationMaps",
        option_to_yojson location_map_to_yojson x.skewed_column_value_location_maps );
    ]

let integer_flag_to_yojson = int_to_yojson

let order_to_yojson (x : order) =
  assoc_to_yojson
    [
      ("Column", Some (name_string_to_yojson x.column));
      ("SortOrder", Some (integer_flag_to_yojson x.sort_order));
    ]

let order_list_to_yojson tree = list_to_yojson order_to_yojson tree

let ser_de_info_to_yojson (x : ser_de_info) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("SerializationLibrary", option_to_yojson name_string_to_yojson x.serialization_library);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
    ]

let format_string_to_yojson = string_to_yojson
let location_string_list_to_yojson tree = list_to_yojson location_string_to_yojson tree

let storage_descriptor_to_yojson (x : storage_descriptor) =
  assoc_to_yojson
    [
      ("Columns", option_to_yojson column_list_to_yojson x.columns);
      ("Location", option_to_yojson location_string_to_yojson x.location);
      ("AdditionalLocations", option_to_yojson location_string_list_to_yojson x.additional_locations);
      ("InputFormat", option_to_yojson format_string_to_yojson x.input_format);
      ("OutputFormat", option_to_yojson format_string_to_yojson x.output_format);
      ("Compressed", option_to_yojson boolean__to_yojson x.compressed);
      ("NumberOfBuckets", option_to_yojson integer_to_yojson x.number_of_buckets);
      ("SerdeInfo", option_to_yojson ser_de_info_to_yojson x.serde_info);
      ("BucketColumns", option_to_yojson name_string_list_to_yojson x.bucket_columns);
      ("SortColumns", option_to_yojson order_list_to_yojson x.sort_columns);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("SkewedInfo", option_to_yojson skewed_info_to_yojson x.skewed_info);
      ("StoredAsSubDirectories", option_to_yojson boolean__to_yojson x.stored_as_sub_directories);
      ("SchemaReference", option_to_yojson schema_reference_to_yojson x.schema_reference);
    ]

let non_negative_integer_to_yojson = int_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let table_input_to_yojson (x : table_input) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Owner", option_to_yojson name_string_to_yojson x.owner);
      ("LastAccessTime", option_to_yojson timestamp_to_yojson x.last_access_time);
      ("LastAnalyzedTime", option_to_yojson timestamp_to_yojson x.last_analyzed_time);
      ("Retention", option_to_yojson non_negative_integer_to_yojson x.retention);
      ("StorageDescriptor", option_to_yojson storage_descriptor_to_yojson x.storage_descriptor);
      ("PartitionKeys", option_to_yojson column_list_to_yojson x.partition_keys);
      ("ViewOriginalText", option_to_yojson view_text_string_to_yojson x.view_original_text);
      ("ViewExpandedText", option_to_yojson view_text_string_to_yojson x.view_expanded_text);
      ("TableType", option_to_yojson table_type_string_to_yojson x.table_type);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("TargetTable", option_to_yojson table_identifier_to_yojson x.target_table);
      ("ViewDefinition", option_to_yojson view_definition_input_to_yojson x.view_definition);
    ]

let update_table_request_to_yojson (x : update_table_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("TableInput", option_to_yojson table_input_to_yojson x.table_input);
      ("SkipArchive", option_to_yojson boolean_nullable_to_yojson x.skip_archive);
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ("VersionId", option_to_yojson version_string_to_yojson x.version_id);
      ("ViewUpdateAction", option_to_yojson view_update_action_to_yojson x.view_update_action);
      ("Force", option_to_yojson boolean__to_yojson x.force);
      ( "UpdateOpenTableFormatInput",
        option_to_yojson update_open_table_format_input_to_yojson x.update_open_table_format_input
      );
    ]

let update_source_control_from_job_response_to_yojson (x : update_source_control_from_job_response)
    =
  assoc_to_yojson [ ("JobName", option_to_yojson name_string_to_yojson x.job_name) ]

let auth_token_string_to_yojson = string_to_yojson

let source_control_auth_strategy_to_yojson (x : source_control_auth_strategy) =
  match x with
  | PERSONAL_ACCESS_TOKEN -> `String "PERSONAL_ACCESS_TOKEN"
  | AWS_SECRETS_MANAGER -> `String "AWS_SECRETS_MANAGER"

let commit_id_string_to_yojson = string_to_yojson

let source_control_provider_to_yojson (x : source_control_provider) =
  match x with
  | GITHUB -> `String "GITHUB"
  | GITLAB -> `String "GITLAB"
  | BITBUCKET -> `String "BITBUCKET"
  | AWS_CODE_COMMIT -> `String "AWS_CODE_COMMIT"

let update_source_control_from_job_request_to_yojson (x : update_source_control_from_job_request) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("Provider", option_to_yojson source_control_provider_to_yojson x.provider);
      ("RepositoryName", option_to_yojson name_string_to_yojson x.repository_name);
      ("RepositoryOwner", option_to_yojson name_string_to_yojson x.repository_owner);
      ("BranchName", option_to_yojson name_string_to_yojson x.branch_name);
      ("Folder", option_to_yojson name_string_to_yojson x.folder);
      ("CommitId", option_to_yojson commit_id_string_to_yojson x.commit_id);
      ("AuthStrategy", option_to_yojson source_control_auth_strategy_to_yojson x.auth_strategy);
      ("AuthToken", option_to_yojson auth_token_string_to_yojson x.auth_token);
    ]

let update_schema_response_to_yojson (x : update_schema_response) =
  assoc_to_yojson
    [
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
    ]

let compatibility_to_yojson (x : compatibility) =
  match x with
  | NONE -> `String "NONE"
  | DISABLED -> `String "DISABLED"
  | BACKWARD -> `String "BACKWARD"
  | BACKWARD_ALL -> `String "BACKWARD_ALL"
  | FORWARD -> `String "FORWARD"
  | FORWARD_ALL -> `String "FORWARD_ALL"
  | FULL -> `String "FULL"
  | FULL_ALL -> `String "FULL_ALL"

let latest_schema_version_boolean_to_yojson = bool_to_yojson

let schema_version_number_to_yojson (x : schema_version_number) =
  assoc_to_yojson
    [
      ("LatestVersion", option_to_yojson latest_schema_version_boolean_to_yojson x.latest_version);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
    ]

let update_schema_input_to_yojson (x : update_schema_input) =
  assoc_to_yojson
    [
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
      ( "SchemaVersionNumber",
        option_to_yojson schema_version_number_to_yojson x.schema_version_number );
      ("Compatibility", option_to_yojson compatibility_to_yojson x.compatibility);
      ("Description", option_to_yojson description_string_to_yojson x.description);
    ]

let update_registry_response_to_yojson (x : update_registry_response) =
  assoc_to_yojson
    [
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
    ]

let registry_id_to_yojson (x : registry_id) =
  assoc_to_yojson
    [
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
    ]

let update_registry_input_to_yojson (x : update_registry_input) =
  assoc_to_yojson
    [
      ("RegistryId", Some (registry_id_to_yojson x.registry_id));
      ("Description", Some (description_string_to_yojson x.description));
    ]

let update_partition_response_to_yojson = unit_to_yojson
let value_string_to_yojson = string_to_yojson
let value_string_list_to_yojson tree = list_to_yojson value_string_to_yojson tree

let partition_input_to_yojson (x : partition_input) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson value_string_list_to_yojson x.values);
      ("LastAccessTime", option_to_yojson timestamp_to_yojson x.last_access_time);
      ("StorageDescriptor", option_to_yojson storage_descriptor_to_yojson x.storage_descriptor);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("LastAnalyzedTime", option_to_yojson timestamp_to_yojson x.last_analyzed_time);
    ]

let bounded_partition_value_list_to_yojson tree = list_to_yojson value_string_to_yojson tree

let update_partition_request_to_yojson (x : update_partition_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("PartitionValueList", Some (bounded_partition_value_list_to_yojson x.partition_value_list));
      ("PartitionInput", Some (partition_input_to_yojson x.partition_input));
    ]

let hash_string_to_yojson = string_to_yojson

let update_ml_transform_response_to_yojson (x : update_ml_transform_response) =
  assoc_to_yojson [ ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id) ]

let worker_type_to_yojson (x : worker_type) =
  match x with
  | Standard -> `String "Standard"
  | G_1X -> `String "G.1X"
  | G_2X -> `String "G.2X"
  | G_025X -> `String "G.025X"
  | G_4X -> `String "G.4X"
  | G_8X -> `String "G.8X"
  | Z_2X -> `String "Z.2X"

let nullable_double_to_yojson = double_to_yojson
let glue_version_string_to_yojson = string_to_yojson
let role_string_to_yojson = string_to_yojson
let generic_bounded_double_to_yojson = double_to_yojson

let find_matches_parameters_to_yojson (x : find_matches_parameters) =
  assoc_to_yojson
    [
      ( "PrimaryKeyColumnName",
        option_to_yojson column_name_string_to_yojson x.primary_key_column_name );
      ( "PrecisionRecallTradeoff",
        option_to_yojson generic_bounded_double_to_yojson x.precision_recall_tradeoff );
      ( "AccuracyCostTradeoff",
        option_to_yojson generic_bounded_double_to_yojson x.accuracy_cost_tradeoff );
      ( "EnforceProvidedLabels",
        option_to_yojson nullable_boolean_to_yojson x.enforce_provided_labels );
    ]

let transform_type_to_yojson (x : transform_type) =
  match x with FIND_MATCHES -> `String "FIND_MATCHES"

let transform_parameters_to_yojson (x : transform_parameters) =
  assoc_to_yojson
    [
      ("TransformType", Some (transform_type_to_yojson x.transform_type));
      ( "FindMatchesParameters",
        option_to_yojson find_matches_parameters_to_yojson x.find_matches_parameters );
    ]

let update_ml_transform_request_to_yojson (x : update_ml_transform_request) =
  assoc_to_yojson
    [
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Parameters", option_to_yojson transform_parameters_to_yojson x.parameters);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("MaxRetries", option_to_yojson nullable_integer_to_yojson x.max_retries);
    ]

let update_job_from_source_control_response_to_yojson (x : update_job_from_source_control_response)
    =
  assoc_to_yojson [ ("JobName", option_to_yojson name_string_to_yojson x.job_name) ]

let update_job_from_source_control_request_to_yojson (x : update_job_from_source_control_request) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("Provider", option_to_yojson source_control_provider_to_yojson x.provider);
      ("RepositoryName", option_to_yojson name_string_to_yojson x.repository_name);
      ("RepositoryOwner", option_to_yojson name_string_to_yojson x.repository_owner);
      ("BranchName", option_to_yojson name_string_to_yojson x.branch_name);
      ("Folder", option_to_yojson name_string_to_yojson x.folder);
      ("CommitId", option_to_yojson commit_id_string_to_yojson x.commit_id);
      ("AuthStrategy", option_to_yojson source_control_auth_strategy_to_yojson x.auth_strategy);
      ("AuthToken", option_to_yojson auth_token_string_to_yojson x.auth_token);
    ]

let update_job_response_to_yojson (x : update_job_response) =
  assoc_to_yojson [ ("JobName", option_to_yojson name_string_to_yojson x.job_name) ]

let maintenance_window_to_yojson = string_to_yojson
let generic512_char_string_to_yojson = string_to_yojson

let source_control_details_to_yojson (x : source_control_details) =
  assoc_to_yojson
    [
      ("Provider", option_to_yojson source_control_provider_to_yojson x.provider);
      ("Repository", option_to_yojson generic512_char_string_to_yojson x.repository);
      ("Owner", option_to_yojson generic512_char_string_to_yojson x.owner);
      ("Branch", option_to_yojson generic512_char_string_to_yojson x.branch);
      ("Folder", option_to_yojson generic512_char_string_to_yojson x.folder);
      ("LastCommitId", option_to_yojson generic512_char_string_to_yojson x.last_commit_id);
      ("AuthStrategy", option_to_yojson source_control_auth_strategy_to_yojson x.auth_strategy);
      ("AuthToken", option_to_yojson generic512_char_string_to_yojson x.auth_token);
    ]

let execution_class_to_yojson (x : execution_class) =
  match x with FLEX -> `String "FLEX" | STANDARD -> `String "STANDARD"

let glue_studio_column_name_string_to_yojson = string_to_yojson

let glue_studio_schema_column_to_yojson (x : glue_studio_schema_column) =
  assoc_to_yojson
    [
      ("Name", Some (glue_studio_column_name_string_to_yojson x.name));
      ("Type", option_to_yojson column_type_string_to_yojson x.type_);
      ("GlueStudioType", option_to_yojson column_type_string_to_yojson x.glue_studio_type);
    ]

let glue_studio_schema_column_list_to_yojson tree =
  list_to_yojson glue_studio_schema_column_to_yojson tree

let glue_schema_to_yojson (x : glue_schema) =
  assoc_to_yojson
    [ ("Columns", option_to_yojson glue_studio_schema_column_list_to_yojson x.columns) ]

let glue_schemas_to_yojson tree = list_to_yojson glue_schema_to_yojson tree
let enclosed_in_string_property_to_yojson = string_to_yojson
let boolean_value_to_yojson = bool_to_yojson

let ddb_export_type_to_yojson (x : ddb_export_type) =
  match x with Ddb -> `String "ddb" | S3 -> `String "s3"

let ddbelt_connection_options_to_yojson (x : ddbelt_connection_options) =
  assoc_to_yojson
    [
      ("DynamodbExport", option_to_yojson ddb_export_type_to_yojson x.dynamodb_export);
      ("DynamodbUnnestDDBJson", option_to_yojson boolean_value_to_yojson x.dynamodb_unnest_ddb_json);
      ("DynamodbTableArn", Some (enclosed_in_string_property_to_yojson x.dynamodb_table_arn));
      ( "DynamodbS3Bucket",
        option_to_yojson enclosed_in_string_property_to_yojson x.dynamodb_s3_bucket );
      ( "DynamodbS3Prefix",
        option_to_yojson enclosed_in_string_property_to_yojson x.dynamodb_s3_prefix );
      ( "DynamodbS3BucketOwner",
        option_to_yojson enclosed_in_string_property_to_yojson x.dynamodb_s3_bucket_owner );
      ( "DynamodbStsRoleArn",
        option_to_yojson enclosed_in_string_property_to_yojson x.dynamodb_sts_role_arn );
    ]

let node_name_to_yojson = string_to_yojson

let dynamo_dbelt_connector_source_to_yojson (x : dynamo_dbelt_connector_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ( "ConnectionOptions",
        option_to_yojson ddbelt_connection_options_to_yojson x.connection_options );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let auto_data_quality_to_yojson (x : auto_data_quality) =
  assoc_to_yojson
    [
      ("IsEnabled", option_to_yojson boolean_value_to_yojson x.is_enabled);
      ( "EvaluationContext",
        option_to_yojson enclosed_in_string_property_to_yojson x.evaluation_context );
    ]

let update_catalog_behavior_to_yojson (x : update_catalog_behavior) =
  match x with UPDATE_IN_DATABASE -> `String "UPDATE_IN_DATABASE" | LOG -> `String "LOG"

let boxed_boolean_to_yojson = bool_to_yojson

let direct_schema_change_policy_to_yojson (x : direct_schema_change_policy) =
  assoc_to_yojson
    [
      ("EnableUpdateCatalog", option_to_yojson boxed_boolean_to_yojson x.enable_update_catalog);
      ("UpdateBehavior", option_to_yojson update_catalog_behavior_to_yojson x.update_behavior);
      ("Table", option_to_yojson enclosed_in_string_property_to_yojson x.table);
      ("Database", option_to_yojson enclosed_in_string_property_to_yojson x.database);
    ]

let hyper_target_compression_type_to_yojson (x : hyper_target_compression_type) =
  match x with UNCOMPRESSED -> `String "uncompressed"

let enclosed_in_string_properties_to_yojson tree =
  list_to_yojson enclosed_in_string_property_to_yojson tree

let glue_studio_path_list_to_yojson tree =
  list_to_yojson enclosed_in_string_properties_to_yojson tree

let target_format_to_yojson (x : target_format) =
  match x with
  | JSON -> `String "json"
  | CSV -> `String "csv"
  | AVRO -> `String "avro"
  | ORC -> `String "orc"
  | PARQUET -> `String "parquet"
  | HUDI -> `String "hudi"
  | DELTA -> `String "delta"
  | ICEBERG -> `String "iceberg"
  | HYPER -> `String "hyper"
  | XML -> `String "xml"

let node_id_to_yojson = string_to_yojson
let one_input_to_yojson tree = list_to_yojson node_id_to_yojson tree

let s3_hyper_direct_target_to_yojson (x : s3_hyper_direct_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Format", option_to_yojson target_format_to_yojson x.format);
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("Compression", option_to_yojson hyper_target_compression_type_to_yojson x.compression);
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let boxed_non_negative_int_to_yojson = int_to_yojson
let boxed_long_to_yojson = long_to_yojson

let s3_direct_source_additional_options_to_yojson (x : s3_direct_source_additional_options) =
  assoc_to_yojson
    [
      ("BoundedSize", option_to_yojson boxed_long_to_yojson x.bounded_size);
      ("BoundedFiles", option_to_yojson boxed_long_to_yojson x.bounded_files);
      ("EnableSamplePath", option_to_yojson boxed_boolean_to_yojson x.enable_sample_path);
      ("SamplePath", option_to_yojson enclosed_in_string_property_to_yojson x.sample_path);
    ]

let parquet_compression_type_to_yojson (x : parquet_compression_type) =
  match x with
  | SNAPPY -> `String "snappy"
  | LZO -> `String "lzo"
  | GZIP -> `String "gzip"
  | BROTLI -> `String "brotli"
  | LZ4 -> `String "lz4"
  | UNCOMPRESSED -> `String "uncompressed"
  | NONE -> `String "none"

let s3_excel_source_to_yojson (x : s3_excel_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ("CompressionType", option_to_yojson parquet_compression_type_to_yojson x.compression_type);
      ("Exclusions", option_to_yojson enclosed_in_string_properties_to_yojson x.exclusions);
      ("GroupSize", option_to_yojson enclosed_in_string_property_to_yojson x.group_size);
      ("GroupFiles", option_to_yojson enclosed_in_string_property_to_yojson x.group_files);
      ("Recurse", option_to_yojson boxed_boolean_to_yojson x.recurse);
      ("MaxBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_band);
      ("MaxFilesInBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_files_in_band);
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ("NumberRows", option_to_yojson boxed_long_to_yojson x.number_rows);
      ("SkipFooter", option_to_yojson boxed_non_negative_int_to_yojson x.skip_footer);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let number_target_partitions_string_to_yojson = string_to_yojson

let iceberg_target_compression_type_to_yojson (x : iceberg_target_compression_type) =
  match x with
  | GZIP -> `String "gzip"
  | LZO -> `String "lzo"
  | UNCOMPRESSED -> `String "uncompressed"
  | SNAPPY -> `String "snappy"

let additional_options_to_yojson tree =
  map_to_yojson enclosed_in_string_property_to_yojson enclosed_in_string_property_to_yojson tree

let s3_iceberg_direct_target_to_yojson (x : s3_iceberg_direct_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("Format", Some (target_format_to_yojson x.format));
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ("Compression", Some (iceberg_target_compression_type_to_yojson x.compression));
      ( "NumberTargetPartitions",
        option_to_yojson number_target_partitions_string_to_yojson x.number_target_partitions );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let catalog_schema_change_policy_to_yojson (x : catalog_schema_change_policy) =
  assoc_to_yojson
    [
      ("EnableUpdateCatalog", option_to_yojson boxed_boolean_to_yojson x.enable_update_catalog);
      ("UpdateBehavior", option_to_yojson update_catalog_behavior_to_yojson x.update_behavior);
    ]

let s3_iceberg_catalog_target_to_yojson (x : s3_iceberg_catalog_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ( "SchemaChangePolicy",
        option_to_yojson catalog_schema_change_policy_to_yojson x.schema_change_policy );
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
    ]

let catalog_iceberg_source_to_yojson (x : catalog_iceberg_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ( "AdditionalIcebergOptions",
        option_to_yojson additional_options_to_yojson x.additional_iceberg_options );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let s3_catalog_iceberg_source_to_yojson (x : s3_catalog_iceberg_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ( "AdditionalIcebergOptions",
        option_to_yojson additional_options_to_yojson x.additional_iceberg_options );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let connector_options_to_yojson tree =
  map_to_yojson generic_string_to_yojson generic_string_to_yojson tree

let connector_data_target_to_yojson (x : connector_data_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("Data", Some (connector_options_to_yojson x.data));
      ("Inputs", option_to_yojson one_input_to_yojson x.inputs);
    ]

let connector_data_source_to_yojson (x : connector_data_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("Data", Some (connector_options_to_yojson x.data));
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let option__to_yojson (x : option_) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson enclosed_in_string_property_to_yojson x.value);
      ("Label", option_to_yojson enclosed_in_string_property_to_yojson x.label);
      ("Description", option_to_yojson enclosed_in_string_property_to_yojson x.description);
    ]

let option_list_to_yojson tree = list_to_yojson option__to_yojson tree
let generic_limited_string_to_yojson = string_to_yojson

let snowflake_node_data_to_yojson (x : snowflake_node_data) =
  assoc_to_yojson
    [
      ("SourceType", option_to_yojson generic_limited_string_to_yojson x.source_type);
      ("Connection", option_to_yojson option__to_yojson x.connection);
      ("Schema", option_to_yojson generic_string_to_yojson x.schema);
      ("Table", option_to_yojson generic_string_to_yojson x.table);
      ("Database", option_to_yojson generic_string_to_yojson x.database);
      ("TempDir", option_to_yojson enclosed_in_string_property_to_yojson x.temp_dir);
      ("IamRole", option_to_yojson option__to_yojson x.iam_role);
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("SampleQuery", option_to_yojson generic_string_to_yojson x.sample_query);
      ("PreAction", option_to_yojson generic_string_to_yojson x.pre_action);
      ("PostAction", option_to_yojson generic_string_to_yojson x.post_action);
      ("Action", option_to_yojson generic_string_to_yojson x.action);
      ("Upsert", option_to_yojson boolean_value_to_yojson x.upsert);
      ("MergeAction", option_to_yojson generic_limited_string_to_yojson x.merge_action);
      ("MergeWhenMatched", option_to_yojson generic_limited_string_to_yojson x.merge_when_matched);
      ( "MergeWhenNotMatched",
        option_to_yojson generic_limited_string_to_yojson x.merge_when_not_matched );
      ("MergeClause", option_to_yojson generic_string_to_yojson x.merge_clause);
      ("StagingTable", option_to_yojson generic_string_to_yojson x.staging_table);
      ("SelectedColumns", option_to_yojson option_list_to_yojson x.selected_columns);
      ("AutoPushdown", option_to_yojson boolean_value_to_yojson x.auto_pushdown);
      ("TableSchema", option_to_yojson option_list_to_yojson x.table_schema);
    ]

let snowflake_target_to_yojson (x : snowflake_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Data", Some (snowflake_node_data_to_yojson x.data));
      ("Inputs", option_to_yojson one_input_to_yojson x.inputs);
    ]

let snowflake_source_to_yojson (x : snowflake_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Data", Some (snowflake_node_data_to_yojson x.data));
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let target_column_to_yojson = string_to_yojson
let databrew_condition_value_to_yojson = string_to_yojson
let databrew_condition_to_yojson = string_to_yojson

let condition_expression_to_yojson (x : condition_expression) =
  assoc_to_yojson
    [
      ("Condition", Some (databrew_condition_to_yojson x.condition));
      ("Value", option_to_yojson databrew_condition_value_to_yojson x.value);
      ("TargetColumn", Some (target_column_to_yojson x.target_column));
    ]

let condition_expression_list_to_yojson tree = list_to_yojson condition_expression_to_yojson tree
let parameter_value_to_yojson = string_to_yojson
let parameter_name_to_yojson = string_to_yojson

let parameter_map_to_yojson tree =
  map_to_yojson parameter_name_to_yojson parameter_value_to_yojson tree

let operation_to_yojson = string_to_yojson

let recipe_action_to_yojson (x : recipe_action) =
  assoc_to_yojson
    [
      ("Operation", Some (operation_to_yojson x.operation));
      ("Parameters", option_to_yojson parameter_map_to_yojson x.parameters);
    ]

let recipe_step_to_yojson (x : recipe_step) =
  assoc_to_yojson
    [
      ("Action", Some (recipe_action_to_yojson x.action));
      ( "ConditionExpressions",
        option_to_yojson condition_expression_list_to_yojson x.condition_expressions );
    ]

let recipe_steps_to_yojson tree = list_to_yojson recipe_step_to_yojson tree
let recipe_version_to_yojson = string_to_yojson

let recipe_reference_to_yojson (x : recipe_reference) =
  assoc_to_yojson
    [
      ("RecipeArn", Some (enclosed_in_string_property_to_yojson x.recipe_arn));
      ("RecipeVersion", Some (recipe_version_to_yojson x.recipe_version));
    ]

let recipe_to_yojson (x : recipe) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("RecipeReference", option_to_yojson recipe_reference_to_yojson x.recipe_reference);
      ("RecipeSteps", option_to_yojson recipe_steps_to_yojson x.recipe_steps);
    ]

let dq_stop_job_on_failure_timing_to_yojson (x : dq_stop_job_on_failure_timing) =
  match x with Immediate -> `String "Immediate" | AfterDataLoad -> `String "AfterDataLoad"

let dq_stop_job_on_failure_options_to_yojson (x : dq_stop_job_on_failure_options) =
  assoc_to_yojson
    [
      ( "StopJobOnFailureTiming",
        option_to_yojson dq_stop_job_on_failure_timing_to_yojson x.stop_job_on_failure_timing );
    ]

let additional_option_keys_to_yojson (x : additional_option_keys) =
  match x with
  | CacheOption -> `String "performanceTuning.caching"
  | ObservationsOption -> `String "observations.scope"
  | CompositeOption -> `String "compositeRuleEvaluation.method"

let dq_additional_options_to_yojson tree =
  map_to_yojson additional_option_keys_to_yojson generic_string_to_yojson tree

let dq_results_publishing_options_to_yojson (x : dq_results_publishing_options) =
  assoc_to_yojson
    [
      ("EvaluationContext", option_to_yojson generic_limited_string_to_yojson x.evaluation_context);
      ("ResultsS3Prefix", option_to_yojson enclosed_in_string_property_to_yojson x.results_s3_prefix);
      ( "CloudWatchMetricsEnabled",
        option_to_yojson boxed_boolean_to_yojson x.cloud_watch_metrics_enabled );
      ( "ResultsPublishingEnabled",
        option_to_yojson boxed_boolean_to_yojson x.results_publishing_enabled );
    ]

let dqdl_string_to_yojson = string_to_yojson

let dqdl_aliases_to_yojson tree =
  map_to_yojson node_name_to_yojson enclosed_in_string_property_to_yojson tree

let many_inputs_to_yojson tree = list_to_yojson node_id_to_yojson tree

let evaluate_data_quality_multi_frame_to_yojson (x : evaluate_data_quality_multi_frame) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (many_inputs_to_yojson x.inputs));
      ("AdditionalDataSources", option_to_yojson dqdl_aliases_to_yojson x.additional_data_sources);
      ("Ruleset", Some (dqdl_string_to_yojson x.ruleset));
      ( "PublishingOptions",
        option_to_yojson dq_results_publishing_options_to_yojson x.publishing_options );
      ("AdditionalOptions", option_to_yojson dq_additional_options_to_yojson x.additional_options);
      ( "StopJobOnFailureOptions",
        option_to_yojson dq_stop_job_on_failure_options_to_yojson x.stop_job_on_failure_options );
    ]

let amazon_redshift_advanced_option_to_yojson (x : amazon_redshift_advanced_option) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson generic_string_to_yojson x.key);
      ("Value", option_to_yojson generic_string_to_yojson x.value);
    ]

let amazon_redshift_advanced_options_to_yojson tree =
  list_to_yojson amazon_redshift_advanced_option_to_yojson tree

let amazon_redshift_node_data_to_yojson (x : amazon_redshift_node_data) =
  assoc_to_yojson
    [
      ("AccessType", option_to_yojson generic_limited_string_to_yojson x.access_type);
      ("SourceType", option_to_yojson generic_limited_string_to_yojson x.source_type);
      ("Connection", option_to_yojson option__to_yojson x.connection);
      ("Schema", option_to_yojson option__to_yojson x.schema);
      ("Table", option_to_yojson option__to_yojson x.table);
      ("CatalogDatabase", option_to_yojson option__to_yojson x.catalog_database);
      ("CatalogTable", option_to_yojson option__to_yojson x.catalog_table);
      ("CatalogRedshiftSchema", option_to_yojson generic_string_to_yojson x.catalog_redshift_schema);
      ("CatalogRedshiftTable", option_to_yojson generic_string_to_yojson x.catalog_redshift_table);
      ("TempDir", option_to_yojson enclosed_in_string_property_to_yojson x.temp_dir);
      ("IamRole", option_to_yojson option__to_yojson x.iam_role);
      ( "AdvancedOptions",
        option_to_yojson amazon_redshift_advanced_options_to_yojson x.advanced_options );
      ("SampleQuery", option_to_yojson generic_string_to_yojson x.sample_query);
      ("PreAction", option_to_yojson generic_string_to_yojson x.pre_action);
      ("PostAction", option_to_yojson generic_string_to_yojson x.post_action);
      ("Action", option_to_yojson generic_string_to_yojson x.action);
      ("TablePrefix", option_to_yojson generic_limited_string_to_yojson x.table_prefix);
      ("Upsert", option_to_yojson boolean_value_to_yojson x.upsert);
      ("MergeAction", option_to_yojson generic_limited_string_to_yojson x.merge_action);
      ("MergeWhenMatched", option_to_yojson generic_limited_string_to_yojson x.merge_when_matched);
      ( "MergeWhenNotMatched",
        option_to_yojson generic_limited_string_to_yojson x.merge_when_not_matched );
      ("MergeClause", option_to_yojson generic_string_to_yojson x.merge_clause);
      ("CrawlerConnection", option_to_yojson generic_string_to_yojson x.crawler_connection);
      ("TableSchema", option_to_yojson option_list_to_yojson x.table_schema);
      ("StagingTable", option_to_yojson generic_string_to_yojson x.staging_table);
      ("SelectedColumns", option_to_yojson option_list_to_yojson x.selected_columns);
    ]

let amazon_redshift_target_to_yojson (x : amazon_redshift_target) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson node_name_to_yojson x.name);
      ("Data", option_to_yojson amazon_redshift_node_data_to_yojson x.data);
      ("Inputs", option_to_yojson one_input_to_yojson x.inputs);
    ]

let amazon_redshift_source_to_yojson (x : amazon_redshift_source) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson node_name_to_yojson x.name);
      ("Data", option_to_yojson amazon_redshift_node_data_to_yojson x.data);
    ]

let delta_target_compression_type_to_yojson (x : delta_target_compression_type) =
  match x with UNCOMPRESSED -> `String "uncompressed" | SNAPPY -> `String "snappy"

let s3_delta_direct_target_to_yojson (x : s3_delta_direct_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("Compression", Some (delta_target_compression_type_to_yojson x.compression));
      ( "NumberTargetPartitions",
        option_to_yojson number_target_partitions_string_to_yojson x.number_target_partitions );
      ("Format", Some (target_format_to_yojson x.format));
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
    ]

let s3_delta_catalog_target_to_yojson (x : s3_delta_catalog_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ( "SchemaChangePolicy",
        option_to_yojson catalog_schema_change_policy_to_yojson x.schema_change_policy );
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let s3_delta_source_to_yojson (x : s3_delta_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ( "AdditionalDeltaOptions",
        option_to_yojson additional_options_to_yojson x.additional_delta_options );
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let catalog_delta_source_to_yojson (x : catalog_delta_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ( "AdditionalDeltaOptions",
        option_to_yojson additional_options_to_yojson x.additional_delta_options );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let s3_catalog_delta_source_to_yojson (x : s3_catalog_delta_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ( "AdditionalDeltaOptions",
        option_to_yojson additional_options_to_yojson x.additional_delta_options );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let jdbc_connection_type_to_yojson (x : jdbc_connection_type) =
  match x with
  | Sqlserver -> `String "sqlserver"
  | Mysql -> `String "mysql"
  | Oracle -> `String "oracle"
  | Postgresql -> `String "postgresql"
  | Redshift -> `String "redshift"

let direct_jdbc_source_to_yojson (x : direct_jdbc_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("ConnectionType", Some (jdbc_connection_type_to_yojson x.connection_type));
      ("RedshiftTmpDir", option_to_yojson enclosed_in_string_property_to_yojson x.redshift_tmp_dir);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let hudi_target_compression_type_to_yojson (x : hudi_target_compression_type) =
  match x with
  | GZIP -> `String "gzip"
  | LZO -> `String "lzo"
  | UNCOMPRESSED -> `String "uncompressed"
  | SNAPPY -> `String "snappy"

let s3_hudi_direct_target_to_yojson (x : s3_hudi_direct_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("Compression", Some (hudi_target_compression_type_to_yojson x.compression));
      ( "NumberTargetPartitions",
        option_to_yojson number_target_partitions_string_to_yojson x.number_target_partitions );
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Format", Some (target_format_to_yojson x.format));
      ("AdditionalOptions", Some (additional_options_to_yojson x.additional_options));
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
    ]

let s3_hudi_catalog_target_to_yojson (x : s3_hudi_catalog_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("AdditionalOptions", Some (additional_options_to_yojson x.additional_options));
      ( "SchemaChangePolicy",
        option_to_yojson catalog_schema_change_policy_to_yojson x.schema_change_policy );
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let s3_hudi_source_to_yojson (x : s3_hudi_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ( "AdditionalHudiOptions",
        option_to_yojson additional_options_to_yojson x.additional_hudi_options );
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let catalog_hudi_source_to_yojson (x : catalog_hudi_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ( "AdditionalHudiOptions",
        option_to_yojson additional_options_to_yojson x.additional_hudi_options );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let s3_catalog_hudi_source_to_yojson (x : s3_catalog_hudi_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ( "AdditionalHudiOptions",
        option_to_yojson additional_options_to_yojson x.additional_hudi_options );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let dq_transform_output_to_yojson (x : dq_transform_output) =
  match x with
  | PrimaryInput -> `String "PrimaryInput"
  | EvaluationResults -> `String "EvaluationResults"

let evaluate_data_quality_to_yojson (x : evaluate_data_quality) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Ruleset", Some (dqdl_string_to_yojson x.ruleset));
      ("Output", option_to_yojson dq_transform_output_to_yojson x.output);
      ( "PublishingOptions",
        option_to_yojson dq_results_publishing_options_to_yojson x.publishing_options );
      ( "StopJobOnFailureOptions",
        option_to_yojson dq_stop_job_on_failure_options_to_yojson x.stop_job_on_failure_options );
    ]

let param_type_to_yojson (x : param_type) =
  match x with
  | STR -> `String "str"
  | INT -> `String "int"
  | FLOAT -> `String "float"
  | COMPLEX -> `String "complex"
  | BOOL -> `String "bool"
  | LIST -> `String "list"
  | NULL -> `String "null"

let transform_config_parameter_to_yojson (x : transform_config_parameter) =
  assoc_to_yojson
    [
      ("Name", Some (enclosed_in_string_property_to_yojson x.name));
      ("Type", Some (param_type_to_yojson x.type_));
      ("ValidationRule", option_to_yojson enclosed_in_string_property_to_yojson x.validation_rule);
      ( "ValidationMessage",
        option_to_yojson enclosed_in_string_property_to_yojson x.validation_message );
      ("Value", option_to_yojson enclosed_in_string_properties_to_yojson x.value);
      ("ListType", option_to_yojson param_type_to_yojson x.list_type);
      ("IsOptional", option_to_yojson boxed_boolean_to_yojson x.is_optional);
    ]

let transform_config_parameter_list_to_yojson tree =
  list_to_yojson transform_config_parameter_to_yojson tree

let dynamic_transform_to_yojson (x : dynamic_transform) =
  assoc_to_yojson
    [
      ("Name", Some (enclosed_in_string_property_to_yojson x.name));
      ("TransformName", Some (enclosed_in_string_property_to_yojson x.transform_name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Parameters", option_to_yojson transform_config_parameter_list_to_yojson x.parameters);
      ("FunctionName", Some (enclosed_in_string_property_to_yojson x.function_name));
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("Version", option_to_yojson enclosed_in_string_property_to_yojson x.version);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let filter_logical_operator_to_yojson (x : filter_logical_operator) =
  match x with AND -> `String "AND" | OR -> `String "OR"

let filter_value_type_to_yojson (x : filter_value_type) =
  match x with COLUMNEXTRACTED -> `String "COLUMNEXTRACTED" | CONSTANT -> `String "CONSTANT"

let filter_value_to_yojson (x : filter_value) =
  assoc_to_yojson
    [
      ("Type", Some (filter_value_type_to_yojson x.type_));
      ("Value", Some (enclosed_in_string_properties_to_yojson x.value));
    ]

let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let filter_operation_to_yojson (x : filter_operation) =
  match x with
  | EQ -> `String "EQ"
  | LT -> `String "LT"
  | GT -> `String "GT"
  | LTE -> `String "LTE"
  | GTE -> `String "GTE"
  | REGEX -> `String "REGEX"
  | ISNULL -> `String "ISNULL"

let filter_expression_to_yojson (x : filter_expression) =
  assoc_to_yojson
    [
      ("Operation", Some (filter_operation_to_yojson x.operation));
      ("Negated", option_to_yojson boxed_boolean_to_yojson x.negated);
      ("Values", Some (filter_values_to_yojson x.values));
    ]

let filter_expressions_to_yojson tree = list_to_yojson filter_expression_to_yojson tree

let group_filters_to_yojson (x : group_filters) =
  assoc_to_yojson
    [
      ("GroupName", Some (generic_limited_string_to_yojson x.group_name));
      ("Filters", Some (filter_expressions_to_yojson x.filters));
      ("LogicalOperator", Some (filter_logical_operator_to_yojson x.logical_operator));
    ]

let group_filters_list_to_yojson tree = list_to_yojson group_filters_to_yojson tree

let route_to_yojson (x : route) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("GroupFiltersList", Some (group_filters_list_to_yojson x.group_filters_list));
    ]

let postgre_sql_catalog_target_to_yojson (x : postgre_sql_catalog_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
    ]

let oracle_sql_catalog_target_to_yojson (x : oracle_sql_catalog_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
    ]

let my_sql_catalog_target_to_yojson (x : my_sql_catalog_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
    ]

let microsoft_sql_server_catalog_target_to_yojson (x : microsoft_sql_server_catalog_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
    ]

let postgre_sql_catalog_source_to_yojson (x : postgre_sql_catalog_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
    ]

let oracle_sql_catalog_source_to_yojson (x : oracle_sql_catalog_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
    ]

let my_sql_catalog_source_to_yojson (x : my_sql_catalog_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
    ]

let microsoft_sql_server_catalog_source_to_yojson (x : microsoft_sql_server_catalog_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
    ]

let s3_source_additional_options_to_yojson (x : s3_source_additional_options) =
  assoc_to_yojson
    [
      ("BoundedSize", option_to_yojson boxed_long_to_yojson x.bounded_size);
      ("BoundedFiles", option_to_yojson boxed_long_to_yojson x.bounded_files);
    ]

let governed_catalog_source_to_yojson (x : governed_catalog_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ( "PartitionPredicate",
        option_to_yojson enclosed_in_string_property_to_yojson x.partition_predicate );
      ( "AdditionalOptions",
        option_to_yojson s3_source_additional_options_to_yojson x.additional_options );
    ]

let governed_catalog_target_to_yojson (x : governed_catalog_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ( "SchemaChangePolicy",
        option_to_yojson catalog_schema_change_policy_to_yojson x.schema_change_policy );
    ]

let limited_string_list_to_yojson tree = list_to_yojson generic_limited_string_to_yojson tree
let limited_path_list_to_yojson tree = list_to_yojson limited_string_list_to_yojson tree

let drop_duplicates_to_yojson (x : drop_duplicates) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Columns", option_to_yojson limited_path_list_to_yojson x.columns);
    ]

let agg_function_to_yojson (x : agg_function) =
  match x with
  | Avg -> `String "avg"
  | CountDistinct -> `String "countDistinct"
  | Count -> `String "count"
  | First -> `String "first"
  | Last -> `String "last"
  | Kurtosis -> `String "kurtosis"
  | Max -> `String "max"
  | Min -> `String "min"
  | Skewness -> `String "skewness"
  | Stddev_samp -> `String "stddev_samp"
  | Stddev_pop -> `String "stddev_pop"
  | Sum -> `String "sum"
  | SumDistinct -> `String "sumDistinct"
  | Var_samp -> `String "var_samp"
  | Var_pop -> `String "var_pop"

let aggregate_operation_to_yojson (x : aggregate_operation) =
  assoc_to_yojson
    [
      ("Column", Some (enclosed_in_string_properties_to_yojson x.column));
      ("AggFunc", Some (agg_function_to_yojson x.agg_func));
    ]

let aggregate_operations_to_yojson tree = list_to_yojson aggregate_operation_to_yojson tree

let aggregate_to_yojson (x : aggregate) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Groups", Some (glue_studio_path_list_to_yojson x.groups));
      ("Aggs", Some (aggregate_operations_to_yojson x.aggs));
    ]

let boxed_positive_int_to_yojson = int_to_yojson
let mask_value_to_yojson = string_to_yojson
let boxed_double_fraction_to_yojson = double_to_yojson

let pii_type_to_yojson (x : pii_type) =
  match x with
  | RowAudit -> `String "RowAudit"
  | RowHashing -> `String "RowHashing"
  | RowMasking -> `String "RowMasking"
  | RowPartialMasking -> `String "RowPartialMasking"
  | ColumnAudit -> `String "ColumnAudit"
  | ColumnHashing -> `String "ColumnHashing"
  | ColumnMasking -> `String "ColumnMasking"

let pii_detection_to_yojson (x : pii_detection) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("PiiType", Some (pii_type_to_yojson x.pii_type));
      ( "EntityTypesToDetect",
        Some (enclosed_in_string_properties_to_yojson x.entity_types_to_detect) );
      ( "OutputColumnName",
        option_to_yojson enclosed_in_string_property_to_yojson x.output_column_name );
      ("SampleFraction", option_to_yojson boxed_double_fraction_to_yojson x.sample_fraction);
      ("ThresholdFraction", option_to_yojson boxed_double_fraction_to_yojson x.threshold_fraction);
      ("MaskValue", option_to_yojson mask_value_to_yojson x.mask_value);
      ("RedactText", option_to_yojson enclosed_in_string_property_to_yojson x.redact_text);
      ("RedactChar", option_to_yojson enclosed_in_string_property_to_yojson x.redact_char);
      ("MatchPattern", option_to_yojson enclosed_in_string_property_to_yojson x.match_pattern);
      ( "NumLeftCharsToExclude",
        option_to_yojson boxed_positive_int_to_yojson x.num_left_chars_to_exclude );
      ( "NumRightCharsToExclude",
        option_to_yojson boxed_positive_int_to_yojson x.num_right_chars_to_exclude );
      ( "DetectionParameters",
        option_to_yojson enclosed_in_string_property_to_yojson x.detection_parameters );
      ( "DetectionSensitivity",
        option_to_yojson enclosed_in_string_property_to_yojson x.detection_sensitivity );
    ]

let union_type_to_yojson (x : union_type) =
  match x with ALL -> `String "ALL" | DISTINCT -> `String "DISTINCT"

let two_inputs_to_yojson tree = list_to_yojson node_id_to_yojson tree

let union_to_yojson (x : union) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (two_inputs_to_yojson x.inputs));
      ("UnionType", Some (union_type_to_yojson x.union_type));
    ]

let merge_to_yojson (x : merge) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (two_inputs_to_yojson x.inputs));
      ("Source", Some (node_id_to_yojson x.source));
      ("PrimaryKeys", Some (glue_studio_path_list_to_yojson x.primary_keys));
    ]

let datatype_to_yojson (x : datatype) =
  assoc_to_yojson
    [
      ("Id", Some (generic_limited_string_to_yojson x.id));
      ("Label", Some (generic_limited_string_to_yojson x.label));
    ]

let null_value_field_to_yojson (x : null_value_field) =
  assoc_to_yojson
    [
      ("Value", Some (enclosed_in_string_property_to_yojson x.value));
      ("Datatype", Some (datatype_to_yojson x.datatype));
    ]

let null_value_fields_to_yojson tree = list_to_yojson null_value_field_to_yojson tree

let null_check_box_list_to_yojson (x : null_check_box_list) =
  assoc_to_yojson
    [
      ("IsEmpty", option_to_yojson boxed_boolean_to_yojson x.is_empty);
      ("IsNullString", option_to_yojson boxed_boolean_to_yojson x.is_null_string);
      ("IsNegOne", option_to_yojson boxed_boolean_to_yojson x.is_neg_one);
    ]

let drop_null_fields_to_yojson (x : drop_null_fields) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("NullCheckBoxList", option_to_yojson null_check_box_list_to_yojson x.null_check_box_list);
      ("NullTextList", option_to_yojson null_value_fields_to_yojson x.null_text_list);
    ]

let positive_long_to_yojson = long_to_yojson
let polling_time_to_yojson = long_to_yojson

let streaming_data_preview_options_to_yojson (x : streaming_data_preview_options) =
  assoc_to_yojson
    [
      ("PollingTime", option_to_yojson polling_time_to_yojson x.polling_time);
      ("RecordPollingLimit", option_to_yojson positive_long_to_yojson x.record_polling_limit);
    ]

let iso8601_date_time_to_yojson = timestamp_iso_8601_to_yojson
let boxed_non_negative_long_to_yojson = long_to_yojson

let kafka_streaming_source_options_to_yojson (x : kafka_streaming_source_options) =
  assoc_to_yojson
    [
      ( "BootstrapServers",
        option_to_yojson enclosed_in_string_property_to_yojson x.bootstrap_servers );
      ( "SecurityProtocol",
        option_to_yojson enclosed_in_string_property_to_yojson x.security_protocol );
      ("ConnectionName", option_to_yojson enclosed_in_string_property_to_yojson x.connection_name);
      ("TopicName", option_to_yojson enclosed_in_string_property_to_yojson x.topic_name);
      ("Assign", option_to_yojson enclosed_in_string_property_to_yojson x.assign);
      ( "SubscribePattern",
        option_to_yojson enclosed_in_string_property_to_yojson x.subscribe_pattern );
      ("Classification", option_to_yojson enclosed_in_string_property_to_yojson x.classification);
      ("Delimiter", option_to_yojson enclosed_in_string_property_to_yojson x.delimiter);
      ("StartingOffsets", option_to_yojson enclosed_in_string_property_to_yojson x.starting_offsets);
      ("EndingOffsets", option_to_yojson enclosed_in_string_property_to_yojson x.ending_offsets);
      ("PollTimeoutMs", option_to_yojson boxed_non_negative_long_to_yojson x.poll_timeout_ms);
      ("NumRetries", option_to_yojson boxed_non_negative_int_to_yojson x.num_retries);
      ("RetryIntervalMs", option_to_yojson boxed_non_negative_long_to_yojson x.retry_interval_ms);
      ( "MaxOffsetsPerTrigger",
        option_to_yojson boxed_non_negative_long_to_yojson x.max_offsets_per_trigger );
      ("MinPartitions", option_to_yojson boxed_non_negative_int_to_yojson x.min_partitions);
      ("IncludeHeaders", option_to_yojson boxed_boolean_to_yojson x.include_headers);
      ( "AddRecordTimestamp",
        option_to_yojson enclosed_in_string_property_to_yojson x.add_record_timestamp );
      ( "EmitConsumerLagMetrics",
        option_to_yojson enclosed_in_string_property_to_yojson x.emit_consumer_lag_metrics );
      ("StartingTimestamp", option_to_yojson iso8601_date_time_to_yojson x.starting_timestamp);
    ]

let catalog_kafka_source_to_yojson (x : catalog_kafka_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("WindowSize", option_to_yojson boxed_positive_int_to_yojson x.window_size);
      ("DetectSchema", option_to_yojson boxed_boolean_to_yojson x.detect_schema);
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ( "StreamingOptions",
        option_to_yojson kafka_streaming_source_options_to_yojson x.streaming_options );
      ( "DataPreviewOptions",
        option_to_yojson streaming_data_preview_options_to_yojson x.data_preview_options );
    ]

let starting_position_to_yojson (x : starting_position) =
  match x with
  | LATEST -> `String "latest"
  | TRIM_HORIZON -> `String "trim_horizon"
  | EARLIEST -> `String "earliest"
  | TIMESTAMP -> `String "timestamp"

let kinesis_streaming_source_options_to_yojson (x : kinesis_streaming_source_options) =
  assoc_to_yojson
    [
      ("EndpointUrl", option_to_yojson enclosed_in_string_property_to_yojson x.endpoint_url);
      ("StreamName", option_to_yojson enclosed_in_string_property_to_yojson x.stream_name);
      ("Classification", option_to_yojson enclosed_in_string_property_to_yojson x.classification);
      ("Delimiter", option_to_yojson enclosed_in_string_property_to_yojson x.delimiter);
      ("StartingPosition", option_to_yojson starting_position_to_yojson x.starting_position);
      ("MaxFetchTimeInMs", option_to_yojson boxed_non_negative_long_to_yojson x.max_fetch_time_in_ms);
      ( "MaxFetchRecordsPerShard",
        option_to_yojson boxed_non_negative_long_to_yojson x.max_fetch_records_per_shard );
      ("MaxRecordPerRead", option_to_yojson boxed_non_negative_long_to_yojson x.max_record_per_read);
      ( "AddIdleTimeBetweenReads",
        option_to_yojson boxed_boolean_to_yojson x.add_idle_time_between_reads );
      ( "IdleTimeBetweenReadsInMs",
        option_to_yojson boxed_non_negative_long_to_yojson x.idle_time_between_reads_in_ms );
      ( "DescribeShardInterval",
        option_to_yojson boxed_non_negative_long_to_yojson x.describe_shard_interval );
      ("NumRetries", option_to_yojson boxed_non_negative_int_to_yojson x.num_retries);
      ("RetryIntervalMs", option_to_yojson boxed_non_negative_long_to_yojson x.retry_interval_ms);
      ( "MaxRetryIntervalMs",
        option_to_yojson boxed_non_negative_long_to_yojson x.max_retry_interval_ms );
      ("AvoidEmptyBatches", option_to_yojson boxed_boolean_to_yojson x.avoid_empty_batches);
      ("StreamArn", option_to_yojson enclosed_in_string_property_to_yojson x.stream_arn);
      ("RoleArn", option_to_yojson enclosed_in_string_property_to_yojson x.role_arn);
      ("RoleSessionName", option_to_yojson enclosed_in_string_property_to_yojson x.role_session_name);
      ( "AddRecordTimestamp",
        option_to_yojson enclosed_in_string_property_to_yojson x.add_record_timestamp );
      ( "EmitConsumerLagMetrics",
        option_to_yojson enclosed_in_string_property_to_yojson x.emit_consumer_lag_metrics );
      ("StartingTimestamp", option_to_yojson iso8601_date_time_to_yojson x.starting_timestamp);
      ( "FanoutConsumerARN",
        option_to_yojson enclosed_in_string_property_to_yojson x.fanout_consumer_ar_n );
    ]

let catalog_kinesis_source_to_yojson (x : catalog_kinesis_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("WindowSize", option_to_yojson boxed_positive_int_to_yojson x.window_size);
      ("DetectSchema", option_to_yojson boxed_boolean_to_yojson x.detect_schema);
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ( "StreamingOptions",
        option_to_yojson kinesis_streaming_source_options_to_yojson x.streaming_options );
      ( "DataPreviewOptions",
        option_to_yojson streaming_data_preview_options_to_yojson x.data_preview_options );
    ]

let direct_kafka_source_to_yojson (x : direct_kafka_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ( "StreamingOptions",
        option_to_yojson kafka_streaming_source_options_to_yojson x.streaming_options );
      ("WindowSize", option_to_yojson boxed_positive_int_to_yojson x.window_size);
      ("DetectSchema", option_to_yojson boxed_boolean_to_yojson x.detect_schema);
      ( "DataPreviewOptions",
        option_to_yojson streaming_data_preview_options_to_yojson x.data_preview_options );
    ]

let direct_kinesis_source_to_yojson (x : direct_kinesis_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("WindowSize", option_to_yojson boxed_positive_int_to_yojson x.window_size);
      ("DetectSchema", option_to_yojson boxed_boolean_to_yojson x.detect_schema);
      ( "StreamingOptions",
        option_to_yojson kinesis_streaming_source_options_to_yojson x.streaming_options );
      ( "DataPreviewOptions",
        option_to_yojson streaming_data_preview_options_to_yojson x.data_preview_options );
    ]

let enclosed_in_string_property_with_quote_to_yojson = string_to_yojson

let sql_alias_to_yojson (x : sql_alias) =
  assoc_to_yojson
    [
      ("From", Some (node_id_to_yojson x.from_));
      ("Alias", Some (enclosed_in_string_property_with_quote_to_yojson x.alias));
    ]

let sql_aliases_to_yojson tree = list_to_yojson sql_alias_to_yojson tree
let sql_query_to_yojson = string_to_yojson

let spark_sq_l_to_yojson (x : spark_sq_l) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (many_inputs_to_yojson x.inputs));
      ("SqlQuery", Some (sql_query_to_yojson x.sql_query));
      ("SqlAliases", Some (sql_aliases_to_yojson x.sql_aliases));
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let extended_string_to_yojson = string_to_yojson

let custom_code_to_yojson (x : custom_code) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (many_inputs_to_yojson x.inputs));
      ("Code", Some (extended_string_to_yojson x.code));
      ("ClassName", Some (enclosed_in_string_property_to_yojson x.class_name));
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("LogicalOperator", Some (filter_logical_operator_to_yojson x.logical_operator));
      ("Filters", Some (filter_expressions_to_yojson x.filters));
    ]

let fill_missing_values_to_yojson (x : fill_missing_values) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("ImputedPath", Some (enclosed_in_string_property_to_yojson x.imputed_path));
      ("FilledPath", option_to_yojson enclosed_in_string_property_to_yojson x.filled_path);
    ]

let non_negative_int_to_yojson = int_to_yojson

let select_from_collection_to_yojson (x : select_from_collection) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Index", Some (non_negative_int_to_yojson x.index));
    ]

let split_fields_to_yojson (x : split_fields) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Paths", Some (glue_studio_path_list_to_yojson x.paths));
    ]

let join_column_to_yojson (x : join_column) =
  assoc_to_yojson
    [
      ("From", Some (enclosed_in_string_property_to_yojson x.from_));
      ("Keys", Some (glue_studio_path_list_to_yojson x.keys));
    ]

let join_columns_to_yojson tree = list_to_yojson join_column_to_yojson tree

let join_type_to_yojson (x : join_type) =
  match x with
  | EQUIJOIN -> `String "equijoin"
  | LEFT -> `String "left"
  | RIGHT -> `String "right"
  | OUTER -> `String "outer"
  | LEFT_SEMI -> `String "leftsemi"
  | LEFT_ANTI -> `String "leftanti"

let join_to_yojson (x : join) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (two_inputs_to_yojson x.inputs));
      ("JoinType", Some (join_type_to_yojson x.join_type));
      ("Columns", Some (join_columns_to_yojson x.columns));
    ]

let prob_to_yojson = double_to_yojson
let topk_to_yojson = int_to_yojson

let spigot_to_yojson (x : spigot) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("Topk", option_to_yojson topk_to_yojson x.topk);
      ("Prob", option_to_yojson prob_to_yojson x.prob);
    ]

let rename_field_to_yojson (x : rename_field) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("SourcePath", Some (enclosed_in_string_properties_to_yojson x.source_path));
      ("TargetPath", Some (enclosed_in_string_properties_to_yojson x.target_path));
    ]

let drop_fields_to_yojson (x : drop_fields) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Paths", Some (glue_studio_path_list_to_yojson x.paths));
    ]

let select_fields_to_yojson (x : select_fields) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Paths", Some (glue_studio_path_list_to_yojson x.paths));
    ]

let rec mappings_to_yojson tree = list_to_yojson mapping_to_yojson tree

and mapping_to_yojson (x : mapping) =
  assoc_to_yojson
    [
      ("ToKey", option_to_yojson enclosed_in_string_property_to_yojson x.to_key);
      ("FromPath", option_to_yojson enclosed_in_string_properties_to_yojson x.from_path);
      ("FromType", option_to_yojson enclosed_in_string_property_to_yojson x.from_type);
      ("ToType", option_to_yojson enclosed_in_string_property_to_yojson x.to_type);
      ("Dropped", option_to_yojson boxed_boolean_to_yojson x.dropped);
      ("Children", option_to_yojson mappings_to_yojson x.children);
    ]

let apply_mapping_to_yojson (x : apply_mapping) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Mapping", Some (mappings_to_yojson x.mapping));
    ]

let s3_direct_target_to_yojson (x : s3_direct_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("Compression", option_to_yojson enclosed_in_string_property_to_yojson x.compression);
      ( "NumberTargetPartitions",
        option_to_yojson number_target_partitions_string_to_yojson x.number_target_partitions );
      ("Format", Some (target_format_to_yojson x.format));
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let s3_glue_parquet_target_to_yojson (x : s3_glue_parquet_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("Compression", option_to_yojson parquet_compression_type_to_yojson x.compression);
      ( "NumberTargetPartitions",
        option_to_yojson number_target_partitions_string_to_yojson x.number_target_partitions );
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
    ]

let s3_catalog_target_to_yojson (x : s3_catalog_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ( "SchemaChangePolicy",
        option_to_yojson catalog_schema_change_policy_to_yojson x.schema_change_policy );
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
    ]

let enclosed_in_string_properties_min_one_to_yojson tree =
  list_to_yojson enclosed_in_string_property_to_yojson tree

let upsert_redshift_target_options_to_yojson (x : upsert_redshift_target_options) =
  assoc_to_yojson
    [
      ("TableLocation", option_to_yojson enclosed_in_string_property_to_yojson x.table_location);
      ("ConnectionName", option_to_yojson enclosed_in_string_property_to_yojson x.connection_name);
      ("UpsertKeys", option_to_yojson enclosed_in_string_properties_min_one_to_yojson x.upsert_keys);
    ]

let redshift_target_to_yojson (x : redshift_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("RedshiftTmpDir", option_to_yojson enclosed_in_string_property_to_yojson x.redshift_tmp_dir);
      ("TmpDirIAMRole", option_to_yojson enclosed_in_string_property_to_yojson x.tmp_dir_iam_role);
      ( "UpsertRedshiftOptions",
        option_to_yojson upsert_redshift_target_options_to_yojson x.upsert_redshift_options );
    ]

let basic_catalog_target_to_yojson (x : basic_catalog_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
    ]

let spark_connector_target_to_yojson (x : spark_connector_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("ConnectorName", Some (enclosed_in_string_property_to_yojson x.connector_name));
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let jdbc_connector_target_to_yojson (x : jdbc_connector_target) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("ConnectionTable", Some (enclosed_in_string_property_with_quote_to_yojson x.connection_table));
      ("ConnectorName", Some (enclosed_in_string_property_to_yojson x.connector_name));
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let ddbelt_catalog_additional_options_to_yojson (x : ddbelt_catalog_additional_options) =
  assoc_to_yojson
    [
      ("DynamodbExport", option_to_yojson enclosed_in_string_property_to_yojson x.dynamodb_export);
      ("DynamodbUnnestDDBJson", option_to_yojson boolean_value_to_yojson x.dynamodb_unnest_ddb_json);
    ]

let dynamo_db_catalog_source_to_yojson (x : dynamo_db_catalog_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("PitrEnabled", option_to_yojson boxed_boolean_to_yojson x.pitr_enabled);
      ( "AdditionalOptions",
        option_to_yojson ddbelt_catalog_additional_options_to_yojson x.additional_options );
    ]

let relational_catalog_source_to_yojson (x : relational_catalog_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
    ]

let s3_parquet_source_to_yojson (x : s3_parquet_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ("CompressionType", option_to_yojson parquet_compression_type_to_yojson x.compression_type);
      ("Exclusions", option_to_yojson enclosed_in_string_properties_to_yojson x.exclusions);
      ("GroupSize", option_to_yojson enclosed_in_string_property_to_yojson x.group_size);
      ("GroupFiles", option_to_yojson enclosed_in_string_property_to_yojson x.group_files);
      ("Recurse", option_to_yojson boxed_boolean_to_yojson x.recurse);
      ("MaxBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_band);
      ("MaxFilesInBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_files_in_band);
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let compression_type_to_yojson (x : compression_type) =
  match x with GZIP -> `String "gzip" | BZIP2 -> `String "bzip2"

let s3_json_source_to_yojson (x : s3_json_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("Exclusions", option_to_yojson enclosed_in_string_properties_to_yojson x.exclusions);
      ("GroupSize", option_to_yojson enclosed_in_string_property_to_yojson x.group_size);
      ("GroupFiles", option_to_yojson enclosed_in_string_property_to_yojson x.group_files);
      ("Recurse", option_to_yojson boxed_boolean_to_yojson x.recurse);
      ("MaxBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_band);
      ("MaxFilesInBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_files_in_band);
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ("JsonPath", option_to_yojson enclosed_in_string_property_to_yojson x.json_path);
      ("Multiline", option_to_yojson boxed_boolean_to_yojson x.multiline);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let quote_char_to_yojson (x : quote_char) =
  match x with
  | QUOTE -> `String "quote"
  | QUILLEMET -> `String "quillemet"
  | SINGLE_QUOTE -> `String "single_quote"
  | DISABLED -> `String "disabled"

let separator_to_yojson (x : separator) =
  match x with
  | COMMA -> `String "comma"
  | CTRLA -> `String "ctrla"
  | PIPE -> `String "pipe"
  | SEMICOLON -> `String "semicolon"
  | TAB -> `String "tab"

let s3_csv_source_to_yojson (x : s3_csv_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("Exclusions", option_to_yojson enclosed_in_string_properties_to_yojson x.exclusions);
      ("GroupSize", option_to_yojson enclosed_in_string_property_to_yojson x.group_size);
      ("GroupFiles", option_to_yojson enclosed_in_string_property_to_yojson x.group_files);
      ("Recurse", option_to_yojson boxed_boolean_to_yojson x.recurse);
      ("MaxBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_band);
      ("MaxFilesInBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_files_in_band);
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ("Separator", Some (separator_to_yojson x.separator));
      ("Escaper", option_to_yojson enclosed_in_string_property_with_quote_to_yojson x.escaper);
      ("QuoteChar", Some (quote_char_to_yojson x.quote_char));
      ("Multiline", option_to_yojson boxed_boolean_to_yojson x.multiline);
      ("WithHeader", option_to_yojson boxed_boolean_to_yojson x.with_header);
      ("WriteHeader", option_to_yojson boxed_boolean_to_yojson x.write_header);
      ("SkipFirst", option_to_yojson boxed_boolean_to_yojson x.skip_first);
      ("OptimizePerformance", option_to_yojson boolean_value_to_yojson x.optimize_performance);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let s3_catalog_source_to_yojson (x : s3_catalog_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ( "PartitionPredicate",
        option_to_yojson enclosed_in_string_property_to_yojson x.partition_predicate );
      ( "AdditionalOptions",
        option_to_yojson s3_source_additional_options_to_yojson x.additional_options );
    ]

let redshift_source_to_yojson (x : redshift_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("RedshiftTmpDir", option_to_yojson enclosed_in_string_property_to_yojson x.redshift_tmp_dir);
      ("TmpDirIAMRole", option_to_yojson enclosed_in_string_property_to_yojson x.tmp_dir_iam_role);
    ]

let catalog_source_to_yojson (x : catalog_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ( "PartitionPredicate",
        option_to_yojson enclosed_in_string_property_to_yojson x.partition_predicate );
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let spark_connector_source_to_yojson (x : spark_connector_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("ConnectorName", Some (enclosed_in_string_property_to_yojson x.connector_name));
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let glue_record_type_to_yojson (x : glue_record_type) =
  match x with
  | DATE -> `String "DATE"
  | STRING -> `String "STRING"
  | TIMESTAMP -> `String "TIMESTAMP"
  | INT -> `String "INT"
  | FLOAT -> `String "FLOAT"
  | LONG -> `String "LONG"
  | BIGDECIMAL -> `String "BIGDECIMAL"
  | BYTE -> `String "BYTE"
  | SHORT -> `String "SHORT"
  | DOUBLE -> `String "DOUBLE"

let jdbc_data_type_to_yojson (x : jdbc_data_type) =
  match x with
  | ARRAY -> `String "ARRAY"
  | BIGINT -> `String "BIGINT"
  | BINARY -> `String "BINARY"
  | BIT -> `String "BIT"
  | BLOB -> `String "BLOB"
  | BOOLEAN -> `String "BOOLEAN"
  | CHAR -> `String "CHAR"
  | CLOB -> `String "CLOB"
  | DATALINK -> `String "DATALINK"
  | DATE -> `String "DATE"
  | DECIMAL -> `String "DECIMAL"
  | DISTINCT -> `String "DISTINCT"
  | DOUBLE -> `String "DOUBLE"
  | FLOAT -> `String "FLOAT"
  | INTEGER -> `String "INTEGER"
  | JAVA_OBJECT -> `String "JAVA_OBJECT"
  | LONGNVARCHAR -> `String "LONGNVARCHAR"
  | LONGVARBINARY -> `String "LONGVARBINARY"
  | LONGVARCHAR -> `String "LONGVARCHAR"
  | NCHAR -> `String "NCHAR"
  | NCLOB -> `String "NCLOB"
  | NULL -> `String "NULL"
  | NUMERIC -> `String "NUMERIC"
  | NVARCHAR -> `String "NVARCHAR"
  | OTHER -> `String "OTHER"
  | REAL -> `String "REAL"
  | REF -> `String "REF"
  | REF_CURSOR -> `String "REF_CURSOR"
  | ROWID -> `String "ROWID"
  | SMALLINT -> `String "SMALLINT"
  | SQLXML -> `String "SQLXML"
  | STRUCT -> `String "STRUCT"
  | TIME -> `String "TIME"
  | TIME_WITH_TIMEZONE -> `String "TIME_WITH_TIMEZONE"
  | TIMESTAMP -> `String "TIMESTAMP"
  | TIMESTAMP_WITH_TIMEZONE -> `String "TIMESTAMP_WITH_TIMEZONE"
  | TINYINT -> `String "TINYINT"
  | VARBINARY -> `String "VARBINARY"
  | VARCHAR -> `String "VARCHAR"

let jdbc_data_type_mapping_to_yojson tree =
  map_to_yojson jdbc_data_type_to_yojson glue_record_type_to_yojson tree

let jdbc_connector_options_to_yojson (x : jdbc_connector_options) =
  assoc_to_yojson
    [
      ("FilterPredicate", option_to_yojson enclosed_in_string_property_to_yojson x.filter_predicate);
      ("PartitionColumn", option_to_yojson enclosed_in_string_property_to_yojson x.partition_column);
      ("LowerBound", option_to_yojson boxed_non_negative_long_to_yojson x.lower_bound);
      ("UpperBound", option_to_yojson boxed_non_negative_long_to_yojson x.upper_bound);
      ("NumPartitions", option_to_yojson boxed_non_negative_long_to_yojson x.num_partitions);
      ( "JobBookmarkKeys",
        option_to_yojson enclosed_in_string_properties_to_yojson x.job_bookmark_keys );
      ( "JobBookmarkKeysSortOrder",
        option_to_yojson enclosed_in_string_property_to_yojson x.job_bookmark_keys_sort_order );
      ("DataTypeMapping", option_to_yojson jdbc_data_type_mapping_to_yojson x.data_type_mapping);
    ]

let jdbc_connector_source_to_yojson (x : jdbc_connector_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("ConnectorName", Some (enclosed_in_string_property_to_yojson x.connector_name));
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("AdditionalOptions", option_to_yojson jdbc_connector_options_to_yojson x.additional_options);
      ( "ConnectionTable",
        option_to_yojson enclosed_in_string_property_with_quote_to_yojson x.connection_table );
      ("Query", option_to_yojson sql_query_to_yojson x.query);
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let athena_connector_source_to_yojson (x : athena_connector_source) =
  assoc_to_yojson
    [
      ("Name", Some (node_name_to_yojson x.name));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("ConnectorName", Some (enclosed_in_string_property_to_yojson x.connector_name));
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ( "ConnectionTable",
        option_to_yojson enclosed_in_string_property_with_quote_to_yojson x.connection_table );
      ("SchemaName", Some (enclosed_in_string_property_to_yojson x.schema_name));
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
    ]

let code_gen_configuration_node_to_yojson (x : code_gen_configuration_node) =
  assoc_to_yojson
    [
      ( "AthenaConnectorSource",
        option_to_yojson athena_connector_source_to_yojson x.athena_connector_source );
      ( "JDBCConnectorSource",
        option_to_yojson jdbc_connector_source_to_yojson x.jdbc_connector_source );
      ( "SparkConnectorSource",
        option_to_yojson spark_connector_source_to_yojson x.spark_connector_source );
      ("CatalogSource", option_to_yojson catalog_source_to_yojson x.catalog_source);
      ("RedshiftSource", option_to_yojson redshift_source_to_yojson x.redshift_source);
      ("S3CatalogSource", option_to_yojson s3_catalog_source_to_yojson x.s3_catalog_source);
      ("S3CsvSource", option_to_yojson s3_csv_source_to_yojson x.s3_csv_source);
      ("S3JsonSource", option_to_yojson s3_json_source_to_yojson x.s3_json_source);
      ("S3ParquetSource", option_to_yojson s3_parquet_source_to_yojson x.s3_parquet_source);
      ( "RelationalCatalogSource",
        option_to_yojson relational_catalog_source_to_yojson x.relational_catalog_source );
      ( "DynamoDBCatalogSource",
        option_to_yojson dynamo_db_catalog_source_to_yojson x.dynamo_db_catalog_source );
      ( "JDBCConnectorTarget",
        option_to_yojson jdbc_connector_target_to_yojson x.jdbc_connector_target );
      ( "SparkConnectorTarget",
        option_to_yojson spark_connector_target_to_yojson x.spark_connector_target );
      ("CatalogTarget", option_to_yojson basic_catalog_target_to_yojson x.catalog_target);
      ("RedshiftTarget", option_to_yojson redshift_target_to_yojson x.redshift_target);
      ("S3CatalogTarget", option_to_yojson s3_catalog_target_to_yojson x.s3_catalog_target);
      ( "S3GlueParquetTarget",
        option_to_yojson s3_glue_parquet_target_to_yojson x.s3_glue_parquet_target );
      ("S3DirectTarget", option_to_yojson s3_direct_target_to_yojson x.s3_direct_target);
      ("ApplyMapping", option_to_yojson apply_mapping_to_yojson x.apply_mapping);
      ("SelectFields", option_to_yojson select_fields_to_yojson x.select_fields);
      ("DropFields", option_to_yojson drop_fields_to_yojson x.drop_fields);
      ("RenameField", option_to_yojson rename_field_to_yojson x.rename_field);
      ("Spigot", option_to_yojson spigot_to_yojson x.spigot);
      ("Join", option_to_yojson join_to_yojson x.join);
      ("SplitFields", option_to_yojson split_fields_to_yojson x.split_fields);
      ( "SelectFromCollection",
        option_to_yojson select_from_collection_to_yojson x.select_from_collection );
      ("FillMissingValues", option_to_yojson fill_missing_values_to_yojson x.fill_missing_values);
      ("Filter", option_to_yojson filter_to_yojson x.filter);
      ("CustomCode", option_to_yojson custom_code_to_yojson x.custom_code);
      ("SparkSQL", option_to_yojson spark_sq_l_to_yojson x.spark_sq_l);
      ( "DirectKinesisSource",
        option_to_yojson direct_kinesis_source_to_yojson x.direct_kinesis_source );
      ("DirectKafkaSource", option_to_yojson direct_kafka_source_to_yojson x.direct_kafka_source);
      ( "CatalogKinesisSource",
        option_to_yojson catalog_kinesis_source_to_yojson x.catalog_kinesis_source );
      ("CatalogKafkaSource", option_to_yojson catalog_kafka_source_to_yojson x.catalog_kafka_source);
      ("DropNullFields", option_to_yojson drop_null_fields_to_yojson x.drop_null_fields);
      ("Merge", option_to_yojson merge_to_yojson x.merge);
      ("Union", option_to_yojson union_to_yojson x.union);
      ("PIIDetection", option_to_yojson pii_detection_to_yojson x.pii_detection);
      ("Aggregate", option_to_yojson aggregate_to_yojson x.aggregate);
      ("DropDuplicates", option_to_yojson drop_duplicates_to_yojson x.drop_duplicates);
      ( "GovernedCatalogTarget",
        option_to_yojson governed_catalog_target_to_yojson x.governed_catalog_target );
      ( "GovernedCatalogSource",
        option_to_yojson governed_catalog_source_to_yojson x.governed_catalog_source );
      ( "MicrosoftSQLServerCatalogSource",
        option_to_yojson microsoft_sql_server_catalog_source_to_yojson
          x.microsoft_sql_server_catalog_source );
      ( "MySQLCatalogSource",
        option_to_yojson my_sql_catalog_source_to_yojson x.my_sql_catalog_source );
      ( "OracleSQLCatalogSource",
        option_to_yojson oracle_sql_catalog_source_to_yojson x.oracle_sql_catalog_source );
      ( "PostgreSQLCatalogSource",
        option_to_yojson postgre_sql_catalog_source_to_yojson x.postgre_sql_catalog_source );
      ( "MicrosoftSQLServerCatalogTarget",
        option_to_yojson microsoft_sql_server_catalog_target_to_yojson
          x.microsoft_sql_server_catalog_target );
      ( "MySQLCatalogTarget",
        option_to_yojson my_sql_catalog_target_to_yojson x.my_sql_catalog_target );
      ( "OracleSQLCatalogTarget",
        option_to_yojson oracle_sql_catalog_target_to_yojson x.oracle_sql_catalog_target );
      ( "PostgreSQLCatalogTarget",
        option_to_yojson postgre_sql_catalog_target_to_yojson x.postgre_sql_catalog_target );
      ("Route", option_to_yojson route_to_yojson x.route);
      ("DynamicTransform", option_to_yojson dynamic_transform_to_yojson x.dynamic_transform);
      ( "EvaluateDataQuality",
        option_to_yojson evaluate_data_quality_to_yojson x.evaluate_data_quality );
      ( "S3CatalogHudiSource",
        option_to_yojson s3_catalog_hudi_source_to_yojson x.s3_catalog_hudi_source );
      ("CatalogHudiSource", option_to_yojson catalog_hudi_source_to_yojson x.catalog_hudi_source);
      ("S3HudiSource", option_to_yojson s3_hudi_source_to_yojson x.s3_hudi_source);
      ( "S3HudiCatalogTarget",
        option_to_yojson s3_hudi_catalog_target_to_yojson x.s3_hudi_catalog_target );
      ( "S3HudiDirectTarget",
        option_to_yojson s3_hudi_direct_target_to_yojson x.s3_hudi_direct_target );
      ("DirectJDBCSource", option_to_yojson direct_jdbc_source_to_yojson x.direct_jdbc_source);
      ( "S3CatalogDeltaSource",
        option_to_yojson s3_catalog_delta_source_to_yojson x.s3_catalog_delta_source );
      ("CatalogDeltaSource", option_to_yojson catalog_delta_source_to_yojson x.catalog_delta_source);
      ("S3DeltaSource", option_to_yojson s3_delta_source_to_yojson x.s3_delta_source);
      ( "S3DeltaCatalogTarget",
        option_to_yojson s3_delta_catalog_target_to_yojson x.s3_delta_catalog_target );
      ( "S3DeltaDirectTarget",
        option_to_yojson s3_delta_direct_target_to_yojson x.s3_delta_direct_target );
      ( "AmazonRedshiftSource",
        option_to_yojson amazon_redshift_source_to_yojson x.amazon_redshift_source );
      ( "AmazonRedshiftTarget",
        option_to_yojson amazon_redshift_target_to_yojson x.amazon_redshift_target );
      ( "EvaluateDataQualityMultiFrame",
        option_to_yojson evaluate_data_quality_multi_frame_to_yojson
          x.evaluate_data_quality_multi_frame );
      ("Recipe", option_to_yojson recipe_to_yojson x.recipe);
      ("SnowflakeSource", option_to_yojson snowflake_source_to_yojson x.snowflake_source);
      ("SnowflakeTarget", option_to_yojson snowflake_target_to_yojson x.snowflake_target);
      ( "ConnectorDataSource",
        option_to_yojson connector_data_source_to_yojson x.connector_data_source );
      ( "ConnectorDataTarget",
        option_to_yojson connector_data_target_to_yojson x.connector_data_target );
      ( "S3CatalogIcebergSource",
        option_to_yojson s3_catalog_iceberg_source_to_yojson x.s3_catalog_iceberg_source );
      ( "CatalogIcebergSource",
        option_to_yojson catalog_iceberg_source_to_yojson x.catalog_iceberg_source );
      ( "S3IcebergCatalogTarget",
        option_to_yojson s3_iceberg_catalog_target_to_yojson x.s3_iceberg_catalog_target );
      ( "S3IcebergDirectTarget",
        option_to_yojson s3_iceberg_direct_target_to_yojson x.s3_iceberg_direct_target );
      ("S3ExcelSource", option_to_yojson s3_excel_source_to_yojson x.s3_excel_source);
      ( "S3HyperDirectTarget",
        option_to_yojson s3_hyper_direct_target_to_yojson x.s3_hyper_direct_target );
      ( "DynamoDBELTConnectorSource",
        option_to_yojson dynamo_dbelt_connector_source_to_yojson x.dynamo_dbelt_connector_source );
    ]

let code_gen_configuration_nodes_to_yojson tree =
  map_to_yojson node_id_to_yojson code_gen_configuration_node_to_yojson tree

let integer_value_to_yojson = int_to_yojson
let max_retries_to_yojson = int_to_yojson
let connection_string_to_yojson = string_to_yojson
let connection_string_list_to_yojson tree = list_to_yojson connection_string_to_yojson tree

let connections_list_to_yojson (x : connections_list) =
  assoc_to_yojson
    [ ("Connections", option_to_yojson connection_string_list_to_yojson x.connections) ]

let runtime_name_string_to_yojson = string_to_yojson
let python_version_string_to_yojson = string_to_yojson
let script_location_string_to_yojson = string_to_yojson

let job_command_to_yojson (x : job_command) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("ScriptLocation", option_to_yojson script_location_string_to_yojson x.script_location);
      ("PythonVersion", option_to_yojson python_version_string_to_yojson x.python_version);
      ("Runtime", option_to_yojson runtime_name_string_to_yojson x.runtime);
    ]

let max_concurrent_runs_to_yojson = int_to_yojson

let execution_property_to_yojson (x : execution_property) =
  assoc_to_yojson
    [ ("MaxConcurrentRuns", option_to_yojson max_concurrent_runs_to_yojson x.max_concurrent_runs) ]

let uri_string_to_yojson = string_to_yojson

let job_mode_to_yojson (x : job_mode) =
  match x with
  | SCRIPT -> `String "SCRIPT"
  | VISUAL -> `String "VISUAL"
  | NOTEBOOK -> `String "NOTEBOOK"

let job_update_to_yojson (x : job_update) =
  assoc_to_yojson
    [
      ("JobMode", option_to_yojson job_mode_to_yojson x.job_mode);
      ("JobRunQueuingEnabled", option_to_yojson nullable_boolean_to_yojson x.job_run_queuing_enabled);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("LogUri", option_to_yojson uri_string_to_yojson x.log_uri);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("ExecutionProperty", option_to_yojson execution_property_to_yojson x.execution_property);
      ("Command", option_to_yojson job_command_to_yojson x.command);
      ("DefaultArguments", option_to_yojson generic_map_to_yojson x.default_arguments);
      ("NonOverridableArguments", option_to_yojson generic_map_to_yojson x.non_overridable_arguments);
      ("Connections", option_to_yojson connections_list_to_yojson x.connections);
      ("MaxRetries", option_to_yojson max_retries_to_yojson x.max_retries);
      ("AllocatedCapacity", option_to_yojson integer_value_to_yojson x.allocated_capacity);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ( "CodeGenConfigurationNodes",
        option_to_yojson code_gen_configuration_nodes_to_yojson x.code_gen_configuration_nodes );
      ("ExecutionClass", option_to_yojson execution_class_to_yojson x.execution_class);
      ( "SourceControlDetails",
        option_to_yojson source_control_details_to_yojson x.source_control_details );
      ("MaintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
    ]

let update_job_request_to_yojson (x : update_job_request) =
  assoc_to_yojson
    [
      ("JobName", Some (name_string_to_yojson x.job_name));
      ("JobUpdate", Some (job_update_to_yojson x.job_update));
    ]

let integration_error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let update_integration_table_properties_response_to_yojson = unit_to_yojson
let string128_to_yojson = string_to_yojson

let integration_partition_to_yojson (x : integration_partition) =
  assoc_to_yojson
    [
      ("FieldName", option_to_yojson string128_to_yojson x.field_name);
      ("FunctionSpec", option_to_yojson string128_to_yojson x.function_spec);
      ("ConversionSpec", option_to_yojson string128_to_yojson x.conversion_spec);
    ]

let integration_partition_spec_list_to_yojson tree =
  list_to_yojson integration_partition_to_yojson tree

let unnest_spec_to_yojson (x : unnest_spec) =
  match x with
  | TOPLEVEL -> `String "TOPLEVEL"
  | FULL -> `String "FULL"
  | NOUNNEST -> `String "NOUNNEST"

let target_table_config_to_yojson (x : target_table_config) =
  assoc_to_yojson
    [
      ("UnnestSpec", option_to_yojson unnest_spec_to_yojson x.unnest_spec);
      ("PartitionSpec", option_to_yojson integration_partition_spec_list_to_yojson x.partition_spec);
      ("TargetTableName", option_to_yojson string128_to_yojson x.target_table_name);
    ]

let primary_key_list_to_yojson tree = list_to_yojson string128_to_yojson tree
let source_table_fields_list_to_yojson tree = list_to_yojson string128_to_yojson tree

let source_table_config_to_yojson (x : source_table_config) =
  assoc_to_yojson
    [
      ("Fields", option_to_yojson source_table_fields_list_to_yojson x.fields);
      ("FilterPredicate", option_to_yojson string128_to_yojson x.filter_predicate);
      ("PrimaryKey", option_to_yojson primary_key_list_to_yojson x.primary_key);
      ("RecordUpdateField", option_to_yojson string128_to_yojson x.record_update_field);
    ]

let string512_to_yojson = string_to_yojson

let update_integration_table_properties_request_to_yojson
    (x : update_integration_table_properties_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
      ("TableName", Some (string128_to_yojson x.table_name));
      ("SourceTableConfig", option_to_yojson source_table_config_to_yojson x.source_table_config);
      ("TargetTableConfig", option_to_yojson target_table_config_to_yojson x.target_table_config);
    ]

let string2048_to_yojson = string_to_yojson

let target_processing_properties_to_yojson (x : target_processing_properties) =
  assoc_to_yojson
    [
      ("RoleArn", option_to_yojson string128_to_yojson x.role_arn);
      ("KmsArn", option_to_yojson string2048_to_yojson x.kms_arn);
      ("ConnectionName", option_to_yojson string128_to_yojson x.connection_name);
      ("EventBusArn", option_to_yojson string2048_to_yojson x.event_bus_arn);
    ]

let source_processing_properties_to_yojson (x : source_processing_properties) =
  assoc_to_yojson [ ("RoleArn", option_to_yojson string128_to_yojson x.role_arn) ]

let update_integration_resource_property_response_to_yojson
    (x : update_integration_resource_property_response) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson string512_to_yojson x.resource_arn);
      ("ResourcePropertyArn", option_to_yojson string512_to_yojson x.resource_property_arn);
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
    ]

let update_integration_resource_property_request_to_yojson
    (x : update_integration_resource_property_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
    ]

let update_glue_identity_center_configuration_response_to_yojson = unit_to_yojson
let identity_center_scope_to_yojson = string_to_yojson
let identity_center_scopes_list_to_yojson tree = list_to_yojson identity_center_scope_to_yojson tree

let update_glue_identity_center_configuration_request_to_yojson
    (x : update_glue_identity_center_configuration_request) =
  assoc_to_yojson
    [
      ("Scopes", option_to_yojson identity_center_scopes_list_to_yojson x.scopes);
      ( "UserBackgroundSessionsEnabled",
        option_to_yojson nullable_boolean_to_yojson x.user_background_sessions_enabled );
    ]

let glossary_long_description_to_yojson = string_to_yojson
let glossary_short_description_to_yojson = string_to_yojson
let glossary_term_name_to_yojson = string_to_yojson
let glossary_id_to_yojson = string_to_yojson
let glossary_term_id_to_yojson = string_to_yojson

let update_glossary_term_response_to_yojson (x : update_glossary_term_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson glossary_term_id_to_yojson x.id);
      ("GlossaryId", option_to_yojson glossary_id_to_yojson x.glossary_id);
      ("Name", option_to_yojson glossary_term_name_to_yojson x.name);
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
      ("LongDescription", option_to_yojson glossary_long_description_to_yojson x.long_description);
    ]

let update_glossary_term_request_to_yojson (x : update_glossary_term_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (glossary_term_id_to_yojson x.identifier));
      ("Name", option_to_yojson glossary_term_name_to_yojson x.name);
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
      ("LongDescription", option_to_yojson glossary_long_description_to_yojson x.long_description);
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let metadata_description_to_yojson = string_to_yojson
let glossary_name_to_yojson = string_to_yojson

let update_glossary_response_to_yojson (x : update_glossary_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson glossary_id_to_yojson x.id);
      ("Name", option_to_yojson glossary_name_to_yojson x.name);
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
    ]

let update_glossary_request_to_yojson (x : update_glossary_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (glossary_id_to_yojson x.identifier));
      ("Name", option_to_yojson glossary_name_to_yojson x.name);
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let update_dev_endpoint_response_to_yojson = unit_to_yojson
let map_value_to_yojson tree = map_to_yojson generic_string_to_yojson generic_string_to_yojson tree
let string_list_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let dev_endpoint_custom_libraries_to_yojson (x : dev_endpoint_custom_libraries) =
  assoc_to_yojson
    [
      ( "ExtraPythonLibsS3Path",
        option_to_yojson generic_string_to_yojson x.extra_python_libs_s3_path );
      ("ExtraJarsS3Path", option_to_yojson generic_string_to_yojson x.extra_jars_s3_path);
    ]

let public_keys_list_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let update_dev_endpoint_request_to_yojson (x : update_dev_endpoint_request) =
  assoc_to_yojson
    [
      ("EndpointName", Some (generic_string_to_yojson x.endpoint_name));
      ("PublicKey", option_to_yojson generic_string_to_yojson x.public_key);
      ("AddPublicKeys", option_to_yojson public_keys_list_to_yojson x.add_public_keys);
      ("DeletePublicKeys", option_to_yojson public_keys_list_to_yojson x.delete_public_keys);
      ( "CustomLibraries",
        option_to_yojson dev_endpoint_custom_libraries_to_yojson x.custom_libraries );
      ("UpdateEtlLibraries", option_to_yojson boolean_value_to_yojson x.update_etl_libraries);
      ("DeleteArguments", option_to_yojson string_list_to_yojson x.delete_arguments);
      ("AddArguments", option_to_yojson map_value_to_yojson x.add_arguments);
    ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let data_quality_ruleset_string_to_yojson = string_to_yojson

let update_data_quality_ruleset_response_to_yojson (x : update_data_quality_ruleset_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Ruleset", option_to_yojson data_quality_ruleset_string_to_yojson x.ruleset);
    ]

let update_data_quality_ruleset_request_to_yojson (x : update_data_quality_ruleset_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Ruleset", option_to_yojson data_quality_ruleset_string_to_yojson x.ruleset);
    ]

let update_database_response_to_yojson = unit_to_yojson
let federation_identifier_to_yojson = string_to_yojson

let federated_database_to_yojson (x : federated_database) =
  assoc_to_yojson
    [
      ("Identifier", option_to_yojson federation_identifier_to_yojson x.identifier);
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ("ConnectionType", option_to_yojson name_string_to_yojson x.connection_type);
    ]

let database_identifier_to_yojson (x : database_identifier) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("Region", option_to_yojson name_string_to_yojson x.region);
    ]

let permission_to_yojson (x : permission) =
  match x with
  | ALL -> `String "ALL"
  | SELECT -> `String "SELECT"
  | ALTER -> `String "ALTER"
  | DROP -> `String "DROP"
  | DELETE -> `String "DELETE"
  | INSERT -> `String "INSERT"
  | CREATE_DATABASE -> `String "CREATE_DATABASE"
  | CREATE_TABLE -> `String "CREATE_TABLE"
  | DATA_LOCATION_ACCESS -> `String "DATA_LOCATION_ACCESS"

let permission_list_to_yojson tree = list_to_yojson permission_to_yojson tree
let data_lake_principal_string_to_yojson = string_to_yojson

let data_lake_principal_to_yojson (x : data_lake_principal) =
  assoc_to_yojson
    [
      ( "DataLakePrincipalIdentifier",
        option_to_yojson data_lake_principal_string_to_yojson x.data_lake_principal_identifier );
    ]

let principal_permissions_to_yojson (x : principal_permissions) =
  assoc_to_yojson
    [
      ("Principal", option_to_yojson data_lake_principal_to_yojson x.principal);
      ("Permissions", option_to_yojson permission_list_to_yojson x.permissions);
    ]

let principal_permissions_list_to_yojson tree = list_to_yojson principal_permissions_to_yojson tree

let database_input_to_yojson (x : database_input) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("LocationUri", option_to_yojson ur_i_to_yojson x.location_uri);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ( "CreateTableDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_table_default_permissions );
      ("TargetDatabase", option_to_yojson database_identifier_to_yojson x.target_database);
      ("FederatedDatabase", option_to_yojson federated_database_to_yojson x.federated_database);
    ]

let update_database_request_to_yojson (x : update_database_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("Name", Some (name_string_to_yojson x.name));
      ("DatabaseInput", Some (database_input_to_yojson x.database_input));
    ]

let version_mismatch_exception_to_yojson (x : version_mismatch_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let scheduler_transitioning_exception_to_yojson (x : scheduler_transitioning_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_crawler_schedule_response_to_yojson = unit_to_yojson
let cron_expression_to_yojson = string_to_yojson

let update_crawler_schedule_request_to_yojson (x : update_crawler_schedule_request) =
  assoc_to_yojson
    [
      ("CrawlerName", Some (name_string_to_yojson x.crawler_name));
      ("Schedule", option_to_yojson cron_expression_to_yojson x.schedule);
    ]

let crawler_running_exception_to_yojson (x : crawler_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_crawler_response_to_yojson = unit_to_yojson
let crawler_security_configuration_to_yojson = string_to_yojson
let crawler_configuration_to_yojson = string_to_yojson
let account_id_to_yojson = string_to_yojson

let lake_formation_configuration_to_yojson (x : lake_formation_configuration) =
  assoc_to_yojson
    [
      ( "UseLakeFormationCredentials",
        option_to_yojson nullable_boolean_to_yojson x.use_lake_formation_credentials );
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let crawler_lineage_settings_to_yojson (x : crawler_lineage_settings) =
  match x with ENABLE -> `String "ENABLE" | DISABLE -> `String "DISABLE"

let lineage_configuration_to_yojson (x : lineage_configuration) =
  assoc_to_yojson
    [
      ( "CrawlerLineageSettings",
        option_to_yojson crawler_lineage_settings_to_yojson x.crawler_lineage_settings );
    ]

let recrawl_behavior_to_yojson (x : recrawl_behavior) =
  match x with
  | CRAWL_EVERYTHING -> `String "CRAWL_EVERYTHING"
  | CRAWL_NEW_FOLDERS_ONLY -> `String "CRAWL_NEW_FOLDERS_ONLY"
  | CRAWL_EVENT_MODE -> `String "CRAWL_EVENT_MODE"

let recrawl_policy_to_yojson (x : recrawl_policy) =
  assoc_to_yojson
    [ ("RecrawlBehavior", option_to_yojson recrawl_behavior_to_yojson x.recrawl_behavior) ]

let delete_behavior_to_yojson (x : delete_behavior) =
  match x with
  | LOG -> `String "LOG"
  | DELETE_FROM_DATABASE -> `String "DELETE_FROM_DATABASE"
  | DEPRECATE_IN_DATABASE -> `String "DEPRECATE_IN_DATABASE"

let update_behavior_to_yojson (x : update_behavior) =
  match x with LOG -> `String "LOG" | UPDATE_IN_DATABASE -> `String "UPDATE_IN_DATABASE"

let schema_change_policy_to_yojson (x : schema_change_policy) =
  assoc_to_yojson
    [
      ("UpdateBehavior", option_to_yojson update_behavior_to_yojson x.update_behavior);
      ("DeleteBehavior", option_to_yojson delete_behavior_to_yojson x.delete_behavior);
    ]

let table_prefix_to_yojson = string_to_yojson
let classifier_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree
let path_to_yojson = string_to_yojson
let path_list_to_yojson tree = list_to_yojson path_to_yojson tree
let connection_name_to_yojson = string_to_yojson

let hudi_target_to_yojson (x : hudi_target) =
  assoc_to_yojson
    [
      ("Paths", option_to_yojson path_list_to_yojson x.paths);
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("Exclusions", option_to_yojson path_list_to_yojson x.exclusions);
      ( "MaximumTraversalDepth",
        option_to_yojson nullable_integer_to_yojson x.maximum_traversal_depth );
    ]

let hudi_target_list_to_yojson tree = list_to_yojson hudi_target_to_yojson tree

let iceberg_target_to_yojson (x : iceberg_target) =
  assoc_to_yojson
    [
      ("Paths", option_to_yojson path_list_to_yojson x.paths);
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("Exclusions", option_to_yojson path_list_to_yojson x.exclusions);
      ( "MaximumTraversalDepth",
        option_to_yojson nullable_integer_to_yojson x.maximum_traversal_depth );
    ]

let iceberg_target_list_to_yojson tree = list_to_yojson iceberg_target_to_yojson tree

let delta_target_to_yojson (x : delta_target) =
  assoc_to_yojson
    [
      ("DeltaTables", option_to_yojson path_list_to_yojson x.delta_tables);
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("WriteManifest", option_to_yojson nullable_boolean_to_yojson x.write_manifest);
      ( "CreateNativeDeltaTable",
        option_to_yojson nullable_boolean_to_yojson x.create_native_delta_table );
    ]

let delta_target_list_to_yojson tree = list_to_yojson delta_target_to_yojson tree
let event_queue_arn_to_yojson = string_to_yojson
let catalog_tables_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let catalog_target_to_yojson (x : catalog_target) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("Tables", Some (catalog_tables_list_to_yojson x.tables));
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("EventQueueArn", option_to_yojson event_queue_arn_to_yojson x.event_queue_arn);
      ("DlqEventQueueArn", option_to_yojson event_queue_arn_to_yojson x.dlq_event_queue_arn);
    ]

let catalog_target_list_to_yojson tree = list_to_yojson catalog_target_to_yojson tree

let dynamo_db_target_to_yojson (x : dynamo_db_target) =
  assoc_to_yojson
    [
      ("Path", option_to_yojson path_to_yojson x.path);
      ("scanAll", option_to_yojson nullable_boolean_to_yojson x.scan_all);
      ("scanRate", option_to_yojson nullable_double_to_yojson x.scan_rate);
    ]

let dynamo_db_target_list_to_yojson tree = list_to_yojson dynamo_db_target_to_yojson tree

let mongo_db_target_to_yojson (x : mongo_db_target) =
  assoc_to_yojson
    [
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("ScanAll", option_to_yojson nullable_boolean_to_yojson x.scan_all);
    ]

let mongo_db_target_list_to_yojson tree = list_to_yojson mongo_db_target_to_yojson tree

let jdbc_metadata_entry_to_yojson (x : jdbc_metadata_entry) =
  match x with COMMENTS -> `String "COMMENTS" | RAWTYPES -> `String "RAWTYPES"

let enable_additional_metadata_to_yojson tree = list_to_yojson jdbc_metadata_entry_to_yojson tree

let jdbc_target_to_yojson (x : jdbc_target) =
  assoc_to_yojson
    [
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("Exclusions", option_to_yojson path_list_to_yojson x.exclusions);
      ( "EnableAdditionalMetadata",
        option_to_yojson enable_additional_metadata_to_yojson x.enable_additional_metadata );
    ]

let jdbc_target_list_to_yojson tree = list_to_yojson jdbc_target_to_yojson tree

let s3_target_to_yojson (x : s3_target) =
  assoc_to_yojson
    [
      ("Path", option_to_yojson path_to_yojson x.path);
      ("Exclusions", option_to_yojson path_list_to_yojson x.exclusions);
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("SampleSize", option_to_yojson nullable_integer_to_yojson x.sample_size);
      ("EventQueueArn", option_to_yojson event_queue_arn_to_yojson x.event_queue_arn);
      ("DlqEventQueueArn", option_to_yojson event_queue_arn_to_yojson x.dlq_event_queue_arn);
    ]

let s3_target_list_to_yojson tree = list_to_yojson s3_target_to_yojson tree

let crawler_targets_to_yojson (x : crawler_targets) =
  assoc_to_yojson
    [
      ("S3Targets", option_to_yojson s3_target_list_to_yojson x.s3_targets);
      ("JdbcTargets", option_to_yojson jdbc_target_list_to_yojson x.jdbc_targets);
      ("MongoDBTargets", option_to_yojson mongo_db_target_list_to_yojson x.mongo_db_targets);
      ("DynamoDBTargets", option_to_yojson dynamo_db_target_list_to_yojson x.dynamo_db_targets);
      ("CatalogTargets", option_to_yojson catalog_target_list_to_yojson x.catalog_targets);
      ("DeltaTargets", option_to_yojson delta_target_list_to_yojson x.delta_targets);
      ("IcebergTargets", option_to_yojson iceberg_target_list_to_yojson x.iceberg_targets);
      ("HudiTargets", option_to_yojson hudi_target_list_to_yojson x.hudi_targets);
    ]

let description_string_removable_to_yojson = string_to_yojson
let database_name_to_yojson = string_to_yojson
let role_to_yojson = string_to_yojson

let update_crawler_request_to_yojson (x : update_crawler_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Role", option_to_yojson role_to_yojson x.role);
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
      ("Description", option_to_yojson description_string_removable_to_yojson x.description);
      ("Targets", option_to_yojson crawler_targets_to_yojson x.targets);
      ("Schedule", option_to_yojson cron_expression_to_yojson x.schedule);
      ("Classifiers", option_to_yojson classifier_name_list_to_yojson x.classifiers);
      ("TablePrefix", option_to_yojson table_prefix_to_yojson x.table_prefix);
      ("SchemaChangePolicy", option_to_yojson schema_change_policy_to_yojson x.schema_change_policy);
      ("RecrawlPolicy", option_to_yojson recrawl_policy_to_yojson x.recrawl_policy);
      ( "LineageConfiguration",
        option_to_yojson lineage_configuration_to_yojson x.lineage_configuration );
      ( "LakeFormationConfiguration",
        option_to_yojson lake_formation_configuration_to_yojson x.lake_formation_configuration );
      ("Configuration", option_to_yojson crawler_configuration_to_yojson x.configuration);
      ( "CrawlerSecurityConfiguration",
        option_to_yojson crawler_security_configuration_to_yojson x.crawler_security_configuration
      );
    ]

let update_connection_response_to_yojson = unit_to_yojson

let compute_environment_to_yojson (x : compute_environment) =
  match x with SPARK -> `String "SPARK" | ATHENA -> `String "ATHENA" | PYTHON -> `String "PYTHON"

let compute_environment_list_to_yojson tree = list_to_yojson compute_environment_to_yojson tree
let credential_value_to_yojson = string_to_yojson
let credential_key_to_yojson = string_to_yojson

let credential_map_to_yojson tree =
  map_to_yojson credential_key_to_yojson credential_value_to_yojson tree

let password_to_yojson = string_to_yojson
let username_to_yojson = string_to_yojson

let basic_authentication_credentials_to_yojson (x : basic_authentication_credentials) =
  assoc_to_yojson
    [
      ("Username", option_to_yojson username_to_yojson x.username);
      ("Password", option_to_yojson password_to_yojson x.password);
    ]

let kms_key_arn_to_yojson = string_to_yojson
let secret_arn_to_yojson = string_to_yojson
let jwt_token_to_yojson = string_to_yojson
let refresh_token_to_yojson = string_to_yojson
let access_token_to_yojson = string_to_yojson
let user_managed_client_application_client_secret_to_yojson = string_to_yojson

let o_auth2_credentials_to_yojson (x : o_auth2_credentials) =
  assoc_to_yojson
    [
      ( "UserManagedClientApplicationClientSecret",
        option_to_yojson user_managed_client_application_client_secret_to_yojson
          x.user_managed_client_application_client_secret );
      ("AccessToken", option_to_yojson access_token_to_yojson x.access_token);
      ("RefreshToken", option_to_yojson refresh_token_to_yojson x.refresh_token);
      ("JwtToken", option_to_yojson jwt_token_to_yojson x.jwt_token);
    ]

let redirect_uri_to_yojson = string_to_yojson
let authorization_code_to_yojson = string_to_yojson

let authorization_code_properties_to_yojson (x : authorization_code_properties) =
  assoc_to_yojson
    [
      ("AuthorizationCode", option_to_yojson authorization_code_to_yojson x.authorization_code);
      ("RedirectUri", option_to_yojson redirect_uri_to_yojson x.redirect_uri);
    ]

let token_url_parameter_value_to_yojson = string_to_yojson
let token_url_parameter_key_to_yojson = string_to_yojson

let token_url_parameters_map_to_yojson tree =
  map_to_yojson token_url_parameter_key_to_yojson token_url_parameter_value_to_yojson tree

let token_url_to_yojson = string_to_yojson
let aws_managed_client_application_reference_to_yojson = string_to_yojson
let user_managed_client_application_client_id_to_yojson = string_to_yojson

let o_auth2_client_application_to_yojson (x : o_auth2_client_application) =
  assoc_to_yojson
    [
      ( "UserManagedClientApplicationClientId",
        option_to_yojson user_managed_client_application_client_id_to_yojson
          x.user_managed_client_application_client_id );
      ( "AWSManagedClientApplicationReference",
        option_to_yojson aws_managed_client_application_reference_to_yojson
          x.aws_managed_client_application_reference );
    ]

let o_auth2_grant_type_to_yojson (x : o_auth2_grant_type) =
  match x with
  | AUTHORIZATION_CODE -> `String "AUTHORIZATION_CODE"
  | CLIENT_CREDENTIALS -> `String "CLIENT_CREDENTIALS"
  | JWT_BEARER -> `String "JWT_BEARER"

let o_auth2_properties_input_to_yojson (x : o_auth2_properties_input) =
  assoc_to_yojson
    [
      ("OAuth2GrantType", option_to_yojson o_auth2_grant_type_to_yojson x.o_auth2_grant_type);
      ( "OAuth2ClientApplication",
        option_to_yojson o_auth2_client_application_to_yojson x.o_auth2_client_application );
      ("TokenUrl", option_to_yojson token_url_to_yojson x.token_url);
      ( "TokenUrlParametersMap",
        option_to_yojson token_url_parameters_map_to_yojson x.token_url_parameters_map );
      ( "AuthorizationCodeProperties",
        option_to_yojson authorization_code_properties_to_yojson x.authorization_code_properties );
      ("OAuth2Credentials", option_to_yojson o_auth2_credentials_to_yojson x.o_auth2_credentials);
    ]

let authentication_type_to_yojson (x : authentication_type) =
  match x with
  | BASIC -> `String "BASIC"
  | OAUTH2 -> `String "OAUTH2"
  | CUSTOM -> `String "CUSTOM"
  | IAM -> `String "IAM"

let authentication_configuration_input_to_yojson (x : authentication_configuration_input) =
  assoc_to_yojson
    [
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
      ("OAuth2Properties", option_to_yojson o_auth2_properties_input_to_yojson x.o_auth2_properties);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ( "BasicAuthenticationCredentials",
        option_to_yojson basic_authentication_credentials_to_yojson
          x.basic_authentication_credentials );
      ( "CustomAuthenticationCredentials",
        option_to_yojson credential_map_to_yojson x.custom_authentication_credentials );
    ]

let security_group_id_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let physical_connection_requirements_to_yojson (x : physical_connection_requirements) =
  assoc_to_yojson
    [
      ("SubnetId", option_to_yojson name_string_to_yojson x.subnet_id);
      ( "SecurityGroupIdList",
        option_to_yojson security_group_id_list_to_yojson x.security_group_id_list );
      ("AvailabilityZone", option_to_yojson name_string_to_yojson x.availability_zone);
    ]

let property_value_to_yojson = string_to_yojson
let property_key_to_yojson = string_to_yojson
let property_map_to_yojson tree = map_to_yojson property_key_to_yojson property_value_to_yojson tree

let connection_property_key_to_yojson (x : connection_property_key) =
  match x with
  | HOST -> `String "HOST"
  | PORT -> `String "PORT"
  | USER_NAME -> `String "USERNAME"
  | PASSWORD -> `String "PASSWORD"
  | ENCRYPTED_PASSWORD -> `String "ENCRYPTED_PASSWORD"
  | JDBC_DRIVER_JAR_URI -> `String "JDBC_DRIVER_JAR_URI"
  | JDBC_DRIVER_CLASS_NAME -> `String "JDBC_DRIVER_CLASS_NAME"
  | JDBC_ENGINE -> `String "JDBC_ENGINE"
  | JDBC_ENGINE_VERSION -> `String "JDBC_ENGINE_VERSION"
  | CONFIG_FILES -> `String "CONFIG_FILES"
  | INSTANCE_ID -> `String "INSTANCE_ID"
  | JDBC_CONNECTION_URL -> `String "JDBC_CONNECTION_URL"
  | JDBC_ENFORCE_SSL -> `String "JDBC_ENFORCE_SSL"
  | CUSTOM_JDBC_CERT -> `String "CUSTOM_JDBC_CERT"
  | SKIP_CUSTOM_JDBC_CERT_VALIDATION -> `String "SKIP_CUSTOM_JDBC_CERT_VALIDATION"
  | CUSTOM_JDBC_CERT_STRING -> `String "CUSTOM_JDBC_CERT_STRING"
  | CONNECTION_URL -> `String "CONNECTION_URL"
  | KAFKA_BOOTSTRAP_SERVERS -> `String "KAFKA_BOOTSTRAP_SERVERS"
  | KAFKA_SSL_ENABLED -> `String "KAFKA_SSL_ENABLED"
  | KAFKA_CUSTOM_CERT -> `String "KAFKA_CUSTOM_CERT"
  | KAFKA_SKIP_CUSTOM_CERT_VALIDATION -> `String "KAFKA_SKIP_CUSTOM_CERT_VALIDATION"
  | KAFKA_CLIENT_KEYSTORE -> `String "KAFKA_CLIENT_KEYSTORE"
  | KAFKA_CLIENT_KEYSTORE_PASSWORD -> `String "KAFKA_CLIENT_KEYSTORE_PASSWORD"
  | KAFKA_CLIENT_KEY_PASSWORD -> `String "KAFKA_CLIENT_KEY_PASSWORD"
  | ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD -> `String "ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD"
  | ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD -> `String "ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD"
  | KAFKA_SASL_MECHANISM -> `String "KAFKA_SASL_MECHANISM"
  | KAFKA_SASL_PLAIN_USERNAME -> `String "KAFKA_SASL_PLAIN_USERNAME"
  | KAFKA_SASL_PLAIN_PASSWORD -> `String "KAFKA_SASL_PLAIN_PASSWORD"
  | ENCRYPTED_KAFKA_SASL_PLAIN_PASSWORD -> `String "ENCRYPTED_KAFKA_SASL_PLAIN_PASSWORD"
  | KAFKA_SASL_SCRAM_USERNAME -> `String "KAFKA_SASL_SCRAM_USERNAME"
  | KAFKA_SASL_SCRAM_PASSWORD -> `String "KAFKA_SASL_SCRAM_PASSWORD"
  | KAFKA_SASL_SCRAM_SECRETS_ARN -> `String "KAFKA_SASL_SCRAM_SECRETS_ARN"
  | ENCRYPTED_KAFKA_SASL_SCRAM_PASSWORD -> `String "ENCRYPTED_KAFKA_SASL_SCRAM_PASSWORD"
  | KAFKA_SASL_GSSAPI_KEYTAB -> `String "KAFKA_SASL_GSSAPI_KEYTAB"
  | KAFKA_SASL_GSSAPI_KRB5_CONF -> `String "KAFKA_SASL_GSSAPI_KRB5_CONF"
  | KAFKA_SASL_GSSAPI_SERVICE -> `String "KAFKA_SASL_GSSAPI_SERVICE"
  | KAFKA_SASL_GSSAPI_PRINCIPAL -> `String "KAFKA_SASL_GSSAPI_PRINCIPAL"
  | SECRET_ID -> `String "SECRET_ID"
  | CONNECTOR_URL -> `String "CONNECTOR_URL"
  | CONNECTOR_TYPE -> `String "CONNECTOR_TYPE"
  | CONNECTOR_CLASS_NAME -> `String "CONNECTOR_CLASS_NAME"
  | ENDPOINT -> `String "ENDPOINT"
  | ENDPOINT_TYPE -> `String "ENDPOINT_TYPE"
  | ROLE_ARN -> `String "ROLE_ARN"
  | REGION -> `String "REGION"
  | WORKGROUP_NAME -> `String "WORKGROUP_NAME"
  | CLUSTER_IDENTIFIER -> `String "CLUSTER_IDENTIFIER"
  | DATABASE -> `String "DATABASE"

let connection_properties_to_yojson tree =
  map_to_yojson connection_property_key_to_yojson value_string_to_yojson tree

let match_criteria_to_yojson tree = list_to_yojson name_string_to_yojson tree

let connection_type_to_yojson (x : connection_type) =
  match x with
  | JDBC -> `String "JDBC"
  | SFTP -> `String "SFTP"
  | MONGODB -> `String "MONGODB"
  | KAFKA -> `String "KAFKA"
  | NETWORK -> `String "NETWORK"
  | MARKETPLACE -> `String "MARKETPLACE"
  | CUSTOM -> `String "CUSTOM"
  | SALESFORCE -> `String "SALESFORCE"
  | VIEW_VALIDATION_REDSHIFT -> `String "VIEW_VALIDATION_REDSHIFT"
  | VIEW_VALIDATION_ATHENA -> `String "VIEW_VALIDATION_ATHENA"
  | GOOGLEADS -> `String "GOOGLEADS"
  | GOOGLESHEETS -> `String "GOOGLESHEETS"
  | GOOGLEANALYTICS4 -> `String "GOOGLEANALYTICS4"
  | SERVICENOW -> `String "SERVICENOW"
  | MARKETO -> `String "MARKETO"
  | SAPODATA -> `String "SAPODATA"
  | ZENDESK -> `String "ZENDESK"
  | JIRACLOUD -> `String "JIRACLOUD"
  | NETSUITEERP -> `String "NETSUITEERP"
  | HUBSPOT -> `String "HUBSPOT"
  | FACEBOOKADS -> `String "FACEBOOKADS"
  | INSTAGRAMADS -> `String "INSTAGRAMADS"
  | ZOHOCRM -> `String "ZOHOCRM"
  | SALESFORCEPARDOT -> `String "SALESFORCEPARDOT"
  | SALESFORCEMARKETINGCLOUD -> `String "SALESFORCEMARKETINGCLOUD"
  | ADOBEANALYTICS -> `String "ADOBEANALYTICS"
  | SLACK -> `String "SLACK"
  | LINKEDIN -> `String "LINKEDIN"
  | MIXPANEL -> `String "MIXPANEL"
  | ASANA -> `String "ASANA"
  | STRIPE -> `String "STRIPE"
  | SMARTSHEET -> `String "SMARTSHEET"
  | DATADOG -> `String "DATADOG"
  | WOOCOMMERCE -> `String "WOOCOMMERCE"
  | INTERCOM -> `String "INTERCOM"
  | SNAPCHATADS -> `String "SNAPCHATADS"
  | PAYPAL -> `String "PAYPAL"
  | QUICKBOOKS -> `String "QUICKBOOKS"
  | FACEBOOKPAGEINSIGHTS -> `String "FACEBOOKPAGEINSIGHTS"
  | FRESHDESK -> `String "FRESHDESK"
  | TWILIO -> `String "TWILIO"
  | DOCUSIGNMONITOR -> `String "DOCUSIGNMONITOR"
  | FRESHSALES -> `String "FRESHSALES"
  | ZOOM -> `String "ZOOM"
  | GOOGLESEARCHCONSOLE -> `String "GOOGLESEARCHCONSOLE"
  | SALESFORCECOMMERCECLOUD -> `String "SALESFORCECOMMERCECLOUD"
  | SAPCONCUR -> `String "SAPCONCUR"
  | DYNATRACE -> `String "DYNATRACE"
  | MICROSOFTDYNAMIC365FINANCEANDOPS -> `String "MICROSOFTDYNAMIC365FINANCEANDOPS"
  | MICROSOFTTEAMS -> `String "MICROSOFTTEAMS"
  | BLACKBAUDRAISEREDGENXT -> `String "BLACKBAUDRAISEREDGENXT"
  | MAILCHIMP -> `String "MAILCHIMP"
  | GITLAB -> `String "GITLAB"
  | PENDO -> `String "PENDO"
  | PRODUCTBOARD -> `String "PRODUCTBOARD"
  | CIRCLECI -> `String "CIRCLECI"
  | PIPEDIVE -> `String "PIPEDIVE"
  | SENDGRID -> `String "SENDGRID"
  | AZURECOSMOS -> `String "AZURECOSMOS"
  | AZURESQL -> `String "AZURESQL"
  | BIGQUERY -> `String "BIGQUERY"
  | BLACKBAUD -> `String "BLACKBAUD"
  | CLOUDERAHIVE -> `String "CLOUDERAHIVE"
  | CLOUDERAIMPALA -> `String "CLOUDERAIMPALA"
  | CLOUDWATCH -> `String "CLOUDWATCH"
  | CLOUDWATCHMETRICS -> `String "CLOUDWATCHMETRICS"
  | CMDB -> `String "CMDB"
  | DATALAKEGEN2 -> `String "DATALAKEGEN2"
  | DB2 -> `String "DB2"
  | DB2AS400 -> `String "DB2AS400"
  | DOCUMENTDB -> `String "DOCUMENTDB"
  | DOMO -> `String "DOMO"
  | DYNAMODB -> `String "DYNAMODB"
  | GOOGLECLOUDSTORAGE -> `String "GOOGLECLOUDSTORAGE"
  | HBASE -> `String "HBASE"
  | KUSTOMER -> `String "KUSTOMER"
  | MICROSOFTDYNAMICS365CRM -> `String "MICROSOFTDYNAMICS365CRM"
  | MONDAY -> `String "MONDAY"
  | MYSQL -> `String "MYSQL"
  | OKTA -> `String "OKTA"
  | OPENSEARCH -> `String "OPENSEARCH"
  | ORACLE -> `String "ORACLE"
  | PIPEDRIVE -> `String "PIPEDRIVE"
  | POSTGRESQL -> `String "POSTGRESQL"
  | SAPHANA -> `String "SAPHANA"
  | SQLSERVER -> `String "SQLSERVER"
  | SYNAPSE -> `String "SYNAPSE"
  | TERADATA -> `String "TERADATA"
  | TERADATANOS -> `String "TERADATANOS"
  | TIMESTREAM -> `String "TIMESTREAM"
  | TPCDS -> `String "TPCDS"
  | VERTICA -> `String "VERTICA"

let connection_input_to_yojson (x : connection_input) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("MatchCriteria", option_to_yojson match_criteria_to_yojson x.match_criteria);
      ("ConnectionProperties", Some (connection_properties_to_yojson x.connection_properties));
      ("SparkProperties", option_to_yojson property_map_to_yojson x.spark_properties);
      ("AthenaProperties", option_to_yojson property_map_to_yojson x.athena_properties);
      ("PythonProperties", option_to_yojson property_map_to_yojson x.python_properties);
      ( "PhysicalConnectionRequirements",
        option_to_yojson physical_connection_requirements_to_yojson
          x.physical_connection_requirements );
      ( "AuthenticationConfiguration",
        option_to_yojson authentication_configuration_input_to_yojson x.authentication_configuration
      );
      ("ValidateCredentials", option_to_yojson boolean__to_yojson x.validate_credentials);
      ( "ValidateForComputeEnvironments",
        option_to_yojson compute_environment_list_to_yojson x.validate_for_compute_environments );
    ]

let update_connection_request_to_yojson (x : update_connection_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("Name", Some (name_string_to_yojson x.name));
      ("ConnectionInput", Some (connection_input_to_yojson x.connection_input));
    ]

let update_column_statistics_task_settings_response_to_yojson = unit_to_yojson
let sample_size_percentage_to_yojson = double_to_yojson
let column_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let update_column_statistics_task_settings_request_to_yojson
    (x : update_column_statistics_task_settings_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("Role", option_to_yojson name_string_to_yojson x.role);
      ("Schedule", option_to_yojson cron_expression_to_yojson x.schedule);
      ("ColumnNameList", option_to_yojson column_name_list_to_yojson x.column_name_list);
      ("SampleSize", option_to_yojson sample_size_percentage_to_yojson x.sample_size);
      ("CatalogID", option_to_yojson name_string_to_yojson x.catalog_i_d);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
    ]

let error_detail_to_yojson (x : error_detail) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson name_string_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
    ]

let non_negative_long_to_yojson = long_to_yojson
let non_negative_double_to_yojson = double_to_yojson

let binary_column_statistics_data_to_yojson (x : binary_column_statistics_data) =
  assoc_to_yojson
    [
      ("MaximumLength", Some (non_negative_long_to_yojson x.maximum_length));
      ("AverageLength", Some (non_negative_double_to_yojson x.average_length));
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
    ]

let string_column_statistics_data_to_yojson (x : string_column_statistics_data) =
  assoc_to_yojson
    [
      ("MaximumLength", Some (non_negative_long_to_yojson x.maximum_length));
      ("AverageLength", Some (non_negative_double_to_yojson x.average_length));
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("NumberOfDistinctValues", Some (non_negative_long_to_yojson x.number_of_distinct_values));
    ]

let long_to_yojson = long_to_yojson

let long_column_statistics_data_to_yojson (x : long_column_statistics_data) =
  assoc_to_yojson
    [
      ("MinimumValue", option_to_yojson long_to_yojson x.minimum_value);
      ("MaximumValue", option_to_yojson long_to_yojson x.maximum_value);
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("NumberOfDistinctValues", Some (non_negative_long_to_yojson x.number_of_distinct_values));
    ]

let double_to_yojson = double_to_yojson

let double_column_statistics_data_to_yojson (x : double_column_statistics_data) =
  assoc_to_yojson
    [
      ("MinimumValue", option_to_yojson double_to_yojson x.minimum_value);
      ("MaximumValue", option_to_yojson double_to_yojson x.maximum_value);
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("NumberOfDistinctValues", Some (non_negative_long_to_yojson x.number_of_distinct_values));
    ]

let blob_to_yojson = blob_to_yojson

let decimal_number_to_yojson (x : decimal_number) =
  assoc_to_yojson
    [
      ("UnscaledValue", Some (blob_to_yojson x.unscaled_value));
      ("Scale", Some (integer_to_yojson x.scale));
    ]

let decimal_column_statistics_data_to_yojson (x : decimal_column_statistics_data) =
  assoc_to_yojson
    [
      ("MinimumValue", option_to_yojson decimal_number_to_yojson x.minimum_value);
      ("MaximumValue", option_to_yojson decimal_number_to_yojson x.maximum_value);
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("NumberOfDistinctValues", Some (non_negative_long_to_yojson x.number_of_distinct_values));
    ]

let date_column_statistics_data_to_yojson (x : date_column_statistics_data) =
  assoc_to_yojson
    [
      ("MinimumValue", option_to_yojson timestamp_to_yojson x.minimum_value);
      ("MaximumValue", option_to_yojson timestamp_to_yojson x.maximum_value);
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("NumberOfDistinctValues", Some (non_negative_long_to_yojson x.number_of_distinct_values));
    ]

let boolean_column_statistics_data_to_yojson (x : boolean_column_statistics_data) =
  assoc_to_yojson
    [
      ("NumberOfTrues", Some (non_negative_long_to_yojson x.number_of_trues));
      ("NumberOfFalses", Some (non_negative_long_to_yojson x.number_of_falses));
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
    ]

let column_statistics_type_to_yojson (x : column_statistics_type) =
  match x with
  | BOOLEAN -> `String "BOOLEAN"
  | DATE -> `String "DATE"
  | DECIMAL -> `String "DECIMAL"
  | DOUBLE -> `String "DOUBLE"
  | LONG -> `String "LONG"
  | STRING -> `String "STRING"
  | BINARY -> `String "BINARY"

let column_statistics_data_to_yojson (x : column_statistics_data) =
  assoc_to_yojson
    [
      ("Type", Some (column_statistics_type_to_yojson x.type_));
      ( "BooleanColumnStatisticsData",
        option_to_yojson boolean_column_statistics_data_to_yojson x.boolean_column_statistics_data
      );
      ( "DateColumnStatisticsData",
        option_to_yojson date_column_statistics_data_to_yojson x.date_column_statistics_data );
      ( "DecimalColumnStatisticsData",
        option_to_yojson decimal_column_statistics_data_to_yojson x.decimal_column_statistics_data
      );
      ( "DoubleColumnStatisticsData",
        option_to_yojson double_column_statistics_data_to_yojson x.double_column_statistics_data );
      ( "LongColumnStatisticsData",
        option_to_yojson long_column_statistics_data_to_yojson x.long_column_statistics_data );
      ( "StringColumnStatisticsData",
        option_to_yojson string_column_statistics_data_to_yojson x.string_column_statistics_data );
      ( "BinaryColumnStatisticsData",
        option_to_yojson binary_column_statistics_data_to_yojson x.binary_column_statistics_data );
    ]

let type_string_to_yojson = string_to_yojson

let column_statistics_to_yojson (x : column_statistics) =
  assoc_to_yojson
    [
      ("ColumnName", Some (name_string_to_yojson x.column_name));
      ("ColumnType", Some (type_string_to_yojson x.column_type));
      ("AnalyzedTime", Some (timestamp_to_yojson x.analyzed_time));
      ("StatisticsData", Some (column_statistics_data_to_yojson x.statistics_data));
    ]

let column_statistics_error_to_yojson (x : column_statistics_error) =
  assoc_to_yojson
    [
      ("ColumnStatistics", option_to_yojson column_statistics_to_yojson x.column_statistics);
      ("Error", option_to_yojson error_detail_to_yojson x.error);
    ]

let column_statistics_errors_to_yojson tree = list_to_yojson column_statistics_error_to_yojson tree

let update_column_statistics_for_table_response_to_yojson
    (x : update_column_statistics_for_table_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson column_statistics_errors_to_yojson x.errors) ]

let update_column_statistics_list_to_yojson tree = list_to_yojson column_statistics_to_yojson tree

let update_column_statistics_for_table_request_to_yojson
    (x : update_column_statistics_for_table_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ( "ColumnStatisticsList",
        Some (update_column_statistics_list_to_yojson x.column_statistics_list) );
    ]

let update_column_statistics_for_partition_response_to_yojson
    (x : update_column_statistics_for_partition_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson column_statistics_errors_to_yojson x.errors) ]

let update_column_statistics_for_partition_request_to_yojson
    (x : update_column_statistics_for_partition_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
      ( "ColumnStatisticsList",
        Some (update_column_statistics_list_to_yojson x.column_statistics_list) );
    ]

let update_classifier_response_to_yojson = unit_to_yojson

let csv_serde_option_to_yojson (x : csv_serde_option) =
  match x with
  | OpenCSVSerDe -> `String "OpenCSVSerDe"
  | LazySimpleSerDe -> `String "LazySimpleSerDe"
  | None_ -> `String "None"

let custom_datatypes_to_yojson tree = list_to_yojson name_string_to_yojson tree
let csv_header_to_yojson tree = list_to_yojson name_string_to_yojson tree

let csv_header_option_to_yojson (x : csv_header_option) =
  match x with
  | UNKNOWN -> `String "UNKNOWN"
  | PRESENT -> `String "PRESENT"
  | ABSENT -> `String "ABSENT"

let csv_quote_symbol_to_yojson = string_to_yojson
let csv_column_delimiter_to_yojson = string_to_yojson

let update_csv_classifier_request_to_yojson (x : update_csv_classifier_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Delimiter", option_to_yojson csv_column_delimiter_to_yojson x.delimiter);
      ("QuoteSymbol", option_to_yojson csv_quote_symbol_to_yojson x.quote_symbol);
      ("ContainsHeader", option_to_yojson csv_header_option_to_yojson x.contains_header);
      ("Header", option_to_yojson csv_header_to_yojson x.header);
      ("DisableValueTrimming", option_to_yojson nullable_boolean_to_yojson x.disable_value_trimming);
      ("AllowSingleColumn", option_to_yojson nullable_boolean_to_yojson x.allow_single_column);
      ( "CustomDatatypeConfigured",
        option_to_yojson nullable_boolean_to_yojson x.custom_datatype_configured );
      ("CustomDatatypes", option_to_yojson custom_datatypes_to_yojson x.custom_datatypes);
      ("Serde", option_to_yojson csv_serde_option_to_yojson x.serde);
    ]

let json_path_to_yojson = string_to_yojson

let update_json_classifier_request_to_yojson (x : update_json_classifier_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("JsonPath", option_to_yojson json_path_to_yojson x.json_path);
    ]

let row_tag_to_yojson = string_to_yojson
let classification_to_yojson = string_to_yojson

let update_xml_classifier_request_to_yojson (x : update_xml_classifier_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Classification", option_to_yojson classification_to_yojson x.classification);
      ("RowTag", option_to_yojson row_tag_to_yojson x.row_tag);
    ]

let custom_patterns_to_yojson = string_to_yojson
let grok_pattern_to_yojson = string_to_yojson

let update_grok_classifier_request_to_yojson (x : update_grok_classifier_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Classification", option_to_yojson classification_to_yojson x.classification);
      ("GrokPattern", option_to_yojson grok_pattern_to_yojson x.grok_pattern);
      ("CustomPatterns", option_to_yojson custom_patterns_to_yojson x.custom_patterns);
    ]

let update_classifier_request_to_yojson (x : update_classifier_request) =
  assoc_to_yojson
    [
      ("GrokClassifier", option_to_yojson update_grok_classifier_request_to_yojson x.grok_classifier);
      ("XMLClassifier", option_to_yojson update_xml_classifier_request_to_yojson x.xml_classifier);
      ("JsonClassifier", option_to_yojson update_json_classifier_request_to_yojson x.json_classifier);
      ("CsvClassifier", option_to_yojson update_csv_classifier_request_to_yojson x.csv_classifier);
    ]

let update_catalog_response_to_yojson = unit_to_yojson

let overwrite_child_resource_permissions_with_default_enum_to_yojson
    (x : overwrite_child_resource_permissions_with_default_enum) =
  match x with Accept -> `String "Accept" | Deny -> `String "Deny"

let allow_full_table_external_data_access_enum_to_yojson
    (x : allow_full_table_external_data_access_enum) =
  match x with True -> `String "True" | False -> `String "False"

let iam_role_arn_to_yojson = string_to_yojson

let iceberg_optimization_properties_to_yojson (x : iceberg_optimization_properties) =
  assoc_to_yojson
    [
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("Compaction", option_to_yojson parameters_map_to_yojson x.compaction);
      ("Retention", option_to_yojson parameters_map_to_yojson x.retention);
      ("OrphanFileDeletion", option_to_yojson parameters_map_to_yojson x.orphan_file_deletion);
    ]

let resource_arn_string_to_yojson = string_to_yojson

let data_lake_access_properties_to_yojson (x : data_lake_access_properties) =
  assoc_to_yojson
    [
      ("DataLakeAccess", option_to_yojson boolean__to_yojson x.data_lake_access);
      ("DataTransferRole", option_to_yojson iam_role_arn_to_yojson x.data_transfer_role);
      ("KmsKey", option_to_yojson resource_arn_string_to_yojson x.kms_key);
      ("CatalogType", option_to_yojson name_string_to_yojson x.catalog_type);
    ]

let catalog_properties_to_yojson (x : catalog_properties) =
  assoc_to_yojson
    [
      ( "DataLakeAccessProperties",
        option_to_yojson data_lake_access_properties_to_yojson x.data_lake_access_properties );
      ( "IcebergOptimizationProperties",
        option_to_yojson iceberg_optimization_properties_to_yojson x.iceberg_optimization_properties
      );
      ("CustomProperties", option_to_yojson parameters_map_to_yojson x.custom_properties);
    ]

let target_redshift_catalog_to_yojson (x : target_redshift_catalog) =
  assoc_to_yojson [ ("CatalogArn", Some (resource_arn_string_to_yojson x.catalog_arn)) ]

let federated_catalog_to_yojson (x : federated_catalog) =
  assoc_to_yojson
    [
      ("Identifier", option_to_yojson federation_identifier_to_yojson x.identifier);
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ("ConnectionType", option_to_yojson name_string_to_yojson x.connection_type);
    ]

let catalog_input_to_yojson (x : catalog_input) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("FederatedCatalog", option_to_yojson federated_catalog_to_yojson x.federated_catalog);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ( "TargetRedshiftCatalog",
        option_to_yojson target_redshift_catalog_to_yojson x.target_redshift_catalog );
      ("CatalogProperties", option_to_yojson catalog_properties_to_yojson x.catalog_properties);
      ( "CreateTableDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_table_default_permissions );
      ( "CreateDatabaseDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_database_default_permissions
      );
      ( "AllowFullTableExternalDataAccess",
        option_to_yojson allow_full_table_external_data_access_enum_to_yojson
          x.allow_full_table_external_data_access );
      ( "OverwriteChildResourcePermissionsWithDefault",
        option_to_yojson overwrite_child_resource_permissions_with_default_enum_to_yojson
          x.overwrite_child_resource_permissions_with_default );
    ]

let update_catalog_request_to_yojson (x : update_catalog_request) =
  assoc_to_yojson
    [
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("CatalogInput", Some (catalog_input_to_yojson x.catalog_input));
    ]

let illegal_blueprint_state_exception_to_yojson (x : illegal_blueprint_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_blueprint_response_to_yojson (x : update_blueprint_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let orchestration_s3_location_to_yojson = string_to_yojson
let orchestration_name_string_to_yojson = string_to_yojson

let update_blueprint_request_to_yojson (x : update_blueprint_request) =
  assoc_to_yojson
    [
      ("Name", Some (orchestration_name_string_to_yojson x.name));
      ("Description", option_to_yojson generic512_char_string_to_yojson x.description);
      ("BlueprintLocation", Some (orchestration_s3_location_to_yojson x.blueprint_location));
    ]

let updated_at_to_yojson = timestamp_epoch_seconds_to_yojson
let asset_description_to_yojson = string_to_yojson
let asset_name_to_yojson = string_to_yojson
let asset_id_to_yojson = string_to_yojson

let update_asset_response_to_yojson (x : update_asset_response) =
  assoc_to_yojson
    [
      ("Id", Some (asset_id_to_yojson x.id));
      ("Name", option_to_yojson asset_name_to_yojson x.name);
      ("Description", option_to_yojson asset_description_to_yojson x.description);
      ("UpdatedAt", option_to_yojson updated_at_to_yojson x.updated_at);
    ]

let update_asset_request_to_yojson (x : update_asset_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (asset_id_to_yojson x.identifier));
      ("Name", option_to_yojson asset_name_to_yojson x.name);
      ("Description", option_to_yojson asset_description_to_yojson x.description);
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (glue_resource_arn_to_yojson x.resource_arn));
      ("TagsToRemove", Some (tag_keys_list_to_yojson x.tags_to_remove));
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let test_connection_response_to_yojson = unit_to_yojson

let test_connection_input_to_yojson (x : test_connection_input) =
  assoc_to_yojson
    [
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("ConnectionProperties", Some (connection_properties_to_yojson x.connection_properties));
      ( "AuthenticationConfiguration",
        option_to_yojson authentication_configuration_input_to_yojson x.authentication_configuration
      );
    ]

let test_connection_request_to_yojson (x : test_connection_request) =
  assoc_to_yojson
    [
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ( "TestConnectionInput",
        option_to_yojson test_connection_input_to_yojson x.test_connection_input );
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson
let tags_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (glue_resource_arn_to_yojson x.resource_arn));
      ("TagsToAdd", Some (tags_map_to_yojson x.tags_to_add));
    ]

let illegal_workflow_state_exception_to_yojson (x : illegal_workflow_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let stop_workflow_run_response_to_yojson = unit_to_yojson

let stop_workflow_run_request_to_yojson (x : stop_workflow_run_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name)); ("RunId", Some (id_string_to_yojson x.run_id));
    ]

let stop_trigger_response_to_yojson (x : stop_trigger_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let stop_trigger_request_to_yojson (x : stop_trigger_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let illegal_session_state_exception_to_yojson (x : illegal_session_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let stop_session_response_to_yojson (x : stop_session_response) =
  assoc_to_yojson [ ("Id", option_to_yojson name_string_to_yojson x.id) ]

let stop_session_request_to_yojson (x : stop_session_request) =
  assoc_to_yojson
    [
      ("Id", Some (name_string_to_yojson x.id));
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
    ]

let materialized_view_refresh_task_stopping_exception_to_yojson
    (x : materialized_view_refresh_task_stopping_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let materialized_view_refresh_task_not_running_exception_to_yojson
    (x : materialized_view_refresh_task_not_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let stop_materialized_view_refresh_task_run_response_to_yojson = unit_to_yojson

let stop_materialized_view_refresh_task_run_request_to_yojson
    (x : stop_materialized_view_refresh_task_run_request) =
  assoc_to_yojson
    [
      ("CatalogId", Some (name_string_to_yojson x.catalog_id));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
    ]

let scheduler_not_running_exception_to_yojson (x : scheduler_not_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let stop_crawler_schedule_response_to_yojson = unit_to_yojson

let stop_crawler_schedule_request_to_yojson (x : stop_crawler_schedule_request) =
  assoc_to_yojson [ ("CrawlerName", Some (name_string_to_yojson x.crawler_name)) ]

let crawler_stopping_exception_to_yojson (x : crawler_stopping_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let crawler_not_running_exception_to_yojson (x : crawler_not_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let stop_crawler_response_to_yojson = unit_to_yojson

let stop_crawler_request_to_yojson (x : stop_crawler_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let stop_column_statistics_task_run_schedule_response_to_yojson = unit_to_yojson

let stop_column_statistics_task_run_schedule_request_to_yojson
    (x : stop_column_statistics_task_run_schedule_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
    ]

let column_statistics_task_stopping_exception_to_yojson
    (x : column_statistics_task_stopping_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let column_statistics_task_not_running_exception_to_yojson
    (x : column_statistics_task_not_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let stop_column_statistics_task_run_response_to_yojson = unit_to_yojson

let stop_column_statistics_task_run_request_to_yojson (x : stop_column_statistics_task_run_request)
    =
  assoc_to_yojson
    [
      ("DatabaseName", Some (database_name_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
    ]

let concurrent_runs_exceeded_exception_to_yojson (x : concurrent_runs_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let start_workflow_run_response_to_yojson (x : start_workflow_run_response) =
  assoc_to_yojson [ ("RunId", option_to_yojson id_string_to_yojson x.run_id) ]

let start_workflow_run_request_to_yojson (x : start_workflow_run_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("RunProperties", option_to_yojson workflow_run_properties_to_yojson x.run_properties);
    ]

let start_trigger_response_to_yojson (x : start_trigger_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let start_trigger_request_to_yojson (x : start_trigger_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let start_ml_labeling_set_generation_task_run_response_to_yojson
    (x : start_ml_labeling_set_generation_task_run_response) =
  assoc_to_yojson [ ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id) ]

let start_ml_labeling_set_generation_task_run_request_to_yojson
    (x : start_ml_labeling_set_generation_task_run_request) =
  assoc_to_yojson
    [
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
      ("OutputS3Path", Some (uri_string_to_yojson x.output_s3_path));
    ]

let ml_transform_not_ready_exception_to_yojson (x : ml_transform_not_ready_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let start_ml_evaluation_task_run_response_to_yojson (x : start_ml_evaluation_task_run_response) =
  assoc_to_yojson [ ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id) ]

let start_ml_evaluation_task_run_request_to_yojson (x : start_ml_evaluation_task_run_request) =
  assoc_to_yojson [ ("TransformId", Some (hash_string_to_yojson x.transform_id)) ]

let materialized_view_refresh_task_running_exception_to_yojson
    (x : materialized_view_refresh_task_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let uui_dv4_to_yojson = string_to_yojson

let start_materialized_view_refresh_task_run_response_to_yojson
    (x : start_materialized_view_refresh_task_run_response) =
  assoc_to_yojson
    [
      ( "MaterializedViewRefreshTaskRunId",
        option_to_yojson uui_dv4_to_yojson x.materialized_view_refresh_task_run_id );
    ]

let start_materialized_view_refresh_task_run_request_to_yojson
    (x : start_materialized_view_refresh_task_run_request) =
  assoc_to_yojson
    [
      ("CatalogId", Some (name_string_to_yojson x.catalog_id));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("FullRefresh", option_to_yojson nullable_boolean_to_yojson x.full_refresh);
    ]

let start_job_run_response_to_yojson (x : start_job_run_response) =
  assoc_to_yojson [ ("JobRunId", option_to_yojson id_string_to_yojson x.job_run_id) ]

let orchestration_policy_json_string_to_yojson = string_to_yojson

let start_job_run_request_to_yojson (x : start_job_run_request) =
  assoc_to_yojson
    [
      ("JobName", Some (name_string_to_yojson x.job_name));
      ("JobRunQueuingEnabled", option_to_yojson nullable_boolean_to_yojson x.job_run_queuing_enabled);
      ("JobRunId", option_to_yojson id_string_to_yojson x.job_run_id);
      ("Arguments", option_to_yojson generic_map_to_yojson x.arguments);
      ("AllocatedCapacity", option_to_yojson integer_value_to_yojson x.allocated_capacity);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("ExecutionClass", option_to_yojson execution_class_to_yojson x.execution_class);
      ( "ExecutionRoleSessionPolicy",
        option_to_yojson orchestration_policy_json_string_to_yojson x.execution_role_session_policy
      );
    ]

let start_import_labels_task_run_response_to_yojson (x : start_import_labels_task_run_response) =
  assoc_to_yojson [ ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id) ]

let replace_boolean_to_yojson = bool_to_yojson

let start_import_labels_task_run_request_to_yojson (x : start_import_labels_task_run_request) =
  assoc_to_yojson
    [
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
      ("InputS3Path", Some (uri_string_to_yojson x.input_s3_path));
      ("ReplaceAllLabels", option_to_yojson replace_boolean_to_yojson x.replace_all_labels);
    ]

let start_export_labels_task_run_response_to_yojson (x : start_export_labels_task_run_response) =
  assoc_to_yojson [ ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id) ]

let start_export_labels_task_run_request_to_yojson (x : start_export_labels_task_run_request) =
  assoc_to_yojson
    [
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
      ("OutputS3Path", Some (uri_string_to_yojson x.output_s3_path));
    ]

let start_data_quality_ruleset_evaluation_run_response_to_yojson
    (x : start_data_quality_ruleset_evaluation_run_response) =
  assoc_to_yojson [ ("RunId", option_to_yojson hash_string_to_yojson x.run_id) ]

let pre_processing_query_string_to_yojson = string_to_yojson

let glue_table_additional_options_to_yojson tree =
  map_to_yojson name_string_to_yojson description_string_to_yojson tree

let data_quality_glue_table_to_yojson (x : data_quality_glue_table) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("CatalogId", option_to_yojson name_string_to_yojson x.catalog_id);
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ( "AdditionalOptions",
        option_to_yojson glue_table_additional_options_to_yojson x.additional_options );
      ( "PreProcessingQuery",
        option_to_yojson pre_processing_query_string_to_yojson x.pre_processing_query );
    ]

let glue_table_to_yojson (x : glue_table) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("CatalogId", option_to_yojson name_string_to_yojson x.catalog_id);
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ( "AdditionalOptions",
        option_to_yojson glue_table_additional_options_to_yojson x.additional_options );
    ]

let data_source_to_yojson (x : data_source) =
  assoc_to_yojson
    [
      ("GlueTable", option_to_yojson glue_table_to_yojson x.glue_table);
      ( "DataQualityGlueTable",
        option_to_yojson data_quality_glue_table_to_yojson x.data_quality_glue_table );
    ]

let data_source_map_to_yojson tree = map_to_yojson name_string_to_yojson data_source_to_yojson tree
let ruleset_names_to_yojson tree = list_to_yojson name_string_to_yojson tree

let dq_composite_rule_evaluation_method_to_yojson (x : dq_composite_rule_evaluation_method) =
  match x with COLUMN -> `String "COLUMN" | ROW -> `String "ROW"

let data_quality_evaluation_run_additional_run_options_to_yojson
    (x : data_quality_evaluation_run_additional_run_options) =
  assoc_to_yojson
    [
      ( "CloudWatchMetricsEnabled",
        option_to_yojson nullable_boolean_to_yojson x.cloud_watch_metrics_enabled );
      ("ResultsS3Prefix", option_to_yojson uri_string_to_yojson x.results_s3_prefix);
      ( "CompositeRuleEvaluationMethod",
        option_to_yojson dq_composite_rule_evaluation_method_to_yojson
          x.composite_rule_evaluation_method );
      ("CustomLogGroupPrefix", option_to_yojson generic_string_to_yojson x.custom_log_group_prefix);
    ]

let start_data_quality_ruleset_evaluation_run_request_to_yojson
    (x : start_data_quality_ruleset_evaluation_run_request) =
  assoc_to_yojson
    [
      ("DataSource", Some (data_source_to_yojson x.data_source));
      ("Role", Some (role_string_to_yojson x.role));
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("ClientToken", option_to_yojson hash_string_to_yojson x.client_token);
      ( "AdditionalRunOptions",
        option_to_yojson data_quality_evaluation_run_additional_run_options_to_yojson
          x.additional_run_options );
      ("RulesetNames", Some (ruleset_names_to_yojson x.ruleset_names));
      ("AdditionalDataSources", option_to_yojson data_source_map_to_yojson x.additional_data_sources);
    ]

let start_data_quality_rule_recommendation_run_response_to_yojson
    (x : start_data_quality_rule_recommendation_run_response) =
  assoc_to_yojson [ ("RunId", option_to_yojson hash_string_to_yojson x.run_id) ]

let start_data_quality_rule_recommendation_run_request_to_yojson
    (x : start_data_quality_rule_recommendation_run_request) =
  assoc_to_yojson
    [
      ("DataSource", Some (data_source_to_yojson x.data_source));
      ("Role", Some (role_string_to_yojson x.role));
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("CreatedRulesetName", option_to_yojson name_string_to_yojson x.created_ruleset_name);
      ( "DataQualitySecurityConfiguration",
        option_to_yojson name_string_to_yojson x.data_quality_security_configuration );
      ("ClientToken", option_to_yojson hash_string_to_yojson x.client_token);
    ]

let scheduler_running_exception_to_yojson (x : scheduler_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let no_schedule_exception_to_yojson (x : no_schedule_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let start_crawler_schedule_response_to_yojson = unit_to_yojson

let start_crawler_schedule_request_to_yojson (x : start_crawler_schedule_request) =
  assoc_to_yojson [ ("CrawlerName", Some (name_string_to_yojson x.crawler_name)) ]

let start_crawler_response_to_yojson = unit_to_yojson

let start_crawler_request_to_yojson (x : start_crawler_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let start_column_statistics_task_run_schedule_response_to_yojson = unit_to_yojson

let start_column_statistics_task_run_schedule_request_to_yojson
    (x : start_column_statistics_task_run_schedule_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
    ]

let column_statistics_task_running_exception_to_yojson
    (x : column_statistics_task_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let start_column_statistics_task_run_response_to_yojson
    (x : start_column_statistics_task_run_response) =
  assoc_to_yojson
    [
      ( "ColumnStatisticsTaskRunId",
        option_to_yojson hash_string_to_yojson x.column_statistics_task_run_id );
    ]

let start_column_statistics_task_run_request_to_yojson
    (x : start_column_statistics_task_run_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("ColumnNameList", option_to_yojson column_name_list_to_yojson x.column_name_list);
      ("Role", Some (name_string_to_yojson x.role));
      ("SampleSize", option_to_yojson sample_size_percentage_to_yojson x.sample_size);
      ("CatalogID", option_to_yojson name_string_to_yojson x.catalog_i_d);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
    ]

let start_blueprint_run_response_to_yojson (x : start_blueprint_run_response) =
  assoc_to_yojson [ ("RunId", option_to_yojson id_string_to_yojson x.run_id) ]

let orchestration_iam_role_arn_to_yojson = string_to_yojson
let blueprint_parameters_to_yojson = string_to_yojson

let start_blueprint_run_request_to_yojson (x : start_blueprint_run_request) =
  assoc_to_yojson
    [
      ("BlueprintName", Some (orchestration_name_string_to_yojson x.blueprint_name));
      ("Parameters", option_to_yojson blueprint_parameters_to_yojson x.parameters);
      ("RoleArn", Some (orchestration_iam_role_arn_to_yojson x.role_arn));
    ]

let resource_state_to_yojson (x : resource_state) =
  match x with
  | QUEUED -> `String "QUEUED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCESS -> `String "SUCCESS"
  | STOPPED -> `String "STOPPED"
  | FAILED -> `String "FAILED"

let view_validation_to_yojson (x : view_validation) =
  assoc_to_yojson
    [
      ("Dialect", option_to_yojson view_dialect_to_yojson x.dialect);
      ("DialectVersion", option_to_yojson view_dialect_version_string_to_yojson x.dialect_version);
      ("ViewValidationText", option_to_yojson view_text_string_to_yojson x.view_validation_text);
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
      ("State", option_to_yojson resource_state_to_yojson x.state);
      ("Error", option_to_yojson error_detail_to_yojson x.error);
    ]

let view_validation_list_to_yojson tree = list_to_yojson view_validation_to_yojson tree

let resource_action_to_yojson (x : resource_action) =
  match x with UPDATE -> `String "UPDATE" | CREATE -> `String "CREATE"

let iceberg_sort_order_list_to_yojson tree = list_to_yojson iceberg_sort_order_to_yojson tree

let iceberg_partition_spec_list_to_yojson tree =
  list_to_yojson iceberg_partition_spec_to_yojson tree

let iceberg_schema_list_to_yojson tree = list_to_yojson iceberg_schema_to_yojson tree
let table_id_string_to_yojson = string_to_yojson

let iceberg_table_metadata_to_yojson (x : iceberg_table_metadata) =
  assoc_to_yojson
    [
      ("FormatVersion", option_to_yojson version_string_to_yojson x.format_version);
      ("TableUuid", option_to_yojson table_id_string_to_yojson x.table_uuid);
      ("Location", option_to_yojson location_string_to_yojson x.location);
      ("Properties", option_to_yojson string_to_string_map_to_yojson x.properties);
      ("Schemas", option_to_yojson iceberg_schema_list_to_yojson x.schemas);
      ("CurrentSchemaId", option_to_yojson integer_to_yojson x.current_schema_id);
      ("LastColumnId", option_to_yojson integer_to_yojson x.last_column_id);
      ("PartitionSpecs", option_to_yojson iceberg_partition_spec_list_to_yojson x.partition_specs);
      ("DefaultSpecId", option_to_yojson integer_to_yojson x.default_spec_id);
      ("LastPartitionId", option_to_yojson integer_to_yojson x.last_partition_id);
      ("SortOrders", option_to_yojson iceberg_sort_order_list_to_yojson x.sort_orders);
      ("DefaultSortOrderId", option_to_yojson integer_to_yojson x.default_sort_order_id);
    ]

let view_representation_to_yojson (x : view_representation) =
  assoc_to_yojson
    [
      ("Dialect", option_to_yojson view_dialect_to_yojson x.dialect);
      ("DialectVersion", option_to_yojson view_dialect_version_string_to_yojson x.dialect_version);
      ("ViewOriginalText", option_to_yojson view_text_string_to_yojson x.view_original_text);
      ("ViewExpandedText", option_to_yojson view_text_string_to_yojson x.view_expanded_text);
      ("ValidationConnection", option_to_yojson name_string_to_yojson x.validation_connection);
      ("IsStale", option_to_yojson nullable_boolean_to_yojson x.is_stale);
    ]

let view_representation_list_to_yojson tree = list_to_yojson view_representation_to_yojson tree

let view_definition_to_yojson (x : view_definition) =
  assoc_to_yojson
    [
      ("IsProtected", option_to_yojson nullable_boolean_to_yojson x.is_protected);
      ("Definer", option_to_yojson arn_string_to_yojson x.definer);
      ("ViewVersionId", option_to_yojson table_version_id_to_yojson x.view_version_id);
      ("ViewVersionToken", option_to_yojson hash_string_to_yojson x.view_version_token);
      ("RefreshSeconds", option_to_yojson refresh_seconds_to_yojson x.refresh_seconds);
      ("LastRefreshType", option_to_yojson last_refresh_type_to_yojson x.last_refresh_type);
      ("SubObjects", option_to_yojson view_sub_objects_list_to_yojson x.sub_objects);
      ( "SubObjectVersionIds",
        option_to_yojson view_sub_object_version_ids_list_to_yojson x.sub_object_version_ids );
      ("Representations", option_to_yojson view_representation_list_to_yojson x.representations);
    ]

let federated_table_to_yojson (x : federated_table) =
  assoc_to_yojson
    [
      ("Identifier", option_to_yojson federation_identifier_to_yojson x.identifier);
      ("DatabaseIdentifier", option_to_yojson federation_identifier_to_yojson x.database_identifier);
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ("ConnectionType", option_to_yojson name_string_to_yojson x.connection_type);
    ]

let rec table_status_to_yojson (x : table_status) =
  assoc_to_yojson
    [
      ("RequestedBy", option_to_yojson name_string_to_yojson x.requested_by);
      ("UpdatedBy", option_to_yojson name_string_to_yojson x.updated_by);
      ("RequestTime", option_to_yojson timestamp_to_yojson x.request_time);
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
      ("Action", option_to_yojson resource_action_to_yojson x.action);
      ("State", option_to_yojson resource_state_to_yojson x.state);
      ("Error", option_to_yojson error_detail_to_yojson x.error);
      ("Details", option_to_yojson status_details_to_yojson x.details);
    ]

and table_to_yojson (x : table) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Owner", option_to_yojson name_string_to_yojson x.owner);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
      ("LastAccessTime", option_to_yojson timestamp_to_yojson x.last_access_time);
      ("LastAnalyzedTime", option_to_yojson timestamp_to_yojson x.last_analyzed_time);
      ("Retention", option_to_yojson non_negative_integer_to_yojson x.retention);
      ("StorageDescriptor", option_to_yojson storage_descriptor_to_yojson x.storage_descriptor);
      ("PartitionKeys", option_to_yojson column_list_to_yojson x.partition_keys);
      ("ViewOriginalText", option_to_yojson view_text_string_to_yojson x.view_original_text);
      ("ViewExpandedText", option_to_yojson view_text_string_to_yojson x.view_expanded_text);
      ("TableType", option_to_yojson table_type_string_to_yojson x.table_type);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("CreatedBy", option_to_yojson name_string_to_yojson x.created_by);
      ( "IsRegisteredWithLakeFormation",
        option_to_yojson boolean__to_yojson x.is_registered_with_lake_formation );
      ("TargetTable", option_to_yojson table_identifier_to_yojson x.target_table);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("VersionId", option_to_yojson version_string_to_yojson x.version_id);
      ("FederatedTable", option_to_yojson federated_table_to_yojson x.federated_table);
      ("ViewDefinition", option_to_yojson view_definition_to_yojson x.view_definition);
      ("IsMultiDialectView", option_to_yojson nullable_boolean_to_yojson x.is_multi_dialect_view);
      ("IsMaterializedView", option_to_yojson nullable_boolean_to_yojson x.is_materialized_view);
      ( "IcebergTableMetadata",
        option_to_yojson iceberg_table_metadata_to_yojson x.iceberg_table_metadata );
      ("Status", option_to_yojson table_status_to_yojson x.status);
    ]

and status_details_to_yojson (x : status_details) =
  assoc_to_yojson
    [
      ("RequestedChange", option_to_yojson table_to_yojson x.requested_change);
      ("ViewValidations", option_to_yojson view_validation_list_to_yojson x.view_validations);
    ]

let table_list_to_yojson tree = list_to_yojson table_to_yojson tree
let token_to_yojson = string_to_yojson

let search_tables_response_to_yojson (x : search_tables_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("TableList", option_to_yojson table_list_to_yojson x.table_list);
    ]

let resource_share_type_to_yojson (x : resource_share_type) =
  match x with
  | FOREIGN -> `String "FOREIGN"
  | ALL -> `String "ALL"
  | FEDERATED -> `String "FEDERATED"

let page_size_to_yojson = int_to_yojson

let sort_to_yojson (x : sort) =
  match x with ASCENDING -> `String "ASC" | DESCENDING -> `String "DESC"

let sort_criterion_to_yojson (x : sort_criterion) =
  assoc_to_yojson
    [
      ("FieldName", option_to_yojson value_string_to_yojson x.field_name);
      ("Sort", option_to_yojson sort_to_yojson x.sort);
    ]

let sort_criteria_to_yojson tree = list_to_yojson sort_criterion_to_yojson tree

let comparator_to_yojson (x : comparator) =
  match x with
  | EQUALS -> `String "EQUALS"
  | GREATER_THAN -> `String "GREATER_THAN"
  | LESS_THAN -> `String "LESS_THAN"
  | GREATER_THAN_EQUALS -> `String "GREATER_THAN_EQUALS"
  | LESS_THAN_EQUALS -> `String "LESS_THAN_EQUALS"

let property_predicate_to_yojson (x : property_predicate) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson value_string_to_yojson x.key);
      ("Value", option_to_yojson value_string_to_yojson x.value);
      ("Comparator", option_to_yojson comparator_to_yojson x.comparator);
    ]

let search_property_predicates_to_yojson tree = list_to_yojson property_predicate_to_yojson tree

let search_tables_request_to_yojson (x : search_tables_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Filters", option_to_yojson search_property_predicates_to_yojson x.filters);
      ("SearchText", option_to_yojson value_string_to_yojson x.search_text);
      ("SortCriteria", option_to_yojson sort_criteria_to_yojson x.sort_criteria);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("ResourceShareType", option_to_yojson resource_share_type_to_yojson x.resource_share_type);
      ("IncludeStatusDetails", option_to_yojson boolean_nullable_to_yojson x.include_status_details);
    ]

let search_next_token_to_yojson = string_to_yojson
let asset_type_id_to_yojson = string_to_yojson
let search_result_name_to_yojson = string_to_yojson

let search_result_item_to_yojson (x : search_result_item) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson asset_id_to_yojson x.id);
      ("AssetName", option_to_yojson search_result_name_to_yojson x.asset_name);
      ("AssetDescription", option_to_yojson asset_description_to_yojson x.asset_description);
      ("UpdatedAt", option_to_yojson updated_at_to_yojson x.updated_at);
      ("AssetTypeId", option_to_yojson asset_type_id_to_yojson x.asset_type_id);
    ]

let search_result_item_list_to_yojson tree = list_to_yojson search_result_item_to_yojson tree

let search_assets_output_to_yojson (x : search_assets_output) =
  assoc_to_yojson
    [
      ("Items", option_to_yojson search_result_item_list_to_yojson x.items);
      ("NextToken", option_to_yojson search_next_token_to_yojson x.next_token);
    ]

let search_filter_string_value_to_yojson = string_to_yojson

let search_map_filter_value_to_yojson (x : search_map_filter_value) =
  match x with
  | StringValue arg ->
      assoc_to_yojson [ ("StringValue", Some (search_filter_string_value_to_yojson arg)) ]

let search_map_key_to_yojson = string_to_yojson
let search_attribute_to_yojson = string_to_yojson

let search_map_filter_to_yojson (x : search_map_filter) =
  assoc_to_yojson
    [
      ("Attribute", Some (search_attribute_to_yojson x.attribute));
      ("Key", Some (search_map_key_to_yojson x.key));
      ("Value", Some (search_map_filter_value_to_yojson x.value));
    ]

let search_filter_long_value_to_yojson = long_to_yojson

let search_filter_value_to_yojson (x : search_filter_value) =
  match x with
  | StringValue arg ->
      assoc_to_yojson [ ("StringValue", Some (search_filter_string_value_to_yojson arg)) ]
  | LongValue arg ->
      assoc_to_yojson [ ("LongValue", Some (search_filter_long_value_to_yojson arg)) ]

let search_filter_operator_to_yojson (x : search_filter_operator) =
  match x with
  | Equals -> `String "equals"
  | GreaterThan -> `String "greaterThan"
  | GreaterThanOrEquals -> `String "greaterThanOrEquals"
  | LessThan -> `String "lessThan"
  | LessThanOrEquals -> `String "lessThanOrEquals"
  | NotExists -> `String "notExists"

let search_attribute_filter_to_yojson (x : search_attribute_filter) =
  assoc_to_yojson
    [
      ("Attribute", Some (search_attribute_to_yojson x.attribute));
      ("Operator", Some (search_filter_operator_to_yojson x.operator));
      ("Value", option_to_yojson search_filter_value_to_yojson x.value);
    ]

let rec search_filter_clause_list_to_yojson tree =
  list_to_yojson search_filter_clause_to_yojson tree

and search_filter_clause_to_yojson (x : search_filter_clause) =
  match x with
  | AndAllFilters arg ->
      assoc_to_yojson [ ("AndAllFilters", Some (search_filter_clause_list_to_yojson arg)) ]
  | OrAnyFilters arg ->
      assoc_to_yojson [ ("OrAnyFilters", Some (search_filter_clause_list_to_yojson arg)) ]
  | AttributeFilter arg ->
      assoc_to_yojson [ ("AttributeFilter", Some (search_attribute_filter_to_yojson arg)) ]
  | MapFilter arg -> assoc_to_yojson [ ("MapFilter", Some (search_map_filter_to_yojson arg)) ]

let search_sort_order_to_yojson (x : search_sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let search_sort_to_yojson (x : search_sort) =
  assoc_to_yojson
    [
      ("Attribute", Some (search_attribute_to_yojson x.attribute));
      ("Order", option_to_yojson search_sort_order_to_yojson x.order);
    ]

let search_max_results_to_yojson = int_to_yojson
let search_text_to_yojson = string_to_yojson

let search_assets_input_to_yojson (x : search_assets_input) =
  assoc_to_yojson
    [
      ("SearchText", option_to_yojson search_text_to_yojson x.search_text);
      ("MaxResults", option_to_yojson search_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson search_next_token_to_yojson x.next_token);
      ("Sort", option_to_yojson search_sort_to_yojson x.sort);
      ("FilterClause", option_to_yojson search_filter_clause_to_yojson x.filter_clause);
    ]

let orchestration_message_string_to_yojson = string_to_yojson

let session_busy_exception_to_yojson (x : session_busy_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson orchestration_message_string_to_yojson x.message) ]

let run_statement_response_to_yojson (x : run_statement_response) =
  assoc_to_yojson [ ("Id", option_to_yojson integer_value_to_yojson x.id) ]

let orchestration_statement_code_string_to_yojson = string_to_yojson

let run_statement_request_to_yojson (x : run_statement_request) =
  assoc_to_yojson
    [
      ("SessionId", Some (name_string_to_yojson x.session_id));
      ("Code", Some (orchestration_statement_code_string_to_yojson x.code));
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
    ]

let node_id_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let resume_workflow_run_response_to_yojson (x : resume_workflow_run_response) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("NodeIds", option_to_yojson node_id_list_to_yojson x.node_ids);
    ]

let resume_workflow_run_request_to_yojson (x : resume_workflow_run_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("NodeIds", Some (node_id_list_to_yojson x.node_ids));
    ]

let json_value_to_yojson = string_to_yojson
let run_id_to_yojson = string_to_yojson
let job_name_to_yojson = string_to_yojson

let job_bookmark_entry_to_yojson (x : job_bookmark_entry) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("Version", option_to_yojson integer_value_to_yojson x.version);
      ("Run", option_to_yojson integer_value_to_yojson x.run);
      ("Attempt", option_to_yojson integer_value_to_yojson x.attempt);
      ("PreviousRunId", option_to_yojson run_id_to_yojson x.previous_run_id);
      ("RunId", option_to_yojson run_id_to_yojson x.run_id);
      ("JobBookmark", option_to_yojson json_value_to_yojson x.job_bookmark);
    ]

let reset_job_bookmark_response_to_yojson (x : reset_job_bookmark_response) =
  assoc_to_yojson
    [ ("JobBookmarkEntry", option_to_yojson job_bookmark_entry_to_yojson x.job_bookmark_entry) ]

let reset_job_bookmark_request_to_yojson (x : reset_job_bookmark_request) =
  assoc_to_yojson
    [
      ("JobName", Some (job_name_to_yojson x.job_name));
      ("RunId", option_to_yojson run_id_to_yojson x.run_id);
    ]

let metadata_value_string_to_yojson = string_to_yojson
let metadata_key_string_to_yojson = string_to_yojson

let remove_schema_version_metadata_response_to_yojson (x : remove_schema_version_metadata_response)
    =
  assoc_to_yojson
    [
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("LatestVersion", option_to_yojson latest_schema_version_boolean_to_yojson x.latest_version);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("MetadataKey", option_to_yojson metadata_key_string_to_yojson x.metadata_key);
      ("MetadataValue", option_to_yojson metadata_value_string_to_yojson x.metadata_value);
    ]

let metadata_key_value_pair_to_yojson (x : metadata_key_value_pair) =
  assoc_to_yojson
    [
      ("MetadataKey", option_to_yojson metadata_key_string_to_yojson x.metadata_key);
      ("MetadataValue", option_to_yojson metadata_value_string_to_yojson x.metadata_value);
    ]

let remove_schema_version_metadata_input_to_yojson (x : remove_schema_version_metadata_input) =
  assoc_to_yojson
    [
      ("SchemaId", option_to_yojson schema_id_to_yojson x.schema_id);
      ( "SchemaVersionNumber",
        option_to_yojson schema_version_number_to_yojson x.schema_version_number );
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("MetadataKeyValue", Some (metadata_key_value_pair_to_yojson x.metadata_key_value));
    ]

let schema_version_status_to_yojson (x : schema_version_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | PENDING -> `String "PENDING"
  | FAILURE -> `String "FAILURE"
  | DELETING -> `String "DELETING"

let register_schema_version_response_to_yojson (x : register_schema_version_response) =
  assoc_to_yojson
    [
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("Status", option_to_yojson schema_version_status_to_yojson x.status);
    ]

let schema_definition_string_to_yojson = string_to_yojson

let register_schema_version_input_to_yojson (x : register_schema_version_input) =
  assoc_to_yojson
    [
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
      ("SchemaDefinition", Some (schema_definition_string_to_yojson x.schema_definition));
    ]

let register_connection_type_response_to_yojson (x : register_connection_type_response) =
  assoc_to_yojson
    [ ("ConnectionTypeArn", option_to_yojson glue_resource_arn_to_yojson x.connection_type_arn) ]

let field_data_type_to_yojson (x : field_data_type) =
  match x with
  | INT -> `String "INT"
  | SMALLINT -> `String "SMALLINT"
  | BIGINT -> `String "BIGINT"
  | FLOAT -> `String "FLOAT"
  | LONG -> `String "LONG"
  | DATE -> `String "DATE"
  | BOOLEAN -> `String "BOOLEAN"
  | MAP -> `String "MAP"
  | ARRAY -> `String "ARRAY"
  | STRING -> `String "STRING"
  | TIMESTAMP -> `String "TIMESTAMP"
  | DECIMAL -> `String "DECIMAL"
  | BYTE -> `String "BYTE"
  | SHORT -> `String "SHORT"
  | DOUBLE -> `String "DOUBLE"
  | STRUCT -> `String "STRUCT"
  | BINARY -> `String "BINARY"
  | UNION -> `String "UNION"

let field_definition_to_yojson (x : field_definition) =
  assoc_to_yojson
    [
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("FieldDataType", Some (field_data_type_to_yojson x.field_data_type));
    ]

let field_definition_map_key_string_to_yojson = string_to_yojson

let field_definition_map_to_yojson tree =
  map_to_yojson field_definition_map_key_string_to_yojson field_definition_to_yojson tree

let connector_property_key_to_yojson = string_to_yojson
let json_path_string_to_yojson = string_to_yojson

let response_extraction_mapping_to_yojson (x : response_extraction_mapping) =
  assoc_to_yojson
    [
      ("ContentPath", option_to_yojson json_path_string_to_yojson x.content_path);
      ("HeaderKey", option_to_yojson connector_property_key_to_yojson x.header_key);
    ]

let property_location_to_yojson (x : property_location) =
  match x with
  | HEADER -> `String "HEADER"
  | BODY -> `String "BODY"
  | QUERY_PARAM -> `String "QUERY_PARAM"
  | PATH -> `String "PATH"

let default_value_to_yojson = string_to_yojson

let extracted_parameter_to_yojson (x : extracted_parameter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson connector_property_key_to_yojson x.key);
      ("DefaultValue", option_to_yojson default_value_to_yojson x.default_value);
      ("PropertyLocation", option_to_yojson property_location_to_yojson x.property_location);
      ("Value", option_to_yojson response_extraction_mapping_to_yojson x.value);
    ]

let offset_configuration_to_yojson (x : offset_configuration) =
  assoc_to_yojson
    [
      ("OffsetParameter", Some (extracted_parameter_to_yojson x.offset_parameter));
      ("LimitParameter", Some (extracted_parameter_to_yojson x.limit_parameter));
    ]

let cursor_configuration_to_yojson (x : cursor_configuration) =
  assoc_to_yojson
    [
      ("NextPage", Some (extracted_parameter_to_yojson x.next_page));
      ("LimitParameter", option_to_yojson extracted_parameter_to_yojson x.limit_parameter);
    ]

let pagination_configuration_to_yojson (x : pagination_configuration) =
  assoc_to_yojson
    [
      ("CursorConfiguration", option_to_yojson cursor_configuration_to_yojson x.cursor_configuration);
      ("OffsetConfiguration", option_to_yojson offset_configuration_to_yojson x.offset_configuration);
    ]

let response_configuration_to_yojson (x : response_configuration) =
  assoc_to_yojson
    [
      ("ResultPath", Some (json_path_string_to_yojson x.result_path));
      ("ErrorPath", option_to_yojson json_path_string_to_yojson x.error_path);
    ]

let property_type_to_yojson (x : property_type) =
  match x with
  | USER_INPUT -> `String "USER_INPUT"
  | SECRET -> `String "SECRET"
  | READ_ONLY -> `String "READ_ONLY"
  | UNUSED -> `String "UNUSED"
  | SECRET_OR_USER_INPUT -> `String "SECRET_OR_USER_INPUT"

let list_of_string_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let bool__to_yojson = bool_to_yojson
let property_name_to_yojson = string_to_yojson

let connector_property_to_yojson (x : connector_property) =
  assoc_to_yojson
    [
      ("Name", Some (property_name_to_yojson x.name));
      ("KeyOverride", option_to_yojson connector_property_key_to_yojson x.key_override);
      ("Required", Some (bool__to_yojson x.required));
      ( "DefaultValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.default_value );
      ("AllowedValues", option_to_yojson list_of_string_to_yojson x.allowed_values);
      ("PropertyLocation", option_to_yojson property_location_to_yojson x.property_location);
      ("PropertyType", Some (property_type_to_yojson x.property_type));
    ]

let connector_property_list_to_yojson tree = list_to_yojson connector_property_to_yojson tree
let path_string_to_yojson = string_to_yojson

let http_method_to_yojson (x : http_method) =
  match x with GET -> `String "GET" | POST -> `String "POST"

let source_configuration_to_yojson (x : source_configuration) =
  assoc_to_yojson
    [
      ("RequestMethod", option_to_yojson http_method_to_yojson x.request_method);
      ("RequestPath", option_to_yojson path_string_to_yojson x.request_path);
      ("RequestParameters", option_to_yojson connector_property_list_to_yojson x.request_parameters);
      ( "ResponseConfiguration",
        option_to_yojson response_configuration_to_yojson x.response_configuration );
      ( "PaginationConfiguration",
        option_to_yojson pagination_configuration_to_yojson x.pagination_configuration );
    ]

let entity_configuration_to_yojson (x : entity_configuration) =
  assoc_to_yojson
    [
      ("SourceConfiguration", option_to_yojson source_configuration_to_yojson x.source_configuration);
      ("Schema", option_to_yojson field_definition_map_to_yojson x.schema);
    ]

let entity_configuration_map_key_string_to_yojson = string_to_yojson

let entity_configuration_map_to_yojson tree =
  map_to_yojson entity_configuration_map_key_string_to_yojson entity_configuration_to_yojson tree

let rest_configuration_to_yojson (x : rest_configuration) =
  assoc_to_yojson
    [
      ( "GlobalSourceConfiguration",
        option_to_yojson source_configuration_to_yojson x.global_source_configuration );
      ( "ValidationEndpointConfiguration",
        option_to_yojson source_configuration_to_yojson x.validation_endpoint_configuration );
      ( "EntityConfigurations",
        option_to_yojson entity_configuration_map_to_yojson x.entity_configurations );
    ]

let custom_authentication_properties_to_yojson (x : custom_authentication_properties) =
  assoc_to_yojson
    [
      ( "AuthenticationParameters",
        Some (connector_property_list_to_yojson x.authentication_parameters) );
    ]

let basic_authentication_properties_to_yojson (x : basic_authentication_properties) =
  assoc_to_yojson
    [
      ("Username", option_to_yojson connector_property_to_yojson x.username);
      ("Password", option_to_yojson connector_property_to_yojson x.password);
    ]

let content_type_to_yojson (x : content_type) =
  match x with
  | APPLICATION_JSON -> `String "APPLICATION_JSON"
  | URL_ENCODED -> `String "URL_ENCODED"

let connector_authorization_code_properties_to_yojson (x : connector_authorization_code_properties)
    =
  assoc_to_yojson
    [
      ( "AuthorizationCodeUrl",
        option_to_yojson connector_property_to_yojson x.authorization_code_url );
      ("AuthorizationCode", option_to_yojson connector_property_to_yojson x.authorization_code);
      ("RedirectUri", option_to_yojson connector_property_to_yojson x.redirect_uri);
      ("TokenUrl", option_to_yojson connector_property_to_yojson x.token_url);
      ("RequestMethod", option_to_yojson http_method_to_yojson x.request_method);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("ClientId", option_to_yojson connector_property_to_yojson x.client_id);
      ("ClientSecret", option_to_yojson connector_property_to_yojson x.client_secret);
      ("Scope", option_to_yojson connector_property_to_yojson x.scope);
      ("Prompt", option_to_yojson connector_property_to_yojson x.prompt);
      ( "TokenUrlParameters",
        option_to_yojson connector_property_list_to_yojson x.token_url_parameters );
    ]

let jwt_bearer_properties_to_yojson (x : jwt_bearer_properties) =
  assoc_to_yojson
    [
      ("TokenUrl", option_to_yojson connector_property_to_yojson x.token_url);
      ("RequestMethod", option_to_yojson http_method_to_yojson x.request_method);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("JwtToken", option_to_yojson connector_property_to_yojson x.jwt_token);
      ( "TokenUrlParameters",
        option_to_yojson connector_property_list_to_yojson x.token_url_parameters );
    ]

let client_credentials_properties_to_yojson (x : client_credentials_properties) =
  assoc_to_yojson
    [
      ("TokenUrl", option_to_yojson connector_property_to_yojson x.token_url);
      ("RequestMethod", option_to_yojson http_method_to_yojson x.request_method);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("ClientId", option_to_yojson connector_property_to_yojson x.client_id);
      ("ClientSecret", option_to_yojson connector_property_to_yojson x.client_secret);
      ("Scope", option_to_yojson connector_property_to_yojson x.scope);
      ( "TokenUrlParameters",
        option_to_yojson connector_property_list_to_yojson x.token_url_parameters );
    ]

let connector_o_auth2_grant_type_to_yojson (x : connector_o_auth2_grant_type) =
  match x with
  | CLIENT_CREDENTIALS -> `String "CLIENT_CREDENTIALS"
  | JWT_BEARER -> `String "JWT_BEARER"
  | AUTHORIZATION_CODE -> `String "AUTHORIZATION_CODE"

let connector_o_auth2_properties_to_yojson (x : connector_o_auth2_properties) =
  assoc_to_yojson
    [
      ("OAuth2GrantType", Some (connector_o_auth2_grant_type_to_yojson x.o_auth2_grant_type));
      ( "ClientCredentialsProperties",
        option_to_yojson client_credentials_properties_to_yojson x.client_credentials_properties );
      ( "JWTBearerProperties",
        option_to_yojson jwt_bearer_properties_to_yojson x.jwt_bearer_properties );
      ( "AuthorizationCodeProperties",
        option_to_yojson connector_authorization_code_properties_to_yojson
          x.authorization_code_properties );
    ]

let authentication_types_to_yojson tree = list_to_yojson authentication_type_to_yojson tree

let connector_authentication_configuration_to_yojson (x : connector_authentication_configuration) =
  assoc_to_yojson
    [
      ("AuthenticationTypes", Some (authentication_types_to_yojson x.authentication_types));
      ( "OAuth2Properties",
        option_to_yojson connector_o_auth2_properties_to_yojson x.o_auth2_properties );
      ( "BasicAuthenticationProperties",
        option_to_yojson basic_authentication_properties_to_yojson x.basic_authentication_properties
      );
      ( "CustomAuthenticationProperties",
        option_to_yojson custom_authentication_properties_to_yojson
          x.custom_authentication_properties );
    ]

let connection_properties_configuration_to_yojson (x : connection_properties_configuration) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson connector_property_to_yojson x.url);
      ( "AdditionalRequestParameters",
        option_to_yojson connector_property_list_to_yojson x.additional_request_parameters );
    ]

let description_to_yojson = string_to_yojson
let integration_type_to_yojson (x : integration_type) = match x with REST -> `String "REST"

let register_connection_type_request_to_yojson (x : register_connection_type_request) =
  assoc_to_yojson
    [
      ("ConnectionType", Some (name_string_to_yojson x.connection_type));
      ("IntegrationType", Some (integration_type_to_yojson x.integration_type));
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "ConnectionProperties",
        Some (connection_properties_configuration_to_yojson x.connection_properties) );
      ( "ConnectorAuthenticationConfiguration",
        Some
          (connector_authentication_configuration_to_yojson x.connector_authentication_configuration)
      );
      ("RestConfiguration", Some (rest_configuration_to_yojson x.rest_configuration));
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let schema_registry_token_string_to_yojson = string_to_yojson
let created_timestamp_to_yojson = string_to_yojson

let other_metadata_value_list_item_to_yojson (x : other_metadata_value_list_item) =
  assoc_to_yojson
    [
      ("MetadataValue", option_to_yojson metadata_value_string_to_yojson x.metadata_value);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
    ]

let other_metadata_value_list_to_yojson tree =
  list_to_yojson other_metadata_value_list_item_to_yojson tree

let metadata_info_to_yojson (x : metadata_info) =
  assoc_to_yojson
    [
      ("MetadataValue", option_to_yojson metadata_value_string_to_yojson x.metadata_value);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ( "OtherMetadataValueList",
        option_to_yojson other_metadata_value_list_to_yojson x.other_metadata_value_list );
    ]

let metadata_info_map_to_yojson tree =
  map_to_yojson metadata_key_string_to_yojson metadata_info_to_yojson tree

let query_schema_version_metadata_response_to_yojson (x : query_schema_version_metadata_response) =
  assoc_to_yojson
    [
      ("MetadataInfoMap", option_to_yojson metadata_info_map_to_yojson x.metadata_info_map);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
    ]

let query_schema_version_metadata_max_results_to_yojson = int_to_yojson
let metadata_list_to_yojson tree = list_to_yojson metadata_key_value_pair_to_yojson tree

let query_schema_version_metadata_input_to_yojson (x : query_schema_version_metadata_input) =
  assoc_to_yojson
    [
      ("SchemaId", option_to_yojson schema_id_to_yojson x.schema_id);
      ( "SchemaVersionNumber",
        option_to_yojson schema_version_number_to_yojson x.schema_version_number );
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("MetadataList", option_to_yojson metadata_list_to_yojson x.metadata_list);
      ( "MaxResults",
        option_to_yojson query_schema_version_metadata_max_results_to_yojson x.max_results );
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
    ]

let put_workflow_run_properties_response_to_yojson = unit_to_yojson

let put_workflow_run_properties_request_to_yojson (x : put_workflow_run_properties_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("RunProperties", Some (workflow_run_properties_to_yojson x.run_properties));
    ]

let put_schema_version_metadata_response_to_yojson (x : put_schema_version_metadata_response) =
  assoc_to_yojson
    [
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("LatestVersion", option_to_yojson latest_schema_version_boolean_to_yojson x.latest_version);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("MetadataKey", option_to_yojson metadata_key_string_to_yojson x.metadata_key);
      ("MetadataValue", option_to_yojson metadata_value_string_to_yojson x.metadata_value);
    ]

let put_schema_version_metadata_input_to_yojson (x : put_schema_version_metadata_input) =
  assoc_to_yojson
    [
      ("SchemaId", option_to_yojson schema_id_to_yojson x.schema_id);
      ( "SchemaVersionNumber",
        option_to_yojson schema_version_number_to_yojson x.schema_version_number );
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("MetadataKeyValue", Some (metadata_key_value_pair_to_yojson x.metadata_key_value));
    ]

let condition_check_failure_exception_to_yojson (x : condition_check_failure_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson [ ("PolicyHash", option_to_yojson hash_string_to_yojson x.policy_hash) ]

let enable_hybrid_values_to_yojson (x : enable_hybrid_values) =
  match x with TRUE -> `String "TRUE" | FALSE -> `String "FALSE"

let exist_condition_to_yojson (x : exist_condition) =
  match x with
  | MUST_EXIST -> `String "MUST_EXIST"
  | NOT_EXIST -> `String "NOT_EXIST"
  | NONE -> `String "NONE"

let policy_json_string_to_yojson = string_to_yojson

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("PolicyInJson", Some (policy_json_string_to_yojson x.policy_in_json));
      ("ResourceArn", option_to_yojson glue_resource_arn_to_yojson x.resource_arn);
      ("PolicyHashCondition", option_to_yojson hash_string_to_yojson x.policy_hash_condition);
      ("PolicyExistsCondition", option_to_yojson exist_condition_to_yojson x.policy_exists_condition);
      ("EnableHybrid", option_to_yojson enable_hybrid_values_to_yojson x.enable_hybrid);
    ]

let form_type_schema_to_yojson = string_to_yojson
let form_type_name_to_yojson = string_to_yojson
let form_type_id_to_yojson = string_to_yojson

let put_form_type_response_to_yojson (x : put_form_type_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson form_type_id_to_yojson x.id);
      ("Name", option_to_yojson form_type_name_to_yojson x.name);
      ("Schema", option_to_yojson form_type_schema_to_yojson x.schema);
    ]

let put_form_type_request_to_yojson (x : put_form_type_request) =
  assoc_to_yojson
    [
      ("Name", Some (form_type_name_to_yojson x.name));
      ("Schema", Some (form_type_schema_to_yojson x.schema));
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let put_data_quality_profile_annotation_response_to_yojson = unit_to_yojson

let inclusion_annotation_value_to_yojson (x : inclusion_annotation_value) =
  match x with INCLUDE -> `String "INCLUDE" | EXCLUDE -> `String "EXCLUDE"

let put_data_quality_profile_annotation_request_to_yojson
    (x : put_data_quality_profile_annotation_request) =
  assoc_to_yojson
    [
      ("ProfileId", Some (hash_string_to_yojson x.profile_id));
      ("InclusionAnnotation", Some (inclusion_annotation_value_to_yojson x.inclusion_annotation));
    ]

let put_data_catalog_encryption_settings_response_to_yojson = unit_to_yojson

let connection_password_encryption_to_yojson (x : connection_password_encryption) =
  assoc_to_yojson
    [
      ( "ReturnConnectionPasswordEncrypted",
        Some (boolean__to_yojson x.return_connection_password_encrypted) );
      ("AwsKmsKeyId", option_to_yojson name_string_to_yojson x.aws_kms_key_id);
    ]

let catalog_encryption_mode_to_yojson (x : catalog_encryption_mode) =
  match x with
  | DISABLED -> `String "DISABLED"
  | SSEKMS -> `String "SSE-KMS"
  | SSEKMSWITHSERVICEROLE -> `String "SSE-KMS-WITH-SERVICE-ROLE"

let encryption_at_rest_to_yojson (x : encryption_at_rest) =
  assoc_to_yojson
    [
      ("CatalogEncryptionMode", Some (catalog_encryption_mode_to_yojson x.catalog_encryption_mode));
      ("SseAwsKmsKeyId", option_to_yojson name_string_to_yojson x.sse_aws_kms_key_id);
      ( "CatalogEncryptionServiceRole",
        option_to_yojson iam_role_arn_to_yojson x.catalog_encryption_service_role );
    ]

let data_catalog_encryption_settings_to_yojson (x : data_catalog_encryption_settings) =
  assoc_to_yojson
    [
      ("EncryptionAtRest", option_to_yojson encryption_at_rest_to_yojson x.encryption_at_rest);
      ( "ConnectionPasswordEncryption",
        option_to_yojson connection_password_encryption_to_yojson x.connection_password_encryption
      );
    ]

let put_data_catalog_encryption_settings_request_to_yojson
    (x : put_data_catalog_encryption_settings_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ( "DataCatalogEncryptionSettings",
        Some (data_catalog_encryption_settings_to_yojson x.data_catalog_encryption_settings) );
    ]

let attachment_name_to_yojson = string_to_yojson
let item_identifier_to_yojson = string_to_yojson
let iterable_form_name_to_yojson = string_to_yojson

let put_attachment_response_to_yojson (x : put_attachment_response) =
  assoc_to_yojson
    [
      ("AssetIdentifier", option_to_yojson asset_id_to_yojson x.asset_identifier);
      ("IterableFormName", option_to_yojson iterable_form_name_to_yojson x.iterable_form_name);
      ("ItemIdentifier", option_to_yojson item_identifier_to_yojson x.item_identifier);
      ("AttachmentName", option_to_yojson attachment_name_to_yojson x.attachment_name);
      ("FormTypeId", option_to_yojson form_type_id_to_yojson x.form_type_id);
    ]

let form_content_to_yojson = string_to_yojson

let put_attachment_request_to_yojson (x : put_attachment_request) =
  assoc_to_yojson
    [
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
      ("IterableFormName", option_to_yojson iterable_form_name_to_yojson x.iterable_form_name);
      ("ItemIdentifier", option_to_yojson item_identifier_to_yojson x.item_identifier);
      ("AttachmentName", Some (attachment_name_to_yojson x.attachment_name));
      ("Content", Some (form_content_to_yojson x.content));
      ("FormTypeId", Some (form_type_id_to_yojson x.form_type_id));
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let asset_type_form_reference_to_yojson (x : asset_type_form_reference) =
  assoc_to_yojson [ ("FormTypeIdentifier", Some (form_type_id_to_yojson x.form_type_identifier)) ]

let asset_type_form_key_to_yojson = string_to_yojson

let asset_type_forms_map_to_yojson tree =
  map_to_yojson asset_type_form_key_to_yojson asset_type_form_reference_to_yojson tree

let asset_type_name_to_yojson = string_to_yojson

let put_asset_type_response_to_yojson (x : put_asset_type_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson asset_type_id_to_yojson x.id);
      ("Name", option_to_yojson asset_type_name_to_yojson x.name);
      ("Forms", option_to_yojson asset_type_forms_map_to_yojson x.forms);
    ]

let put_asset_type_request_to_yojson (x : put_asset_type_request) =
  assoc_to_yojson
    [
      ("Name", Some (asset_type_name_to_yojson x.name));
      ("Forms", Some (asset_type_forms_map_to_yojson x.forms));
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let asset_form_entry_to_yojson (x : asset_form_entry) =
  assoc_to_yojson
    [
      ("FormTypeId", option_to_yojson form_type_id_to_yojson x.form_type_id);
      ("Content", option_to_yojson form_content_to_yojson x.content);
    ]

let asset_form_key_to_yojson = string_to_yojson

let asset_form_map_to_yojson tree =
  map_to_yojson asset_form_key_to_yojson asset_form_entry_to_yojson tree

let created_at_to_yojson = timestamp_epoch_seconds_to_yojson

let put_asset_response_to_yojson (x : put_asset_response) =
  assoc_to_yojson
    [
      ("Id", Some (asset_id_to_yojson x.id));
      ("Name", Some (asset_name_to_yojson x.name));
      ("Description", option_to_yojson asset_description_to_yojson x.description);
      ("CreatedAt", option_to_yojson created_at_to_yojson x.created_at);
      ("Forms", option_to_yojson asset_form_map_to_yojson x.forms);
    ]

let put_asset_request_to_yojson (x : put_asset_request) =
  assoc_to_yojson
    [
      ("AssetTypeId", Some (asset_type_id_to_yojson x.asset_type_id));
      ("Identifier", Some (asset_id_to_yojson x.identifier));
      ("Name", Some (asset_name_to_yojson x.name));
      ("Description", option_to_yojson asset_description_to_yojson x.description);
      ("Forms", Some (asset_form_map_to_yojson x.forms));
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let invalid_state_exception_to_yojson (x : invalid_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let invalid_integration_state_fault_to_yojson (x : invalid_integration_state_fault) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let integration_not_found_fault_to_yojson (x : integration_not_found_fault) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let integration_conflict_operation_fault_to_yojson (x : integration_conflict_operation_fault) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let continuous_sync_to_yojson = bool_to_yojson
let integration_string_to_yojson = string_to_yojson

let integration_source_properties_map_to_yojson tree =
  map_to_yojson integration_string_to_yojson integration_string_to_yojson tree

let integration_config_to_yojson (x : integration_config) =
  assoc_to_yojson
    [
      ("RefreshInterval", option_to_yojson string128_to_yojson x.refresh_interval);
      ( "SourceProperties",
        option_to_yojson integration_source_properties_map_to_yojson x.source_properties );
      ("ContinuousSync", option_to_yojson continuous_sync_to_yojson x.continuous_sync);
    ]

let integration_error_to_yojson (x : integration_error) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson string128_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string2048_to_yojson x.error_message);
    ]

let integration_error_list_to_yojson tree = list_to_yojson integration_error_to_yojson tree
let integration_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let integration_status_to_yojson (x : integration_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | MODIFYING -> `String "MODIFYING"
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | SYNCING -> `String "SYNCING"
  | NEEDS_ATTENTION -> `String "NEEDS_ATTENTION"

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("key", option_to_yojson tag_key_to_yojson x.key);
      ("value", option_to_yojson tag_value_to_yojson x.value);
    ]

let integration_tags_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let integration_additional_encryption_context_map_to_yojson tree =
  map_to_yojson integration_string_to_yojson integration_string_to_yojson tree

let integration_description_to_yojson = string_to_yojson

let modify_integration_response_to_yojson (x : modify_integration_response) =
  assoc_to_yojson
    [
      ("SourceArn", Some (string512_to_yojson x.source_arn));
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("IntegrationName", Some (string128_to_yojson x.integration_name));
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("IntegrationArn", Some (string128_to_yojson x.integration_arn));
      ("KmsKeyId", option_to_yojson string2048_to_yojson x.kms_key_id);
      ( "AdditionalEncryptionContext",
        option_to_yojson integration_additional_encryption_context_map_to_yojson
          x.additional_encryption_context );
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
      ("Status", Some (integration_status_to_yojson x.status));
      ("CreateTime", Some (integration_timestamp_to_yojson x.create_time));
      ("Errors", option_to_yojson integration_error_list_to_yojson x.errors);
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
    ]

let modify_integration_request_to_yojson (x : modify_integration_request) =
  assoc_to_yojson
    [
      ("IntegrationIdentifier", Some (string128_to_yojson x.integration_identifier));
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
      ("IntegrationName", option_to_yojson string128_to_yojson x.integration_name);
    ]

let workflow_names_to_yojson tree = list_to_yojson name_string_to_yojson tree

let list_workflows_response_to_yojson (x : list_workflows_response) =
  assoc_to_yojson
    [
      ("Workflows", option_to_yojson workflow_names_to_yojson x.workflows);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let orchestration_page_size25_to_yojson = int_to_yojson

let list_workflows_request_to_yojson (x : list_workflows_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson orchestration_page_size25_to_yojson x.max_results);
    ]

let orchestration_token_to_yojson = string_to_yojson
let timestamp_value_to_yojson = timestamp_epoch_seconds_to_yojson

let usage_profile_definition_to_yojson (x : usage_profile_definition) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
    ]

let usage_profile_definition_list_to_yojson tree =
  list_to_yojson usage_profile_definition_to_yojson tree

let list_usage_profiles_response_to_yojson (x : list_usage_profiles_response) =
  assoc_to_yojson
    [
      ("Profiles", option_to_yojson usage_profile_definition_list_to_yojson x.profiles);
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
    ]

let orchestration_page_size200_to_yojson = int_to_yojson

let list_usage_profiles_request_to_yojson (x : list_usage_profiles_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson orchestration_page_size200_to_yojson x.max_results);
    ]

let trigger_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let list_triggers_response_to_yojson (x : list_triggers_response) =
  assoc_to_yojson
    [
      ("TriggerNames", option_to_yojson trigger_name_list_to_yojson x.trigger_names);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_triggers_request_to_yojson (x : list_triggers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("DependentJobName", option_to_yojson name_string_to_yojson x.dependent_job_name);
      ("MaxResults", option_to_yojson orchestration_page_size200_to_yojson x.max_results);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let dpu_duration_in_hour_to_yojson = double_to_yojson
let dpu_counts_to_yojson = int_to_yojson
let dpu_hours_to_yojson = double_to_yojson
let metric_counts_to_yojson = long_to_yojson

let iceberg_orphan_file_deletion_metrics_to_yojson (x : iceberg_orphan_file_deletion_metrics) =
  assoc_to_yojson
    [
      ( "NumberOfOrphanFilesDeleted",
        option_to_yojson metric_counts_to_yojson x.number_of_orphan_files_deleted );
      ("DpuHours", option_to_yojson dpu_hours_to_yojson x.dpu_hours);
      ("NumberOfDpus", option_to_yojson dpu_counts_to_yojson x.number_of_dpus);
      ("JobDurationInHour", option_to_yojson dpu_duration_in_hour_to_yojson x.job_duration_in_hour);
    ]

let orphan_file_deletion_metrics_to_yojson (x : orphan_file_deletion_metrics) =
  assoc_to_yojson
    [
      ( "IcebergMetrics",
        option_to_yojson iceberg_orphan_file_deletion_metrics_to_yojson x.iceberg_metrics );
    ]

let iceberg_retention_metrics_to_yojson (x : iceberg_retention_metrics) =
  assoc_to_yojson
    [
      ( "NumberOfDataFilesDeleted",
        option_to_yojson metric_counts_to_yojson x.number_of_data_files_deleted );
      ( "NumberOfManifestFilesDeleted",
        option_to_yojson metric_counts_to_yojson x.number_of_manifest_files_deleted );
      ( "NumberOfManifestListsDeleted",
        option_to_yojson metric_counts_to_yojson x.number_of_manifest_lists_deleted );
      ("DpuHours", option_to_yojson dpu_hours_to_yojson x.dpu_hours);
      ("NumberOfDpus", option_to_yojson dpu_counts_to_yojson x.number_of_dpus);
      ("JobDurationInHour", option_to_yojson dpu_duration_in_hour_to_yojson x.job_duration_in_hour);
    ]

let retention_metrics_to_yojson (x : retention_metrics) =
  assoc_to_yojson
    [ ("IcebergMetrics", option_to_yojson iceberg_retention_metrics_to_yojson x.iceberg_metrics) ]

let iceberg_compaction_metrics_to_yojson (x : iceberg_compaction_metrics) =
  assoc_to_yojson
    [
      ( "NumberOfBytesCompacted",
        option_to_yojson metric_counts_to_yojson x.number_of_bytes_compacted );
      ( "NumberOfFilesCompacted",
        option_to_yojson metric_counts_to_yojson x.number_of_files_compacted );
      ("DpuHours", option_to_yojson dpu_hours_to_yojson x.dpu_hours);
      ("NumberOfDpus", option_to_yojson dpu_counts_to_yojson x.number_of_dpus);
      ("JobDurationInHour", option_to_yojson dpu_duration_in_hour_to_yojson x.job_duration_in_hour);
    ]

let compaction_metrics_to_yojson (x : compaction_metrics) =
  assoc_to_yojson
    [ ("IcebergMetrics", option_to_yojson iceberg_compaction_metrics_to_yojson x.iceberg_metrics) ]

let run_metrics_to_yojson (x : run_metrics) =
  assoc_to_yojson
    [
      ( "NumberOfBytesCompacted",
        option_to_yojson message_string_to_yojson x.number_of_bytes_compacted );
      ( "NumberOfFilesCompacted",
        option_to_yojson message_string_to_yojson x.number_of_files_compacted );
      ("NumberOfDpus", option_to_yojson message_string_to_yojson x.number_of_dpus);
      ("JobDurationInHour", option_to_yojson message_string_to_yojson x.job_duration_in_hour);
    ]

let table_optimizer_run_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let table_optimizer_event_type_to_yojson (x : table_optimizer_event_type) =
  match x with
  | STARTING -> `String "starting"
  | COMPLETED -> `String "completed"
  | FAILED -> `String "failed"
  | IN_PROGRESS -> `String "in_progress"

let table_optimizer_run_to_yojson (x : table_optimizer_run) =
  assoc_to_yojson
    [
      ("eventType", option_to_yojson table_optimizer_event_type_to_yojson x.event_type);
      ("startTimestamp", option_to_yojson table_optimizer_run_timestamp_to_yojson x.start_timestamp);
      ("endTimestamp", option_to_yojson table_optimizer_run_timestamp_to_yojson x.end_timestamp);
      ("metrics", option_to_yojson run_metrics_to_yojson x.metrics);
      ("error", option_to_yojson message_string_to_yojson x.error);
      ("compactionMetrics", option_to_yojson compaction_metrics_to_yojson x.compaction_metrics);
      ("compactionStrategy", option_to_yojson compaction_strategy_to_yojson x.compaction_strategy);
      ("retentionMetrics", option_to_yojson retention_metrics_to_yojson x.retention_metrics);
      ( "orphanFileDeletionMetrics",
        option_to_yojson orphan_file_deletion_metrics_to_yojson x.orphan_file_deletion_metrics );
    ]

let table_optimizer_runs_to_yojson tree = list_to_yojson table_optimizer_run_to_yojson tree
let list_table_optimizer_runs_token_to_yojson = string_to_yojson

let list_table_optimizer_runs_response_to_yojson (x : list_table_optimizer_runs_response) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
      ("NextToken", option_to_yojson list_table_optimizer_runs_token_to_yojson x.next_token);
      ("TableOptimizerRuns", option_to_yojson table_optimizer_runs_to_yojson x.table_optimizer_runs);
    ]

let max_list_table_optimizer_runs_token_results_to_yojson = int_to_yojson

let list_table_optimizer_runs_request_to_yojson (x : list_table_optimizer_runs_request) =
  assoc_to_yojson
    [
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("Type", Some (table_optimizer_type_to_yojson x.type_));
      ( "MaxResults",
        option_to_yojson max_list_table_optimizer_runs_token_results_to_yojson x.max_results );
      ("NextToken", option_to_yojson list_table_optimizer_runs_token_to_yojson x.next_token);
    ]

let long_value_to_yojson = long_to_yojson
let double_value_to_yojson = double_to_yojson
let orchestration_string_list_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let statement_state_to_yojson (x : statement_state) =
  match x with
  | WAITING -> `String "WAITING"
  | RUNNING -> `String "RUNNING"
  | AVAILABLE -> `String "AVAILABLE"
  | CANCELLING -> `String "CANCELLING"
  | CANCELLED -> `String "CANCELLED"
  | ERROR -> `String "ERROR"

let statement_output_data_to_yojson (x : statement_output_data) =
  assoc_to_yojson [ ("TextPlain", option_to_yojson generic_string_to_yojson x.text_plain) ]

let statement_output_to_yojson (x : statement_output) =
  assoc_to_yojson
    [
      ("Data", option_to_yojson statement_output_data_to_yojson x.data);
      ("ExecutionCount", option_to_yojson integer_value_to_yojson x.execution_count);
      ("Status", option_to_yojson statement_state_to_yojson x.status);
      ("ErrorName", option_to_yojson generic_string_to_yojson x.error_name);
      ("ErrorValue", option_to_yojson generic_string_to_yojson x.error_value);
      ("Traceback", option_to_yojson orchestration_string_list_to_yojson x.traceback);
    ]

let statement_to_yojson (x : statement) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson integer_value_to_yojson x.id);
      ("Code", option_to_yojson generic_string_to_yojson x.code);
      ("State", option_to_yojson statement_state_to_yojson x.state);
      ("Output", option_to_yojson statement_output_to_yojson x.output);
      ("Progress", option_to_yojson double_value_to_yojson x.progress);
      ("StartedOn", option_to_yojson long_value_to_yojson x.started_on);
      ("CompletedOn", option_to_yojson long_value_to_yojson x.completed_on);
    ]

let statement_list_to_yojson tree = list_to_yojson statement_to_yojson tree

let list_statements_response_to_yojson (x : list_statements_response) =
  assoc_to_yojson
    [
      ("Statements", option_to_yojson statement_list_to_yojson x.statements);
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
    ]

let list_statements_request_to_yojson (x : list_statements_request) =
  assoc_to_yojson
    [
      ("SessionId", Some (name_string_to_yojson x.session_id));
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
    ]

let session_type_to_yojson (x : session_type) =
  match x with LIVY -> `String "LIVY" | SPARK_CONNECT -> `String "SPARK_CONNECT"

let idle_timeout_to_yojson = int_to_yojson
let orchestration_arguments_value_to_yojson = string_to_yojson

let orchestration_arguments_map_to_yojson tree =
  map_to_yojson orchestration_name_string_to_yojson orchestration_arguments_value_to_yojson tree

let session_command_to_yojson (x : session_command) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("PythonVersion", option_to_yojson python_version_string_to_yojson x.python_version);
    ]

let orchestration_role_arn_to_yojson = string_to_yojson

let session_status_to_yojson (x : session_status) =
  match x with
  | PROVISIONING -> `String "PROVISIONING"
  | READY -> `String "READY"
  | FAILED -> `String "FAILED"
  | TIMEOUT -> `String "TIMEOUT"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"

let session_to_yojson (x : session) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson name_string_to_yojson x.id);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("Status", option_to_yojson session_status_to_yojson x.status);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Role", option_to_yojson orchestration_role_arn_to_yojson x.role);
      ("Command", option_to_yojson session_command_to_yojson x.command);
      ( "DefaultArguments",
        option_to_yojson orchestration_arguments_map_to_yojson x.default_arguments );
      ("Connections", option_to_yojson connections_list_to_yojson x.connections);
      ("Progress", option_to_yojson double_value_to_yojson x.progress);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("ExecutionTime", option_to_yojson nullable_double_to_yojson x.execution_time);
      ("DPUSeconds", option_to_yojson nullable_double_to_yojson x.dpu_seconds);
      ("IdleTimeout", option_to_yojson idle_timeout_to_yojson x.idle_timeout);
      ("ProfileName", option_to_yojson name_string_to_yojson x.profile_name);
      ("SessionType", option_to_yojson session_type_to_yojson x.session_type);
    ]

let session_list_to_yojson tree = list_to_yojson session_to_yojson tree
let session_id_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let list_sessions_response_to_yojson (x : list_sessions_response) =
  assoc_to_yojson
    [
      ("Ids", option_to_yojson session_id_list_to_yojson x.ids);
      ("Sessions", option_to_yojson session_list_to_yojson x.sessions);
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
    ]

let list_sessions_request_to_yojson (x : list_sessions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
    ]

let schema_version_list_item_to_yojson (x : schema_version_list_item) =
  assoc_to_yojson
    [
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("Status", option_to_yojson schema_version_status_to_yojson x.status);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
    ]

let schema_version_list_to_yojson tree = list_to_yojson schema_version_list_item_to_yojson tree

let list_schema_versions_response_to_yojson (x : list_schema_versions_response) =
  assoc_to_yojson
    [
      ("Schemas", option_to_yojson schema_version_list_to_yojson x.schemas);
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
    ]

let max_results_number_to_yojson = int_to_yojson

let list_schema_versions_input_to_yojson (x : list_schema_versions_input) =
  assoc_to_yojson
    [
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
    ]

let updated_timestamp_to_yojson = string_to_yojson

let schema_status_to_yojson (x : schema_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | PENDING -> `String "PENDING"
  | DELETING -> `String "DELETING"

let schema_list_item_to_yojson (x : schema_list_item) =
  assoc_to_yojson
    [
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("SchemaStatus", option_to_yojson schema_status_to_yojson x.schema_status);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("UpdatedTime", option_to_yojson updated_timestamp_to_yojson x.updated_time);
    ]

let schema_list_definition_to_yojson tree = list_to_yojson schema_list_item_to_yojson tree

let list_schemas_response_to_yojson (x : list_schemas_response) =
  assoc_to_yojson
    [
      ("Schemas", option_to_yojson schema_list_definition_to_yojson x.schemas);
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
    ]

let list_schemas_input_to_yojson (x : list_schemas_input) =
  assoc_to_yojson
    [
      ("RegistryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
    ]

let registry_status_to_yojson (x : registry_status) =
  match x with AVAILABLE -> `String "AVAILABLE" | DELETING -> `String "DELETING"

let registry_list_item_to_yojson (x : registry_list_item) =
  assoc_to_yojson
    [
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Status", option_to_yojson registry_status_to_yojson x.status);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("UpdatedTime", option_to_yojson updated_timestamp_to_yojson x.updated_time);
    ]

let registry_list_definition_to_yojson tree = list_to_yojson registry_list_item_to_yojson tree

let list_registries_response_to_yojson (x : list_registries_response) =
  assoc_to_yojson
    [
      ("Registries", option_to_yojson registry_list_definition_to_yojson x.registries);
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
    ]

let list_registries_input_to_yojson (x : list_registries_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
    ]

let pagination_token_to_yojson = string_to_yojson
let transform_id_list_to_yojson tree = list_to_yojson hash_string_to_yojson tree

let list_ml_transforms_response_to_yojson (x : list_ml_transforms_response) =
  assoc_to_yojson
    [
      ("TransformIds", Some (transform_id_list_to_yojson x.transform_ids));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let sort_direction_type_to_yojson (x : sort_direction_type) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let transform_sort_column_type_to_yojson (x : transform_sort_column_type) =
  match x with
  | NAME -> `String "NAME"
  | TRANSFORM_TYPE -> `String "TRANSFORM_TYPE"
  | STATUS -> `String "STATUS"
  | CREATED -> `String "CREATED"
  | LAST_MODIFIED -> `String "LAST_MODIFIED"

let transform_sort_criteria_to_yojson (x : transform_sort_criteria) =
  assoc_to_yojson
    [
      ("Column", Some (transform_sort_column_type_to_yojson x.column));
      ("SortDirection", Some (sort_direction_type_to_yojson x.sort_direction));
    ]

let schema_column_to_yojson (x : schema_column) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson column_name_string_to_yojson x.name);
      ("DataType", option_to_yojson column_type_string_to_yojson x.data_type);
    ]

let transform_schema_to_yojson tree = list_to_yojson schema_column_to_yojson tree

let transform_status_type_to_yojson (x : transform_status_type) =
  match x with
  | NOT_READY -> `String "NOT_READY"
  | READY -> `String "READY"
  | DELETING -> `String "DELETING"

let transform_filter_criteria_to_yojson (x : transform_filter_criteria) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("TransformType", option_to_yojson transform_type_to_yojson x.transform_type);
      ("Status", option_to_yojson transform_status_type_to_yojson x.status);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("LastModifiedBefore", option_to_yojson timestamp_to_yojson x.last_modified_before);
      ("LastModifiedAfter", option_to_yojson timestamp_to_yojson x.last_modified_after);
      ("Schema", option_to_yojson transform_schema_to_yojson x.schema);
    ]

let list_ml_transforms_request_to_yojson (x : list_ml_transforms_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Filter", option_to_yojson transform_filter_criteria_to_yojson x.filter);
      ("Sort", option_to_yojson transform_sort_criteria_to_yojson x.sort);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let byte_count_to_yojson = long_to_yojson

let materialized_view_refresh_type_to_yojson (x : materialized_view_refresh_type) =
  match x with FULL -> `String "FULL" | INCREMENTAL -> `String "INCREMENTAL"

let materialized_view_refresh_state_to_yojson (x : materialized_view_refresh_state) =
  match x with
  | STARTING -> `String "STARTING"
  | RUNNING -> `String "RUNNING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | STOPPED -> `String "STOPPED"

let table_name_to_yojson = string_to_yojson

let materialized_view_refresh_task_run_to_yojson (x : materialized_view_refresh_task_run) =
  assoc_to_yojson
    [
      ("CustomerId", option_to_yojson account_id_to_yojson x.customer_id);
      ( "MaterializedViewRefreshTaskRunId",
        option_to_yojson uui_dv4_to_yojson x.materialized_view_refresh_task_run_id );
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("Status", option_to_yojson materialized_view_refresh_state_to_yojson x.status);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("DPUSeconds", option_to_yojson non_negative_double_to_yojson x.dpu_seconds);
      ("RefreshType", option_to_yojson materialized_view_refresh_type_to_yojson x.refresh_type);
      ("ProcessedBytes", option_to_yojson byte_count_to_yojson x.processed_bytes);
    ]

let materialized_view_refresh_task_runs_list_to_yojson tree =
  list_to_yojson materialized_view_refresh_task_run_to_yojson tree

let list_materialized_view_refresh_task_runs_response_to_yojson
    (x : list_materialized_view_refresh_task_runs_response) =
  assoc_to_yojson
    [
      ( "MaterializedViewRefreshTaskRuns",
        option_to_yojson materialized_view_refresh_task_runs_list_to_yojson
          x.materialized_view_refresh_task_runs );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_materialized_view_refresh_task_runs_request_to_yojson
    (x : list_materialized_view_refresh_task_runs_request) =
  assoc_to_yojson
    [
      ("CatalogId", Some (name_string_to_yojson x.catalog_id));
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let job_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let list_jobs_response_to_yojson (x : list_jobs_response) =
  assoc_to_yojson
    [
      ("JobNames", option_to_yojson job_name_list_to_yojson x.job_names);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_jobs_request_to_yojson (x : list_jobs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let glossary_term_id_list_to_yojson tree = list_to_yojson glossary_term_id_to_yojson tree
let item_description_to_yojson = string_to_yojson
let item_name_to_yojson = string_to_yojson
let item_id_to_yojson = string_to_yojson

let iterable_form_list_item_to_yojson (x : iterable_form_list_item) =
  assoc_to_yojson
    [
      ("ItemId", option_to_yojson item_id_to_yojson x.item_id);
      ("ItemName", option_to_yojson item_name_to_yojson x.item_name);
      ("Description", option_to_yojson item_description_to_yojson x.description);
      ("GlossaryTerms", option_to_yojson glossary_term_id_list_to_yojson x.glossary_terms);
    ]

let iterable_form_list_item_list_to_yojson tree =
  list_to_yojson iterable_form_list_item_to_yojson tree

let list_iterable_forms_response_to_yojson (x : list_iterable_forms_response) =
  assoc_to_yojson
    [
      ("Items", option_to_yojson iterable_form_list_item_list_to_yojson x.items);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_iterable_forms_request_to_yojson (x : list_iterable_forms_request) =
  assoc_to_yojson
    [
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
      ("IterableFormName", Some (iterable_form_name_to_yojson x.iterable_form_name));
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let string1024_to_yojson = string_to_yojson

let integration_resource_property_to_yojson (x : integration_resource_property) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
      ("ResourcePropertyArn", option_to_yojson string512_to_yojson x.resource_property_arn);
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
    ]

let integration_resource_property_list_to_yojson tree =
  list_to_yojson integration_resource_property_to_yojson tree

let list_integration_resource_properties_response_to_yojson
    (x : list_integration_resource_properties_response) =
  assoc_to_yojson
    [
      ( "IntegrationResourcePropertyList",
        option_to_yojson integration_resource_property_list_to_yojson
          x.integration_resource_property_list );
      ("Marker", option_to_yojson string1024_to_yojson x.marker);
    ]

let integration_integer_to_yojson = int_to_yojson

let integration_resource_property_filter_values_to_yojson tree =
  list_to_yojson string128_to_yojson tree

let integration_resource_property_filter_to_yojson (x : integration_resource_property_filter) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string128_to_yojson x.name);
      ("Values", option_to_yojson integration_resource_property_filter_values_to_yojson x.values);
    ]

let integration_resource_property_filter_list_to_yojson tree =
  list_to_yojson integration_resource_property_filter_to_yojson tree

let list_integration_resource_properties_request_to_yojson
    (x : list_integration_resource_properties_request) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string1024_to_yojson x.marker);
      ("Filters", option_to_yojson integration_resource_property_filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integration_integer_to_yojson x.max_records);
    ]

let glossary_term_item_to_yojson (x : glossary_term_item) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson glossary_term_id_to_yojson x.id);
      ("Name", option_to_yojson glossary_term_name_to_yojson x.name);
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
    ]

let glossary_term_item_list_to_yojson tree = list_to_yojson glossary_term_item_to_yojson tree

let list_glossary_terms_response_to_yojson (x : list_glossary_terms_response) =
  assoc_to_yojson
    [
      ("Items", option_to_yojson glossary_term_item_list_to_yojson x.items);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_glossary_terms_request_to_yojson (x : list_glossary_terms_request) =
  assoc_to_yojson
    [
      ("GlossaryIdentifier", Some (glossary_id_to_yojson x.glossary_identifier));
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let glossary_item_to_yojson (x : glossary_item) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson glossary_id_to_yojson x.id);
      ("Name", option_to_yojson glossary_name_to_yojson x.name);
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
    ]

let glossary_item_list_to_yojson tree = list_to_yojson glossary_item_to_yojson tree

let list_glossaries_response_to_yojson (x : list_glossaries_response) =
  assoc_to_yojson
    [
      ("Items", option_to_yojson glossary_item_list_to_yojson x.items);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_glossaries_request_to_yojson (x : list_glossaries_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let form_type_item_to_yojson (x : form_type_item) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson form_type_id_to_yojson x.id);
      ("Name", option_to_yojson form_type_name_to_yojson x.name);
    ]

let form_type_item_list_to_yojson tree = list_to_yojson form_type_item_to_yojson tree

let list_form_types_response_to_yojson (x : list_form_types_response) =
  assoc_to_yojson
    [
      ("Items", Some (form_type_item_list_to_yojson x.items));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_form_types_request_to_yojson (x : list_form_types_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let next_token_to_yojson = string_to_yojson

let custom_properties_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let category_to_yojson = string_to_yojson
let entity_description_to_yojson = string_to_yojson
let is_parent_entity_to_yojson = bool_to_yojson
let entity_label_to_yojson = string_to_yojson
let entity_name_to_yojson = string_to_yojson

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("EntityName", option_to_yojson entity_name_to_yojson x.entity_name);
      ("Label", option_to_yojson entity_label_to_yojson x.label);
      ("IsParentEntity", option_to_yojson is_parent_entity_to_yojson x.is_parent_entity);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Category", option_to_yojson category_to_yojson x.category);
      ("CustomProperties", option_to_yojson custom_properties_to_yojson x.custom_properties);
    ]

let entity_list_to_yojson tree = list_to_yojson entity_to_yojson tree

let list_entities_response_to_yojson (x : list_entities_response) =
  assoc_to_yojson
    [
      ("Entities", option_to_yojson entity_list_to_yojson x.entities);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let api_version_to_yojson = string_to_yojson

let list_entities_request_to_yojson (x : list_entities_request) =
  assoc_to_yojson
    [
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("ParentEntityName", option_to_yojson entity_name_to_yojson x.parent_entity_name);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DataStoreApiVersion", option_to_yojson api_version_to_yojson x.data_store_api_version);
    ]

let dev_endpoint_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let list_dev_endpoints_response_to_yojson (x : list_dev_endpoints_response) =
  assoc_to_yojson
    [
      ("DevEndpointNames", option_to_yojson dev_endpoint_name_list_to_yojson x.dev_endpoint_names);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_dev_endpoints_request_to_yojson (x : list_dev_endpoints_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let timestamped_inclusion_annotation_to_yojson (x : timestamped_inclusion_annotation) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson inclusion_annotation_value_to_yojson x.value);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
    ]

let statistic_properties_map_to_yojson tree =
  map_to_yojson name_string_to_yojson description_string_to_yojson tree

let reference_datasets_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let statistic_evaluation_level_to_yojson (x : statistic_evaluation_level) =
  match x with
  | DATASET -> `String "Dataset"
  | COLUMN -> `String "Column"
  | MULTICOLUMN -> `String "Multicolumn"

let statistic_name_string_to_yojson = string_to_yojson

let run_identifier_to_yojson (x : run_identifier) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson hash_string_to_yojson x.run_id);
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
    ]

let statistic_summary_to_yojson (x : statistic_summary) =
  assoc_to_yojson
    [
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("RunIdentifier", option_to_yojson run_identifier_to_yojson x.run_identifier);
      ("StatisticName", option_to_yojson statistic_name_string_to_yojson x.statistic_name);
      ("DoubleValue", option_to_yojson double_to_yojson x.double_value);
      ("EvaluationLevel", option_to_yojson statistic_evaluation_level_to_yojson x.evaluation_level);
      ("ColumnsReferenced", option_to_yojson column_name_list_to_yojson x.columns_referenced);
      ( "ReferencedDatasets",
        option_to_yojson reference_datasets_list_to_yojson x.referenced_datasets );
      ( "StatisticProperties",
        option_to_yojson statistic_properties_map_to_yojson x.statistic_properties );
      ("RecordedOn", option_to_yojson timestamp_to_yojson x.recorded_on);
      ( "InclusionAnnotation",
        option_to_yojson timestamped_inclusion_annotation_to_yojson x.inclusion_annotation );
    ]

let statistic_summary_list_to_yojson tree = list_to_yojson statistic_summary_to_yojson tree

let list_data_quality_statistics_response_to_yojson (x : list_data_quality_statistics_response) =
  assoc_to_yojson
    [
      ("Statistics", option_to_yojson statistic_summary_list_to_yojson x.statistics);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let timestamp_filter_to_yojson (x : timestamp_filter) =
  assoc_to_yojson
    [
      ("RecordedBefore", option_to_yojson timestamp_to_yojson x.recorded_before);
      ("RecordedAfter", option_to_yojson timestamp_to_yojson x.recorded_after);
    ]

let list_data_quality_statistics_request_to_yojson (x : list_data_quality_statistics_request) =
  assoc_to_yojson
    [
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("TimestampFilter", option_to_yojson timestamp_filter_to_yojson x.timestamp_filter);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let statistic_annotation_to_yojson (x : statistic_annotation) =
  assoc_to_yojson
    [
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ("StatisticRecordedOn", option_to_yojson timestamp_to_yojson x.statistic_recorded_on);
      ( "InclusionAnnotation",
        option_to_yojson timestamped_inclusion_annotation_to_yojson x.inclusion_annotation );
    ]

let annotation_list_to_yojson tree = list_to_yojson statistic_annotation_to_yojson tree

let list_data_quality_statistic_annotations_response_to_yojson
    (x : list_data_quality_statistic_annotations_response) =
  assoc_to_yojson
    [
      ("Annotations", option_to_yojson annotation_list_to_yojson x.annotations);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_data_quality_statistic_annotations_request_to_yojson
    (x : list_data_quality_statistic_annotations_request) =
  assoc_to_yojson
    [
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("TimestampFilter", option_to_yojson timestamp_filter_to_yojson x.timestamp_filter);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let data_quality_target_table_to_yojson (x : data_quality_target_table) =
  assoc_to_yojson
    [
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson name_string_to_yojson x.catalog_id);
    ]

let data_quality_ruleset_list_details_to_yojson (x : data_quality_ruleset_list_details) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("CreatedOn", option_to_yojson timestamp_to_yojson x.created_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("TargetTable", option_to_yojson data_quality_target_table_to_yojson x.target_table);
      ("RecommendationRunId", option_to_yojson hash_string_to_yojson x.recommendation_run_id);
      ("RuleCount", option_to_yojson nullable_integer_to_yojson x.rule_count);
    ]

let data_quality_ruleset_list_to_yojson tree =
  list_to_yojson data_quality_ruleset_list_details_to_yojson tree

let list_data_quality_rulesets_response_to_yojson (x : list_data_quality_rulesets_response) =
  assoc_to_yojson
    [
      ("Rulesets", option_to_yojson data_quality_ruleset_list_to_yojson x.rulesets);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let data_quality_ruleset_filter_criteria_to_yojson (x : data_quality_ruleset_filter_criteria) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("LastModifiedBefore", option_to_yojson timestamp_to_yojson x.last_modified_before);
      ("LastModifiedAfter", option_to_yojson timestamp_to_yojson x.last_modified_after);
      ("TargetTable", option_to_yojson data_quality_target_table_to_yojson x.target_table);
    ]

let list_data_quality_rulesets_request_to_yojson (x : list_data_quality_rulesets_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Filter", option_to_yojson data_quality_ruleset_filter_criteria_to_yojson x.filter);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let task_status_type_to_yojson (x : task_status_type) =
  match x with
  | STARTING -> `String "STARTING"
  | RUNNING -> `String "RUNNING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | TIMEOUT -> `String "TIMEOUT"

let data_quality_ruleset_evaluation_run_description_to_yojson
    (x : data_quality_ruleset_evaluation_run_description) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson hash_string_to_yojson x.run_id);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
    ]

let data_quality_ruleset_evaluation_run_list_to_yojson tree =
  list_to_yojson data_quality_ruleset_evaluation_run_description_to_yojson tree

let list_data_quality_ruleset_evaluation_runs_response_to_yojson
    (x : list_data_quality_ruleset_evaluation_runs_response) =
  assoc_to_yojson
    [
      ("Runs", option_to_yojson data_quality_ruleset_evaluation_run_list_to_yojson x.runs);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let data_quality_ruleset_evaluation_run_filter_to_yojson
    (x : data_quality_ruleset_evaluation_run_filter) =
  assoc_to_yojson
    [
      ("DataSource", Some (data_source_to_yojson x.data_source));
      ("StartedBefore", option_to_yojson timestamp_to_yojson x.started_before);
      ("StartedAfter", option_to_yojson timestamp_to_yojson x.started_after);
      ("RulesetName", option_to_yojson name_string_to_yojson x.ruleset_name);
    ]

let list_data_quality_ruleset_evaluation_runs_request_to_yojson
    (x : list_data_quality_ruleset_evaluation_runs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson data_quality_ruleset_evaluation_run_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let data_quality_rule_recommendation_run_description_to_yojson
    (x : data_quality_rule_recommendation_run_description) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson hash_string_to_yojson x.run_id);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
    ]

let data_quality_rule_recommendation_run_list_to_yojson tree =
  list_to_yojson data_quality_rule_recommendation_run_description_to_yojson tree

let list_data_quality_rule_recommendation_runs_response_to_yojson
    (x : list_data_quality_rule_recommendation_runs_response) =
  assoc_to_yojson
    [
      ("Runs", option_to_yojson data_quality_rule_recommendation_run_list_to_yojson x.runs);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let data_quality_rule_recommendation_run_filter_to_yojson
    (x : data_quality_rule_recommendation_run_filter) =
  assoc_to_yojson
    [
      ("DataSource", Some (data_source_to_yojson x.data_source));
      ("StartedBefore", option_to_yojson timestamp_to_yojson x.started_before);
      ("StartedAfter", option_to_yojson timestamp_to_yojson x.started_after);
    ]

let list_data_quality_rule_recommendation_runs_request_to_yojson
    (x : list_data_quality_rule_recommendation_runs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson data_quality_rule_recommendation_run_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let data_quality_result_description_to_yojson (x : data_quality_result_description) =
  assoc_to_yojson
    [
      ("ResultId", option_to_yojson hash_string_to_yojson x.result_id);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
    ]

let data_quality_result_description_list_to_yojson tree =
  list_to_yojson data_quality_result_description_to_yojson tree

let list_data_quality_results_response_to_yojson (x : list_data_quality_results_response) =
  assoc_to_yojson
    [
      ("Results", Some (data_quality_result_description_list_to_yojson x.results));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let data_quality_result_filter_criteria_to_yojson (x : data_quality_result_filter_criteria) =
  assoc_to_yojson
    [
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
      ("StartedAfter", option_to_yojson timestamp_to_yojson x.started_after);
      ("StartedBefore", option_to_yojson timestamp_to_yojson x.started_before);
    ]

let list_data_quality_results_request_to_yojson (x : list_data_quality_results_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson data_quality_result_filter_criteria_to_yojson x.filter);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let context_words_to_yojson tree = list_to_yojson name_string_to_yojson tree

let custom_entity_type_to_yojson (x : custom_entity_type) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("RegexString", Some (name_string_to_yojson x.regex_string));
      ("ContextWords", option_to_yojson context_words_to_yojson x.context_words);
    ]

let custom_entity_types_to_yojson tree = list_to_yojson custom_entity_type_to_yojson tree

let list_custom_entity_types_response_to_yojson (x : list_custom_entity_types_response) =
  assoc_to_yojson
    [
      ("CustomEntityTypes", option_to_yojson custom_entity_types_to_yojson x.custom_entity_types);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_custom_entity_types_request_to_yojson (x : list_custom_entity_types_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let message_prefix_to_yojson = string_to_yojson
let log_stream_to_yojson = string_to_yojson
let log_group_to_yojson = string_to_yojson

let crawler_history_state_to_yojson (x : crawler_history_state) =
  match x with
  | RUNNING -> `String "RUNNING"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | STOPPED -> `String "STOPPED"

let crawl_id_to_yojson = string_to_yojson

let crawler_history_to_yojson (x : crawler_history) =
  assoc_to_yojson
    [
      ("CrawlId", option_to_yojson crawl_id_to_yojson x.crawl_id);
      ("State", option_to_yojson crawler_history_state_to_yojson x.state);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("Summary", option_to_yojson name_string_to_yojson x.summary);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("LogGroup", option_to_yojson log_group_to_yojson x.log_group);
      ("LogStream", option_to_yojson log_stream_to_yojson x.log_stream);
      ("MessagePrefix", option_to_yojson message_prefix_to_yojson x.message_prefix);
      ("DPUHour", option_to_yojson non_negative_double_to_yojson x.dpu_hour);
    ]

let crawler_history_list_to_yojson tree = list_to_yojson crawler_history_to_yojson tree

let list_crawls_response_to_yojson (x : list_crawls_response) =
  assoc_to_yojson
    [
      ("Crawls", option_to_yojson crawler_history_list_to_yojson x.crawls);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let filter_operator_to_yojson (x : filter_operator) =
  match x with
  | GT -> `String "GT"
  | GE -> `String "GE"
  | LT -> `String "LT"
  | LE -> `String "LE"
  | EQ -> `String "EQ"
  | NE -> `String "NE"

let field_name_to_yojson (x : field_name) =
  match x with
  | CRAWL_ID -> `String "CRAWL_ID"
  | STATE -> `String "STATE"
  | START_TIME -> `String "START_TIME"
  | END_TIME -> `String "END_TIME"
  | DPU_HOUR -> `String "DPU_HOUR"

let crawls_filter_to_yojson (x : crawls_filter) =
  assoc_to_yojson
    [
      ("FieldName", option_to_yojson field_name_to_yojson x.field_name);
      ("FilterOperator", option_to_yojson filter_operator_to_yojson x.filter_operator);
      ("FieldValue", option_to_yojson generic_string_to_yojson x.field_value);
    ]

let crawls_filter_list_to_yojson tree = list_to_yojson crawls_filter_to_yojson tree

let list_crawls_request_to_yojson (x : list_crawls_request) =
  assoc_to_yojson
    [
      ("CrawlerName", Some (name_string_to_yojson x.crawler_name));
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Filters", option_to_yojson crawls_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let crawler_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let list_crawlers_response_to_yojson (x : list_crawlers_response) =
  assoc_to_yojson
    [
      ("CrawlerNames", option_to_yojson crawler_name_list_to_yojson x.crawler_names);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_crawlers_request_to_yojson (x : list_crawlers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let url_string_to_yojson = string_to_yojson
let display_name_to_yojson = string_to_yojson

let connection_type_variant_to_yojson (x : connection_type_variant) =
  assoc_to_yojson
    [
      ( "ConnectionTypeVariantName",
        option_to_yojson display_name_to_yojson x.connection_type_variant_name );
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("LogoUrl", option_to_yojson url_string_to_yojson x.logo_url);
    ]

let connection_type_variant_list_to_yojson tree =
  list_to_yojson connection_type_variant_to_yojson tree

let compute_environments_to_yojson tree = list_to_yojson compute_environment_to_yojson tree

let data_operation_to_yojson (x : data_operation) =
  match x with READ -> `String "READ" | WRITE -> `String "WRITE"

let data_operations_to_yojson tree = list_to_yojson data_operation_to_yojson tree

let capabilities_to_yojson (x : capabilities) =
  assoc_to_yojson
    [
      ( "SupportedAuthenticationTypes",
        Some (authentication_types_to_yojson x.supported_authentication_types) );
      ("SupportedDataOperations", Some (data_operations_to_yojson x.supported_data_operations));
      ( "SupportedComputeEnvironments",
        Some (compute_environments_to_yojson x.supported_compute_environments) );
    ]

let vendor_to_yojson = string_to_yojson

let connection_type_brief_to_yojson (x : connection_type_brief) =
  assoc_to_yojson
    [
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Vendor", option_to_yojson vendor_to_yojson x.vendor);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Categories", option_to_yojson list_of_string_to_yojson x.categories);
      ("Capabilities", option_to_yojson capabilities_to_yojson x.capabilities);
      ("LogoUrl", option_to_yojson url_string_to_yojson x.logo_url);
      ( "ConnectionTypeVariants",
        option_to_yojson connection_type_variant_list_to_yojson x.connection_type_variants );
    ]

let connection_type_list_to_yojson tree = list_to_yojson connection_type_brief_to_yojson tree

let list_connection_types_response_to_yojson (x : list_connection_types_response) =
  assoc_to_yojson
    [
      ("ConnectionTypes", option_to_yojson connection_type_list_to_yojson x.connection_types);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_connection_types_request_to_yojson (x : list_connection_types_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let column_statistics_task_run_id_list_to_yojson tree = list_to_yojson hash_string_to_yojson tree

let list_column_statistics_task_runs_response_to_yojson
    (x : list_column_statistics_task_runs_response) =
  assoc_to_yojson
    [
      ( "ColumnStatisticsTaskRunIds",
        option_to_yojson column_statistics_task_run_id_list_to_yojson
          x.column_statistics_task_run_ids );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_column_statistics_task_runs_request_to_yojson
    (x : list_column_statistics_task_runs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let blueprint_names_to_yojson tree = list_to_yojson orchestration_name_string_to_yojson tree

let list_blueprints_response_to_yojson (x : list_blueprints_response) =
  assoc_to_yojson
    [
      ("Blueprints", option_to_yojson blueprint_names_to_yojson x.blueprints);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_blueprints_request_to_yojson (x : list_blueprints_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson orchestration_page_size25_to_yojson x.max_results);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let asset_type_item_to_yojson (x : asset_type_item) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson asset_type_id_to_yojson x.id);
      ("Name", option_to_yojson asset_type_name_to_yojson x.name);
    ]

let asset_type_item_list_to_yojson tree = list_to_yojson asset_type_item_to_yojson tree

let list_asset_types_response_to_yojson (x : list_asset_types_response) =
  assoc_to_yojson
    [
      ("Items", option_to_yojson asset_type_item_list_to_yojson x.items);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_asset_types_request_to_yojson (x : list_asset_types_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let import_catalog_to_glue_response_to_yojson = unit_to_yojson

let import_catalog_to_glue_request_to_yojson (x : import_catalog_to_glue_request) =
  assoc_to_yojson [ ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id) ]

let starting_event_batch_condition_to_yojson (x : starting_event_batch_condition) =
  assoc_to_yojson
    [
      ("BatchSize", option_to_yojson nullable_integer_to_yojson x.batch_size);
      ("BatchWindow", option_to_yojson nullable_integer_to_yojson x.batch_window);
    ]

let edge_to_yojson (x : edge) =
  assoc_to_yojson
    [
      ("SourceId", option_to_yojson name_string_to_yojson x.source_id);
      ("DestinationId", option_to_yojson name_string_to_yojson x.destination_id);
    ]

let edge_list_to_yojson tree = list_to_yojson edge_to_yojson tree

let crawl_to_yojson (x : crawl) =
  assoc_to_yojson
    [
      ("State", option_to_yojson crawl_state_to_yojson x.state);
      ("StartedOn", option_to_yojson timestamp_value_to_yojson x.started_on);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("LogGroup", option_to_yojson log_group_to_yojson x.log_group);
      ("LogStream", option_to_yojson log_stream_to_yojson x.log_stream);
    ]

let crawl_list_to_yojson tree = list_to_yojson crawl_to_yojson tree

let crawler_node_details_to_yojson (x : crawler_node_details) =
  assoc_to_yojson [ ("Crawls", option_to_yojson crawl_list_to_yojson x.crawls) ]

let execution_time_to_yojson = int_to_yojson

let predecessor_to_yojson (x : predecessor) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
    ]

let predecessor_list_to_yojson tree = list_to_yojson predecessor_to_yojson tree
let error_string_to_yojson = string_to_yojson
let attempt_count_to_yojson = int_to_yojson

let job_run_to_yojson (x : job_run) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson id_string_to_yojson x.id);
      ("Attempt", option_to_yojson attempt_count_to_yojson x.attempt);
      ("PreviousRunId", option_to_yojson id_string_to_yojson x.previous_run_id);
      ("TriggerName", option_to_yojson name_string_to_yojson x.trigger_name);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("JobMode", option_to_yojson job_mode_to_yojson x.job_mode);
      ("JobRunQueuingEnabled", option_to_yojson nullable_boolean_to_yojson x.job_run_queuing_enabled);
      ("StartedOn", option_to_yojson timestamp_value_to_yojson x.started_on);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("JobRunState", option_to_yojson job_run_state_to_yojson x.job_run_state);
      ("Arguments", option_to_yojson generic_map_to_yojson x.arguments);
      ("ErrorMessage", option_to_yojson error_string_to_yojson x.error_message);
      ("PredecessorRuns", option_to_yojson predecessor_list_to_yojson x.predecessor_runs);
      ("AllocatedCapacity", option_to_yojson integer_value_to_yojson x.allocated_capacity);
      ("ExecutionTime", option_to_yojson execution_time_to_yojson x.execution_time);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("LogGroupName", option_to_yojson generic_string_to_yojson x.log_group_name);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("DPUSeconds", option_to_yojson nullable_double_to_yojson x.dpu_seconds);
      ("ExecutionClass", option_to_yojson execution_class_to_yojson x.execution_class);
      ("MaintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ("ProfileName", option_to_yojson name_string_to_yojson x.profile_name);
      ("StateDetail", option_to_yojson orchestration_message_string_to_yojson x.state_detail);
      ( "ExecutionRoleSessionPolicy",
        option_to_yojson orchestration_policy_json_string_to_yojson x.execution_role_session_policy
      );
    ]

let job_run_list_to_yojson tree = list_to_yojson job_run_to_yojson tree

let job_node_details_to_yojson (x : job_node_details) =
  assoc_to_yojson [ ("JobRuns", option_to_yojson job_run_list_to_yojson x.job_runs) ]

let trigger_node_details_to_yojson (x : trigger_node_details) =
  assoc_to_yojson [ ("Trigger", option_to_yojson trigger_to_yojson x.trigger) ]

let node_type_to_yojson (x : node_type) =
  match x with CRAWLER -> `String "CRAWLER" | JOB -> `String "JOB" | TRIGGER -> `String "TRIGGER"

let node_to_yojson (x : node) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson node_type_to_yojson x.type_);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("UniqueId", option_to_yojson name_string_to_yojson x.unique_id);
      ("TriggerDetails", option_to_yojson trigger_node_details_to_yojson x.trigger_details);
      ("JobDetails", option_to_yojson job_node_details_to_yojson x.job_details);
      ("CrawlerDetails", option_to_yojson crawler_node_details_to_yojson x.crawler_details);
    ]

let node_list_to_yojson tree = list_to_yojson node_to_yojson tree

let workflow_graph_to_yojson (x : workflow_graph) =
  assoc_to_yojson
    [
      ("Nodes", option_to_yojson node_list_to_yojson x.nodes);
      ("Edges", option_to_yojson edge_list_to_yojson x.edges);
    ]

let workflow_run_statistics_to_yojson (x : workflow_run_statistics) =
  assoc_to_yojson
    [
      ("TotalActions", option_to_yojson integer_value_to_yojson x.total_actions);
      ("TimeoutActions", option_to_yojson integer_value_to_yojson x.timeout_actions);
      ("FailedActions", option_to_yojson integer_value_to_yojson x.failed_actions);
      ("StoppedActions", option_to_yojson integer_value_to_yojson x.stopped_actions);
      ("SucceededActions", option_to_yojson integer_value_to_yojson x.succeeded_actions);
      ("RunningActions", option_to_yojson integer_value_to_yojson x.running_actions);
      ("ErroredActions", option_to_yojson integer_value_to_yojson x.errored_actions);
      ("WaitingActions", option_to_yojson integer_value_to_yojson x.waiting_actions);
    ]

let workflow_run_status_to_yojson (x : workflow_run_status) =
  match x with
  | RUNNING -> `String "RUNNING"
  | COMPLETED -> `String "COMPLETED"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"
  | ERROR -> `String "ERROR"

let workflow_run_to_yojson (x : workflow_run) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("WorkflowRunId", option_to_yojson id_string_to_yojson x.workflow_run_id);
      ("PreviousRunId", option_to_yojson id_string_to_yojson x.previous_run_id);
      ( "WorkflowRunProperties",
        option_to_yojson workflow_run_properties_to_yojson x.workflow_run_properties );
      ("StartedOn", option_to_yojson timestamp_value_to_yojson x.started_on);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("Status", option_to_yojson workflow_run_status_to_yojson x.status);
      ("ErrorMessage", option_to_yojson error_string_to_yojson x.error_message);
      ("Statistics", option_to_yojson workflow_run_statistics_to_yojson x.statistics);
      ("Graph", option_to_yojson workflow_graph_to_yojson x.graph);
      ( "StartingEventBatchCondition",
        option_to_yojson starting_event_batch_condition_to_yojson x.starting_event_batch_condition
      );
    ]

let workflow_runs_to_yojson tree = list_to_yojson workflow_run_to_yojson tree

let get_workflow_runs_response_to_yojson (x : get_workflow_runs_response) =
  assoc_to_yojson
    [
      ("Runs", option_to_yojson workflow_runs_to_yojson x.runs);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let get_workflow_runs_request_to_yojson (x : get_workflow_runs_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("IncludeGraph", option_to_yojson nullable_boolean_to_yojson x.include_graph);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let get_workflow_run_properties_response_to_yojson (x : get_workflow_run_properties_response) =
  assoc_to_yojson
    [ ("RunProperties", option_to_yojson workflow_run_properties_to_yojson x.run_properties) ]

let get_workflow_run_properties_request_to_yojson (x : get_workflow_run_properties_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name)); ("RunId", Some (id_string_to_yojson x.run_id));
    ]

let get_workflow_run_response_to_yojson (x : get_workflow_run_response) =
  assoc_to_yojson [ ("Run", option_to_yojson workflow_run_to_yojson x.run) ]

let get_workflow_run_request_to_yojson (x : get_workflow_run_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("IncludeGraph", option_to_yojson nullable_boolean_to_yojson x.include_graph);
    ]

let blueprint_details_to_yojson (x : blueprint_details) =
  assoc_to_yojson
    [
      ("BlueprintName", option_to_yojson orchestration_name_string_to_yojson x.blueprint_name);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
    ]

let workflow_to_yojson (x : workflow) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson generic_string_to_yojson x.description);
      ( "DefaultRunProperties",
        option_to_yojson workflow_run_properties_to_yojson x.default_run_properties );
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("LastRun", option_to_yojson workflow_run_to_yojson x.last_run);
      ("Graph", option_to_yojson workflow_graph_to_yojson x.graph);
      ("MaxConcurrentRuns", option_to_yojson nullable_integer_to_yojson x.max_concurrent_runs);
      ("BlueprintDetails", option_to_yojson blueprint_details_to_yojson x.blueprint_details);
    ]

let get_workflow_response_to_yojson (x : get_workflow_response) =
  assoc_to_yojson [ ("Workflow", option_to_yojson workflow_to_yojson x.workflow) ]

let get_workflow_request_to_yojson (x : get_workflow_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("IncludeGraph", option_to_yojson nullable_boolean_to_yojson x.include_graph);
    ]

let user_defined_function_to_yojson (x : user_defined_function) =
  assoc_to_yojson
    [
      ("FunctionName", option_to_yojson name_string_to_yojson x.function_name);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("ClassName", option_to_yojson name_string_to_yojson x.class_name);
      ("OwnerName", option_to_yojson name_string_to_yojson x.owner_name);
      ("FunctionType", option_to_yojson function_type_to_yojson x.function_type);
      ("OwnerType", option_to_yojson principal_type_to_yojson x.owner_type);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("ResourceUris", option_to_yojson resource_uri_list_to_yojson x.resource_uris);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let user_defined_function_list_to_yojson tree = list_to_yojson user_defined_function_to_yojson tree

let get_user_defined_functions_response_to_yojson (x : get_user_defined_functions_response) =
  assoc_to_yojson
    [
      ( "UserDefinedFunctions",
        option_to_yojson user_defined_function_list_to_yojson x.user_defined_functions );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let catalog_getter_page_size_to_yojson = int_to_yojson

let get_user_defined_functions_request_to_yojson (x : get_user_defined_functions_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("Pattern", Some (name_string_to_yojson x.pattern));
      ("FunctionType", option_to_yojson function_type_to_yojson x.function_type);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson catalog_getter_page_size_to_yojson x.max_results);
    ]

let get_user_defined_function_response_to_yojson (x : get_user_defined_function_response) =
  assoc_to_yojson
    [
      ( "UserDefinedFunction",
        option_to_yojson user_defined_function_to_yojson x.user_defined_function );
    ]

let get_user_defined_function_request_to_yojson (x : get_user_defined_function_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("FunctionName", Some (name_string_to_yojson x.function_name));
    ]

let get_usage_profile_response_to_yojson (x : get_usage_profile_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Configuration", option_to_yojson profile_configuration_to_yojson x.configuration);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
    ]

let get_usage_profile_request_to_yojson (x : get_usage_profile_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let permission_type_mismatch_exception_to_yojson (x : permission_type_mismatch_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let predicate_string_to_yojson = string_to_yojson

let column_row_filter_to_yojson (x : column_row_filter) =
  assoc_to_yojson
    [
      ("ColumnName", option_to_yojson name_string_to_yojson x.column_name);
      ("RowFilterExpression", option_to_yojson predicate_string_to_yojson x.row_filter_expression);
    ]

let column_row_filter_list_to_yojson tree = list_to_yojson column_row_filter_to_yojson tree

let get_unfiltered_table_metadata_response_to_yojson (x : get_unfiltered_table_metadata_response) =
  assoc_to_yojson
    [
      ("Table", option_to_yojson table_to_yojson x.table);
      ("AuthorizedColumns", option_to_yojson name_string_list_to_yojson x.authorized_columns);
      ( "IsRegisteredWithLakeFormation",
        option_to_yojson boolean__to_yojson x.is_registered_with_lake_formation );
      ("CellFilters", option_to_yojson column_row_filter_list_to_yojson x.cell_filters);
      ("QueryAuthorizationId", option_to_yojson hash_string_to_yojson x.query_authorization_id);
      ("IsMultiDialectView", option_to_yojson boolean__to_yojson x.is_multi_dialect_view);
      ("IsMaterializedView", option_to_yojson boolean__to_yojson x.is_materialized_view);
      ("ResourceArn", option_to_yojson arn_string_to_yojson x.resource_arn);
      ("IsProtected", option_to_yojson boolean__to_yojson x.is_protected);
      ("Permissions", option_to_yojson permission_list_to_yojson x.permissions);
      ("RowFilter", option_to_yojson predicate_string_to_yojson x.row_filter);
    ]

let context_value_to_yojson = string_to_yojson
let context_key_to_yojson = string_to_yojson

let additional_context_map_to_yojson tree =
  map_to_yojson context_key_to_yojson context_value_to_yojson tree

let query_session_context_to_yojson (x : query_session_context) =
  assoc_to_yojson
    [
      ("QueryId", option_to_yojson hash_string_to_yojson x.query_id);
      ("QueryStartTime", option_to_yojson timestamp_to_yojson x.query_start_time);
      ("ClusterId", option_to_yojson nullable_string_to_yojson x.cluster_id);
      ("QueryAuthorizationId", option_to_yojson hash_string_to_yojson x.query_authorization_id);
      ("AdditionalContext", option_to_yojson additional_context_map_to_yojson x.additional_context);
    ]

let supported_dialect_to_yojson (x : supported_dialect) =
  assoc_to_yojson
    [
      ("Dialect", option_to_yojson view_dialect_to_yojson x.dialect);
      ("DialectVersion", option_to_yojson view_dialect_version_string_to_yojson x.dialect_version);
    ]

let permission_type_to_yojson (x : permission_type) =
  match x with
  | COLUMN_PERMISSION -> `String "COLUMN_PERMISSION"
  | CELL_FILTER_PERMISSION -> `String "CELL_FILTER_PERMISSION"
  | NESTED_PERMISSION -> `String "NESTED_PERMISSION"
  | NESTED_CELL_PERMISSION -> `String "NESTED_CELL_PERMISSION"

let permission_type_list_to_yojson tree = list_to_yojson permission_type_to_yojson tree
let audit_column_names_list_to_yojson tree = list_to_yojson column_name_string_to_yojson tree
let audit_context_string_to_yojson = string_to_yojson

let audit_context_to_yojson (x : audit_context) =
  assoc_to_yojson
    [
      ( "AdditionalAuditContext",
        option_to_yojson audit_context_string_to_yojson x.additional_audit_context );
      ("RequestedColumns", option_to_yojson audit_column_names_list_to_yojson x.requested_columns);
      ("AllColumnsRequested", option_to_yojson nullable_boolean_to_yojson x.all_columns_requested);
    ]

let get_unfiltered_table_metadata_request_to_yojson (x : get_unfiltered_table_metadata_request) =
  assoc_to_yojson
    [
      ("Region", option_to_yojson value_string_to_yojson x.region);
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("Name", Some (name_string_to_yojson x.name));
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ( "SupportedPermissionTypes",
        Some (permission_type_list_to_yojson x.supported_permission_types) );
      ("ParentResourceArn", option_to_yojson arn_string_to_yojson x.parent_resource_arn);
      ("RootResourceArn", option_to_yojson arn_string_to_yojson x.root_resource_arn);
      ("SupportedDialect", option_to_yojson supported_dialect_to_yojson x.supported_dialect);
      ("Permissions", option_to_yojson permission_list_to_yojson x.permissions);
      ( "QuerySessionContext",
        option_to_yojson query_session_context_to_yojson x.query_session_context );
    ]

let partition_to_yojson (x : partition) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson value_string_list_to_yojson x.values);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastAccessTime", option_to_yojson timestamp_to_yojson x.last_access_time);
      ("StorageDescriptor", option_to_yojson storage_descriptor_to_yojson x.storage_descriptor);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("LastAnalyzedTime", option_to_yojson timestamp_to_yojson x.last_analyzed_time);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let unfiltered_partition_to_yojson (x : unfiltered_partition) =
  assoc_to_yojson
    [
      ("Partition", option_to_yojson partition_to_yojson x.partition);
      ("AuthorizedColumns", option_to_yojson name_string_list_to_yojson x.authorized_columns);
      ( "IsRegisteredWithLakeFormation",
        option_to_yojson boolean__to_yojson x.is_registered_with_lake_formation );
    ]

let unfiltered_partition_list_to_yojson tree = list_to_yojson unfiltered_partition_to_yojson tree

let get_unfiltered_partitions_metadata_response_to_yojson
    (x : get_unfiltered_partitions_metadata_response) =
  assoc_to_yojson
    [
      ( "UnfilteredPartitions",
        option_to_yojson unfiltered_partition_list_to_yojson x.unfiltered_partitions );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let total_segments_integer_to_yojson = int_to_yojson

let segment_to_yojson (x : segment) =
  assoc_to_yojson
    [
      ("SegmentNumber", Some (non_negative_integer_to_yojson x.segment_number));
      ("TotalSegments", Some (total_segments_integer_to_yojson x.total_segments));
    ]

let get_unfiltered_partitions_metadata_request_to_yojson
    (x : get_unfiltered_partitions_metadata_request) =
  assoc_to_yojson
    [
      ("Region", option_to_yojson value_string_to_yojson x.region);
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("Expression", option_to_yojson predicate_string_to_yojson x.expression);
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ( "SupportedPermissionTypes",
        Some (permission_type_list_to_yojson x.supported_permission_types) );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Segment", option_to_yojson segment_to_yojson x.segment);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ( "QuerySessionContext",
        option_to_yojson query_session_context_to_yojson x.query_session_context );
    ]

let get_unfiltered_partition_metadata_response_to_yojson
    (x : get_unfiltered_partition_metadata_response) =
  assoc_to_yojson
    [
      ("Partition", option_to_yojson partition_to_yojson x.partition);
      ("AuthorizedColumns", option_to_yojson name_string_list_to_yojson x.authorized_columns);
      ( "IsRegisteredWithLakeFormation",
        option_to_yojson boolean__to_yojson x.is_registered_with_lake_formation );
    ]

let get_unfiltered_partition_metadata_request_to_yojson
    (x : get_unfiltered_partition_metadata_request) =
  assoc_to_yojson
    [
      ("Region", option_to_yojson value_string_to_yojson x.region);
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ( "SupportedPermissionTypes",
        Some (permission_type_list_to_yojson x.supported_permission_types) );
      ( "QuerySessionContext",
        option_to_yojson query_session_context_to_yojson x.query_session_context );
    ]

let trigger_list_to_yojson tree = list_to_yojson trigger_to_yojson tree

let get_triggers_response_to_yojson (x : get_triggers_response) =
  assoc_to_yojson
    [
      ("Triggers", option_to_yojson trigger_list_to_yojson x.triggers);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let get_triggers_request_to_yojson (x : get_triggers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("DependentJobName", option_to_yojson name_string_to_yojson x.dependent_job_name);
      ("MaxResults", option_to_yojson orchestration_page_size200_to_yojson x.max_results);
    ]

let get_trigger_response_to_yojson (x : get_trigger_response) =
  assoc_to_yojson [ ("Trigger", option_to_yojson trigger_to_yojson x.trigger) ]

let get_trigger_request_to_yojson (x : get_trigger_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let get_tags_response_to_yojson (x : get_tags_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_map_to_yojson x.tags) ]

let get_tags_request_to_yojson (x : get_tags_request) =
  assoc_to_yojson [ ("ResourceArn", Some (glue_resource_arn_to_yojson x.resource_arn)) ]

let table_version_to_yojson (x : table_version) =
  assoc_to_yojson
    [
      ("Table", option_to_yojson table_to_yojson x.table);
      ("VersionId", option_to_yojson version_string_to_yojson x.version_id);
    ]

let get_table_versions_list_to_yojson tree = list_to_yojson table_version_to_yojson tree

let get_table_versions_response_to_yojson (x : get_table_versions_response) =
  assoc_to_yojson
    [
      ("TableVersions", option_to_yojson get_table_versions_list_to_yojson x.table_versions);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_table_versions_request_to_yojson (x : get_table_versions_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson catalog_getter_page_size_to_yojson x.max_results);
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
    ]

let get_table_version_response_to_yojson (x : get_table_version_response) =
  assoc_to_yojson [ ("TableVersion", option_to_yojson table_version_to_yojson x.table_version) ]

let get_table_version_request_to_yojson (x : get_table_version_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("VersionId", option_to_yojson version_string_to_yojson x.version_id);
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
    ]

let get_tables_response_to_yojson (x : get_tables_response) =
  assoc_to_yojson
    [
      ("TableList", option_to_yojson table_list_to_yojson x.table_list);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let table_attributes_to_yojson (x : table_attributes) =
  match x with
  | NAME -> `String "NAME"
  | TABLE_TYPE -> `String "TABLE_TYPE"
  | DEFAULT -> `String "DEFAULT"
  | LATEST_ICEBERG_METADATA -> `String "LATEST_ICEBERG_METADATA"

let table_attributes_list_to_yojson tree = list_to_yojson table_attributes_to_yojson tree
let filter_string_to_yojson = string_to_yojson

let get_tables_request_to_yojson (x : get_tables_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("Expression", option_to_yojson filter_string_to_yojson x.expression);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson catalog_getter_page_size_to_yojson x.max_results);
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ("QueryAsOfTime", option_to_yojson timestamp_to_yojson x.query_as_of_time);
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("IncludeStatusDetails", option_to_yojson boolean_nullable_to_yojson x.include_status_details);
      ("AttributesToGet", option_to_yojson table_attributes_list_to_yojson x.attributes_to_get);
    ]

let configuration_source_to_yojson (x : configuration_source) =
  match x with CATALOG -> `String "catalog" | TABLE -> `String "table"

let table_optimizer_to_yojson (x : table_optimizer) =
  assoc_to_yojson
    [
      ("type", option_to_yojson table_optimizer_type_to_yojson x.type_);
      ("configuration", option_to_yojson table_optimizer_configuration_to_yojson x.configuration);
      ("lastRun", option_to_yojson table_optimizer_run_to_yojson x.last_run);
      ("configurationSource", option_to_yojson configuration_source_to_yojson x.configuration_source);
    ]

let get_table_optimizer_response_to_yojson (x : get_table_optimizer_response) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
      ("TableOptimizer", option_to_yojson table_optimizer_to_yojson x.table_optimizer);
    ]

let get_table_optimizer_request_to_yojson (x : get_table_optimizer_request) =
  assoc_to_yojson
    [
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("Type", Some (table_optimizer_type_to_yojson x.type_));
    ]

let get_table_response_to_yojson (x : get_table_response) =
  assoc_to_yojson [ ("Table", option_to_yojson table_to_yojson x.table) ]

let get_table_request_to_yojson (x : get_table_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("Name", Some (name_string_to_yojson x.name));
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ("QueryAsOfTime", option_to_yojson timestamp_to_yojson x.query_as_of_time);
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("IncludeStatusDetails", option_to_yojson boolean_nullable_to_yojson x.include_status_details);
      ("AttributesToGet", option_to_yojson table_attributes_list_to_yojson x.attributes_to_get);
    ]

let get_statement_response_to_yojson (x : get_statement_response) =
  assoc_to_yojson [ ("Statement", option_to_yojson statement_to_yojson x.statement) ]

let get_statement_request_to_yojson (x : get_statement_request) =
  assoc_to_yojson
    [
      ("SessionId", Some (name_string_to_yojson x.session_id));
      ("Id", Some (integer_value_to_yojson x.id));
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
    ]

let sensitive_string_to_yojson = string_to_yojson
let spark_connect_endpoint_url_to_yojson = string_to_yojson

let session_endpoint_to_yojson (x : session_endpoint) =
  assoc_to_yojson
    [
      ("Url", Some (spark_connect_endpoint_url_to_yojson x.url));
      ("AuthToken", Some (sensitive_string_to_yojson x.auth_token));
      ("AuthTokenExpirationTime", Some (timestamp_value_to_yojson x.auth_token_expiration_time));
    ]

let get_session_endpoint_response_to_yojson (x : get_session_endpoint_response) =
  assoc_to_yojson [ ("SparkConnect", Some (session_endpoint_to_yojson x.spark_connect)) ]

let get_session_endpoint_request_to_yojson (x : get_session_endpoint_request) =
  assoc_to_yojson [ ("SessionId", Some (name_string_to_yojson x.session_id)) ]

let get_session_response_to_yojson (x : get_session_response) =
  assoc_to_yojson [ ("Session", option_to_yojson session_to_yojson x.session) ]

let get_session_request_to_yojson (x : get_session_request) =
  assoc_to_yojson
    [
      ("Id", Some (name_string_to_yojson x.id));
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
    ]

let data_quality_encryption_mode_to_yojson (x : data_quality_encryption_mode) =
  match x with DISABLED -> `String "DISABLED" | SSEKMS -> `String "SSE-KMS"

let data_quality_encryption_to_yojson (x : data_quality_encryption) =
  assoc_to_yojson
    [
      ( "DataQualityEncryptionMode",
        option_to_yojson data_quality_encryption_mode_to_yojson x.data_quality_encryption_mode );
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
    ]

let job_bookmarks_encryption_mode_to_yojson (x : job_bookmarks_encryption_mode) =
  match x with DISABLED -> `String "DISABLED" | CSEKMS -> `String "CSE-KMS"

let job_bookmarks_encryption_to_yojson (x : job_bookmarks_encryption) =
  assoc_to_yojson
    [
      ( "JobBookmarksEncryptionMode",
        option_to_yojson job_bookmarks_encryption_mode_to_yojson x.job_bookmarks_encryption_mode );
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
    ]

let cloud_watch_encryption_mode_to_yojson (x : cloud_watch_encryption_mode) =
  match x with DISABLED -> `String "DISABLED" | SSEKMS -> `String "SSE-KMS"

let cloud_watch_encryption_to_yojson (x : cloud_watch_encryption) =
  assoc_to_yojson
    [
      ( "CloudWatchEncryptionMode",
        option_to_yojson cloud_watch_encryption_mode_to_yojson x.cloud_watch_encryption_mode );
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
    ]

let s3_encryption_mode_to_yojson (x : s3_encryption_mode) =
  match x with
  | DISABLED -> `String "DISABLED"
  | SSEKMS -> `String "SSE-KMS"
  | SSES3 -> `String "SSE-S3"

let s3_encryption_to_yojson (x : s3_encryption) =
  assoc_to_yojson
    [
      ("S3EncryptionMode", option_to_yojson s3_encryption_mode_to_yojson x.s3_encryption_mode);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
    ]

let s3_encryption_list_to_yojson tree = list_to_yojson s3_encryption_to_yojson tree

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("S3Encryption", option_to_yojson s3_encryption_list_to_yojson x.s3_encryption);
      ( "CloudWatchEncryption",
        option_to_yojson cloud_watch_encryption_to_yojson x.cloud_watch_encryption );
      ( "JobBookmarksEncryption",
        option_to_yojson job_bookmarks_encryption_to_yojson x.job_bookmarks_encryption );
      ( "DataQualityEncryption",
        option_to_yojson data_quality_encryption_to_yojson x.data_quality_encryption );
    ]

let security_configuration_to_yojson (x : security_configuration) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("CreatedTimeStamp", option_to_yojson timestamp_value_to_yojson x.created_time_stamp);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let security_configuration_list_to_yojson tree =
  list_to_yojson security_configuration_to_yojson tree

let get_security_configurations_response_to_yojson (x : get_security_configurations_response) =
  assoc_to_yojson
    [
      ( "SecurityConfigurations",
        option_to_yojson security_configuration_list_to_yojson x.security_configurations );
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let get_security_configurations_request_to_yojson (x : get_security_configurations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let get_security_configuration_response_to_yojson (x : get_security_configuration_response) =
  assoc_to_yojson
    [
      ( "SecurityConfiguration",
        option_to_yojson security_configuration_to_yojson x.security_configuration );
    ]

let get_security_configuration_request_to_yojson (x : get_security_configuration_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let schema_definition_diff_to_yojson = string_to_yojson

let get_schema_versions_diff_response_to_yojson (x : get_schema_versions_diff_response) =
  assoc_to_yojson [ ("Diff", option_to_yojson schema_definition_diff_to_yojson x.diff) ]

let schema_diff_type_to_yojson (x : schema_diff_type) =
  match x with SYNTAX_DIFF -> `String "SYNTAX_DIFF"

let get_schema_versions_diff_input_to_yojson (x : get_schema_versions_diff_input) =
  assoc_to_yojson
    [
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
      ( "FirstSchemaVersionNumber",
        Some (schema_version_number_to_yojson x.first_schema_version_number) );
      ( "SecondSchemaVersionNumber",
        Some (schema_version_number_to_yojson x.second_schema_version_number) );
      ("SchemaDiffType", Some (schema_diff_type_to_yojson x.schema_diff_type));
    ]

let data_format_to_yojson (x : data_format) =
  match x with AVRO -> `String "AVRO" | JSON -> `String "JSON" | PROTOBUF -> `String "PROTOBUF"

let get_schema_version_response_to_yojson (x : get_schema_version_response) =
  assoc_to_yojson
    [
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("SchemaDefinition", option_to_yojson schema_definition_string_to_yojson x.schema_definition);
      ("DataFormat", option_to_yojson data_format_to_yojson x.data_format);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("Status", option_to_yojson schema_version_status_to_yojson x.status);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
    ]

let get_schema_version_input_to_yojson (x : get_schema_version_input) =
  assoc_to_yojson
    [
      ("SchemaId", option_to_yojson schema_id_to_yojson x.schema_id);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ( "SchemaVersionNumber",
        option_to_yojson schema_version_number_to_yojson x.schema_version_number );
    ]

let get_schema_by_definition_response_to_yojson (x : get_schema_by_definition_response) =
  assoc_to_yojson
    [
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("DataFormat", option_to_yojson data_format_to_yojson x.data_format);
      ("Status", option_to_yojson schema_version_status_to_yojson x.status);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
    ]

let get_schema_by_definition_input_to_yojson (x : get_schema_by_definition_input) =
  assoc_to_yojson
    [
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
      ("SchemaDefinition", Some (schema_definition_string_to_yojson x.schema_definition));
    ]

let schema_checkpoint_number_to_yojson = long_to_yojson

let get_schema_response_to_yojson (x : get_schema_response) =
  assoc_to_yojson
    [
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("DataFormat", option_to_yojson data_format_to_yojson x.data_format);
      ("Compatibility", option_to_yojson compatibility_to_yojson x.compatibility);
      ("SchemaCheckpoint", option_to_yojson schema_checkpoint_number_to_yojson x.schema_checkpoint);
      ("LatestSchemaVersion", option_to_yojson version_long_number_to_yojson x.latest_schema_version);
      ("NextSchemaVersion", option_to_yojson version_long_number_to_yojson x.next_schema_version);
      ("SchemaStatus", option_to_yojson schema_status_to_yojson x.schema_status);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("UpdatedTime", option_to_yojson updated_timestamp_to_yojson x.updated_time);
    ]

let get_schema_input_to_yojson (x : get_schema_input) =
  assoc_to_yojson [ ("SchemaId", Some (schema_id_to_yojson x.schema_id)) ]

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson
    [
      ("PolicyInJson", option_to_yojson policy_json_string_to_yojson x.policy_in_json);
      ("PolicyHash", option_to_yojson hash_string_to_yojson x.policy_hash);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
    ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", option_to_yojson glue_resource_arn_to_yojson x.resource_arn) ]

let glue_policy_to_yojson (x : glue_policy) =
  assoc_to_yojson
    [
      ("PolicyInJson", option_to_yojson policy_json_string_to_yojson x.policy_in_json);
      ("PolicyHash", option_to_yojson hash_string_to_yojson x.policy_hash);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
    ]

let get_resource_policies_response_list_to_yojson tree = list_to_yojson glue_policy_to_yojson tree

let get_resource_policies_response_to_yojson (x : get_resource_policies_response) =
  assoc_to_yojson
    [
      ( "GetResourcePoliciesResponseList",
        option_to_yojson get_resource_policies_response_list_to_yojson
          x.get_resource_policies_response_list );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_resource_policies_request_to_yojson (x : get_resource_policies_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let get_registry_response_to_yojson (x : get_registry_response) =
  assoc_to_yojson
    [
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Status", option_to_yojson registry_status_to_yojson x.status);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("UpdatedTime", option_to_yojson updated_timestamp_to_yojson x.updated_time);
    ]

let get_registry_input_to_yojson (x : get_registry_input) =
  assoc_to_yojson [ ("RegistryId", Some (registry_id_to_yojson x.registry_id)) ]

let scala_code_to_yojson = string_to_yojson
let python_script_to_yojson = string_to_yojson

let get_plan_response_to_yojson (x : get_plan_response) =
  assoc_to_yojson
    [
      ("PythonScript", option_to_yojson python_script_to_yojson x.python_script);
      ("ScalaCode", option_to_yojson scala_code_to_yojson x.scala_code);
    ]

let additional_plan_options_map_to_yojson tree =
  map_to_yojson generic_string_to_yojson generic_string_to_yojson tree

let language_to_yojson (x : language) =
  match x with PYTHON -> `String "PYTHON" | SCALA -> `String "SCALA"

let code_gen_arg_value_to_yojson = string_to_yojson
let code_gen_arg_name_to_yojson = string_to_yojson

let code_gen_node_arg_to_yojson (x : code_gen_node_arg) =
  assoc_to_yojson
    [
      ("Name", Some (code_gen_arg_name_to_yojson x.name));
      ("Value", Some (code_gen_arg_value_to_yojson x.value));
      ("Param", option_to_yojson boolean__to_yojson x.param);
    ]

let code_gen_node_args_to_yojson tree = list_to_yojson code_gen_node_arg_to_yojson tree

let location_to_yojson (x : location) =
  assoc_to_yojson
    [
      ("Jdbc", option_to_yojson code_gen_node_args_to_yojson x.jdbc);
      ("S3", option_to_yojson code_gen_node_args_to_yojson x.s3);
      ("DynamoDB", option_to_yojson code_gen_node_args_to_yojson x.dynamo_d_b);
    ]

let catalog_entry_to_yojson (x : catalog_entry) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
    ]

let catalog_entries_to_yojson tree = list_to_yojson catalog_entry_to_yojson tree
let field_type_to_yojson = string_to_yojson
let schema_path_string_to_yojson = string_to_yojson

let mapping_entry_to_yojson (x : mapping_entry) =
  assoc_to_yojson
    [
      ("SourceTable", option_to_yojson table_name_to_yojson x.source_table);
      ("SourcePath", option_to_yojson schema_path_string_to_yojson x.source_path);
      ("SourceType", option_to_yojson field_type_to_yojson x.source_type);
      ("TargetTable", option_to_yojson table_name_to_yojson x.target_table);
      ("TargetPath", option_to_yojson schema_path_string_to_yojson x.target_path);
      ("TargetType", option_to_yojson field_type_to_yojson x.target_type);
    ]

let mapping_list_to_yojson tree = list_to_yojson mapping_entry_to_yojson tree

let get_plan_request_to_yojson (x : get_plan_request) =
  assoc_to_yojson
    [
      ("Mapping", Some (mapping_list_to_yojson x.mapping));
      ("Source", Some (catalog_entry_to_yojson x.source));
      ("Sinks", option_to_yojson catalog_entries_to_yojson x.sinks);
      ("Location", option_to_yojson location_to_yojson x.location);
      ("Language", option_to_yojson language_to_yojson x.language);
      ( "AdditionalPlanOptionsMap",
        option_to_yojson additional_plan_options_map_to_yojson x.additional_plan_options_map );
    ]

let partition_list_to_yojson tree = list_to_yojson partition_to_yojson tree

let get_partitions_response_to_yojson (x : get_partitions_response) =
  assoc_to_yojson
    [
      ("Partitions", option_to_yojson partition_list_to_yojson x.partitions);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_partitions_request_to_yojson (x : get_partitions_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("Expression", option_to_yojson predicate_string_to_yojson x.expression);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Segment", option_to_yojson segment_to_yojson x.segment);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("ExcludeColumnSchema", option_to_yojson boolean_nullable_to_yojson x.exclude_column_schema);
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ("QueryAsOfTime", option_to_yojson timestamp_to_yojson x.query_as_of_time);
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
    ]

let partition_value_list_to_yojson (x : partition_value_list) =
  assoc_to_yojson [ ("Values", Some (value_string_list_to_yojson x.values)) ]

let backfill_errored_partitions_list_to_yojson tree =
  list_to_yojson partition_value_list_to_yojson tree

let backfill_error_code_to_yojson (x : backfill_error_code) =
  match x with
  | ENCRYPTED_PARTITION_ERROR -> `String "ENCRYPTED_PARTITION_ERROR"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | INVALID_PARTITION_TYPE_DATA_ERROR -> `String "INVALID_PARTITION_TYPE_DATA_ERROR"
  | MISSING_PARTITION_VALUE_ERROR -> `String "MISSING_PARTITION_VALUE_ERROR"
  | UNSUPPORTED_PARTITION_CHARACTER_ERROR -> `String "UNSUPPORTED_PARTITION_CHARACTER_ERROR"

let backfill_error_to_yojson (x : backfill_error) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson backfill_error_code_to_yojson x.code);
      ("Partitions", option_to_yojson backfill_errored_partitions_list_to_yojson x.partitions);
    ]

let backfill_errors_to_yojson tree = list_to_yojson backfill_error_to_yojson tree

let partition_index_status_to_yojson (x : partition_index_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"

let key_schema_element_to_yojson (x : key_schema_element) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Type", Some (column_type_string_to_yojson x.type_));
    ]

let key_schema_element_list_to_yojson tree = list_to_yojson key_schema_element_to_yojson tree

let partition_index_descriptor_to_yojson (x : partition_index_descriptor) =
  assoc_to_yojson
    [
      ("IndexName", Some (name_string_to_yojson x.index_name));
      ("Keys", Some (key_schema_element_list_to_yojson x.keys));
      ("IndexStatus", Some (partition_index_status_to_yojson x.index_status));
      ("BackfillErrors", option_to_yojson backfill_errors_to_yojson x.backfill_errors);
    ]

let partition_index_descriptor_list_to_yojson tree =
  list_to_yojson partition_index_descriptor_to_yojson tree

let get_partition_indexes_response_to_yojson (x : get_partition_indexes_response) =
  assoc_to_yojson
    [
      ( "PartitionIndexDescriptorList",
        option_to_yojson partition_index_descriptor_list_to_yojson x.partition_index_descriptor_list
      );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_partition_indexes_request_to_yojson (x : get_partition_indexes_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_partition_response_to_yojson (x : get_partition_response) =
  assoc_to_yojson [ ("Partition", option_to_yojson partition_to_yojson x.partition) ]

let get_partition_request_to_yojson (x : get_partition_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
    ]

let ml_user_data_encryption_mode_string_to_yojson (x : ml_user_data_encryption_mode_string) =
  match x with DISABLED -> `String "DISABLED" | SSEKMS -> `String "SSE-KMS"

let ml_user_data_encryption_to_yojson (x : ml_user_data_encryption) =
  assoc_to_yojson
    [
      ( "MlUserDataEncryptionMode",
        Some (ml_user_data_encryption_mode_string_to_yojson x.ml_user_data_encryption_mode) );
      ("KmsKeyId", option_to_yojson name_string_to_yojson x.kms_key_id);
    ]

let transform_encryption_to_yojson (x : transform_encryption) =
  assoc_to_yojson
    [
      ( "MlUserDataEncryption",
        option_to_yojson ml_user_data_encryption_to_yojson x.ml_user_data_encryption );
      ( "TaskRunSecurityConfigurationName",
        option_to_yojson name_string_to_yojson x.task_run_security_configuration_name );
    ]

let label_count_to_yojson = int_to_yojson

let column_importance_to_yojson (x : column_importance) =
  assoc_to_yojson
    [
      ("ColumnName", option_to_yojson name_string_to_yojson x.column_name);
      ("Importance", option_to_yojson generic_bounded_double_to_yojson x.importance);
    ]

let column_importance_list_to_yojson tree = list_to_yojson column_importance_to_yojson tree
let records_count_to_yojson = long_to_yojson

let confusion_matrix_to_yojson (x : confusion_matrix) =
  assoc_to_yojson
    [
      ("NumTruePositives", option_to_yojson records_count_to_yojson x.num_true_positives);
      ("NumFalsePositives", option_to_yojson records_count_to_yojson x.num_false_positives);
      ("NumTrueNegatives", option_to_yojson records_count_to_yojson x.num_true_negatives);
      ("NumFalseNegatives", option_to_yojson records_count_to_yojson x.num_false_negatives);
    ]

let find_matches_metrics_to_yojson (x : find_matches_metrics) =
  assoc_to_yojson
    [
      ("AreaUnderPRCurve", option_to_yojson generic_bounded_double_to_yojson x.area_under_pr_curve);
      ("Precision", option_to_yojson generic_bounded_double_to_yojson x.precision);
      ("Recall", option_to_yojson generic_bounded_double_to_yojson x.recall);
      ("F1", option_to_yojson generic_bounded_double_to_yojson x.f1);
      ("ConfusionMatrix", option_to_yojson confusion_matrix_to_yojson x.confusion_matrix);
      ("ColumnImportances", option_to_yojson column_importance_list_to_yojson x.column_importances);
    ]

let evaluation_metrics_to_yojson (x : evaluation_metrics) =
  assoc_to_yojson
    [
      ("TransformType", Some (transform_type_to_yojson x.transform_type));
      ("FindMatchesMetrics", option_to_yojson find_matches_metrics_to_yojson x.find_matches_metrics);
    ]

let glue_tables_to_yojson tree = list_to_yojson glue_table_to_yojson tree

let ml_transform_to_yojson (x : ml_transform) =
  assoc_to_yojson
    [
      ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Status", option_to_yojson transform_status_type_to_yojson x.status);
      ("CreatedOn", option_to_yojson timestamp_to_yojson x.created_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("InputRecordTables", option_to_yojson glue_tables_to_yojson x.input_record_tables);
      ("Parameters", option_to_yojson transform_parameters_to_yojson x.parameters);
      ("EvaluationMetrics", option_to_yojson evaluation_metrics_to_yojson x.evaluation_metrics);
      ("LabelCount", option_to_yojson label_count_to_yojson x.label_count);
      ("Schema", option_to_yojson transform_schema_to_yojson x.schema);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("MaxRetries", option_to_yojson nullable_integer_to_yojson x.max_retries);
      ("TransformEncryption", option_to_yojson transform_encryption_to_yojson x.transform_encryption);
    ]

let transform_list_to_yojson tree = list_to_yojson ml_transform_to_yojson tree

let get_ml_transforms_response_to_yojson (x : get_ml_transforms_response) =
  assoc_to_yojson
    [
      ("Transforms", Some (transform_list_to_yojson x.transforms));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let get_ml_transforms_request_to_yojson (x : get_ml_transforms_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Filter", option_to_yojson transform_filter_criteria_to_yojson x.filter);
      ("Sort", option_to_yojson transform_sort_criteria_to_yojson x.sort);
    ]

let get_ml_transform_response_to_yojson (x : get_ml_transform_response) =
  assoc_to_yojson
    [
      ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Status", option_to_yojson transform_status_type_to_yojson x.status);
      ("CreatedOn", option_to_yojson timestamp_to_yojson x.created_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("InputRecordTables", option_to_yojson glue_tables_to_yojson x.input_record_tables);
      ("Parameters", option_to_yojson transform_parameters_to_yojson x.parameters);
      ("EvaluationMetrics", option_to_yojson evaluation_metrics_to_yojson x.evaluation_metrics);
      ("LabelCount", option_to_yojson label_count_to_yojson x.label_count);
      ("Schema", option_to_yojson transform_schema_to_yojson x.schema);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("MaxRetries", option_to_yojson nullable_integer_to_yojson x.max_retries);
      ("TransformEncryption", option_to_yojson transform_encryption_to_yojson x.transform_encryption);
    ]

let get_ml_transform_request_to_yojson (x : get_ml_transform_request) =
  assoc_to_yojson [ ("TransformId", Some (hash_string_to_yojson x.transform_id)) ]

let find_matches_task_run_properties_to_yojson (x : find_matches_task_run_properties) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson hash_string_to_yojson x.job_id);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
    ]

let labeling_set_generation_task_run_properties_to_yojson
    (x : labeling_set_generation_task_run_properties) =
  assoc_to_yojson [ ("OutputS3Path", option_to_yojson uri_string_to_yojson x.output_s3_path) ]

let export_labels_task_run_properties_to_yojson (x : export_labels_task_run_properties) =
  assoc_to_yojson [ ("OutputS3Path", option_to_yojson uri_string_to_yojson x.output_s3_path) ]

let import_labels_task_run_properties_to_yojson (x : import_labels_task_run_properties) =
  assoc_to_yojson
    [
      ("InputS3Path", option_to_yojson uri_string_to_yojson x.input_s3_path);
      ("Replace", option_to_yojson replace_boolean_to_yojson x.replace);
    ]

let task_type_to_yojson (x : task_type) =
  match x with
  | EVALUATION -> `String "EVALUATION"
  | LABELING_SET_GENERATION -> `String "LABELING_SET_GENERATION"
  | IMPORT_LABELS -> `String "IMPORT_LABELS"
  | EXPORT_LABELS -> `String "EXPORT_LABELS"
  | FIND_MATCHES -> `String "FIND_MATCHES"

let task_run_properties_to_yojson (x : task_run_properties) =
  assoc_to_yojson
    [
      ("TaskType", option_to_yojson task_type_to_yojson x.task_type);
      ( "ImportLabelsTaskRunProperties",
        option_to_yojson import_labels_task_run_properties_to_yojson
          x.import_labels_task_run_properties );
      ( "ExportLabelsTaskRunProperties",
        option_to_yojson export_labels_task_run_properties_to_yojson
          x.export_labels_task_run_properties );
      ( "LabelingSetGenerationTaskRunProperties",
        option_to_yojson labeling_set_generation_task_run_properties_to_yojson
          x.labeling_set_generation_task_run_properties );
      ( "FindMatchesTaskRunProperties",
        option_to_yojson find_matches_task_run_properties_to_yojson
          x.find_matches_task_run_properties );
    ]

let task_run_to_yojson (x : task_run) =
  assoc_to_yojson
    [
      ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id);
      ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("LogGroupName", option_to_yojson generic_string_to_yojson x.log_group_name);
      ("Properties", option_to_yojson task_run_properties_to_yojson x.properties);
      ("ErrorString", option_to_yojson generic_string_to_yojson x.error_string);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("ExecutionTime", option_to_yojson execution_time_to_yojson x.execution_time);
    ]

let task_run_list_to_yojson tree = list_to_yojson task_run_to_yojson tree

let get_ml_task_runs_response_to_yojson (x : get_ml_task_runs_response) =
  assoc_to_yojson
    [
      ("TaskRuns", option_to_yojson task_run_list_to_yojson x.task_runs);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let task_run_sort_column_type_to_yojson (x : task_run_sort_column_type) =
  match x with
  | TASK_RUN_TYPE -> `String "TASK_RUN_TYPE"
  | STATUS -> `String "STATUS"
  | STARTED -> `String "STARTED"

let task_run_sort_criteria_to_yojson (x : task_run_sort_criteria) =
  assoc_to_yojson
    [
      ("Column", Some (task_run_sort_column_type_to_yojson x.column));
      ("SortDirection", Some (sort_direction_type_to_yojson x.sort_direction));
    ]

let task_run_filter_criteria_to_yojson (x : task_run_filter_criteria) =
  assoc_to_yojson
    [
      ("TaskRunType", option_to_yojson task_type_to_yojson x.task_run_type);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("StartedBefore", option_to_yojson timestamp_to_yojson x.started_before);
      ("StartedAfter", option_to_yojson timestamp_to_yojson x.started_after);
    ]

let get_ml_task_runs_request_to_yojson (x : get_ml_task_runs_request) =
  assoc_to_yojson
    [
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Filter", option_to_yojson task_run_filter_criteria_to_yojson x.filter);
      ("Sort", option_to_yojson task_run_sort_criteria_to_yojson x.sort);
    ]

let get_ml_task_run_response_to_yojson (x : get_ml_task_run_response) =
  assoc_to_yojson
    [
      ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id);
      ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("LogGroupName", option_to_yojson generic_string_to_yojson x.log_group_name);
      ("Properties", option_to_yojson task_run_properties_to_yojson x.properties);
      ("ErrorString", option_to_yojson generic_string_to_yojson x.error_string);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("ExecutionTime", option_to_yojson execution_time_to_yojson x.execution_time);
    ]

let get_ml_task_run_request_to_yojson (x : get_ml_task_run_request) =
  assoc_to_yojson
    [
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
      ("TaskRunId", Some (hash_string_to_yojson x.task_run_id));
    ]

let get_materialized_view_refresh_task_run_response_to_yojson
    (x : get_materialized_view_refresh_task_run_response) =
  assoc_to_yojson
    [
      ( "MaterializedViewRefreshTaskRun",
        option_to_yojson materialized_view_refresh_task_run_to_yojson
          x.materialized_view_refresh_task_run );
    ]

let get_materialized_view_refresh_task_run_request_to_yojson
    (x : get_materialized_view_refresh_task_run_request) =
  assoc_to_yojson
    [
      ("CatalogId", Some (name_string_to_yojson x.catalog_id));
      ( "MaterializedViewRefreshTaskRunId",
        Some (uui_dv4_to_yojson x.materialized_view_refresh_task_run_id) );
    ]

let get_mapping_response_to_yojson (x : get_mapping_response) =
  assoc_to_yojson [ ("Mapping", Some (mapping_list_to_yojson x.mapping)) ]

let get_mapping_request_to_yojson (x : get_mapping_request) =
  assoc_to_yojson
    [
      ("Source", Some (catalog_entry_to_yojson x.source));
      ("Sinks", option_to_yojson catalog_entries_to_yojson x.sinks);
      ("Location", option_to_yojson location_to_yojson x.location);
    ]

let job_to_yojson (x : job) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("JobMode", option_to_yojson job_mode_to_yojson x.job_mode);
      ("JobRunQueuingEnabled", option_to_yojson nullable_boolean_to_yojson x.job_run_queuing_enabled);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("LogUri", option_to_yojson uri_string_to_yojson x.log_uri);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("ExecutionProperty", option_to_yojson execution_property_to_yojson x.execution_property);
      ("Command", option_to_yojson job_command_to_yojson x.command);
      ("DefaultArguments", option_to_yojson generic_map_to_yojson x.default_arguments);
      ("NonOverridableArguments", option_to_yojson generic_map_to_yojson x.non_overridable_arguments);
      ("Connections", option_to_yojson connections_list_to_yojson x.connections);
      ("MaxRetries", option_to_yojson max_retries_to_yojson x.max_retries);
      ("AllocatedCapacity", option_to_yojson integer_value_to_yojson x.allocated_capacity);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ( "CodeGenConfigurationNodes",
        option_to_yojson code_gen_configuration_nodes_to_yojson x.code_gen_configuration_nodes );
      ("ExecutionClass", option_to_yojson execution_class_to_yojson x.execution_class);
      ( "SourceControlDetails",
        option_to_yojson source_control_details_to_yojson x.source_control_details );
      ("MaintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ("ProfileName", option_to_yojson name_string_to_yojson x.profile_name);
    ]

let job_list_to_yojson tree = list_to_yojson job_to_yojson tree

let get_jobs_response_to_yojson (x : get_jobs_response) =
  assoc_to_yojson
    [
      ("Jobs", option_to_yojson job_list_to_yojson x.jobs);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let get_jobs_request_to_yojson (x : get_jobs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let get_job_runs_response_to_yojson (x : get_job_runs_response) =
  assoc_to_yojson
    [
      ("JobRuns", option_to_yojson job_run_list_to_yojson x.job_runs);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let get_job_runs_request_to_yojson (x : get_job_runs_request) =
  assoc_to_yojson
    [
      ("JobName", Some (name_string_to_yojson x.job_name));
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson orchestration_page_size200_to_yojson x.max_results);
    ]

let get_job_run_response_to_yojson (x : get_job_run_response) =
  assoc_to_yojson [ ("JobRun", option_to_yojson job_run_to_yojson x.job_run) ]

let get_job_run_request_to_yojson (x : get_job_run_request) =
  assoc_to_yojson
    [
      ("JobName", Some (name_string_to_yojson x.job_name));
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("PredecessorsIncluded", option_to_yojson boolean_value_to_yojson x.predecessors_included);
    ]

let get_job_bookmark_response_to_yojson (x : get_job_bookmark_response) =
  assoc_to_yojson
    [ ("JobBookmarkEntry", option_to_yojson job_bookmark_entry_to_yojson x.job_bookmark_entry) ]

let get_job_bookmark_request_to_yojson (x : get_job_bookmark_request) =
  assoc_to_yojson
    [
      ("JobName", Some (job_name_to_yojson x.job_name));
      ("RunId", option_to_yojson run_id_to_yojson x.run_id);
    ]

let get_job_response_to_yojson (x : get_job_response) =
  assoc_to_yojson [ ("Job", option_to_yojson job_to_yojson x.job) ]

let get_job_request_to_yojson (x : get_job_request) =
  assoc_to_yojson [ ("JobName", Some (name_string_to_yojson x.job_name)) ]

let get_integration_table_properties_response_to_yojson
    (x : get_integration_table_properties_response) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson string512_to_yojson x.resource_arn);
      ("TableName", option_to_yojson string128_to_yojson x.table_name);
      ("SourceTableConfig", option_to_yojson source_table_config_to_yojson x.source_table_config);
      ("TargetTableConfig", option_to_yojson target_table_config_to_yojson x.target_table_config);
    ]

let get_integration_table_properties_request_to_yojson
    (x : get_integration_table_properties_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
      ("TableName", Some (string128_to_yojson x.table_name));
    ]

let get_integration_resource_property_response_to_yojson
    (x : get_integration_resource_property_response) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson string512_to_yojson x.resource_arn);
      ("ResourcePropertyArn", option_to_yojson string512_to_yojson x.resource_property_arn);
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
    ]

let get_integration_resource_property_request_to_yojson
    (x : get_integration_resource_property_request) =
  assoc_to_yojson [ ("ResourceArn", Some (string512_to_yojson x.resource_arn)) ]

let identity_center_instance_arn_to_yojson = string_to_yojson
let application_arn_to_yojson = string_to_yojson

let get_glue_identity_center_configuration_response_to_yojson
    (x : get_glue_identity_center_configuration_response) =
  assoc_to_yojson
    [
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
      ("InstanceArn", option_to_yojson identity_center_instance_arn_to_yojson x.instance_arn);
      ("Scopes", option_to_yojson orchestration_string_list_to_yojson x.scopes);
      ( "UserBackgroundSessionsEnabled",
        option_to_yojson nullable_boolean_to_yojson x.user_background_sessions_enabled );
    ]

let get_glue_identity_center_configuration_request_to_yojson = unit_to_yojson

let get_glossary_term_response_to_yojson (x : get_glossary_term_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson glossary_term_id_to_yojson x.id);
      ("GlossaryId", option_to_yojson glossary_id_to_yojson x.glossary_id);
      ("Name", option_to_yojson glossary_term_name_to_yojson x.name);
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
      ("LongDescription", option_to_yojson glossary_long_description_to_yojson x.long_description);
    ]

let get_glossary_term_request_to_yojson (x : get_glossary_term_request) =
  assoc_to_yojson [ ("Identifier", Some (glossary_term_id_to_yojson x.identifier)) ]

let get_glossary_response_to_yojson (x : get_glossary_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson glossary_id_to_yojson x.id);
      ("Name", option_to_yojson glossary_name_to_yojson x.name);
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
    ]

let get_glossary_request_to_yojson (x : get_glossary_request) =
  assoc_to_yojson [ ("Identifier", Some (glossary_id_to_yojson x.identifier)) ]

let get_form_type_response_to_yojson (x : get_form_type_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson form_type_id_to_yojson x.id);
      ("Name", option_to_yojson form_type_name_to_yojson x.name);
      ("Schema", option_to_yojson form_type_schema_to_yojson x.schema);
    ]

let get_form_type_request_to_yojson (x : get_form_type_request) =
  assoc_to_yojson [ ("Identifier", Some (form_type_id_to_yojson x.identifier)) ]

let record_to_yojson = json_to_yojson
let records_to_yojson tree = list_to_yojson record_to_yojson tree

let get_entity_records_response_to_yojson (x : get_entity_records_response) =
  assoc_to_yojson
    [
      ("Records", option_to_yojson records_to_yojson x.records);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let entity_field_name_to_yojson = string_to_yojson
let selected_fields_to_yojson tree = list_to_yojson entity_field_name_to_yojson tree
let limit_to_yojson = long_to_yojson
let filter_predicate_to_yojson = string_to_yojson
let option_value_to_yojson = string_to_yojson
let option_key_to_yojson = string_to_yojson

let connection_options_to_yojson tree =
  map_to_yojson option_key_to_yojson option_value_to_yojson tree

let get_entity_records_request_to_yojson (x : get_entity_records_request) =
  assoc_to_yojson
    [
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("EntityName", Some (entity_name_to_yojson x.entity_name));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DataStoreApiVersion", option_to_yojson api_version_to_yojson x.data_store_api_version);
      ("ConnectionOptions", option_to_yojson connection_options_to_yojson x.connection_options);
      ("FilterPredicate", option_to_yojson filter_predicate_to_yojson x.filter_predicate);
      ("Limit", Some (limit_to_yojson x.limit));
      ( "OrderBy",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.order_by );
      ("SelectedFields", option_to_yojson selected_fields_to_yojson x.selected_fields);
    ]

let role_arn_to_yojson = string_to_yojson

let dev_endpoint_to_yojson (x : dev_endpoint) =
  assoc_to_yojson
    [
      ("EndpointName", option_to_yojson generic_string_to_yojson x.endpoint_name);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("SecurityGroupIds", option_to_yojson string_list_to_yojson x.security_group_ids);
      ("SubnetId", option_to_yojson generic_string_to_yojson x.subnet_id);
      ("YarnEndpointAddress", option_to_yojson generic_string_to_yojson x.yarn_endpoint_address);
      ("PrivateAddress", option_to_yojson generic_string_to_yojson x.private_address);
      ( "ZeppelinRemoteSparkInterpreterPort",
        option_to_yojson integer_value_to_yojson x.zeppelin_remote_spark_interpreter_port );
      ("PublicAddress", option_to_yojson generic_string_to_yojson x.public_address);
      ("Status", option_to_yojson generic_string_to_yojson x.status);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("NumberOfNodes", option_to_yojson integer_value_to_yojson x.number_of_nodes);
      ("AvailabilityZone", option_to_yojson generic_string_to_yojson x.availability_zone);
      ("VpcId", option_to_yojson generic_string_to_yojson x.vpc_id);
      ( "ExtraPythonLibsS3Path",
        option_to_yojson generic_string_to_yojson x.extra_python_libs_s3_path );
      ("ExtraJarsS3Path", option_to_yojson generic_string_to_yojson x.extra_jars_s3_path);
      ("FailureReason", option_to_yojson generic_string_to_yojson x.failure_reason);
      ("LastUpdateStatus", option_to_yojson generic_string_to_yojson x.last_update_status);
      ("CreatedTimestamp", option_to_yojson timestamp_value_to_yojson x.created_timestamp);
      ("LastModifiedTimestamp", option_to_yojson timestamp_value_to_yojson x.last_modified_timestamp);
      ("PublicKey", option_to_yojson generic_string_to_yojson x.public_key);
      ("PublicKeys", option_to_yojson public_keys_list_to_yojson x.public_keys);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("Arguments", option_to_yojson map_value_to_yojson x.arguments);
    ]

let dev_endpoint_list_to_yojson tree = list_to_yojson dev_endpoint_to_yojson tree

let get_dev_endpoints_response_to_yojson (x : get_dev_endpoints_response) =
  assoc_to_yojson
    [
      ("DevEndpoints", option_to_yojson dev_endpoint_list_to_yojson x.dev_endpoints);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let get_dev_endpoints_request_to_yojson (x : get_dev_endpoints_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let get_dev_endpoint_response_to_yojson (x : get_dev_endpoint_response) =
  assoc_to_yojson [ ("DevEndpoint", option_to_yojson dev_endpoint_to_yojson x.dev_endpoint) ]

let get_dev_endpoint_request_to_yojson (x : get_dev_endpoint_request) =
  assoc_to_yojson [ ("EndpointName", Some (generic_string_to_yojson x.endpoint_name)) ]

let data_quality_result_id_list_to_yojson tree = list_to_yojson hash_string_to_yojson tree

let get_data_quality_ruleset_evaluation_run_response_to_yojson
    (x : get_data_quality_ruleset_evaluation_run_response) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson hash_string_to_yojson x.run_id);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ( "AdditionalRunOptions",
        option_to_yojson data_quality_evaluation_run_additional_run_options_to_yojson
          x.additional_run_options );
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("ErrorString", option_to_yojson generic_string_to_yojson x.error_string);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("ExecutionTime", option_to_yojson execution_time_to_yojson x.execution_time);
      ("RulesetNames", option_to_yojson ruleset_names_to_yojson x.ruleset_names);
      ("ResultIds", option_to_yojson data_quality_result_id_list_to_yojson x.result_ids);
      ("AdditionalDataSources", option_to_yojson data_source_map_to_yojson x.additional_data_sources);
    ]

let get_data_quality_ruleset_evaluation_run_request_to_yojson
    (x : get_data_quality_ruleset_evaluation_run_request) =
  assoc_to_yojson [ ("RunId", Some (hash_string_to_yojson x.run_id)) ]

let get_data_quality_ruleset_response_to_yojson (x : get_data_quality_ruleset_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Ruleset", option_to_yojson data_quality_ruleset_string_to_yojson x.ruleset);
      ("TargetTable", option_to_yojson data_quality_target_table_to_yojson x.target_table);
      ("CreatedOn", option_to_yojson timestamp_to_yojson x.created_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("RecommendationRunId", option_to_yojson hash_string_to_yojson x.recommendation_run_id);
      ( "DataQualitySecurityConfiguration",
        option_to_yojson name_string_to_yojson x.data_quality_security_configuration );
    ]

let get_data_quality_ruleset_request_to_yojson (x : get_data_quality_ruleset_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let get_data_quality_rule_recommendation_run_response_to_yojson
    (x : get_data_quality_rule_recommendation_run_response) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson hash_string_to_yojson x.run_id);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("ErrorString", option_to_yojson generic_string_to_yojson x.error_string);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("ExecutionTime", option_to_yojson execution_time_to_yojson x.execution_time);
      ( "RecommendedRuleset",
        option_to_yojson data_quality_ruleset_string_to_yojson x.recommended_ruleset );
      ("CreatedRulesetName", option_to_yojson name_string_to_yojson x.created_ruleset_name);
      ( "DataQualitySecurityConfiguration",
        option_to_yojson name_string_to_yojson x.data_quality_security_configuration );
    ]

let get_data_quality_rule_recommendation_run_request_to_yojson
    (x : get_data_quality_rule_recommendation_run_request) =
  assoc_to_yojson [ ("RunId", Some (hash_string_to_yojson x.run_id)) ]

let data_quality_aggregated_metrics_to_yojson (x : data_quality_aggregated_metrics) =
  assoc_to_yojson
    [
      ("TotalRowsProcessed", option_to_yojson nullable_double_to_yojson x.total_rows_processed);
      ("TotalRowsPassed", option_to_yojson nullable_double_to_yojson x.total_rows_passed);
      ("TotalRowsFailed", option_to_yojson nullable_double_to_yojson x.total_rows_failed);
      ("TotalRulesProcessed", option_to_yojson nullable_double_to_yojson x.total_rules_processed);
      ("TotalRulesPassed", option_to_yojson nullable_double_to_yojson x.total_rules_passed);
      ("TotalRulesFailed", option_to_yojson nullable_double_to_yojson x.total_rules_failed);
    ]

let new_rules_to_yojson tree = list_to_yojson name_string_to_yojson tree

let data_quality_metric_values_to_yojson (x : data_quality_metric_values) =
  assoc_to_yojson
    [
      ("ActualValue", option_to_yojson nullable_double_to_yojson x.actual_value);
      ("ExpectedValue", option_to_yojson nullable_double_to_yojson x.expected_value);
      ("LowerLimit", option_to_yojson nullable_double_to_yojson x.lower_limit);
      ("UpperLimit", option_to_yojson nullable_double_to_yojson x.upper_limit);
    ]

let metric_based_observation_to_yojson (x : metric_based_observation) =
  assoc_to_yojson
    [
      ("MetricName", option_to_yojson name_string_to_yojson x.metric_name);
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ("MetricValues", option_to_yojson data_quality_metric_values_to_yojson x.metric_values);
      ("NewRules", option_to_yojson new_rules_to_yojson x.new_rules);
    ]

let data_quality_observation_description_to_yojson = string_to_yojson

let data_quality_observation_to_yojson (x : data_quality_observation) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson data_quality_observation_description_to_yojson x.description);
      ( "MetricBasedObservation",
        option_to_yojson metric_based_observation_to_yojson x.metric_based_observation );
    ]

let data_quality_observations_to_yojson tree =
  list_to_yojson data_quality_observation_to_yojson tree

let evaluated_metrics_map_to_yojson tree =
  map_to_yojson name_string_to_yojson nullable_double_to_yojson tree

let data_quality_rule_result_description_to_yojson = string_to_yojson

let data_quality_analyzer_result_to_yojson (x : data_quality_analyzer_result) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson data_quality_rule_result_description_to_yojson x.description);
      ( "EvaluationMessage",
        option_to_yojson data_quality_rule_result_description_to_yojson x.evaluation_message );
      ("EvaluatedMetrics", option_to_yojson evaluated_metrics_map_to_yojson x.evaluated_metrics);
    ]

let data_quality_analyzer_results_to_yojson tree =
  list_to_yojson data_quality_analyzer_result_to_yojson tree

let labels_to_yojson tree = map_to_yojson name_string_to_yojson name_string_to_yojson tree

let rule_metrics_map_to_yojson tree =
  map_to_yojson name_string_to_yojson nullable_double_to_yojson tree

let data_quality_rule_result_status_to_yojson (x : data_quality_rule_result_status) =
  match x with PASS -> `String "PASS" | FAIL -> `String "FAIL" | ERROR -> `String "ERROR"

let data_quality_rule_result_to_yojson (x : data_quality_rule_result) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson data_quality_rule_result_description_to_yojson x.description);
      ( "EvaluationMessage",
        option_to_yojson data_quality_rule_result_description_to_yojson x.evaluation_message );
      ("Result", option_to_yojson data_quality_rule_result_status_to_yojson x.result_);
      ("EvaluatedMetrics", option_to_yojson evaluated_metrics_map_to_yojson x.evaluated_metrics);
      ( "EvaluatedRule",
        option_to_yojson data_quality_rule_result_description_to_yojson x.evaluated_rule );
      ("RuleMetrics", option_to_yojson rule_metrics_map_to_yojson x.rule_metrics);
      ("Labels", option_to_yojson labels_to_yojson x.labels);
    ]

let data_quality_rule_results_to_yojson tree =
  list_to_yojson data_quality_rule_result_to_yojson tree

let get_data_quality_result_response_to_yojson (x : get_data_quality_result_response) =
  assoc_to_yojson
    [
      ("ResultId", option_to_yojson hash_string_to_yojson x.result_id);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("Score", option_to_yojson generic_bounded_double_to_yojson x.score);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("RulesetName", option_to_yojson name_string_to_yojson x.ruleset_name);
      ("EvaluationContext", option_to_yojson generic_string_to_yojson x.evaluation_context);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
      ("RulesetEvaluationRunId", option_to_yojson hash_string_to_yojson x.ruleset_evaluation_run_id);
      ("RuleResults", option_to_yojson data_quality_rule_results_to_yojson x.rule_results);
      ( "AnalyzerResults",
        option_to_yojson data_quality_analyzer_results_to_yojson x.analyzer_results );
      ("Observations", option_to_yojson data_quality_observations_to_yojson x.observations);
      ( "AggregatedMetrics",
        option_to_yojson data_quality_aggregated_metrics_to_yojson x.aggregated_metrics );
    ]

let get_data_quality_result_request_to_yojson (x : get_data_quality_result_request) =
  assoc_to_yojson [ ("ResultId", Some (hash_string_to_yojson x.result_id)) ]

let statistic_model_result_to_yojson (x : statistic_model_result) =
  assoc_to_yojson
    [
      ("LowerBound", option_to_yojson nullable_double_to_yojson x.lower_bound);
      ("UpperBound", option_to_yojson nullable_double_to_yojson x.upper_bound);
      ("PredictedValue", option_to_yojson nullable_double_to_yojson x.predicted_value);
      ("ActualValue", option_to_yojson nullable_double_to_yojson x.actual_value);
      ("Date", option_to_yojson timestamp_to_yojson x.date);
      ( "InclusionAnnotation",
        option_to_yojson inclusion_annotation_value_to_yojson x.inclusion_annotation );
    ]

let statistic_model_results_to_yojson tree = list_to_yojson statistic_model_result_to_yojson tree

let get_data_quality_model_result_response_to_yojson (x : get_data_quality_model_result_response) =
  assoc_to_yojson
    [
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("Model", option_to_yojson statistic_model_results_to_yojson x.model);
    ]

let get_data_quality_model_result_request_to_yojson (x : get_data_quality_model_result_request) =
  assoc_to_yojson
    [
      ("StatisticId", Some (hash_string_to_yojson x.statistic_id));
      ("ProfileId", Some (hash_string_to_yojson x.profile_id));
    ]

let data_quality_model_status_to_yojson (x : data_quality_model_status) =
  match x with
  | RUNNING -> `String "RUNNING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let get_data_quality_model_response_to_yojson (x : get_data_quality_model_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson data_quality_model_status_to_yojson x.status);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("FailureReason", option_to_yojson hash_string_to_yojson x.failure_reason);
    ]

let get_data_quality_model_request_to_yojson (x : get_data_quality_model_request) =
  assoc_to_yojson
    [
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ("ProfileId", Some (hash_string_to_yojson x.profile_id));
    ]

let code_gen_identifier_to_yojson = string_to_yojson

let code_gen_edge_to_yojson (x : code_gen_edge) =
  assoc_to_yojson
    [
      ("Source", Some (code_gen_identifier_to_yojson x.source));
      ("Target", Some (code_gen_identifier_to_yojson x.target));
      ("TargetParameter", option_to_yojson code_gen_arg_name_to_yojson x.target_parameter);
    ]

let dag_edges_to_yojson tree = list_to_yojson code_gen_edge_to_yojson tree
let code_gen_node_type_to_yojson = string_to_yojson

let code_gen_node_to_yojson (x : code_gen_node) =
  assoc_to_yojson
    [
      ("Id", Some (code_gen_identifier_to_yojson x.id));
      ("NodeType", Some (code_gen_node_type_to_yojson x.node_type));
      ("Args", Some (code_gen_node_args_to_yojson x.args));
      ("LineNumber", option_to_yojson integer_to_yojson x.line_number);
    ]

let dag_nodes_to_yojson tree = list_to_yojson code_gen_node_to_yojson tree

let get_dataflow_graph_response_to_yojson (x : get_dataflow_graph_response) =
  assoc_to_yojson
    [
      ("DagNodes", option_to_yojson dag_nodes_to_yojson x.dag_nodes);
      ("DagEdges", option_to_yojson dag_edges_to_yojson x.dag_edges);
    ]

let get_dataflow_graph_request_to_yojson (x : get_dataflow_graph_request) =
  assoc_to_yojson [ ("PythonScript", option_to_yojson python_script_to_yojson x.python_script) ]

let get_data_catalog_encryption_settings_response_to_yojson
    (x : get_data_catalog_encryption_settings_response) =
  assoc_to_yojson
    [
      ( "DataCatalogEncryptionSettings",
        option_to_yojson data_catalog_encryption_settings_to_yojson
          x.data_catalog_encryption_settings );
    ]

let get_data_catalog_encryption_settings_request_to_yojson
    (x : get_data_catalog_encryption_settings_request) =
  assoc_to_yojson [ ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id) ]

let database_to_yojson (x : database) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("LocationUri", option_to_yojson ur_i_to_yojson x.location_uri);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ( "CreateTableDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_table_default_permissions );
      ("TargetDatabase", option_to_yojson database_identifier_to_yojson x.target_database);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("FederatedDatabase", option_to_yojson federated_database_to_yojson x.federated_database);
    ]

let database_list_to_yojson tree = list_to_yojson database_to_yojson tree

let get_databases_response_to_yojson (x : get_databases_response) =
  assoc_to_yojson
    [
      ("DatabaseList", Some (database_list_to_yojson x.database_list));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let database_attributes_to_yojson (x : database_attributes) =
  match x with NAME -> `String "NAME" | TARGET_DATABASE -> `String "TARGET_DATABASE"

let database_attributes_list_to_yojson tree = list_to_yojson database_attributes_to_yojson tree

let get_databases_request_to_yojson (x : get_databases_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson catalog_getter_page_size_to_yojson x.max_results);
      ("ResourceShareType", option_to_yojson resource_share_type_to_yojson x.resource_share_type);
      ("AttributesToGet", option_to_yojson database_attributes_list_to_yojson x.attributes_to_get);
    ]

let get_database_response_to_yojson (x : get_database_response) =
  assoc_to_yojson [ ("Database", option_to_yojson database_to_yojson x.database) ]

let get_database_request_to_yojson (x : get_database_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let sensitive_url_to_yojson = string_to_yojson

let get_dashboard_url_response_to_yojson (x : get_dashboard_url_response) =
  assoc_to_yojson [ ("Url", Some (sensitive_url_to_yojson x.url)) ]

let glue_resource_type_to_yojson (x : glue_resource_type) =
  match x with JOB -> `String "JOB" | SESSION -> `String "SESSION"

let get_dashboard_url_request_to_yojson (x : get_dashboard_url_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (name_string_to_yojson x.resource_id));
      ("ResourceType", Some (glue_resource_type_to_yojson x.resource_type));
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
    ]

let get_custom_entity_type_response_to_yojson (x : get_custom_entity_type_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("RegexString", option_to_yojson name_string_to_yojson x.regex_string);
      ("ContextWords", option_to_yojson context_words_to_yojson x.context_words);
    ]

let get_custom_entity_type_request_to_yojson (x : get_custom_entity_type_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let version_id_to_yojson = long_to_yojson

let last_crawl_status_to_yojson (x : last_crawl_status) =
  match x with
  | SUCCEEDED -> `String "SUCCEEDED"
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"

let last_crawl_info_to_yojson (x : last_crawl_info) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson last_crawl_status_to_yojson x.status);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("LogGroup", option_to_yojson log_group_to_yojson x.log_group);
      ("LogStream", option_to_yojson log_stream_to_yojson x.log_stream);
      ("MessagePrefix", option_to_yojson message_prefix_to_yojson x.message_prefix);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
    ]

let milliseconds_count_to_yojson = long_to_yojson

let schedule_state_to_yojson (x : schedule_state) =
  match x with
  | SCHEDULED -> `String "SCHEDULED"
  | NOT_SCHEDULED -> `String "NOT_SCHEDULED"
  | TRANSITIONING -> `String "TRANSITIONING"

let schedule_to_yojson (x : schedule) =
  assoc_to_yojson
    [
      ("ScheduleExpression", option_to_yojson cron_expression_to_yojson x.schedule_expression);
      ("State", option_to_yojson schedule_state_to_yojson x.state);
    ]

let crawler_state_to_yojson (x : crawler_state) =
  match x with
  | READY -> `String "READY"
  | RUNNING -> `String "RUNNING"
  | STOPPING -> `String "STOPPING"

let crawler_to_yojson (x : crawler) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("Targets", option_to_yojson crawler_targets_to_yojson x.targets);
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Classifiers", option_to_yojson classifier_name_list_to_yojson x.classifiers);
      ("RecrawlPolicy", option_to_yojson recrawl_policy_to_yojson x.recrawl_policy);
      ("SchemaChangePolicy", option_to_yojson schema_change_policy_to_yojson x.schema_change_policy);
      ( "LineageConfiguration",
        option_to_yojson lineage_configuration_to_yojson x.lineage_configuration );
      ("State", option_to_yojson crawler_state_to_yojson x.state);
      ("TablePrefix", option_to_yojson table_prefix_to_yojson x.table_prefix);
      ("Schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("CrawlElapsedTime", option_to_yojson milliseconds_count_to_yojson x.crawl_elapsed_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("LastCrawl", option_to_yojson last_crawl_info_to_yojson x.last_crawl);
      ("Version", option_to_yojson version_id_to_yojson x.version);
      ("Configuration", option_to_yojson crawler_configuration_to_yojson x.configuration);
      ( "CrawlerSecurityConfiguration",
        option_to_yojson crawler_security_configuration_to_yojson x.crawler_security_configuration
      );
      ( "LakeFormationConfiguration",
        option_to_yojson lake_formation_configuration_to_yojson x.lake_formation_configuration );
    ]

let crawler_list_to_yojson tree = list_to_yojson crawler_to_yojson tree

let get_crawlers_response_to_yojson (x : get_crawlers_response) =
  assoc_to_yojson
    [
      ("Crawlers", option_to_yojson crawler_list_to_yojson x.crawlers);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_crawlers_request_to_yojson (x : get_crawlers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let crawler_metrics_to_yojson (x : crawler_metrics) =
  assoc_to_yojson
    [
      ("CrawlerName", option_to_yojson name_string_to_yojson x.crawler_name);
      ("TimeLeftSeconds", option_to_yojson non_negative_double_to_yojson x.time_left_seconds);
      ("StillEstimating", option_to_yojson boolean__to_yojson x.still_estimating);
      ("LastRuntimeSeconds", option_to_yojson non_negative_double_to_yojson x.last_runtime_seconds);
      ( "MedianRuntimeSeconds",
        option_to_yojson non_negative_double_to_yojson x.median_runtime_seconds );
      ("TablesCreated", option_to_yojson non_negative_integer_to_yojson x.tables_created);
      ("TablesUpdated", option_to_yojson non_negative_integer_to_yojson x.tables_updated);
      ("TablesDeleted", option_to_yojson non_negative_integer_to_yojson x.tables_deleted);
    ]

let crawler_metrics_list_to_yojson tree = list_to_yojson crawler_metrics_to_yojson tree

let get_crawler_metrics_response_to_yojson (x : get_crawler_metrics_response) =
  assoc_to_yojson
    [
      ("CrawlerMetricsList", option_to_yojson crawler_metrics_list_to_yojson x.crawler_metrics_list);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_crawler_metrics_request_to_yojson (x : get_crawler_metrics_request) =
  assoc_to_yojson
    [
      ("CrawlerNameList", option_to_yojson crawler_name_list_to_yojson x.crawler_name_list);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_crawler_response_to_yojson (x : get_crawler_response) =
  assoc_to_yojson [ ("Crawler", option_to_yojson crawler_to_yojson x.crawler) ]

let get_crawler_request_to_yojson (x : get_crawler_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let connection_schema_version_to_yojson = int_to_yojson

let o_auth2_properties_to_yojson (x : o_auth2_properties) =
  assoc_to_yojson
    [
      ("OAuth2GrantType", option_to_yojson o_auth2_grant_type_to_yojson x.o_auth2_grant_type);
      ( "OAuth2ClientApplication",
        option_to_yojson o_auth2_client_application_to_yojson x.o_auth2_client_application );
      ("TokenUrl", option_to_yojson token_url_to_yojson x.token_url);
      ( "TokenUrlParametersMap",
        option_to_yojson token_url_parameters_map_to_yojson x.token_url_parameters_map );
    ]

let authentication_configuration_to_yojson (x : authentication_configuration) =
  assoc_to_yojson
    [
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("OAuth2Properties", option_to_yojson o_auth2_properties_to_yojson x.o_auth2_properties);
    ]

let long_value_string_to_yojson = string_to_yojson

let connection_status_to_yojson (x : connection_status) =
  match x with
  | READY -> `String "READY"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("MatchCriteria", option_to_yojson match_criteria_to_yojson x.match_criteria);
      ( "ConnectionProperties",
        option_to_yojson connection_properties_to_yojson x.connection_properties );
      ("SparkProperties", option_to_yojson property_map_to_yojson x.spark_properties);
      ("AthenaProperties", option_to_yojson property_map_to_yojson x.athena_properties);
      ("PythonProperties", option_to_yojson property_map_to_yojson x.python_properties);
      ( "PhysicalConnectionRequirements",
        option_to_yojson physical_connection_requirements_to_yojson
          x.physical_connection_requirements );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("LastUpdatedBy", option_to_yojson name_string_to_yojson x.last_updated_by);
      ("Status", option_to_yojson connection_status_to_yojson x.status);
      ("StatusReason", option_to_yojson long_value_string_to_yojson x.status_reason);
      ( "LastConnectionValidationTime",
        option_to_yojson timestamp_to_yojson x.last_connection_validation_time );
      ( "AuthenticationConfiguration",
        option_to_yojson authentication_configuration_to_yojson x.authentication_configuration );
      ( "ConnectionSchemaVersion",
        option_to_yojson connection_schema_version_to_yojson x.connection_schema_version );
      ( "CompatibleComputeEnvironments",
        option_to_yojson compute_environment_list_to_yojson x.compatible_compute_environments );
    ]

let connection_list_to_yojson tree = list_to_yojson connection_to_yojson tree

let get_connections_response_to_yojson (x : get_connections_response) =
  assoc_to_yojson
    [
      ("ConnectionList", option_to_yojson connection_list_to_yojson x.connection_list);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_connections_filter_to_yojson (x : get_connections_filter) =
  assoc_to_yojson
    [
      ("MatchCriteria", option_to_yojson match_criteria_to_yojson x.match_criteria);
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ( "ConnectionSchemaVersion",
        option_to_yojson connection_schema_version_to_yojson x.connection_schema_version );
    ]

let get_connections_request_to_yojson (x : get_connections_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("Filter", option_to_yojson get_connections_filter_to_yojson x.filter);
      ("HidePassword", option_to_yojson boolean__to_yojson x.hide_password);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let get_connection_response_to_yojson (x : get_connection_response) =
  assoc_to_yojson [ ("Connection", option_to_yojson connection_to_yojson x.connection) ]

let get_connection_request_to_yojson (x : get_connection_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("Name", Some (name_string_to_yojson x.name));
      ("HidePassword", option_to_yojson boolean__to_yojson x.hide_password);
      ( "ApplyOverrideForComputeEnvironment",
        option_to_yojson compute_environment_to_yojson x.apply_override_for_compute_environment );
    ]

let execution_status_to_yojson (x : execution_status) =
  match x with FAILED -> `String "FAILED" | STARTED -> `String "STARTED"

let execution_attempt_to_yojson (x : execution_attempt) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson execution_status_to_yojson x.status);
      ( "ColumnStatisticsTaskRunId",
        option_to_yojson hash_string_to_yojson x.column_statistics_task_run_id );
      ("ExecutionTimestamp", option_to_yojson timestamp_to_yojson x.execution_timestamp);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
    ]

let setting_source_to_yojson (x : setting_source) =
  match x with CATALOG -> `String "CATALOG" | TABLE -> `String "TABLE"

let schedule_type_to_yojson (x : schedule_type) =
  match x with CRON -> `String "CRON" | AUTO -> `String "AUTO"

let column_statistics_task_settings_to_yojson (x : column_statistics_task_settings) =
  assoc_to_yojson
    [
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("Schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("ColumnNameList", option_to_yojson column_name_list_to_yojson x.column_name_list);
      ("CatalogID", option_to_yojson catalog_id_string_to_yojson x.catalog_i_d);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("SampleSize", option_to_yojson sample_size_percentage_to_yojson x.sample_size);
      ( "SecurityConfiguration",
        option_to_yojson crawler_security_configuration_to_yojson x.security_configuration );
      ("ScheduleType", option_to_yojson schedule_type_to_yojson x.schedule_type);
      ("SettingSource", option_to_yojson setting_source_to_yojson x.setting_source);
      ("LastExecutionAttempt", option_to_yojson execution_attempt_to_yojson x.last_execution_attempt);
    ]

let get_column_statistics_task_settings_response_to_yojson
    (x : get_column_statistics_task_settings_response) =
  assoc_to_yojson
    [
      ( "ColumnStatisticsTaskSettings",
        option_to_yojson column_statistics_task_settings_to_yojson x.column_statistics_task_settings
      );
    ]

let get_column_statistics_task_settings_request_to_yojson
    (x : get_column_statistics_task_settings_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
    ]

let column_statistics_state_to_yojson (x : column_statistics_state) =
  match x with
  | STARTING -> `String "STARTING"
  | RUNNING -> `String "RUNNING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | STOPPED -> `String "STOPPED"

let computation_type_to_yojson (x : computation_type) =
  match x with FULL -> `String "FULL" | INCREMENTAL -> `String "INCREMENTAL"

let positive_integer_to_yojson = int_to_yojson

let column_statistics_task_run_to_yojson (x : column_statistics_task_run) =
  assoc_to_yojson
    [
      ("CustomerId", option_to_yojson account_id_to_yojson x.customer_id);
      ( "ColumnStatisticsTaskRunId",
        option_to_yojson hash_string_to_yojson x.column_statistics_task_run_id );
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("ColumnNameList", option_to_yojson column_name_list_to_yojson x.column_name_list);
      ("CatalogID", option_to_yojson catalog_id_string_to_yojson x.catalog_i_d);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("SampleSize", option_to_yojson sample_size_percentage_to_yojson x.sample_size);
      ( "SecurityConfiguration",
        option_to_yojson crawler_security_configuration_to_yojson x.security_configuration );
      ("NumberOfWorkers", option_to_yojson positive_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson name_string_to_yojson x.worker_type);
      ("ComputationType", option_to_yojson computation_type_to_yojson x.computation_type);
      ("Status", option_to_yojson column_statistics_state_to_yojson x.status);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("DPUSeconds", option_to_yojson non_negative_double_to_yojson x.dpu_seconds);
    ]

let column_statistics_task_runs_list_to_yojson tree =
  list_to_yojson column_statistics_task_run_to_yojson tree

let get_column_statistics_task_runs_response_to_yojson
    (x : get_column_statistics_task_runs_response) =
  assoc_to_yojson
    [
      ( "ColumnStatisticsTaskRuns",
        option_to_yojson column_statistics_task_runs_list_to_yojson x.column_statistics_task_runs );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_column_statistics_task_runs_request_to_yojson (x : get_column_statistics_task_runs_request)
    =
  assoc_to_yojson
    [
      ("DatabaseName", Some (database_name_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_column_statistics_task_run_response_to_yojson (x : get_column_statistics_task_run_response)
    =
  assoc_to_yojson
    [
      ( "ColumnStatisticsTaskRun",
        option_to_yojson column_statistics_task_run_to_yojson x.column_statistics_task_run );
    ]

let get_column_statistics_task_run_request_to_yojson (x : get_column_statistics_task_run_request) =
  assoc_to_yojson
    [ ("ColumnStatisticsTaskRunId", Some (hash_string_to_yojson x.column_statistics_task_run_id)) ]

let column_error_to_yojson (x : column_error) =
  assoc_to_yojson
    [
      ("ColumnName", option_to_yojson name_string_to_yojson x.column_name);
      ("Error", option_to_yojson error_detail_to_yojson x.error);
    ]

let column_errors_to_yojson tree = list_to_yojson column_error_to_yojson tree
let column_statistics_list_to_yojson tree = list_to_yojson column_statistics_to_yojson tree

let get_column_statistics_for_table_response_to_yojson
    (x : get_column_statistics_for_table_response) =
  assoc_to_yojson
    [
      ( "ColumnStatisticsList",
        option_to_yojson column_statistics_list_to_yojson x.column_statistics_list );
      ("Errors", option_to_yojson column_errors_to_yojson x.errors);
    ]

let get_column_names_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let get_column_statistics_for_table_request_to_yojson (x : get_column_statistics_for_table_request)
    =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("ColumnNames", Some (get_column_names_list_to_yojson x.column_names));
    ]

let get_column_statistics_for_partition_response_to_yojson
    (x : get_column_statistics_for_partition_response) =
  assoc_to_yojson
    [
      ( "ColumnStatisticsList",
        option_to_yojson column_statistics_list_to_yojson x.column_statistics_list );
      ("Errors", option_to_yojson column_errors_to_yojson x.errors);
    ]

let get_column_statistics_for_partition_request_to_yojson
    (x : get_column_statistics_for_partition_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
      ("ColumnNames", Some (get_column_names_list_to_yojson x.column_names));
    ]

let csv_classifier_to_yojson (x : csv_classifier) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("Version", option_to_yojson version_id_to_yojson x.version);
      ("Delimiter", option_to_yojson csv_column_delimiter_to_yojson x.delimiter);
      ("QuoteSymbol", option_to_yojson csv_quote_symbol_to_yojson x.quote_symbol);
      ("ContainsHeader", option_to_yojson csv_header_option_to_yojson x.contains_header);
      ("Header", option_to_yojson csv_header_to_yojson x.header);
      ("DisableValueTrimming", option_to_yojson nullable_boolean_to_yojson x.disable_value_trimming);
      ("AllowSingleColumn", option_to_yojson nullable_boolean_to_yojson x.allow_single_column);
      ( "CustomDatatypeConfigured",
        option_to_yojson nullable_boolean_to_yojson x.custom_datatype_configured );
      ("CustomDatatypes", option_to_yojson custom_datatypes_to_yojson x.custom_datatypes);
      ("Serde", option_to_yojson csv_serde_option_to_yojson x.serde);
    ]

let json_classifier_to_yojson (x : json_classifier) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("Version", option_to_yojson version_id_to_yojson x.version);
      ("JsonPath", Some (json_path_to_yojson x.json_path));
    ]

let xml_classifier_to_yojson (x : xml_classifier) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Classification", Some (classification_to_yojson x.classification));
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("Version", option_to_yojson version_id_to_yojson x.version);
      ("RowTag", option_to_yojson row_tag_to_yojson x.row_tag);
    ]

let grok_classifier_to_yojson (x : grok_classifier) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Classification", Some (classification_to_yojson x.classification));
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("Version", option_to_yojson version_id_to_yojson x.version);
      ("GrokPattern", Some (grok_pattern_to_yojson x.grok_pattern));
      ("CustomPatterns", option_to_yojson custom_patterns_to_yojson x.custom_patterns);
    ]

let classifier_to_yojson (x : classifier) =
  assoc_to_yojson
    [
      ("GrokClassifier", option_to_yojson grok_classifier_to_yojson x.grok_classifier);
      ("XMLClassifier", option_to_yojson xml_classifier_to_yojson x.xml_classifier);
      ("JsonClassifier", option_to_yojson json_classifier_to_yojson x.json_classifier);
      ("CsvClassifier", option_to_yojson csv_classifier_to_yojson x.csv_classifier);
    ]

let classifier_list_to_yojson tree = list_to_yojson classifier_to_yojson tree

let get_classifiers_response_to_yojson (x : get_classifiers_response) =
  assoc_to_yojson
    [
      ("Classifiers", option_to_yojson classifier_list_to_yojson x.classifiers);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_classifiers_request_to_yojson (x : get_classifiers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_classifier_response_to_yojson (x : get_classifier_response) =
  assoc_to_yojson [ ("Classifier", option_to_yojson classifier_to_yojson x.classifier) ]

let get_classifier_request_to_yojson (x : get_classifier_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let iceberg_optimization_properties_output_to_yojson (x : iceberg_optimization_properties_output) =
  assoc_to_yojson
    [
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("Compaction", option_to_yojson parameters_map_to_yojson x.compaction);
      ("Retention", option_to_yojson parameters_map_to_yojson x.retention);
      ("OrphanFileDeletion", option_to_yojson parameters_map_to_yojson x.orphan_file_deletion);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
    ]

let data_lake_access_properties_output_to_yojson (x : data_lake_access_properties_output) =
  assoc_to_yojson
    [
      ("DataLakeAccess", option_to_yojson boolean__to_yojson x.data_lake_access);
      ("DataTransferRole", option_to_yojson iam_role_arn_to_yojson x.data_transfer_role);
      ("KmsKey", option_to_yojson resource_arn_string_to_yojson x.kms_key);
      ("ManagedWorkgroupName", option_to_yojson name_string_to_yojson x.managed_workgroup_name);
      ("ManagedWorkgroupStatus", option_to_yojson name_string_to_yojson x.managed_workgroup_status);
      ("RedshiftDatabaseName", option_to_yojson name_string_to_yojson x.redshift_database_name);
      ("StatusMessage", option_to_yojson name_string_to_yojson x.status_message);
      ("CatalogType", option_to_yojson name_string_to_yojson x.catalog_type);
    ]

let catalog_properties_output_to_yojson (x : catalog_properties_output) =
  assoc_to_yojson
    [
      ( "DataLakeAccessProperties",
        option_to_yojson data_lake_access_properties_output_to_yojson x.data_lake_access_properties
      );
      ( "IcebergOptimizationProperties",
        option_to_yojson iceberg_optimization_properties_output_to_yojson
          x.iceberg_optimization_properties );
      ("CustomProperties", option_to_yojson parameters_map_to_yojson x.custom_properties);
    ]

let catalog_name_string_to_yojson = string_to_yojson

let catalog_to_yojson (x : catalog) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("Name", Some (catalog_name_string_to_yojson x.name));
      ("ResourceArn", option_to_yojson resource_arn_string_to_yojson x.resource_arn);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
      ( "TargetRedshiftCatalog",
        option_to_yojson target_redshift_catalog_to_yojson x.target_redshift_catalog );
      ("FederatedCatalog", option_to_yojson federated_catalog_to_yojson x.federated_catalog);
      ( "CatalogProperties",
        option_to_yojson catalog_properties_output_to_yojson x.catalog_properties );
      ( "CreateTableDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_table_default_permissions );
      ( "CreateDatabaseDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_database_default_permissions
      );
      ( "AllowFullTableExternalDataAccess",
        option_to_yojson allow_full_table_external_data_access_enum_to_yojson
          x.allow_full_table_external_data_access );
    ]

let catalog_list_to_yojson tree = list_to_yojson catalog_to_yojson tree

let get_catalogs_response_to_yojson (x : get_catalogs_response) =
  assoc_to_yojson
    [
      ("CatalogList", Some (catalog_list_to_yojson x.catalog_list));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_catalogs_request_to_yojson (x : get_catalogs_request) =
  assoc_to_yojson
    [
      ("ParentCatalogId", option_to_yojson catalog_id_string_to_yojson x.parent_catalog_id);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Recursive", option_to_yojson boolean__to_yojson x.recursive);
      ("IncludeRoot", option_to_yojson nullable_boolean_to_yojson x.include_root);
      ("HasDatabases", option_to_yojson nullable_boolean_to_yojson x.has_databases);
    ]

let catalog_import_status_to_yojson (x : catalog_import_status) =
  assoc_to_yojson
    [
      ("ImportCompleted", option_to_yojson boolean__to_yojson x.import_completed);
      ("ImportTime", option_to_yojson timestamp_to_yojson x.import_time);
      ("ImportedBy", option_to_yojson name_string_to_yojson x.imported_by);
    ]

let get_catalog_import_status_response_to_yojson (x : get_catalog_import_status_response) =
  assoc_to_yojson
    [ ("ImportStatus", option_to_yojson catalog_import_status_to_yojson x.import_status) ]

let get_catalog_import_status_request_to_yojson (x : get_catalog_import_status_request) =
  assoc_to_yojson [ ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id) ]

let get_catalog_response_to_yojson (x : get_catalog_response) =
  assoc_to_yojson [ ("Catalog", option_to_yojson catalog_to_yojson x.catalog) ]

let get_catalog_request_to_yojson (x : get_catalog_request) =
  assoc_to_yojson [ ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id)) ]

let blueprint_run_state_to_yojson (x : blueprint_run_state) =
  match x with
  | RUNNING -> `String "RUNNING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | ROLLING_BACK -> `String "ROLLING_BACK"

let blueprint_run_to_yojson (x : blueprint_run) =
  assoc_to_yojson
    [
      ("BlueprintName", option_to_yojson orchestration_name_string_to_yojson x.blueprint_name);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("WorkflowName", option_to_yojson name_string_to_yojson x.workflow_name);
      ("State", option_to_yojson blueprint_run_state_to_yojson x.state);
      ("StartedOn", option_to_yojson timestamp_value_to_yojson x.started_on);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("ErrorMessage", option_to_yojson message_string_to_yojson x.error_message);
      ("RollbackErrorMessage", option_to_yojson message_string_to_yojson x.rollback_error_message);
      ("Parameters", option_to_yojson blueprint_parameters_to_yojson x.parameters);
      ("RoleArn", option_to_yojson orchestration_iam_role_arn_to_yojson x.role_arn);
    ]

let blueprint_runs_to_yojson tree = list_to_yojson blueprint_run_to_yojson tree

let get_blueprint_runs_response_to_yojson (x : get_blueprint_runs_response) =
  assoc_to_yojson
    [
      ("BlueprintRuns", option_to_yojson blueprint_runs_to_yojson x.blueprint_runs);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let get_blueprint_runs_request_to_yojson (x : get_blueprint_runs_request) =
  assoc_to_yojson
    [
      ("BlueprintName", Some (name_string_to_yojson x.blueprint_name));
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let get_blueprint_run_response_to_yojson (x : get_blueprint_run_response) =
  assoc_to_yojson [ ("BlueprintRun", option_to_yojson blueprint_run_to_yojson x.blueprint_run) ]

let get_blueprint_run_request_to_yojson (x : get_blueprint_run_request) =
  assoc_to_yojson
    [
      ("BlueprintName", Some (orchestration_name_string_to_yojson x.blueprint_name));
      ("RunId", Some (id_string_to_yojson x.run_id));
    ]

let blueprint_parameter_spec_to_yojson = string_to_yojson

let last_active_definition_to_yojson (x : last_active_definition) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson generic512_char_string_to_yojson x.description);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("ParameterSpec", option_to_yojson blueprint_parameter_spec_to_yojson x.parameter_spec);
      ("BlueprintLocation", option_to_yojson generic_string_to_yojson x.blueprint_location);
      ( "BlueprintServiceLocation",
        option_to_yojson generic_string_to_yojson x.blueprint_service_location );
    ]

let blueprint_status_to_yojson (x : blueprint_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | FAILED -> `String "FAILED"

let blueprint_to_yojson (x : blueprint) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson orchestration_name_string_to_yojson x.name);
      ("Description", option_to_yojson generic512_char_string_to_yojson x.description);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("ParameterSpec", option_to_yojson blueprint_parameter_spec_to_yojson x.parameter_spec);
      ("BlueprintLocation", option_to_yojson generic_string_to_yojson x.blueprint_location);
      ( "BlueprintServiceLocation",
        option_to_yojson generic_string_to_yojson x.blueprint_service_location );
      ("Status", option_to_yojson blueprint_status_to_yojson x.status);
      ("ErrorMessage", option_to_yojson error_string_to_yojson x.error_message);
      ( "LastActiveDefinition",
        option_to_yojson last_active_definition_to_yojson x.last_active_definition );
    ]

let get_blueprint_response_to_yojson (x : get_blueprint_response) =
  assoc_to_yojson [ ("Blueprint", option_to_yojson blueprint_to_yojson x.blueprint) ]

let get_blueprint_request_to_yojson (x : get_blueprint_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("IncludeBlueprint", option_to_yojson nullable_boolean_to_yojson x.include_blueprint);
      ("IncludeParameterSpec", option_to_yojson nullable_boolean_to_yojson x.include_parameter_spec);
    ]

let get_asset_type_response_to_yojson (x : get_asset_type_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson asset_type_id_to_yojson x.id);
      ("Name", option_to_yojson asset_type_name_to_yojson x.name);
      ("Forms", option_to_yojson asset_type_forms_map_to_yojson x.forms);
    ]

let get_asset_type_request_to_yojson (x : get_asset_type_request) =
  assoc_to_yojson [ ("Identifier", Some (asset_type_id_to_yojson x.identifier)) ]

let iterable_form_entry_to_yojson (x : iterable_form_entry) =
  assoc_to_yojson [ ("FormTypeId", option_to_yojson form_type_id_to_yojson x.form_type_id) ]

let iterable_form_key_to_yojson = string_to_yojson

let iterable_form_map_to_yojson tree =
  map_to_yojson iterable_form_key_to_yojson iterable_form_entry_to_yojson tree

let get_asset_output_to_yojson (x : get_asset_output) =
  assoc_to_yojson
    [
      ("Id", Some (asset_id_to_yojson x.id));
      ("Name", option_to_yojson asset_name_to_yojson x.name);
      ("Description", option_to_yojson asset_description_to_yojson x.description);
      ("CreatedAt", option_to_yojson created_at_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson updated_at_to_yojson x.updated_at);
      ("AssetTypeId", Some (asset_type_id_to_yojson x.asset_type_id));
      ("GlossaryTerms", option_to_yojson glossary_term_id_list_to_yojson x.glossary_terms);
      ("Forms", option_to_yojson asset_form_map_to_yojson x.forms);
      ("Attachments", option_to_yojson asset_form_map_to_yojson x.attachments);
      ("IterableForms", option_to_yojson iterable_form_map_to_yojson x.iterable_forms);
    ]

let get_asset_input_to_yojson (x : get_asset_input) =
  assoc_to_yojson [ ("Identifier", Some (asset_id_to_yojson x.identifier)) ]

let disassociate_glossary_terms_response_to_yojson (x : disassociate_glossary_terms_response) =
  assoc_to_yojson
    [
      ("AssetIdentifier", option_to_yojson asset_id_to_yojson x.asset_identifier);
      ("GlossaryTerms", option_to_yojson glossary_term_id_list_to_yojson x.glossary_terms);
    ]

let disassociate_glossary_terms_request_to_yojson (x : disassociate_glossary_terms_request) =
  assoc_to_yojson
    [
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
      ("GlossaryTermIdentifiers", Some (glossary_term_id_list_to_yojson x.glossary_term_identifiers));
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let integration_to_yojson (x : integration) =
  assoc_to_yojson
    [
      ("SourceArn", Some (string512_to_yojson x.source_arn));
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("IntegrationName", Some (string128_to_yojson x.integration_name));
      ("IntegrationArn", Some (string128_to_yojson x.integration_arn));
      ("KmsKeyId", option_to_yojson string2048_to_yojson x.kms_key_id);
      ( "AdditionalEncryptionContext",
        option_to_yojson integration_additional_encryption_context_map_to_yojson
          x.additional_encryption_context );
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
      ("Status", Some (integration_status_to_yojson x.status));
      ("CreateTime", Some (integration_timestamp_to_yojson x.create_time));
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
      ("Errors", option_to_yojson integration_error_list_to_yojson x.errors);
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
    ]

let integrations_list_to_yojson tree = list_to_yojson integration_to_yojson tree

let describe_integrations_response_to_yojson (x : describe_integrations_response) =
  assoc_to_yojson
    [
      ("Integrations", option_to_yojson integrations_list_to_yojson x.integrations);
      ("Marker", option_to_yojson string128_to_yojson x.marker);
    ]

let integration_filter_values_to_yojson tree = list_to_yojson string128_to_yojson tree

let integration_filter_to_yojson (x : integration_filter) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string128_to_yojson x.name);
      ("Values", option_to_yojson integration_filter_values_to_yojson x.values);
    ]

let integration_filter_list_to_yojson tree = list_to_yojson integration_filter_to_yojson tree

let describe_integrations_request_to_yojson (x : describe_integrations_request) =
  assoc_to_yojson
    [
      ("IntegrationIdentifier", option_to_yojson string128_to_yojson x.integration_identifier);
      ("Marker", option_to_yojson string128_to_yojson x.marker);
      ("MaxRecords", option_to_yojson integration_integer_to_yojson x.max_records);
      ("Filters", option_to_yojson integration_filter_list_to_yojson x.filters);
    ]

let target_resource_not_found_to_yojson (x : target_resource_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let inbound_integration_to_yojson (x : inbound_integration) =
  assoc_to_yojson
    [
      ("SourceArn", Some (string512_to_yojson x.source_arn));
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("IntegrationArn", Some (string128_to_yojson x.integration_arn));
      ("Status", Some (integration_status_to_yojson x.status));
      ("CreateTime", Some (integration_timestamp_to_yojson x.create_time));
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
      ("Errors", option_to_yojson integration_error_list_to_yojson x.errors);
    ]

let inbound_integrations_list_to_yojson tree = list_to_yojson inbound_integration_to_yojson tree

let describe_inbound_integrations_response_to_yojson (x : describe_inbound_integrations_response) =
  assoc_to_yojson
    [
      ( "InboundIntegrations",
        option_to_yojson inbound_integrations_list_to_yojson x.inbound_integrations );
      ("Marker", option_to_yojson string128_to_yojson x.marker);
    ]

let describe_inbound_integrations_request_to_yojson (x : describe_inbound_integrations_request) =
  assoc_to_yojson
    [
      ("IntegrationArn", option_to_yojson string128_to_yojson x.integration_arn);
      ("Marker", option_to_yojson string128_to_yojson x.marker);
      ("MaxRecords", option_to_yojson integration_integer_to_yojson x.max_records);
      ("TargetArn", option_to_yojson string512_to_yojson x.target_arn);
    ]

let field_filter_operator_to_yojson (x : field_filter_operator) =
  match x with
  | LESS_THAN -> `String "LESS_THAN"
  | GREATER_THAN -> `String "GREATER_THAN"
  | BETWEEN -> `String "BETWEEN"
  | EQUAL_TO -> `String "EQUAL_TO"
  | NOT_EQUAL_TO -> `String "NOT_EQUAL_TO"
  | GREATER_THAN_OR_EQUAL_TO -> `String "GREATER_THAN_OR_EQUAL_TO"
  | LESS_THAN_OR_EQUAL_TO -> `String "LESS_THAN_OR_EQUAL_TO"
  | CONTAINS -> `String "CONTAINS"
  | ORDER_BY -> `String "ORDER_BY"

let field_filter_operators_list_to_yojson tree = list_to_yojson field_filter_operator_to_yojson tree
let field_description_to_yojson = string_to_yojson
let field_label_to_yojson = string_to_yojson

let field_to_yojson (x : field) =
  assoc_to_yojson
    [
      ("FieldName", option_to_yojson entity_field_name_to_yojson x.field_name);
      ("Label", option_to_yojson field_label_to_yojson x.label);
      ("Description", option_to_yojson field_description_to_yojson x.description);
      ("FieldType", option_to_yojson field_data_type_to_yojson x.field_type);
      ("IsPrimaryKey", option_to_yojson bool__to_yojson x.is_primary_key);
      ("IsNullable", option_to_yojson bool__to_yojson x.is_nullable);
      ("IsRetrievable", option_to_yojson bool__to_yojson x.is_retrievable);
      ("IsFilterable", option_to_yojson bool__to_yojson x.is_filterable);
      ("IsPartitionable", option_to_yojson bool__to_yojson x.is_partitionable);
      ("IsCreateable", option_to_yojson bool__to_yojson x.is_createable);
      ("IsUpdateable", option_to_yojson bool__to_yojson x.is_updateable);
      ("IsUpsertable", option_to_yojson bool__to_yojson x.is_upsertable);
      ("IsDefaultOnCreate", option_to_yojson bool__to_yojson x.is_default_on_create);
      ("SupportedValues", option_to_yojson list_of_string_to_yojson x.supported_values);
      ( "SupportedFilterOperators",
        option_to_yojson field_filter_operators_list_to_yojson x.supported_filter_operators );
      ( "ParentField",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parent_field );
      ( "NativeDataType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.native_data_type
      );
      ("CustomProperties", option_to_yojson custom_properties_to_yojson x.custom_properties);
    ]

let fields_list_to_yojson tree = list_to_yojson field_to_yojson tree

let describe_entity_response_to_yojson (x : describe_entity_response) =
  assoc_to_yojson
    [
      ("Fields", option_to_yojson fields_list_to_yojson x.fields);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_entity_request_to_yojson (x : describe_entity_request) =
  assoc_to_yojson
    [
      ("ConnectionName", Some (name_string_to_yojson x.connection_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("EntityName", Some (entity_name_to_yojson x.entity_name));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DataStoreApiVersion", option_to_yojson api_version_to_yojson x.data_store_api_version);
    ]

let allowed_value_value_string_to_yojson = string_to_yojson
let allowed_value_description_string_to_yojson = string_to_yojson

let allowed_value_to_yojson (x : allowed_value) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson allowed_value_description_string_to_yojson x.description);
      ("Value", Some (allowed_value_value_string_to_yojson x.value));
    ]

let allowed_values_to_yojson tree = list_to_yojson allowed_value_to_yojson tree
let property_types_to_yojson tree = list_to_yojson property_type_to_yojson tree
let property_description_string_to_yojson = string_to_yojson

let property_to_yojson (x : property) =
  assoc_to_yojson
    [
      ("Name", Some (property_name_to_yojson x.name));
      ("Description", Some (property_description_string_to_yojson x.description));
      ("Required", Some (bool__to_yojson x.required));
      ( "DefaultValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.default_value );
      ("PropertyTypes", Some (property_types_to_yojson x.property_types));
      ("AllowedValues", option_to_yojson allowed_values_to_yojson x.allowed_values);
      ("DataOperationScopes", option_to_yojson data_operations_to_yojson x.data_operation_scopes);
      ( "KeyOverride",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key_override );
      ("PropertyLocation", option_to_yojson property_location_to_yojson x.property_location);
    ]

let properties_map_to_yojson tree = map_to_yojson property_name_to_yojson property_to_yojson tree

let property_name_overrides_to_yojson tree =
  map_to_yojson property_name_to_yojson property_name_to_yojson tree

let compute_environment_configuration_description_string_to_yojson = string_to_yojson
let compute_environment_name_to_yojson = string_to_yojson

let compute_environment_configuration_to_yojson (x : compute_environment_configuration) =
  assoc_to_yojson
    [
      ("Name", Some (compute_environment_name_to_yojson x.name));
      ( "Description",
        Some (compute_environment_configuration_description_string_to_yojson x.description) );
      ("ComputeEnvironment", Some (compute_environment_to_yojson x.compute_environment));
      ( "SupportedAuthenticationTypes",
        Some (authentication_types_to_yojson x.supported_authentication_types) );
      ("ConnectionOptions", Some (properties_map_to_yojson x.connection_options));
      ( "ConnectionPropertyNameOverrides",
        Some (property_name_overrides_to_yojson x.connection_property_name_overrides) );
      ( "ConnectionOptionNameOverrides",
        Some (property_name_overrides_to_yojson x.connection_option_name_overrides) );
      ( "ConnectionPropertiesRequiredOverrides",
        Some (list_of_string_to_yojson x.connection_properties_required_overrides) );
      ( "PhysicalConnectionPropertiesRequired",
        option_to_yojson bool__to_yojson x.physical_connection_properties_required );
    ]

let compute_environment_configuration_map_to_yojson tree =
  map_to_yojson compute_environment_name_to_yojson compute_environment_configuration_to_yojson tree

let auth_configuration_to_yojson (x : auth_configuration) =
  assoc_to_yojson
    [
      ("AuthenticationType", Some (property_to_yojson x.authentication_type));
      ("SecretArn", option_to_yojson property_to_yojson x.secret_arn);
      ("OAuth2Properties", option_to_yojson properties_map_to_yojson x.o_auth2_properties);
      ( "BasicAuthenticationProperties",
        option_to_yojson properties_map_to_yojson x.basic_authentication_properties );
      ( "CustomAuthenticationProperties",
        option_to_yojson properties_map_to_yojson x.custom_authentication_properties );
    ]

let describe_connection_type_response_to_yojson (x : describe_connection_type_response) =
  assoc_to_yojson
    [
      ("ConnectionType", option_to_yojson name_string_to_yojson x.connection_type);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Capabilities", option_to_yojson capabilities_to_yojson x.capabilities);
      ("ConnectionProperties", option_to_yojson properties_map_to_yojson x.connection_properties);
      ("ConnectionOptions", option_to_yojson properties_map_to_yojson x.connection_options);
      ( "AuthenticationConfiguration",
        option_to_yojson auth_configuration_to_yojson x.authentication_configuration );
      ( "ComputeEnvironmentConfigurations",
        option_to_yojson compute_environment_configuration_map_to_yojson
          x.compute_environment_configurations );
      ( "PhysicalConnectionRequirements",
        option_to_yojson properties_map_to_yojson x.physical_connection_requirements );
      ( "AthenaConnectionProperties",
        option_to_yojson properties_map_to_yojson x.athena_connection_properties );
      ( "PythonConnectionProperties",
        option_to_yojson properties_map_to_yojson x.python_connection_properties );
      ( "SparkConnectionProperties",
        option_to_yojson properties_map_to_yojson x.spark_connection_properties );
      ("RestConfiguration", option_to_yojson rest_configuration_to_yojson x.rest_configuration);
    ]

let describe_connection_type_request_to_yojson (x : describe_connection_type_request) =
  assoc_to_yojson [ ("ConnectionType", Some (name_string_to_yojson x.connection_type)) ]

let delete_workflow_response_to_yojson (x : delete_workflow_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let delete_workflow_request_to_yojson (x : delete_workflow_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_user_defined_function_response_to_yojson = unit_to_yojson

let delete_user_defined_function_request_to_yojson (x : delete_user_defined_function_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("FunctionName", Some (name_string_to_yojson x.function_name));
    ]

let delete_usage_profile_response_to_yojson = unit_to_yojson

let delete_usage_profile_request_to_yojson (x : delete_usage_profile_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_trigger_response_to_yojson (x : delete_trigger_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let delete_trigger_request_to_yojson (x : delete_trigger_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_table_version_response_to_yojson = unit_to_yojson

let delete_table_version_request_to_yojson (x : delete_table_version_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("VersionId", Some (version_string_to_yojson x.version_id));
    ]

let delete_table_optimizer_response_to_yojson = unit_to_yojson

let delete_table_optimizer_request_to_yojson (x : delete_table_optimizer_request) =
  assoc_to_yojson
    [
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("Type", Some (table_optimizer_type_to_yojson x.type_));
    ]

let delete_table_response_to_yojson = unit_to_yojson

let delete_table_request_to_yojson (x : delete_table_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("Name", Some (name_string_to_yojson x.name));
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
    ]

let delete_session_response_to_yojson (x : delete_session_response) =
  assoc_to_yojson [ ("Id", option_to_yojson name_string_to_yojson x.id) ]

let delete_session_request_to_yojson (x : delete_session_request) =
  assoc_to_yojson
    [
      ("Id", Some (name_string_to_yojson x.id));
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
    ]

let delete_security_configuration_response_to_yojson = unit_to_yojson

let delete_security_configuration_request_to_yojson (x : delete_security_configuration_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let error_message_string_to_yojson = string_to_yojson
let error_code_string_to_yojson = string_to_yojson

let error_details_to_yojson (x : error_details) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson error_code_string_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_string_to_yojson x.error_message);
    ]

let schema_version_error_item_to_yojson (x : schema_version_error_item) =
  assoc_to_yojson
    [
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("ErrorDetails", option_to_yojson error_details_to_yojson x.error_details);
    ]

let schema_version_error_list_to_yojson tree =
  list_to_yojson schema_version_error_item_to_yojson tree

let delete_schema_versions_response_to_yojson (x : delete_schema_versions_response) =
  assoc_to_yojson
    [
      ( "SchemaVersionErrors",
        option_to_yojson schema_version_error_list_to_yojson x.schema_version_errors );
    ]

let versions_string_to_yojson = string_to_yojson

let delete_schema_versions_input_to_yojson (x : delete_schema_versions_input) =
  assoc_to_yojson
    [
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
      ("Versions", Some (versions_string_to_yojson x.versions));
    ]

let delete_schema_response_to_yojson (x : delete_schema_response) =
  assoc_to_yojson
    [
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("Status", option_to_yojson schema_status_to_yojson x.status);
    ]

let delete_schema_input_to_yojson (x : delete_schema_input) =
  assoc_to_yojson [ ("SchemaId", Some (schema_id_to_yojson x.schema_id)) ]

let delete_resource_policy_response_to_yojson = unit_to_yojson

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson
    [
      ("PolicyHashCondition", option_to_yojson hash_string_to_yojson x.policy_hash_condition);
      ("ResourceArn", option_to_yojson glue_resource_arn_to_yojson x.resource_arn);
    ]

let delete_registry_response_to_yojson (x : delete_registry_response) =
  assoc_to_yojson
    [
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("Status", option_to_yojson registry_status_to_yojson x.status);
    ]

let delete_registry_input_to_yojson (x : delete_registry_input) =
  assoc_to_yojson [ ("RegistryId", Some (registry_id_to_yojson x.registry_id)) ]

let delete_partition_index_response_to_yojson = unit_to_yojson

let delete_partition_index_request_to_yojson (x : delete_partition_index_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("IndexName", Some (name_string_to_yojson x.index_name));
    ]

let delete_partition_response_to_yojson = unit_to_yojson

let delete_partition_request_to_yojson (x : delete_partition_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
    ]

let delete_ml_transform_response_to_yojson (x : delete_ml_transform_response) =
  assoc_to_yojson [ ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id) ]

let delete_ml_transform_request_to_yojson (x : delete_ml_transform_request) =
  assoc_to_yojson [ ("TransformId", Some (hash_string_to_yojson x.transform_id)) ]

let delete_job_response_to_yojson (x : delete_job_response) =
  assoc_to_yojson [ ("JobName", option_to_yojson name_string_to_yojson x.job_name) ]

let delete_job_request_to_yojson (x : delete_job_request) =
  assoc_to_yojson [ ("JobName", Some (name_string_to_yojson x.job_name)) ]

let delete_integration_table_properties_response_to_yojson = unit_to_yojson

let delete_integration_table_properties_request_to_yojson
    (x : delete_integration_table_properties_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
      ("TableName", Some (string128_to_yojson x.table_name));
    ]

let delete_integration_resource_property_response_to_yojson = unit_to_yojson

let delete_integration_resource_property_request_to_yojson
    (x : delete_integration_resource_property_request) =
  assoc_to_yojson [ ("ResourceArn", Some (string512_to_yojson x.resource_arn)) ]

let delete_integration_response_to_yojson (x : delete_integration_response) =
  assoc_to_yojson
    [
      ("SourceArn", Some (string512_to_yojson x.source_arn));
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("IntegrationName", Some (string128_to_yojson x.integration_name));
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("IntegrationArn", Some (string128_to_yojson x.integration_arn));
      ("KmsKeyId", option_to_yojson string2048_to_yojson x.kms_key_id);
      ( "AdditionalEncryptionContext",
        option_to_yojson integration_additional_encryption_context_map_to_yojson
          x.additional_encryption_context );
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
      ("Status", Some (integration_status_to_yojson x.status));
      ("CreateTime", Some (integration_timestamp_to_yojson x.create_time));
      ("Errors", option_to_yojson integration_error_list_to_yojson x.errors);
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
    ]

let delete_integration_request_to_yojson (x : delete_integration_request) =
  assoc_to_yojson [ ("IntegrationIdentifier", Some (string128_to_yojson x.integration_identifier)) ]

let delete_glue_identity_center_configuration_response_to_yojson = unit_to_yojson
let delete_glue_identity_center_configuration_request_to_yojson = unit_to_yojson
let delete_glossary_term_response_to_yojson = unit_to_yojson

let delete_glossary_term_request_to_yojson (x : delete_glossary_term_request) =
  assoc_to_yojson [ ("Identifier", Some (glossary_term_id_to_yojson x.identifier)) ]

let delete_glossary_response_to_yojson = unit_to_yojson

let delete_glossary_request_to_yojson (x : delete_glossary_request) =
  assoc_to_yojson [ ("Identifier", Some (glossary_id_to_yojson x.identifier)) ]

let delete_form_type_response_to_yojson = unit_to_yojson

let delete_form_type_request_to_yojson (x : delete_form_type_request) =
  assoc_to_yojson [ ("Identifier", Some (form_type_id_to_yojson x.identifier)) ]

let delete_dev_endpoint_response_to_yojson = unit_to_yojson

let delete_dev_endpoint_request_to_yojson (x : delete_dev_endpoint_request) =
  assoc_to_yojson [ ("EndpointName", Some (generic_string_to_yojson x.endpoint_name)) ]

let delete_data_quality_ruleset_response_to_yojson = unit_to_yojson

let delete_data_quality_ruleset_request_to_yojson (x : delete_data_quality_ruleset_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_database_response_to_yojson = unit_to_yojson

let delete_database_request_to_yojson (x : delete_database_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let delete_custom_entity_type_response_to_yojson (x : delete_custom_entity_type_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let delete_custom_entity_type_request_to_yojson (x : delete_custom_entity_type_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_crawler_response_to_yojson = unit_to_yojson

let delete_crawler_request_to_yojson (x : delete_crawler_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_connection_type_response_to_yojson = unit_to_yojson

let delete_connection_type_request_to_yojson (x : delete_connection_type_request) =
  assoc_to_yojson [ ("ConnectionType", Some (name_string_to_yojson x.connection_type)) ]

let delete_connection_response_to_yojson = unit_to_yojson

let delete_connection_request_to_yojson (x : delete_connection_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("ConnectionName", Some (name_string_to_yojson x.connection_name));
    ]

let delete_column_statistics_task_settings_response_to_yojson = unit_to_yojson

let delete_column_statistics_task_settings_request_to_yojson
    (x : delete_column_statistics_task_settings_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
    ]

let delete_column_statistics_for_table_response_to_yojson = unit_to_yojson

let delete_column_statistics_for_table_request_to_yojson
    (x : delete_column_statistics_for_table_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("ColumnName", Some (name_string_to_yojson x.column_name));
    ]

let delete_column_statistics_for_partition_response_to_yojson = unit_to_yojson

let delete_column_statistics_for_partition_request_to_yojson
    (x : delete_column_statistics_for_partition_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
      ("ColumnName", Some (name_string_to_yojson x.column_name));
    ]

let delete_classifier_response_to_yojson = unit_to_yojson

let delete_classifier_request_to_yojson (x : delete_classifier_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_catalog_response_to_yojson = unit_to_yojson

let delete_catalog_request_to_yojson (x : delete_catalog_request) =
  assoc_to_yojson [ ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id)) ]

let delete_blueprint_response_to_yojson (x : delete_blueprint_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let delete_blueprint_request_to_yojson (x : delete_blueprint_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_attachment_response_to_yojson (x : delete_attachment_response) =
  assoc_to_yojson [ ("AssetIdentifier", option_to_yojson asset_id_to_yojson x.asset_identifier) ]

let delete_attachment_request_to_yojson (x : delete_attachment_request) =
  assoc_to_yojson
    [
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
      ("IterableFormName", option_to_yojson iterable_form_name_to_yojson x.iterable_form_name);
      ("ItemIdentifier", option_to_yojson item_identifier_to_yojson x.item_identifier);
      ("AttachmentName", Some (attachment_name_to_yojson x.attachment_name));
    ]

let delete_asset_type_response_to_yojson = unit_to_yojson

let delete_asset_type_request_to_yojson (x : delete_asset_type_request) =
  assoc_to_yojson [ ("Identifier", Some (asset_type_id_to_yojson x.identifier)) ]

let delete_asset_response_to_yojson = unit_to_yojson

let delete_asset_request_to_yojson (x : delete_asset_request) =
  assoc_to_yojson [ ("Identifier", Some (asset_id_to_yojson x.identifier)) ]

let create_workflow_response_to_yojson (x : create_workflow_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_workflow_request_to_yojson (x : create_workflow_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson workflow_description_string_to_yojson x.description);
      ( "DefaultRunProperties",
        option_to_yojson workflow_run_properties_to_yojson x.default_run_properties );
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("MaxConcurrentRuns", option_to_yojson nullable_integer_to_yojson x.max_concurrent_runs);
    ]

let create_user_defined_function_response_to_yojson = unit_to_yojson

let create_user_defined_function_request_to_yojson (x : create_user_defined_function_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("FunctionInput", Some (user_defined_function_input_to_yojson x.function_input));
    ]

let create_usage_profile_response_to_yojson (x : create_usage_profile_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_usage_profile_request_to_yojson (x : create_usage_profile_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Configuration", Some (profile_configuration_to_yojson x.configuration));
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let create_trigger_response_to_yojson (x : create_trigger_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_trigger_request_to_yojson (x : create_trigger_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("WorkflowName", option_to_yojson name_string_to_yojson x.workflow_name);
      ("Type", Some (trigger_type_to_yojson x.type_));
      ("Schedule", option_to_yojson generic_string_to_yojson x.schedule);
      ("Predicate", option_to_yojson predicate_to_yojson x.predicate);
      ("Actions", Some (action_list_to_yojson x.actions));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("StartOnCreation", option_to_yojson boolean_value_to_yojson x.start_on_creation);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ( "EventBatchingCondition",
        option_to_yojson event_batching_condition_to_yojson x.event_batching_condition );
    ]

let create_table_optimizer_response_to_yojson = unit_to_yojson

let create_table_optimizer_request_to_yojson (x : create_table_optimizer_request) =
  assoc_to_yojson
    [
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("Type", Some (table_optimizer_type_to_yojson x.type_));
      ( "TableOptimizerConfiguration",
        Some (table_optimizer_configuration_to_yojson x.table_optimizer_configuration) );
    ]

let create_table_response_to_yojson = unit_to_yojson

let create_iceberg_table_input_to_yojson (x : create_iceberg_table_input) =
  assoc_to_yojson
    [
      ("Location", Some (location_string_to_yojson x.location));
      ("Schema", Some (iceberg_schema_to_yojson x.schema));
      ("PartitionSpec", option_to_yojson iceberg_partition_spec_to_yojson x.partition_spec);
      ("WriteOrder", option_to_yojson iceberg_sort_order_to_yojson x.write_order);
      ("Properties", option_to_yojson string_to_string_map_to_yojson x.properties);
    ]

let metadata_operation_to_yojson (x : metadata_operation) =
  match x with CREATE -> `String "CREATE"

let iceberg_input_to_yojson (x : iceberg_input) =
  assoc_to_yojson
    [
      ("MetadataOperation", Some (metadata_operation_to_yojson x.metadata_operation));
      ("Version", option_to_yojson version_string_to_yojson x.version);
      ( "CreateIcebergTableInput",
        option_to_yojson create_iceberg_table_input_to_yojson x.create_iceberg_table_input );
    ]

let open_table_format_input_to_yojson (x : open_table_format_input) =
  assoc_to_yojson [ ("IcebergInput", option_to_yojson iceberg_input_to_yojson x.iceberg_input) ]

let key_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let partition_index_to_yojson (x : partition_index) =
  assoc_to_yojson
    [
      ("Keys", Some (key_list_to_yojson x.keys));
      ("IndexName", Some (name_string_to_yojson x.index_name));
    ]

let partition_index_list_to_yojson tree = list_to_yojson partition_index_to_yojson tree

let create_table_request_to_yojson (x : create_table_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("TableInput", option_to_yojson table_input_to_yojson x.table_input);
      ("PartitionIndexes", option_to_yojson partition_index_list_to_yojson x.partition_indexes);
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ( "OpenTableFormatInput",
        option_to_yojson open_table_format_input_to_yojson x.open_table_format_input );
    ]

let create_session_response_to_yojson (x : create_session_response) =
  assoc_to_yojson [ ("Session", option_to_yojson session_to_yojson x.session) ]

let create_session_request_to_yojson (x : create_session_request) =
  assoc_to_yojson
    [
      ("Id", Some (name_string_to_yojson x.id));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Role", Some (orchestration_role_arn_to_yojson x.role));
      ("Command", Some (session_command_to_yojson x.command));
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("IdleTimeout", option_to_yojson timeout_to_yojson x.idle_timeout);
      ( "DefaultArguments",
        option_to_yojson orchestration_arguments_map_to_yojson x.default_arguments );
      ("Connections", option_to_yojson connections_list_to_yojson x.connections);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("SessionType", option_to_yojson session_type_to_yojson x.session_type);
    ]

let create_security_configuration_response_to_yojson (x : create_security_configuration_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("CreatedTimestamp", option_to_yojson timestamp_value_to_yojson x.created_timestamp);
    ]

let create_security_configuration_request_to_yojson (x : create_security_configuration_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ( "EncryptionConfiguration",
        Some (encryption_configuration_to_yojson x.encryption_configuration) );
    ]

let create_script_response_to_yojson (x : create_script_response) =
  assoc_to_yojson
    [
      ("PythonScript", option_to_yojson python_script_to_yojson x.python_script);
      ("ScalaCode", option_to_yojson scala_code_to_yojson x.scala_code);
    ]

let create_script_request_to_yojson (x : create_script_request) =
  assoc_to_yojson
    [
      ("DagNodes", option_to_yojson dag_nodes_to_yojson x.dag_nodes);
      ("DagEdges", option_to_yojson dag_edges_to_yojson x.dag_edges);
      ("Language", option_to_yojson language_to_yojson x.language);
    ]

let create_schema_response_to_yojson (x : create_schema_response) =
  assoc_to_yojson
    [
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("DataFormat", option_to_yojson data_format_to_yojson x.data_format);
      ("Compatibility", option_to_yojson compatibility_to_yojson x.compatibility);
      ("SchemaCheckpoint", option_to_yojson schema_checkpoint_number_to_yojson x.schema_checkpoint);
      ("LatestSchemaVersion", option_to_yojson version_long_number_to_yojson x.latest_schema_version);
      ("NextSchemaVersion", option_to_yojson version_long_number_to_yojson x.next_schema_version);
      ("SchemaStatus", option_to_yojson schema_status_to_yojson x.schema_status);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ( "SchemaVersionStatus",
        option_to_yojson schema_version_status_to_yojson x.schema_version_status );
    ]

let create_schema_input_to_yojson (x : create_schema_input) =
  assoc_to_yojson
    [
      ("RegistryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("SchemaName", Some (schema_registry_name_string_to_yojson x.schema_name));
      ("DataFormat", Some (data_format_to_yojson x.data_format));
      ("Compatibility", option_to_yojson compatibility_to_yojson x.compatibility);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("SchemaDefinition", option_to_yojson schema_definition_string_to_yojson x.schema_definition);
    ]

let create_registry_response_to_yojson (x : create_registry_response) =
  assoc_to_yojson
    [
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let create_registry_input_to_yojson (x : create_registry_input) =
  assoc_to_yojson
    [
      ("RegistryName", Some (schema_registry_name_string_to_yojson x.registry_name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let create_partition_index_response_to_yojson = unit_to_yojson

let create_partition_index_request_to_yojson (x : create_partition_index_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("PartitionIndex", Some (partition_index_to_yojson x.partition_index));
    ]

let create_partition_response_to_yojson = unit_to_yojson

let create_partition_request_to_yojson (x : create_partition_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("PartitionInput", Some (partition_input_to_yojson x.partition_input));
    ]

let create_ml_transform_response_to_yojson (x : create_ml_transform_response) =
  assoc_to_yojson [ ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id) ]

let create_ml_transform_request_to_yojson (x : create_ml_transform_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("InputRecordTables", Some (glue_tables_to_yojson x.input_record_tables));
      ("Parameters", Some (transform_parameters_to_yojson x.parameters));
      ("Role", Some (role_string_to_yojson x.role));
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("MaxRetries", option_to_yojson nullable_integer_to_yojson x.max_retries);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("TransformEncryption", option_to_yojson transform_encryption_to_yojson x.transform_encryption);
    ]

let create_job_response_to_yojson (x : create_job_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_job_request_to_yojson (x : create_job_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("JobMode", option_to_yojson job_mode_to_yojson x.job_mode);
      ("JobRunQueuingEnabled", option_to_yojson nullable_boolean_to_yojson x.job_run_queuing_enabled);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("LogUri", option_to_yojson uri_string_to_yojson x.log_uri);
      ("Role", Some (role_string_to_yojson x.role));
      ("ExecutionProperty", option_to_yojson execution_property_to_yojson x.execution_property);
      ("Command", Some (job_command_to_yojson x.command));
      ("DefaultArguments", option_to_yojson generic_map_to_yojson x.default_arguments);
      ("NonOverridableArguments", option_to_yojson generic_map_to_yojson x.non_overridable_arguments);
      ("Connections", option_to_yojson connections_list_to_yojson x.connections);
      ("MaxRetries", option_to_yojson max_retries_to_yojson x.max_retries);
      ("AllocatedCapacity", option_to_yojson integer_value_to_yojson x.allocated_capacity);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ( "CodeGenConfigurationNodes",
        option_to_yojson code_gen_configuration_nodes_to_yojson x.code_gen_configuration_nodes );
      ("ExecutionClass", option_to_yojson execution_class_to_yojson x.execution_class);
      ( "SourceControlDetails",
        option_to_yojson source_control_details_to_yojson x.source_control_details );
      ("MaintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
    ]

let create_integration_table_properties_response_to_yojson = unit_to_yojson

let create_integration_table_properties_request_to_yojson
    (x : create_integration_table_properties_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
      ("TableName", Some (string128_to_yojson x.table_name));
      ("SourceTableConfig", option_to_yojson source_table_config_to_yojson x.source_table_config);
      ("TargetTableConfig", option_to_yojson target_table_config_to_yojson x.target_table_config);
    ]

let create_integration_resource_property_response_to_yojson
    (x : create_integration_resource_property_response) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
      ("ResourcePropertyArn", option_to_yojson string512_to_yojson x.resource_property_arn);
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
    ]

let create_integration_resource_property_request_to_yojson
    (x : create_integration_resource_property_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
    ]

let kms_key_not_accessible_fault_to_yojson (x : kms_key_not_accessible_fault) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let integration_quota_exceeded_fault_to_yojson (x : integration_quota_exceeded_fault) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let create_integration_response_to_yojson (x : create_integration_response) =
  assoc_to_yojson
    [
      ("SourceArn", Some (string512_to_yojson x.source_arn));
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("IntegrationName", Some (string128_to_yojson x.integration_name));
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("IntegrationArn", Some (string128_to_yojson x.integration_arn));
      ("KmsKeyId", option_to_yojson string2048_to_yojson x.kms_key_id);
      ( "AdditionalEncryptionContext",
        option_to_yojson integration_additional_encryption_context_map_to_yojson
          x.additional_encryption_context );
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
      ("Status", Some (integration_status_to_yojson x.status));
      ("CreateTime", Some (integration_timestamp_to_yojson x.create_time));
      ("Errors", option_to_yojson integration_error_list_to_yojson x.errors);
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
    ]

let create_integration_request_to_yojson (x : create_integration_request) =
  assoc_to_yojson
    [
      ("IntegrationName", Some (string128_to_yojson x.integration_name));
      ("SourceArn", Some (string512_to_yojson x.source_arn));
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
      ("KmsKeyId", option_to_yojson string2048_to_yojson x.kms_key_id);
      ( "AdditionalEncryptionContext",
        option_to_yojson integration_additional_encryption_context_map_to_yojson
          x.additional_encryption_context );
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
    ]

let create_glue_identity_center_configuration_response_to_yojson
    (x : create_glue_identity_center_configuration_response) =
  assoc_to_yojson
    [ ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn) ]

let create_glue_identity_center_configuration_request_to_yojson
    (x : create_glue_identity_center_configuration_request) =
  assoc_to_yojson
    [
      ("InstanceArn", Some (identity_center_instance_arn_to_yojson x.instance_arn));
      ("Scopes", option_to_yojson identity_center_scopes_list_to_yojson x.scopes);
      ( "UserBackgroundSessionsEnabled",
        option_to_yojson nullable_boolean_to_yojson x.user_background_sessions_enabled );
    ]

let create_glossary_term_response_to_yojson (x : create_glossary_term_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson glossary_term_id_to_yojson x.id);
      ("GlossaryId", option_to_yojson glossary_id_to_yojson x.glossary_id);
      ("Name", option_to_yojson glossary_term_name_to_yojson x.name);
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
      ("LongDescription", option_to_yojson glossary_long_description_to_yojson x.long_description);
    ]

let create_glossary_term_request_to_yojson (x : create_glossary_term_request) =
  assoc_to_yojson
    [
      ("GlossaryIdentifier", Some (glossary_id_to_yojson x.glossary_identifier));
      ("Name", Some (glossary_term_name_to_yojson x.name));
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
      ("LongDescription", option_to_yojson glossary_long_description_to_yojson x.long_description);
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_glossary_response_to_yojson (x : create_glossary_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson glossary_id_to_yojson x.id);
      ("Name", option_to_yojson glossary_name_to_yojson x.name);
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
    ]

let create_glossary_request_to_yojson (x : create_glossary_request) =
  assoc_to_yojson
    [
      ("Name", Some (glossary_name_to_yojson x.name));
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_dev_endpoint_response_to_yojson (x : create_dev_endpoint_response) =
  assoc_to_yojson
    [
      ("EndpointName", option_to_yojson generic_string_to_yojson x.endpoint_name);
      ("Status", option_to_yojson generic_string_to_yojson x.status);
      ("SecurityGroupIds", option_to_yojson string_list_to_yojson x.security_group_ids);
      ("SubnetId", option_to_yojson generic_string_to_yojson x.subnet_id);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("YarnEndpointAddress", option_to_yojson generic_string_to_yojson x.yarn_endpoint_address);
      ( "ZeppelinRemoteSparkInterpreterPort",
        option_to_yojson integer_value_to_yojson x.zeppelin_remote_spark_interpreter_port );
      ("NumberOfNodes", option_to_yojson integer_value_to_yojson x.number_of_nodes);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("AvailabilityZone", option_to_yojson generic_string_to_yojson x.availability_zone);
      ("VpcId", option_to_yojson generic_string_to_yojson x.vpc_id);
      ( "ExtraPythonLibsS3Path",
        option_to_yojson generic_string_to_yojson x.extra_python_libs_s3_path );
      ("ExtraJarsS3Path", option_to_yojson generic_string_to_yojson x.extra_jars_s3_path);
      ("FailureReason", option_to_yojson generic_string_to_yojson x.failure_reason);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("CreatedTimestamp", option_to_yojson timestamp_value_to_yojson x.created_timestamp);
      ("Arguments", option_to_yojson map_value_to_yojson x.arguments);
    ]

let create_dev_endpoint_request_to_yojson (x : create_dev_endpoint_request) =
  assoc_to_yojson
    [
      ("EndpointName", Some (generic_string_to_yojson x.endpoint_name));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("SecurityGroupIds", option_to_yojson string_list_to_yojson x.security_group_ids);
      ("SubnetId", option_to_yojson generic_string_to_yojson x.subnet_id);
      ("PublicKey", option_to_yojson generic_string_to_yojson x.public_key);
      ("PublicKeys", option_to_yojson public_keys_list_to_yojson x.public_keys);
      ("NumberOfNodes", option_to_yojson integer_value_to_yojson x.number_of_nodes);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ( "ExtraPythonLibsS3Path",
        option_to_yojson generic_string_to_yojson x.extra_python_libs_s3_path );
      ("ExtraJarsS3Path", option_to_yojson generic_string_to_yojson x.extra_jars_s3_path);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("Arguments", option_to_yojson map_value_to_yojson x.arguments);
    ]

let create_data_quality_ruleset_response_to_yojson (x : create_data_quality_ruleset_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_data_quality_ruleset_request_to_yojson (x : create_data_quality_ruleset_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Ruleset", Some (data_quality_ruleset_string_to_yojson x.ruleset));
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("TargetTable", option_to_yojson data_quality_target_table_to_yojson x.target_table);
      ( "DataQualitySecurityConfiguration",
        option_to_yojson name_string_to_yojson x.data_quality_security_configuration );
      ("ClientToken", option_to_yojson hash_string_to_yojson x.client_token);
    ]

let federated_resource_already_exists_exception_to_yojson
    (x : federated_resource_already_exists_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson message_string_to_yojson x.message);
      ( "AssociatedGlueResource",
        option_to_yojson glue_resource_arn_to_yojson x.associated_glue_resource );
    ]

let create_database_response_to_yojson = unit_to_yojson

let create_database_request_to_yojson (x : create_database_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseInput", Some (database_input_to_yojson x.database_input));
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let create_custom_entity_type_response_to_yojson (x : create_custom_entity_type_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_custom_entity_type_request_to_yojson (x : create_custom_entity_type_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("RegexString", Some (name_string_to_yojson x.regex_string));
      ("ContextWords", option_to_yojson context_words_to_yojson x.context_words);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let create_crawler_response_to_yojson = unit_to_yojson

let create_crawler_request_to_yojson (x : create_crawler_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Role", Some (role_to_yojson x.role));
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Targets", Some (crawler_targets_to_yojson x.targets));
      ("Schedule", option_to_yojson cron_expression_to_yojson x.schedule);
      ("Classifiers", option_to_yojson classifier_name_list_to_yojson x.classifiers);
      ("TablePrefix", option_to_yojson table_prefix_to_yojson x.table_prefix);
      ("SchemaChangePolicy", option_to_yojson schema_change_policy_to_yojson x.schema_change_policy);
      ("RecrawlPolicy", option_to_yojson recrawl_policy_to_yojson x.recrawl_policy);
      ( "LineageConfiguration",
        option_to_yojson lineage_configuration_to_yojson x.lineage_configuration );
      ( "LakeFormationConfiguration",
        option_to_yojson lake_formation_configuration_to_yojson x.lake_formation_configuration );
      ("Configuration", option_to_yojson crawler_configuration_to_yojson x.configuration);
      ( "CrawlerSecurityConfiguration",
        option_to_yojson crawler_security_configuration_to_yojson x.crawler_security_configuration
      );
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let create_connection_response_to_yojson (x : create_connection_response) =
  assoc_to_yojson
    [
      ( "CreateConnectionStatus",
        option_to_yojson connection_status_to_yojson x.create_connection_status );
    ]

let create_connection_request_to_yojson (x : create_connection_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("ConnectionInput", Some (connection_input_to_yojson x.connection_input));
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let create_column_statistics_task_settings_response_to_yojson = unit_to_yojson

let create_column_statistics_task_settings_request_to_yojson
    (x : create_column_statistics_task_settings_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("Role", Some (name_string_to_yojson x.role));
      ("Schedule", option_to_yojson cron_expression_to_yojson x.schedule);
      ("ColumnNameList", option_to_yojson column_name_list_to_yojson x.column_name_list);
      ("SampleSize", option_to_yojson sample_size_percentage_to_yojson x.sample_size);
      ("CatalogID", option_to_yojson name_string_to_yojson x.catalog_i_d);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let create_classifier_response_to_yojson = unit_to_yojson

let create_csv_classifier_request_to_yojson (x : create_csv_classifier_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Delimiter", option_to_yojson csv_column_delimiter_to_yojson x.delimiter);
      ("QuoteSymbol", option_to_yojson csv_quote_symbol_to_yojson x.quote_symbol);
      ("ContainsHeader", option_to_yojson csv_header_option_to_yojson x.contains_header);
      ("Header", option_to_yojson csv_header_to_yojson x.header);
      ("DisableValueTrimming", option_to_yojson nullable_boolean_to_yojson x.disable_value_trimming);
      ("AllowSingleColumn", option_to_yojson nullable_boolean_to_yojson x.allow_single_column);
      ( "CustomDatatypeConfigured",
        option_to_yojson nullable_boolean_to_yojson x.custom_datatype_configured );
      ("CustomDatatypes", option_to_yojson custom_datatypes_to_yojson x.custom_datatypes);
      ("Serde", option_to_yojson csv_serde_option_to_yojson x.serde);
    ]

let create_json_classifier_request_to_yojson (x : create_json_classifier_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("JsonPath", Some (json_path_to_yojson x.json_path));
    ]

let create_xml_classifier_request_to_yojson (x : create_xml_classifier_request) =
  assoc_to_yojson
    [
      ("Classification", Some (classification_to_yojson x.classification));
      ("Name", Some (name_string_to_yojson x.name));
      ("RowTag", option_to_yojson row_tag_to_yojson x.row_tag);
    ]

let create_grok_classifier_request_to_yojson (x : create_grok_classifier_request) =
  assoc_to_yojson
    [
      ("Classification", Some (classification_to_yojson x.classification));
      ("Name", Some (name_string_to_yojson x.name));
      ("GrokPattern", Some (grok_pattern_to_yojson x.grok_pattern));
      ("CustomPatterns", option_to_yojson custom_patterns_to_yojson x.custom_patterns);
    ]

let create_classifier_request_to_yojson (x : create_classifier_request) =
  assoc_to_yojson
    [
      ("GrokClassifier", option_to_yojson create_grok_classifier_request_to_yojson x.grok_classifier);
      ("XMLClassifier", option_to_yojson create_xml_classifier_request_to_yojson x.xml_classifier);
      ("JsonClassifier", option_to_yojson create_json_classifier_request_to_yojson x.json_classifier);
      ("CsvClassifier", option_to_yojson create_csv_classifier_request_to_yojson x.csv_classifier);
    ]

let create_catalog_response_to_yojson = unit_to_yojson

let create_catalog_request_to_yojson (x : create_catalog_request) =
  assoc_to_yojson
    [
      ("Name", Some (catalog_name_string_to_yojson x.name));
      ("CatalogInput", Some (catalog_input_to_yojson x.catalog_input));
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let create_blueprint_response_to_yojson (x : create_blueprint_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_blueprint_request_to_yojson (x : create_blueprint_request) =
  assoc_to_yojson
    [
      ("Name", Some (orchestration_name_string_to_yojson x.name));
      ("Description", option_to_yojson generic512_char_string_to_yojson x.description);
      ("BlueprintLocation", Some (orchestration_s3_location_to_yojson x.blueprint_location));
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
    ]

let schema_validation_error_to_yojson = string_to_yojson
let is_version_valid_to_yojson = bool_to_yojson

let check_schema_version_validity_response_to_yojson (x : check_schema_version_validity_response) =
  assoc_to_yojson
    [
      ("Valid", option_to_yojson is_version_valid_to_yojson x.valid);
      ("Error", option_to_yojson schema_validation_error_to_yojson x.error);
    ]

let check_schema_version_validity_input_to_yojson (x : check_schema_version_validity_input) =
  assoc_to_yojson
    [
      ("DataFormat", Some (data_format_to_yojson x.data_format));
      ("SchemaDefinition", Some (schema_definition_string_to_yojson x.schema_definition));
    ]

let cancel_statement_response_to_yojson = unit_to_yojson

let cancel_statement_request_to_yojson (x : cancel_statement_request) =
  assoc_to_yojson
    [
      ("SessionId", Some (name_string_to_yojson x.session_id));
      ("Id", Some (integer_value_to_yojson x.id));
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
    ]

let cancel_ml_task_run_response_to_yojson (x : cancel_ml_task_run_response) =
  assoc_to_yojson
    [
      ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id);
      ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
    ]

let cancel_ml_task_run_request_to_yojson (x : cancel_ml_task_run_request) =
  assoc_to_yojson
    [
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
      ("TaskRunId", Some (hash_string_to_yojson x.task_run_id));
    ]

let cancel_data_quality_ruleset_evaluation_run_response_to_yojson = unit_to_yojson

let cancel_data_quality_ruleset_evaluation_run_request_to_yojson
    (x : cancel_data_quality_ruleset_evaluation_run_request) =
  assoc_to_yojson [ ("RunId", Some (hash_string_to_yojson x.run_id)) ]

let cancel_data_quality_rule_recommendation_run_response_to_yojson = unit_to_yojson

let cancel_data_quality_rule_recommendation_run_request_to_yojson
    (x : cancel_data_quality_rule_recommendation_run_request) =
  assoc_to_yojson [ ("RunId", Some (hash_string_to_yojson x.run_id)) ]

let batch_update_partition_failure_entry_to_yojson (x : batch_update_partition_failure_entry) =
  assoc_to_yojson
    [
      ( "PartitionValueList",
        option_to_yojson bounded_partition_value_list_to_yojson x.partition_value_list );
      ("ErrorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
    ]

let batch_update_partition_failure_list_to_yojson tree =
  list_to_yojson batch_update_partition_failure_entry_to_yojson tree

let batch_update_partition_response_to_yojson (x : batch_update_partition_response) =
  assoc_to_yojson
    [ ("Errors", option_to_yojson batch_update_partition_failure_list_to_yojson x.errors) ]

let batch_update_partition_request_entry_to_yojson (x : batch_update_partition_request_entry) =
  assoc_to_yojson
    [
      ("PartitionValueList", Some (bounded_partition_value_list_to_yojson x.partition_value_list));
      ("PartitionInput", Some (partition_input_to_yojson x.partition_input));
    ]

let batch_update_partition_request_entry_list_to_yojson tree =
  list_to_yojson batch_update_partition_request_entry_to_yojson tree

let batch_update_partition_request_to_yojson (x : batch_update_partition_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("Entries", Some (batch_update_partition_request_entry_list_to_yojson x.entries));
    ]

let batch_stop_job_run_error_to_yojson (x : batch_stop_job_run_error) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("JobRunId", option_to_yojson id_string_to_yojson x.job_run_id);
      ("ErrorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
    ]

let batch_stop_job_run_error_list_to_yojson tree =
  list_to_yojson batch_stop_job_run_error_to_yojson tree

let batch_stop_job_run_successful_submission_to_yojson
    (x : batch_stop_job_run_successful_submission) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("JobRunId", option_to_yojson id_string_to_yojson x.job_run_id);
    ]

let batch_stop_job_run_successful_submission_list_to_yojson tree =
  list_to_yojson batch_stop_job_run_successful_submission_to_yojson tree

let batch_stop_job_run_response_to_yojson (x : batch_stop_job_run_response) =
  assoc_to_yojson
    [
      ( "SuccessfulSubmissions",
        option_to_yojson batch_stop_job_run_successful_submission_list_to_yojson
          x.successful_submissions );
      ("Errors", option_to_yojson batch_stop_job_run_error_list_to_yojson x.errors);
    ]

let batch_stop_job_run_job_run_id_list_to_yojson tree = list_to_yojson id_string_to_yojson tree

let batch_stop_job_run_request_to_yojson (x : batch_stop_job_run_request) =
  assoc_to_yojson
    [
      ("JobName", Some (name_string_to_yojson x.job_name));
      ("JobRunIds", Some (batch_stop_job_run_job_run_id_list_to_yojson x.job_run_ids));
    ]

let annotation_error_to_yojson (x : annotation_error) =
  assoc_to_yojson
    [
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ("FailureReason", option_to_yojson description_string_to_yojson x.failure_reason);
    ]

let annotation_error_list_to_yojson tree = list_to_yojson annotation_error_to_yojson tree

let batch_put_data_quality_statistic_annotation_response_to_yojson
    (x : batch_put_data_quality_statistic_annotation_response) =
  assoc_to_yojson
    [
      ( "FailedInclusionAnnotations",
        option_to_yojson annotation_error_list_to_yojson x.failed_inclusion_annotations );
    ]

let datapoint_inclusion_annotation_to_yojson (x : datapoint_inclusion_annotation) =
  assoc_to_yojson
    [
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ( "InclusionAnnotation",
        option_to_yojson inclusion_annotation_value_to_yojson x.inclusion_annotation );
    ]

let inclusion_annotation_list_to_yojson tree =
  list_to_yojson datapoint_inclusion_annotation_to_yojson tree

let batch_put_data_quality_statistic_annotation_request_to_yojson
    (x : batch_put_data_quality_statistic_annotation_request) =
  assoc_to_yojson
    [
      ("InclusionAnnotations", Some (inclusion_annotation_list_to_yojson x.inclusion_annotations));
      ("ClientToken", option_to_yojson hash_string_to_yojson x.client_token);
    ]

let workflows_to_yojson tree = list_to_yojson workflow_to_yojson tree

let batch_get_workflows_response_to_yojson (x : batch_get_workflows_response) =
  assoc_to_yojson
    [
      ("Workflows", option_to_yojson workflows_to_yojson x.workflows);
      ("MissingWorkflows", option_to_yojson workflow_names_to_yojson x.missing_workflows);
    ]

let batch_get_workflows_request_to_yojson (x : batch_get_workflows_request) =
  assoc_to_yojson
    [
      ("Names", Some (workflow_names_to_yojson x.names));
      ("IncludeGraph", option_to_yojson nullable_boolean_to_yojson x.include_graph);
    ]

let batch_get_triggers_response_to_yojson (x : batch_get_triggers_response) =
  assoc_to_yojson
    [
      ("Triggers", option_to_yojson trigger_list_to_yojson x.triggers);
      ("TriggersNotFound", option_to_yojson trigger_name_list_to_yojson x.triggers_not_found);
    ]

let batch_get_triggers_request_to_yojson (x : batch_get_triggers_request) =
  assoc_to_yojson [ ("TriggerNames", Some (trigger_name_list_to_yojson x.trigger_names)) ]

let table_name_string_to_yojson = string_to_yojson
let database_name_string_to_yojson = string_to_yojson

let batch_get_table_optimizer_error_to_yojson (x : batch_get_table_optimizer_error) =
  assoc_to_yojson
    [
      ("error", option_to_yojson error_detail_to_yojson x.error);
      ("catalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("databaseName", option_to_yojson database_name_string_to_yojson x.database_name);
      ("tableName", option_to_yojson table_name_string_to_yojson x.table_name);
      ("type", option_to_yojson table_optimizer_type_to_yojson x.type_);
    ]

let batch_get_table_optimizer_errors_to_yojson tree =
  list_to_yojson batch_get_table_optimizer_error_to_yojson tree

let batch_table_optimizer_to_yojson (x : batch_table_optimizer) =
  assoc_to_yojson
    [
      ("catalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("databaseName", option_to_yojson database_name_string_to_yojson x.database_name);
      ("tableName", option_to_yojson table_name_string_to_yojson x.table_name);
      ("tableOptimizer", option_to_yojson table_optimizer_to_yojson x.table_optimizer);
    ]

let batch_table_optimizers_to_yojson tree = list_to_yojson batch_table_optimizer_to_yojson tree

let batch_get_table_optimizer_response_to_yojson (x : batch_get_table_optimizer_response) =
  assoc_to_yojson
    [
      ("TableOptimizers", option_to_yojson batch_table_optimizers_to_yojson x.table_optimizers);
      ("Failures", option_to_yojson batch_get_table_optimizer_errors_to_yojson x.failures);
    ]

let batch_get_table_optimizer_entry_to_yojson (x : batch_get_table_optimizer_entry) =
  assoc_to_yojson
    [
      ("catalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("databaseName", option_to_yojson database_name_string_to_yojson x.database_name);
      ("tableName", option_to_yojson table_name_string_to_yojson x.table_name);
      ("type", option_to_yojson table_optimizer_type_to_yojson x.type_);
    ]

let batch_get_table_optimizer_entries_to_yojson tree =
  list_to_yojson batch_get_table_optimizer_entry_to_yojson tree

let batch_get_table_optimizer_request_to_yojson (x : batch_get_table_optimizer_request) =
  assoc_to_yojson [ ("Entries", Some (batch_get_table_optimizer_entries_to_yojson x.entries)) ]

let batch_get_partition_value_list_to_yojson tree =
  list_to_yojson partition_value_list_to_yojson tree

let batch_get_partition_response_to_yojson (x : batch_get_partition_response) =
  assoc_to_yojson
    [
      ("Partitions", option_to_yojson partition_list_to_yojson x.partitions);
      ( "UnprocessedKeys",
        option_to_yojson batch_get_partition_value_list_to_yojson x.unprocessed_keys );
    ]

let batch_get_partition_request_to_yojson (x : batch_get_partition_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("PartitionsToGet", Some (batch_get_partition_value_list_to_yojson x.partitions_to_get));
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ( "QuerySessionContext",
        option_to_yojson query_session_context_to_yojson x.query_session_context );
    ]

let batch_get_jobs_response_to_yojson (x : batch_get_jobs_response) =
  assoc_to_yojson
    [
      ("Jobs", option_to_yojson job_list_to_yojson x.jobs);
      ("JobsNotFound", option_to_yojson job_name_list_to_yojson x.jobs_not_found);
    ]

let batch_get_jobs_request_to_yojson (x : batch_get_jobs_request) =
  assoc_to_yojson [ ("JobNames", Some (job_name_list_to_yojson x.job_names)) ]

let item_error_message_to_yojson = string_to_yojson
let item_error_code_to_yojson = string_to_yojson

let item_error_to_yojson (x : item_error) =
  assoc_to_yojson
    [
      ("ItemIdentifier", option_to_yojson item_identifier_to_yojson x.item_identifier);
      ("Code", option_to_yojson item_error_code_to_yojson x.code);
      ("Message", option_to_yojson item_error_message_to_yojson x.message);
    ]

let item_error_list_to_yojson tree = list_to_yojson item_error_to_yojson tree

let iterable_form_item_to_yojson (x : iterable_form_item) =
  assoc_to_yojson
    [
      ("ItemId", option_to_yojson item_id_to_yojson x.item_id);
      ("ItemName", option_to_yojson item_name_to_yojson x.item_name);
      ("GlossaryTerms", option_to_yojson glossary_term_id_list_to_yojson x.glossary_terms);
      ("Forms", option_to_yojson asset_form_map_to_yojson x.forms);
      ("Attachments", option_to_yojson asset_form_map_to_yojson x.attachments);
    ]

let iterable_form_item_list_to_yojson tree = list_to_yojson iterable_form_item_to_yojson tree

let batch_get_iterable_forms_response_to_yojson (x : batch_get_iterable_forms_response) =
  assoc_to_yojson
    [
      ("Items", option_to_yojson iterable_form_item_list_to_yojson x.items);
      ("Errors", option_to_yojson item_error_list_to_yojson x.errors);
    ]

let item_identifier_list_to_yojson tree = list_to_yojson item_identifier_to_yojson tree

let batch_get_iterable_forms_request_to_yojson (x : batch_get_iterable_forms_request) =
  assoc_to_yojson
    [
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
      ("IterableFormName", Some (iterable_form_name_to_yojson x.iterable_form_name));
      ("ItemIdentifiers", Some (item_identifier_list_to_yojson x.item_identifiers));
    ]

let dev_endpoint_names_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let batch_get_dev_endpoints_response_to_yojson (x : batch_get_dev_endpoints_response) =
  assoc_to_yojson
    [
      ("DevEndpoints", option_to_yojson dev_endpoint_list_to_yojson x.dev_endpoints);
      ( "DevEndpointsNotFound",
        option_to_yojson dev_endpoint_names_to_yojson x.dev_endpoints_not_found );
    ]

let batch_get_dev_endpoints_request_to_yojson (x : batch_get_dev_endpoints_request) =
  assoc_to_yojson [ ("DevEndpointNames", Some (dev_endpoint_names_to_yojson x.dev_endpoint_names)) ]

let data_quality_result_ids_to_yojson tree = list_to_yojson hash_string_to_yojson tree

let data_quality_result_to_yojson (x : data_quality_result) =
  assoc_to_yojson
    [
      ("ResultId", option_to_yojson hash_string_to_yojson x.result_id);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("Score", option_to_yojson generic_bounded_double_to_yojson x.score);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("RulesetName", option_to_yojson name_string_to_yojson x.ruleset_name);
      ("EvaluationContext", option_to_yojson generic_string_to_yojson x.evaluation_context);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
      ("RulesetEvaluationRunId", option_to_yojson hash_string_to_yojson x.ruleset_evaluation_run_id);
      ("RuleResults", option_to_yojson data_quality_rule_results_to_yojson x.rule_results);
      ( "AnalyzerResults",
        option_to_yojson data_quality_analyzer_results_to_yojson x.analyzer_results );
      ("Observations", option_to_yojson data_quality_observations_to_yojson x.observations);
      ( "AggregatedMetrics",
        option_to_yojson data_quality_aggregated_metrics_to_yojson x.aggregated_metrics );
    ]

let data_quality_results_list_to_yojson tree = list_to_yojson data_quality_result_to_yojson tree

let batch_get_data_quality_result_response_to_yojson (x : batch_get_data_quality_result_response) =
  assoc_to_yojson
    [
      ("Results", Some (data_quality_results_list_to_yojson x.results));
      ("ResultsNotFound", option_to_yojson data_quality_result_ids_to_yojson x.results_not_found);
    ]

let batch_get_data_quality_result_request_to_yojson (x : batch_get_data_quality_result_request) =
  assoc_to_yojson [ ("ResultIds", Some (data_quality_result_ids_to_yojson x.result_ids)) ]

let custom_entity_type_names_to_yojson tree = list_to_yojson name_string_to_yojson tree

let batch_get_custom_entity_types_response_to_yojson (x : batch_get_custom_entity_types_response) =
  assoc_to_yojson
    [
      ("CustomEntityTypes", option_to_yojson custom_entity_types_to_yojson x.custom_entity_types);
      ( "CustomEntityTypesNotFound",
        option_to_yojson custom_entity_type_names_to_yojson x.custom_entity_types_not_found );
    ]

let batch_get_custom_entity_types_request_to_yojson (x : batch_get_custom_entity_types_request) =
  assoc_to_yojson [ ("Names", Some (custom_entity_type_names_to_yojson x.names)) ]

let batch_get_crawlers_response_to_yojson (x : batch_get_crawlers_response) =
  assoc_to_yojson
    [
      ("Crawlers", option_to_yojson crawler_list_to_yojson x.crawlers);
      ("CrawlersNotFound", option_to_yojson crawler_name_list_to_yojson x.crawlers_not_found);
    ]

let batch_get_crawlers_request_to_yojson (x : batch_get_crawlers_request) =
  assoc_to_yojson [ ("CrawlerNames", Some (crawler_name_list_to_yojson x.crawler_names)) ]

let blueprints_to_yojson tree = list_to_yojson blueprint_to_yojson tree

let batch_get_blueprints_response_to_yojson (x : batch_get_blueprints_response) =
  assoc_to_yojson
    [
      ("Blueprints", option_to_yojson blueprints_to_yojson x.blueprints);
      ("MissingBlueprints", option_to_yojson blueprint_names_to_yojson x.missing_blueprints);
    ]

let batch_get_blueprint_names_to_yojson tree =
  list_to_yojson orchestration_name_string_to_yojson tree

let batch_get_blueprints_request_to_yojson (x : batch_get_blueprints_request) =
  assoc_to_yojson
    [
      ("Names", Some (batch_get_blueprint_names_to_yojson x.names));
      ("IncludeBlueprint", option_to_yojson nullable_boolean_to_yojson x.include_blueprint);
      ("IncludeParameterSpec", option_to_yojson nullable_boolean_to_yojson x.include_parameter_spec);
    ]

let table_version_error_to_yojson (x : table_version_error) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
      ("VersionId", option_to_yojson version_string_to_yojson x.version_id);
      ("ErrorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
    ]

let table_version_errors_to_yojson tree = list_to_yojson table_version_error_to_yojson tree

let batch_delete_table_version_response_to_yojson (x : batch_delete_table_version_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson table_version_errors_to_yojson x.errors) ]

let batch_delete_table_version_list_to_yojson tree = list_to_yojson version_string_to_yojson tree

let batch_delete_table_version_request_to_yojson (x : batch_delete_table_version_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("VersionIds", Some (batch_delete_table_version_list_to_yojson x.version_ids));
    ]

let table_error_to_yojson (x : table_error) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
      ("ErrorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
    ]

let table_errors_to_yojson tree = list_to_yojson table_error_to_yojson tree

let batch_delete_table_response_to_yojson (x : batch_delete_table_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson table_errors_to_yojson x.errors) ]

let batch_delete_table_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let batch_delete_table_request_to_yojson (x : batch_delete_table_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TablesToDelete", Some (batch_delete_table_name_list_to_yojson x.tables_to_delete));
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
    ]

let partition_error_to_yojson (x : partition_error) =
  assoc_to_yojson
    [
      ("PartitionValues", option_to_yojson value_string_list_to_yojson x.partition_values);
      ("ErrorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
    ]

let partition_errors_to_yojson tree = list_to_yojson partition_error_to_yojson tree

let batch_delete_partition_response_to_yojson (x : batch_delete_partition_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson partition_errors_to_yojson x.errors) ]

let batch_delete_partition_value_list_to_yojson tree =
  list_to_yojson partition_value_list_to_yojson tree

let batch_delete_partition_request_to_yojson (x : batch_delete_partition_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ( "PartitionsToDelete",
        Some (batch_delete_partition_value_list_to_yojson x.partitions_to_delete) );
    ]

let error_by_name_to_yojson tree = map_to_yojson name_string_to_yojson error_detail_to_yojson tree

let batch_delete_connection_response_to_yojson (x : batch_delete_connection_response) =
  assoc_to_yojson
    [
      ("Succeeded", option_to_yojson name_string_list_to_yojson x.succeeded);
      ("Errors", option_to_yojson error_by_name_to_yojson x.errors);
    ]

let delete_connection_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let batch_delete_connection_request_to_yojson (x : batch_delete_connection_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("ConnectionNameList", Some (delete_connection_name_list_to_yojson x.connection_name_list));
    ]

let batch_create_partition_response_to_yojson (x : batch_create_partition_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson partition_errors_to_yojson x.errors) ]

let partition_input_list_to_yojson tree = list_to_yojson partition_input_to_yojson tree

let batch_create_partition_request_to_yojson (x : batch_create_partition_request) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("PartitionInputList", Some (partition_input_list_to_yojson x.partition_input_list));
    ]

let associate_glossary_terms_response_to_yojson (x : associate_glossary_terms_response) =
  assoc_to_yojson
    [
      ("AssetIdentifier", option_to_yojson asset_id_to_yojson x.asset_identifier);
      ("GlossaryTerms", option_to_yojson glossary_term_id_list_to_yojson x.glossary_terms);
    ]

let associate_glossary_terms_request_to_yojson (x : associate_glossary_terms_request) =
  assoc_to_yojson
    [
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
      ("GlossaryTermIdentifiers", Some (glossary_term_id_list_to_yojson x.glossary_term_identifiers));
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]
