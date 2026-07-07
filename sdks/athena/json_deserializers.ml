open Smaws_Lib.Json.DeserializeHelpers
open Types

let datum_string_of_yojson = string_of_yojson

let datum_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     var_char_value =
       option_of_yojson (value_for_key datum_string_of_yojson "VarCharValue") _list path;
   }
    : datum)

let datum_list_of_yojson tree path = list_of_yojson datum_of_yojson tree path
let work_group_name_of_yojson = string_of_yojson

let work_group_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkGroupState" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkGroupState")
     : work_group_state)
    : work_group_state)

let work_group_description_string_of_yojson = string_of_yojson
let date_of_yojson = timestamp_epoch_seconds_of_yojson
let name_string_of_yojson = string_of_yojson

let engine_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     effective_engine_version =
       option_of_yojson (value_for_key name_string_of_yojson "EffectiveEngineVersion") _list path;
     selected_engine_version =
       option_of_yojson (value_for_key name_string_of_yojson "SelectedEngineVersion") _list path;
   }
    : engine_version)

let identity_center_application_arn_of_yojson = string_of_yojson

let work_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_center_application_arn =
       option_of_yojson
         (value_for_key identity_center_application_arn_of_yojson "IdentityCenterApplicationArn")
         _list path;
     engine_version =
       option_of_yojson (value_for_key engine_version_of_yojson "EngineVersion") _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     description =
       option_of_yojson
         (value_for_key work_group_description_string_of_yojson "Description")
         _list path;
     state = option_of_yojson (value_for_key work_group_state_of_yojson "State") _list path;
     name = option_of_yojson (value_for_key work_group_name_of_yojson "Name") _list path;
   }
    : work_group_summary)

let work_groups_list_of_yojson tree path = list_of_yojson work_group_summary_of_yojson tree path
let work_group_names_list_of_yojson tree path = list_of_yojson work_group_name_of_yojson tree path
let boxed_boolean_of_yojson = bool_of_yojson
let result_output_location_of_yojson = string_of_yojson

let encryption_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "CSE_KMS" -> CSE_KMS
    | `String "SSE_KMS" -> SSE_KMS
    | `String "SSE_S3" -> SSE_S3
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionOption" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionOption")
     : encryption_option)
    : encryption_option)

let string__of_yojson = string_of_yojson

let encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key = option_of_yojson (value_for_key string__of_yojson "KmsKey") _list path;
     encryption_option = value_for_key encryption_option_of_yojson "EncryptionOption" _list path;
   }
    : encryption_configuration)

let aws_account_id_of_yojson = string_of_yojson

let s3_acl_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "BUCKET_OWNER_FULL_CONTROL" -> BUCKET_OWNER_FULL_CONTROL
    | `String value -> raise (deserialize_unknown_enum_value_error path "S3AclOption" value)
    | _ -> raise (deserialize_wrong_type_error path "S3AclOption")
     : s3_acl_option)
    : s3_acl_option)

let acl_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_acl_option = value_for_key s3_acl_option_of_yojson "S3AclOption" _list path }
    : acl_configuration)

let result_configuration_updates_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remove_acl_configuration =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "RemoveAclConfiguration") _list path;
     acl_configuration =
       option_of_yojson (value_for_key acl_configuration_of_yojson "AclConfiguration") _list path;
     remove_expected_bucket_owner =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "RemoveExpectedBucketOwner")
         _list path;
     expected_bucket_owner =
       option_of_yojson (value_for_key aws_account_id_of_yojson "ExpectedBucketOwner") _list path;
     remove_encryption_configuration =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "RemoveEncryptionConfiguration")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     remove_output_location =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "RemoveOutputLocation") _list path;
     output_location =
       option_of_yojson (value_for_key result_output_location_of_yojson "OutputLocation") _list path;
   }
    : result_configuration_updates)

let kms_key_of_yojson = string_of_yojson

let managed_query_results_encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ kms_key = value_for_key kms_key_of_yojson "KmsKey" _list path }
    : managed_query_results_encryption_configuration)

let managed_query_results_configuration_updates_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remove_encryption_configuration =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "RemoveEncryptionConfiguration")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key managed_query_results_encryption_configuration_of_yojson
            "EncryptionConfiguration")
         _list path;
     enabled = option_of_yojson (value_for_key boxed_boolean_of_yojson "Enabled") _list path;
   }
    : managed_query_results_configuration_updates)

let bytes_scanned_cutoff_value_of_yojson = long_of_yojson
let role_arn_of_yojson = string_of_yojson

let customer_content_encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ kms_key = value_for_key kms_key_of_yojson "KmsKey" _list path }
    : customer_content_encryption_configuration)

let authentication_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DIRECTORY_IDENTITY" -> DIRECTORY_IDENTITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthenticationType")
     : authentication_type)
    : authentication_type)

let query_results_s3_access_grants_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_type =
       value_for_key authentication_type_of_yojson "AuthenticationType" _list path;
     create_user_level_prefix =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "CreateUserLevelPrefix") _list path;
     enable_s3_access_grants =
       value_for_key boxed_boolean_of_yojson "EnableS3AccessGrants" _list path;
   }
    : query_results_s3_access_grants_configuration)

let log_group_name_of_yojson = string_of_yojson
let log_stream_name_prefix_of_yojson = string_of_yojson
let log_type_value_of_yojson = string_of_yojson
let log_type_values_list_of_yojson tree path = list_of_yojson log_type_value_of_yojson tree path
let log_type_key_of_yojson = string_of_yojson

let log_types_map_of_yojson tree path =
  map_of_yojson log_type_key_of_yojson log_type_values_list_of_yojson tree path

let cloud_watch_logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_types = option_of_yojson (value_for_key log_types_map_of_yojson "LogTypes") _list path;
     log_stream_name_prefix =
       option_of_yojson
         (value_for_key log_stream_name_prefix_of_yojson "LogStreamNamePrefix")
         _list path;
     log_group = option_of_yojson (value_for_key log_group_name_of_yojson "LogGroup") _list path;
     enabled = value_for_key boxed_boolean_of_yojson "Enabled" _list path;
   }
    : cloud_watch_logging_configuration)

let managed_logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KmsKey") _list path;
     enabled = value_for_key boxed_boolean_of_yojson "Enabled" _list path;
   }
    : managed_logging_configuration)

let s3_output_location_of_yojson = string_of_yojson

let s3_logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_location =
       option_of_yojson (value_for_key s3_output_location_of_yojson "LogLocation") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KmsKey") _list path;
     enabled = value_for_key boxed_boolean_of_yojson "Enabled" _list path;
   }
    : s3_logging_configuration)

let monitoring_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_logging_configuration =
       option_of_yojson
         (value_for_key s3_logging_configuration_of_yojson "S3LoggingConfiguration")
         _list path;
     managed_logging_configuration =
       option_of_yojson
         (value_for_key managed_logging_configuration_of_yojson "ManagedLoggingConfiguration")
         _list path;
     cloud_watch_logging_configuration =
       option_of_yojson
         (value_for_key cloud_watch_logging_configuration_of_yojson "CloudWatchLoggingConfiguration")
         _list path;
   }
    : monitoring_configuration)

let coordinator_dpu_size_of_yojson = int_of_yojson
let max_concurrent_dpus_of_yojson = int_of_yojson
let default_executor_dpu_size_of_yojson = int_of_yojson
let parameters_map_value_of_yojson = string_of_yojson
let key_string_of_yojson = string_of_yojson

let parameters_map_of_yojson tree path =
  map_of_yojson key_string_of_yojson parameters_map_value_of_yojson tree path

let classification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties = option_of_yojson (value_for_key parameters_map_of_yojson "Properties") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : classification)

let classification_list_of_yojson tree path = list_of_yojson classification_of_yojson tree path

let engine_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     classifications =
       option_of_yojson (value_for_key classification_list_of_yojson "Classifications") _list path;
     spark_properties =
       option_of_yojson (value_for_key parameters_map_of_yojson "SparkProperties") _list path;
     additional_configs =
       option_of_yojson (value_for_key parameters_map_of_yojson "AdditionalConfigs") _list path;
     default_executor_dpu_size =
       option_of_yojson
         (value_for_key default_executor_dpu_size_of_yojson "DefaultExecutorDpuSize")
         _list path;
     max_concurrent_dpus =
       option_of_yojson (value_for_key max_concurrent_dpus_of_yojson "MaxConcurrentDpus") _list path;
     coordinator_dpu_size =
       option_of_yojson
         (value_for_key coordinator_dpu_size_of_yojson "CoordinatorDpuSize")
         _list path;
   }
    : engine_configuration)

let work_group_configuration_updates_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engine_configuration =
       option_of_yojson
         (value_for_key engine_configuration_of_yojson "EngineConfiguration")
         _list path;
     monitoring_configuration =
       option_of_yojson
         (value_for_key monitoring_configuration_of_yojson "MonitoringConfiguration")
         _list path;
     query_results_s3_access_grants_configuration =
       option_of_yojson
         (value_for_key query_results_s3_access_grants_configuration_of_yojson
            "QueryResultsS3AccessGrantsConfiguration")
         _list path;
     enable_minimum_encryption_configuration =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "EnableMinimumEncryptionConfiguration")
         _list path;
     customer_content_encryption_configuration =
       option_of_yojson
         (value_for_key customer_content_encryption_configuration_of_yojson
            "CustomerContentEncryptionConfiguration")
         _list path;
     execution_role = option_of_yojson (value_for_key role_arn_of_yojson "ExecutionRole") _list path;
     additional_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "AdditionalConfiguration") _list path;
     remove_customer_content_encryption_configuration =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "RemoveCustomerContentEncryptionConfiguration")
         _list path;
     engine_version =
       option_of_yojson (value_for_key engine_version_of_yojson "EngineVersion") _list path;
     requester_pays_enabled =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "RequesterPaysEnabled") _list path;
     remove_bytes_scanned_cutoff_per_query =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "RemoveBytesScannedCutoffPerQuery")
         _list path;
     bytes_scanned_cutoff_per_query =
       option_of_yojson
         (value_for_key bytes_scanned_cutoff_value_of_yojson "BytesScannedCutoffPerQuery")
         _list path;
     publish_cloud_watch_metrics_enabled =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "PublishCloudWatchMetricsEnabled")
         _list path;
     managed_query_results_configuration_updates =
       option_of_yojson
         (value_for_key managed_query_results_configuration_updates_of_yojson
            "ManagedQueryResultsConfigurationUpdates")
         _list path;
     result_configuration_updates =
       option_of_yojson
         (value_for_key result_configuration_updates_of_yojson "ResultConfigurationUpdates")
         _list path;
     enforce_work_group_configuration =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "EnforceWorkGroupConfiguration")
         _list path;
   }
    : work_group_configuration_updates)

let result_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acl_configuration =
       option_of_yojson (value_for_key acl_configuration_of_yojson "AclConfiguration") _list path;
     expected_bucket_owner =
       option_of_yojson (value_for_key aws_account_id_of_yojson "ExpectedBucketOwner") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     output_location =
       option_of_yojson (value_for_key result_output_location_of_yojson "OutputLocation") _list path;
   }
    : result_configuration)

let boolean__of_yojson = bool_of_yojson

let managed_query_results_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       option_of_yojson
         (value_for_key managed_query_results_encryption_configuration_of_yojson
            "EncryptionConfiguration")
         _list path;
     enabled = value_for_key boolean__of_yojson "Enabled" _list path;
   }
    : managed_query_results_configuration)

let identity_center_instance_arn_of_yojson = string_of_yojson

let identity_center_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_center_instance_arn =
       option_of_yojson
         (value_for_key identity_center_instance_arn_of_yojson "IdentityCenterInstanceArn")
         _list path;
     enable_identity_center =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "EnableIdentityCenter") _list path;
   }
    : identity_center_configuration)

let work_group_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_results_s3_access_grants_configuration =
       option_of_yojson
         (value_for_key query_results_s3_access_grants_configuration_of_yojson
            "QueryResultsS3AccessGrantsConfiguration")
         _list path;
     identity_center_configuration =
       option_of_yojson
         (value_for_key identity_center_configuration_of_yojson "IdentityCenterConfiguration")
         _list path;
     enable_minimum_encryption_configuration =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "EnableMinimumEncryptionConfiguration")
         _list path;
     customer_content_encryption_configuration =
       option_of_yojson
         (value_for_key customer_content_encryption_configuration_of_yojson
            "CustomerContentEncryptionConfiguration")
         _list path;
     engine_configuration =
       option_of_yojson
         (value_for_key engine_configuration_of_yojson "EngineConfiguration")
         _list path;
     monitoring_configuration =
       option_of_yojson
         (value_for_key monitoring_configuration_of_yojson "MonitoringConfiguration")
         _list path;
     execution_role = option_of_yojson (value_for_key role_arn_of_yojson "ExecutionRole") _list path;
     additional_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "AdditionalConfiguration") _list path;
     engine_version =
       option_of_yojson (value_for_key engine_version_of_yojson "EngineVersion") _list path;
     requester_pays_enabled =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "RequesterPaysEnabled") _list path;
     bytes_scanned_cutoff_per_query =
       option_of_yojson
         (value_for_key bytes_scanned_cutoff_value_of_yojson "BytesScannedCutoffPerQuery")
         _list path;
     publish_cloud_watch_metrics_enabled =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "PublishCloudWatchMetricsEnabled")
         _list path;
     enforce_work_group_configuration =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "EnforceWorkGroupConfiguration")
         _list path;
     managed_query_results_configuration =
       option_of_yojson
         (value_for_key managed_query_results_configuration_of_yojson
            "ManagedQueryResultsConfiguration")
         _list path;
     result_configuration =
       option_of_yojson
         (value_for_key result_configuration_of_yojson "ResultConfiguration")
         _list path;
   }
    : work_group_configuration)

let work_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_center_application_arn =
       option_of_yojson
         (value_for_key identity_center_application_arn_of_yojson "IdentityCenterApplicationArn")
         _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     description =
       option_of_yojson
         (value_for_key work_group_description_string_of_yojson "Description")
         _list path;
     configuration =
       option_of_yojson
         (value_for_key work_group_configuration_of_yojson "Configuration")
         _list path;
     state = option_of_yojson (value_for_key work_group_state_of_yojson "State") _list path;
     name = value_for_key work_group_name_of_yojson "Name" _list path;
   }
    : work_group)

let update_work_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_work_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key work_group_state_of_yojson "State") _list path;
     configuration_updates =
       option_of_yojson
         (value_for_key work_group_configuration_updates_of_yojson "ConfigurationUpdates")
         _list path;
     description =
       option_of_yojson
         (value_for_key work_group_description_string_of_yojson "Description")
         _list path;
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
   }
    : update_work_group_input)

let error_code_of_yojson = string_of_yojson
let error_message_of_yojson = string_of_yojson

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     athena_error_code =
       option_of_yojson (value_for_key error_code_of_yojson "AthenaErrorCode") _list path;
   }
    : invalid_request_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_server_exception)

let update_prepared_statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let statement_name_of_yojson = string_of_yojson
let query_string_of_yojson = string_of_yojson
let description_string_of_yojson = string_of_yojson

let update_prepared_statement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     query_statement = value_for_key query_string_of_yojson "QueryStatement" _list path;
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
     statement_name = value_for_key statement_name_of_yojson "StatementName" _list path;
   }
    : update_prepared_statement_input)

let amazon_resource_name_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "ResourceName") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : resource_not_found_exception)

let update_notebook_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_notebook_metadata_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let notebook_id_of_yojson = string_of_yojson
let client_request_token_of_yojson = string_of_yojson
let notebook_name_of_yojson = string_of_yojson

let update_notebook_metadata_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key notebook_name_of_yojson "Name" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     notebook_id = value_for_key notebook_id_of_yojson "NotebookId" _list path;
   }
    : update_notebook_metadata_input)

let throttle_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONCURRENT_QUERY_LIMIT_EXCEEDED" -> CONCURRENT_QUERY_LIMIT_EXCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ThrottleReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ThrottleReason")
     : throttle_reason)
    : throttle_reason)

let too_many_requests_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key throttle_reason_of_yojson "Reason") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : too_many_requests_exception)

let payload_of_yojson = string_of_yojson

let notebook_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPYNB" -> IPYNB
    | `String value -> raise (deserialize_unknown_enum_value_error path "NotebookType" value)
    | _ -> raise (deserialize_wrong_type_error path "NotebookType")
     : notebook_type)
    : notebook_type)

let session_id_of_yojson = string_of_yojson

let update_notebook_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
     type_ = value_for_key notebook_type_of_yojson "Type" _list path;
     payload = value_for_key payload_of_yojson "Payload" _list path;
     notebook_id = value_for_key notebook_id_of_yojson "NotebookId" _list path;
   }
    : update_notebook_input)

let update_named_query_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let named_query_id_of_yojson = string_of_yojson
let named_query_description_string_of_yojson = string_of_yojson

let update_named_query_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_string = value_for_key query_string_of_yojson "QueryString" _list path;
     description =
       option_of_yojson
         (value_for_key named_query_description_string_of_yojson "Description")
         _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
     named_query_id = value_for_key named_query_id_of_yojson "NamedQueryId" _list path;
   }
    : update_named_query_input)

let update_data_catalog_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let catalog_name_string_of_yojson = string_of_yojson

let data_catalog_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FEDERATED" -> FEDERATED
    | `String "HIVE" -> HIVE
    | `String "GLUE" -> GLUE
    | `String "LAMBDA" -> LAMBDA
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataCatalogType" value)
    | _ -> raise (deserialize_wrong_type_error path "DataCatalogType")
     : data_catalog_type)
    : data_catalog_type)

let update_data_catalog_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     type_ = value_for_key data_catalog_type_of_yojson "Type" _list path;
     name = value_for_key catalog_name_string_of_yojson "Name" _list path;
   }
    : update_data_catalog_input)

let update_capacity_reservation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let target_dpus_integer_of_yojson = int_of_yojson
let capacity_reservation_name_of_yojson = string_of_yojson

let update_capacity_reservation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key capacity_reservation_name_of_yojson "Name" _list path;
     target_dpus = value_for_key target_dpus_integer_of_yojson "TargetDpus" _list path;
   }
    : update_capacity_reservation_input)

let untag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : untag_resource_input)

let query_execution_id_of_yojson = string_of_yojson

let unprocessed_query_execution_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     query_execution_id =
       option_of_yojson (value_for_key query_execution_id_of_yojson "QueryExecutionId") _list path;
   }
    : unprocessed_query_execution_id)

let unprocessed_query_execution_id_list_of_yojson tree path =
  list_of_yojson unprocessed_query_execution_id_of_yojson tree path

let unprocessed_prepared_statement_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     statement_name =
       option_of_yojson (value_for_key statement_name_of_yojson "StatementName") _list path;
   }
    : unprocessed_prepared_statement_name)

let unprocessed_prepared_statement_name_list_of_yojson tree path =
  list_of_yojson unprocessed_prepared_statement_name_of_yojson tree path

let unprocessed_named_query_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     named_query_id =
       option_of_yojson (value_for_key named_query_id_of_yojson "NamedQueryId") _list path;
   }
    : unprocessed_named_query_id)

let unprocessed_named_query_id_list_of_yojson tree path =
  list_of_yojson unprocessed_named_query_id_of_yojson tree path

let type_string_of_yojson = string_of_yojson
let token_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let session_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "DEGRADED" -> DEGRADED
    | `String "TERMINATED" -> TERMINATED
    | `String "TERMINATING" -> TERMINATING
    | `String "BUSY" -> BUSY
    | `String "IDLE" -> IDLE
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionState" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionState")
     : session_state)
    : session_state)

let terminate_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ state = option_of_yojson (value_for_key session_state_of_yojson "State") _list path }
    : terminate_session_response)

let terminate_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key session_id_of_yojson "SessionId" _list path }
    : terminate_session_request)

let tag_value_of_yojson = string_of_yojson

let tag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : tag_resource_input)

let table_type_string_of_yojson = string_of_yojson
let comment_string_of_yojson = string_of_yojson

let column_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comment = option_of_yojson (value_for_key comment_string_of_yojson "Comment") _list path;
     type_ = option_of_yojson (value_for_key type_string_of_yojson "Type") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : column)

let column_list_of_yojson tree path = list_of_yojson column_of_yojson tree path

let table_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     partition_keys =
       option_of_yojson (value_for_key column_list_of_yojson "PartitionKeys") _list path;
     columns = option_of_yojson (value_for_key column_list_of_yojson "Columns") _list path;
     table_type =
       option_of_yojson (value_for_key table_type_string_of_yojson "TableType") _list path;
     last_access_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAccessTime") _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "CreateTime") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : table_metadata)

let table_metadata_list_of_yojson tree path = list_of_yojson table_metadata_of_yojson tree path
let integer_of_yojson = int_of_yojson
let supported_dpu_size_list_of_yojson tree path = list_of_yojson integer_of_yojson tree path
let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let stop_query_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_query_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_execution_id = value_for_key query_execution_id_of_yojson "QueryExecutionId" _list path }
    : stop_query_execution_input)

let calculation_execution_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "CANCELED" -> CANCELED
    | `String "CANCELING" -> CANCELING
    | `String "RUNNING" -> RUNNING
    | `String "QUEUED" -> QUEUED
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CalculationExecutionState" value)
    | _ -> raise (deserialize_wrong_type_error path "CalculationExecutionState")
     : calculation_execution_state)
    : calculation_execution_state)

let stop_calculation_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state =
       option_of_yojson (value_for_key calculation_execution_state_of_yojson "State") _list path;
   }
    : stop_calculation_execution_response)

let calculation_execution_id_of_yojson = string_of_yojson

let stop_calculation_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     calculation_execution_id =
       value_for_key calculation_execution_id_of_yojson "CalculationExecutionId" _list path;
   }
    : stop_calculation_execution_request)

let statement_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "UTILITY" -> UTILITY
    | `String "DML" -> DML
    | `String "DDL" -> DDL
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatementType" value)
    | _ -> raise (deserialize_wrong_type_error path "StatementType")
     : statement_type)
    : statement_type)

let start_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key session_state_of_yojson "State") _list path;
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
   }
    : start_session_response)

let session_idle_timeout_in_minutes_of_yojson = int_of_yojson
let idempotency_token_of_yojson = string_of_yojson

let start_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     copy_work_group_tags =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "CopyWorkGroupTags") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientRequestToken") _list path;
     session_idle_timeout_in_minutes =
       option_of_yojson
         (value_for_key session_idle_timeout_in_minutes_of_yojson "SessionIdleTimeoutInMinutes")
         _list path;
     notebook_version =
       option_of_yojson (value_for_key name_string_of_yojson "NotebookVersion") _list path;
     monitoring_configuration =
       option_of_yojson
         (value_for_key monitoring_configuration_of_yojson "MonitoringConfiguration")
         _list path;
     execution_role = option_of_yojson (value_for_key role_arn_of_yojson "ExecutionRole") _list path;
     engine_configuration =
       value_for_key engine_configuration_of_yojson "EngineConfiguration" _list path;
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
   }
    : start_session_request)

let session_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : session_already_exists_exception)

let start_query_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_execution_id =
       option_of_yojson (value_for_key query_execution_id_of_yojson "QueryExecutionId") _list path;
   }
    : start_query_execution_output)

let database_string_of_yojson = string_of_yojson

let query_execution_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = option_of_yojson (value_for_key catalog_name_string_of_yojson "Catalog") _list path;
     database = option_of_yojson (value_for_key database_string_of_yojson "Database") _list path;
   }
    : query_execution_context)

let execution_parameter_of_yojson = string_of_yojson

let execution_parameters_of_yojson tree path =
  list_of_yojson execution_parameter_of_yojson tree path

let age_of_yojson = int_of_yojson

let result_reuse_by_age_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_age_in_minutes =
       option_of_yojson (value_for_key age_of_yojson "MaxAgeInMinutes") _list path;
     enabled = value_for_key boolean__of_yojson "Enabled" _list path;
   }
    : result_reuse_by_age_configuration)

let result_reuse_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_reuse_by_age_configuration =
       option_of_yojson
         (value_for_key result_reuse_by_age_configuration_of_yojson "ResultReuseByAgeConfiguration")
         _list path;
   }
    : result_reuse_configuration)

let start_query_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engine_configuration =
       option_of_yojson
         (value_for_key engine_configuration_of_yojson "EngineConfiguration")
         _list path;
     result_reuse_configuration =
       option_of_yojson
         (value_for_key result_reuse_configuration_of_yojson "ResultReuseConfiguration")
         _list path;
     execution_parameters =
       option_of_yojson
         (value_for_key execution_parameters_of_yojson "ExecutionParameters")
         _list path;
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     result_configuration =
       option_of_yojson
         (value_for_key result_configuration_of_yojson "ResultConfiguration")
         _list path;
     query_execution_context =
       option_of_yojson
         (value_for_key query_execution_context_of_yojson "QueryExecutionContext")
         _list path;
     client_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientRequestToken") _list path;
     query_string = value_for_key query_string_of_yojson "QueryString" _list path;
   }
    : start_query_execution_input)

let start_calculation_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state =
       option_of_yojson (value_for_key calculation_execution_state_of_yojson "State") _list path;
     calculation_execution_id =
       option_of_yojson
         (value_for_key calculation_execution_id_of_yojson "CalculationExecutionId")
         _list path;
   }
    : start_calculation_execution_response)

let code_block_of_yojson = string_of_yojson

let calculation_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ code_block = option_of_yojson (value_for_key code_block_of_yojson "CodeBlock") _list path }
    : calculation_configuration)

let start_calculation_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientRequestToken") _list path;
     code_block = option_of_yojson (value_for_key code_block_of_yojson "CodeBlock") _list path;
     calculation_configuration =
       option_of_yojson
         (value_for_key calculation_configuration_of_yojson "CalculationConfiguration")
         _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     session_id = value_for_key session_id_of_yojson "SessionId" _list path;
   }
    : start_calculation_execution_request)

let session_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_change_reason =
       option_of_yojson (value_for_key description_string_of_yojson "StateChangeReason") _list path;
     state = option_of_yojson (value_for_key session_state_of_yojson "State") _list path;
     idle_since_date_time =
       option_of_yojson (value_for_key date_of_yojson "IdleSinceDateTime") _list path;
     end_date_time = option_of_yojson (value_for_key date_of_yojson "EndDateTime") _list path;
     last_modified_date_time =
       option_of_yojson (value_for_key date_of_yojson "LastModifiedDateTime") _list path;
     start_date_time = option_of_yojson (value_for_key date_of_yojson "StartDateTime") _list path;
   }
    : session_status)

let session_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key session_status_of_yojson "Status") _list path;
     notebook_version =
       option_of_yojson (value_for_key name_string_of_yojson "NotebookVersion") _list path;
     engine_version =
       option_of_yojson (value_for_key engine_version_of_yojson "EngineVersion") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
   }
    : session_summary)

let sessions_list_of_yojson tree path = list_of_yojson session_summary_of_yojson tree path
let long_of_yojson = long_of_yojson

let session_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dpu_execution_in_millis =
       option_of_yojson (value_for_key long_of_yojson "DpuExecutionInMillis") _list path;
   }
    : session_statistics)

let session_manager_token_of_yojson = string_of_yojson

let session_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     session_idle_timeout_in_minutes =
       option_of_yojson
         (value_for_key session_idle_timeout_in_minutes_of_yojson "SessionIdleTimeoutInMinutes")
         _list path;
     idle_timeout_seconds =
       option_of_yojson (value_for_key long_of_yojson "IdleTimeoutSeconds") _list path;
     working_directory =
       option_of_yojson
         (value_for_key result_output_location_of_yojson "WorkingDirectory")
         _list path;
     execution_role = option_of_yojson (value_for_key role_arn_of_yojson "ExecutionRole") _list path;
   }
    : session_configuration)

let s3_uri_of_yojson = string_of_yojson

let row_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ data = option_of_yojson (value_for_key datum_list_of_yojson "Data") _list path } : row)

let row_list_of_yojson tree path = list_of_yojson row_of_yojson tree path

let column_nullable_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNKNOWN" -> UNKNOWN
    | `String "NULLABLE" -> NULLABLE
    | `String "NOT_NULL" -> NOT_NULL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ColumnNullable" value)
    | _ -> raise (deserialize_wrong_type_error path "ColumnNullable")
     : column_nullable)
    : column_nullable)

let column_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     case_sensitive = option_of_yojson (value_for_key boolean__of_yojson "CaseSensitive") _list path;
     nullable = option_of_yojson (value_for_key column_nullable_of_yojson "Nullable") _list path;
     scale = option_of_yojson (value_for_key integer_of_yojson "Scale") _list path;
     precision = option_of_yojson (value_for_key integer_of_yojson "Precision") _list path;
     type_ = value_for_key string__of_yojson "Type" _list path;
     label = option_of_yojson (value_for_key string__of_yojson "Label") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
     table_name = option_of_yojson (value_for_key string__of_yojson "TableName") _list path;
     schema_name = option_of_yojson (value_for_key string__of_yojson "SchemaName") _list path;
     catalog_name = option_of_yojson (value_for_key string__of_yojson "CatalogName") _list path;
   }
    : column_info)

let column_info_list_of_yojson tree path = list_of_yojson column_info_of_yojson tree path

let result_set_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_info =
       option_of_yojson (value_for_key column_info_list_of_yojson "ColumnInfo") _list path;
   }
    : result_set_metadata)

let result_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_set_metadata =
       option_of_yojson (value_for_key result_set_metadata_of_yojson "ResultSetMetadata") _list path;
     rows = option_of_yojson (value_for_key row_list_of_yojson "Rows") _list path;
   }
    : result_set)

let result_reuse_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ reused_previous_result = value_for_key boolean__of_yojson "ReusedPreviousResult" _list path }
    : result_reuse_information)

let rec query_stage_plan_node_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remote_sources =
       option_of_yojson (value_for_key string_list_of_yojson "RemoteSources") _list path;
     children =
       option_of_yojson (value_for_key query_stage_plan_nodes_of_yojson "Children") _list path;
     identifier = option_of_yojson (value_for_key string__of_yojson "Identifier") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : query_stage_plan_node)

and query_stage_plan_nodes_of_yojson tree path =
  list_of_yojson query_stage_plan_node_of_yojson tree path

let rec query_stage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sub_stages = option_of_yojson (value_for_key query_stages_of_yojson "SubStages") _list path;
     query_stage_plan =
       option_of_yojson (value_for_key query_stage_plan_node_of_yojson "QueryStagePlan") _list path;
     execution_time = option_of_yojson (value_for_key long_of_yojson "ExecutionTime") _list path;
     input_rows = option_of_yojson (value_for_key long_of_yojson "InputRows") _list path;
     input_bytes = option_of_yojson (value_for_key long_of_yojson "InputBytes") _list path;
     output_rows = option_of_yojson (value_for_key long_of_yojson "OutputRows") _list path;
     output_bytes = option_of_yojson (value_for_key long_of_yojson "OutputBytes") _list path;
     state = option_of_yojson (value_for_key string__of_yojson "State") _list path;
     stage_id = option_of_yojson (value_for_key long_of_yojson "StageId") _list path;
   }
    : query_stage)

and query_stages_of_yojson tree path = list_of_yojson query_stage_of_yojson tree path

let query_runtime_statistics_timeline_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_execution_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "TotalExecutionTimeInMillis") _list path;
     service_processing_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "ServiceProcessingTimeInMillis") _list path;
     engine_execution_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "EngineExecutionTimeInMillis") _list path;
     query_planning_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "QueryPlanningTimeInMillis") _list path;
     service_pre_processing_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "ServicePreProcessingTimeInMillis") _list path;
     query_queue_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "QueryQueueTimeInMillis") _list path;
   }
    : query_runtime_statistics_timeline)

let query_runtime_statistics_rows_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_rows = option_of_yojson (value_for_key long_of_yojson "OutputRows") _list path;
     output_bytes = option_of_yojson (value_for_key long_of_yojson "OutputBytes") _list path;
     input_bytes = option_of_yojson (value_for_key long_of_yojson "InputBytes") _list path;
     input_rows = option_of_yojson (value_for_key long_of_yojson "InputRows") _list path;
   }
    : query_runtime_statistics_rows)

let query_runtime_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_stage = option_of_yojson (value_for_key query_stage_of_yojson "OutputStage") _list path;
     rows =
       option_of_yojson (value_for_key query_runtime_statistics_rows_of_yojson "Rows") _list path;
     timeline =
       option_of_yojson
         (value_for_key query_runtime_statistics_timeline_of_yojson "Timeline")
         _list path;
   }
    : query_runtime_statistics)

let query_result_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DATA_ROWS" -> DATA_ROWS
    | `String "DATA_MANIFEST" -> DATA_MANIFEST
    | `String value -> raise (deserialize_unknown_enum_value_error path "QueryResultType" value)
    | _ -> raise (deserialize_wrong_type_error path "QueryResultType")
     : query_result_type)
    : query_result_type)

let query_execution_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "CANCELLED" -> CANCELLED
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RUNNING" -> RUNNING
    | `String "QUEUED" -> QUEUED
    | `String value -> raise (deserialize_unknown_enum_value_error path "QueryExecutionState" value)
    | _ -> raise (deserialize_wrong_type_error path "QueryExecutionState")
     : query_execution_state)
    : query_execution_state)

let error_category_of_yojson = int_of_yojson
let error_type_of_yojson = int_of_yojson

let athena_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     retryable = option_of_yojson (value_for_key boolean__of_yojson "Retryable") _list path;
     error_type = option_of_yojson (value_for_key error_type_of_yojson "ErrorType") _list path;
     error_category =
       option_of_yojson (value_for_key error_category_of_yojson "ErrorCategory") _list path;
   }
    : athena_error)

let query_execution_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     athena_error = option_of_yojson (value_for_key athena_error_of_yojson "AthenaError") _list path;
     completion_date_time =
       option_of_yojson (value_for_key date_of_yojson "CompletionDateTime") _list path;
     submission_date_time =
       option_of_yojson (value_for_key date_of_yojson "SubmissionDateTime") _list path;
     state_change_reason =
       option_of_yojson (value_for_key string__of_yojson "StateChangeReason") _list path;
     state = option_of_yojson (value_for_key query_execution_state_of_yojson "State") _list path;
   }
    : query_execution_status)

let dpu_count_of_yojson = double_of_yojson

let query_execution_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dpu_count = option_of_yojson (value_for_key dpu_count_of_yojson "DpuCount") _list path;
     result_reuse_information =
       option_of_yojson
         (value_for_key result_reuse_information_of_yojson "ResultReuseInformation")
         _list path;
     service_processing_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "ServiceProcessingTimeInMillis") _list path;
     query_planning_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "QueryPlanningTimeInMillis") _list path;
     service_pre_processing_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "ServicePreProcessingTimeInMillis") _list path;
     query_queue_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "QueryQueueTimeInMillis") _list path;
     total_execution_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "TotalExecutionTimeInMillis") _list path;
     data_manifest_location =
       option_of_yojson (value_for_key string__of_yojson "DataManifestLocation") _list path;
     data_scanned_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "DataScannedInBytes") _list path;
     engine_execution_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "EngineExecutionTimeInMillis") _list path;
   }
    : query_execution_statistics)

let query_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_results_s3_access_grants_configuration =
       option_of_yojson
         (value_for_key query_results_s3_access_grants_configuration_of_yojson
            "QueryResultsS3AccessGrantsConfiguration")
         _list path;
     substatement_type =
       option_of_yojson (value_for_key string__of_yojson "SubstatementType") _list path;
     execution_parameters =
       option_of_yojson
         (value_for_key execution_parameters_of_yojson "ExecutionParameters")
         _list path;
     engine_version =
       option_of_yojson (value_for_key engine_version_of_yojson "EngineVersion") _list path;
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     statistics =
       option_of_yojson (value_for_key query_execution_statistics_of_yojson "Statistics") _list path;
     status = option_of_yojson (value_for_key query_execution_status_of_yojson "Status") _list path;
     query_execution_context =
       option_of_yojson
         (value_for_key query_execution_context_of_yojson "QueryExecutionContext")
         _list path;
     result_reuse_configuration =
       option_of_yojson
         (value_for_key result_reuse_configuration_of_yojson "ResultReuseConfiguration")
         _list path;
     result_configuration =
       option_of_yojson
         (value_for_key result_configuration_of_yojson "ResultConfiguration")
         _list path;
     managed_query_results_configuration =
       option_of_yojson
         (value_for_key managed_query_results_configuration_of_yojson
            "ManagedQueryResultsConfiguration")
         _list path;
     statement_type =
       option_of_yojson (value_for_key statement_type_of_yojson "StatementType") _list path;
     query = option_of_yojson (value_for_key query_string_of_yojson "Query") _list path;
     query_execution_id =
       option_of_yojson (value_for_key query_execution_id_of_yojson "QueryExecutionId") _list path;
   }
    : query_execution)

let query_execution_list_of_yojson tree path = list_of_yojson query_execution_of_yojson tree path

let query_execution_id_list_of_yojson tree path =
  list_of_yojson query_execution_id_of_yojson tree path

let put_capacity_assignment_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let capacity_assignment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group_names =
       option_of_yojson (value_for_key work_group_names_list_of_yojson "WorkGroupNames") _list path;
   }
    : capacity_assignment)

let capacity_assignments_list_of_yojson tree path =
  list_of_yojson capacity_assignment_of_yojson tree path

let put_capacity_assignment_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_assignments =
       value_for_key capacity_assignments_list_of_yojson "CapacityAssignments" _list path;
     capacity_reservation_name =
       value_for_key capacity_reservation_name_of_yojson "CapacityReservationName" _list path;
   }
    : put_capacity_assignment_configuration_input)

let prepared_statement_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key date_of_yojson "LastModifiedTime") _list path;
     statement_name =
       option_of_yojson (value_for_key statement_name_of_yojson "StatementName") _list path;
   }
    : prepared_statement_summary)

let prepared_statements_list_of_yojson tree path =
  list_of_yojson prepared_statement_summary_of_yojson tree path

let prepared_statement_name_list_of_yojson tree path =
  list_of_yojson statement_name_of_yojson tree path

let prepared_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key date_of_yojson "LastModifiedTime") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     work_group_name =
       option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroupName") _list path;
     query_statement =
       option_of_yojson (value_for_key query_string_of_yojson "QueryStatement") _list path;
     statement_name =
       option_of_yojson (value_for_key statement_name_of_yojson "StatementName") _list path;
   }
    : prepared_statement)

let prepared_statement_details_list_of_yojson tree path =
  list_of_yojson prepared_statement_of_yojson tree path

let notebook_session_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
   }
    : notebook_session_summary)

let notebook_sessions_list_of_yojson tree path =
  list_of_yojson notebook_session_summary_of_yojson tree path

let notebook_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key date_of_yojson "LastModifiedTime") _list path;
     type_ = option_of_yojson (value_for_key notebook_type_of_yojson "Type") _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     name = option_of_yojson (value_for_key notebook_name_of_yojson "Name") _list path;
     notebook_id = option_of_yojson (value_for_key notebook_id_of_yojson "NotebookId") _list path;
   }
    : notebook_metadata)

let notebook_metadata_array_of_yojson tree path =
  list_of_yojson notebook_metadata_of_yojson tree path

let named_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     named_query_id =
       option_of_yojson (value_for_key named_query_id_of_yojson "NamedQueryId") _list path;
     query_string = value_for_key query_string_of_yojson "QueryString" _list path;
     database = value_for_key database_string_of_yojson "Database" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : named_query)

let named_query_list_of_yojson tree path = list_of_yojson named_query_of_yojson tree path
let named_query_id_list_of_yojson tree path = list_of_yojson named_query_id_of_yojson tree path

let metadata_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : metadata_exception)

let max_work_groups_count_of_yojson = int_of_yojson
let max_tags_count_of_yojson = int_of_yojson
let max_table_metadata_count_of_yojson = int_of_yojson
let max_sessions_count_of_yojson = int_of_yojson
let max_query_results_of_yojson = int_of_yojson
let max_query_executions_count_of_yojson = int_of_yojson
let max_prepared_statements_count_of_yojson = int_of_yojson
let max_notebooks_count_of_yojson = int_of_yojson
let max_named_queries_count_of_yojson = int_of_yojson
let max_list_executors_count_of_yojson = int_of_yojson
let max_engine_versions_count_of_yojson = int_of_yojson
let max_databases_count_of_yojson = int_of_yojson
let max_data_catalogs_count_of_yojson = int_of_yojson
let max_capacity_reservations_count_of_yojson = int_of_yojson
let max_calculations_count_of_yojson = int_of_yojson
let max_application_dpu_sizes_count_of_yojson = int_of_yojson

let list_work_groups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     work_groups =
       option_of_yojson (value_for_key work_groups_list_of_yojson "WorkGroups") _list path;
   }
    : list_work_groups_output)

let list_work_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_work_groups_count_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_work_groups_input)

let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : list_tags_for_resource_output)

let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_tags_count_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : list_tags_for_resource_input)

let list_table_metadata_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     table_metadata_list =
       option_of_yojson (value_for_key table_metadata_list_of_yojson "TableMetadataList") _list path;
   }
    : list_table_metadata_output)

let expression_string_of_yojson = string_of_yojson

let list_table_metadata_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     max_results =
       option_of_yojson (value_for_key max_table_metadata_count_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     expression =
       option_of_yojson (value_for_key expression_string_of_yojson "Expression") _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_name = value_for_key catalog_name_string_of_yojson "CatalogName" _list path;
   }
    : list_table_metadata_input)

let list_sessions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sessions = option_of_yojson (value_for_key sessions_list_of_yojson "Sessions") _list path;
     next_token =
       option_of_yojson (value_for_key session_manager_token_of_yojson "NextToken") _list path;
   }
    : list_sessions_response)

let list_sessions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key session_manager_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_sessions_count_of_yojson "MaxResults") _list path;
     state_filter =
       option_of_yojson (value_for_key session_state_of_yojson "StateFilter") _list path;
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
   }
    : list_sessions_request)

let list_query_executions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     query_execution_ids =
       option_of_yojson
         (value_for_key query_execution_id_list_of_yojson "QueryExecutionIds")
         _list path;
   }
    : list_query_executions_output)

let list_query_executions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     max_results =
       option_of_yojson (value_for_key max_query_executions_count_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_query_executions_input)

let list_prepared_statements_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     prepared_statements =
       option_of_yojson
         (value_for_key prepared_statements_list_of_yojson "PreparedStatements")
         _list path;
   }
    : list_prepared_statements_output)

let list_prepared_statements_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key max_prepared_statements_count_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
   }
    : list_prepared_statements_input)

let list_notebook_sessions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     notebook_sessions_list =
       value_for_key notebook_sessions_list_of_yojson "NotebookSessionsList" _list path;
   }
    : list_notebook_sessions_response)

let list_notebook_sessions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_sessions_count_of_yojson "MaxResults") _list path;
     notebook_id = value_for_key notebook_id_of_yojson "NotebookId" _list path;
   }
    : list_notebook_sessions_request)

let list_notebook_metadata_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notebook_metadata_list =
       option_of_yojson
         (value_for_key notebook_metadata_array_of_yojson "NotebookMetadataList")
         _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_notebook_metadata_output)

let filter_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key notebook_name_of_yojson "Name") _list path }
    : filter_definition)

let list_notebook_metadata_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
     max_results =
       option_of_yojson (value_for_key max_notebooks_count_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filter_definition_of_yojson "Filters") _list path;
   }
    : list_notebook_metadata_input)

let list_named_queries_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     named_query_ids =
       option_of_yojson (value_for_key named_query_id_list_of_yojson "NamedQueryIds") _list path;
   }
    : list_named_queries_output)

let list_named_queries_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     max_results =
       option_of_yojson (value_for_key max_named_queries_count_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_named_queries_input)

let executor_id_of_yojson = string_of_yojson

let executor_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WORKER" -> WORKER
    | `String "GATEWAY" -> GATEWAY
    | `String "COORDINATOR" -> COORDINATOR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutorType")
     : executor_type)
    : executor_type)

let executor_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "TERMINATED" -> TERMINATED
    | `String "TERMINATING" -> TERMINATING
    | `String "REGISTERED" -> REGISTERED
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutorState" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutorState")
     : executor_state)
    : executor_state)

let executors_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     executor_size = option_of_yojson (value_for_key long_of_yojson "ExecutorSize") _list path;
     executor_state =
       option_of_yojson (value_for_key executor_state_of_yojson "ExecutorState") _list path;
     termination_date_time =
       option_of_yojson (value_for_key long_of_yojson "TerminationDateTime") _list path;
     start_date_time = option_of_yojson (value_for_key long_of_yojson "StartDateTime") _list path;
     executor_type =
       option_of_yojson (value_for_key executor_type_of_yojson "ExecutorType") _list path;
     executor_id = value_for_key executor_id_of_yojson "ExecutorId" _list path;
   }
    : executors_summary)

let executors_summary_list_of_yojson tree path =
  list_of_yojson executors_summary_of_yojson tree path

let list_executors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     executors_summary =
       option_of_yojson
         (value_for_key executors_summary_list_of_yojson "ExecutorsSummary")
         _list path;
     next_token =
       option_of_yojson (value_for_key session_manager_token_of_yojson "NextToken") _list path;
     session_id = value_for_key session_id_of_yojson "SessionId" _list path;
   }
    : list_executors_response)

let list_executors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key session_manager_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_list_executors_count_of_yojson "MaxResults") _list path;
     executor_state_filter =
       option_of_yojson (value_for_key executor_state_of_yojson "ExecutorStateFilter") _list path;
     session_id = value_for_key session_id_of_yojson "SessionId" _list path;
   }
    : list_executors_request)

let engine_versions_list_of_yojson tree path = list_of_yojson engine_version_of_yojson tree path

let list_engine_versions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     engine_versions =
       option_of_yojson (value_for_key engine_versions_list_of_yojson "EngineVersions") _list path;
   }
    : list_engine_versions_output)

let list_engine_versions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_engine_versions_count_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_engine_versions_input)

let database_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : database)

let database_list_of_yojson tree path = list_of_yojson database_of_yojson tree path

let list_databases_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     database_list =
       option_of_yojson (value_for_key database_list_of_yojson "DatabaseList") _list path;
   }
    : list_databases_output)

let list_databases_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     max_results =
       option_of_yojson (value_for_key max_databases_count_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     catalog_name = value_for_key catalog_name_string_of_yojson "CatalogName" _list path;
   }
    : list_databases_input)

let data_catalog_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_COMPLETE" -> DELETE_COMPLETE
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "CREATE_FAILED_CLEANUP_FAILED" -> CREATE_FAILED_CLEANUP_FAILED
    | `String "CREATE_FAILED_CLEANUP_COMPLETE" -> CREATE_FAILED_CLEANUP_COMPLETE
    | `String "CREATE_FAILED_CLEANUP_IN_PROGRESS" -> CREATE_FAILED_CLEANUP_IN_PROGRESS
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "CREATE_COMPLETE" -> CREATE_COMPLETE
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataCatalogStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DataCatalogStatus")
     : data_catalog_status)
    : data_catalog_status)

let connection_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DB2AS400" -> DB2AS400
    | `String "DATALAKEGEN2" -> DATALAKEGEN2
    | `String "SNOWFLAKE" -> SNOWFLAKE
    | `String "SAPHANA" -> SAPHANA
    | `String "TIMESTREAM" -> TIMESTREAM
    | `String "TPCDS" -> TPCDS
    | `String "CMDB" -> CMDB
    | `String "DOCUMENTDB" -> DOCUMENTDB
    | `String "HBASE" -> HBASE
    | `String "GOOGLECLOUDSTORAGE" -> GOOGLECLOUDSTORAGE
    | `String "BIGQUERY" -> BIGQUERY
    | `String "OPENSEARCH" -> OPENSEARCH
    | `String "DB2" -> DB2
    | `String "SQLSERVER" -> SQLSERVER
    | `String "SYNAPSE" -> SYNAPSE
    | `String "ORACLE" -> ORACLE
    | `String "REDSHIFT" -> REDSHIFT
    | `String "POSTGRESQL" -> POSTGRESQL
    | `String "MYSQL" -> MYSQL
    | `String "DYNAMODB" -> DYNAMODB
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionType")
     : connection_type)
    : connection_type)

let data_catalog_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key error_message_of_yojson "Error") _list path;
     connection_type =
       option_of_yojson (value_for_key connection_type_of_yojson "ConnectionType") _list path;
     status = option_of_yojson (value_for_key data_catalog_status_of_yojson "Status") _list path;
     type_ = option_of_yojson (value_for_key data_catalog_type_of_yojson "Type") _list path;
     catalog_name =
       option_of_yojson (value_for_key catalog_name_string_of_yojson "CatalogName") _list path;
   }
    : data_catalog_summary)

let data_catalog_summary_list_of_yojson tree path =
  list_of_yojson data_catalog_summary_of_yojson tree path

let list_data_catalogs_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     data_catalogs_summary =
       option_of_yojson
         (value_for_key data_catalog_summary_list_of_yojson "DataCatalogsSummary")
         _list path;
   }
    : list_data_catalogs_output)

let list_data_catalogs_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     max_results =
       option_of_yojson (value_for_key max_data_catalogs_count_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_data_catalogs_input)

let capacity_reservation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATE_PENDING" -> UPDATE_PENDING
    | `String "FAILED" -> FAILED
    | `String "CANCELLED" -> CANCELLED
    | `String "CANCELLING" -> CANCELLING
    | `String "ACTIVE" -> ACTIVE
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CapacityReservationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CapacityReservationStatus")
     : capacity_reservation_status)
    : capacity_reservation_status)

let allocated_dpus_integer_of_yojson = int_of_yojson

let capacity_allocation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CapacityAllocationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CapacityAllocationStatus")
     : capacity_allocation_status)
    : capacity_allocation_status)

let capacity_allocation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_completion_time =
       option_of_yojson (value_for_key timestamp_of_yojson "RequestCompletionTime") _list path;
     request_time = value_for_key timestamp_of_yojson "RequestTime" _list path;
     status_message = option_of_yojson (value_for_key string__of_yojson "StatusMessage") _list path;
     status = value_for_key capacity_allocation_status_of_yojson "Status" _list path;
   }
    : capacity_allocation)

let capacity_reservation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = value_for_key timestamp_of_yojson "CreationTime" _list path;
     last_successful_allocation_time =
       option_of_yojson
         (value_for_key timestamp_of_yojson "LastSuccessfulAllocationTime")
         _list path;
     last_allocation =
       option_of_yojson (value_for_key capacity_allocation_of_yojson "LastAllocation") _list path;
     allocated_dpus = value_for_key allocated_dpus_integer_of_yojson "AllocatedDpus" _list path;
     target_dpus = value_for_key target_dpus_integer_of_yojson "TargetDpus" _list path;
     status = value_for_key capacity_reservation_status_of_yojson "Status" _list path;
     name = value_for_key capacity_reservation_name_of_yojson "Name" _list path;
   }
    : capacity_reservation)

let capacity_reservations_list_of_yojson tree path =
  list_of_yojson capacity_reservation_of_yojson tree path

let list_capacity_reservations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_reservations =
       value_for_key capacity_reservations_list_of_yojson "CapacityReservations" _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_capacity_reservations_output)

let list_capacity_reservations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key max_capacity_reservations_count_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_capacity_reservations_input)

let calculation_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_change_reason =
       option_of_yojson (value_for_key description_string_of_yojson "StateChangeReason") _list path;
     state =
       option_of_yojson (value_for_key calculation_execution_state_of_yojson "State") _list path;
     completion_date_time =
       option_of_yojson (value_for_key date_of_yojson "CompletionDateTime") _list path;
     submission_date_time =
       option_of_yojson (value_for_key date_of_yojson "SubmissionDateTime") _list path;
   }
    : calculation_status)

let calculation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key calculation_status_of_yojson "Status") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     calculation_execution_id =
       option_of_yojson
         (value_for_key calculation_execution_id_of_yojson "CalculationExecutionId")
         _list path;
   }
    : calculation_summary)

let calculations_list_of_yojson tree path = list_of_yojson calculation_summary_of_yojson tree path

let list_calculation_executions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     calculations =
       option_of_yojson (value_for_key calculations_list_of_yojson "Calculations") _list path;
     next_token =
       option_of_yojson (value_for_key session_manager_token_of_yojson "NextToken") _list path;
   }
    : list_calculation_executions_response)

let list_calculation_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key session_manager_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_calculations_count_of_yojson "MaxResults") _list path;
     state_filter =
       option_of_yojson
         (value_for_key calculation_execution_state_of_yojson "StateFilter")
         _list path;
     session_id = value_for_key session_id_of_yojson "SessionId" _list path;
   }
    : list_calculation_executions_request)

let application_dpu_sizes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     supported_dpu_sizes =
       option_of_yojson
         (value_for_key supported_dpu_size_list_of_yojson "SupportedDPUSizes")
         _list path;
     application_runtime_id =
       option_of_yojson (value_for_key name_string_of_yojson "ApplicationRuntimeId") _list path;
   }
    : application_dpu_sizes)

let application_dpu_sizes_list_of_yojson tree path =
  list_of_yojson application_dpu_sizes_of_yojson tree path

let list_application_dpu_sizes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     application_dpu_sizes =
       option_of_yojson
         (value_for_key application_dpu_sizes_list_of_yojson "ApplicationDPUSizes")
         _list path;
   }
    : list_application_dpu_sizes_output)

let list_application_dpu_sizes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key max_application_dpu_sizes_count_of_yojson "MaxResults")
         _list path;
   }
    : list_application_dpu_sizes_input)

let import_notebook_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ notebook_id = option_of_yojson (value_for_key notebook_id_of_yojson "NotebookId") _list path }
    : import_notebook_output)

let import_notebook_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     notebook_s3_location_uri =
       option_of_yojson (value_for_key s3_uri_of_yojson "NotebookS3LocationUri") _list path;
     type_ = value_for_key notebook_type_of_yojson "Type" _list path;
     payload = option_of_yojson (value_for_key payload_of_yojson "Payload") _list path;
     name = value_for_key notebook_name_of_yojson "Name" _list path;
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
   }
    : import_notebook_input)

let get_work_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ work_group = option_of_yojson (value_for_key work_group_of_yojson "WorkGroup") _list path }
    : get_work_group_output)

let get_work_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path }
    : get_work_group_input)

let get_table_metadata_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_metadata =
       option_of_yojson (value_for_key table_metadata_of_yojson "TableMetadata") _list path;
   }
    : get_table_metadata_output)

let get_table_metadata_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_name = value_for_key catalog_name_string_of_yojson "CatalogName" _list path;
   }
    : get_table_metadata_input)

let get_session_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key session_status_of_yojson "Status") _list path;
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
   }
    : get_session_status_response)

let get_session_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key session_id_of_yojson "SessionId" _list path }
    : get_session_status_request)

let get_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statistics =
       option_of_yojson (value_for_key session_statistics_of_yojson "Statistics") _list path;
     status = option_of_yojson (value_for_key session_status_of_yojson "Status") _list path;
     session_configuration =
       option_of_yojson
         (value_for_key session_configuration_of_yojson "SessionConfiguration")
         _list path;
     monitoring_configuration =
       option_of_yojson
         (value_for_key monitoring_configuration_of_yojson "MonitoringConfiguration")
         _list path;
     notebook_version =
       option_of_yojson (value_for_key name_string_of_yojson "NotebookVersion") _list path;
     engine_configuration =
       option_of_yojson
         (value_for_key engine_configuration_of_yojson "EngineConfiguration")
         _list path;
     engine_version =
       option_of_yojson (value_for_key name_string_of_yojson "EngineVersion") _list path;
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
   }
    : get_session_response)

let get_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key session_id_of_yojson "SessionId" _list path } : get_session_request)

let get_session_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auth_token_expiration_time =
       value_for_key timestamp_of_yojson "AuthTokenExpirationTime" _list path;
     auth_token = value_for_key string__of_yojson "AuthToken" _list path;
     endpoint_url = value_for_key string__of_yojson "EndpointUrl" _list path;
   }
    : get_session_endpoint_response)

let get_session_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key session_id_of_yojson "SessionId" _list path }
    : get_session_endpoint_request)

let get_resource_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ url = value_for_key string__of_yojson "Url" _list path } : get_resource_dashboard_response)

let get_resource_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : get_resource_dashboard_request)

let get_query_runtime_statistics_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_runtime_statistics =
       option_of_yojson
         (value_for_key query_runtime_statistics_of_yojson "QueryRuntimeStatistics")
         _list path;
   }
    : get_query_runtime_statistics_output)

let get_query_runtime_statistics_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_execution_id = value_for_key query_execution_id_of_yojson "QueryExecutionId" _list path }
    : get_query_runtime_statistics_input)

let get_query_results_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     result_set = option_of_yojson (value_for_key result_set_of_yojson "ResultSet") _list path;
     update_count = option_of_yojson (value_for_key long_of_yojson "UpdateCount") _list path;
   }
    : get_query_results_output)

let get_query_results_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_result_type =
       option_of_yojson (value_for_key query_result_type_of_yojson "QueryResultType") _list path;
     max_results =
       option_of_yojson (value_for_key max_query_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     query_execution_id = value_for_key query_execution_id_of_yojson "QueryExecutionId" _list path;
   }
    : get_query_results_input)

let get_query_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_execution =
       option_of_yojson (value_for_key query_execution_of_yojson "QueryExecution") _list path;
   }
    : get_query_execution_output)

let get_query_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_execution_id = value_for_key query_execution_id_of_yojson "QueryExecutionId" _list path }
    : get_query_execution_input)

let get_prepared_statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prepared_statement =
       option_of_yojson (value_for_key prepared_statement_of_yojson "PreparedStatement") _list path;
   }
    : get_prepared_statement_output)

let get_prepared_statement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
     statement_name = value_for_key statement_name_of_yojson "StatementName" _list path;
   }
    : get_prepared_statement_input)

let get_notebook_metadata_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notebook_metadata =
       option_of_yojson (value_for_key notebook_metadata_of_yojson "NotebookMetadata") _list path;
   }
    : get_notebook_metadata_output)

let get_notebook_metadata_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ notebook_id = value_for_key notebook_id_of_yojson "NotebookId" _list path }
    : get_notebook_metadata_input)

let get_named_query_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ named_query = option_of_yojson (value_for_key named_query_of_yojson "NamedQuery") _list path }
    : get_named_query_output)

let get_named_query_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ named_query_id = value_for_key named_query_id_of_yojson "NamedQueryId" _list path }
    : get_named_query_input)

let get_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ database = option_of_yojson (value_for_key database_of_yojson "Database") _list path }
    : get_database_output)

let get_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_name = value_for_key catalog_name_string_of_yojson "CatalogName" _list path;
   }
    : get_database_input)

let data_catalog_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key error_message_of_yojson "Error") _list path;
     connection_type =
       option_of_yojson (value_for_key connection_type_of_yojson "ConnectionType") _list path;
     status = option_of_yojson (value_for_key data_catalog_status_of_yojson "Status") _list path;
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     type_ = value_for_key data_catalog_type_of_yojson "Type" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key catalog_name_string_of_yojson "Name" _list path;
   }
    : data_catalog)

let get_data_catalog_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_catalog = option_of_yojson (value_for_key data_catalog_of_yojson "DataCatalog") _list path;
   }
    : get_data_catalog_output)

let get_data_catalog_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     name = value_for_key catalog_name_string_of_yojson "Name" _list path;
   }
    : get_data_catalog_input)

let get_capacity_reservation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_reservation =
       value_for_key capacity_reservation_of_yojson "CapacityReservation" _list path;
   }
    : get_capacity_reservation_output)

let get_capacity_reservation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key capacity_reservation_name_of_yojson "Name" _list path }
    : get_capacity_reservation_input)

let capacity_assignment_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_assignments =
       option_of_yojson
         (value_for_key capacity_assignments_list_of_yojson "CapacityAssignments")
         _list path;
     capacity_reservation_name =
       option_of_yojson
         (value_for_key capacity_reservation_name_of_yojson "CapacityReservationName")
         _list path;
   }
    : capacity_assignment_configuration)

let get_capacity_assignment_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_assignment_configuration =
       value_for_key capacity_assignment_configuration_of_yojson "CapacityAssignmentConfiguration"
         _list path;
   }
    : get_capacity_assignment_configuration_output)

let get_capacity_assignment_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_reservation_name =
       value_for_key capacity_reservation_name_of_yojson "CapacityReservationName" _list path;
   }
    : get_capacity_assignment_configuration_input)

let calculation_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     progress = option_of_yojson (value_for_key description_string_of_yojson "Progress") _list path;
     dpu_execution_in_millis =
       option_of_yojson (value_for_key long_of_yojson "DpuExecutionInMillis") _list path;
   }
    : calculation_statistics)

let get_calculation_execution_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statistics =
       option_of_yojson (value_for_key calculation_statistics_of_yojson "Statistics") _list path;
     status = option_of_yojson (value_for_key calculation_status_of_yojson "Status") _list path;
   }
    : get_calculation_execution_status_response)

let get_calculation_execution_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     calculation_execution_id =
       value_for_key calculation_execution_id_of_yojson "CalculationExecutionId" _list path;
   }
    : get_calculation_execution_status_request)

let calculation_result_type_of_yojson = string_of_yojson

let calculation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_type =
       option_of_yojson (value_for_key calculation_result_type_of_yojson "ResultType") _list path;
     result_s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "ResultS3Uri") _list path;
     std_error_s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "StdErrorS3Uri") _list path;
     std_out_s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "StdOutS3Uri") _list path;
   }
    : calculation_result)

let get_calculation_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_ = option_of_yojson (value_for_key calculation_result_of_yojson "Result") _list path;
     statistics =
       option_of_yojson (value_for_key calculation_statistics_of_yojson "Statistics") _list path;
     status = option_of_yojson (value_for_key calculation_status_of_yojson "Status") _list path;
     working_directory =
       option_of_yojson (value_for_key s3_uri_of_yojson "WorkingDirectory") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
     calculation_execution_id =
       option_of_yojson
         (value_for_key calculation_execution_id_of_yojson "CalculationExecutionId")
         _list path;
   }
    : get_calculation_execution_response)

let get_calculation_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     calculation_execution_id =
       value_for_key calculation_execution_id_of_yojson "CalculationExecutionId" _list path;
   }
    : get_calculation_execution_request)

let get_calculation_execution_code_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ code_block = option_of_yojson (value_for_key code_block_of_yojson "CodeBlock") _list path }
    : get_calculation_execution_code_response)

let get_calculation_execution_code_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     calculation_execution_id =
       value_for_key calculation_execution_id_of_yojson "CalculationExecutionId" _list path;
   }
    : get_calculation_execution_code_request)

let export_notebook_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload = option_of_yojson (value_for_key payload_of_yojson "Payload") _list path;
     notebook_metadata =
       option_of_yojson (value_for_key notebook_metadata_of_yojson "NotebookMetadata") _list path;
   }
    : export_notebook_output)

let export_notebook_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ notebook_id = value_for_key notebook_id_of_yojson "NotebookId" _list path }
    : export_notebook_input)

let delete_work_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_work_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recursive_delete_option =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "RecursiveDeleteOption") _list path;
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
   }
    : delete_work_group_input)

let delete_prepared_statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_prepared_statement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
     statement_name = value_for_key statement_name_of_yojson "StatementName" _list path;
   }
    : delete_prepared_statement_input)

let delete_notebook_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_notebook_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ notebook_id = value_for_key notebook_id_of_yojson "NotebookId" _list path }
    : delete_notebook_input)

let delete_named_query_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_named_query_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ named_query_id = value_for_key named_query_id_of_yojson "NamedQueryId" _list path }
    : delete_named_query_input)

let delete_data_catalog_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_catalog = option_of_yojson (value_for_key data_catalog_of_yojson "DataCatalog") _list path;
   }
    : delete_data_catalog_output)

let delete_data_catalog_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_catalog_only =
       option_of_yojson (value_for_key boolean__of_yojson "DeleteCatalogOnly") _list path;
     name = value_for_key catalog_name_string_of_yojson "Name" _list path;
   }
    : delete_data_catalog_input)

let delete_capacity_reservation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_capacity_reservation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key capacity_reservation_name_of_yojson "Name" _list path }
    : delete_capacity_reservation_input)

let create_work_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_work_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     description =
       option_of_yojson
         (value_for_key work_group_description_string_of_yojson "Description")
         _list path;
     configuration =
       option_of_yojson
         (value_for_key work_group_configuration_of_yojson "Configuration")
         _list path;
     name = value_for_key work_group_name_of_yojson "Name" _list path;
   }
    : create_work_group_input)

let auth_token_of_yojson = string_of_yojson

let create_presigned_notebook_url_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auth_token_expiration_time = value_for_key long_of_yojson "AuthTokenExpirationTime" _list path;
     auth_token = value_for_key auth_token_of_yojson "AuthToken" _list path;
     notebook_url = value_for_key string__of_yojson "NotebookUrl" _list path;
   }
    : create_presigned_notebook_url_response)

let create_presigned_notebook_url_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key session_id_of_yojson "SessionId" _list path }
    : create_presigned_notebook_url_request)

let create_prepared_statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_prepared_statement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     query_statement = value_for_key query_string_of_yojson "QueryStatement" _list path;
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
     statement_name = value_for_key statement_name_of_yojson "StatementName" _list path;
   }
    : create_prepared_statement_input)

let create_notebook_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ notebook_id = option_of_yojson (value_for_key notebook_id_of_yojson "NotebookId") _list path }
    : create_notebook_output)

let create_notebook_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     name = value_for_key notebook_name_of_yojson "Name" _list path;
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
   }
    : create_notebook_input)

let create_named_query_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     named_query_id =
       option_of_yojson (value_for_key named_query_id_of_yojson "NamedQueryId") _list path;
   }
    : create_named_query_output)

let create_named_query_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = option_of_yojson (value_for_key work_group_name_of_yojson "WorkGroup") _list path;
     client_request_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientRequestToken") _list path;
     query_string = value_for_key query_string_of_yojson "QueryString" _list path;
     database = value_for_key database_string_of_yojson "Database" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_named_query_input)

let create_data_catalog_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_catalog = option_of_yojson (value_for_key data_catalog_of_yojson "DataCatalog") _list path;
   }
    : create_data_catalog_output)

let create_data_catalog_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     type_ = value_for_key data_catalog_type_of_yojson "Type" _list path;
     name = value_for_key catalog_name_string_of_yojson "Name" _list path;
   }
    : create_data_catalog_input)

let create_capacity_reservation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_capacity_reservation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     name = value_for_key capacity_reservation_name_of_yojson "Name" _list path;
     target_dpus = value_for_key target_dpus_integer_of_yojson "TargetDpus" _list path;
   }
    : create_capacity_reservation_input)

let cancel_capacity_reservation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_capacity_reservation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key capacity_reservation_name_of_yojson "Name" _list path }
    : cancel_capacity_reservation_input)

let batch_get_query_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unprocessed_query_execution_ids =
       option_of_yojson
         (value_for_key unprocessed_query_execution_id_list_of_yojson "UnprocessedQueryExecutionIds")
         _list path;
     query_executions =
       option_of_yojson (value_for_key query_execution_list_of_yojson "QueryExecutions") _list path;
   }
    : batch_get_query_execution_output)

let batch_get_query_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_execution_ids =
       value_for_key query_execution_id_list_of_yojson "QueryExecutionIds" _list path;
   }
    : batch_get_query_execution_input)

let batch_get_prepared_statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unprocessed_prepared_statement_names =
       option_of_yojson
         (value_for_key unprocessed_prepared_statement_name_list_of_yojson
            "UnprocessedPreparedStatementNames")
         _list path;
     prepared_statements =
       option_of_yojson
         (value_for_key prepared_statement_details_list_of_yojson "PreparedStatements")
         _list path;
   }
    : batch_get_prepared_statement_output)

let batch_get_prepared_statement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     work_group = value_for_key work_group_name_of_yojson "WorkGroup" _list path;
     prepared_statement_names =
       value_for_key prepared_statement_name_list_of_yojson "PreparedStatementNames" _list path;
   }
    : batch_get_prepared_statement_input)

let batch_get_named_query_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unprocessed_named_query_ids =
       option_of_yojson
         (value_for_key unprocessed_named_query_id_list_of_yojson "UnprocessedNamedQueryIds")
         _list path;
     named_queries =
       option_of_yojson (value_for_key named_query_list_of_yojson "NamedQueries") _list path;
   }
    : batch_get_named_query_output)

let batch_get_named_query_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ named_query_ids = value_for_key named_query_id_list_of_yojson "NamedQueryIds" _list path }
    : batch_get_named_query_input)
