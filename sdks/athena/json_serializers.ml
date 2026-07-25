open Smaws_Lib.Json.SerializeHelpers
open Types

let s3_acl_option_to_yojson (x : s3_acl_option) =
  match x with BUCKET_OWNER_FULL_CONTROL -> `String "BUCKET_OWNER_FULL_CONTROL"

let acl_configuration_to_yojson (x : acl_configuration) =
  assoc_to_yojson [ ("S3AclOption", Some (s3_acl_option_to_yojson x.s3_acl_option)) ]

let age_to_yojson = int_to_yojson
let allocated_dpus_integer_to_yojson = int_to_yojson
let error_message_to_yojson = string_to_yojson
let error_code_to_yojson = string_to_yojson

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson
    [
      ("AthenaErrorCode", option_to_yojson error_code_to_yojson x.athena_error_code);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_work_group_output_to_yojson = unit_to_yojson

let work_group_state_to_yojson (x : work_group_state) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let parameters_map_value_to_yojson = string_to_yojson
let key_string_to_yojson = string_to_yojson

let parameters_map_to_yojson tree =
  map_to_yojson key_string_to_yojson parameters_map_value_to_yojson tree

let name_string_to_yojson = string_to_yojson

let classification_to_yojson (x : classification) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Properties", option_to_yojson parameters_map_to_yojson x.properties);
    ]

let classification_list_to_yojson tree = list_to_yojson classification_to_yojson tree
let default_executor_dpu_size_to_yojson = int_to_yojson
let max_concurrent_dpus_to_yojson = int_to_yojson
let coordinator_dpu_size_to_yojson = int_to_yojson

let engine_configuration_to_yojson (x : engine_configuration) =
  assoc_to_yojson
    [
      ("CoordinatorDpuSize", option_to_yojson coordinator_dpu_size_to_yojson x.coordinator_dpu_size);
      ("MaxConcurrentDpus", option_to_yojson max_concurrent_dpus_to_yojson x.max_concurrent_dpus);
      ( "DefaultExecutorDpuSize",
        option_to_yojson default_executor_dpu_size_to_yojson x.default_executor_dpu_size );
      ("AdditionalConfigs", option_to_yojson parameters_map_to_yojson x.additional_configs);
      ("SparkProperties", option_to_yojson parameters_map_to_yojson x.spark_properties);
      ("Classifications", option_to_yojson classification_list_to_yojson x.classifications);
    ]

let s3_output_location_to_yojson = string_to_yojson
let kms_key_to_yojson = string_to_yojson
let boxed_boolean_to_yojson = bool_to_yojson

let s3_logging_configuration_to_yojson (x : s3_logging_configuration) =
  assoc_to_yojson
    [
      ("Enabled", Some (boxed_boolean_to_yojson x.enabled));
      ("KmsKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("LogLocation", option_to_yojson s3_output_location_to_yojson x.log_location);
    ]

let managed_logging_configuration_to_yojson (x : managed_logging_configuration) =
  assoc_to_yojson
    [
      ("Enabled", Some (boxed_boolean_to_yojson x.enabled));
      ("KmsKey", option_to_yojson kms_key_to_yojson x.kms_key);
    ]

let log_type_value_to_yojson = string_to_yojson
let log_type_values_list_to_yojson tree = list_to_yojson log_type_value_to_yojson tree
let log_type_key_to_yojson = string_to_yojson

let log_types_map_to_yojson tree =
  map_to_yojson log_type_key_to_yojson log_type_values_list_to_yojson tree

let log_stream_name_prefix_to_yojson = string_to_yojson
let log_group_name_to_yojson = string_to_yojson

let cloud_watch_logging_configuration_to_yojson (x : cloud_watch_logging_configuration) =
  assoc_to_yojson
    [
      ("Enabled", Some (boxed_boolean_to_yojson x.enabled));
      ("LogGroup", option_to_yojson log_group_name_to_yojson x.log_group);
      ( "LogStreamNamePrefix",
        option_to_yojson log_stream_name_prefix_to_yojson x.log_stream_name_prefix );
      ("LogTypes", option_to_yojson log_types_map_to_yojson x.log_types);
    ]

let monitoring_configuration_to_yojson (x : monitoring_configuration) =
  assoc_to_yojson
    [
      ( "CloudWatchLoggingConfiguration",
        option_to_yojson cloud_watch_logging_configuration_to_yojson
          x.cloud_watch_logging_configuration );
      ( "ManagedLoggingConfiguration",
        option_to_yojson managed_logging_configuration_to_yojson x.managed_logging_configuration );
      ( "S3LoggingConfiguration",
        option_to_yojson s3_logging_configuration_to_yojson x.s3_logging_configuration );
    ]

let authentication_type_to_yojson (x : authentication_type) =
  match x with DIRECTORY_IDENTITY -> `String "DIRECTORY_IDENTITY"

let query_results_s3_access_grants_configuration_to_yojson
    (x : query_results_s3_access_grants_configuration) =
  assoc_to_yojson
    [
      ("EnableS3AccessGrants", Some (boxed_boolean_to_yojson x.enable_s3_access_grants));
      ("CreateUserLevelPrefix", option_to_yojson boxed_boolean_to_yojson x.create_user_level_prefix);
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
    ]

let customer_content_encryption_configuration_to_yojson
    (x : customer_content_encryption_configuration) =
  assoc_to_yojson [ ("KmsKey", Some (kms_key_to_yojson x.kms_key)) ]

let role_arn_to_yojson = string_to_yojson

let engine_version_to_yojson (x : engine_version) =
  assoc_to_yojson
    [
      ("SelectedEngineVersion", option_to_yojson name_string_to_yojson x.selected_engine_version);
      ("EffectiveEngineVersion", option_to_yojson name_string_to_yojson x.effective_engine_version);
    ]

let bytes_scanned_cutoff_value_to_yojson = long_to_yojson

let managed_query_results_encryption_configuration_to_yojson
    (x : managed_query_results_encryption_configuration) =
  assoc_to_yojson [ ("KmsKey", Some (kms_key_to_yojson x.kms_key)) ]

let managed_query_results_configuration_updates_to_yojson
    (x : managed_query_results_configuration_updates) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boxed_boolean_to_yojson x.enabled);
      ( "EncryptionConfiguration",
        option_to_yojson managed_query_results_encryption_configuration_to_yojson
          x.encryption_configuration );
      ( "RemoveEncryptionConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.remove_encryption_configuration );
    ]

let aws_account_id_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson

let encryption_option_to_yojson (x : encryption_option) =
  match x with
  | SSE_S3 -> `String "SSE_S3"
  | SSE_KMS -> `String "SSE_KMS"
  | CSE_KMS -> `String "CSE_KMS"

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("EncryptionOption", Some (encryption_option_to_yojson x.encryption_option));
      ("KmsKey", option_to_yojson string__to_yojson x.kms_key);
    ]

let result_output_location_to_yojson = string_to_yojson

let result_configuration_updates_to_yojson (x : result_configuration_updates) =
  assoc_to_yojson
    [
      ("OutputLocation", option_to_yojson result_output_location_to_yojson x.output_location);
      ("RemoveOutputLocation", option_to_yojson boxed_boolean_to_yojson x.remove_output_location);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "RemoveEncryptionConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.remove_encryption_configuration );
      ("ExpectedBucketOwner", option_to_yojson aws_account_id_to_yojson x.expected_bucket_owner);
      ( "RemoveExpectedBucketOwner",
        option_to_yojson boxed_boolean_to_yojson x.remove_expected_bucket_owner );
      ("AclConfiguration", option_to_yojson acl_configuration_to_yojson x.acl_configuration);
      ("RemoveAclConfiguration", option_to_yojson boxed_boolean_to_yojson x.remove_acl_configuration);
    ]

let work_group_configuration_updates_to_yojson (x : work_group_configuration_updates) =
  assoc_to_yojson
    [
      ( "EnforceWorkGroupConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.enforce_work_group_configuration );
      ( "ResultConfigurationUpdates",
        option_to_yojson result_configuration_updates_to_yojson x.result_configuration_updates );
      ( "ManagedQueryResultsConfigurationUpdates",
        option_to_yojson managed_query_results_configuration_updates_to_yojson
          x.managed_query_results_configuration_updates );
      ( "PublishCloudWatchMetricsEnabled",
        option_to_yojson boxed_boolean_to_yojson x.publish_cloud_watch_metrics_enabled );
      ( "BytesScannedCutoffPerQuery",
        option_to_yojson bytes_scanned_cutoff_value_to_yojson x.bytes_scanned_cutoff_per_query );
      ( "RemoveBytesScannedCutoffPerQuery",
        option_to_yojson boxed_boolean_to_yojson x.remove_bytes_scanned_cutoff_per_query );
      ("RequesterPaysEnabled", option_to_yojson boxed_boolean_to_yojson x.requester_pays_enabled);
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ( "RemoveCustomerContentEncryptionConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.remove_customer_content_encryption_configuration
      );
      ("AdditionalConfiguration", option_to_yojson name_string_to_yojson x.additional_configuration);
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ( "CustomerContentEncryptionConfiguration",
        option_to_yojson customer_content_encryption_configuration_to_yojson
          x.customer_content_encryption_configuration );
      ( "EnableMinimumEncryptionConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.enable_minimum_encryption_configuration );
      ( "QueryResultsS3AccessGrantsConfiguration",
        option_to_yojson query_results_s3_access_grants_configuration_to_yojson
          x.query_results_s3_access_grants_configuration );
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ("EngineConfiguration", option_to_yojson engine_configuration_to_yojson x.engine_configuration);
    ]

let work_group_description_string_to_yojson = string_to_yojson
let work_group_name_to_yojson = string_to_yojson

let update_work_group_input_to_yojson (x : update_work_group_input) =
  assoc_to_yojson
    [
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("Description", option_to_yojson work_group_description_string_to_yojson x.description);
      ( "ConfigurationUpdates",
        option_to_yojson work_group_configuration_updates_to_yojson x.configuration_updates );
      ("State", option_to_yojson work_group_state_to_yojson x.state);
    ]

let amazon_resource_name_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ResourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let update_prepared_statement_output_to_yojson = unit_to_yojson
let description_string_to_yojson = string_to_yojson
let query_string_to_yojson = string_to_yojson
let statement_name_to_yojson = string_to_yojson

let update_prepared_statement_input_to_yojson (x : update_prepared_statement_input) =
  assoc_to_yojson
    [
      ("StatementName", Some (statement_name_to_yojson x.statement_name));
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("QueryStatement", Some (query_string_to_yojson x.query_statement));
      ("Description", option_to_yojson description_string_to_yojson x.description);
    ]

let throttle_reason_to_yojson (x : throttle_reason) =
  match x with CONCURRENT_QUERY_LIMIT_EXCEEDED -> `String "CONCURRENT_QUERY_LIMIT_EXCEEDED"

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Reason", option_to_yojson throttle_reason_to_yojson x.reason);
    ]

let update_notebook_metadata_output_to_yojson = unit_to_yojson
let notebook_name_to_yojson = string_to_yojson
let client_request_token_to_yojson = string_to_yojson
let notebook_id_to_yojson = string_to_yojson

let update_notebook_metadata_input_to_yojson (x : update_notebook_metadata_input) =
  assoc_to_yojson
    [
      ("NotebookId", Some (notebook_id_to_yojson x.notebook_id));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("Name", Some (notebook_name_to_yojson x.name));
    ]

let update_notebook_output_to_yojson = unit_to_yojson
let session_id_to_yojson = string_to_yojson
let notebook_type_to_yojson (x : notebook_type) = match x with IPYNB -> `String "IPYNB"
let payload_to_yojson = string_to_yojson

let update_notebook_input_to_yojson (x : update_notebook_input) =
  assoc_to_yojson
    [
      ("NotebookId", Some (notebook_id_to_yojson x.notebook_id));
      ("Payload", Some (payload_to_yojson x.payload));
      ("Type", Some (notebook_type_to_yojson x.type_));
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
    ]

let update_named_query_output_to_yojson = unit_to_yojson
let named_query_description_string_to_yojson = string_to_yojson
let named_query_id_to_yojson = string_to_yojson

let update_named_query_input_to_yojson (x : update_named_query_input) =
  assoc_to_yojson
    [
      ("NamedQueryId", Some (named_query_id_to_yojson x.named_query_id));
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson named_query_description_string_to_yojson x.description);
      ("QueryString", Some (query_string_to_yojson x.query_string));
    ]

let update_data_catalog_output_to_yojson = unit_to_yojson

let data_catalog_type_to_yojson (x : data_catalog_type) =
  match x with
  | LAMBDA -> `String "LAMBDA"
  | GLUE -> `String "GLUE"
  | HIVE -> `String "HIVE"
  | FEDERATED -> `String "FEDERATED"

let catalog_name_string_to_yojson = string_to_yojson

let update_data_catalog_input_to_yojson (x : update_data_catalog_input) =
  assoc_to_yojson
    [
      ("Name", Some (catalog_name_string_to_yojson x.name));
      ("Type", Some (data_catalog_type_to_yojson x.type_));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
    ]

let update_capacity_reservation_output_to_yojson = unit_to_yojson
let capacity_reservation_name_to_yojson = string_to_yojson
let target_dpus_integer_to_yojson = int_to_yojson

let update_capacity_reservation_input_to_yojson (x : update_capacity_reservation_input) =
  assoc_to_yojson
    [
      ("TargetDpus", Some (target_dpus_integer_to_yojson x.target_dpus));
      ("Name", Some (capacity_reservation_name_to_yojson x.name));
    ]

let untag_resource_output_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let session_state_to_yojson (x : session_state) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | IDLE -> `String "IDLE"
  | BUSY -> `String "BUSY"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"
  | DEGRADED -> `String "DEGRADED"
  | FAILED -> `String "FAILED"

let terminate_session_response_to_yojson (x : terminate_session_response) =
  assoc_to_yojson [ ("State", option_to_yojson session_state_to_yojson x.state) ]

let terminate_session_request_to_yojson (x : terminate_session_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let tag_resource_output_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_to_yojson x.key);
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let stop_query_execution_output_to_yojson = unit_to_yojson
let query_execution_id_to_yojson = string_to_yojson

let stop_query_execution_input_to_yojson (x : stop_query_execution_input) =
  assoc_to_yojson [ ("QueryExecutionId", Some (query_execution_id_to_yojson x.query_execution_id)) ]

let calculation_execution_state_to_yojson (x : calculation_execution_state) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | QUEUED -> `String "QUEUED"
  | RUNNING -> `String "RUNNING"
  | CANCELING -> `String "CANCELING"
  | CANCELED -> `String "CANCELED"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let stop_calculation_execution_response_to_yojson (x : stop_calculation_execution_response) =
  assoc_to_yojson [ ("State", option_to_yojson calculation_execution_state_to_yojson x.state) ]

let calculation_execution_id_to_yojson = string_to_yojson

let stop_calculation_execution_request_to_yojson (x : stop_calculation_execution_request) =
  assoc_to_yojson
    [
      ( "CalculationExecutionId",
        Some (calculation_execution_id_to_yojson x.calculation_execution_id) );
    ]

let session_already_exists_exception_to_yojson (x : session_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let start_session_response_to_yojson (x : start_session_response) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("State", option_to_yojson session_state_to_yojson x.state);
    ]

let idempotency_token_to_yojson = string_to_yojson
let session_idle_timeout_in_minutes_to_yojson = int_to_yojson

let start_session_request_to_yojson (x : start_session_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("EngineConfiguration", Some (engine_configuration_to_yojson x.engine_configuration));
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ("NotebookVersion", option_to_yojson name_string_to_yojson x.notebook_version);
      ( "SessionIdleTimeoutInMinutes",
        option_to_yojson session_idle_timeout_in_minutes_to_yojson x.session_idle_timeout_in_minutes
      );
      ("ClientRequestToken", option_to_yojson idempotency_token_to_yojson x.client_request_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CopyWorkGroupTags", option_to_yojson boxed_boolean_to_yojson x.copy_work_group_tags);
    ]

let start_query_execution_output_to_yojson (x : start_query_execution_output) =
  assoc_to_yojson
    [ ("QueryExecutionId", option_to_yojson query_execution_id_to_yojson x.query_execution_id) ]

let boolean__to_yojson = bool_to_yojson

let result_reuse_by_age_configuration_to_yojson (x : result_reuse_by_age_configuration) =
  assoc_to_yojson
    [
      ("Enabled", Some (boolean__to_yojson x.enabled));
      ("MaxAgeInMinutes", option_to_yojson age_to_yojson x.max_age_in_minutes);
    ]

let result_reuse_configuration_to_yojson (x : result_reuse_configuration) =
  assoc_to_yojson
    [
      ( "ResultReuseByAgeConfiguration",
        option_to_yojson result_reuse_by_age_configuration_to_yojson
          x.result_reuse_by_age_configuration );
    ]

let execution_parameter_to_yojson = string_to_yojson
let execution_parameters_to_yojson tree = list_to_yojson execution_parameter_to_yojson tree

let result_configuration_to_yojson (x : result_configuration) =
  assoc_to_yojson
    [
      ("OutputLocation", option_to_yojson result_output_location_to_yojson x.output_location);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("ExpectedBucketOwner", option_to_yojson aws_account_id_to_yojson x.expected_bucket_owner);
      ("AclConfiguration", option_to_yojson acl_configuration_to_yojson x.acl_configuration);
    ]

let database_string_to_yojson = string_to_yojson

let query_execution_context_to_yojson (x : query_execution_context) =
  assoc_to_yojson
    [
      ("Database", option_to_yojson database_string_to_yojson x.database);
      ("Catalog", option_to_yojson catalog_name_string_to_yojson x.catalog);
    ]

let start_query_execution_input_to_yojson (x : start_query_execution_input) =
  assoc_to_yojson
    [
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ( "ClientRequestToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "QueryExecutionContext",
        option_to_yojson query_execution_context_to_yojson x.query_execution_context );
      ("ResultConfiguration", option_to_yojson result_configuration_to_yojson x.result_configuration);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("ExecutionParameters", option_to_yojson execution_parameters_to_yojson x.execution_parameters);
      ( "ResultReuseConfiguration",
        option_to_yojson result_reuse_configuration_to_yojson x.result_reuse_configuration );
      ("EngineConfiguration", option_to_yojson engine_configuration_to_yojson x.engine_configuration);
    ]

let start_calculation_execution_response_to_yojson (x : start_calculation_execution_response) =
  assoc_to_yojson
    [
      ( "CalculationExecutionId",
        option_to_yojson calculation_execution_id_to_yojson x.calculation_execution_id );
      ("State", option_to_yojson calculation_execution_state_to_yojson x.state);
    ]

let code_block_to_yojson = string_to_yojson

let calculation_configuration_to_yojson (x : calculation_configuration) =
  assoc_to_yojson [ ("CodeBlock", option_to_yojson code_block_to_yojson x.code_block) ]

let start_calculation_execution_request_to_yojson (x : start_calculation_execution_request) =
  assoc_to_yojson
    [
      ("SessionId", Some (session_id_to_yojson x.session_id));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ( "CalculationConfiguration",
        option_to_yojson calculation_configuration_to_yojson x.calculation_configuration );
      ("CodeBlock", option_to_yojson code_block_to_yojson x.code_block);
      ("ClientRequestToken", option_to_yojson idempotency_token_to_yojson x.client_request_token);
    ]

let put_capacity_assignment_configuration_output_to_yojson = unit_to_yojson
let work_group_names_list_to_yojson tree = list_to_yojson work_group_name_to_yojson tree

let capacity_assignment_to_yojson (x : capacity_assignment) =
  assoc_to_yojson
    [ ("WorkGroupNames", option_to_yojson work_group_names_list_to_yojson x.work_group_names) ]

let capacity_assignments_list_to_yojson tree = list_to_yojson capacity_assignment_to_yojson tree

let put_capacity_assignment_configuration_input_to_yojson
    (x : put_capacity_assignment_configuration_input) =
  assoc_to_yojson
    [
      ( "CapacityReservationName",
        Some (capacity_reservation_name_to_yojson x.capacity_reservation_name) );
      ("CapacityAssignments", Some (capacity_assignments_list_to_yojson x.capacity_assignments));
    ]

let token_to_yojson = string_to_yojson
let identity_center_application_arn_to_yojson = string_to_yojson
let date_to_yojson = timestamp_epoch_seconds_to_yojson

let work_group_summary_to_yojson (x : work_group_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson work_group_name_to_yojson x.name);
      ("State", option_to_yojson work_group_state_to_yojson x.state);
      ("Description", option_to_yojson work_group_description_string_to_yojson x.description);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ( "IdentityCenterApplicationArn",
        option_to_yojson identity_center_application_arn_to_yojson x.identity_center_application_arn
      );
    ]

let work_groups_list_to_yojson tree = list_to_yojson work_group_summary_to_yojson tree

let list_work_groups_output_to_yojson (x : list_work_groups_output) =
  assoc_to_yojson
    [
      ("WorkGroups", option_to_yojson work_groups_list_to_yojson x.work_groups);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_work_groups_count_to_yojson = int_to_yojson

let list_work_groups_input_to_yojson (x : list_work_groups_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_work_groups_count_to_yojson x.max_results);
    ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_tags_count_to_yojson = int_to_yojson

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_tags_count_to_yojson x.max_results);
    ]

let metadata_exception_to_yojson (x : metadata_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let comment_string_to_yojson = string_to_yojson
let type_string_to_yojson = string_to_yojson

let column_to_yojson (x : column) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Type", option_to_yojson type_string_to_yojson x.type_);
      ("Comment", option_to_yojson comment_string_to_yojson x.comment);
    ]

let column_list_to_yojson tree = list_to_yojson column_to_yojson tree
let table_type_string_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let table_metadata_to_yojson (x : table_metadata) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("LastAccessTime", option_to_yojson timestamp_to_yojson x.last_access_time);
      ("TableType", option_to_yojson table_type_string_to_yojson x.table_type);
      ("Columns", option_to_yojson column_list_to_yojson x.columns);
      ("PartitionKeys", option_to_yojson column_list_to_yojson x.partition_keys);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
    ]

let table_metadata_list_to_yojson tree = list_to_yojson table_metadata_to_yojson tree

let list_table_metadata_output_to_yojson (x : list_table_metadata_output) =
  assoc_to_yojson
    [
      ("TableMetadataList", option_to_yojson table_metadata_list_to_yojson x.table_metadata_list);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_table_metadata_count_to_yojson = int_to_yojson
let expression_string_to_yojson = string_to_yojson

let list_table_metadata_input_to_yojson (x : list_table_metadata_input) =
  assoc_to_yojson
    [
      ("CatalogName", Some (catalog_name_string_to_yojson x.catalog_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("Expression", option_to_yojson expression_string_to_yojson x.expression);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_table_metadata_count_to_yojson x.max_results);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
    ]

let session_status_to_yojson (x : session_status) =
  assoc_to_yojson
    [
      ("StartDateTime", option_to_yojson date_to_yojson x.start_date_time);
      ("LastModifiedDateTime", option_to_yojson date_to_yojson x.last_modified_date_time);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("IdleSinceDateTime", option_to_yojson date_to_yojson x.idle_since_date_time);
      ("State", option_to_yojson session_state_to_yojson x.state);
      ("StateChangeReason", option_to_yojson description_string_to_yojson x.state_change_reason);
    ]

let session_summary_to_yojson (x : session_summary) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ("NotebookVersion", option_to_yojson name_string_to_yojson x.notebook_version);
      ("Status", option_to_yojson session_status_to_yojson x.status);
    ]

let sessions_list_to_yojson tree = list_to_yojson session_summary_to_yojson tree
let session_manager_token_to_yojson = string_to_yojson

let list_sessions_response_to_yojson (x : list_sessions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
      ("Sessions", option_to_yojson sessions_list_to_yojson x.sessions);
    ]

let max_sessions_count_to_yojson = int_to_yojson

let list_sessions_request_to_yojson (x : list_sessions_request) =
  assoc_to_yojson
    [
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("StateFilter", option_to_yojson session_state_to_yojson x.state_filter);
      ("MaxResults", option_to_yojson max_sessions_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
    ]

let query_execution_id_list_to_yojson tree = list_to_yojson query_execution_id_to_yojson tree

let list_query_executions_output_to_yojson (x : list_query_executions_output) =
  assoc_to_yojson
    [
      ("QueryExecutionIds", option_to_yojson query_execution_id_list_to_yojson x.query_execution_ids);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_query_executions_count_to_yojson = int_to_yojson

let list_query_executions_input_to_yojson (x : list_query_executions_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_query_executions_count_to_yojson x.max_results);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
    ]

let prepared_statement_summary_to_yojson (x : prepared_statement_summary) =
  assoc_to_yojson
    [
      ("StatementName", option_to_yojson statement_name_to_yojson x.statement_name);
      ("LastModifiedTime", option_to_yojson date_to_yojson x.last_modified_time);
    ]

let prepared_statements_list_to_yojson tree =
  list_to_yojson prepared_statement_summary_to_yojson tree

let list_prepared_statements_output_to_yojson (x : list_prepared_statements_output) =
  assoc_to_yojson
    [
      ( "PreparedStatements",
        option_to_yojson prepared_statements_list_to_yojson x.prepared_statements );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_prepared_statements_count_to_yojson = int_to_yojson

let list_prepared_statements_input_to_yojson (x : list_prepared_statements_input) =
  assoc_to_yojson
    [
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_prepared_statements_count_to_yojson x.max_results);
    ]

let notebook_session_summary_to_yojson (x : notebook_session_summary) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
    ]

let notebook_sessions_list_to_yojson tree = list_to_yojson notebook_session_summary_to_yojson tree

let list_notebook_sessions_response_to_yojson (x : list_notebook_sessions_response) =
  assoc_to_yojson
    [
      ("NotebookSessionsList", Some (notebook_sessions_list_to_yojson x.notebook_sessions_list));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_notebook_sessions_request_to_yojson (x : list_notebook_sessions_request) =
  assoc_to_yojson
    [
      ("NotebookId", Some (notebook_id_to_yojson x.notebook_id));
      ("MaxResults", option_to_yojson max_sessions_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let notebook_metadata_to_yojson (x : notebook_metadata) =
  assoc_to_yojson
    [
      ("NotebookId", option_to_yojson notebook_id_to_yojson x.notebook_id);
      ("Name", option_to_yojson notebook_name_to_yojson x.name);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("Type", option_to_yojson notebook_type_to_yojson x.type_);
      ("LastModifiedTime", option_to_yojson date_to_yojson x.last_modified_time);
    ]

let notebook_metadata_array_to_yojson tree = list_to_yojson notebook_metadata_to_yojson tree

let list_notebook_metadata_output_to_yojson (x : list_notebook_metadata_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "NotebookMetadataList",
        option_to_yojson notebook_metadata_array_to_yojson x.notebook_metadata_list );
    ]

let max_notebooks_count_to_yojson = int_to_yojson

let filter_definition_to_yojson (x : filter_definition) =
  assoc_to_yojson [ ("Name", option_to_yojson notebook_name_to_yojson x.name) ]

let list_notebook_metadata_input_to_yojson (x : list_notebook_metadata_input) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_definition_to_yojson x.filters);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_notebooks_count_to_yojson x.max_results);
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
    ]

let named_query_id_list_to_yojson tree = list_to_yojson named_query_id_to_yojson tree

let list_named_queries_output_to_yojson (x : list_named_queries_output) =
  assoc_to_yojson
    [
      ("NamedQueryIds", option_to_yojson named_query_id_list_to_yojson x.named_query_ids);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_named_queries_count_to_yojson = int_to_yojson

let list_named_queries_input_to_yojson (x : list_named_queries_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_named_queries_count_to_yojson x.max_results);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
    ]

let long_to_yojson = long_to_yojson

let executor_state_to_yojson (x : executor_state) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | REGISTERED -> `String "REGISTERED"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"
  | FAILED -> `String "FAILED"

let executor_type_to_yojson (x : executor_type) =
  match x with
  | COORDINATOR -> `String "COORDINATOR"
  | GATEWAY -> `String "GATEWAY"
  | WORKER -> `String "WORKER"

let executor_id_to_yojson = string_to_yojson

let executors_summary_to_yojson (x : executors_summary) =
  assoc_to_yojson
    [
      ("ExecutorId", Some (executor_id_to_yojson x.executor_id));
      ("ExecutorType", option_to_yojson executor_type_to_yojson x.executor_type);
      ("StartDateTime", option_to_yojson long_to_yojson x.start_date_time);
      ("TerminationDateTime", option_to_yojson long_to_yojson x.termination_date_time);
      ("ExecutorState", option_to_yojson executor_state_to_yojson x.executor_state);
      ("ExecutorSize", option_to_yojson long_to_yojson x.executor_size);
    ]

let executors_summary_list_to_yojson tree = list_to_yojson executors_summary_to_yojson tree

let list_executors_response_to_yojson (x : list_executors_response) =
  assoc_to_yojson
    [
      ("SessionId", Some (session_id_to_yojson x.session_id));
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
      ("ExecutorsSummary", option_to_yojson executors_summary_list_to_yojson x.executors_summary);
    ]

let max_list_executors_count_to_yojson = int_to_yojson

let list_executors_request_to_yojson (x : list_executors_request) =
  assoc_to_yojson
    [
      ("SessionId", Some (session_id_to_yojson x.session_id));
      ("ExecutorStateFilter", option_to_yojson executor_state_to_yojson x.executor_state_filter);
      ("MaxResults", option_to_yojson max_list_executors_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
    ]

let engine_versions_list_to_yojson tree = list_to_yojson engine_version_to_yojson tree

let list_engine_versions_output_to_yojson (x : list_engine_versions_output) =
  assoc_to_yojson
    [
      ("EngineVersions", option_to_yojson engine_versions_list_to_yojson x.engine_versions);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_engine_versions_count_to_yojson = int_to_yojson

let list_engine_versions_input_to_yojson (x : list_engine_versions_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_engine_versions_count_to_yojson x.max_results);
    ]

let connection_type_to_yojson (x : connection_type) =
  match x with
  | DYNAMODB -> `String "DYNAMODB"
  | MYSQL -> `String "MYSQL"
  | POSTGRESQL -> `String "POSTGRESQL"
  | REDSHIFT -> `String "REDSHIFT"
  | ORACLE -> `String "ORACLE"
  | SYNAPSE -> `String "SYNAPSE"
  | SQLSERVER -> `String "SQLSERVER"
  | DB2 -> `String "DB2"
  | OPENSEARCH -> `String "OPENSEARCH"
  | BIGQUERY -> `String "BIGQUERY"
  | GOOGLECLOUDSTORAGE -> `String "GOOGLECLOUDSTORAGE"
  | HBASE -> `String "HBASE"
  | DOCUMENTDB -> `String "DOCUMENTDB"
  | CMDB -> `String "CMDB"
  | TPCDS -> `String "TPCDS"
  | TIMESTREAM -> `String "TIMESTREAM"
  | SAPHANA -> `String "SAPHANA"
  | SNOWFLAKE -> `String "SNOWFLAKE"
  | DATALAKEGEN2 -> `String "DATALAKEGEN2"
  | DB2AS400 -> `String "DB2AS400"

let data_catalog_status_to_yojson (x : data_catalog_status) =
  match x with
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_COMPLETE -> `String "CREATE_COMPLETE"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATE_FAILED_CLEANUP_IN_PROGRESS -> `String "CREATE_FAILED_CLEANUP_IN_PROGRESS"
  | CREATE_FAILED_CLEANUP_COMPLETE -> `String "CREATE_FAILED_CLEANUP_COMPLETE"
  | CREATE_FAILED_CLEANUP_FAILED -> `String "CREATE_FAILED_CLEANUP_FAILED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_COMPLETE -> `String "DELETE_COMPLETE"
  | DELETE_FAILED -> `String "DELETE_FAILED"

let data_catalog_summary_to_yojson (x : data_catalog_summary) =
  assoc_to_yojson
    [
      ("CatalogName", option_to_yojson catalog_name_string_to_yojson x.catalog_name);
      ("Type", option_to_yojson data_catalog_type_to_yojson x.type_);
      ("Status", option_to_yojson data_catalog_status_to_yojson x.status);
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("Error", option_to_yojson error_message_to_yojson x.error);
    ]

let data_catalog_summary_list_to_yojson tree = list_to_yojson data_catalog_summary_to_yojson tree

let list_data_catalogs_output_to_yojson (x : list_data_catalogs_output) =
  assoc_to_yojson
    [
      ( "DataCatalogsSummary",
        option_to_yojson data_catalog_summary_list_to_yojson x.data_catalogs_summary );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_data_catalogs_count_to_yojson = int_to_yojson

let list_data_catalogs_input_to_yojson (x : list_data_catalogs_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_data_catalogs_count_to_yojson x.max_results);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
    ]

let database_to_yojson (x : database) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
    ]

let database_list_to_yojson tree = list_to_yojson database_to_yojson tree

let list_databases_output_to_yojson (x : list_databases_output) =
  assoc_to_yojson
    [
      ("DatabaseList", option_to_yojson database_list_to_yojson x.database_list);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_databases_count_to_yojson = int_to_yojson

let list_databases_input_to_yojson (x : list_databases_input) =
  assoc_to_yojson
    [
      ("CatalogName", Some (catalog_name_string_to_yojson x.catalog_name));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_databases_count_to_yojson x.max_results);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
    ]

let capacity_allocation_status_to_yojson (x : capacity_allocation_status) =
  match x with
  | PENDING -> `String "PENDING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let capacity_allocation_to_yojson (x : capacity_allocation) =
  assoc_to_yojson
    [
      ("Status", Some (capacity_allocation_status_to_yojson x.status));
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("RequestTime", Some (timestamp_to_yojson x.request_time));
      ("RequestCompletionTime", option_to_yojson timestamp_to_yojson x.request_completion_time);
    ]

let capacity_reservation_status_to_yojson (x : capacity_reservation_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | CANCELLING -> `String "CANCELLING"
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"
  | UPDATE_PENDING -> `String "UPDATE_PENDING"

let capacity_reservation_to_yojson (x : capacity_reservation) =
  assoc_to_yojson
    [
      ("Name", Some (capacity_reservation_name_to_yojson x.name));
      ("Status", Some (capacity_reservation_status_to_yojson x.status));
      ("TargetDpus", Some (target_dpus_integer_to_yojson x.target_dpus));
      ("AllocatedDpus", Some (allocated_dpus_integer_to_yojson x.allocated_dpus));
      ("LastAllocation", option_to_yojson capacity_allocation_to_yojson x.last_allocation);
      ( "LastSuccessfulAllocationTime",
        option_to_yojson timestamp_to_yojson x.last_successful_allocation_time );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
    ]

let capacity_reservations_list_to_yojson tree = list_to_yojson capacity_reservation_to_yojson tree

let list_capacity_reservations_output_to_yojson (x : list_capacity_reservations_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("CapacityReservations", Some (capacity_reservations_list_to_yojson x.capacity_reservations));
    ]

let max_capacity_reservations_count_to_yojson = int_to_yojson

let list_capacity_reservations_input_to_yojson (x : list_capacity_reservations_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_capacity_reservations_count_to_yojson x.max_results);
    ]

let calculation_status_to_yojson (x : calculation_status) =
  assoc_to_yojson
    [
      ("SubmissionDateTime", option_to_yojson date_to_yojson x.submission_date_time);
      ("CompletionDateTime", option_to_yojson date_to_yojson x.completion_date_time);
      ("State", option_to_yojson calculation_execution_state_to_yojson x.state);
      ("StateChangeReason", option_to_yojson description_string_to_yojson x.state_change_reason);
    ]

let calculation_summary_to_yojson (x : calculation_summary) =
  assoc_to_yojson
    [
      ( "CalculationExecutionId",
        option_to_yojson calculation_execution_id_to_yojson x.calculation_execution_id );
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Status", option_to_yojson calculation_status_to_yojson x.status);
    ]

let calculations_list_to_yojson tree = list_to_yojson calculation_summary_to_yojson tree

let list_calculation_executions_response_to_yojson (x : list_calculation_executions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
      ("Calculations", option_to_yojson calculations_list_to_yojson x.calculations);
    ]

let max_calculations_count_to_yojson = int_to_yojson

let list_calculation_executions_request_to_yojson (x : list_calculation_executions_request) =
  assoc_to_yojson
    [
      ("SessionId", Some (session_id_to_yojson x.session_id));
      ("StateFilter", option_to_yojson calculation_execution_state_to_yojson x.state_filter);
      ("MaxResults", option_to_yojson max_calculations_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
    ]

let integer_to_yojson = int_to_yojson
let supported_dpu_size_list_to_yojson tree = list_to_yojson integer_to_yojson tree

let application_dpu_sizes_to_yojson (x : application_dpu_sizes) =
  assoc_to_yojson
    [
      ("ApplicationRuntimeId", option_to_yojson name_string_to_yojson x.application_runtime_id);
      ("SupportedDPUSizes", option_to_yojson supported_dpu_size_list_to_yojson x.supported_dpu_sizes);
    ]

let application_dpu_sizes_list_to_yojson tree = list_to_yojson application_dpu_sizes_to_yojson tree

let list_application_dpu_sizes_output_to_yojson (x : list_application_dpu_sizes_output) =
  assoc_to_yojson
    [
      ( "ApplicationDPUSizes",
        option_to_yojson application_dpu_sizes_list_to_yojson x.application_dpu_sizes );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_application_dpu_sizes_count_to_yojson = int_to_yojson

let list_application_dpu_sizes_input_to_yojson (x : list_application_dpu_sizes_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_application_dpu_sizes_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let import_notebook_output_to_yojson (x : import_notebook_output) =
  assoc_to_yojson [ ("NotebookId", option_to_yojson notebook_id_to_yojson x.notebook_id) ]

let s3_uri_to_yojson = string_to_yojson

let import_notebook_input_to_yojson (x : import_notebook_input) =
  assoc_to_yojson
    [
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("Name", Some (notebook_name_to_yojson x.name));
      ("Payload", option_to_yojson payload_to_yojson x.payload);
      ("Type", Some (notebook_type_to_yojson x.type_));
      ("NotebookS3LocationUri", option_to_yojson s3_uri_to_yojson x.notebook_s3_location_uri);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
    ]

let identity_center_instance_arn_to_yojson = string_to_yojson

let identity_center_configuration_to_yojson (x : identity_center_configuration) =
  assoc_to_yojson
    [
      ("EnableIdentityCenter", option_to_yojson boxed_boolean_to_yojson x.enable_identity_center);
      ( "IdentityCenterInstanceArn",
        option_to_yojson identity_center_instance_arn_to_yojson x.identity_center_instance_arn );
    ]

let managed_query_results_configuration_to_yojson (x : managed_query_results_configuration) =
  assoc_to_yojson
    [
      ("Enabled", Some (boolean__to_yojson x.enabled));
      ( "EncryptionConfiguration",
        option_to_yojson managed_query_results_encryption_configuration_to_yojson
          x.encryption_configuration );
    ]

let work_group_configuration_to_yojson (x : work_group_configuration) =
  assoc_to_yojson
    [
      ("ResultConfiguration", option_to_yojson result_configuration_to_yojson x.result_configuration);
      ( "ManagedQueryResultsConfiguration",
        option_to_yojson managed_query_results_configuration_to_yojson
          x.managed_query_results_configuration );
      ( "EnforceWorkGroupConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.enforce_work_group_configuration );
      ( "PublishCloudWatchMetricsEnabled",
        option_to_yojson boxed_boolean_to_yojson x.publish_cloud_watch_metrics_enabled );
      ( "BytesScannedCutoffPerQuery",
        option_to_yojson bytes_scanned_cutoff_value_to_yojson x.bytes_scanned_cutoff_per_query );
      ("RequesterPaysEnabled", option_to_yojson boxed_boolean_to_yojson x.requester_pays_enabled);
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ("AdditionalConfiguration", option_to_yojson name_string_to_yojson x.additional_configuration);
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ("EngineConfiguration", option_to_yojson engine_configuration_to_yojson x.engine_configuration);
      ( "CustomerContentEncryptionConfiguration",
        option_to_yojson customer_content_encryption_configuration_to_yojson
          x.customer_content_encryption_configuration );
      ( "EnableMinimumEncryptionConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.enable_minimum_encryption_configuration );
      ( "IdentityCenterConfiguration",
        option_to_yojson identity_center_configuration_to_yojson x.identity_center_configuration );
      ( "QueryResultsS3AccessGrantsConfiguration",
        option_to_yojson query_results_s3_access_grants_configuration_to_yojson
          x.query_results_s3_access_grants_configuration );
    ]

let work_group_to_yojson (x : work_group) =
  assoc_to_yojson
    [
      ("Name", Some (work_group_name_to_yojson x.name));
      ("State", option_to_yojson work_group_state_to_yojson x.state);
      ("Configuration", option_to_yojson work_group_configuration_to_yojson x.configuration);
      ("Description", option_to_yojson work_group_description_string_to_yojson x.description);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ( "IdentityCenterApplicationArn",
        option_to_yojson identity_center_application_arn_to_yojson x.identity_center_application_arn
      );
    ]

let get_work_group_output_to_yojson (x : get_work_group_output) =
  assoc_to_yojson [ ("WorkGroup", option_to_yojson work_group_to_yojson x.work_group) ]

let get_work_group_input_to_yojson (x : get_work_group_input) =
  assoc_to_yojson [ ("WorkGroup", Some (work_group_name_to_yojson x.work_group)) ]

let get_table_metadata_output_to_yojson (x : get_table_metadata_output) =
  assoc_to_yojson [ ("TableMetadata", option_to_yojson table_metadata_to_yojson x.table_metadata) ]

let get_table_metadata_input_to_yojson (x : get_table_metadata_input) =
  assoc_to_yojson
    [
      ("CatalogName", Some (catalog_name_string_to_yojson x.catalog_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
    ]

let get_session_status_response_to_yojson (x : get_session_status_response) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("Status", option_to_yojson session_status_to_yojson x.status);
    ]

let get_session_status_request_to_yojson (x : get_session_status_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let get_session_endpoint_response_to_yojson (x : get_session_endpoint_response) =
  assoc_to_yojson
    [
      ("EndpointUrl", Some (string__to_yojson x.endpoint_url));
      ("AuthToken", Some (string__to_yojson x.auth_token));
      ("AuthTokenExpirationTime", Some (timestamp_to_yojson x.auth_token_expiration_time));
    ]

let get_session_endpoint_request_to_yojson (x : get_session_endpoint_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let session_statistics_to_yojson (x : session_statistics) =
  assoc_to_yojson
    [ ("DpuExecutionInMillis", option_to_yojson long_to_yojson x.dpu_execution_in_millis) ]

let session_configuration_to_yojson (x : session_configuration) =
  assoc_to_yojson
    [
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ("WorkingDirectory", option_to_yojson result_output_location_to_yojson x.working_directory);
      ("IdleTimeoutSeconds", option_to_yojson long_to_yojson x.idle_timeout_seconds);
      ( "SessionIdleTimeoutInMinutes",
        option_to_yojson session_idle_timeout_in_minutes_to_yojson x.session_idle_timeout_in_minutes
      );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let get_session_response_to_yojson (x : get_session_response) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("EngineVersion", option_to_yojson name_string_to_yojson x.engine_version);
      ("EngineConfiguration", option_to_yojson engine_configuration_to_yojson x.engine_configuration);
      ("NotebookVersion", option_to_yojson name_string_to_yojson x.notebook_version);
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ( "SessionConfiguration",
        option_to_yojson session_configuration_to_yojson x.session_configuration );
      ("Status", option_to_yojson session_status_to_yojson x.status);
      ("Statistics", option_to_yojson session_statistics_to_yojson x.statistics);
    ]

let get_session_request_to_yojson (x : get_session_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let get_resource_dashboard_response_to_yojson (x : get_resource_dashboard_response) =
  assoc_to_yojson [ ("Url", Some (string__to_yojson x.url)) ]

let get_resource_dashboard_request_to_yojson (x : get_resource_dashboard_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let rec query_stage_plan_nodes_to_yojson tree = list_to_yojson query_stage_plan_node_to_yojson tree

and query_stage_plan_node_to_yojson (x : query_stage_plan_node) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Identifier", option_to_yojson string__to_yojson x.identifier);
      ("Children", option_to_yojson query_stage_plan_nodes_to_yojson x.children);
      ("RemoteSources", option_to_yojson string_list_to_yojson x.remote_sources);
    ]

let rec query_stages_to_yojson tree = list_to_yojson query_stage_to_yojson tree

and query_stage_to_yojson (x : query_stage) =
  assoc_to_yojson
    [
      ("StageId", option_to_yojson long_to_yojson x.stage_id);
      ("State", option_to_yojson string__to_yojson x.state);
      ("OutputBytes", option_to_yojson long_to_yojson x.output_bytes);
      ("OutputRows", option_to_yojson long_to_yojson x.output_rows);
      ("InputBytes", option_to_yojson long_to_yojson x.input_bytes);
      ("InputRows", option_to_yojson long_to_yojson x.input_rows);
      ("ExecutionTime", option_to_yojson long_to_yojson x.execution_time);
      ("QueryStagePlan", option_to_yojson query_stage_plan_node_to_yojson x.query_stage_plan);
      ("SubStages", option_to_yojson query_stages_to_yojson x.sub_stages);
    ]

let query_runtime_statistics_rows_to_yojson (x : query_runtime_statistics_rows) =
  assoc_to_yojson
    [
      ("InputRows", option_to_yojson long_to_yojson x.input_rows);
      ("InputBytes", option_to_yojson long_to_yojson x.input_bytes);
      ("OutputBytes", option_to_yojson long_to_yojson x.output_bytes);
      ("OutputRows", option_to_yojson long_to_yojson x.output_rows);
    ]

let query_runtime_statistics_timeline_to_yojson (x : query_runtime_statistics_timeline) =
  assoc_to_yojson
    [
      ("QueryQueueTimeInMillis", option_to_yojson long_to_yojson x.query_queue_time_in_millis);
      ( "ServicePreProcessingTimeInMillis",
        option_to_yojson long_to_yojson x.service_pre_processing_time_in_millis );
      ("QueryPlanningTimeInMillis", option_to_yojson long_to_yojson x.query_planning_time_in_millis);
      ( "EngineExecutionTimeInMillis",
        option_to_yojson long_to_yojson x.engine_execution_time_in_millis );
      ( "ServiceProcessingTimeInMillis",
        option_to_yojson long_to_yojson x.service_processing_time_in_millis );
      ( "TotalExecutionTimeInMillis",
        option_to_yojson long_to_yojson x.total_execution_time_in_millis );
    ]

let query_runtime_statistics_to_yojson (x : query_runtime_statistics) =
  assoc_to_yojson
    [
      ("Timeline", option_to_yojson query_runtime_statistics_timeline_to_yojson x.timeline);
      ("Rows", option_to_yojson query_runtime_statistics_rows_to_yojson x.rows);
      ("OutputStage", option_to_yojson query_stage_to_yojson x.output_stage);
    ]

let get_query_runtime_statistics_output_to_yojson (x : get_query_runtime_statistics_output) =
  assoc_to_yojson
    [
      ( "QueryRuntimeStatistics",
        option_to_yojson query_runtime_statistics_to_yojson x.query_runtime_statistics );
    ]

let get_query_runtime_statistics_input_to_yojson (x : get_query_runtime_statistics_input) =
  assoc_to_yojson [ ("QueryExecutionId", Some (query_execution_id_to_yojson x.query_execution_id)) ]

let column_nullable_to_yojson (x : column_nullable) =
  match x with
  | NOT_NULL -> `String "NOT_NULL"
  | NULLABLE -> `String "NULLABLE"
  | UNKNOWN -> `String "UNKNOWN"

let column_info_to_yojson (x : column_info) =
  assoc_to_yojson
    [
      ("CatalogName", option_to_yojson string__to_yojson x.catalog_name);
      ("SchemaName", option_to_yojson string__to_yojson x.schema_name);
      ("TableName", option_to_yojson string__to_yojson x.table_name);
      ("Name", Some (string__to_yojson x.name));
      ("Label", option_to_yojson string__to_yojson x.label);
      ("Type", Some (string__to_yojson x.type_));
      ("Precision", option_to_yojson integer_to_yojson x.precision);
      ("Scale", option_to_yojson integer_to_yojson x.scale);
      ("Nullable", option_to_yojson column_nullable_to_yojson x.nullable);
      ("CaseSensitive", option_to_yojson boolean__to_yojson x.case_sensitive);
    ]

let column_info_list_to_yojson tree = list_to_yojson column_info_to_yojson tree

let result_set_metadata_to_yojson (x : result_set_metadata) =
  assoc_to_yojson [ ("ColumnInfo", option_to_yojson column_info_list_to_yojson x.column_info) ]

let datum_string_to_yojson = string_to_yojson

let datum_to_yojson (x : datum) =
  assoc_to_yojson [ ("VarCharValue", option_to_yojson datum_string_to_yojson x.var_char_value) ]

let datum_list_to_yojson tree = list_to_yojson datum_to_yojson tree

let row_to_yojson (x : row) =
  assoc_to_yojson [ ("Data", option_to_yojson datum_list_to_yojson x.data) ]

let row_list_to_yojson tree = list_to_yojson row_to_yojson tree

let result_set_to_yojson (x : result_set) =
  assoc_to_yojson
    [
      ("Rows", option_to_yojson row_list_to_yojson x.rows);
      ("ResultSetMetadata", option_to_yojson result_set_metadata_to_yojson x.result_set_metadata);
    ]

let get_query_results_output_to_yojson (x : get_query_results_output) =
  assoc_to_yojson
    [
      ("UpdateCount", option_to_yojson long_to_yojson x.update_count);
      ("ResultSet", option_to_yojson result_set_to_yojson x.result_set);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let query_result_type_to_yojson (x : query_result_type) =
  match x with DATA_MANIFEST -> `String "DATA_MANIFEST" | DATA_ROWS -> `String "DATA_ROWS"

let max_query_results_to_yojson = int_to_yojson

let get_query_results_input_to_yojson (x : get_query_results_input) =
  assoc_to_yojson
    [
      ("QueryExecutionId", Some (query_execution_id_to_yojson x.query_execution_id));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_query_results_to_yojson x.max_results);
      ("QueryResultType", option_to_yojson query_result_type_to_yojson x.query_result_type);
    ]

let dpu_count_to_yojson = double_to_yojson

let result_reuse_information_to_yojson (x : result_reuse_information) =
  assoc_to_yojson [ ("ReusedPreviousResult", Some (boolean__to_yojson x.reused_previous_result)) ]

let query_execution_statistics_to_yojson (x : query_execution_statistics) =
  assoc_to_yojson
    [
      ( "EngineExecutionTimeInMillis",
        option_to_yojson long_to_yojson x.engine_execution_time_in_millis );
      ("DataScannedInBytes", option_to_yojson long_to_yojson x.data_scanned_in_bytes);
      ("DataManifestLocation", option_to_yojson string__to_yojson x.data_manifest_location);
      ( "TotalExecutionTimeInMillis",
        option_to_yojson long_to_yojson x.total_execution_time_in_millis );
      ("QueryQueueTimeInMillis", option_to_yojson long_to_yojson x.query_queue_time_in_millis);
      ( "ServicePreProcessingTimeInMillis",
        option_to_yojson long_to_yojson x.service_pre_processing_time_in_millis );
      ("QueryPlanningTimeInMillis", option_to_yojson long_to_yojson x.query_planning_time_in_millis);
      ( "ServiceProcessingTimeInMillis",
        option_to_yojson long_to_yojson x.service_processing_time_in_millis );
      ( "ResultReuseInformation",
        option_to_yojson result_reuse_information_to_yojson x.result_reuse_information );
      ("DpuCount", option_to_yojson dpu_count_to_yojson x.dpu_count);
    ]

let error_type_to_yojson = int_to_yojson
let error_category_to_yojson = int_to_yojson

let athena_error_to_yojson (x : athena_error) =
  assoc_to_yojson
    [
      ("ErrorCategory", option_to_yojson error_category_to_yojson x.error_category);
      ("ErrorType", option_to_yojson error_type_to_yojson x.error_type);
      ("Retryable", option_to_yojson boolean__to_yojson x.retryable);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let query_execution_state_to_yojson (x : query_execution_state) =
  match x with
  | QUEUED -> `String "QUEUED"
  | RUNNING -> `String "RUNNING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"

let query_execution_status_to_yojson (x : query_execution_status) =
  assoc_to_yojson
    [
      ("State", option_to_yojson query_execution_state_to_yojson x.state);
      ("StateChangeReason", option_to_yojson string__to_yojson x.state_change_reason);
      ("SubmissionDateTime", option_to_yojson date_to_yojson x.submission_date_time);
      ("CompletionDateTime", option_to_yojson date_to_yojson x.completion_date_time);
      ("AthenaError", option_to_yojson athena_error_to_yojson x.athena_error);
    ]

let statement_type_to_yojson (x : statement_type) =
  match x with DDL -> `String "DDL" | DML -> `String "DML" | UTILITY -> `String "UTILITY"

let query_execution_to_yojson (x : query_execution) =
  assoc_to_yojson
    [
      ("QueryExecutionId", option_to_yojson query_execution_id_to_yojson x.query_execution_id);
      ("Query", option_to_yojson query_string_to_yojson x.query);
      ("StatementType", option_to_yojson statement_type_to_yojson x.statement_type);
      ( "ManagedQueryResultsConfiguration",
        option_to_yojson managed_query_results_configuration_to_yojson
          x.managed_query_results_configuration );
      ("ResultConfiguration", option_to_yojson result_configuration_to_yojson x.result_configuration);
      ( "ResultReuseConfiguration",
        option_to_yojson result_reuse_configuration_to_yojson x.result_reuse_configuration );
      ( "QueryExecutionContext",
        option_to_yojson query_execution_context_to_yojson x.query_execution_context );
      ("Status", option_to_yojson query_execution_status_to_yojson x.status);
      ("Statistics", option_to_yojson query_execution_statistics_to_yojson x.statistics);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ("ExecutionParameters", option_to_yojson execution_parameters_to_yojson x.execution_parameters);
      ("SubstatementType", option_to_yojson string__to_yojson x.substatement_type);
      ( "QueryResultsS3AccessGrantsConfiguration",
        option_to_yojson query_results_s3_access_grants_configuration_to_yojson
          x.query_results_s3_access_grants_configuration );
    ]

let get_query_execution_output_to_yojson (x : get_query_execution_output) =
  assoc_to_yojson
    [ ("QueryExecution", option_to_yojson query_execution_to_yojson x.query_execution) ]

let get_query_execution_input_to_yojson (x : get_query_execution_input) =
  assoc_to_yojson [ ("QueryExecutionId", Some (query_execution_id_to_yojson x.query_execution_id)) ]

let prepared_statement_to_yojson (x : prepared_statement) =
  assoc_to_yojson
    [
      ("StatementName", option_to_yojson statement_name_to_yojson x.statement_name);
      ("QueryStatement", option_to_yojson query_string_to_yojson x.query_statement);
      ("WorkGroupName", option_to_yojson work_group_name_to_yojson x.work_group_name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("LastModifiedTime", option_to_yojson date_to_yojson x.last_modified_time);
    ]

let get_prepared_statement_output_to_yojson (x : get_prepared_statement_output) =
  assoc_to_yojson
    [ ("PreparedStatement", option_to_yojson prepared_statement_to_yojson x.prepared_statement) ]

let get_prepared_statement_input_to_yojson (x : get_prepared_statement_input) =
  assoc_to_yojson
    [
      ("StatementName", Some (statement_name_to_yojson x.statement_name));
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
    ]

let get_notebook_metadata_output_to_yojson (x : get_notebook_metadata_output) =
  assoc_to_yojson
    [ ("NotebookMetadata", option_to_yojson notebook_metadata_to_yojson x.notebook_metadata) ]

let get_notebook_metadata_input_to_yojson (x : get_notebook_metadata_input) =
  assoc_to_yojson [ ("NotebookId", Some (notebook_id_to_yojson x.notebook_id)) ]

let named_query_to_yojson (x : named_query) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Database", Some (database_string_to_yojson x.database));
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ("NamedQueryId", option_to_yojson named_query_id_to_yojson x.named_query_id);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
    ]

let get_named_query_output_to_yojson (x : get_named_query_output) =
  assoc_to_yojson [ ("NamedQuery", option_to_yojson named_query_to_yojson x.named_query) ]

let get_named_query_input_to_yojson (x : get_named_query_input) =
  assoc_to_yojson [ ("NamedQueryId", Some (named_query_id_to_yojson x.named_query_id)) ]

let data_catalog_to_yojson (x : data_catalog) =
  assoc_to_yojson
    [
      ("Name", Some (catalog_name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Type", Some (data_catalog_type_to_yojson x.type_));
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("Status", option_to_yojson data_catalog_status_to_yojson x.status);
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("Error", option_to_yojson error_message_to_yojson x.error);
    ]

let get_data_catalog_output_to_yojson (x : get_data_catalog_output) =
  assoc_to_yojson [ ("DataCatalog", option_to_yojson data_catalog_to_yojson x.data_catalog) ]

let get_data_catalog_input_to_yojson (x : get_data_catalog_input) =
  assoc_to_yojson
    [
      ("Name", Some (catalog_name_string_to_yojson x.name));
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
    ]

let get_database_output_to_yojson (x : get_database_output) =
  assoc_to_yojson [ ("Database", option_to_yojson database_to_yojson x.database) ]

let get_database_input_to_yojson (x : get_database_input) =
  assoc_to_yojson
    [
      ("CatalogName", Some (catalog_name_string_to_yojson x.catalog_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
    ]

let get_capacity_reservation_output_to_yojson (x : get_capacity_reservation_output) =
  assoc_to_yojson
    [ ("CapacityReservation", Some (capacity_reservation_to_yojson x.capacity_reservation)) ]

let get_capacity_reservation_input_to_yojson (x : get_capacity_reservation_input) =
  assoc_to_yojson [ ("Name", Some (capacity_reservation_name_to_yojson x.name)) ]

let capacity_assignment_configuration_to_yojson (x : capacity_assignment_configuration) =
  assoc_to_yojson
    [
      ( "CapacityReservationName",
        option_to_yojson capacity_reservation_name_to_yojson x.capacity_reservation_name );
      ( "CapacityAssignments",
        option_to_yojson capacity_assignments_list_to_yojson x.capacity_assignments );
    ]

let get_capacity_assignment_configuration_output_to_yojson
    (x : get_capacity_assignment_configuration_output) =
  assoc_to_yojson
    [
      ( "CapacityAssignmentConfiguration",
        Some (capacity_assignment_configuration_to_yojson x.capacity_assignment_configuration) );
    ]

let get_capacity_assignment_configuration_input_to_yojson
    (x : get_capacity_assignment_configuration_input) =
  assoc_to_yojson
    [
      ( "CapacityReservationName",
        Some (capacity_reservation_name_to_yojson x.capacity_reservation_name) );
    ]

let calculation_statistics_to_yojson (x : calculation_statistics) =
  assoc_to_yojson
    [
      ("DpuExecutionInMillis", option_to_yojson long_to_yojson x.dpu_execution_in_millis);
      ("Progress", option_to_yojson description_string_to_yojson x.progress);
    ]

let get_calculation_execution_status_response_to_yojson
    (x : get_calculation_execution_status_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson calculation_status_to_yojson x.status);
      ("Statistics", option_to_yojson calculation_statistics_to_yojson x.statistics);
    ]

let get_calculation_execution_status_request_to_yojson
    (x : get_calculation_execution_status_request) =
  assoc_to_yojson
    [
      ( "CalculationExecutionId",
        Some (calculation_execution_id_to_yojson x.calculation_execution_id) );
    ]

let get_calculation_execution_code_response_to_yojson (x : get_calculation_execution_code_response)
    =
  assoc_to_yojson [ ("CodeBlock", option_to_yojson code_block_to_yojson x.code_block) ]

let get_calculation_execution_code_request_to_yojson (x : get_calculation_execution_code_request) =
  assoc_to_yojson
    [
      ( "CalculationExecutionId",
        Some (calculation_execution_id_to_yojson x.calculation_execution_id) );
    ]

let calculation_result_type_to_yojson = string_to_yojson

let calculation_result_to_yojson (x : calculation_result) =
  assoc_to_yojson
    [
      ("StdOutS3Uri", option_to_yojson s3_uri_to_yojson x.std_out_s3_uri);
      ("StdErrorS3Uri", option_to_yojson s3_uri_to_yojson x.std_error_s3_uri);
      ("ResultS3Uri", option_to_yojson s3_uri_to_yojson x.result_s3_uri);
      ("ResultType", option_to_yojson calculation_result_type_to_yojson x.result_type);
    ]

let get_calculation_execution_response_to_yojson (x : get_calculation_execution_response) =
  assoc_to_yojson
    [
      ( "CalculationExecutionId",
        option_to_yojson calculation_execution_id_to_yojson x.calculation_execution_id );
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("WorkingDirectory", option_to_yojson s3_uri_to_yojson x.working_directory);
      ("Status", option_to_yojson calculation_status_to_yojson x.status);
      ("Statistics", option_to_yojson calculation_statistics_to_yojson x.statistics);
      ("Result", option_to_yojson calculation_result_to_yojson x.result_);
    ]

let get_calculation_execution_request_to_yojson (x : get_calculation_execution_request) =
  assoc_to_yojson
    [
      ( "CalculationExecutionId",
        Some (calculation_execution_id_to_yojson x.calculation_execution_id) );
    ]

let export_notebook_output_to_yojson (x : export_notebook_output) =
  assoc_to_yojson
    [
      ("NotebookMetadata", option_to_yojson notebook_metadata_to_yojson x.notebook_metadata);
      ("Payload", option_to_yojson payload_to_yojson x.payload);
    ]

let export_notebook_input_to_yojson (x : export_notebook_input) =
  assoc_to_yojson [ ("NotebookId", Some (notebook_id_to_yojson x.notebook_id)) ]

let delete_work_group_output_to_yojson = unit_to_yojson

let delete_work_group_input_to_yojson (x : delete_work_group_input) =
  assoc_to_yojson
    [
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("RecursiveDeleteOption", option_to_yojson boxed_boolean_to_yojson x.recursive_delete_option);
    ]

let delete_prepared_statement_output_to_yojson = unit_to_yojson

let delete_prepared_statement_input_to_yojson (x : delete_prepared_statement_input) =
  assoc_to_yojson
    [
      ("StatementName", Some (statement_name_to_yojson x.statement_name));
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
    ]

let delete_notebook_output_to_yojson = unit_to_yojson

let delete_notebook_input_to_yojson (x : delete_notebook_input) =
  assoc_to_yojson [ ("NotebookId", Some (notebook_id_to_yojson x.notebook_id)) ]

let delete_named_query_output_to_yojson = unit_to_yojson

let delete_named_query_input_to_yojson (x : delete_named_query_input) =
  assoc_to_yojson [ ("NamedQueryId", Some (named_query_id_to_yojson x.named_query_id)) ]

let delete_data_catalog_output_to_yojson (x : delete_data_catalog_output) =
  assoc_to_yojson [ ("DataCatalog", option_to_yojson data_catalog_to_yojson x.data_catalog) ]

let delete_data_catalog_input_to_yojson (x : delete_data_catalog_input) =
  assoc_to_yojson
    [
      ("Name", Some (catalog_name_string_to_yojson x.name));
      ("DeleteCatalogOnly", option_to_yojson boolean__to_yojson x.delete_catalog_only);
    ]

let delete_capacity_reservation_output_to_yojson = unit_to_yojson

let delete_capacity_reservation_input_to_yojson (x : delete_capacity_reservation_input) =
  assoc_to_yojson [ ("Name", Some (capacity_reservation_name_to_yojson x.name)) ]

let create_work_group_output_to_yojson = unit_to_yojson

let create_work_group_input_to_yojson (x : create_work_group_input) =
  assoc_to_yojson
    [
      ("Name", Some (work_group_name_to_yojson x.name));
      ("Configuration", option_to_yojson work_group_configuration_to_yojson x.configuration);
      ("Description", option_to_yojson work_group_description_string_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let auth_token_to_yojson = string_to_yojson

let create_presigned_notebook_url_response_to_yojson (x : create_presigned_notebook_url_response) =
  assoc_to_yojson
    [
      ("NotebookUrl", Some (string__to_yojson x.notebook_url));
      ("AuthToken", Some (auth_token_to_yojson x.auth_token));
      ("AuthTokenExpirationTime", Some (long_to_yojson x.auth_token_expiration_time));
    ]

let create_presigned_notebook_url_request_to_yojson (x : create_presigned_notebook_url_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let create_prepared_statement_output_to_yojson = unit_to_yojson

let create_prepared_statement_input_to_yojson (x : create_prepared_statement_input) =
  assoc_to_yojson
    [
      ("StatementName", Some (statement_name_to_yojson x.statement_name));
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("QueryStatement", Some (query_string_to_yojson x.query_statement));
      ("Description", option_to_yojson description_string_to_yojson x.description);
    ]

let create_notebook_output_to_yojson (x : create_notebook_output) =
  assoc_to_yojson [ ("NotebookId", option_to_yojson notebook_id_to_yojson x.notebook_id) ]

let create_notebook_input_to_yojson (x : create_notebook_input) =
  assoc_to_yojson
    [
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("Name", Some (notebook_name_to_yojson x.name));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
    ]

let create_named_query_output_to_yojson (x : create_named_query_output) =
  assoc_to_yojson [ ("NamedQueryId", option_to_yojson named_query_id_to_yojson x.named_query_id) ]

let create_named_query_input_to_yojson (x : create_named_query_input) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Database", Some (database_string_to_yojson x.database));
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ( "ClientRequestToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
    ]

let create_data_catalog_output_to_yojson (x : create_data_catalog_output) =
  assoc_to_yojson [ ("DataCatalog", option_to_yojson data_catalog_to_yojson x.data_catalog) ]

let create_data_catalog_input_to_yojson (x : create_data_catalog_input) =
  assoc_to_yojson
    [
      ("Name", Some (catalog_name_string_to_yojson x.name));
      ("Type", Some (data_catalog_type_to_yojson x.type_));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_capacity_reservation_output_to_yojson = unit_to_yojson

let create_capacity_reservation_input_to_yojson (x : create_capacity_reservation_input) =
  assoc_to_yojson
    [
      ("TargetDpus", Some (target_dpus_integer_to_yojson x.target_dpus));
      ("Name", Some (capacity_reservation_name_to_yojson x.name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let cancel_capacity_reservation_output_to_yojson = unit_to_yojson

let cancel_capacity_reservation_input_to_yojson (x : cancel_capacity_reservation_input) =
  assoc_to_yojson [ ("Name", Some (capacity_reservation_name_to_yojson x.name)) ]

let unprocessed_query_execution_id_to_yojson (x : unprocessed_query_execution_id) =
  assoc_to_yojson
    [
      ("QueryExecutionId", option_to_yojson query_execution_id_to_yojson x.query_execution_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let unprocessed_query_execution_id_list_to_yojson tree =
  list_to_yojson unprocessed_query_execution_id_to_yojson tree

let query_execution_list_to_yojson tree = list_to_yojson query_execution_to_yojson tree

let batch_get_query_execution_output_to_yojson (x : batch_get_query_execution_output) =
  assoc_to_yojson
    [
      ("QueryExecutions", option_to_yojson query_execution_list_to_yojson x.query_executions);
      ( "UnprocessedQueryExecutionIds",
        option_to_yojson unprocessed_query_execution_id_list_to_yojson
          x.unprocessed_query_execution_ids );
    ]

let batch_get_query_execution_input_to_yojson (x : batch_get_query_execution_input) =
  assoc_to_yojson
    [ ("QueryExecutionIds", Some (query_execution_id_list_to_yojson x.query_execution_ids)) ]

let unprocessed_prepared_statement_name_to_yojson (x : unprocessed_prepared_statement_name) =
  assoc_to_yojson
    [
      ("StatementName", option_to_yojson statement_name_to_yojson x.statement_name);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let unprocessed_prepared_statement_name_list_to_yojson tree =
  list_to_yojson unprocessed_prepared_statement_name_to_yojson tree

let prepared_statement_details_list_to_yojson tree =
  list_to_yojson prepared_statement_to_yojson tree

let batch_get_prepared_statement_output_to_yojson (x : batch_get_prepared_statement_output) =
  assoc_to_yojson
    [
      ( "PreparedStatements",
        option_to_yojson prepared_statement_details_list_to_yojson x.prepared_statements );
      ( "UnprocessedPreparedStatementNames",
        option_to_yojson unprocessed_prepared_statement_name_list_to_yojson
          x.unprocessed_prepared_statement_names );
    ]

let prepared_statement_name_list_to_yojson tree = list_to_yojson statement_name_to_yojson tree

let batch_get_prepared_statement_input_to_yojson (x : batch_get_prepared_statement_input) =
  assoc_to_yojson
    [
      ( "PreparedStatementNames",
        Some (prepared_statement_name_list_to_yojson x.prepared_statement_names) );
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
    ]

let unprocessed_named_query_id_to_yojson (x : unprocessed_named_query_id) =
  assoc_to_yojson
    [
      ("NamedQueryId", option_to_yojson named_query_id_to_yojson x.named_query_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let unprocessed_named_query_id_list_to_yojson tree =
  list_to_yojson unprocessed_named_query_id_to_yojson tree

let named_query_list_to_yojson tree = list_to_yojson named_query_to_yojson tree

let batch_get_named_query_output_to_yojson (x : batch_get_named_query_output) =
  assoc_to_yojson
    [
      ("NamedQueries", option_to_yojson named_query_list_to_yojson x.named_queries);
      ( "UnprocessedNamedQueryIds",
        option_to_yojson unprocessed_named_query_id_list_to_yojson x.unprocessed_named_query_ids );
    ]

let batch_get_named_query_input_to_yojson (x : batch_get_named_query_input) =
  assoc_to_yojson [ ("NamedQueryIds", Some (named_query_id_list_to_yojson x.named_query_ids)) ]
