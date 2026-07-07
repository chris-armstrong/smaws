open Smaws_Lib.Json.SerializeHelpers
open Types

let datum_string_to_yojson = string_to_yojson

let datum_to_yojson (x : datum) =
  assoc_to_yojson [ ("VarCharValue", option_to_yojson datum_string_to_yojson x.var_char_value) ]

let datum_list_to_yojson tree = list_to_yojson datum_to_yojson tree
let work_group_name_to_yojson = string_to_yojson

let work_group_state_to_yojson (x : work_group_state) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let work_group_description_string_to_yojson = string_to_yojson
let date_to_yojson = timestamp_epoch_seconds_to_yojson
let name_string_to_yojson = string_to_yojson

let engine_version_to_yojson (x : engine_version) =
  assoc_to_yojson
    [
      ("EffectiveEngineVersion", option_to_yojson name_string_to_yojson x.effective_engine_version);
      ("SelectedEngineVersion", option_to_yojson name_string_to_yojson x.selected_engine_version);
    ]

let identity_center_application_arn_to_yojson = string_to_yojson

let work_group_summary_to_yojson (x : work_group_summary) =
  assoc_to_yojson
    [
      ( "IdentityCenterApplicationArn",
        option_to_yojson identity_center_application_arn_to_yojson x.identity_center_application_arn
      );
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("Description", option_to_yojson work_group_description_string_to_yojson x.description);
      ("State", option_to_yojson work_group_state_to_yojson x.state);
      ("Name", option_to_yojson work_group_name_to_yojson x.name);
    ]

let work_groups_list_to_yojson tree = list_to_yojson work_group_summary_to_yojson tree
let work_group_names_list_to_yojson tree = list_to_yojson work_group_name_to_yojson tree
let boxed_boolean_to_yojson = bool_to_yojson
let result_output_location_to_yojson = string_to_yojson

let encryption_option_to_yojson (x : encryption_option) =
  match x with
  | CSE_KMS -> `String "CSE_KMS"
  | SSE_KMS -> `String "SSE_KMS"
  | SSE_S3 -> `String "SSE_S3"

let string__to_yojson = string_to_yojson

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("KmsKey", option_to_yojson string__to_yojson x.kms_key);
      ("EncryptionOption", Some (encryption_option_to_yojson x.encryption_option));
    ]

let aws_account_id_to_yojson = string_to_yojson

let s3_acl_option_to_yojson (x : s3_acl_option) =
  match x with BUCKET_OWNER_FULL_CONTROL -> `String "BUCKET_OWNER_FULL_CONTROL"

let acl_configuration_to_yojson (x : acl_configuration) =
  assoc_to_yojson [ ("S3AclOption", Some (s3_acl_option_to_yojson x.s3_acl_option)) ]

let result_configuration_updates_to_yojson (x : result_configuration_updates) =
  assoc_to_yojson
    [
      ("RemoveAclConfiguration", option_to_yojson boxed_boolean_to_yojson x.remove_acl_configuration);
      ("AclConfiguration", option_to_yojson acl_configuration_to_yojson x.acl_configuration);
      ( "RemoveExpectedBucketOwner",
        option_to_yojson boxed_boolean_to_yojson x.remove_expected_bucket_owner );
      ("ExpectedBucketOwner", option_to_yojson aws_account_id_to_yojson x.expected_bucket_owner);
      ( "RemoveEncryptionConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.remove_encryption_configuration );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("RemoveOutputLocation", option_to_yojson boxed_boolean_to_yojson x.remove_output_location);
      ("OutputLocation", option_to_yojson result_output_location_to_yojson x.output_location);
    ]

let kms_key_to_yojson = string_to_yojson

let managed_query_results_encryption_configuration_to_yojson
    (x : managed_query_results_encryption_configuration) =
  assoc_to_yojson [ ("KmsKey", Some (kms_key_to_yojson x.kms_key)) ]

let managed_query_results_configuration_updates_to_yojson
    (x : managed_query_results_configuration_updates) =
  assoc_to_yojson
    [
      ( "RemoveEncryptionConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.remove_encryption_configuration );
      ( "EncryptionConfiguration",
        option_to_yojson managed_query_results_encryption_configuration_to_yojson
          x.encryption_configuration );
      ("Enabled", option_to_yojson boxed_boolean_to_yojson x.enabled);
    ]

let bytes_scanned_cutoff_value_to_yojson = long_to_yojson
let role_arn_to_yojson = string_to_yojson

let customer_content_encryption_configuration_to_yojson
    (x : customer_content_encryption_configuration) =
  assoc_to_yojson [ ("KmsKey", Some (kms_key_to_yojson x.kms_key)) ]

let authentication_type_to_yojson (x : authentication_type) =
  match x with DIRECTORY_IDENTITY -> `String "DIRECTORY_IDENTITY"

let query_results_s3_access_grants_configuration_to_yojson
    (x : query_results_s3_access_grants_configuration) =
  assoc_to_yojson
    [
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
      ("CreateUserLevelPrefix", option_to_yojson boxed_boolean_to_yojson x.create_user_level_prefix);
      ("EnableS3AccessGrants", Some (boxed_boolean_to_yojson x.enable_s3_access_grants));
    ]

let log_group_name_to_yojson = string_to_yojson
let log_stream_name_prefix_to_yojson = string_to_yojson
let log_type_value_to_yojson = string_to_yojson
let log_type_values_list_to_yojson tree = list_to_yojson log_type_value_to_yojson tree
let log_type_key_to_yojson = string_to_yojson

let log_types_map_to_yojson tree =
  map_to_yojson log_type_key_to_yojson log_type_values_list_to_yojson tree

let cloud_watch_logging_configuration_to_yojson (x : cloud_watch_logging_configuration) =
  assoc_to_yojson
    [
      ("LogTypes", option_to_yojson log_types_map_to_yojson x.log_types);
      ( "LogStreamNamePrefix",
        option_to_yojson log_stream_name_prefix_to_yojson x.log_stream_name_prefix );
      ("LogGroup", option_to_yojson log_group_name_to_yojson x.log_group);
      ("Enabled", Some (boxed_boolean_to_yojson x.enabled));
    ]

let managed_logging_configuration_to_yojson (x : managed_logging_configuration) =
  assoc_to_yojson
    [
      ("KmsKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("Enabled", Some (boxed_boolean_to_yojson x.enabled));
    ]

let s3_output_location_to_yojson = string_to_yojson

let s3_logging_configuration_to_yojson (x : s3_logging_configuration) =
  assoc_to_yojson
    [
      ("LogLocation", option_to_yojson s3_output_location_to_yojson x.log_location);
      ("KmsKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("Enabled", Some (boxed_boolean_to_yojson x.enabled));
    ]

let monitoring_configuration_to_yojson (x : monitoring_configuration) =
  assoc_to_yojson
    [
      ( "S3LoggingConfiguration",
        option_to_yojson s3_logging_configuration_to_yojson x.s3_logging_configuration );
      ( "ManagedLoggingConfiguration",
        option_to_yojson managed_logging_configuration_to_yojson x.managed_logging_configuration );
      ( "CloudWatchLoggingConfiguration",
        option_to_yojson cloud_watch_logging_configuration_to_yojson
          x.cloud_watch_logging_configuration );
    ]

let coordinator_dpu_size_to_yojson = int_to_yojson
let max_concurrent_dpus_to_yojson = int_to_yojson
let default_executor_dpu_size_to_yojson = int_to_yojson
let parameters_map_value_to_yojson = string_to_yojson
let key_string_to_yojson = string_to_yojson

let parameters_map_to_yojson tree =
  map_to_yojson key_string_to_yojson parameters_map_value_to_yojson tree

let classification_to_yojson (x : classification) =
  assoc_to_yojson
    [
      ("Properties", option_to_yojson parameters_map_to_yojson x.properties);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let classification_list_to_yojson tree = list_to_yojson classification_to_yojson tree

let engine_configuration_to_yojson (x : engine_configuration) =
  assoc_to_yojson
    [
      ("Classifications", option_to_yojson classification_list_to_yojson x.classifications);
      ("SparkProperties", option_to_yojson parameters_map_to_yojson x.spark_properties);
      ("AdditionalConfigs", option_to_yojson parameters_map_to_yojson x.additional_configs);
      ( "DefaultExecutorDpuSize",
        option_to_yojson default_executor_dpu_size_to_yojson x.default_executor_dpu_size );
      ("MaxConcurrentDpus", option_to_yojson max_concurrent_dpus_to_yojson x.max_concurrent_dpus);
      ("CoordinatorDpuSize", option_to_yojson coordinator_dpu_size_to_yojson x.coordinator_dpu_size);
    ]

let work_group_configuration_updates_to_yojson (x : work_group_configuration_updates) =
  assoc_to_yojson
    [
      ("EngineConfiguration", option_to_yojson engine_configuration_to_yojson x.engine_configuration);
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ( "QueryResultsS3AccessGrantsConfiguration",
        option_to_yojson query_results_s3_access_grants_configuration_to_yojson
          x.query_results_s3_access_grants_configuration );
      ( "EnableMinimumEncryptionConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.enable_minimum_encryption_configuration );
      ( "CustomerContentEncryptionConfiguration",
        option_to_yojson customer_content_encryption_configuration_to_yojson
          x.customer_content_encryption_configuration );
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ("AdditionalConfiguration", option_to_yojson name_string_to_yojson x.additional_configuration);
      ( "RemoveCustomerContentEncryptionConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.remove_customer_content_encryption_configuration
      );
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ("RequesterPaysEnabled", option_to_yojson boxed_boolean_to_yojson x.requester_pays_enabled);
      ( "RemoveBytesScannedCutoffPerQuery",
        option_to_yojson boxed_boolean_to_yojson x.remove_bytes_scanned_cutoff_per_query );
      ( "BytesScannedCutoffPerQuery",
        option_to_yojson bytes_scanned_cutoff_value_to_yojson x.bytes_scanned_cutoff_per_query );
      ( "PublishCloudWatchMetricsEnabled",
        option_to_yojson boxed_boolean_to_yojson x.publish_cloud_watch_metrics_enabled );
      ( "ManagedQueryResultsConfigurationUpdates",
        option_to_yojson managed_query_results_configuration_updates_to_yojson
          x.managed_query_results_configuration_updates );
      ( "ResultConfigurationUpdates",
        option_to_yojson result_configuration_updates_to_yojson x.result_configuration_updates );
      ( "EnforceWorkGroupConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.enforce_work_group_configuration );
    ]

let result_configuration_to_yojson (x : result_configuration) =
  assoc_to_yojson
    [
      ("AclConfiguration", option_to_yojson acl_configuration_to_yojson x.acl_configuration);
      ("ExpectedBucketOwner", option_to_yojson aws_account_id_to_yojson x.expected_bucket_owner);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("OutputLocation", option_to_yojson result_output_location_to_yojson x.output_location);
    ]

let boolean__to_yojson = bool_to_yojson

let managed_query_results_configuration_to_yojson (x : managed_query_results_configuration) =
  assoc_to_yojson
    [
      ( "EncryptionConfiguration",
        option_to_yojson managed_query_results_encryption_configuration_to_yojson
          x.encryption_configuration );
      ("Enabled", Some (boolean__to_yojson x.enabled));
    ]

let identity_center_instance_arn_to_yojson = string_to_yojson

let identity_center_configuration_to_yojson (x : identity_center_configuration) =
  assoc_to_yojson
    [
      ( "IdentityCenterInstanceArn",
        option_to_yojson identity_center_instance_arn_to_yojson x.identity_center_instance_arn );
      ("EnableIdentityCenter", option_to_yojson boxed_boolean_to_yojson x.enable_identity_center);
    ]

let work_group_configuration_to_yojson (x : work_group_configuration) =
  assoc_to_yojson
    [
      ( "QueryResultsS3AccessGrantsConfiguration",
        option_to_yojson query_results_s3_access_grants_configuration_to_yojson
          x.query_results_s3_access_grants_configuration );
      ( "IdentityCenterConfiguration",
        option_to_yojson identity_center_configuration_to_yojson x.identity_center_configuration );
      ( "EnableMinimumEncryptionConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.enable_minimum_encryption_configuration );
      ( "CustomerContentEncryptionConfiguration",
        option_to_yojson customer_content_encryption_configuration_to_yojson
          x.customer_content_encryption_configuration );
      ("EngineConfiguration", option_to_yojson engine_configuration_to_yojson x.engine_configuration);
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ("AdditionalConfiguration", option_to_yojson name_string_to_yojson x.additional_configuration);
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ("RequesterPaysEnabled", option_to_yojson boxed_boolean_to_yojson x.requester_pays_enabled);
      ( "BytesScannedCutoffPerQuery",
        option_to_yojson bytes_scanned_cutoff_value_to_yojson x.bytes_scanned_cutoff_per_query );
      ( "PublishCloudWatchMetricsEnabled",
        option_to_yojson boxed_boolean_to_yojson x.publish_cloud_watch_metrics_enabled );
      ( "EnforceWorkGroupConfiguration",
        option_to_yojson boxed_boolean_to_yojson x.enforce_work_group_configuration );
      ( "ManagedQueryResultsConfiguration",
        option_to_yojson managed_query_results_configuration_to_yojson
          x.managed_query_results_configuration );
      ("ResultConfiguration", option_to_yojson result_configuration_to_yojson x.result_configuration);
    ]

let work_group_to_yojson (x : work_group) =
  assoc_to_yojson
    [
      ( "IdentityCenterApplicationArn",
        option_to_yojson identity_center_application_arn_to_yojson x.identity_center_application_arn
      );
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("Description", option_to_yojson work_group_description_string_to_yojson x.description);
      ("Configuration", option_to_yojson work_group_configuration_to_yojson x.configuration);
      ("State", option_to_yojson work_group_state_to_yojson x.state);
      ("Name", Some (work_group_name_to_yojson x.name));
    ]

let update_work_group_output_to_yojson = unit_to_yojson

let update_work_group_input_to_yojson (x : update_work_group_input) =
  assoc_to_yojson
    [
      ("State", option_to_yojson work_group_state_to_yojson x.state);
      ( "ConfigurationUpdates",
        option_to_yojson work_group_configuration_updates_to_yojson x.configuration_updates );
      ("Description", option_to_yojson work_group_description_string_to_yojson x.description);
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
    ]

let error_code_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("AthenaErrorCode", option_to_yojson error_code_to_yojson x.athena_error_code);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_prepared_statement_output_to_yojson = unit_to_yojson
let statement_name_to_yojson = string_to_yojson
let query_string_to_yojson = string_to_yojson
let description_string_to_yojson = string_to_yojson

let update_prepared_statement_input_to_yojson (x : update_prepared_statement_input) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("QueryStatement", Some (query_string_to_yojson x.query_statement));
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("StatementName", Some (statement_name_to_yojson x.statement_name));
    ]

let amazon_resource_name_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ResourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let update_notebook_output_to_yojson = unit_to_yojson
let update_notebook_metadata_output_to_yojson = unit_to_yojson
let notebook_id_to_yojson = string_to_yojson
let client_request_token_to_yojson = string_to_yojson
let notebook_name_to_yojson = string_to_yojson

let update_notebook_metadata_input_to_yojson (x : update_notebook_metadata_input) =
  assoc_to_yojson
    [
      ("Name", Some (notebook_name_to_yojson x.name));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("NotebookId", Some (notebook_id_to_yojson x.notebook_id));
    ]

let throttle_reason_to_yojson (x : throttle_reason) =
  match x with CONCURRENT_QUERY_LIMIT_EXCEEDED -> `String "CONCURRENT_QUERY_LIMIT_EXCEEDED"

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson throttle_reason_to_yojson x.reason);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let payload_to_yojson = string_to_yojson
let notebook_type_to_yojson (x : notebook_type) = match x with IPYNB -> `String "IPYNB"
let session_id_to_yojson = string_to_yojson

let update_notebook_input_to_yojson (x : update_notebook_input) =
  assoc_to_yojson
    [
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("Type", Some (notebook_type_to_yojson x.type_));
      ("Payload", Some (payload_to_yojson x.payload));
      ("NotebookId", Some (notebook_id_to_yojson x.notebook_id));
    ]

let update_named_query_output_to_yojson = unit_to_yojson
let named_query_id_to_yojson = string_to_yojson
let named_query_description_string_to_yojson = string_to_yojson

let update_named_query_input_to_yojson (x : update_named_query_input) =
  assoc_to_yojson
    [
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ("Description", option_to_yojson named_query_description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
      ("NamedQueryId", Some (named_query_id_to_yojson x.named_query_id));
    ]

let update_data_catalog_output_to_yojson = unit_to_yojson
let catalog_name_string_to_yojson = string_to_yojson

let data_catalog_type_to_yojson (x : data_catalog_type) =
  match x with
  | FEDERATED -> `String "FEDERATED"
  | HIVE -> `String "HIVE"
  | GLUE -> `String "GLUE"
  | LAMBDA -> `String "LAMBDA"

let update_data_catalog_input_to_yojson (x : update_data_catalog_input) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Type", Some (data_catalog_type_to_yojson x.type_));
      ("Name", Some (catalog_name_string_to_yojson x.name));
    ]

let update_capacity_reservation_output_to_yojson = unit_to_yojson
let target_dpus_integer_to_yojson = int_to_yojson
let capacity_reservation_name_to_yojson = string_to_yojson

let update_capacity_reservation_input_to_yojson (x : update_capacity_reservation_input) =
  assoc_to_yojson
    [
      ("Name", Some (capacity_reservation_name_to_yojson x.name));
      ("TargetDpus", Some (target_dpus_integer_to_yojson x.target_dpus));
    ]

let untag_resource_output_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let query_execution_id_to_yojson = string_to_yojson

let unprocessed_query_execution_id_to_yojson (x : unprocessed_query_execution_id) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("QueryExecutionId", option_to_yojson query_execution_id_to_yojson x.query_execution_id);
    ]

let unprocessed_query_execution_id_list_to_yojson tree =
  list_to_yojson unprocessed_query_execution_id_to_yojson tree

let unprocessed_prepared_statement_name_to_yojson (x : unprocessed_prepared_statement_name) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("StatementName", option_to_yojson statement_name_to_yojson x.statement_name);
    ]

let unprocessed_prepared_statement_name_list_to_yojson tree =
  list_to_yojson unprocessed_prepared_statement_name_to_yojson tree

let unprocessed_named_query_id_to_yojson (x : unprocessed_named_query_id) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("NamedQueryId", option_to_yojson named_query_id_to_yojson x.named_query_id);
    ]

let unprocessed_named_query_id_list_to_yojson tree =
  list_to_yojson unprocessed_named_query_id_to_yojson tree

let type_string_to_yojson = string_to_yojson
let token_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let session_state_to_yojson (x : session_state) =
  match x with
  | FAILED -> `String "FAILED"
  | DEGRADED -> `String "DEGRADED"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | BUSY -> `String "BUSY"
  | IDLE -> `String "IDLE"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let terminate_session_response_to_yojson (x : terminate_session_response) =
  assoc_to_yojson [ ("State", option_to_yojson session_state_to_yojson x.state) ]

let terminate_session_request_to_yojson (x : terminate_session_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_output_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", option_to_yojson tag_key_to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let table_type_string_to_yojson = string_to_yojson
let comment_string_to_yojson = string_to_yojson

let column_to_yojson (x : column) =
  assoc_to_yojson
    [
      ("Comment", option_to_yojson comment_string_to_yojson x.comment);
      ("Type", option_to_yojson type_string_to_yojson x.type_);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let column_list_to_yojson tree = list_to_yojson column_to_yojson tree

let table_metadata_to_yojson (x : table_metadata) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("PartitionKeys", option_to_yojson column_list_to_yojson x.partition_keys);
      ("Columns", option_to_yojson column_list_to_yojson x.columns);
      ("TableType", option_to_yojson table_type_string_to_yojson x.table_type);
      ("LastAccessTime", option_to_yojson timestamp_to_yojson x.last_access_time);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let table_metadata_list_to_yojson tree = list_to_yojson table_metadata_to_yojson tree
let integer_to_yojson = int_to_yojson
let supported_dpu_size_list_to_yojson tree = list_to_yojson integer_to_yojson tree
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree
let stop_query_execution_output_to_yojson = unit_to_yojson

let stop_query_execution_input_to_yojson (x : stop_query_execution_input) =
  assoc_to_yojson [ ("QueryExecutionId", Some (query_execution_id_to_yojson x.query_execution_id)) ]

let calculation_execution_state_to_yojson (x : calculation_execution_state) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | CANCELED -> `String "CANCELED"
  | CANCELING -> `String "CANCELING"
  | RUNNING -> `String "RUNNING"
  | QUEUED -> `String "QUEUED"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let stop_calculation_execution_response_to_yojson (x : stop_calculation_execution_response) =
  assoc_to_yojson [ ("State", option_to_yojson calculation_execution_state_to_yojson x.state) ]

let calculation_execution_id_to_yojson = string_to_yojson

let stop_calculation_execution_request_to_yojson (x : stop_calculation_execution_request) =
  assoc_to_yojson
    [
      ( "CalculationExecutionId",
        Some (calculation_execution_id_to_yojson x.calculation_execution_id) );
    ]

let statement_type_to_yojson (x : statement_type) =
  match x with UTILITY -> `String "UTILITY" | DML -> `String "DML" | DDL -> `String "DDL"

let start_session_response_to_yojson (x : start_session_response) =
  assoc_to_yojson
    [
      ("State", option_to_yojson session_state_to_yojson x.state);
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
    ]

let session_idle_timeout_in_minutes_to_yojson = int_to_yojson
let idempotency_token_to_yojson = string_to_yojson

let start_session_request_to_yojson (x : start_session_request) =
  assoc_to_yojson
    [
      ("CopyWorkGroupTags", option_to_yojson boxed_boolean_to_yojson x.copy_work_group_tags);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ClientRequestToken", option_to_yojson idempotency_token_to_yojson x.client_request_token);
      ( "SessionIdleTimeoutInMinutes",
        option_to_yojson session_idle_timeout_in_minutes_to_yojson x.session_idle_timeout_in_minutes
      );
      ("NotebookVersion", option_to_yojson name_string_to_yojson x.notebook_version);
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ("EngineConfiguration", Some (engine_configuration_to_yojson x.engine_configuration));
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("Description", option_to_yojson description_string_to_yojson x.description);
    ]

let session_already_exists_exception_to_yojson (x : session_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let start_query_execution_output_to_yojson (x : start_query_execution_output) =
  assoc_to_yojson
    [ ("QueryExecutionId", option_to_yojson query_execution_id_to_yojson x.query_execution_id) ]

let database_string_to_yojson = string_to_yojson

let query_execution_context_to_yojson (x : query_execution_context) =
  assoc_to_yojson
    [
      ("Catalog", option_to_yojson catalog_name_string_to_yojson x.catalog);
      ("Database", option_to_yojson database_string_to_yojson x.database);
    ]

let execution_parameter_to_yojson = string_to_yojson
let execution_parameters_to_yojson tree = list_to_yojson execution_parameter_to_yojson tree
let age_to_yojson = int_to_yojson

let result_reuse_by_age_configuration_to_yojson (x : result_reuse_by_age_configuration) =
  assoc_to_yojson
    [
      ("MaxAgeInMinutes", option_to_yojson age_to_yojson x.max_age_in_minutes);
      ("Enabled", Some (boolean__to_yojson x.enabled));
    ]

let result_reuse_configuration_to_yojson (x : result_reuse_configuration) =
  assoc_to_yojson
    [
      ( "ResultReuseByAgeConfiguration",
        option_to_yojson result_reuse_by_age_configuration_to_yojson
          x.result_reuse_by_age_configuration );
    ]

let start_query_execution_input_to_yojson (x : start_query_execution_input) =
  assoc_to_yojson
    [
      ("EngineConfiguration", option_to_yojson engine_configuration_to_yojson x.engine_configuration);
      ( "ResultReuseConfiguration",
        option_to_yojson result_reuse_configuration_to_yojson x.result_reuse_configuration );
      ("ExecutionParameters", option_to_yojson execution_parameters_to_yojson x.execution_parameters);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("ResultConfiguration", option_to_yojson result_configuration_to_yojson x.result_configuration);
      ( "QueryExecutionContext",
        option_to_yojson query_execution_context_to_yojson x.query_execution_context );
      ( "ClientRequestToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("QueryString", Some (query_string_to_yojson x.query_string));
    ]

let start_calculation_execution_response_to_yojson (x : start_calculation_execution_response) =
  assoc_to_yojson
    [
      ("State", option_to_yojson calculation_execution_state_to_yojson x.state);
      ( "CalculationExecutionId",
        option_to_yojson calculation_execution_id_to_yojson x.calculation_execution_id );
    ]

let code_block_to_yojson = string_to_yojson

let calculation_configuration_to_yojson (x : calculation_configuration) =
  assoc_to_yojson [ ("CodeBlock", option_to_yojson code_block_to_yojson x.code_block) ]

let start_calculation_execution_request_to_yojson (x : start_calculation_execution_request) =
  assoc_to_yojson
    [
      ("ClientRequestToken", option_to_yojson idempotency_token_to_yojson x.client_request_token);
      ("CodeBlock", option_to_yojson code_block_to_yojson x.code_block);
      ( "CalculationConfiguration",
        option_to_yojson calculation_configuration_to_yojson x.calculation_configuration );
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("SessionId", Some (session_id_to_yojson x.session_id));
    ]

let session_status_to_yojson (x : session_status) =
  assoc_to_yojson
    [
      ("StateChangeReason", option_to_yojson description_string_to_yojson x.state_change_reason);
      ("State", option_to_yojson session_state_to_yojson x.state);
      ("IdleSinceDateTime", option_to_yojson date_to_yojson x.idle_since_date_time);
      ("EndDateTime", option_to_yojson date_to_yojson x.end_date_time);
      ("LastModifiedDateTime", option_to_yojson date_to_yojson x.last_modified_date_time);
      ("StartDateTime", option_to_yojson date_to_yojson x.start_date_time);
    ]

let session_summary_to_yojson (x : session_summary) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson session_status_to_yojson x.status);
      ("NotebookVersion", option_to_yojson name_string_to_yojson x.notebook_version);
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
    ]

let sessions_list_to_yojson tree = list_to_yojson session_summary_to_yojson tree
let long_to_yojson = long_to_yojson

let session_statistics_to_yojson (x : session_statistics) =
  assoc_to_yojson
    [ ("DpuExecutionInMillis", option_to_yojson long_to_yojson x.dpu_execution_in_millis) ]

let session_manager_token_to_yojson = string_to_yojson

let session_configuration_to_yojson (x : session_configuration) =
  assoc_to_yojson
    [
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "SessionIdleTimeoutInMinutes",
        option_to_yojson session_idle_timeout_in_minutes_to_yojson x.session_idle_timeout_in_minutes
      );
      ("IdleTimeoutSeconds", option_to_yojson long_to_yojson x.idle_timeout_seconds);
      ("WorkingDirectory", option_to_yojson result_output_location_to_yojson x.working_directory);
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
    ]

let s3_uri_to_yojson = string_to_yojson

let row_to_yojson (x : row) =
  assoc_to_yojson [ ("Data", option_to_yojson datum_list_to_yojson x.data) ]

let row_list_to_yojson tree = list_to_yojson row_to_yojson tree

let column_nullable_to_yojson (x : column_nullable) =
  match x with
  | UNKNOWN -> `String "UNKNOWN"
  | NULLABLE -> `String "NULLABLE"
  | NOT_NULL -> `String "NOT_NULL"

let column_info_to_yojson (x : column_info) =
  assoc_to_yojson
    [
      ("CaseSensitive", option_to_yojson boolean__to_yojson x.case_sensitive);
      ("Nullable", option_to_yojson column_nullable_to_yojson x.nullable);
      ("Scale", option_to_yojson integer_to_yojson x.scale);
      ("Precision", option_to_yojson integer_to_yojson x.precision);
      ("Type", Some (string__to_yojson x.type_));
      ("Label", option_to_yojson string__to_yojson x.label);
      ("Name", Some (string__to_yojson x.name));
      ("TableName", option_to_yojson string__to_yojson x.table_name);
      ("SchemaName", option_to_yojson string__to_yojson x.schema_name);
      ("CatalogName", option_to_yojson string__to_yojson x.catalog_name);
    ]

let column_info_list_to_yojson tree = list_to_yojson column_info_to_yojson tree

let result_set_metadata_to_yojson (x : result_set_metadata) =
  assoc_to_yojson [ ("ColumnInfo", option_to_yojson column_info_list_to_yojson x.column_info) ]

let result_set_to_yojson (x : result_set) =
  assoc_to_yojson
    [
      ("ResultSetMetadata", option_to_yojson result_set_metadata_to_yojson x.result_set_metadata);
      ("Rows", option_to_yojson row_list_to_yojson x.rows);
    ]

let result_reuse_information_to_yojson (x : result_reuse_information) =
  assoc_to_yojson [ ("ReusedPreviousResult", Some (boolean__to_yojson x.reused_previous_result)) ]

let rec query_stage_plan_node_to_yojson (x : query_stage_plan_node) =
  assoc_to_yojson
    [
      ("RemoteSources", option_to_yojson string_list_to_yojson x.remote_sources);
      ("Children", option_to_yojson query_stage_plan_nodes_to_yojson x.children);
      ("Identifier", option_to_yojson string__to_yojson x.identifier);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

and query_stage_plan_nodes_to_yojson tree = list_to_yojson query_stage_plan_node_to_yojson tree

let rec query_stage_to_yojson (x : query_stage) =
  assoc_to_yojson
    [
      ("SubStages", option_to_yojson query_stages_to_yojson x.sub_stages);
      ("QueryStagePlan", option_to_yojson query_stage_plan_node_to_yojson x.query_stage_plan);
      ("ExecutionTime", option_to_yojson long_to_yojson x.execution_time);
      ("InputRows", option_to_yojson long_to_yojson x.input_rows);
      ("InputBytes", option_to_yojson long_to_yojson x.input_bytes);
      ("OutputRows", option_to_yojson long_to_yojson x.output_rows);
      ("OutputBytes", option_to_yojson long_to_yojson x.output_bytes);
      ("State", option_to_yojson string__to_yojson x.state);
      ("StageId", option_to_yojson long_to_yojson x.stage_id);
    ]

and query_stages_to_yojson tree = list_to_yojson query_stage_to_yojson tree

let query_runtime_statistics_timeline_to_yojson (x : query_runtime_statistics_timeline) =
  assoc_to_yojson
    [
      ( "TotalExecutionTimeInMillis",
        option_to_yojson long_to_yojson x.total_execution_time_in_millis );
      ( "ServiceProcessingTimeInMillis",
        option_to_yojson long_to_yojson x.service_processing_time_in_millis );
      ( "EngineExecutionTimeInMillis",
        option_to_yojson long_to_yojson x.engine_execution_time_in_millis );
      ("QueryPlanningTimeInMillis", option_to_yojson long_to_yojson x.query_planning_time_in_millis);
      ( "ServicePreProcessingTimeInMillis",
        option_to_yojson long_to_yojson x.service_pre_processing_time_in_millis );
      ("QueryQueueTimeInMillis", option_to_yojson long_to_yojson x.query_queue_time_in_millis);
    ]

let query_runtime_statistics_rows_to_yojson (x : query_runtime_statistics_rows) =
  assoc_to_yojson
    [
      ("OutputRows", option_to_yojson long_to_yojson x.output_rows);
      ("OutputBytes", option_to_yojson long_to_yojson x.output_bytes);
      ("InputBytes", option_to_yojson long_to_yojson x.input_bytes);
      ("InputRows", option_to_yojson long_to_yojson x.input_rows);
    ]

let query_runtime_statistics_to_yojson (x : query_runtime_statistics) =
  assoc_to_yojson
    [
      ("OutputStage", option_to_yojson query_stage_to_yojson x.output_stage);
      ("Rows", option_to_yojson query_runtime_statistics_rows_to_yojson x.rows);
      ("Timeline", option_to_yojson query_runtime_statistics_timeline_to_yojson x.timeline);
    ]

let query_result_type_to_yojson (x : query_result_type) =
  match x with DATA_ROWS -> `String "DATA_ROWS" | DATA_MANIFEST -> `String "DATA_MANIFEST"

let query_execution_state_to_yojson (x : query_execution_state) =
  match x with
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | RUNNING -> `String "RUNNING"
  | QUEUED -> `String "QUEUED"

let error_category_to_yojson = int_to_yojson
let error_type_to_yojson = int_to_yojson

let athena_error_to_yojson (x : athena_error) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("Retryable", option_to_yojson boolean__to_yojson x.retryable);
      ("ErrorType", option_to_yojson error_type_to_yojson x.error_type);
      ("ErrorCategory", option_to_yojson error_category_to_yojson x.error_category);
    ]

let query_execution_status_to_yojson (x : query_execution_status) =
  assoc_to_yojson
    [
      ("AthenaError", option_to_yojson athena_error_to_yojson x.athena_error);
      ("CompletionDateTime", option_to_yojson date_to_yojson x.completion_date_time);
      ("SubmissionDateTime", option_to_yojson date_to_yojson x.submission_date_time);
      ("StateChangeReason", option_to_yojson string__to_yojson x.state_change_reason);
      ("State", option_to_yojson query_execution_state_to_yojson x.state);
    ]

let dpu_count_to_yojson = double_to_yojson

let query_execution_statistics_to_yojson (x : query_execution_statistics) =
  assoc_to_yojson
    [
      ("DpuCount", option_to_yojson dpu_count_to_yojson x.dpu_count);
      ( "ResultReuseInformation",
        option_to_yojson result_reuse_information_to_yojson x.result_reuse_information );
      ( "ServiceProcessingTimeInMillis",
        option_to_yojson long_to_yojson x.service_processing_time_in_millis );
      ("QueryPlanningTimeInMillis", option_to_yojson long_to_yojson x.query_planning_time_in_millis);
      ( "ServicePreProcessingTimeInMillis",
        option_to_yojson long_to_yojson x.service_pre_processing_time_in_millis );
      ("QueryQueueTimeInMillis", option_to_yojson long_to_yojson x.query_queue_time_in_millis);
      ( "TotalExecutionTimeInMillis",
        option_to_yojson long_to_yojson x.total_execution_time_in_millis );
      ("DataManifestLocation", option_to_yojson string__to_yojson x.data_manifest_location);
      ("DataScannedInBytes", option_to_yojson long_to_yojson x.data_scanned_in_bytes);
      ( "EngineExecutionTimeInMillis",
        option_to_yojson long_to_yojson x.engine_execution_time_in_millis );
    ]

let query_execution_to_yojson (x : query_execution) =
  assoc_to_yojson
    [
      ( "QueryResultsS3AccessGrantsConfiguration",
        option_to_yojson query_results_s3_access_grants_configuration_to_yojson
          x.query_results_s3_access_grants_configuration );
      ("SubstatementType", option_to_yojson string__to_yojson x.substatement_type);
      ("ExecutionParameters", option_to_yojson execution_parameters_to_yojson x.execution_parameters);
      ("EngineVersion", option_to_yojson engine_version_to_yojson x.engine_version);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("Statistics", option_to_yojson query_execution_statistics_to_yojson x.statistics);
      ("Status", option_to_yojson query_execution_status_to_yojson x.status);
      ( "QueryExecutionContext",
        option_to_yojson query_execution_context_to_yojson x.query_execution_context );
      ( "ResultReuseConfiguration",
        option_to_yojson result_reuse_configuration_to_yojson x.result_reuse_configuration );
      ("ResultConfiguration", option_to_yojson result_configuration_to_yojson x.result_configuration);
      ( "ManagedQueryResultsConfiguration",
        option_to_yojson managed_query_results_configuration_to_yojson
          x.managed_query_results_configuration );
      ("StatementType", option_to_yojson statement_type_to_yojson x.statement_type);
      ("Query", option_to_yojson query_string_to_yojson x.query);
      ("QueryExecutionId", option_to_yojson query_execution_id_to_yojson x.query_execution_id);
    ]

let query_execution_list_to_yojson tree = list_to_yojson query_execution_to_yojson tree
let query_execution_id_list_to_yojson tree = list_to_yojson query_execution_id_to_yojson tree
let put_capacity_assignment_configuration_output_to_yojson = unit_to_yojson

let capacity_assignment_to_yojson (x : capacity_assignment) =
  assoc_to_yojson
    [ ("WorkGroupNames", option_to_yojson work_group_names_list_to_yojson x.work_group_names) ]

let capacity_assignments_list_to_yojson tree = list_to_yojson capacity_assignment_to_yojson tree

let put_capacity_assignment_configuration_input_to_yojson
    (x : put_capacity_assignment_configuration_input) =
  assoc_to_yojson
    [
      ("CapacityAssignments", Some (capacity_assignments_list_to_yojson x.capacity_assignments));
      ( "CapacityReservationName",
        Some (capacity_reservation_name_to_yojson x.capacity_reservation_name) );
    ]

let prepared_statement_summary_to_yojson (x : prepared_statement_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson date_to_yojson x.last_modified_time);
      ("StatementName", option_to_yojson statement_name_to_yojson x.statement_name);
    ]

let prepared_statements_list_to_yojson tree =
  list_to_yojson prepared_statement_summary_to_yojson tree

let prepared_statement_name_list_to_yojson tree = list_to_yojson statement_name_to_yojson tree

let prepared_statement_to_yojson (x : prepared_statement) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson date_to_yojson x.last_modified_time);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("WorkGroupName", option_to_yojson work_group_name_to_yojson x.work_group_name);
      ("QueryStatement", option_to_yojson query_string_to_yojson x.query_statement);
      ("StatementName", option_to_yojson statement_name_to_yojson x.statement_name);
    ]

let prepared_statement_details_list_to_yojson tree =
  list_to_yojson prepared_statement_to_yojson tree

let notebook_session_summary_to_yojson (x : notebook_session_summary) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
    ]

let notebook_sessions_list_to_yojson tree = list_to_yojson notebook_session_summary_to_yojson tree

let notebook_metadata_to_yojson (x : notebook_metadata) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson date_to_yojson x.last_modified_time);
      ("Type", option_to_yojson notebook_type_to_yojson x.type_);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("Name", option_to_yojson notebook_name_to_yojson x.name);
      ("NotebookId", option_to_yojson notebook_id_to_yojson x.notebook_id);
    ]

let notebook_metadata_array_to_yojson tree = list_to_yojson notebook_metadata_to_yojson tree

let named_query_to_yojson (x : named_query) =
  assoc_to_yojson
    [
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("NamedQueryId", option_to_yojson named_query_id_to_yojson x.named_query_id);
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ("Database", Some (database_string_to_yojson x.database));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let named_query_list_to_yojson tree = list_to_yojson named_query_to_yojson tree
let named_query_id_list_to_yojson tree = list_to_yojson named_query_id_to_yojson tree

let metadata_exception_to_yojson (x : metadata_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let max_work_groups_count_to_yojson = int_to_yojson
let max_tags_count_to_yojson = int_to_yojson
let max_table_metadata_count_to_yojson = int_to_yojson
let max_sessions_count_to_yojson = int_to_yojson
let max_query_results_to_yojson = int_to_yojson
let max_query_executions_count_to_yojson = int_to_yojson
let max_prepared_statements_count_to_yojson = int_to_yojson
let max_notebooks_count_to_yojson = int_to_yojson
let max_named_queries_count_to_yojson = int_to_yojson
let max_list_executors_count_to_yojson = int_to_yojson
let max_engine_versions_count_to_yojson = int_to_yojson
let max_databases_count_to_yojson = int_to_yojson
let max_data_catalogs_count_to_yojson = int_to_yojson
let max_capacity_reservations_count_to_yojson = int_to_yojson
let max_calculations_count_to_yojson = int_to_yojson
let max_application_dpu_sizes_count_to_yojson = int_to_yojson

let list_work_groups_output_to_yojson (x : list_work_groups_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("WorkGroups", option_to_yojson work_groups_list_to_yojson x.work_groups);
    ]

let list_work_groups_input_to_yojson (x : list_work_groups_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_work_groups_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_tags_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let list_table_metadata_output_to_yojson (x : list_table_metadata_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("TableMetadataList", option_to_yojson table_metadata_list_to_yojson x.table_metadata_list);
    ]

let expression_string_to_yojson = string_to_yojson

let list_table_metadata_input_to_yojson (x : list_table_metadata_input) =
  assoc_to_yojson
    [
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("MaxResults", option_to_yojson max_table_metadata_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Expression", option_to_yojson expression_string_to_yojson x.expression);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogName", Some (catalog_name_string_to_yojson x.catalog_name));
    ]

let list_sessions_response_to_yojson (x : list_sessions_response) =
  assoc_to_yojson
    [
      ("Sessions", option_to_yojson sessions_list_to_yojson x.sessions);
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
    ]

let list_sessions_request_to_yojson (x : list_sessions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_sessions_count_to_yojson x.max_results);
      ("StateFilter", option_to_yojson session_state_to_yojson x.state_filter);
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
    ]

let list_query_executions_output_to_yojson (x : list_query_executions_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("QueryExecutionIds", option_to_yojson query_execution_id_list_to_yojson x.query_execution_ids);
    ]

let list_query_executions_input_to_yojson (x : list_query_executions_input) =
  assoc_to_yojson
    [
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("MaxResults", option_to_yojson max_query_executions_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_prepared_statements_output_to_yojson (x : list_prepared_statements_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "PreparedStatements",
        option_to_yojson prepared_statements_list_to_yojson x.prepared_statements );
    ]

let list_prepared_statements_input_to_yojson (x : list_prepared_statements_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_prepared_statements_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
    ]

let list_notebook_sessions_response_to_yojson (x : list_notebook_sessions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("NotebookSessionsList", Some (notebook_sessions_list_to_yojson x.notebook_sessions_list));
    ]

let list_notebook_sessions_request_to_yojson (x : list_notebook_sessions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_sessions_count_to_yojson x.max_results);
      ("NotebookId", Some (notebook_id_to_yojson x.notebook_id));
    ]

let list_notebook_metadata_output_to_yojson (x : list_notebook_metadata_output) =
  assoc_to_yojson
    [
      ( "NotebookMetadataList",
        option_to_yojson notebook_metadata_array_to_yojson x.notebook_metadata_list );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let filter_definition_to_yojson (x : filter_definition) =
  assoc_to_yojson [ ("Name", option_to_yojson notebook_name_to_yojson x.name) ]

let list_notebook_metadata_input_to_yojson (x : list_notebook_metadata_input) =
  assoc_to_yojson
    [
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("MaxResults", option_to_yojson max_notebooks_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Filters", option_to_yojson filter_definition_to_yojson x.filters);
    ]

let list_named_queries_output_to_yojson (x : list_named_queries_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("NamedQueryIds", option_to_yojson named_query_id_list_to_yojson x.named_query_ids);
    ]

let list_named_queries_input_to_yojson (x : list_named_queries_input) =
  assoc_to_yojson
    [
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("MaxResults", option_to_yojson max_named_queries_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let executor_id_to_yojson = string_to_yojson

let executor_type_to_yojson (x : executor_type) =
  match x with
  | WORKER -> `String "WORKER"
  | GATEWAY -> `String "GATEWAY"
  | COORDINATOR -> `String "COORDINATOR"

let executor_state_to_yojson (x : executor_state) =
  match x with
  | FAILED -> `String "FAILED"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | REGISTERED -> `String "REGISTERED"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let executors_summary_to_yojson (x : executors_summary) =
  assoc_to_yojson
    [
      ("ExecutorSize", option_to_yojson long_to_yojson x.executor_size);
      ("ExecutorState", option_to_yojson executor_state_to_yojson x.executor_state);
      ("TerminationDateTime", option_to_yojson long_to_yojson x.termination_date_time);
      ("StartDateTime", option_to_yojson long_to_yojson x.start_date_time);
      ("ExecutorType", option_to_yojson executor_type_to_yojson x.executor_type);
      ("ExecutorId", Some (executor_id_to_yojson x.executor_id));
    ]

let executors_summary_list_to_yojson tree = list_to_yojson executors_summary_to_yojson tree

let list_executors_response_to_yojson (x : list_executors_response) =
  assoc_to_yojson
    [
      ("ExecutorsSummary", option_to_yojson executors_summary_list_to_yojson x.executors_summary);
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
      ("SessionId", Some (session_id_to_yojson x.session_id));
    ]

let list_executors_request_to_yojson (x : list_executors_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_list_executors_count_to_yojson x.max_results);
      ("ExecutorStateFilter", option_to_yojson executor_state_to_yojson x.executor_state_filter);
      ("SessionId", Some (session_id_to_yojson x.session_id));
    ]

let engine_versions_list_to_yojson tree = list_to_yojson engine_version_to_yojson tree

let list_engine_versions_output_to_yojson (x : list_engine_versions_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("EngineVersions", option_to_yojson engine_versions_list_to_yojson x.engine_versions);
    ]

let list_engine_versions_input_to_yojson (x : list_engine_versions_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_engine_versions_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let database_to_yojson (x : database) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let database_list_to_yojson tree = list_to_yojson database_to_yojson tree

let list_databases_output_to_yojson (x : list_databases_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("DatabaseList", option_to_yojson database_list_to_yojson x.database_list);
    ]

let list_databases_input_to_yojson (x : list_databases_input) =
  assoc_to_yojson
    [
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("MaxResults", option_to_yojson max_databases_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("CatalogName", Some (catalog_name_string_to_yojson x.catalog_name));
    ]

let data_catalog_status_to_yojson (x : data_catalog_status) =
  match x with
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_COMPLETE -> `String "DELETE_COMPLETE"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | CREATE_FAILED_CLEANUP_FAILED -> `String "CREATE_FAILED_CLEANUP_FAILED"
  | CREATE_FAILED_CLEANUP_COMPLETE -> `String "CREATE_FAILED_CLEANUP_COMPLETE"
  | CREATE_FAILED_CLEANUP_IN_PROGRESS -> `String "CREATE_FAILED_CLEANUP_IN_PROGRESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATE_COMPLETE -> `String "CREATE_COMPLETE"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"

let connection_type_to_yojson (x : connection_type) =
  match x with
  | DB2AS400 -> `String "DB2AS400"
  | DATALAKEGEN2 -> `String "DATALAKEGEN2"
  | SNOWFLAKE -> `String "SNOWFLAKE"
  | SAPHANA -> `String "SAPHANA"
  | TIMESTREAM -> `String "TIMESTREAM"
  | TPCDS -> `String "TPCDS"
  | CMDB -> `String "CMDB"
  | DOCUMENTDB -> `String "DOCUMENTDB"
  | HBASE -> `String "HBASE"
  | GOOGLECLOUDSTORAGE -> `String "GOOGLECLOUDSTORAGE"
  | BIGQUERY -> `String "BIGQUERY"
  | OPENSEARCH -> `String "OPENSEARCH"
  | DB2 -> `String "DB2"
  | SQLSERVER -> `String "SQLSERVER"
  | SYNAPSE -> `String "SYNAPSE"
  | ORACLE -> `String "ORACLE"
  | REDSHIFT -> `String "REDSHIFT"
  | POSTGRESQL -> `String "POSTGRESQL"
  | MYSQL -> `String "MYSQL"
  | DYNAMODB -> `String "DYNAMODB"

let data_catalog_summary_to_yojson (x : data_catalog_summary) =
  assoc_to_yojson
    [
      ("Error", option_to_yojson error_message_to_yojson x.error);
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("Status", option_to_yojson data_catalog_status_to_yojson x.status);
      ("Type", option_to_yojson data_catalog_type_to_yojson x.type_);
      ("CatalogName", option_to_yojson catalog_name_string_to_yojson x.catalog_name);
    ]

let data_catalog_summary_list_to_yojson tree = list_to_yojson data_catalog_summary_to_yojson tree

let list_data_catalogs_output_to_yojson (x : list_data_catalogs_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "DataCatalogsSummary",
        option_to_yojson data_catalog_summary_list_to_yojson x.data_catalogs_summary );
    ]

let list_data_catalogs_input_to_yojson (x : list_data_catalogs_input) =
  assoc_to_yojson
    [
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("MaxResults", option_to_yojson max_data_catalogs_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let capacity_reservation_status_to_yojson (x : capacity_reservation_status) =
  match x with
  | UPDATE_PENDING -> `String "UPDATE_PENDING"
  | FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"
  | CANCELLING -> `String "CANCELLING"
  | ACTIVE -> `String "ACTIVE"
  | PENDING -> `String "PENDING"

let allocated_dpus_integer_to_yojson = int_to_yojson

let capacity_allocation_status_to_yojson (x : capacity_allocation_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | PENDING -> `String "PENDING"

let capacity_allocation_to_yojson (x : capacity_allocation) =
  assoc_to_yojson
    [
      ("RequestCompletionTime", option_to_yojson timestamp_to_yojson x.request_completion_time);
      ("RequestTime", Some (timestamp_to_yojson x.request_time));
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("Status", Some (capacity_allocation_status_to_yojson x.status));
    ]

let capacity_reservation_to_yojson (x : capacity_reservation) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "LastSuccessfulAllocationTime",
        option_to_yojson timestamp_to_yojson x.last_successful_allocation_time );
      ("LastAllocation", option_to_yojson capacity_allocation_to_yojson x.last_allocation);
      ("AllocatedDpus", Some (allocated_dpus_integer_to_yojson x.allocated_dpus));
      ("TargetDpus", Some (target_dpus_integer_to_yojson x.target_dpus));
      ("Status", Some (capacity_reservation_status_to_yojson x.status));
      ("Name", Some (capacity_reservation_name_to_yojson x.name));
    ]

let capacity_reservations_list_to_yojson tree = list_to_yojson capacity_reservation_to_yojson tree

let list_capacity_reservations_output_to_yojson (x : list_capacity_reservations_output) =
  assoc_to_yojson
    [
      ("CapacityReservations", Some (capacity_reservations_list_to_yojson x.capacity_reservations));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_capacity_reservations_input_to_yojson (x : list_capacity_reservations_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_capacity_reservations_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let calculation_status_to_yojson (x : calculation_status) =
  assoc_to_yojson
    [
      ("StateChangeReason", option_to_yojson description_string_to_yojson x.state_change_reason);
      ("State", option_to_yojson calculation_execution_state_to_yojson x.state);
      ("CompletionDateTime", option_to_yojson date_to_yojson x.completion_date_time);
      ("SubmissionDateTime", option_to_yojson date_to_yojson x.submission_date_time);
    ]

let calculation_summary_to_yojson (x : calculation_summary) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson calculation_status_to_yojson x.status);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ( "CalculationExecutionId",
        option_to_yojson calculation_execution_id_to_yojson x.calculation_execution_id );
    ]

let calculations_list_to_yojson tree = list_to_yojson calculation_summary_to_yojson tree

let list_calculation_executions_response_to_yojson (x : list_calculation_executions_response) =
  assoc_to_yojson
    [
      ("Calculations", option_to_yojson calculations_list_to_yojson x.calculations);
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
    ]

let list_calculation_executions_request_to_yojson (x : list_calculation_executions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson session_manager_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_calculations_count_to_yojson x.max_results);
      ("StateFilter", option_to_yojson calculation_execution_state_to_yojson x.state_filter);
      ("SessionId", Some (session_id_to_yojson x.session_id));
    ]

let application_dpu_sizes_to_yojson (x : application_dpu_sizes) =
  assoc_to_yojson
    [
      ("SupportedDPUSizes", option_to_yojson supported_dpu_size_list_to_yojson x.supported_dpu_sizes);
      ("ApplicationRuntimeId", option_to_yojson name_string_to_yojson x.application_runtime_id);
    ]

let application_dpu_sizes_list_to_yojson tree = list_to_yojson application_dpu_sizes_to_yojson tree

let list_application_dpu_sizes_output_to_yojson (x : list_application_dpu_sizes_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "ApplicationDPUSizes",
        option_to_yojson application_dpu_sizes_list_to_yojson x.application_dpu_sizes );
    ]

let list_application_dpu_sizes_input_to_yojson (x : list_application_dpu_sizes_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_application_dpu_sizes_count_to_yojson x.max_results);
    ]

let import_notebook_output_to_yojson (x : import_notebook_output) =
  assoc_to_yojson [ ("NotebookId", option_to_yojson notebook_id_to_yojson x.notebook_id) ]

let import_notebook_input_to_yojson (x : import_notebook_input) =
  assoc_to_yojson
    [
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("NotebookS3LocationUri", option_to_yojson s3_uri_to_yojson x.notebook_s3_location_uri);
      ("Type", Some (notebook_type_to_yojson x.type_));
      ("Payload", option_to_yojson payload_to_yojson x.payload);
      ("Name", Some (notebook_name_to_yojson x.name));
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
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
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogName", Some (catalog_name_string_to_yojson x.catalog_name));
    ]

let get_session_status_response_to_yojson (x : get_session_status_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson session_status_to_yojson x.status);
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
    ]

let get_session_status_request_to_yojson (x : get_session_status_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let get_session_response_to_yojson (x : get_session_response) =
  assoc_to_yojson
    [
      ("Statistics", option_to_yojson session_statistics_to_yojson x.statistics);
      ("Status", option_to_yojson session_status_to_yojson x.status);
      ( "SessionConfiguration",
        option_to_yojson session_configuration_to_yojson x.session_configuration );
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ("NotebookVersion", option_to_yojson name_string_to_yojson x.notebook_version);
      ("EngineConfiguration", option_to_yojson engine_configuration_to_yojson x.engine_configuration);
      ("EngineVersion", option_to_yojson name_string_to_yojson x.engine_version);
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
    ]

let get_session_request_to_yojson (x : get_session_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let get_session_endpoint_response_to_yojson (x : get_session_endpoint_response) =
  assoc_to_yojson
    [
      ("AuthTokenExpirationTime", Some (timestamp_to_yojson x.auth_token_expiration_time));
      ("AuthToken", Some (string__to_yojson x.auth_token));
      ("EndpointUrl", Some (string__to_yojson x.endpoint_url));
    ]

let get_session_endpoint_request_to_yojson (x : get_session_endpoint_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let get_resource_dashboard_response_to_yojson (x : get_resource_dashboard_response) =
  assoc_to_yojson [ ("Url", Some (string__to_yojson x.url)) ]

let get_resource_dashboard_request_to_yojson (x : get_resource_dashboard_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let get_query_runtime_statistics_output_to_yojson (x : get_query_runtime_statistics_output) =
  assoc_to_yojson
    [
      ( "QueryRuntimeStatistics",
        option_to_yojson query_runtime_statistics_to_yojson x.query_runtime_statistics );
    ]

let get_query_runtime_statistics_input_to_yojson (x : get_query_runtime_statistics_input) =
  assoc_to_yojson [ ("QueryExecutionId", Some (query_execution_id_to_yojson x.query_execution_id)) ]

let get_query_results_output_to_yojson (x : get_query_results_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("ResultSet", option_to_yojson result_set_to_yojson x.result_set);
      ("UpdateCount", option_to_yojson long_to_yojson x.update_count);
    ]

let get_query_results_input_to_yojson (x : get_query_results_input) =
  assoc_to_yojson
    [
      ("QueryResultType", option_to_yojson query_result_type_to_yojson x.query_result_type);
      ("MaxResults", option_to_yojson max_query_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("QueryExecutionId", Some (query_execution_id_to_yojson x.query_execution_id));
    ]

let get_query_execution_output_to_yojson (x : get_query_execution_output) =
  assoc_to_yojson
    [ ("QueryExecution", option_to_yojson query_execution_to_yojson x.query_execution) ]

let get_query_execution_input_to_yojson (x : get_query_execution_input) =
  assoc_to_yojson [ ("QueryExecutionId", Some (query_execution_id_to_yojson x.query_execution_id)) ]

let get_prepared_statement_output_to_yojson (x : get_prepared_statement_output) =
  assoc_to_yojson
    [ ("PreparedStatement", option_to_yojson prepared_statement_to_yojson x.prepared_statement) ]

let get_prepared_statement_input_to_yojson (x : get_prepared_statement_input) =
  assoc_to_yojson
    [
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("StatementName", Some (statement_name_to_yojson x.statement_name));
    ]

let get_notebook_metadata_output_to_yojson (x : get_notebook_metadata_output) =
  assoc_to_yojson
    [ ("NotebookMetadata", option_to_yojson notebook_metadata_to_yojson x.notebook_metadata) ]

let get_notebook_metadata_input_to_yojson (x : get_notebook_metadata_input) =
  assoc_to_yojson [ ("NotebookId", Some (notebook_id_to_yojson x.notebook_id)) ]

let get_named_query_output_to_yojson (x : get_named_query_output) =
  assoc_to_yojson [ ("NamedQuery", option_to_yojson named_query_to_yojson x.named_query) ]

let get_named_query_input_to_yojson (x : get_named_query_input) =
  assoc_to_yojson [ ("NamedQueryId", Some (named_query_id_to_yojson x.named_query_id)) ]

let get_database_output_to_yojson (x : get_database_output) =
  assoc_to_yojson [ ("Database", option_to_yojson database_to_yojson x.database) ]

let get_database_input_to_yojson (x : get_database_input) =
  assoc_to_yojson
    [
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogName", Some (catalog_name_string_to_yojson x.catalog_name));
    ]

let data_catalog_to_yojson (x : data_catalog) =
  assoc_to_yojson
    [
      ("Error", option_to_yojson error_message_to_yojson x.error);
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("Status", option_to_yojson data_catalog_status_to_yojson x.status);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("Type", Some (data_catalog_type_to_yojson x.type_));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (catalog_name_string_to_yojson x.name));
    ]

let get_data_catalog_output_to_yojson (x : get_data_catalog_output) =
  assoc_to_yojson [ ("DataCatalog", option_to_yojson data_catalog_to_yojson x.data_catalog) ]

let get_data_catalog_input_to_yojson (x : get_data_catalog_input) =
  assoc_to_yojson
    [
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ("Name", Some (catalog_name_string_to_yojson x.name));
    ]

let get_capacity_reservation_output_to_yojson (x : get_capacity_reservation_output) =
  assoc_to_yojson
    [ ("CapacityReservation", Some (capacity_reservation_to_yojson x.capacity_reservation)) ]

let get_capacity_reservation_input_to_yojson (x : get_capacity_reservation_input) =
  assoc_to_yojson [ ("Name", Some (capacity_reservation_name_to_yojson x.name)) ]

let capacity_assignment_configuration_to_yojson (x : capacity_assignment_configuration) =
  assoc_to_yojson
    [
      ( "CapacityAssignments",
        option_to_yojson capacity_assignments_list_to_yojson x.capacity_assignments );
      ( "CapacityReservationName",
        option_to_yojson capacity_reservation_name_to_yojson x.capacity_reservation_name );
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
      ("Progress", option_to_yojson description_string_to_yojson x.progress);
      ("DpuExecutionInMillis", option_to_yojson long_to_yojson x.dpu_execution_in_millis);
    ]

let get_calculation_execution_status_response_to_yojson
    (x : get_calculation_execution_status_response) =
  assoc_to_yojson
    [
      ("Statistics", option_to_yojson calculation_statistics_to_yojson x.statistics);
      ("Status", option_to_yojson calculation_status_to_yojson x.status);
    ]

let get_calculation_execution_status_request_to_yojson
    (x : get_calculation_execution_status_request) =
  assoc_to_yojson
    [
      ( "CalculationExecutionId",
        Some (calculation_execution_id_to_yojson x.calculation_execution_id) );
    ]

let calculation_result_type_to_yojson = string_to_yojson

let calculation_result_to_yojson (x : calculation_result) =
  assoc_to_yojson
    [
      ("ResultType", option_to_yojson calculation_result_type_to_yojson x.result_type);
      ("ResultS3Uri", option_to_yojson s3_uri_to_yojson x.result_s3_uri);
      ("StdErrorS3Uri", option_to_yojson s3_uri_to_yojson x.std_error_s3_uri);
      ("StdOutS3Uri", option_to_yojson s3_uri_to_yojson x.std_out_s3_uri);
    ]

let get_calculation_execution_response_to_yojson (x : get_calculation_execution_response) =
  assoc_to_yojson
    [
      ("Result", option_to_yojson calculation_result_to_yojson x.result_);
      ("Statistics", option_to_yojson calculation_statistics_to_yojson x.statistics);
      ("Status", option_to_yojson calculation_status_to_yojson x.status);
      ("WorkingDirectory", option_to_yojson s3_uri_to_yojson x.working_directory);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ( "CalculationExecutionId",
        option_to_yojson calculation_execution_id_to_yojson x.calculation_execution_id );
    ]

let get_calculation_execution_request_to_yojson (x : get_calculation_execution_request) =
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

let export_notebook_output_to_yojson (x : export_notebook_output) =
  assoc_to_yojson
    [
      ("Payload", option_to_yojson payload_to_yojson x.payload);
      ("NotebookMetadata", option_to_yojson notebook_metadata_to_yojson x.notebook_metadata);
    ]

let export_notebook_input_to_yojson (x : export_notebook_input) =
  assoc_to_yojson [ ("NotebookId", Some (notebook_id_to_yojson x.notebook_id)) ]

let delete_work_group_output_to_yojson = unit_to_yojson

let delete_work_group_input_to_yojson (x : delete_work_group_input) =
  assoc_to_yojson
    [
      ("RecursiveDeleteOption", option_to_yojson boxed_boolean_to_yojson x.recursive_delete_option);
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
    ]

let delete_prepared_statement_output_to_yojson = unit_to_yojson

let delete_prepared_statement_input_to_yojson (x : delete_prepared_statement_input) =
  assoc_to_yojson
    [
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("StatementName", Some (statement_name_to_yojson x.statement_name));
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
      ("DeleteCatalogOnly", option_to_yojson boolean__to_yojson x.delete_catalog_only);
      ("Name", Some (catalog_name_string_to_yojson x.name));
    ]

let delete_capacity_reservation_output_to_yojson = unit_to_yojson

let delete_capacity_reservation_input_to_yojson (x : delete_capacity_reservation_input) =
  assoc_to_yojson [ ("Name", Some (capacity_reservation_name_to_yojson x.name)) ]

let create_work_group_output_to_yojson = unit_to_yojson

let create_work_group_input_to_yojson (x : create_work_group_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson work_group_description_string_to_yojson x.description);
      ("Configuration", option_to_yojson work_group_configuration_to_yojson x.configuration);
      ("Name", Some (work_group_name_to_yojson x.name));
    ]

let auth_token_to_yojson = string_to_yojson

let create_presigned_notebook_url_response_to_yojson (x : create_presigned_notebook_url_response) =
  assoc_to_yojson
    [
      ("AuthTokenExpirationTime", Some (long_to_yojson x.auth_token_expiration_time));
      ("AuthToken", Some (auth_token_to_yojson x.auth_token));
      ("NotebookUrl", Some (string__to_yojson x.notebook_url));
    ]

let create_presigned_notebook_url_request_to_yojson (x : create_presigned_notebook_url_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let create_prepared_statement_output_to_yojson = unit_to_yojson

let create_prepared_statement_input_to_yojson (x : create_prepared_statement_input) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("QueryStatement", Some (query_string_to_yojson x.query_statement));
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ("StatementName", Some (statement_name_to_yojson x.statement_name));
    ]

let create_notebook_output_to_yojson (x : create_notebook_output) =
  assoc_to_yojson [ ("NotebookId", option_to_yojson notebook_id_to_yojson x.notebook_id) ]

let create_notebook_input_to_yojson (x : create_notebook_input) =
  assoc_to_yojson
    [
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("Name", Some (notebook_name_to_yojson x.name));
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
    ]

let create_named_query_output_to_yojson (x : create_named_query_output) =
  assoc_to_yojson [ ("NamedQueryId", option_to_yojson named_query_id_to_yojson x.named_query_id) ]

let create_named_query_input_to_yojson (x : create_named_query_input) =
  assoc_to_yojson
    [
      ("WorkGroup", option_to_yojson work_group_name_to_yojson x.work_group);
      ( "ClientRequestToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ("Database", Some (database_string_to_yojson x.database));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_data_catalog_output_to_yojson (x : create_data_catalog_output) =
  assoc_to_yojson [ ("DataCatalog", option_to_yojson data_catalog_to_yojson x.data_catalog) ]

let create_data_catalog_input_to_yojson (x : create_data_catalog_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Type", Some (data_catalog_type_to_yojson x.type_));
      ("Name", Some (catalog_name_string_to_yojson x.name));
    ]

let create_capacity_reservation_output_to_yojson = unit_to_yojson

let create_capacity_reservation_input_to_yojson (x : create_capacity_reservation_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Name", Some (capacity_reservation_name_to_yojson x.name));
      ("TargetDpus", Some (target_dpus_integer_to_yojson x.target_dpus));
    ]

let cancel_capacity_reservation_output_to_yojson = unit_to_yojson

let cancel_capacity_reservation_input_to_yojson (x : cancel_capacity_reservation_input) =
  assoc_to_yojson [ ("Name", Some (capacity_reservation_name_to_yojson x.name)) ]

let batch_get_query_execution_output_to_yojson (x : batch_get_query_execution_output) =
  assoc_to_yojson
    [
      ( "UnprocessedQueryExecutionIds",
        option_to_yojson unprocessed_query_execution_id_list_to_yojson
          x.unprocessed_query_execution_ids );
      ("QueryExecutions", option_to_yojson query_execution_list_to_yojson x.query_executions);
    ]

let batch_get_query_execution_input_to_yojson (x : batch_get_query_execution_input) =
  assoc_to_yojson
    [ ("QueryExecutionIds", Some (query_execution_id_list_to_yojson x.query_execution_ids)) ]

let batch_get_prepared_statement_output_to_yojson (x : batch_get_prepared_statement_output) =
  assoc_to_yojson
    [
      ( "UnprocessedPreparedStatementNames",
        option_to_yojson unprocessed_prepared_statement_name_list_to_yojson
          x.unprocessed_prepared_statement_names );
      ( "PreparedStatements",
        option_to_yojson prepared_statement_details_list_to_yojson x.prepared_statements );
    ]

let batch_get_prepared_statement_input_to_yojson (x : batch_get_prepared_statement_input) =
  assoc_to_yojson
    [
      ("WorkGroup", Some (work_group_name_to_yojson x.work_group));
      ( "PreparedStatementNames",
        Some (prepared_statement_name_list_to_yojson x.prepared_statement_names) );
    ]

let batch_get_named_query_output_to_yojson (x : batch_get_named_query_output) =
  assoc_to_yojson
    [
      ( "UnprocessedNamedQueryIds",
        option_to_yojson unprocessed_named_query_id_list_to_yojson x.unprocessed_named_query_ids );
      ("NamedQueries", option_to_yojson named_query_list_to_yojson x.named_queries);
    ]

let batch_get_named_query_input_to_yojson (x : batch_get_named_query_input) =
  assoc_to_yojson [ ("NamedQueryIds", Some (named_query_id_list_to_yojson x.named_query_ids)) ]
