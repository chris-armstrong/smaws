open Smaws_Lib.Json.SerializeHelpers
open Types

let approximate_creation_date_time_precision_to_yojson
    (x : approximate_creation_date_time_precision) =
  match x with MILLISECOND -> `String "MILLISECOND" | MICROSECOND -> `String "MICROSECOND"

let archival_reason_to_yojson = string_to_yojson
let backup_arn_to_yojson = string_to_yojson
let date_to_yojson = timestamp_epoch_seconds_to_yojson

let archival_summary_to_yojson (x : archival_summary) =
  assoc_to_yojson
    [
      ("ArchivalDateTime", option_to_yojson date_to_yojson x.archival_date_time);
      ("ArchivalReason", option_to_yojson archival_reason_to_yojson x.archival_reason);
      ("ArchivalBackupArn", option_to_yojson backup_arn_to_yojson x.archival_backup_arn);
    ]

let attribute_action_to_yojson (x : attribute_action) =
  match x with ADD -> `String "ADD" | PUT -> `String "PUT" | DELETE -> `String "DELETE"

let scalar_attribute_type_to_yojson (x : scalar_attribute_type) =
  match x with S -> `String "S" | N -> `String "N" | B -> `String "B"

let key_schema_attribute_name_to_yojson = string_to_yojson

let attribute_definition_to_yojson (x : attribute_definition) =
  assoc_to_yojson
    [
      ("AttributeName", Some (key_schema_attribute_name_to_yojson x.attribute_name));
      ("AttributeType", Some (scalar_attribute_type_to_yojson x.attribute_type));
    ]

let attribute_definitions_to_yojson tree = list_to_yojson attribute_definition_to_yojson tree
let boolean_attribute_value_to_yojson = bool_to_yojson
let null_attribute_value_to_yojson = bool_to_yojson
let attribute_name_to_yojson = string_to_yojson
let binary_attribute_value_to_yojson = blob_to_yojson
let binary_set_attribute_value_to_yojson tree = list_to_yojson binary_attribute_value_to_yojson tree
let number_attribute_value_to_yojson = string_to_yojson
let number_set_attribute_value_to_yojson tree = list_to_yojson number_attribute_value_to_yojson tree
let string_attribute_value_to_yojson = string_to_yojson
let string_set_attribute_value_to_yojson tree = list_to_yojson string_attribute_value_to_yojson tree

let rec map_attribute_value_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

and list_attribute_value_to_yojson tree = list_to_yojson attribute_value_to_yojson tree

and attribute_value_to_yojson (x : attribute_value) =
  match x with
  | S arg -> assoc_to_yojson [ ("S", Some (string_attribute_value_to_yojson arg)) ]
  | N arg -> assoc_to_yojson [ ("N", Some (number_attribute_value_to_yojson arg)) ]
  | B arg -> assoc_to_yojson [ ("B", Some (binary_attribute_value_to_yojson arg)) ]
  | SS arg -> assoc_to_yojson [ ("SS", Some (string_set_attribute_value_to_yojson arg)) ]
  | NS arg -> assoc_to_yojson [ ("NS", Some (number_set_attribute_value_to_yojson arg)) ]
  | BS arg -> assoc_to_yojson [ ("BS", Some (binary_set_attribute_value_to_yojson arg)) ]
  | M arg -> assoc_to_yojson [ ("M", Some (map_attribute_value_to_yojson arg)) ]
  | L arg -> assoc_to_yojson [ ("L", Some (list_attribute_value_to_yojson arg)) ]
  | NULL arg -> assoc_to_yojson [ ("NULL", Some (null_attribute_value_to_yojson arg)) ]
  | BOOL arg -> assoc_to_yojson [ ("BOOL", Some (boolean_attribute_value_to_yojson arg)) ]

let attribute_map_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let attribute_name_list_to_yojson tree = list_to_yojson attribute_name_to_yojson tree

let attribute_value_update_to_yojson (x : attribute_value_update) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson attribute_value_to_yojson x.value);
      ("Action", option_to_yojson attribute_action_to_yojson x.action);
    ]

let attribute_updates_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_update_to_yojson tree

let attribute_value_list_to_yojson tree = list_to_yojson attribute_value_to_yojson tree
let double_object_to_yojson = double_to_yojson
let integer_object_to_yojson = int_to_yojson
let boolean_object_to_yojson = bool_to_yojson

let auto_scaling_target_tracking_scaling_policy_configuration_description_to_yojson
    (x : auto_scaling_target_tracking_scaling_policy_configuration_description) =
  assoc_to_yojson
    [
      ("DisableScaleIn", option_to_yojson boolean_object_to_yojson x.disable_scale_in);
      ("ScaleInCooldown", option_to_yojson integer_object_to_yojson x.scale_in_cooldown);
      ("ScaleOutCooldown", option_to_yojson integer_object_to_yojson x.scale_out_cooldown);
      ("TargetValue", Some (double_object_to_yojson x.target_value));
    ]

let auto_scaling_policy_name_to_yojson = string_to_yojson

let auto_scaling_policy_description_to_yojson (x : auto_scaling_policy_description) =
  assoc_to_yojson
    [
      ("PolicyName", option_to_yojson auto_scaling_policy_name_to_yojson x.policy_name);
      ( "TargetTrackingScalingPolicyConfiguration",
        option_to_yojson
          auto_scaling_target_tracking_scaling_policy_configuration_description_to_yojson
          x.target_tracking_scaling_policy_configuration );
    ]

let auto_scaling_policy_description_list_to_yojson tree =
  list_to_yojson auto_scaling_policy_description_to_yojson tree

let auto_scaling_target_tracking_scaling_policy_configuration_update_to_yojson
    (x : auto_scaling_target_tracking_scaling_policy_configuration_update) =
  assoc_to_yojson
    [
      ("DisableScaleIn", option_to_yojson boolean_object_to_yojson x.disable_scale_in);
      ("ScaleInCooldown", option_to_yojson integer_object_to_yojson x.scale_in_cooldown);
      ("ScaleOutCooldown", option_to_yojson integer_object_to_yojson x.scale_out_cooldown);
      ("TargetValue", Some (double_object_to_yojson x.target_value));
    ]

let auto_scaling_policy_update_to_yojson (x : auto_scaling_policy_update) =
  assoc_to_yojson
    [
      ("PolicyName", option_to_yojson auto_scaling_policy_name_to_yojson x.policy_name);
      ( "TargetTrackingScalingPolicyConfiguration",
        Some
          (auto_scaling_target_tracking_scaling_policy_configuration_update_to_yojson
             x.target_tracking_scaling_policy_configuration) );
    ]

let auto_scaling_role_arn_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson
let positive_long_object_to_yojson = long_to_yojson

let auto_scaling_settings_description_to_yojson (x : auto_scaling_settings_description) =
  assoc_to_yojson
    [
      ("MinimumUnits", option_to_yojson positive_long_object_to_yojson x.minimum_units);
      ("MaximumUnits", option_to_yojson positive_long_object_to_yojson x.maximum_units);
      ("AutoScalingDisabled", option_to_yojson boolean_object_to_yojson x.auto_scaling_disabled);
      ("AutoScalingRoleArn", option_to_yojson string__to_yojson x.auto_scaling_role_arn);
      ( "ScalingPolicies",
        option_to_yojson auto_scaling_policy_description_list_to_yojson x.scaling_policies );
    ]

let auto_scaling_settings_update_to_yojson (x : auto_scaling_settings_update) =
  assoc_to_yojson
    [
      ("MinimumUnits", option_to_yojson positive_long_object_to_yojson x.minimum_units);
      ("MaximumUnits", option_to_yojson positive_long_object_to_yojson x.maximum_units);
      ("AutoScalingDisabled", option_to_yojson boolean_object_to_yojson x.auto_scaling_disabled);
      ( "AutoScalingRoleArn",
        option_to_yojson auto_scaling_role_arn_to_yojson x.auto_scaling_role_arn );
      ( "ScalingPolicyUpdate",
        option_to_yojson auto_scaling_policy_update_to_yojson x.scaling_policy_update );
    ]

let availability_error_message_to_yojson = string_to_yojson
let backfilling_to_yojson = bool_to_yojson
let backup_creation_date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let kms_master_key_arn_to_yojson = string_to_yojson

let sse_type_to_yojson (x : sse_type) =
  match x with AES256 -> `String "AES256" | KMS -> `String "KMS"

let sse_status_to_yojson (x : sse_status) =
  match x with
  | ENABLING -> `String "ENABLING"
  | ENABLED -> `String "ENABLED"
  | DISABLING -> `String "DISABLING"
  | DISABLED -> `String "DISABLED"
  | UPDATING -> `String "UPDATING"

let sse_description_to_yojson (x : sse_description) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson sse_status_to_yojson x.status);
      ("SSEType", option_to_yojson sse_type_to_yojson x.sse_type);
      ("KMSMasterKeyArn", option_to_yojson kms_master_key_arn_to_yojson x.kms_master_key_arn);
      ( "InaccessibleEncryptionDateTime",
        option_to_yojson date_to_yojson x.inaccessible_encryption_date_time );
    ]

let time_to_live_attribute_name_to_yojson = string_to_yojson

let time_to_live_status_to_yojson (x : time_to_live_status) =
  match x with
  | ENABLING -> `String "ENABLING"
  | DISABLING -> `String "DISABLING"
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"

let time_to_live_description_to_yojson (x : time_to_live_description) =
  assoc_to_yojson
    [
      ("TimeToLiveStatus", option_to_yojson time_to_live_status_to_yojson x.time_to_live_status);
      ("AttributeName", option_to_yojson time_to_live_attribute_name_to_yojson x.attribute_name);
    ]

let stream_view_type_to_yojson (x : stream_view_type) =
  match x with
  | NEW_IMAGE -> `String "NEW_IMAGE"
  | OLD_IMAGE -> `String "OLD_IMAGE"
  | NEW_AND_OLD_IMAGES -> `String "NEW_AND_OLD_IMAGES"
  | KEYS_ONLY -> `String "KEYS_ONLY"

let stream_enabled_to_yojson = bool_to_yojson

let stream_specification_to_yojson (x : stream_specification) =
  assoc_to_yojson
    [
      ("StreamEnabled", Some (stream_enabled_to_yojson x.stream_enabled));
      ("StreamViewType", option_to_yojson stream_view_type_to_yojson x.stream_view_type);
    ]

let long_object_to_yojson = long_to_yojson

let on_demand_throughput_to_yojson (x : on_demand_throughput) =
  assoc_to_yojson
    [
      ("MaxReadRequestUnits", option_to_yojson long_object_to_yojson x.max_read_request_units);
      ("MaxWriteRequestUnits", option_to_yojson long_object_to_yojson x.max_write_request_units);
    ]

let provisioned_throughput_to_yojson (x : provisioned_throughput) =
  assoc_to_yojson
    [
      ("ReadCapacityUnits", Some (positive_long_object_to_yojson x.read_capacity_units));
      ("WriteCapacityUnits", Some (positive_long_object_to_yojson x.write_capacity_units));
    ]

let non_key_attribute_name_to_yojson = string_to_yojson

let non_key_attribute_name_list_to_yojson tree =
  list_to_yojson non_key_attribute_name_to_yojson tree

let projection_type_to_yojson (x : projection_type) =
  match x with
  | ALL -> `String "ALL"
  | KEYS_ONLY -> `String "KEYS_ONLY"
  | INCLUDE -> `String "INCLUDE"

let projection_to_yojson (x : projection) =
  assoc_to_yojson
    [
      ("ProjectionType", option_to_yojson projection_type_to_yojson x.projection_type);
      ( "NonKeyAttributes",
        option_to_yojson non_key_attribute_name_list_to_yojson x.non_key_attributes );
    ]

let key_type_to_yojson (x : key_type) =
  match x with HASH -> `String "HASH" | RANGE -> `String "RANGE"

let key_schema_element_to_yojson (x : key_schema_element) =
  assoc_to_yojson
    [
      ("AttributeName", Some (key_schema_attribute_name_to_yojson x.attribute_name));
      ("KeyType", Some (key_type_to_yojson x.key_type));
    ]

let key_schema_to_yojson tree = list_to_yojson key_schema_element_to_yojson tree
let index_name_to_yojson = string_to_yojson

let global_secondary_index_info_to_yojson (x : global_secondary_index_info) =
  assoc_to_yojson
    [
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ("KeySchema", option_to_yojson key_schema_to_yojson x.key_schema);
      ("Projection", option_to_yojson projection_to_yojson x.projection);
      ( "ProvisionedThroughput",
        option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput );
      ("OnDemandThroughput", option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput);
    ]

let global_secondary_indexes_to_yojson tree =
  list_to_yojson global_secondary_index_info_to_yojson tree

let local_secondary_index_info_to_yojson (x : local_secondary_index_info) =
  assoc_to_yojson
    [
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ("KeySchema", option_to_yojson key_schema_to_yojson x.key_schema);
      ("Projection", option_to_yojson projection_to_yojson x.projection);
    ]

let local_secondary_indexes_to_yojson tree =
  list_to_yojson local_secondary_index_info_to_yojson tree

let source_table_feature_details_to_yojson (x : source_table_feature_details) =
  assoc_to_yojson
    [
      ( "LocalSecondaryIndexes",
        option_to_yojson local_secondary_indexes_to_yojson x.local_secondary_indexes );
      ( "GlobalSecondaryIndexes",
        option_to_yojson global_secondary_indexes_to_yojson x.global_secondary_indexes );
      ("StreamDescription", option_to_yojson stream_specification_to_yojson x.stream_description);
      ( "TimeToLiveDescription",
        option_to_yojson time_to_live_description_to_yojson x.time_to_live_description );
      ("SSEDescription", option_to_yojson sse_description_to_yojson x.sse_description);
    ]

let billing_mode_to_yojson (x : billing_mode) =
  match x with PROVISIONED -> `String "PROVISIONED" | PAY_PER_REQUEST -> `String "PAY_PER_REQUEST"

let item_count_to_yojson = long_to_yojson
let table_creation_date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let table_arn_to_yojson = string_to_yojson
let table_id_to_yojson = string_to_yojson
let table_name_to_yojson = string_to_yojson

let source_table_details_to_yojson (x : source_table_details) =
  assoc_to_yojson
    [
      ("TableName", Some (table_name_to_yojson x.table_name));
      ("TableId", Some (table_id_to_yojson x.table_id));
      ("TableArn", option_to_yojson table_arn_to_yojson x.table_arn);
      ("TableSizeBytes", option_to_yojson long_object_to_yojson x.table_size_bytes);
      ("KeySchema", Some (key_schema_to_yojson x.key_schema));
      ("TableCreationDateTime", Some (table_creation_date_time_to_yojson x.table_creation_date_time));
      ("ProvisionedThroughput", Some (provisioned_throughput_to_yojson x.provisioned_throughput));
      ("OnDemandThroughput", option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput);
      ("ItemCount", option_to_yojson item_count_to_yojson x.item_count);
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
    ]

let backup_type_to_yojson (x : backup_type) =
  match x with
  | USER -> `String "USER"
  | SYSTEM -> `String "SYSTEM"
  | AWS_BACKUP -> `String "AWS_BACKUP"

let backup_status_to_yojson (x : backup_status) =
  match x with
  | CREATING -> `String "CREATING"
  | DELETED -> `String "DELETED"
  | AVAILABLE -> `String "AVAILABLE"

let backup_size_bytes_to_yojson = long_to_yojson
let backup_name_to_yojson = string_to_yojson

let backup_details_to_yojson (x : backup_details) =
  assoc_to_yojson
    [
      ("BackupArn", Some (backup_arn_to_yojson x.backup_arn));
      ("BackupName", Some (backup_name_to_yojson x.backup_name));
      ("BackupSizeBytes", option_to_yojson backup_size_bytes_to_yojson x.backup_size_bytes);
      ("BackupStatus", Some (backup_status_to_yojson x.backup_status));
      ("BackupType", Some (backup_type_to_yojson x.backup_type));
      ( "BackupCreationDateTime",
        Some (backup_creation_date_time_to_yojson x.backup_creation_date_time) );
      ("BackupExpiryDateTime", option_to_yojson date_to_yojson x.backup_expiry_date_time);
    ]

let backup_description_to_yojson (x : backup_description) =
  assoc_to_yojson
    [
      ("BackupDetails", option_to_yojson backup_details_to_yojson x.backup_details);
      ("SourceTableDetails", option_to_yojson source_table_details_to_yojson x.source_table_details);
      ( "SourceTableFeatureDetails",
        option_to_yojson source_table_feature_details_to_yojson x.source_table_feature_details );
    ]

let error_message_to_yojson = string_to_yojson

let backup_in_use_exception_to_yojson (x : backup_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let backup_not_found_exception_to_yojson (x : backup_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let backup_summary_to_yojson (x : backup_summary) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("TableId", option_to_yojson table_id_to_yojson x.table_id);
      ("TableArn", option_to_yojson table_arn_to_yojson x.table_arn);
      ("BackupArn", option_to_yojson backup_arn_to_yojson x.backup_arn);
      ("BackupName", option_to_yojson backup_name_to_yojson x.backup_name);
      ( "BackupCreationDateTime",
        option_to_yojson backup_creation_date_time_to_yojson x.backup_creation_date_time );
      ("BackupExpiryDateTime", option_to_yojson date_to_yojson x.backup_expiry_date_time);
      ("BackupStatus", option_to_yojson backup_status_to_yojson x.backup_status);
      ("BackupType", option_to_yojson backup_type_to_yojson x.backup_type);
      ("BackupSizeBytes", option_to_yojson backup_size_bytes_to_yojson x.backup_size_bytes);
    ]

let backup_summaries_to_yojson tree = list_to_yojson backup_summary_to_yojson tree

let backup_type_filter_to_yojson (x : backup_type_filter) =
  match x with
  | USER -> `String "USER"
  | SYSTEM -> `String "SYSTEM"
  | AWS_BACKUP -> `String "AWS_BACKUP"
  | ALL -> `String "ALL"

let backups_input_limit_to_yojson = int_to_yojson
let resource_to_yojson = string_to_yojson
let reason_to_yojson = string_to_yojson

let throttling_reason_to_yojson (x : throttling_reason) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson reason_to_yojson x.reason);
      ("resource", option_to_yojson resource_to_yojson x.resource);
    ]

let throttling_reason_list_to_yojson tree = list_to_yojson throttling_reason_to_yojson tree

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson availability_error_message_to_yojson x.message);
      ("throttlingReasons", option_to_yojson throttling_reason_list_to_yojson x.throttling_reasons);
    ]

let request_limit_exceeded_to_yojson (x : request_limit_exceeded) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("ThrottlingReasons", option_to_yojson throttling_reason_list_to_yojson x.throttling_reasons);
    ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let consumed_capacity_units_to_yojson = double_to_yojson

let capacity_to_yojson (x : capacity) =
  assoc_to_yojson
    [
      ("ReadCapacityUnits", option_to_yojson consumed_capacity_units_to_yojson x.read_capacity_units);
      ( "WriteCapacityUnits",
        option_to_yojson consumed_capacity_units_to_yojson x.write_capacity_units );
      ("CapacityUnits", option_to_yojson consumed_capacity_units_to_yojson x.capacity_units);
    ]

let secondary_indexes_capacity_map_to_yojson tree =
  map_to_yojson index_name_to_yojson capacity_to_yojson tree

let consumed_capacity_to_yojson (x : consumed_capacity) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_arn_to_yojson x.table_name);
      ("CapacityUnits", option_to_yojson consumed_capacity_units_to_yojson x.capacity_units);
      ("ReadCapacityUnits", option_to_yojson consumed_capacity_units_to_yojson x.read_capacity_units);
      ( "WriteCapacityUnits",
        option_to_yojson consumed_capacity_units_to_yojson x.write_capacity_units );
      ("Table", option_to_yojson capacity_to_yojson x.table);
      ( "LocalSecondaryIndexes",
        option_to_yojson secondary_indexes_capacity_map_to_yojson x.local_secondary_indexes );
      ( "GlobalSecondaryIndexes",
        option_to_yojson secondary_indexes_capacity_map_to_yojson x.global_secondary_indexes );
    ]

let consumed_capacity_multiple_to_yojson tree = list_to_yojson consumed_capacity_to_yojson tree

let batch_statement_error_code_enum_to_yojson (x : batch_statement_error_code_enum) =
  match x with
  | ConditionalCheckFailed -> `String "ConditionalCheckFailed"
  | ItemCollectionSizeLimitExceeded -> `String "ItemCollectionSizeLimitExceeded"
  | RequestLimitExceeded -> `String "RequestLimitExceeded"
  | ValidationError -> `String "ValidationError"
  | ProvisionedThroughputExceeded -> `String "ProvisionedThroughputExceeded"
  | TransactionConflict -> `String "TransactionConflict"
  | ThrottlingError -> `String "ThrottlingError"
  | InternalServerError -> `String "InternalServerError"
  | ResourceNotFound -> `String "ResourceNotFound"
  | AccessDenied -> `String "AccessDenied"
  | DuplicateItem -> `String "DuplicateItem"

let batch_statement_error_to_yojson (x : batch_statement_error) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson batch_statement_error_code_enum_to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Item", option_to_yojson attribute_map_to_yojson x.item);
    ]

let batch_statement_response_to_yojson (x : batch_statement_response) =
  assoc_to_yojson
    [
      ("Error", option_to_yojson batch_statement_error_to_yojson x.error);
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("Item", option_to_yojson attribute_map_to_yojson x.item);
    ]

let parti_ql_batch_response_to_yojson tree = list_to_yojson batch_statement_response_to_yojson tree

let batch_execute_statement_output_to_yojson (x : batch_execute_statement_output) =
  assoc_to_yojson
    [
      ("Responses", option_to_yojson parti_ql_batch_response_to_yojson x.responses);
      ("ConsumedCapacity", option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity);
    ]

let return_consumed_capacity_to_yojson (x : return_consumed_capacity) =
  match x with INDEXES -> `String "INDEXES" | TOTAL -> `String "TOTAL" | NONE -> `String "NONE"

let return_values_on_condition_check_failure_to_yojson
    (x : return_values_on_condition_check_failure) =
  match x with ALL_OLD -> `String "ALL_OLD" | NONE -> `String "NONE"

let consistent_read_to_yojson = bool_to_yojson
let prepared_statement_parameters_to_yojson tree = list_to_yojson attribute_value_to_yojson tree
let parti_ql_statement_to_yojson = string_to_yojson

let batch_statement_request_to_yojson (x : batch_statement_request) =
  assoc_to_yojson
    [
      ("Statement", Some (parti_ql_statement_to_yojson x.statement));
      ("Parameters", option_to_yojson prepared_statement_parameters_to_yojson x.parameters);
      ("ConsistentRead", option_to_yojson consistent_read_to_yojson x.consistent_read);
      ( "ReturnValuesOnConditionCheckFailure",
        option_to_yojson return_values_on_condition_check_failure_to_yojson
          x.return_values_on_condition_check_failure );
    ]

let parti_ql_batch_request_to_yojson tree = list_to_yojson batch_statement_request_to_yojson tree

let batch_execute_statement_input_to_yojson (x : batch_execute_statement_input) =
  assoc_to_yojson
    [
      ("Statements", Some (parti_ql_batch_request_to_yojson x.statements));
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let provisioned_throughput_exceeded_exception_to_yojson
    (x : provisioned_throughput_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("ThrottlingReasons", option_to_yojson throttling_reason_list_to_yojson x.throttling_reasons);
    ]

let invalid_endpoint_exception_to_yojson (x : invalid_endpoint_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let expression_attribute_name_variable_to_yojson = string_to_yojson

let expression_attribute_name_map_to_yojson tree =
  map_to_yojson expression_attribute_name_variable_to_yojson attribute_name_to_yojson tree

let projection_expression_to_yojson = string_to_yojson
let key_to_yojson tree = map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree
let key_list_to_yojson tree = list_to_yojson key_to_yojson tree

let keys_and_attributes_to_yojson (x : keys_and_attributes) =
  assoc_to_yojson
    [
      ("Keys", Some (key_list_to_yojson x.keys));
      ("AttributesToGet", option_to_yojson attribute_name_list_to_yojson x.attributes_to_get);
      ("ConsistentRead", option_to_yojson consistent_read_to_yojson x.consistent_read);
      ( "ProjectionExpression",
        option_to_yojson projection_expression_to_yojson x.projection_expression );
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
    ]

let batch_get_request_map_to_yojson tree =
  map_to_yojson table_arn_to_yojson keys_and_attributes_to_yojson tree

let item_list_to_yojson tree = list_to_yojson attribute_map_to_yojson tree

let batch_get_response_map_to_yojson tree =
  map_to_yojson table_arn_to_yojson item_list_to_yojson tree

let batch_get_item_output_to_yojson (x : batch_get_item_output) =
  assoc_to_yojson
    [
      ("Responses", option_to_yojson batch_get_response_map_to_yojson x.responses);
      ("UnprocessedKeys", option_to_yojson batch_get_request_map_to_yojson x.unprocessed_keys);
      ("ConsumedCapacity", option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity);
    ]

let batch_get_item_input_to_yojson (x : batch_get_item_input) =
  assoc_to_yojson
    [
      ("RequestItems", Some (batch_get_request_map_to_yojson x.request_items));
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
    ]

let replicated_write_conflict_exception_to_yojson (x : replicated_write_conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let item_collection_size_limit_exceeded_exception_to_yojson
    (x : item_collection_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let item_collection_size_estimate_bound_to_yojson = double_to_yojson

let item_collection_size_estimate_range_to_yojson tree =
  list_to_yojson item_collection_size_estimate_bound_to_yojson tree

let item_collection_key_attribute_map_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let item_collection_metrics_to_yojson (x : item_collection_metrics) =
  assoc_to_yojson
    [
      ( "ItemCollectionKey",
        option_to_yojson item_collection_key_attribute_map_to_yojson x.item_collection_key );
      ( "SizeEstimateRangeGB",
        option_to_yojson item_collection_size_estimate_range_to_yojson x.size_estimate_range_g_b );
    ]

let item_collection_metrics_multiple_to_yojson tree =
  list_to_yojson item_collection_metrics_to_yojson tree

let item_collection_metrics_per_table_to_yojson tree =
  map_to_yojson table_arn_to_yojson item_collection_metrics_multiple_to_yojson tree

let delete_request_to_yojson (x : delete_request) =
  assoc_to_yojson [ ("Key", Some (key_to_yojson x.key)) ]

let put_item_input_attribute_map_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let put_request_to_yojson (x : put_request) =
  assoc_to_yojson [ ("Item", Some (put_item_input_attribute_map_to_yojson x.item)) ]

let write_request_to_yojson (x : write_request) =
  assoc_to_yojson
    [
      ("PutRequest", option_to_yojson put_request_to_yojson x.put_request);
      ("DeleteRequest", option_to_yojson delete_request_to_yojson x.delete_request);
    ]

let write_requests_to_yojson tree = list_to_yojson write_request_to_yojson tree

let batch_write_item_request_map_to_yojson tree =
  map_to_yojson table_arn_to_yojson write_requests_to_yojson tree

let batch_write_item_output_to_yojson (x : batch_write_item_output) =
  assoc_to_yojson
    [
      ( "UnprocessedItems",
        option_to_yojson batch_write_item_request_map_to_yojson x.unprocessed_items );
      ( "ItemCollectionMetrics",
        option_to_yojson item_collection_metrics_per_table_to_yojson x.item_collection_metrics );
      ("ConsumedCapacity", option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity);
    ]

let return_item_collection_metrics_to_yojson (x : return_item_collection_metrics) =
  match x with SIZE -> `String "SIZE" | NONE -> `String "NONE"

let batch_write_item_input_to_yojson (x : batch_write_item_input) =
  assoc_to_yojson
    [
      ("RequestItems", Some (batch_write_item_request_map_to_yojson x.request_items));
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
      ( "ReturnItemCollectionMetrics",
        option_to_yojson return_item_collection_metrics_to_yojson x.return_item_collection_metrics
      );
    ]

let billed_size_bytes_to_yojson = long_to_yojson

let billing_mode_summary_to_yojson (x : billing_mode_summary) =
  assoc_to_yojson
    [
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
      ( "LastUpdateToPayPerRequestDateTime",
        option_to_yojson date_to_yojson x.last_update_to_pay_per_request_date_time );
    ]

let code_to_yojson = string_to_yojson

let cancellation_reason_to_yojson (x : cancellation_reason) =
  assoc_to_yojson
    [
      ("Item", option_to_yojson attribute_map_to_yojson x.item);
      ("Code", option_to_yojson code_to_yojson x.code);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let cancellation_reason_list_to_yojson tree = list_to_yojson cancellation_reason_to_yojson tree
let client_request_token_to_yojson = string_to_yojson
let client_token_to_yojson = string_to_yojson
let cloud_watch_log_group_arn_to_yojson = string_to_yojson

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with
  | EQ -> `String "EQ"
  | NE -> `String "NE"
  | IN -> `String "IN"
  | LE -> `String "LE"
  | LT -> `String "LT"
  | GE -> `String "GE"
  | GT -> `String "GT"
  | BETWEEN -> `String "BETWEEN"
  | NOT_NULL -> `String "NOT_NULL"
  | NULL -> `String "NULL"
  | CONTAINS -> `String "CONTAINS"
  | NOT_CONTAINS -> `String "NOT_CONTAINS"
  | BEGINS_WITH -> `String "BEGINS_WITH"

let condition_to_yojson (x : condition) =
  assoc_to_yojson
    [
      ("AttributeValueList", option_to_yojson attribute_value_list_to_yojson x.attribute_value_list);
      ("ComparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
    ]

let expression_attribute_value_variable_to_yojson = string_to_yojson

let expression_attribute_value_map_to_yojson tree =
  map_to_yojson expression_attribute_value_variable_to_yojson attribute_value_to_yojson tree

let condition_expression_to_yojson = string_to_yojson

let condition_check_to_yojson (x : condition_check) =
  assoc_to_yojson
    [
      ("Key", Some (key_to_yojson x.key));
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("ConditionExpression", Some (condition_expression_to_yojson x.condition_expression));
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
      ( "ExpressionAttributeValues",
        option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values );
      ( "ReturnValuesOnConditionCheckFailure",
        option_to_yojson return_values_on_condition_check_failure_to_yojson
          x.return_values_on_condition_check_failure );
    ]

let conditional_check_failed_exception_to_yojson (x : conditional_check_failed_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("Item", option_to_yojson attribute_map_to_yojson x.item);
    ]

let conditional_operator_to_yojson (x : conditional_operator) =
  match x with AND -> `String "AND" | OR -> `String "OR"

let confirm_remove_self_resource_access_to_yojson = bool_to_yojson
let recovery_period_in_days_to_yojson = int_to_yojson

let point_in_time_recovery_status_to_yojson (x : point_in_time_recovery_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let point_in_time_recovery_description_to_yojson (x : point_in_time_recovery_description) =
  assoc_to_yojson
    [
      ( "PointInTimeRecoveryStatus",
        option_to_yojson point_in_time_recovery_status_to_yojson x.point_in_time_recovery_status );
      ( "RecoveryPeriodInDays",
        option_to_yojson recovery_period_in_days_to_yojson x.recovery_period_in_days );
      ("EarliestRestorableDateTime", option_to_yojson date_to_yojson x.earliest_restorable_date_time);
      ("LatestRestorableDateTime", option_to_yojson date_to_yojson x.latest_restorable_date_time);
    ]

let continuous_backups_status_to_yojson (x : continuous_backups_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let continuous_backups_description_to_yojson (x : continuous_backups_description) =
  assoc_to_yojson
    [
      ( "ContinuousBackupsStatus",
        Some (continuous_backups_status_to_yojson x.continuous_backups_status) );
      ( "PointInTimeRecoveryDescription",
        option_to_yojson point_in_time_recovery_description_to_yojson
          x.point_in_time_recovery_description );
    ]

let continuous_backups_unavailable_exception_to_yojson
    (x : continuous_backups_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let contributor_insights_action_to_yojson (x : contributor_insights_action) =
  match x with ENABLE -> `String "ENABLE" | DISABLE -> `String "DISABLE"

let contributor_insights_mode_to_yojson (x : contributor_insights_mode) =
  match x with
  | ACCESSED_AND_THROTTLED_KEYS -> `String "ACCESSED_AND_THROTTLED_KEYS"
  | THROTTLED_KEYS -> `String "THROTTLED_KEYS"

let contributor_insights_rule_to_yojson = string_to_yojson

let contributor_insights_rule_list_to_yojson tree =
  list_to_yojson contributor_insights_rule_to_yojson tree

let contributor_insights_status_to_yojson (x : contributor_insights_status) =
  match x with
  | ENABLING -> `String "ENABLING"
  | ENABLED -> `String "ENABLED"
  | DISABLING -> `String "DISABLING"
  | DISABLED -> `String "DISABLED"
  | FAILED -> `String "FAILED"

let contributor_insights_summary_to_yojson (x : contributor_insights_summary) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ( "ContributorInsightsStatus",
        option_to_yojson contributor_insights_status_to_yojson x.contributor_insights_status );
      ( "ContributorInsightsMode",
        option_to_yojson contributor_insights_mode_to_yojson x.contributor_insights_mode );
    ]

let contributor_insights_summaries_to_yojson tree =
  list_to_yojson contributor_insights_summary_to_yojson tree

let table_not_found_exception_to_yojson (x : table_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let table_in_use_exception_to_yojson (x : table_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let create_backup_output_to_yojson (x : create_backup_output) =
  assoc_to_yojson [ ("BackupDetails", option_to_yojson backup_details_to_yojson x.backup_details) ]

let create_backup_input_to_yojson (x : create_backup_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("BackupName", Some (backup_name_to_yojson x.backup_name));
    ]

let warm_throughput_to_yojson (x : warm_throughput) =
  assoc_to_yojson
    [
      ("ReadUnitsPerSecond", option_to_yojson long_object_to_yojson x.read_units_per_second);
      ("WriteUnitsPerSecond", option_to_yojson long_object_to_yojson x.write_units_per_second);
    ]

let create_global_secondary_index_action_to_yojson (x : create_global_secondary_index_action) =
  assoc_to_yojson
    [
      ("IndexName", Some (index_name_to_yojson x.index_name));
      ("KeySchema", Some (key_schema_to_yojson x.key_schema));
      ("Projection", Some (projection_to_yojson x.projection));
      ( "ProvisionedThroughput",
        option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput );
      ("OnDemandThroughput", option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput);
      ("WarmThroughput", option_to_yojson warm_throughput_to_yojson x.warm_throughput);
    ]

let global_table_already_exists_exception_to_yojson (x : global_table_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let global_table_status_to_yojson (x : global_table_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"

let global_table_arn_string_to_yojson = string_to_yojson

let global_table_settings_replication_mode_to_yojson (x : global_table_settings_replication_mode) =
  match x with
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"
  | ENABLED_WITH_OVERRIDES -> `String "ENABLED_WITH_OVERRIDES"

let table_class_to_yojson (x : table_class) =
  match x with
  | STANDARD -> `String "STANDARD"
  | STANDARD_INFREQUENT_ACCESS -> `String "STANDARD_INFREQUENT_ACCESS"

let table_class_summary_to_yojson (x : table_class_summary) =
  assoc_to_yojson
    [
      ("TableClass", option_to_yojson table_class_to_yojson x.table_class);
      ("LastUpdateDateTime", option_to_yojson date_to_yojson x.last_update_date_time);
    ]

let index_status_to_yojson (x : index_status) =
  match x with
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"

let global_secondary_index_warm_throughput_description_to_yojson
    (x : global_secondary_index_warm_throughput_description) =
  assoc_to_yojson
    [
      ("ReadUnitsPerSecond", option_to_yojson positive_long_object_to_yojson x.read_units_per_second);
      ( "WriteUnitsPerSecond",
        option_to_yojson positive_long_object_to_yojson x.write_units_per_second );
      ("Status", option_to_yojson index_status_to_yojson x.status);
    ]

let on_demand_throughput_override_to_yojson (x : on_demand_throughput_override) =
  assoc_to_yojson
    [ ("MaxReadRequestUnits", option_to_yojson long_object_to_yojson x.max_read_request_units) ]

let provisioned_throughput_override_to_yojson (x : provisioned_throughput_override) =
  assoc_to_yojson
    [ ("ReadCapacityUnits", option_to_yojson positive_long_object_to_yojson x.read_capacity_units) ]

let replica_global_secondary_index_description_to_yojson
    (x : replica_global_secondary_index_description) =
  assoc_to_yojson
    [
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ( "ProvisionedThroughputOverride",
        option_to_yojson provisioned_throughput_override_to_yojson x.provisioned_throughput_override
      );
      ( "OnDemandThroughputOverride",
        option_to_yojson on_demand_throughput_override_to_yojson x.on_demand_throughput_override );
      ( "WarmThroughput",
        option_to_yojson global_secondary_index_warm_throughput_description_to_yojson
          x.warm_throughput );
    ]

let replica_global_secondary_index_description_list_to_yojson tree =
  list_to_yojson replica_global_secondary_index_description_to_yojson tree

let table_status_to_yojson (x : table_status) =
  match x with
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS -> `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
  | ARCHIVING -> `String "ARCHIVING"
  | ARCHIVED -> `String "ARCHIVED"
  | REPLICATION_NOT_AUTHORIZED -> `String "REPLICATION_NOT_AUTHORIZED"

let table_warm_throughput_description_to_yojson (x : table_warm_throughput_description) =
  assoc_to_yojson
    [
      ("ReadUnitsPerSecond", option_to_yojson positive_long_object_to_yojson x.read_units_per_second);
      ( "WriteUnitsPerSecond",
        option_to_yojson positive_long_object_to_yojson x.write_units_per_second );
      ("Status", option_to_yojson table_status_to_yojson x.status);
    ]

let kms_master_key_id_to_yojson = string_to_yojson
let replica_status_percent_progress_to_yojson = string_to_yojson
let replica_status_description_to_yojson = string_to_yojson

let replica_status_to_yojson (x : replica_status) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATION_FAILED -> `String "CREATION_FAILED"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | REGION_DISABLED -> `String "REGION_DISABLED"
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS -> `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
  | ARCHIVING -> `String "ARCHIVING"
  | ARCHIVED -> `String "ARCHIVED"
  | REPLICATION_NOT_AUTHORIZED -> `String "REPLICATION_NOT_AUTHORIZED"

let region_name_to_yojson = string_to_yojson

let replica_description_to_yojson (x : replica_description) =
  assoc_to_yojson
    [
      ("RegionName", option_to_yojson region_name_to_yojson x.region_name);
      ("ReplicaStatus", option_to_yojson replica_status_to_yojson x.replica_status);
      ("ReplicaArn", option_to_yojson string__to_yojson x.replica_arn);
      ( "ReplicaStatusDescription",
        option_to_yojson replica_status_description_to_yojson x.replica_status_description );
      ( "ReplicaStatusPercentProgress",
        option_to_yojson replica_status_percent_progress_to_yojson x.replica_status_percent_progress
      );
      ("KMSMasterKeyId", option_to_yojson kms_master_key_id_to_yojson x.kms_master_key_id);
      ( "ProvisionedThroughputOverride",
        option_to_yojson provisioned_throughput_override_to_yojson x.provisioned_throughput_override
      );
      ( "OnDemandThroughputOverride",
        option_to_yojson on_demand_throughput_override_to_yojson x.on_demand_throughput_override );
      ( "WarmThroughput",
        option_to_yojson table_warm_throughput_description_to_yojson x.warm_throughput );
      ( "GlobalSecondaryIndexes",
        option_to_yojson replica_global_secondary_index_description_list_to_yojson
          x.global_secondary_indexes );
      ( "ReplicaInaccessibleDateTime",
        option_to_yojson date_to_yojson x.replica_inaccessible_date_time );
      ( "ReplicaTableClassSummary",
        option_to_yojson table_class_summary_to_yojson x.replica_table_class_summary );
      ( "GlobalTableSettingsReplicationMode",
        option_to_yojson global_table_settings_replication_mode_to_yojson
          x.global_table_settings_replication_mode );
    ]

let replica_description_list_to_yojson tree = list_to_yojson replica_description_to_yojson tree

let global_table_description_to_yojson (x : global_table_description) =
  assoc_to_yojson
    [
      ("ReplicationGroup", option_to_yojson replica_description_list_to_yojson x.replication_group);
      ("GlobalTableArn", option_to_yojson global_table_arn_string_to_yojson x.global_table_arn);
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("GlobalTableStatus", option_to_yojson global_table_status_to_yojson x.global_table_status);
      ("GlobalTableName", option_to_yojson table_name_to_yojson x.global_table_name);
    ]

let create_global_table_output_to_yojson (x : create_global_table_output) =
  assoc_to_yojson
    [
      ( "GlobalTableDescription",
        option_to_yojson global_table_description_to_yojson x.global_table_description );
    ]

let replica_to_yojson (x : replica) =
  assoc_to_yojson [ ("RegionName", option_to_yojson region_name_to_yojson x.region_name) ]

let replica_list_to_yojson tree = list_to_yojson replica_to_yojson tree

let create_global_table_input_to_yojson (x : create_global_table_input) =
  assoc_to_yojson
    [
      ("GlobalTableName", Some (table_name_to_yojson x.global_table_name));
      ("ReplicationGroup", Some (replica_list_to_yojson x.replication_group));
    ]

let create_global_table_witness_group_member_action_to_yojson
    (x : create_global_table_witness_group_member_action) =
  assoc_to_yojson [ ("RegionName", Some (region_name_to_yojson x.region_name)) ]

let create_replica_action_to_yojson (x : create_replica_action) =
  assoc_to_yojson [ ("RegionName", Some (region_name_to_yojson x.region_name)) ]

let replica_global_secondary_index_to_yojson (x : replica_global_secondary_index) =
  assoc_to_yojson
    [
      ("IndexName", Some (index_name_to_yojson x.index_name));
      ( "ProvisionedThroughputOverride",
        option_to_yojson provisioned_throughput_override_to_yojson x.provisioned_throughput_override
      );
      ( "OnDemandThroughputOverride",
        option_to_yojson on_demand_throughput_override_to_yojson x.on_demand_throughput_override );
    ]

let replica_global_secondary_index_list_to_yojson tree =
  list_to_yojson replica_global_secondary_index_to_yojson tree

let create_replication_group_member_action_to_yojson (x : create_replication_group_member_action) =
  assoc_to_yojson
    [
      ("RegionName", Some (region_name_to_yojson x.region_name));
      ("KMSMasterKeyId", option_to_yojson kms_master_key_id_to_yojson x.kms_master_key_id);
      ( "ProvisionedThroughputOverride",
        option_to_yojson provisioned_throughput_override_to_yojson x.provisioned_throughput_override
      );
      ( "OnDemandThroughputOverride",
        option_to_yojson on_demand_throughput_override_to_yojson x.on_demand_throughput_override );
      ( "GlobalSecondaryIndexes",
        option_to_yojson replica_global_secondary_index_list_to_yojson x.global_secondary_indexes );
      ("TableClassOverride", option_to_yojson table_class_to_yojson x.table_class_override);
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let multi_region_consistency_to_yojson (x : multi_region_consistency) =
  match x with EVENTUAL -> `String "EVENTUAL" | STRONG -> `String "STRONG"

let deletion_protection_enabled_to_yojson = bool_to_yojson
let restore_in_progress_to_yojson = bool_to_yojson

let restore_summary_to_yojson (x : restore_summary) =
  assoc_to_yojson
    [
      ("SourceBackupArn", option_to_yojson backup_arn_to_yojson x.source_backup_arn);
      ("SourceTableArn", option_to_yojson table_arn_to_yojson x.source_table_arn);
      ("RestoreDateTime", Some (date_to_yojson x.restore_date_time));
      ("RestoreInProgress", Some (restore_in_progress_to_yojson x.restore_in_progress));
    ]

let witness_status_to_yojson (x : witness_status) =
  match x with
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"

let global_table_witness_description_to_yojson (x : global_table_witness_description) =
  assoc_to_yojson
    [
      ("RegionName", option_to_yojson region_name_to_yojson x.region_name);
      ("WitnessStatus", option_to_yojson witness_status_to_yojson x.witness_status);
    ]

let global_table_witness_description_list_to_yojson tree =
  list_to_yojson global_table_witness_description_to_yojson tree

let stream_arn_to_yojson = string_to_yojson
let non_negative_long_object_to_yojson = long_to_yojson

let provisioned_throughput_description_to_yojson (x : provisioned_throughput_description) =
  assoc_to_yojson
    [
      ("LastIncreaseDateTime", option_to_yojson date_to_yojson x.last_increase_date_time);
      ("LastDecreaseDateTime", option_to_yojson date_to_yojson x.last_decrease_date_time);
      ( "NumberOfDecreasesToday",
        option_to_yojson positive_long_object_to_yojson x.number_of_decreases_today );
      ( "ReadCapacityUnits",
        option_to_yojson non_negative_long_object_to_yojson x.read_capacity_units );
      ( "WriteCapacityUnits",
        option_to_yojson non_negative_long_object_to_yojson x.write_capacity_units );
    ]

let global_secondary_index_description_to_yojson (x : global_secondary_index_description) =
  assoc_to_yojson
    [
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ("KeySchema", option_to_yojson key_schema_to_yojson x.key_schema);
      ("Projection", option_to_yojson projection_to_yojson x.projection);
      ("IndexStatus", option_to_yojson index_status_to_yojson x.index_status);
      ("Backfilling", option_to_yojson backfilling_to_yojson x.backfilling);
      ( "ProvisionedThroughput",
        option_to_yojson provisioned_throughput_description_to_yojson x.provisioned_throughput );
      ("IndexSizeBytes", option_to_yojson long_object_to_yojson x.index_size_bytes);
      ("ItemCount", option_to_yojson long_object_to_yojson x.item_count);
      ("IndexArn", option_to_yojson string__to_yojson x.index_arn);
      ("OnDemandThroughput", option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput);
      ( "WarmThroughput",
        option_to_yojson global_secondary_index_warm_throughput_description_to_yojson
          x.warm_throughput );
    ]

let global_secondary_index_description_list_to_yojson tree =
  list_to_yojson global_secondary_index_description_to_yojson tree

let local_secondary_index_description_to_yojson (x : local_secondary_index_description) =
  assoc_to_yojson
    [
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ("KeySchema", option_to_yojson key_schema_to_yojson x.key_schema);
      ("Projection", option_to_yojson projection_to_yojson x.projection);
      ("IndexSizeBytes", option_to_yojson long_object_to_yojson x.index_size_bytes);
      ("ItemCount", option_to_yojson long_object_to_yojson x.item_count);
      ("IndexArn", option_to_yojson string__to_yojson x.index_arn);
    ]

let local_secondary_index_description_list_to_yojson tree =
  list_to_yojson local_secondary_index_description_to_yojson tree

let table_description_to_yojson (x : table_description) =
  assoc_to_yojson
    [
      ( "AttributeDefinitions",
        option_to_yojson attribute_definitions_to_yojson x.attribute_definitions );
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("KeySchema", option_to_yojson key_schema_to_yojson x.key_schema);
      ("TableStatus", option_to_yojson table_status_to_yojson x.table_status);
      ("CreationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ( "ProvisionedThroughput",
        option_to_yojson provisioned_throughput_description_to_yojson x.provisioned_throughput );
      ("TableSizeBytes", option_to_yojson long_object_to_yojson x.table_size_bytes);
      ("ItemCount", option_to_yojson long_object_to_yojson x.item_count);
      ("TableArn", option_to_yojson string__to_yojson x.table_arn);
      ("TableId", option_to_yojson table_id_to_yojson x.table_id);
      ("BillingModeSummary", option_to_yojson billing_mode_summary_to_yojson x.billing_mode_summary);
      ( "LocalSecondaryIndexes",
        option_to_yojson local_secondary_index_description_list_to_yojson x.local_secondary_indexes
      );
      ( "GlobalSecondaryIndexes",
        option_to_yojson global_secondary_index_description_list_to_yojson
          x.global_secondary_indexes );
      ("StreamSpecification", option_to_yojson stream_specification_to_yojson x.stream_specification);
      ("LatestStreamLabel", option_to_yojson string__to_yojson x.latest_stream_label);
      ("LatestStreamArn", option_to_yojson stream_arn_to_yojson x.latest_stream_arn);
      ("GlobalTableVersion", option_to_yojson string__to_yojson x.global_table_version);
      ("Replicas", option_to_yojson replica_description_list_to_yojson x.replicas);
      ( "GlobalTableWitnesses",
        option_to_yojson global_table_witness_description_list_to_yojson x.global_table_witnesses );
      ( "GlobalTableSettingsReplicationMode",
        option_to_yojson global_table_settings_replication_mode_to_yojson
          x.global_table_settings_replication_mode );
      ("RestoreSummary", option_to_yojson restore_summary_to_yojson x.restore_summary);
      ("SSEDescription", option_to_yojson sse_description_to_yojson x.sse_description);
      ("ArchivalSummary", option_to_yojson archival_summary_to_yojson x.archival_summary);
      ("TableClassSummary", option_to_yojson table_class_summary_to_yojson x.table_class_summary);
      ( "DeletionProtectionEnabled",
        option_to_yojson deletion_protection_enabled_to_yojson x.deletion_protection_enabled );
      ("OnDemandThroughput", option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput);
      ( "WarmThroughput",
        option_to_yojson table_warm_throughput_description_to_yojson x.warm_throughput );
      ( "MultiRegionConsistency",
        option_to_yojson multi_region_consistency_to_yojson x.multi_region_consistency );
    ]

let create_table_output_to_yojson (x : create_table_output) =
  assoc_to_yojson
    [ ("TableDescription", option_to_yojson table_description_to_yojson x.table_description) ]

let resource_policy_to_yojson = string_to_yojson
let tag_value_string_to_yojson = string_to_yojson
let tag_key_string_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", Some (tag_key_string_to_yojson x.key));
      ("Value", Some (tag_value_string_to_yojson x.value));
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let sse_enabled_to_yojson = bool_to_yojson

let sse_specification_to_yojson (x : sse_specification) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson sse_enabled_to_yojson x.enabled);
      ("SSEType", option_to_yojson sse_type_to_yojson x.sse_type);
      ("KMSMasterKeyId", option_to_yojson kms_master_key_id_to_yojson x.kms_master_key_id);
    ]

let global_secondary_index_to_yojson (x : global_secondary_index) =
  assoc_to_yojson
    [
      ("IndexName", Some (index_name_to_yojson x.index_name));
      ("KeySchema", Some (key_schema_to_yojson x.key_schema));
      ("Projection", Some (projection_to_yojson x.projection));
      ( "ProvisionedThroughput",
        option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput );
      ("OnDemandThroughput", option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput);
      ("WarmThroughput", option_to_yojson warm_throughput_to_yojson x.warm_throughput);
    ]

let global_secondary_index_list_to_yojson tree =
  list_to_yojson global_secondary_index_to_yojson tree

let local_secondary_index_to_yojson (x : local_secondary_index) =
  assoc_to_yojson
    [
      ("IndexName", Some (index_name_to_yojson x.index_name));
      ("KeySchema", Some (key_schema_to_yojson x.key_schema));
      ("Projection", Some (projection_to_yojson x.projection));
    ]

let local_secondary_index_list_to_yojson tree = list_to_yojson local_secondary_index_to_yojson tree

let create_table_input_to_yojson (x : create_table_input) =
  assoc_to_yojson
    [
      ( "AttributeDefinitions",
        option_to_yojson attribute_definitions_to_yojson x.attribute_definitions );
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("KeySchema", option_to_yojson key_schema_to_yojson x.key_schema);
      ( "LocalSecondaryIndexes",
        option_to_yojson local_secondary_index_list_to_yojson x.local_secondary_indexes );
      ( "GlobalSecondaryIndexes",
        option_to_yojson global_secondary_index_list_to_yojson x.global_secondary_indexes );
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
      ( "ProvisionedThroughput",
        option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput );
      ("StreamSpecification", option_to_yojson stream_specification_to_yojson x.stream_specification);
      ("SSESpecification", option_to_yojson sse_specification_to_yojson x.sse_specification);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("TableClass", option_to_yojson table_class_to_yojson x.table_class);
      ( "DeletionProtectionEnabled",
        option_to_yojson deletion_protection_enabled_to_yojson x.deletion_protection_enabled );
      ("WarmThroughput", option_to_yojson warm_throughput_to_yojson x.warm_throughput);
      ("ResourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy);
      ("OnDemandThroughput", option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput);
      ("GlobalTableSourceArn", option_to_yojson table_arn_to_yojson x.global_table_source_arn);
      ( "GlobalTableSettingsReplicationMode",
        option_to_yojson global_table_settings_replication_mode_to_yojson
          x.global_table_settings_replication_mode );
    ]

let csv_delimiter_to_yojson = string_to_yojson
let csv_header_to_yojson = string_to_yojson
let csv_header_list_to_yojson tree = list_to_yojson csv_header_to_yojson tree

let csv_options_to_yojson (x : csv_options) =
  assoc_to_yojson
    [
      ("Delimiter", option_to_yojson csv_delimiter_to_yojson x.delimiter);
      ("HeaderList", option_to_yojson csv_header_list_to_yojson x.header_list);
    ]

let delete_to_yojson (x : delete) =
  assoc_to_yojson
    [
      ("Key", Some (key_to_yojson x.key));
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("ConditionExpression", option_to_yojson condition_expression_to_yojson x.condition_expression);
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
      ( "ExpressionAttributeValues",
        option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values );
      ( "ReturnValuesOnConditionCheckFailure",
        option_to_yojson return_values_on_condition_check_failure_to_yojson
          x.return_values_on_condition_check_failure );
    ]

let delete_backup_output_to_yojson (x : delete_backup_output) =
  assoc_to_yojson
    [ ("BackupDescription", option_to_yojson backup_description_to_yojson x.backup_description) ]

let delete_backup_input_to_yojson (x : delete_backup_input) =
  assoc_to_yojson [ ("BackupArn", Some (backup_arn_to_yojson x.backup_arn)) ]

let delete_global_secondary_index_action_to_yojson (x : delete_global_secondary_index_action) =
  assoc_to_yojson [ ("IndexName", Some (index_name_to_yojson x.index_name)) ]

let delete_global_table_witness_group_member_action_to_yojson
    (x : delete_global_table_witness_group_member_action) =
  assoc_to_yojson [ ("RegionName", Some (region_name_to_yojson x.region_name)) ]

let transaction_conflict_exception_to_yojson (x : transaction_conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_item_output_to_yojson (x : delete_item_output) =
  assoc_to_yojson
    [
      ("Attributes", option_to_yojson attribute_map_to_yojson x.attributes);
      ("ConsumedCapacity", option_to_yojson consumed_capacity_to_yojson x.consumed_capacity);
      ( "ItemCollectionMetrics",
        option_to_yojson item_collection_metrics_to_yojson x.item_collection_metrics );
    ]

let return_value_to_yojson (x : return_value) =
  match x with
  | NONE -> `String "NONE"
  | ALL_OLD -> `String "ALL_OLD"
  | UPDATED_OLD -> `String "UPDATED_OLD"
  | ALL_NEW -> `String "ALL_NEW"
  | UPDATED_NEW -> `String "UPDATED_NEW"

let expected_attribute_value_to_yojson (x : expected_attribute_value) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson attribute_value_to_yojson x.value);
      ("Exists", option_to_yojson boolean_object_to_yojson x.exists);
      ("ComparisonOperator", option_to_yojson comparison_operator_to_yojson x.comparison_operator);
      ("AttributeValueList", option_to_yojson attribute_value_list_to_yojson x.attribute_value_list);
    ]

let expected_attribute_map_to_yojson tree =
  map_to_yojson attribute_name_to_yojson expected_attribute_value_to_yojson tree

let delete_item_input_to_yojson (x : delete_item_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("Key", Some (key_to_yojson x.key));
      ("Expected", option_to_yojson expected_attribute_map_to_yojson x.expected);
      ("ConditionalOperator", option_to_yojson conditional_operator_to_yojson x.conditional_operator);
      ("ReturnValues", option_to_yojson return_value_to_yojson x.return_values);
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
      ( "ReturnItemCollectionMetrics",
        option_to_yojson return_item_collection_metrics_to_yojson x.return_item_collection_metrics
      );
      ("ConditionExpression", option_to_yojson condition_expression_to_yojson x.condition_expression);
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
      ( "ExpressionAttributeValues",
        option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values );
      ( "ReturnValuesOnConditionCheckFailure",
        option_to_yojson return_values_on_condition_check_failure_to_yojson
          x.return_values_on_condition_check_failure );
    ]

let delete_replica_action_to_yojson (x : delete_replica_action) =
  assoc_to_yojson [ ("RegionName", Some (region_name_to_yojson x.region_name)) ]

let delete_replication_group_member_action_to_yojson (x : delete_replication_group_member_action) =
  assoc_to_yojson [ ("RegionName", Some (region_name_to_yojson x.region_name)) ]

let policy_not_found_exception_to_yojson (x : policy_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let policy_revision_id_to_yojson = string_to_yojson

let delete_resource_policy_output_to_yojson (x : delete_resource_policy_output) =
  assoc_to_yojson [ ("RevisionId", option_to_yojson policy_revision_id_to_yojson x.revision_id) ]

let resource_arn_string_to_yojson = string_to_yojson

let delete_resource_policy_input_to_yojson (x : delete_resource_policy_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_string_to_yojson x.resource_arn));
      ("ExpectedRevisionId", option_to_yojson policy_revision_id_to_yojson x.expected_revision_id);
    ]

let delete_table_output_to_yojson (x : delete_table_output) =
  assoc_to_yojson
    [ ("TableDescription", option_to_yojson table_description_to_yojson x.table_description) ]

let delete_table_input_to_yojson (x : delete_table_input) =
  assoc_to_yojson [ ("TableName", Some (table_arn_to_yojson x.table_name)) ]

let describe_backup_output_to_yojson (x : describe_backup_output) =
  assoc_to_yojson
    [ ("BackupDescription", option_to_yojson backup_description_to_yojson x.backup_description) ]

let describe_backup_input_to_yojson (x : describe_backup_input) =
  assoc_to_yojson [ ("BackupArn", Some (backup_arn_to_yojson x.backup_arn)) ]

let describe_continuous_backups_output_to_yojson (x : describe_continuous_backups_output) =
  assoc_to_yojson
    [
      ( "ContinuousBackupsDescription",
        option_to_yojson continuous_backups_description_to_yojson x.continuous_backups_description
      );
    ]

let describe_continuous_backups_input_to_yojson (x : describe_continuous_backups_input) =
  assoc_to_yojson [ ("TableName", Some (table_arn_to_yojson x.table_name)) ]

let exception_description_to_yojson = string_to_yojson
let exception_name_to_yojson = string_to_yojson

let failure_exception_to_yojson (x : failure_exception) =
  assoc_to_yojson
    [
      ("ExceptionName", option_to_yojson exception_name_to_yojson x.exception_name);
      ( "ExceptionDescription",
        option_to_yojson exception_description_to_yojson x.exception_description );
    ]

let last_update_date_time_to_yojson = timestamp_epoch_seconds_to_yojson

let describe_contributor_insights_output_to_yojson (x : describe_contributor_insights_output) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ( "ContributorInsightsRuleList",
        option_to_yojson contributor_insights_rule_list_to_yojson x.contributor_insights_rule_list
      );
      ( "ContributorInsightsStatus",
        option_to_yojson contributor_insights_status_to_yojson x.contributor_insights_status );
      ( "LastUpdateDateTime",
        option_to_yojson last_update_date_time_to_yojson x.last_update_date_time );
      ("FailureException", option_to_yojson failure_exception_to_yojson x.failure_exception);
      ( "ContributorInsightsMode",
        option_to_yojson contributor_insights_mode_to_yojson x.contributor_insights_mode );
    ]

let describe_contributor_insights_input_to_yojson (x : describe_contributor_insights_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
    ]

let long_to_yojson = long_to_yojson

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("Address", Some (string__to_yojson x.address));
      ("CachePeriodInMinutes", Some (long_to_yojson x.cache_period_in_minutes));
    ]

let endpoints_to_yojson tree = list_to_yojson endpoint_to_yojson tree

let describe_endpoints_response_to_yojson (x : describe_endpoints_response) =
  assoc_to_yojson [ ("Endpoints", Some (endpoints_to_yojson x.endpoints)) ]

let describe_endpoints_request_to_yojson = unit_to_yojson

let export_not_found_exception_to_yojson (x : export_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let export_view_type_to_yojson (x : export_view_type) =
  match x with
  | NEW_IMAGE -> `String "NEW_IMAGE"
  | NEW_AND_OLD_IMAGES -> `String "NEW_AND_OLD_IMAGES"

let export_to_time_to_yojson = timestamp_epoch_seconds_to_yojson
let export_from_time_to_yojson = timestamp_epoch_seconds_to_yojson

let incremental_export_specification_to_yojson (x : incremental_export_specification) =
  assoc_to_yojson
    [
      ("ExportFromTime", option_to_yojson export_from_time_to_yojson x.export_from_time);
      ("ExportToTime", option_to_yojson export_to_time_to_yojson x.export_to_time);
      ("ExportViewType", option_to_yojson export_view_type_to_yojson x.export_view_type);
    ]

let export_type_to_yojson (x : export_type) =
  match x with
  | FULL_EXPORT -> `String "FULL_EXPORT"
  | INCREMENTAL_EXPORT -> `String "INCREMENTAL_EXPORT"

let export_format_to_yojson (x : export_format) =
  match x with DYNAMODB_JSON -> `String "DYNAMODB_JSON" | ION -> `String "ION"

let failure_message_to_yojson = string_to_yojson
let failure_code_to_yojson = string_to_yojson
let s3_sse_kms_key_id_to_yojson = string_to_yojson

let s3_sse_algorithm_to_yojson (x : s3_sse_algorithm) =
  match x with AES256 -> `String "AES256" | KMS -> `String "KMS"

let s3_prefix_to_yojson = string_to_yojson
let s3_bucket_owner_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson
let export_time_to_yojson = timestamp_epoch_seconds_to_yojson
let export_manifest_to_yojson = string_to_yojson
let export_end_time_to_yojson = timestamp_epoch_seconds_to_yojson
let export_start_time_to_yojson = timestamp_epoch_seconds_to_yojson

let export_status_to_yojson (x : export_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let export_arn_to_yojson = string_to_yojson

let export_description_to_yojson (x : export_description) =
  assoc_to_yojson
    [
      ("ExportArn", option_to_yojson export_arn_to_yojson x.export_arn);
      ("ExportStatus", option_to_yojson export_status_to_yojson x.export_status);
      ("StartTime", option_to_yojson export_start_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson export_end_time_to_yojson x.end_time);
      ("ExportManifest", option_to_yojson export_manifest_to_yojson x.export_manifest);
      ("TableArn", option_to_yojson table_arn_to_yojson x.table_arn);
      ("TableId", option_to_yojson table_id_to_yojson x.table_id);
      ("ExportTime", option_to_yojson export_time_to_yojson x.export_time);
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
      ("S3Bucket", option_to_yojson s3_bucket_to_yojson x.s3_bucket);
      ("S3BucketOwner", option_to_yojson s3_bucket_owner_to_yojson x.s3_bucket_owner);
      ("S3Prefix", option_to_yojson s3_prefix_to_yojson x.s3_prefix);
      ("S3SseAlgorithm", option_to_yojson s3_sse_algorithm_to_yojson x.s3_sse_algorithm);
      ("S3SseKmsKeyId", option_to_yojson s3_sse_kms_key_id_to_yojson x.s3_sse_kms_key_id);
      ("FailureCode", option_to_yojson failure_code_to_yojson x.failure_code);
      ("FailureMessage", option_to_yojson failure_message_to_yojson x.failure_message);
      ("ExportFormat", option_to_yojson export_format_to_yojson x.export_format);
      ("BilledSizeBytes", option_to_yojson billed_size_bytes_to_yojson x.billed_size_bytes);
      ("ItemCount", option_to_yojson item_count_to_yojson x.item_count);
      ("ExportType", option_to_yojson export_type_to_yojson x.export_type);
      ( "IncrementalExportSpecification",
        option_to_yojson incremental_export_specification_to_yojson
          x.incremental_export_specification );
    ]

let describe_export_output_to_yojson (x : describe_export_output) =
  assoc_to_yojson
    [ ("ExportDescription", option_to_yojson export_description_to_yojson x.export_description) ]

let describe_export_input_to_yojson (x : describe_export_input) =
  assoc_to_yojson [ ("ExportArn", Some (export_arn_to_yojson x.export_arn)) ]

let global_table_not_found_exception_to_yojson (x : global_table_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let describe_global_table_output_to_yojson (x : describe_global_table_output) =
  assoc_to_yojson
    [
      ( "GlobalTableDescription",
        option_to_yojson global_table_description_to_yojson x.global_table_description );
    ]

let describe_global_table_input_to_yojson (x : describe_global_table_input) =
  assoc_to_yojson [ ("GlobalTableName", Some (table_name_to_yojson x.global_table_name)) ]

let replica_global_secondary_index_settings_description_to_yojson
    (x : replica_global_secondary_index_settings_description) =
  assoc_to_yojson
    [
      ("IndexName", Some (index_name_to_yojson x.index_name));
      ("IndexStatus", option_to_yojson index_status_to_yojson x.index_status);
      ( "ProvisionedReadCapacityUnits",
        option_to_yojson positive_long_object_to_yojson x.provisioned_read_capacity_units );
      ( "ProvisionedReadCapacityAutoScalingSettings",
        option_to_yojson auto_scaling_settings_description_to_yojson
          x.provisioned_read_capacity_auto_scaling_settings );
      ( "ProvisionedWriteCapacityUnits",
        option_to_yojson positive_long_object_to_yojson x.provisioned_write_capacity_units );
      ( "ProvisionedWriteCapacityAutoScalingSettings",
        option_to_yojson auto_scaling_settings_description_to_yojson
          x.provisioned_write_capacity_auto_scaling_settings );
    ]

let replica_global_secondary_index_settings_description_list_to_yojson tree =
  list_to_yojson replica_global_secondary_index_settings_description_to_yojson tree

let replica_settings_description_to_yojson (x : replica_settings_description) =
  assoc_to_yojson
    [
      ("RegionName", Some (region_name_to_yojson x.region_name));
      ("ReplicaStatus", option_to_yojson replica_status_to_yojson x.replica_status);
      ( "ReplicaBillingModeSummary",
        option_to_yojson billing_mode_summary_to_yojson x.replica_billing_mode_summary );
      ( "ReplicaProvisionedReadCapacityUnits",
        option_to_yojson non_negative_long_object_to_yojson
          x.replica_provisioned_read_capacity_units );
      ( "ReplicaProvisionedReadCapacityAutoScalingSettings",
        option_to_yojson auto_scaling_settings_description_to_yojson
          x.replica_provisioned_read_capacity_auto_scaling_settings );
      ( "ReplicaProvisionedWriteCapacityUnits",
        option_to_yojson non_negative_long_object_to_yojson
          x.replica_provisioned_write_capacity_units );
      ( "ReplicaProvisionedWriteCapacityAutoScalingSettings",
        option_to_yojson auto_scaling_settings_description_to_yojson
          x.replica_provisioned_write_capacity_auto_scaling_settings );
      ( "ReplicaGlobalSecondaryIndexSettings",
        option_to_yojson replica_global_secondary_index_settings_description_list_to_yojson
          x.replica_global_secondary_index_settings );
      ( "ReplicaTableClassSummary",
        option_to_yojson table_class_summary_to_yojson x.replica_table_class_summary );
    ]

let replica_settings_description_list_to_yojson tree =
  list_to_yojson replica_settings_description_to_yojson tree

let describe_global_table_settings_output_to_yojson (x : describe_global_table_settings_output) =
  assoc_to_yojson
    [
      ("GlobalTableName", option_to_yojson table_name_to_yojson x.global_table_name);
      ( "ReplicaSettings",
        option_to_yojson replica_settings_description_list_to_yojson x.replica_settings );
    ]

let describe_global_table_settings_input_to_yojson (x : describe_global_table_settings_input) =
  assoc_to_yojson [ ("GlobalTableName", Some (table_name_to_yojson x.global_table_name)) ]

let import_not_found_exception_to_yojson (x : import_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let imported_item_count_to_yojson = long_to_yojson
let processed_item_count_to_yojson = long_to_yojson
let import_end_time_to_yojson = timestamp_epoch_seconds_to_yojson
let import_start_time_to_yojson = timestamp_epoch_seconds_to_yojson

let table_creation_parameters_to_yojson (x : table_creation_parameters) =
  assoc_to_yojson
    [
      ("TableName", Some (table_name_to_yojson x.table_name));
      ("AttributeDefinitions", Some (attribute_definitions_to_yojson x.attribute_definitions));
      ("KeySchema", Some (key_schema_to_yojson x.key_schema));
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
      ( "ProvisionedThroughput",
        option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput );
      ("OnDemandThroughput", option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput);
      ("SSESpecification", option_to_yojson sse_specification_to_yojson x.sse_specification);
      ( "GlobalSecondaryIndexes",
        option_to_yojson global_secondary_index_list_to_yojson x.global_secondary_indexes );
    ]

let input_compression_type_to_yojson (x : input_compression_type) =
  match x with GZIP -> `String "GZIP" | ZSTD -> `String "ZSTD" | NONE -> `String "NONE"

let input_format_options_to_yojson (x : input_format_options) =
  assoc_to_yojson [ ("Csv", option_to_yojson csv_options_to_yojson x.csv) ]

let input_format_to_yojson (x : input_format) =
  match x with
  | DYNAMODB_JSON -> `String "DYNAMODB_JSON"
  | ION -> `String "ION"
  | CSV -> `String "CSV"

let error_count_to_yojson = long_to_yojson

let s3_bucket_source_to_yojson (x : s3_bucket_source) =
  assoc_to_yojson
    [
      ("S3BucketOwner", option_to_yojson s3_bucket_owner_to_yojson x.s3_bucket_owner);
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("S3KeyPrefix", option_to_yojson s3_prefix_to_yojson x.s3_key_prefix);
    ]

let import_status_to_yojson (x : import_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | CANCELLING -> `String "CANCELLING"
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"

let import_arn_to_yojson = string_to_yojson

let import_table_description_to_yojson (x : import_table_description) =
  assoc_to_yojson
    [
      ("ImportArn", option_to_yojson import_arn_to_yojson x.import_arn);
      ("ImportStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("TableArn", option_to_yojson table_arn_to_yojson x.table_arn);
      ("TableId", option_to_yojson table_id_to_yojson x.table_id);
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
      ("S3BucketSource", option_to_yojson s3_bucket_source_to_yojson x.s3_bucket_source);
      ("ErrorCount", option_to_yojson error_count_to_yojson x.error_count);
      ( "CloudWatchLogGroupArn",
        option_to_yojson cloud_watch_log_group_arn_to_yojson x.cloud_watch_log_group_arn );
      ("InputFormat", option_to_yojson input_format_to_yojson x.input_format);
      ("InputFormatOptions", option_to_yojson input_format_options_to_yojson x.input_format_options);
      ( "InputCompressionType",
        option_to_yojson input_compression_type_to_yojson x.input_compression_type );
      ( "TableCreationParameters",
        option_to_yojson table_creation_parameters_to_yojson x.table_creation_parameters );
      ("StartTime", option_to_yojson import_start_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson import_end_time_to_yojson x.end_time);
      ("ProcessedSizeBytes", option_to_yojson long_object_to_yojson x.processed_size_bytes);
      ("ProcessedItemCount", option_to_yojson processed_item_count_to_yojson x.processed_item_count);
      ("ImportedItemCount", option_to_yojson imported_item_count_to_yojson x.imported_item_count);
      ("FailureCode", option_to_yojson failure_code_to_yojson x.failure_code);
      ("FailureMessage", option_to_yojson failure_message_to_yojson x.failure_message);
    ]

let describe_import_output_to_yojson (x : describe_import_output) =
  assoc_to_yojson
    [
      ( "ImportTableDescription",
        Some (import_table_description_to_yojson x.import_table_description) );
    ]

let describe_import_input_to_yojson (x : describe_import_input) =
  assoc_to_yojson [ ("ImportArn", Some (import_arn_to_yojson x.import_arn)) ]

let destination_status_to_yojson (x : destination_status) =
  match x with
  | ENABLING -> `String "ENABLING"
  | ACTIVE -> `String "ACTIVE"
  | DISABLING -> `String "DISABLING"
  | DISABLED -> `String "DISABLED"
  | ENABLE_FAILED -> `String "ENABLE_FAILED"
  | UPDATING -> `String "UPDATING"

let kinesis_data_stream_destination_to_yojson (x : kinesis_data_stream_destination) =
  assoc_to_yojson
    [
      ("StreamArn", option_to_yojson stream_arn_to_yojson x.stream_arn);
      ("DestinationStatus", option_to_yojson destination_status_to_yojson x.destination_status);
      ( "DestinationStatusDescription",
        option_to_yojson string__to_yojson x.destination_status_description );
      ( "ApproximateCreationDateTimePrecision",
        option_to_yojson approximate_creation_date_time_precision_to_yojson
          x.approximate_creation_date_time_precision );
    ]

let kinesis_data_stream_destinations_to_yojson tree =
  list_to_yojson kinesis_data_stream_destination_to_yojson tree

let describe_kinesis_streaming_destination_output_to_yojson
    (x : describe_kinesis_streaming_destination_output) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ( "KinesisDataStreamDestinations",
        option_to_yojson kinesis_data_stream_destinations_to_yojson
          x.kinesis_data_stream_destinations );
    ]

let describe_kinesis_streaming_destination_input_to_yojson
    (x : describe_kinesis_streaming_destination_input) =
  assoc_to_yojson [ ("TableName", Some (table_arn_to_yojson x.table_name)) ]

let describe_limits_output_to_yojson (x : describe_limits_output) =
  assoc_to_yojson
    [
      ( "AccountMaxReadCapacityUnits",
        option_to_yojson positive_long_object_to_yojson x.account_max_read_capacity_units );
      ( "AccountMaxWriteCapacityUnits",
        option_to_yojson positive_long_object_to_yojson x.account_max_write_capacity_units );
      ( "TableMaxReadCapacityUnits",
        option_to_yojson positive_long_object_to_yojson x.table_max_read_capacity_units );
      ( "TableMaxWriteCapacityUnits",
        option_to_yojson positive_long_object_to_yojson x.table_max_write_capacity_units );
    ]

let describe_limits_input_to_yojson = unit_to_yojson

let describe_table_output_to_yojson (x : describe_table_output) =
  assoc_to_yojson [ ("Table", option_to_yojson table_description_to_yojson x.table) ]

let describe_table_input_to_yojson (x : describe_table_input) =
  assoc_to_yojson [ ("TableName", Some (table_arn_to_yojson x.table_name)) ]

let replica_global_secondary_index_auto_scaling_description_to_yojson
    (x : replica_global_secondary_index_auto_scaling_description) =
  assoc_to_yojson
    [
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ("IndexStatus", option_to_yojson index_status_to_yojson x.index_status);
      ( "ProvisionedReadCapacityAutoScalingSettings",
        option_to_yojson auto_scaling_settings_description_to_yojson
          x.provisioned_read_capacity_auto_scaling_settings );
      ( "ProvisionedWriteCapacityAutoScalingSettings",
        option_to_yojson auto_scaling_settings_description_to_yojson
          x.provisioned_write_capacity_auto_scaling_settings );
    ]

let replica_global_secondary_index_auto_scaling_description_list_to_yojson tree =
  list_to_yojson replica_global_secondary_index_auto_scaling_description_to_yojson tree

let replica_auto_scaling_description_to_yojson (x : replica_auto_scaling_description) =
  assoc_to_yojson
    [
      ("RegionName", option_to_yojson region_name_to_yojson x.region_name);
      ( "GlobalSecondaryIndexes",
        option_to_yojson replica_global_secondary_index_auto_scaling_description_list_to_yojson
          x.global_secondary_indexes );
      ( "ReplicaProvisionedReadCapacityAutoScalingSettings",
        option_to_yojson auto_scaling_settings_description_to_yojson
          x.replica_provisioned_read_capacity_auto_scaling_settings );
      ( "ReplicaProvisionedWriteCapacityAutoScalingSettings",
        option_to_yojson auto_scaling_settings_description_to_yojson
          x.replica_provisioned_write_capacity_auto_scaling_settings );
      ("ReplicaStatus", option_to_yojson replica_status_to_yojson x.replica_status);
    ]

let replica_auto_scaling_description_list_to_yojson tree =
  list_to_yojson replica_auto_scaling_description_to_yojson tree

let table_auto_scaling_description_to_yojson (x : table_auto_scaling_description) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("TableStatus", option_to_yojson table_status_to_yojson x.table_status);
      ("Replicas", option_to_yojson replica_auto_scaling_description_list_to_yojson x.replicas);
    ]

let describe_table_replica_auto_scaling_output_to_yojson
    (x : describe_table_replica_auto_scaling_output) =
  assoc_to_yojson
    [
      ( "TableAutoScalingDescription",
        option_to_yojson table_auto_scaling_description_to_yojson x.table_auto_scaling_description
      );
    ]

let describe_table_replica_auto_scaling_input_to_yojson
    (x : describe_table_replica_auto_scaling_input) =
  assoc_to_yojson [ ("TableName", Some (table_arn_to_yojson x.table_name)) ]

let describe_time_to_live_output_to_yojson (x : describe_time_to_live_output) =
  assoc_to_yojson
    [
      ( "TimeToLiveDescription",
        option_to_yojson time_to_live_description_to_yojson x.time_to_live_description );
    ]

let describe_time_to_live_input_to_yojson (x : describe_time_to_live_input) =
  assoc_to_yojson [ ("TableName", Some (table_arn_to_yojson x.table_name)) ]

let enable_kinesis_streaming_configuration_to_yojson (x : enable_kinesis_streaming_configuration) =
  assoc_to_yojson
    [
      ( "ApproximateCreationDateTimePrecision",
        option_to_yojson approximate_creation_date_time_precision_to_yojson
          x.approximate_creation_date_time_precision );
    ]

let kinesis_streaming_destination_output_to_yojson (x : kinesis_streaming_destination_output) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("StreamArn", option_to_yojson stream_arn_to_yojson x.stream_arn);
      ("DestinationStatus", option_to_yojson destination_status_to_yojson x.destination_status);
      ( "EnableKinesisStreamingConfiguration",
        option_to_yojson enable_kinesis_streaming_configuration_to_yojson
          x.enable_kinesis_streaming_configuration );
    ]

let kinesis_streaming_destination_input_to_yojson (x : kinesis_streaming_destination_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("StreamArn", Some (stream_arn_to_yojson x.stream_arn));
      ( "EnableKinesisStreamingConfiguration",
        option_to_yojson enable_kinesis_streaming_configuration_to_yojson
          x.enable_kinesis_streaming_configuration );
    ]

let duplicate_item_exception_to_yojson (x : duplicate_item_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let time_to_live_enabled_to_yojson = bool_to_yojson

let time_to_live_specification_to_yojson (x : time_to_live_specification) =
  assoc_to_yojson
    [
      ("Enabled", Some (time_to_live_enabled_to_yojson x.enabled));
      ("AttributeName", Some (time_to_live_attribute_name_to_yojson x.attribute_name));
    ]

let update_time_to_live_output_to_yojson (x : update_time_to_live_output) =
  assoc_to_yojson
    [
      ( "TimeToLiveSpecification",
        option_to_yojson time_to_live_specification_to_yojson x.time_to_live_specification );
    ]

let update_time_to_live_input_to_yojson (x : update_time_to_live_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ( "TimeToLiveSpecification",
        Some (time_to_live_specification_to_yojson x.time_to_live_specification) );
    ]

let update_table_replica_auto_scaling_output_to_yojson
    (x : update_table_replica_auto_scaling_output) =
  assoc_to_yojson
    [
      ( "TableAutoScalingDescription",
        option_to_yojson table_auto_scaling_description_to_yojson x.table_auto_scaling_description
      );
    ]

let replica_global_secondary_index_auto_scaling_update_to_yojson
    (x : replica_global_secondary_index_auto_scaling_update) =
  assoc_to_yojson
    [
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ( "ProvisionedReadCapacityAutoScalingUpdate",
        option_to_yojson auto_scaling_settings_update_to_yojson
          x.provisioned_read_capacity_auto_scaling_update );
    ]

let replica_global_secondary_index_auto_scaling_update_list_to_yojson tree =
  list_to_yojson replica_global_secondary_index_auto_scaling_update_to_yojson tree

let replica_auto_scaling_update_to_yojson (x : replica_auto_scaling_update) =
  assoc_to_yojson
    [
      ("RegionName", Some (region_name_to_yojson x.region_name));
      ( "ReplicaGlobalSecondaryIndexUpdates",
        option_to_yojson replica_global_secondary_index_auto_scaling_update_list_to_yojson
          x.replica_global_secondary_index_updates );
      ( "ReplicaProvisionedReadCapacityAutoScalingUpdate",
        option_to_yojson auto_scaling_settings_update_to_yojson
          x.replica_provisioned_read_capacity_auto_scaling_update );
    ]

let replica_auto_scaling_update_list_to_yojson tree =
  list_to_yojson replica_auto_scaling_update_to_yojson tree

let global_secondary_index_auto_scaling_update_to_yojson
    (x : global_secondary_index_auto_scaling_update) =
  assoc_to_yojson
    [
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ( "ProvisionedWriteCapacityAutoScalingUpdate",
        option_to_yojson auto_scaling_settings_update_to_yojson
          x.provisioned_write_capacity_auto_scaling_update );
    ]

let global_secondary_index_auto_scaling_update_list_to_yojson tree =
  list_to_yojson global_secondary_index_auto_scaling_update_to_yojson tree

let update_table_replica_auto_scaling_input_to_yojson (x : update_table_replica_auto_scaling_input)
    =
  assoc_to_yojson
    [
      ( "GlobalSecondaryIndexUpdates",
        option_to_yojson global_secondary_index_auto_scaling_update_list_to_yojson
          x.global_secondary_index_updates );
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ( "ProvisionedWriteCapacityAutoScalingUpdate",
        option_to_yojson auto_scaling_settings_update_to_yojson
          x.provisioned_write_capacity_auto_scaling_update );
      ( "ReplicaUpdates",
        option_to_yojson replica_auto_scaling_update_list_to_yojson x.replica_updates );
    ]

let update_table_output_to_yojson (x : update_table_output) =
  assoc_to_yojson
    [ ("TableDescription", option_to_yojson table_description_to_yojson x.table_description) ]

let global_table_witness_group_update_to_yojson (x : global_table_witness_group_update) =
  assoc_to_yojson
    [
      ("Create", option_to_yojson create_global_table_witness_group_member_action_to_yojson x.create);
      ("Delete", option_to_yojson delete_global_table_witness_group_member_action_to_yojson x.delete);
    ]

let global_table_witness_group_update_list_to_yojson tree =
  list_to_yojson global_table_witness_group_update_to_yojson tree

let update_replication_group_member_action_to_yojson (x : update_replication_group_member_action) =
  assoc_to_yojson
    [
      ("RegionName", Some (region_name_to_yojson x.region_name));
      ("KMSMasterKeyId", option_to_yojson kms_master_key_id_to_yojson x.kms_master_key_id);
      ( "ProvisionedThroughputOverride",
        option_to_yojson provisioned_throughput_override_to_yojson x.provisioned_throughput_override
      );
      ( "OnDemandThroughputOverride",
        option_to_yojson on_demand_throughput_override_to_yojson x.on_demand_throughput_override );
      ( "GlobalSecondaryIndexes",
        option_to_yojson replica_global_secondary_index_list_to_yojson x.global_secondary_indexes );
      ("TableClassOverride", option_to_yojson table_class_to_yojson x.table_class_override);
    ]

let replication_group_update_to_yojson (x : replication_group_update) =
  assoc_to_yojson
    [
      ("Create", option_to_yojson create_replication_group_member_action_to_yojson x.create);
      ("Update", option_to_yojson update_replication_group_member_action_to_yojson x.update);
      ("Delete", option_to_yojson delete_replication_group_member_action_to_yojson x.delete);
    ]

let replication_group_update_list_to_yojson tree =
  list_to_yojson replication_group_update_to_yojson tree

let update_global_secondary_index_action_to_yojson (x : update_global_secondary_index_action) =
  assoc_to_yojson
    [
      ("IndexName", Some (index_name_to_yojson x.index_name));
      ( "ProvisionedThroughput",
        option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput );
      ("OnDemandThroughput", option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput);
      ("WarmThroughput", option_to_yojson warm_throughput_to_yojson x.warm_throughput);
    ]

let global_secondary_index_update_to_yojson (x : global_secondary_index_update) =
  assoc_to_yojson
    [
      ("Update", option_to_yojson update_global_secondary_index_action_to_yojson x.update);
      ("Create", option_to_yojson create_global_secondary_index_action_to_yojson x.create);
      ("Delete", option_to_yojson delete_global_secondary_index_action_to_yojson x.delete);
    ]

let global_secondary_index_update_list_to_yojson tree =
  list_to_yojson global_secondary_index_update_to_yojson tree

let update_table_input_to_yojson (x : update_table_input) =
  assoc_to_yojson
    [
      ( "AttributeDefinitions",
        option_to_yojson attribute_definitions_to_yojson x.attribute_definitions );
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
      ( "ProvisionedThroughput",
        option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput );
      ( "GlobalSecondaryIndexUpdates",
        option_to_yojson global_secondary_index_update_list_to_yojson
          x.global_secondary_index_updates );
      ("StreamSpecification", option_to_yojson stream_specification_to_yojson x.stream_specification);
      ("SSESpecification", option_to_yojson sse_specification_to_yojson x.sse_specification);
      ("ReplicaUpdates", option_to_yojson replication_group_update_list_to_yojson x.replica_updates);
      ("TableClass", option_to_yojson table_class_to_yojson x.table_class);
      ( "DeletionProtectionEnabled",
        option_to_yojson deletion_protection_enabled_to_yojson x.deletion_protection_enabled );
      ( "MultiRegionConsistency",
        option_to_yojson multi_region_consistency_to_yojson x.multi_region_consistency );
      ( "GlobalTableWitnessUpdates",
        option_to_yojson global_table_witness_group_update_list_to_yojson
          x.global_table_witness_updates );
      ("OnDemandThroughput", option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput);
      ("WarmThroughput", option_to_yojson warm_throughput_to_yojson x.warm_throughput);
      ( "GlobalTableSettingsReplicationMode",
        option_to_yojson global_table_settings_replication_mode_to_yojson
          x.global_table_settings_replication_mode );
    ]

let update_kinesis_streaming_configuration_to_yojson (x : update_kinesis_streaming_configuration) =
  assoc_to_yojson
    [
      ( "ApproximateCreationDateTimePrecision",
        option_to_yojson approximate_creation_date_time_precision_to_yojson
          x.approximate_creation_date_time_precision );
    ]

let update_kinesis_streaming_destination_output_to_yojson
    (x : update_kinesis_streaming_destination_output) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("StreamArn", option_to_yojson stream_arn_to_yojson x.stream_arn);
      ("DestinationStatus", option_to_yojson destination_status_to_yojson x.destination_status);
      ( "UpdateKinesisStreamingConfiguration",
        option_to_yojson update_kinesis_streaming_configuration_to_yojson
          x.update_kinesis_streaming_configuration );
    ]

let update_kinesis_streaming_destination_input_to_yojson
    (x : update_kinesis_streaming_destination_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("StreamArn", Some (stream_arn_to_yojson x.stream_arn));
      ( "UpdateKinesisStreamingConfiguration",
        option_to_yojson update_kinesis_streaming_configuration_to_yojson
          x.update_kinesis_streaming_configuration );
    ]

let update_item_output_to_yojson (x : update_item_output) =
  assoc_to_yojson
    [
      ("Attributes", option_to_yojson attribute_map_to_yojson x.attributes);
      ("ConsumedCapacity", option_to_yojson consumed_capacity_to_yojson x.consumed_capacity);
      ( "ItemCollectionMetrics",
        option_to_yojson item_collection_metrics_to_yojson x.item_collection_metrics );
    ]

let update_expression_to_yojson = string_to_yojson

let update_item_input_to_yojson (x : update_item_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("Key", Some (key_to_yojson x.key));
      ("AttributeUpdates", option_to_yojson attribute_updates_to_yojson x.attribute_updates);
      ("Expected", option_to_yojson expected_attribute_map_to_yojson x.expected);
      ("ConditionalOperator", option_to_yojson conditional_operator_to_yojson x.conditional_operator);
      ("ReturnValues", option_to_yojson return_value_to_yojson x.return_values);
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
      ( "ReturnItemCollectionMetrics",
        option_to_yojson return_item_collection_metrics_to_yojson x.return_item_collection_metrics
      );
      ("UpdateExpression", option_to_yojson update_expression_to_yojson x.update_expression);
      ("ConditionExpression", option_to_yojson condition_expression_to_yojson x.condition_expression);
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
      ( "ExpressionAttributeValues",
        option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values );
      ( "ReturnValuesOnConditionCheckFailure",
        option_to_yojson return_values_on_condition_check_failure_to_yojson
          x.return_values_on_condition_check_failure );
    ]

let replica_not_found_exception_to_yojson (x : replica_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let index_not_found_exception_to_yojson (x : index_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let update_global_table_settings_output_to_yojson (x : update_global_table_settings_output) =
  assoc_to_yojson
    [
      ("GlobalTableName", option_to_yojson table_name_to_yojson x.global_table_name);
      ( "ReplicaSettings",
        option_to_yojson replica_settings_description_list_to_yojson x.replica_settings );
    ]

let replica_global_secondary_index_settings_update_to_yojson
    (x : replica_global_secondary_index_settings_update) =
  assoc_to_yojson
    [
      ("IndexName", Some (index_name_to_yojson x.index_name));
      ( "ProvisionedReadCapacityUnits",
        option_to_yojson positive_long_object_to_yojson x.provisioned_read_capacity_units );
      ( "ProvisionedReadCapacityAutoScalingSettingsUpdate",
        option_to_yojson auto_scaling_settings_update_to_yojson
          x.provisioned_read_capacity_auto_scaling_settings_update );
    ]

let replica_global_secondary_index_settings_update_list_to_yojson tree =
  list_to_yojson replica_global_secondary_index_settings_update_to_yojson tree

let replica_settings_update_to_yojson (x : replica_settings_update) =
  assoc_to_yojson
    [
      ("RegionName", Some (region_name_to_yojson x.region_name));
      ( "ReplicaProvisionedReadCapacityUnits",
        option_to_yojson positive_long_object_to_yojson x.replica_provisioned_read_capacity_units );
      ( "ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate",
        option_to_yojson auto_scaling_settings_update_to_yojson
          x.replica_provisioned_read_capacity_auto_scaling_settings_update );
      ( "ReplicaGlobalSecondaryIndexSettingsUpdate",
        option_to_yojson replica_global_secondary_index_settings_update_list_to_yojson
          x.replica_global_secondary_index_settings_update );
      ("ReplicaTableClass", option_to_yojson table_class_to_yojson x.replica_table_class);
    ]

let replica_settings_update_list_to_yojson tree =
  list_to_yojson replica_settings_update_to_yojson tree

let global_table_global_secondary_index_settings_update_to_yojson
    (x : global_table_global_secondary_index_settings_update) =
  assoc_to_yojson
    [
      ("IndexName", Some (index_name_to_yojson x.index_name));
      ( "ProvisionedWriteCapacityUnits",
        option_to_yojson positive_long_object_to_yojson x.provisioned_write_capacity_units );
      ( "ProvisionedWriteCapacityAutoScalingSettingsUpdate",
        option_to_yojson auto_scaling_settings_update_to_yojson
          x.provisioned_write_capacity_auto_scaling_settings_update );
    ]

let global_table_global_secondary_index_settings_update_list_to_yojson tree =
  list_to_yojson global_table_global_secondary_index_settings_update_to_yojson tree

let update_global_table_settings_input_to_yojson (x : update_global_table_settings_input) =
  assoc_to_yojson
    [
      ("GlobalTableName", Some (table_name_to_yojson x.global_table_name));
      ("GlobalTableBillingMode", option_to_yojson billing_mode_to_yojson x.global_table_billing_mode);
      ( "GlobalTableProvisionedWriteCapacityUnits",
        option_to_yojson positive_long_object_to_yojson
          x.global_table_provisioned_write_capacity_units );
      ( "GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate",
        option_to_yojson auto_scaling_settings_update_to_yojson
          x.global_table_provisioned_write_capacity_auto_scaling_settings_update );
      ( "GlobalTableGlobalSecondaryIndexSettingsUpdate",
        option_to_yojson global_table_global_secondary_index_settings_update_list_to_yojson
          x.global_table_global_secondary_index_settings_update );
      ( "ReplicaSettingsUpdate",
        option_to_yojson replica_settings_update_list_to_yojson x.replica_settings_update );
    ]

let replica_already_exists_exception_to_yojson (x : replica_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let update_global_table_output_to_yojson (x : update_global_table_output) =
  assoc_to_yojson
    [
      ( "GlobalTableDescription",
        option_to_yojson global_table_description_to_yojson x.global_table_description );
    ]

let replica_update_to_yojson (x : replica_update) =
  assoc_to_yojson
    [
      ("Create", option_to_yojson create_replica_action_to_yojson x.create);
      ("Delete", option_to_yojson delete_replica_action_to_yojson x.delete);
    ]

let replica_update_list_to_yojson tree = list_to_yojson replica_update_to_yojson tree

let update_global_table_input_to_yojson (x : update_global_table_input) =
  assoc_to_yojson
    [
      ("GlobalTableName", Some (table_name_to_yojson x.global_table_name));
      ("ReplicaUpdates", Some (replica_update_list_to_yojson x.replica_updates));
    ]

let update_contributor_insights_output_to_yojson (x : update_contributor_insights_output) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ( "ContributorInsightsStatus",
        option_to_yojson contributor_insights_status_to_yojson x.contributor_insights_status );
      ( "ContributorInsightsMode",
        option_to_yojson contributor_insights_mode_to_yojson x.contributor_insights_mode );
    ]

let update_contributor_insights_input_to_yojson (x : update_contributor_insights_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ( "ContributorInsightsAction",
        Some (contributor_insights_action_to_yojson x.contributor_insights_action) );
      ( "ContributorInsightsMode",
        option_to_yojson contributor_insights_mode_to_yojson x.contributor_insights_mode );
    ]

let update_continuous_backups_output_to_yojson (x : update_continuous_backups_output) =
  assoc_to_yojson
    [
      ( "ContinuousBackupsDescription",
        option_to_yojson continuous_backups_description_to_yojson x.continuous_backups_description
      );
    ]

let point_in_time_recovery_specification_to_yojson (x : point_in_time_recovery_specification) =
  assoc_to_yojson
    [
      ( "PointInTimeRecoveryEnabled",
        Some (boolean_object_to_yojson x.point_in_time_recovery_enabled) );
      ( "RecoveryPeriodInDays",
        option_to_yojson recovery_period_in_days_to_yojson x.recovery_period_in_days );
    ]

let update_continuous_backups_input_to_yojson (x : update_continuous_backups_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ( "PointInTimeRecoverySpecification",
        Some (point_in_time_recovery_specification_to_yojson x.point_in_time_recovery_specification)
      );
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_string_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_string_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let transaction_in_progress_exception_to_yojson (x : transaction_in_progress_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let transaction_canceled_exception_to_yojson (x : transaction_canceled_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ( "CancellationReasons",
        option_to_yojson cancellation_reason_list_to_yojson x.cancellation_reasons );
    ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let transact_write_items_output_to_yojson (x : transact_write_items_output) =
  assoc_to_yojson
    [
      ("ConsumedCapacity", option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity);
      ( "ItemCollectionMetrics",
        option_to_yojson item_collection_metrics_per_table_to_yojson x.item_collection_metrics );
    ]

let update_to_yojson (x : update) =
  assoc_to_yojson
    [
      ("Key", Some (key_to_yojson x.key));
      ("UpdateExpression", Some (update_expression_to_yojson x.update_expression));
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("ConditionExpression", option_to_yojson condition_expression_to_yojson x.condition_expression);
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
      ( "ExpressionAttributeValues",
        option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values );
      ( "ReturnValuesOnConditionCheckFailure",
        option_to_yojson return_values_on_condition_check_failure_to_yojson
          x.return_values_on_condition_check_failure );
    ]

let put_to_yojson (x : put) =
  assoc_to_yojson
    [
      ("Item", Some (put_item_input_attribute_map_to_yojson x.item));
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("ConditionExpression", option_to_yojson condition_expression_to_yojson x.condition_expression);
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
      ( "ExpressionAttributeValues",
        option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values );
      ( "ReturnValuesOnConditionCheckFailure",
        option_to_yojson return_values_on_condition_check_failure_to_yojson
          x.return_values_on_condition_check_failure );
    ]

let transact_write_item_to_yojson (x : transact_write_item) =
  assoc_to_yojson
    [
      ("ConditionCheck", option_to_yojson condition_check_to_yojson x.condition_check);
      ("Put", option_to_yojson put_to_yojson x.put);
      ("Delete", option_to_yojson delete_to_yojson x.delete);
      ("Update", option_to_yojson update_to_yojson x.update);
    ]

let transact_write_item_list_to_yojson tree = list_to_yojson transact_write_item_to_yojson tree

let transact_write_items_input_to_yojson (x : transact_write_items_input) =
  assoc_to_yojson
    [
      ("TransactItems", Some (transact_write_item_list_to_yojson x.transact_items));
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
      ( "ReturnItemCollectionMetrics",
        option_to_yojson return_item_collection_metrics_to_yojson x.return_item_collection_metrics
      );
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let item_response_to_yojson (x : item_response) =
  assoc_to_yojson [ ("Item", option_to_yojson attribute_map_to_yojson x.item) ]

let item_response_list_to_yojson tree = list_to_yojson item_response_to_yojson tree

let transact_get_items_output_to_yojson (x : transact_get_items_output) =
  assoc_to_yojson
    [
      ("ConsumedCapacity", option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity);
      ("Responses", option_to_yojson item_response_list_to_yojson x.responses);
    ]

let get_to_yojson (x : get) =
  assoc_to_yojson
    [
      ("Key", Some (key_to_yojson x.key));
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ( "ProjectionExpression",
        option_to_yojson projection_expression_to_yojson x.projection_expression );
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
    ]

let transact_get_item_to_yojson (x : transact_get_item) =
  assoc_to_yojson [ ("Get", Some (get_to_yojson x.get)) ]

let transact_get_item_list_to_yojson tree = list_to_yojson transact_get_item_to_yojson tree

let transact_get_items_input_to_yojson (x : transact_get_items_input) =
  assoc_to_yojson
    [
      ("TransactItems", Some (transact_get_item_list_to_yojson x.transact_items));
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
    ]

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_string_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let integer_to_yojson = int_to_yojson

let scan_output_to_yojson (x : scan_output) =
  assoc_to_yojson
    [
      ("Items", option_to_yojson item_list_to_yojson x.items);
      ("Count", option_to_yojson integer_to_yojson x.count);
      ("ScannedCount", option_to_yojson integer_to_yojson x.scanned_count);
      ("LastEvaluatedKey", option_to_yojson key_to_yojson x.last_evaluated_key);
      ("ConsumedCapacity", option_to_yojson consumed_capacity_to_yojson x.consumed_capacity);
    ]

let scan_segment_to_yojson = int_to_yojson
let scan_total_segments_to_yojson = int_to_yojson

let filter_condition_map_to_yojson tree =
  map_to_yojson attribute_name_to_yojson condition_to_yojson tree

let select_to_yojson (x : select) =
  match x with
  | ALL_ATTRIBUTES -> `String "ALL_ATTRIBUTES"
  | ALL_PROJECTED_ATTRIBUTES -> `String "ALL_PROJECTED_ATTRIBUTES"
  | SPECIFIC_ATTRIBUTES -> `String "SPECIFIC_ATTRIBUTES"
  | COUNT -> `String "COUNT"

let positive_integer_object_to_yojson = int_to_yojson

let scan_input_to_yojson (x : scan_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ("AttributesToGet", option_to_yojson attribute_name_list_to_yojson x.attributes_to_get);
      ("Limit", option_to_yojson positive_integer_object_to_yojson x.limit);
      ("Select", option_to_yojson select_to_yojson x.select);
      ("ScanFilter", option_to_yojson filter_condition_map_to_yojson x.scan_filter);
      ("ConditionalOperator", option_to_yojson conditional_operator_to_yojson x.conditional_operator);
      ("ExclusiveStartKey", option_to_yojson key_to_yojson x.exclusive_start_key);
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
      ("TotalSegments", option_to_yojson scan_total_segments_to_yojson x.total_segments);
      ("Segment", option_to_yojson scan_segment_to_yojson x.segment);
      ( "ProjectionExpression",
        option_to_yojson projection_expression_to_yojson x.projection_expression );
      ("FilterExpression", option_to_yojson condition_expression_to_yojson x.filter_expression);
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
      ( "ExpressionAttributeValues",
        option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values );
      ("ConsistentRead", option_to_yojson consistent_read_to_yojson x.consistent_read);
    ]

let table_already_exists_exception_to_yojson (x : table_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let point_in_time_recovery_unavailable_exception_to_yojson
    (x : point_in_time_recovery_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_restore_time_exception_to_yojson (x : invalid_restore_time_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let restore_table_to_point_in_time_output_to_yojson (x : restore_table_to_point_in_time_output) =
  assoc_to_yojson
    [ ("TableDescription", option_to_yojson table_description_to_yojson x.table_description) ]

let restore_table_to_point_in_time_input_to_yojson (x : restore_table_to_point_in_time_input) =
  assoc_to_yojson
    [
      ("SourceTableArn", option_to_yojson table_arn_to_yojson x.source_table_arn);
      ("SourceTableName", option_to_yojson table_name_to_yojson x.source_table_name);
      ("TargetTableName", Some (table_name_to_yojson x.target_table_name));
      ( "UseLatestRestorableTime",
        option_to_yojson boolean_object_to_yojson x.use_latest_restorable_time );
      ("RestoreDateTime", option_to_yojson date_to_yojson x.restore_date_time);
      ("BillingModeOverride", option_to_yojson billing_mode_to_yojson x.billing_mode_override);
      ( "GlobalSecondaryIndexOverride",
        option_to_yojson global_secondary_index_list_to_yojson x.global_secondary_index_override );
      ( "LocalSecondaryIndexOverride",
        option_to_yojson local_secondary_index_list_to_yojson x.local_secondary_index_override );
      ( "ProvisionedThroughputOverride",
        option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput_override );
      ( "OnDemandThroughputOverride",
        option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput_override );
      ( "SSESpecificationOverride",
        option_to_yojson sse_specification_to_yojson x.sse_specification_override );
    ]

let restore_table_from_backup_output_to_yojson (x : restore_table_from_backup_output) =
  assoc_to_yojson
    [ ("TableDescription", option_to_yojson table_description_to_yojson x.table_description) ]

let restore_table_from_backup_input_to_yojson (x : restore_table_from_backup_input) =
  assoc_to_yojson
    [
      ("TargetTableName", Some (table_name_to_yojson x.target_table_name));
      ("BackupArn", Some (backup_arn_to_yojson x.backup_arn));
      ("BillingModeOverride", option_to_yojson billing_mode_to_yojson x.billing_mode_override);
      ( "GlobalSecondaryIndexOverride",
        option_to_yojson global_secondary_index_list_to_yojson x.global_secondary_index_override );
      ( "LocalSecondaryIndexOverride",
        option_to_yojson local_secondary_index_list_to_yojson x.local_secondary_index_override );
      ( "ProvisionedThroughputOverride",
        option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput_override );
      ( "OnDemandThroughputOverride",
        option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput_override );
      ( "SSESpecificationOverride",
        option_to_yojson sse_specification_to_yojson x.sse_specification_override );
    ]

let query_output_to_yojson (x : query_output) =
  assoc_to_yojson
    [
      ("Items", option_to_yojson item_list_to_yojson x.items);
      ("Count", option_to_yojson integer_to_yojson x.count);
      ("ScannedCount", option_to_yojson integer_to_yojson x.scanned_count);
      ("LastEvaluatedKey", option_to_yojson key_to_yojson x.last_evaluated_key);
      ("ConsumedCapacity", option_to_yojson consumed_capacity_to_yojson x.consumed_capacity);
    ]

let key_expression_to_yojson = string_to_yojson
let key_conditions_to_yojson tree = map_to_yojson attribute_name_to_yojson condition_to_yojson tree

let query_input_to_yojson (x : query_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("IndexName", option_to_yojson index_name_to_yojson x.index_name);
      ("Select", option_to_yojson select_to_yojson x.select);
      ("AttributesToGet", option_to_yojson attribute_name_list_to_yojson x.attributes_to_get);
      ("Limit", option_to_yojson positive_integer_object_to_yojson x.limit);
      ("ConsistentRead", option_to_yojson consistent_read_to_yojson x.consistent_read);
      ("KeyConditions", option_to_yojson key_conditions_to_yojson x.key_conditions);
      ("QueryFilter", option_to_yojson filter_condition_map_to_yojson x.query_filter);
      ("ConditionalOperator", option_to_yojson conditional_operator_to_yojson x.conditional_operator);
      ("ScanIndexForward", option_to_yojson boolean_object_to_yojson x.scan_index_forward);
      ("ExclusiveStartKey", option_to_yojson key_to_yojson x.exclusive_start_key);
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
      ( "ProjectionExpression",
        option_to_yojson projection_expression_to_yojson x.projection_expression );
      ("FilterExpression", option_to_yojson condition_expression_to_yojson x.filter_expression);
      ( "KeyConditionExpression",
        option_to_yojson key_expression_to_yojson x.key_condition_expression );
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
      ( "ExpressionAttributeValues",
        option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values );
    ]

let put_resource_policy_output_to_yojson (x : put_resource_policy_output) =
  assoc_to_yojson [ ("RevisionId", option_to_yojson policy_revision_id_to_yojson x.revision_id) ]

let put_resource_policy_input_to_yojson (x : put_resource_policy_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_string_to_yojson x.resource_arn));
      ("Policy", Some (resource_policy_to_yojson x.policy));
      ("ExpectedRevisionId", option_to_yojson policy_revision_id_to_yojson x.expected_revision_id);
      ( "ConfirmRemoveSelfResourceAccess",
        option_to_yojson confirm_remove_self_resource_access_to_yojson
          x.confirm_remove_self_resource_access );
    ]

let put_item_output_to_yojson (x : put_item_output) =
  assoc_to_yojson
    [
      ("Attributes", option_to_yojson attribute_map_to_yojson x.attributes);
      ("ConsumedCapacity", option_to_yojson consumed_capacity_to_yojson x.consumed_capacity);
      ( "ItemCollectionMetrics",
        option_to_yojson item_collection_metrics_to_yojson x.item_collection_metrics );
    ]

let put_item_input_to_yojson (x : put_item_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("Item", Some (put_item_input_attribute_map_to_yojson x.item));
      ("Expected", option_to_yojson expected_attribute_map_to_yojson x.expected);
      ("ReturnValues", option_to_yojson return_value_to_yojson x.return_values);
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
      ( "ReturnItemCollectionMetrics",
        option_to_yojson return_item_collection_metrics_to_yojson x.return_item_collection_metrics
      );
      ("ConditionalOperator", option_to_yojson conditional_operator_to_yojson x.conditional_operator);
      ("ConditionExpression", option_to_yojson condition_expression_to_yojson x.condition_expression);
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
      ( "ExpressionAttributeValues",
        option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values );
      ( "ReturnValuesOnConditionCheckFailure",
        option_to_yojson return_values_on_condition_check_failure_to_yojson
          x.return_values_on_condition_check_failure );
    ]

let next_token_string_to_yojson = string_to_yojson

let list_tags_of_resource_output_to_yojson (x : list_tags_of_resource_output) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
    ]

let list_tags_of_resource_input_to_yojson (x : list_tags_of_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_string_to_yojson x.resource_arn));
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
    ]

let table_name_list_to_yojson tree = list_to_yojson table_name_to_yojson tree

let list_tables_output_to_yojson (x : list_tables_output) =
  assoc_to_yojson
    [
      ("TableNames", option_to_yojson table_name_list_to_yojson x.table_names);
      ("LastEvaluatedTableName", option_to_yojson table_name_to_yojson x.last_evaluated_table_name);
    ]

let list_tables_input_limit_to_yojson = int_to_yojson

let list_tables_input_to_yojson (x : list_tables_input) =
  assoc_to_yojson
    [
      ("ExclusiveStartTableName", option_to_yojson table_name_to_yojson x.exclusive_start_table_name);
      ("Limit", option_to_yojson list_tables_input_limit_to_yojson x.limit);
    ]

let import_next_token_to_yojson = string_to_yojson

let import_summary_to_yojson (x : import_summary) =
  assoc_to_yojson
    [
      ("ImportArn", option_to_yojson import_arn_to_yojson x.import_arn);
      ("ImportStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("TableArn", option_to_yojson table_arn_to_yojson x.table_arn);
      ("S3BucketSource", option_to_yojson s3_bucket_source_to_yojson x.s3_bucket_source);
      ( "CloudWatchLogGroupArn",
        option_to_yojson cloud_watch_log_group_arn_to_yojson x.cloud_watch_log_group_arn );
      ("InputFormat", option_to_yojson input_format_to_yojson x.input_format);
      ("StartTime", option_to_yojson import_start_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson import_end_time_to_yojson x.end_time);
    ]

let import_summary_list_to_yojson tree = list_to_yojson import_summary_to_yojson tree

let list_imports_output_to_yojson (x : list_imports_output) =
  assoc_to_yojson
    [
      ("ImportSummaryList", option_to_yojson import_summary_list_to_yojson x.import_summary_list);
      ("NextToken", option_to_yojson import_next_token_to_yojson x.next_token);
    ]

let list_imports_max_limit_to_yojson = int_to_yojson

let list_imports_input_to_yojson (x : list_imports_input) =
  assoc_to_yojson
    [
      ("TableArn", option_to_yojson table_arn_to_yojson x.table_arn);
      ("PageSize", option_to_yojson list_imports_max_limit_to_yojson x.page_size);
      ("NextToken", option_to_yojson import_next_token_to_yojson x.next_token);
    ]

let global_table_to_yojson (x : global_table) =
  assoc_to_yojson
    [
      ("GlobalTableName", option_to_yojson table_name_to_yojson x.global_table_name);
      ("ReplicationGroup", option_to_yojson replica_list_to_yojson x.replication_group);
    ]

let global_table_list_to_yojson tree = list_to_yojson global_table_to_yojson tree

let list_global_tables_output_to_yojson (x : list_global_tables_output) =
  assoc_to_yojson
    [
      ("GlobalTables", option_to_yojson global_table_list_to_yojson x.global_tables);
      ( "LastEvaluatedGlobalTableName",
        option_to_yojson table_name_to_yojson x.last_evaluated_global_table_name );
    ]

let list_global_tables_input_to_yojson (x : list_global_tables_input) =
  assoc_to_yojson
    [
      ( "ExclusiveStartGlobalTableName",
        option_to_yojson table_name_to_yojson x.exclusive_start_global_table_name );
      ("Limit", option_to_yojson positive_integer_object_to_yojson x.limit);
      ("RegionName", option_to_yojson region_name_to_yojson x.region_name);
    ]

let export_next_token_to_yojson = string_to_yojson

let export_summary_to_yojson (x : export_summary) =
  assoc_to_yojson
    [
      ("ExportArn", option_to_yojson export_arn_to_yojson x.export_arn);
      ("ExportStatus", option_to_yojson export_status_to_yojson x.export_status);
      ("ExportType", option_to_yojson export_type_to_yojson x.export_type);
    ]

let export_summaries_to_yojson tree = list_to_yojson export_summary_to_yojson tree

let list_exports_output_to_yojson (x : list_exports_output) =
  assoc_to_yojson
    [
      ("ExportSummaries", option_to_yojson export_summaries_to_yojson x.export_summaries);
      ("NextToken", option_to_yojson export_next_token_to_yojson x.next_token);
    ]

let list_exports_max_limit_to_yojson = int_to_yojson

let list_exports_input_to_yojson (x : list_exports_input) =
  assoc_to_yojson
    [
      ("TableArn", option_to_yojson table_arn_to_yojson x.table_arn);
      ("MaxResults", option_to_yojson list_exports_max_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson export_next_token_to_yojson x.next_token);
    ]

let list_contributor_insights_output_to_yojson (x : list_contributor_insights_output) =
  assoc_to_yojson
    [
      ( "ContributorInsightsSummaries",
        option_to_yojson contributor_insights_summaries_to_yojson x.contributor_insights_summaries
      );
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
    ]

let list_contributor_insights_limit_to_yojson = int_to_yojson

let list_contributor_insights_input_to_yojson (x : list_contributor_insights_input) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_arn_to_yojson x.table_name);
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_contributor_insights_limit_to_yojson x.max_results);
    ]

let list_backups_output_to_yojson (x : list_backups_output) =
  assoc_to_yojson
    [
      ("BackupSummaries", option_to_yojson backup_summaries_to_yojson x.backup_summaries);
      ("LastEvaluatedBackupArn", option_to_yojson backup_arn_to_yojson x.last_evaluated_backup_arn);
    ]

let time_range_upper_bound_to_yojson = timestamp_epoch_seconds_to_yojson
let time_range_lower_bound_to_yojson = timestamp_epoch_seconds_to_yojson

let list_backups_input_to_yojson (x : list_backups_input) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_arn_to_yojson x.table_name);
      ("Limit", option_to_yojson backups_input_limit_to_yojson x.limit);
      ( "TimeRangeLowerBound",
        option_to_yojson time_range_lower_bound_to_yojson x.time_range_lower_bound );
      ( "TimeRangeUpperBound",
        option_to_yojson time_range_upper_bound_to_yojson x.time_range_upper_bound );
      ("ExclusiveStartBackupArn", option_to_yojson backup_arn_to_yojson x.exclusive_start_backup_arn);
      ("BackupType", option_to_yojson backup_type_filter_to_yojson x.backup_type);
    ]

let import_conflict_exception_to_yojson (x : import_conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let import_table_output_to_yojson (x : import_table_output) =
  assoc_to_yojson
    [
      ( "ImportTableDescription",
        Some (import_table_description_to_yojson x.import_table_description) );
    ]

let import_table_input_to_yojson (x : import_table_input) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("S3BucketSource", Some (s3_bucket_source_to_yojson x.s3_bucket_source));
      ("InputFormat", Some (input_format_to_yojson x.input_format));
      ("InputFormatOptions", option_to_yojson input_format_options_to_yojson x.input_format_options);
      ( "InputCompressionType",
        option_to_yojson input_compression_type_to_yojson x.input_compression_type );
      ( "TableCreationParameters",
        Some (table_creation_parameters_to_yojson x.table_creation_parameters) );
    ]

let get_resource_policy_output_to_yojson (x : get_resource_policy_output) =
  assoc_to_yojson
    [
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
      ("RevisionId", option_to_yojson policy_revision_id_to_yojson x.revision_id);
    ]

let get_resource_policy_input_to_yojson (x : get_resource_policy_input) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_string_to_yojson x.resource_arn)) ]

let get_item_output_to_yojson (x : get_item_output) =
  assoc_to_yojson
    [
      ("Item", option_to_yojson attribute_map_to_yojson x.item);
      ("ConsumedCapacity", option_to_yojson consumed_capacity_to_yojson x.consumed_capacity);
    ]

let get_item_input_to_yojson (x : get_item_input) =
  assoc_to_yojson
    [
      ("TableName", Some (table_arn_to_yojson x.table_name));
      ("Key", Some (key_to_yojson x.key));
      ("AttributesToGet", option_to_yojson attribute_name_list_to_yojson x.attributes_to_get);
      ("ConsistentRead", option_to_yojson consistent_read_to_yojson x.consistent_read);
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
      ( "ProjectionExpression",
        option_to_yojson projection_expression_to_yojson x.projection_expression );
      ( "ExpressionAttributeNames",
        option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names );
    ]

let invalid_export_time_exception_to_yojson (x : invalid_export_time_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let export_conflict_exception_to_yojson (x : export_conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let export_table_to_point_in_time_output_to_yojson (x : export_table_to_point_in_time_output) =
  assoc_to_yojson
    [ ("ExportDescription", option_to_yojson export_description_to_yojson x.export_description) ]

let export_table_to_point_in_time_input_to_yojson (x : export_table_to_point_in_time_input) =
  assoc_to_yojson
    [
      ("TableArn", Some (table_arn_to_yojson x.table_arn));
      ("ExportTime", option_to_yojson export_time_to_yojson x.export_time);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("S3BucketOwner", option_to_yojson s3_bucket_owner_to_yojson x.s3_bucket_owner);
      ("S3Prefix", option_to_yojson s3_prefix_to_yojson x.s3_prefix);
      ("S3SseAlgorithm", option_to_yojson s3_sse_algorithm_to_yojson x.s3_sse_algorithm);
      ("S3SseKmsKeyId", option_to_yojson s3_sse_kms_key_id_to_yojson x.s3_sse_kms_key_id);
      ("ExportFormat", option_to_yojson export_format_to_yojson x.export_format);
      ("ExportType", option_to_yojson export_type_to_yojson x.export_type);
      ( "IncrementalExportSpecification",
        option_to_yojson incremental_export_specification_to_yojson
          x.incremental_export_specification );
    ]

let execute_transaction_output_to_yojson (x : execute_transaction_output) =
  assoc_to_yojson
    [
      ("Responses", option_to_yojson item_response_list_to_yojson x.responses);
      ("ConsumedCapacity", option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity);
    ]

let parameterized_statement_to_yojson (x : parameterized_statement) =
  assoc_to_yojson
    [
      ("Statement", Some (parti_ql_statement_to_yojson x.statement));
      ("Parameters", option_to_yojson prepared_statement_parameters_to_yojson x.parameters);
      ( "ReturnValuesOnConditionCheckFailure",
        option_to_yojson return_values_on_condition_check_failure_to_yojson
          x.return_values_on_condition_check_failure );
    ]

let parameterized_statements_to_yojson tree = list_to_yojson parameterized_statement_to_yojson tree

let execute_transaction_input_to_yojson (x : execute_transaction_input) =
  assoc_to_yojson
    [
      ("TransactStatements", Some (parameterized_statements_to_yojson x.transact_statements));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
    ]

let parti_ql_next_token_to_yojson = string_to_yojson

let execute_statement_output_to_yojson (x : execute_statement_output) =
  assoc_to_yojson
    [
      ("Items", option_to_yojson item_list_to_yojson x.items);
      ("NextToken", option_to_yojson parti_ql_next_token_to_yojson x.next_token);
      ("ConsumedCapacity", option_to_yojson consumed_capacity_to_yojson x.consumed_capacity);
      ("LastEvaluatedKey", option_to_yojson key_to_yojson x.last_evaluated_key);
    ]

let execute_statement_input_to_yojson (x : execute_statement_input) =
  assoc_to_yojson
    [
      ("Statement", Some (parti_ql_statement_to_yojson x.statement));
      ("Parameters", option_to_yojson prepared_statement_parameters_to_yojson x.parameters);
      ("ConsistentRead", option_to_yojson consistent_read_to_yojson x.consistent_read);
      ("NextToken", option_to_yojson parti_ql_next_token_to_yojson x.next_token);
      ( "ReturnConsumedCapacity",
        option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity );
      ("Limit", option_to_yojson positive_integer_object_to_yojson x.limit);
      ( "ReturnValuesOnConditionCheckFailure",
        option_to_yojson return_values_on_condition_check_failure_to_yojson
          x.return_values_on_condition_check_failure );
    ]
