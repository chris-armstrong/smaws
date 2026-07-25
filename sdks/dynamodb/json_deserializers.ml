open Smaws_Lib.Json.DeserializeHelpers
open Types

let approximate_creation_date_time_precision_of_yojson (tree : t) path =
  ((match tree with
    | `String "MILLISECOND" -> MILLISECOND
    | `String "MICROSECOND" -> MICROSECOND
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ApproximateCreationDateTimePrecision" value)
    | _ -> raise (deserialize_wrong_type_error path "ApproximateCreationDateTimePrecision")
     : approximate_creation_date_time_precision)
    : approximate_creation_date_time_precision)

let archival_reason_of_yojson = string_of_yojson
let backup_arn_of_yojson = string_of_yojson
let date_of_yojson = timestamp_epoch_seconds_of_yojson

let archival_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archival_date_time =
       option_of_yojson (value_for_key date_of_yojson "ArchivalDateTime") _list path;
     archival_reason =
       option_of_yojson (value_for_key archival_reason_of_yojson "ArchivalReason") _list path;
     archival_backup_arn =
       option_of_yojson (value_for_key backup_arn_of_yojson "ArchivalBackupArn") _list path;
   }
    : archival_summary)

let attribute_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "ADD" -> ADD
    | `String "PUT" -> PUT
    | `String "DELETE" -> DELETE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttributeAction" value)
    | _ -> raise (deserialize_wrong_type_error path "AttributeAction")
     : attribute_action)
    : attribute_action)

let scalar_attribute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "S" -> S
    | `String "N" -> N
    | `String "B" -> B
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScalarAttributeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalarAttributeType")
     : scalar_attribute_type)
    : scalar_attribute_type)

let key_schema_attribute_name_of_yojson = string_of_yojson

let attribute_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name = value_for_key key_schema_attribute_name_of_yojson "AttributeName" _list path;
     attribute_type = value_for_key scalar_attribute_type_of_yojson "AttributeType" _list path;
   }
    : attribute_definition)

let attribute_definitions_of_yojson tree path =
  list_of_yojson attribute_definition_of_yojson tree path

let boolean_attribute_value_of_yojson = bool_of_yojson
let null_attribute_value_of_yojson = bool_of_yojson
let attribute_name_of_yojson = string_of_yojson
let binary_attribute_value_of_yojson = blob_of_yojson

let binary_set_attribute_value_of_yojson tree path =
  list_of_yojson binary_attribute_value_of_yojson tree path

let number_attribute_value_of_yojson = string_of_yojson

let number_set_attribute_value_of_yojson tree path =
  list_of_yojson number_attribute_value_of_yojson tree path

let string_attribute_value_of_yojson = string_of_yojson

let string_set_attribute_value_of_yojson tree path =
  list_of_yojson string_attribute_value_of_yojson tree path

let rec map_attribute_value_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

and list_attribute_value_of_yojson tree path = list_of_yojson attribute_value_of_yojson tree path

and attribute_value_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "S" -> S (string_attribute_value_of_yojson value_ path)
   | "N" -> N (number_attribute_value_of_yojson value_ path)
   | "B" -> B (binary_attribute_value_of_yojson value_ path)
   | "SS" -> SS (string_set_attribute_value_of_yojson value_ path)
   | "NS" -> NS (number_set_attribute_value_of_yojson value_ path)
   | "BS" -> BS (binary_set_attribute_value_of_yojson value_ path)
   | "M" -> M (map_attribute_value_of_yojson value_ path)
   | "L" -> L (list_attribute_value_of_yojson value_ path)
   | "NULL" -> NULL (null_attribute_value_of_yojson value_ path)
   | "BOOL" -> BOOL (boolean_attribute_value_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "AttributeValue" unknown)
    : attribute_value)

let attribute_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let attribute_name_list_of_yojson tree path = list_of_yojson attribute_name_of_yojson tree path

let attribute_value_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key attribute_value_of_yojson "Value") _list path;
     action = option_of_yojson (value_for_key attribute_action_of_yojson "Action") _list path;
   }
    : attribute_value_update)

let attribute_updates_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_update_of_yojson tree path

let attribute_value_list_of_yojson tree path = list_of_yojson attribute_value_of_yojson tree path
let double_object_of_yojson = double_of_yojson
let integer_object_of_yojson = int_of_yojson
let boolean_object_of_yojson = bool_of_yojson

let auto_scaling_target_tracking_scaling_policy_configuration_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_scale_in =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableScaleIn") _list path;
     scale_in_cooldown =
       option_of_yojson (value_for_key integer_object_of_yojson "ScaleInCooldown") _list path;
     scale_out_cooldown =
       option_of_yojson (value_for_key integer_object_of_yojson "ScaleOutCooldown") _list path;
     target_value = value_for_key double_object_of_yojson "TargetValue" _list path;
   }
    : auto_scaling_target_tracking_scaling_policy_configuration_description)

let auto_scaling_policy_name_of_yojson = string_of_yojson

let auto_scaling_policy_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_name =
       option_of_yojson (value_for_key auto_scaling_policy_name_of_yojson "PolicyName") _list path;
     target_tracking_scaling_policy_configuration =
       option_of_yojson
         (value_for_key
            auto_scaling_target_tracking_scaling_policy_configuration_description_of_yojson
            "TargetTrackingScalingPolicyConfiguration")
         _list path;
   }
    : auto_scaling_policy_description)

let auto_scaling_policy_description_list_of_yojson tree path =
  list_of_yojson auto_scaling_policy_description_of_yojson tree path

let auto_scaling_target_tracking_scaling_policy_configuration_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_scale_in =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableScaleIn") _list path;
     scale_in_cooldown =
       option_of_yojson (value_for_key integer_object_of_yojson "ScaleInCooldown") _list path;
     scale_out_cooldown =
       option_of_yojson (value_for_key integer_object_of_yojson "ScaleOutCooldown") _list path;
     target_value = value_for_key double_object_of_yojson "TargetValue" _list path;
   }
    : auto_scaling_target_tracking_scaling_policy_configuration_update)

let auto_scaling_policy_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_name =
       option_of_yojson (value_for_key auto_scaling_policy_name_of_yojson "PolicyName") _list path;
     target_tracking_scaling_policy_configuration =
       value_for_key auto_scaling_target_tracking_scaling_policy_configuration_update_of_yojson
         "TargetTrackingScalingPolicyConfiguration" _list path;
   }
    : auto_scaling_policy_update)

let auto_scaling_role_arn_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson
let positive_long_object_of_yojson = long_of_yojson

let auto_scaling_settings_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minimum_units =
       option_of_yojson (value_for_key positive_long_object_of_yojson "MinimumUnits") _list path;
     maximum_units =
       option_of_yojson (value_for_key positive_long_object_of_yojson "MaximumUnits") _list path;
     auto_scaling_disabled =
       option_of_yojson (value_for_key boolean_object_of_yojson "AutoScalingDisabled") _list path;
     auto_scaling_role_arn =
       option_of_yojson (value_for_key string__of_yojson "AutoScalingRoleArn") _list path;
     scaling_policies =
       option_of_yojson
         (value_for_key auto_scaling_policy_description_list_of_yojson "ScalingPolicies")
         _list path;
   }
    : auto_scaling_settings_description)

let auto_scaling_settings_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minimum_units =
       option_of_yojson (value_for_key positive_long_object_of_yojson "MinimumUnits") _list path;
     maximum_units =
       option_of_yojson (value_for_key positive_long_object_of_yojson "MaximumUnits") _list path;
     auto_scaling_disabled =
       option_of_yojson (value_for_key boolean_object_of_yojson "AutoScalingDisabled") _list path;
     auto_scaling_role_arn =
       option_of_yojson
         (value_for_key auto_scaling_role_arn_of_yojson "AutoScalingRoleArn")
         _list path;
     scaling_policy_update =
       option_of_yojson
         (value_for_key auto_scaling_policy_update_of_yojson "ScalingPolicyUpdate")
         _list path;
   }
    : auto_scaling_settings_update)

let availability_error_message_of_yojson = string_of_yojson
let backfilling_of_yojson = bool_of_yojson
let backup_creation_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let kms_master_key_arn_of_yojson = string_of_yojson

let sse_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AES256" -> AES256
    | `String "KMS" -> KMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "SSEType" value)
    | _ -> raise (deserialize_wrong_type_error path "SSEType")
     : sse_type)
    : sse_type)

let sse_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLING" -> ENABLING
    | `String "ENABLED" -> ENABLED
    | `String "DISABLING" -> DISABLING
    | `String "DISABLED" -> DISABLED
    | `String "UPDATING" -> UPDATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SSEStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SSEStatus")
     : sse_status)
    : sse_status)

let sse_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key sse_status_of_yojson "Status") _list path;
     sse_type = option_of_yojson (value_for_key sse_type_of_yojson "SSEType") _list path;
     kms_master_key_arn =
       option_of_yojson (value_for_key kms_master_key_arn_of_yojson "KMSMasterKeyArn") _list path;
     inaccessible_encryption_date_time =
       option_of_yojson (value_for_key date_of_yojson "InaccessibleEncryptionDateTime") _list path;
   }
    : sse_description)

let time_to_live_attribute_name_of_yojson = string_of_yojson

let time_to_live_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLING" -> ENABLING
    | `String "DISABLING" -> DISABLING
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TimeToLiveStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeToLiveStatus")
     : time_to_live_status)
    : time_to_live_status)

let time_to_live_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_to_live_status =
       option_of_yojson (value_for_key time_to_live_status_of_yojson "TimeToLiveStatus") _list path;
     attribute_name =
       option_of_yojson
         (value_for_key time_to_live_attribute_name_of_yojson "AttributeName")
         _list path;
   }
    : time_to_live_description)

let stream_view_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEW_IMAGE" -> NEW_IMAGE
    | `String "OLD_IMAGE" -> OLD_IMAGE
    | `String "NEW_AND_OLD_IMAGES" -> NEW_AND_OLD_IMAGES
    | `String "KEYS_ONLY" -> KEYS_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamViewType" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamViewType")
     : stream_view_type)
    : stream_view_type)

let stream_enabled_of_yojson = bool_of_yojson

let stream_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_enabled = value_for_key stream_enabled_of_yojson "StreamEnabled" _list path;
     stream_view_type =
       option_of_yojson (value_for_key stream_view_type_of_yojson "StreamViewType") _list path;
   }
    : stream_specification)

let long_object_of_yojson = long_of_yojson

let on_demand_throughput_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_read_request_units =
       option_of_yojson (value_for_key long_object_of_yojson "MaxReadRequestUnits") _list path;
     max_write_request_units =
       option_of_yojson (value_for_key long_object_of_yojson "MaxWriteRequestUnits") _list path;
   }
    : on_demand_throughput)

let provisioned_throughput_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     read_capacity_units =
       value_for_key positive_long_object_of_yojson "ReadCapacityUnits" _list path;
     write_capacity_units =
       value_for_key positive_long_object_of_yojson "WriteCapacityUnits" _list path;
   }
    : provisioned_throughput)

let non_key_attribute_name_of_yojson = string_of_yojson

let non_key_attribute_name_list_of_yojson tree path =
  list_of_yojson non_key_attribute_name_of_yojson tree path

let projection_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "KEYS_ONLY" -> KEYS_ONLY
    | `String "INCLUDE" -> INCLUDE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProjectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProjectionType")
     : projection_type)
    : projection_type)

let projection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     projection_type =
       option_of_yojson (value_for_key projection_type_of_yojson "ProjectionType") _list path;
     non_key_attributes =
       option_of_yojson
         (value_for_key non_key_attribute_name_list_of_yojson "NonKeyAttributes")
         _list path;
   }
    : projection)

let key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "HASH" -> HASH
    | `String "RANGE" -> RANGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyType")
     : key_type)
    : key_type)

let key_schema_element_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name = value_for_key key_schema_attribute_name_of_yojson "AttributeName" _list path;
     key_type = value_for_key key_type_of_yojson "KeyType" _list path;
   }
    : key_schema_element)

let key_schema_of_yojson tree path = list_of_yojson key_schema_element_of_yojson tree path
let index_name_of_yojson = string_of_yojson

let global_secondary_index_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     projection = option_of_yojson (value_for_key projection_of_yojson "Projection") _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
   }
    : global_secondary_index_info)

let global_secondary_indexes_of_yojson tree path =
  list_of_yojson global_secondary_index_info_of_yojson tree path

let local_secondary_index_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     projection = option_of_yojson (value_for_key projection_of_yojson "Projection") _list path;
   }
    : local_secondary_index_info)

let local_secondary_indexes_of_yojson tree path =
  list_of_yojson local_secondary_index_info_of_yojson tree path

let source_table_feature_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     local_secondary_indexes =
       option_of_yojson
         (value_for_key local_secondary_indexes_of_yojson "LocalSecondaryIndexes")
         _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key global_secondary_indexes_of_yojson "GlobalSecondaryIndexes")
         _list path;
     stream_description =
       option_of_yojson
         (value_for_key stream_specification_of_yojson "StreamDescription")
         _list path;
     time_to_live_description =
       option_of_yojson
         (value_for_key time_to_live_description_of_yojson "TimeToLiveDescription")
         _list path;
     sse_description =
       option_of_yojson (value_for_key sse_description_of_yojson "SSEDescription") _list path;
   }
    : source_table_feature_details)

let billing_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROVISIONED" -> PROVISIONED
    | `String "PAY_PER_REQUEST" -> PAY_PER_REQUEST
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingMode")
     : billing_mode)
    : billing_mode)

let item_count_of_yojson = long_of_yojson
let table_creation_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let table_arn_of_yojson = string_of_yojson
let table_id_of_yojson = string_of_yojson
let table_name_of_yojson = string_of_yojson

let source_table_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_name_of_yojson "TableName" _list path;
     table_id = value_for_key table_id_of_yojson "TableId" _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     table_size_bytes =
       option_of_yojson (value_for_key long_object_of_yojson "TableSizeBytes") _list path;
     key_schema = value_for_key key_schema_of_yojson "KeySchema" _list path;
     table_creation_date_time =
       value_for_key table_creation_date_time_of_yojson "TableCreationDateTime" _list path;
     provisioned_throughput =
       value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput" _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     item_count = option_of_yojson (value_for_key item_count_of_yojson "ItemCount") _list path;
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
   }
    : source_table_details)

let backup_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "USER" -> USER
    | `String "SYSTEM" -> SYSTEM
    | `String "AWS_BACKUP" -> AWS_BACKUP
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackupType" value)
    | _ -> raise (deserialize_wrong_type_error path "BackupType")
     : backup_type)
    : backup_type)

let backup_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "DELETED" -> DELETED
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackupStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BackupStatus")
     : backup_status)
    : backup_status)

let backup_size_bytes_of_yojson = long_of_yojson
let backup_name_of_yojson = string_of_yojson

let backup_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_arn = value_for_key backup_arn_of_yojson "BackupArn" _list path;
     backup_name = value_for_key backup_name_of_yojson "BackupName" _list path;
     backup_size_bytes =
       option_of_yojson (value_for_key backup_size_bytes_of_yojson "BackupSizeBytes") _list path;
     backup_status = value_for_key backup_status_of_yojson "BackupStatus" _list path;
     backup_type = value_for_key backup_type_of_yojson "BackupType" _list path;
     backup_creation_date_time =
       value_for_key backup_creation_date_time_of_yojson "BackupCreationDateTime" _list path;
     backup_expiry_date_time =
       option_of_yojson (value_for_key date_of_yojson "BackupExpiryDateTime") _list path;
   }
    : backup_details)

let backup_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_details =
       option_of_yojson (value_for_key backup_details_of_yojson "BackupDetails") _list path;
     source_table_details =
       option_of_yojson
         (value_for_key source_table_details_of_yojson "SourceTableDetails")
         _list path;
     source_table_feature_details =
       option_of_yojson
         (value_for_key source_table_feature_details_of_yojson "SourceTableFeatureDetails")
         _list path;
   }
    : backup_description)

let error_message_of_yojson = string_of_yojson

let backup_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : backup_in_use_exception)

let backup_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : backup_not_found_exception)

let backup_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     table_id = option_of_yojson (value_for_key table_id_of_yojson "TableId") _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     backup_arn = option_of_yojson (value_for_key backup_arn_of_yojson "BackupArn") _list path;
     backup_name = option_of_yojson (value_for_key backup_name_of_yojson "BackupName") _list path;
     backup_creation_date_time =
       option_of_yojson
         (value_for_key backup_creation_date_time_of_yojson "BackupCreationDateTime")
         _list path;
     backup_expiry_date_time =
       option_of_yojson (value_for_key date_of_yojson "BackupExpiryDateTime") _list path;
     backup_status =
       option_of_yojson (value_for_key backup_status_of_yojson "BackupStatus") _list path;
     backup_type = option_of_yojson (value_for_key backup_type_of_yojson "BackupType") _list path;
     backup_size_bytes =
       option_of_yojson (value_for_key backup_size_bytes_of_yojson "BackupSizeBytes") _list path;
   }
    : backup_summary)

let backup_summaries_of_yojson tree path = list_of_yojson backup_summary_of_yojson tree path

let backup_type_filter_of_yojson (tree : t) path =
  ((match tree with
    | `String "USER" -> USER
    | `String "SYSTEM" -> SYSTEM
    | `String "AWS_BACKUP" -> AWS_BACKUP
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackupTypeFilter" value)
    | _ -> raise (deserialize_wrong_type_error path "BackupTypeFilter")
     : backup_type_filter)
    : backup_type_filter)

let backups_input_limit_of_yojson = int_of_yojson
let resource_of_yojson = string_of_yojson
let reason_of_yojson = string_of_yojson

let throttling_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key reason_of_yojson "reason") _list path;
     resource = option_of_yojson (value_for_key resource_of_yojson "resource") _list path;
   }
    : throttling_reason)

let throttling_reason_list_of_yojson tree path =
  list_of_yojson throttling_reason_of_yojson tree path

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key availability_error_message_of_yojson "message") _list path;
     throttling_reasons =
       option_of_yojson
         (value_for_key throttling_reason_list_of_yojson "throttlingReasons")
         _list path;
   }
    : throttling_exception)

let request_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     throttling_reasons =
       option_of_yojson
         (value_for_key throttling_reason_list_of_yojson "ThrottlingReasons")
         _list path;
   }
    : request_limit_exceeded)

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_server_error)

let consumed_capacity_units_of_yojson = double_of_yojson

let capacity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     read_capacity_units =
       option_of_yojson
         (value_for_key consumed_capacity_units_of_yojson "ReadCapacityUnits")
         _list path;
     write_capacity_units =
       option_of_yojson
         (value_for_key consumed_capacity_units_of_yojson "WriteCapacityUnits")
         _list path;
     capacity_units =
       option_of_yojson (value_for_key consumed_capacity_units_of_yojson "CapacityUnits") _list path;
   }
    : capacity)

let secondary_indexes_capacity_map_of_yojson tree path =
  map_of_yojson index_name_of_yojson capacity_of_yojson tree path

let consumed_capacity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_arn_of_yojson "TableName") _list path;
     capacity_units =
       option_of_yojson (value_for_key consumed_capacity_units_of_yojson "CapacityUnits") _list path;
     read_capacity_units =
       option_of_yojson
         (value_for_key consumed_capacity_units_of_yojson "ReadCapacityUnits")
         _list path;
     write_capacity_units =
       option_of_yojson
         (value_for_key consumed_capacity_units_of_yojson "WriteCapacityUnits")
         _list path;
     table = option_of_yojson (value_for_key capacity_of_yojson "Table") _list path;
     local_secondary_indexes =
       option_of_yojson
         (value_for_key secondary_indexes_capacity_map_of_yojson "LocalSecondaryIndexes")
         _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key secondary_indexes_capacity_map_of_yojson "GlobalSecondaryIndexes")
         _list path;
   }
    : consumed_capacity)

let consumed_capacity_multiple_of_yojson tree path =
  list_of_yojson consumed_capacity_of_yojson tree path

let batch_statement_error_code_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "ConditionalCheckFailed" -> ConditionalCheckFailed
    | `String "ItemCollectionSizeLimitExceeded" -> ItemCollectionSizeLimitExceeded
    | `String "RequestLimitExceeded" -> RequestLimitExceeded
    | `String "ValidationError" -> ValidationError
    | `String "ProvisionedThroughputExceeded" -> ProvisionedThroughputExceeded
    | `String "TransactionConflict" -> TransactionConflict
    | `String "ThrottlingError" -> ThrottlingError
    | `String "InternalServerError" -> InternalServerError
    | `String "ResourceNotFound" -> ResourceNotFound
    | `String "AccessDenied" -> AccessDenied
    | `String "DuplicateItem" -> DuplicateItem
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BatchStatementErrorCodeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchStatementErrorCodeEnum")
     : batch_statement_error_code_enum)
    : batch_statement_error_code_enum)

let batch_statement_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code =
       option_of_yojson (value_for_key batch_statement_error_code_enum_of_yojson "Code") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path;
   }
    : batch_statement_error)

let batch_statement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key batch_statement_error_of_yojson "Error") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path;
   }
    : batch_statement_response)

let parti_ql_batch_response_of_yojson tree path =
  list_of_yojson batch_statement_response_of_yojson tree path

let batch_execute_statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     responses =
       option_of_yojson (value_for_key parti_ql_batch_response_of_yojson "Responses") _list path;
     consumed_capacity =
       option_of_yojson
         (value_for_key consumed_capacity_multiple_of_yojson "ConsumedCapacity")
         _list path;
   }
    : batch_execute_statement_output)

let return_consumed_capacity_of_yojson (tree : t) path =
  ((match tree with
    | `String "INDEXES" -> INDEXES
    | `String "TOTAL" -> TOTAL
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReturnConsumedCapacity" value)
    | _ -> raise (deserialize_wrong_type_error path "ReturnConsumedCapacity")
     : return_consumed_capacity)
    : return_consumed_capacity)

let return_values_on_condition_check_failure_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL_OLD" -> ALL_OLD
    | `String "NONE" -> NONE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ReturnValuesOnConditionCheckFailure" value)
    | _ -> raise (deserialize_wrong_type_error path "ReturnValuesOnConditionCheckFailure")
     : return_values_on_condition_check_failure)
    : return_values_on_condition_check_failure)

let consistent_read_of_yojson = bool_of_yojson

let prepared_statement_parameters_of_yojson tree path =
  list_of_yojson attribute_value_of_yojson tree path

let parti_ql_statement_of_yojson = string_of_yojson

let batch_statement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statement = value_for_key parti_ql_statement_of_yojson "Statement" _list path;
     parameters =
       option_of_yojson
         (value_for_key prepared_statement_parameters_of_yojson "Parameters")
         _list path;
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
   }
    : batch_statement_request)

let parti_ql_batch_request_of_yojson tree path =
  list_of_yojson batch_statement_request_of_yojson tree path

let batch_execute_statement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statements = value_for_key parti_ql_batch_request_of_yojson "Statements" _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
   }
    : batch_execute_statement_input)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_found_exception)

let provisioned_throughput_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     throttling_reasons =
       option_of_yojson
         (value_for_key throttling_reason_list_of_yojson "ThrottlingReasons")
         _list path;
   }
    : provisioned_throughput_exceeded_exception)

let invalid_endpoint_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_endpoint_exception)

let expression_attribute_name_variable_of_yojson = string_of_yojson

let expression_attribute_name_map_of_yojson tree path =
  map_of_yojson expression_attribute_name_variable_of_yojson attribute_name_of_yojson tree path

let projection_expression_of_yojson = string_of_yojson

let key_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let key_list_of_yojson tree path = list_of_yojson key_of_yojson tree path

let keys_and_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     keys = value_for_key key_list_of_yojson "Keys" _list path;
     attributes_to_get =
       option_of_yojson (value_for_key attribute_name_list_of_yojson "AttributesToGet") _list path;
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
     projection_expression =
       option_of_yojson
         (value_for_key projection_expression_of_yojson "ProjectionExpression")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
   }
    : keys_and_attributes)

let batch_get_request_map_of_yojson tree path =
  map_of_yojson table_arn_of_yojson keys_and_attributes_of_yojson tree path

let item_list_of_yojson tree path = list_of_yojson attribute_map_of_yojson tree path

let batch_get_response_map_of_yojson tree path =
  map_of_yojson table_arn_of_yojson item_list_of_yojson tree path

let batch_get_item_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     responses =
       option_of_yojson (value_for_key batch_get_response_map_of_yojson "Responses") _list path;
     unprocessed_keys =
       option_of_yojson (value_for_key batch_get_request_map_of_yojson "UnprocessedKeys") _list path;
     consumed_capacity =
       option_of_yojson
         (value_for_key consumed_capacity_multiple_of_yojson "ConsumedCapacity")
         _list path;
   }
    : batch_get_item_output)

let batch_get_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_items = value_for_key batch_get_request_map_of_yojson "RequestItems" _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
   }
    : batch_get_item_input)

let replicated_write_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : replicated_write_conflict_exception)

let item_collection_size_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : item_collection_size_limit_exceeded_exception)

let item_collection_size_estimate_bound_of_yojson = double_of_yojson

let item_collection_size_estimate_range_of_yojson tree path =
  list_of_yojson item_collection_size_estimate_bound_of_yojson tree path

let item_collection_key_attribute_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let item_collection_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item_collection_key =
       option_of_yojson
         (value_for_key item_collection_key_attribute_map_of_yojson "ItemCollectionKey")
         _list path;
     size_estimate_range_g_b =
       option_of_yojson
         (value_for_key item_collection_size_estimate_range_of_yojson "SizeEstimateRangeGB")
         _list path;
   }
    : item_collection_metrics)

let item_collection_metrics_multiple_of_yojson tree path =
  list_of_yojson item_collection_metrics_of_yojson tree path

let item_collection_metrics_per_table_of_yojson tree path =
  map_of_yojson table_arn_of_yojson item_collection_metrics_multiple_of_yojson tree path

let delete_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key = value_for_key key_of_yojson "Key" _list path } : delete_request)

let put_item_input_attribute_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let put_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ item = value_for_key put_item_input_attribute_map_of_yojson "Item" _list path } : put_request)

let write_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     put_request = option_of_yojson (value_for_key put_request_of_yojson "PutRequest") _list path;
     delete_request =
       option_of_yojson (value_for_key delete_request_of_yojson "DeleteRequest") _list path;
   }
    : write_request)

let write_requests_of_yojson tree path = list_of_yojson write_request_of_yojson tree path

let batch_write_item_request_map_of_yojson tree path =
  map_of_yojson table_arn_of_yojson write_requests_of_yojson tree path

let batch_write_item_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unprocessed_items =
       option_of_yojson
         (value_for_key batch_write_item_request_map_of_yojson "UnprocessedItems")
         _list path;
     item_collection_metrics =
       option_of_yojson
         (value_for_key item_collection_metrics_per_table_of_yojson "ItemCollectionMetrics")
         _list path;
     consumed_capacity =
       option_of_yojson
         (value_for_key consumed_capacity_multiple_of_yojson "ConsumedCapacity")
         _list path;
   }
    : batch_write_item_output)

let return_item_collection_metrics_of_yojson (tree : t) path =
  ((match tree with
    | `String "SIZE" -> SIZE
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReturnItemCollectionMetrics" value)
    | _ -> raise (deserialize_wrong_type_error path "ReturnItemCollectionMetrics")
     : return_item_collection_metrics)
    : return_item_collection_metrics)

let batch_write_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_items = value_for_key batch_write_item_request_map_of_yojson "RequestItems" _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     return_item_collection_metrics =
       option_of_yojson
         (value_for_key return_item_collection_metrics_of_yojson "ReturnItemCollectionMetrics")
         _list path;
   }
    : batch_write_item_input)

let billed_size_bytes_of_yojson = long_of_yojson

let billing_mode_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     last_update_to_pay_per_request_date_time =
       option_of_yojson
         (value_for_key date_of_yojson "LastUpdateToPayPerRequestDateTime")
         _list path;
   }
    : billing_mode_summary)

let code_of_yojson = string_of_yojson

let cancellation_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path;
     code = option_of_yojson (value_for_key code_of_yojson "Code") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : cancellation_reason)

let cancellation_reason_list_of_yojson tree path =
  list_of_yojson cancellation_reason_of_yojson tree path

let client_request_token_of_yojson = string_of_yojson
let client_token_of_yojson = string_of_yojson
let cloud_watch_log_group_arn_of_yojson = string_of_yojson

let comparison_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQ" -> EQ
    | `String "NE" -> NE
    | `String "IN" -> IN
    | `String "LE" -> LE
    | `String "LT" -> LT
    | `String "GE" -> GE
    | `String "GT" -> GT
    | `String "BETWEEN" -> BETWEEN
    | `String "NOT_NULL" -> NOT_NULL
    | `String "NULL" -> NULL
    | `String "CONTAINS" -> CONTAINS
    | `String "NOT_CONTAINS" -> NOT_CONTAINS
    | `String "BEGINS_WITH" -> BEGINS_WITH
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")
     : comparison_operator)
    : comparison_operator)

let condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_value_list =
       option_of_yojson
         (value_for_key attribute_value_list_of_yojson "AttributeValueList")
         _list path;
     comparison_operator =
       value_for_key comparison_operator_of_yojson "ComparisonOperator" _list path;
   }
    : condition)

let expression_attribute_value_variable_of_yojson = string_of_yojson

let expression_attribute_value_map_of_yojson tree path =
  map_of_yojson expression_attribute_value_variable_of_yojson attribute_value_of_yojson tree path

let condition_expression_of_yojson = string_of_yojson

let condition_check_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key key_of_yojson "Key" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     condition_expression =
       value_for_key condition_expression_of_yojson "ConditionExpression" _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
   }
    : condition_check)

let conditional_check_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path;
   }
    : conditional_check_failed_exception)

let conditional_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "AND" -> AND
    | `String "OR" -> OR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConditionalOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ConditionalOperator")
     : conditional_operator)
    : conditional_operator)

let confirm_remove_self_resource_access_of_yojson = bool_of_yojson
let recovery_period_in_days_of_yojson = int_of_yojson

let point_in_time_recovery_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PointInTimeRecoveryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PointInTimeRecoveryStatus")
     : point_in_time_recovery_status)
    : point_in_time_recovery_status)

let point_in_time_recovery_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     point_in_time_recovery_status =
       option_of_yojson
         (value_for_key point_in_time_recovery_status_of_yojson "PointInTimeRecoveryStatus")
         _list path;
     recovery_period_in_days =
       option_of_yojson
         (value_for_key recovery_period_in_days_of_yojson "RecoveryPeriodInDays")
         _list path;
     earliest_restorable_date_time =
       option_of_yojson (value_for_key date_of_yojson "EarliestRestorableDateTime") _list path;
     latest_restorable_date_time =
       option_of_yojson (value_for_key date_of_yojson "LatestRestorableDateTime") _list path;
   }
    : point_in_time_recovery_description)

let continuous_backups_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContinuousBackupsStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContinuousBackupsStatus")
     : continuous_backups_status)
    : continuous_backups_status)

let continuous_backups_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     continuous_backups_status =
       value_for_key continuous_backups_status_of_yojson "ContinuousBackupsStatus" _list path;
     point_in_time_recovery_description =
       option_of_yojson
         (value_for_key point_in_time_recovery_description_of_yojson
            "PointInTimeRecoveryDescription")
         _list path;
   }
    : continuous_backups_description)

let continuous_backups_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : continuous_backups_unavailable_exception)

let contributor_insights_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLE" -> ENABLE
    | `String "DISABLE" -> DISABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContributorInsightsAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ContributorInsightsAction")
     : contributor_insights_action)
    : contributor_insights_action)

let contributor_insights_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCESSED_AND_THROTTLED_KEYS" -> ACCESSED_AND_THROTTLED_KEYS
    | `String "THROTTLED_KEYS" -> THROTTLED_KEYS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContributorInsightsMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ContributorInsightsMode")
     : contributor_insights_mode)
    : contributor_insights_mode)

let contributor_insights_rule_of_yojson = string_of_yojson

let contributor_insights_rule_list_of_yojson tree path =
  list_of_yojson contributor_insights_rule_of_yojson tree path

let contributor_insights_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLING" -> ENABLING
    | `String "ENABLED" -> ENABLED
    | `String "DISABLING" -> DISABLING
    | `String "DISABLED" -> DISABLED
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContributorInsightsStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContributorInsightsStatus")
     : contributor_insights_status)
    : contributor_insights_status)

let contributor_insights_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     contributor_insights_status =
       option_of_yojson
         (value_for_key contributor_insights_status_of_yojson "ContributorInsightsStatus")
         _list path;
     contributor_insights_mode =
       option_of_yojson
         (value_for_key contributor_insights_mode_of_yojson "ContributorInsightsMode")
         _list path;
   }
    : contributor_insights_summary)

let contributor_insights_summaries_of_yojson tree path =
  list_of_yojson contributor_insights_summary_of_yojson tree path

let table_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : table_not_found_exception)

let table_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : table_in_use_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let create_backup_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_details =
       option_of_yojson (value_for_key backup_details_of_yojson "BackupDetails") _list path;
   }
    : create_backup_output)

let create_backup_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     backup_name = value_for_key backup_name_of_yojson "BackupName" _list path;
   }
    : create_backup_input)

let warm_throughput_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     read_units_per_second =
       option_of_yojson (value_for_key long_object_of_yojson "ReadUnitsPerSecond") _list path;
     write_units_per_second =
       option_of_yojson (value_for_key long_object_of_yojson "WriteUnitsPerSecond") _list path;
   }
    : warm_throughput)

let create_global_secondary_index_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
     key_schema = value_for_key key_schema_of_yojson "KeySchema" _list path;
     projection = value_for_key projection_of_yojson "Projection" _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     warm_throughput =
       option_of_yojson (value_for_key warm_throughput_of_yojson "WarmThroughput") _list path;
   }
    : create_global_secondary_index_action)

let global_table_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : global_table_already_exists_exception)

let global_table_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "GlobalTableStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "GlobalTableStatus")
     : global_table_status)
    : global_table_status)

let global_table_arn_string_of_yojson = string_of_yojson

let global_table_settings_replication_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED_WITH_OVERRIDES" -> ENABLED_WITH_OVERRIDES
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GlobalTableSettingsReplicationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "GlobalTableSettingsReplicationMode")
     : global_table_settings_replication_mode)
    : global_table_settings_replication_mode)

let table_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD" -> STANDARD
    | `String "STANDARD_INFREQUENT_ACCESS" -> STANDARD_INFREQUENT_ACCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TableClass" value)
    | _ -> raise (deserialize_wrong_type_error path "TableClass")
     : table_class)
    : table_class)

let table_class_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_class = option_of_yojson (value_for_key table_class_of_yojson "TableClass") _list path;
     last_update_date_time =
       option_of_yojson (value_for_key date_of_yojson "LastUpdateDateTime") _list path;
   }
    : table_class_summary)

let index_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "IndexStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "IndexStatus")
     : index_status)
    : index_status)

let global_secondary_index_warm_throughput_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     read_units_per_second =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ReadUnitsPerSecond")
         _list path;
     write_units_per_second =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "WriteUnitsPerSecond")
         _list path;
     status = option_of_yojson (value_for_key index_status_of_yojson "Status") _list path;
   }
    : global_secondary_index_warm_throughput_description)

let on_demand_throughput_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_read_request_units =
       option_of_yojson (value_for_key long_object_of_yojson "MaxReadRequestUnits") _list path;
   }
    : on_demand_throughput_override)

let provisioned_throughput_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ReadCapacityUnits")
         _list path;
   }
    : provisioned_throughput_override)

let replica_global_secondary_index_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_override_of_yojson "ProvisionedThroughputOverride")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_override_of_yojson "OnDemandThroughputOverride")
         _list path;
     warm_throughput =
       option_of_yojson
         (value_for_key global_secondary_index_warm_throughput_description_of_yojson
            "WarmThroughput")
         _list path;
   }
    : replica_global_secondary_index_description)

let replica_global_secondary_index_description_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_description_of_yojson tree path

let table_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS" -> INACCESSIBLE_ENCRYPTION_CREDENTIALS
    | `String "ARCHIVING" -> ARCHIVING
    | `String "ARCHIVED" -> ARCHIVED
    | `String "REPLICATION_NOT_AUTHORIZED" -> REPLICATION_NOT_AUTHORIZED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TableStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TableStatus")
     : table_status)
    : table_status)

let table_warm_throughput_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     read_units_per_second =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ReadUnitsPerSecond")
         _list path;
     write_units_per_second =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "WriteUnitsPerSecond")
         _list path;
     status = option_of_yojson (value_for_key table_status_of_yojson "Status") _list path;
   }
    : table_warm_throughput_description)

let kms_master_key_id_of_yojson = string_of_yojson
let replica_status_percent_progress_of_yojson = string_of_yojson
let replica_status_description_of_yojson = string_of_yojson

let replica_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "CREATION_FAILED" -> CREATION_FAILED
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String "REGION_DISABLED" -> REGION_DISABLED
    | `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS" -> INACCESSIBLE_ENCRYPTION_CREDENTIALS
    | `String "ARCHIVING" -> ARCHIVING
    | `String "ARCHIVED" -> ARCHIVED
    | `String "REPLICATION_NOT_AUTHORIZED" -> REPLICATION_NOT_AUTHORIZED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReplicaStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplicaStatus")
     : replica_status)
    : replica_status)

let region_name_of_yojson = string_of_yojson

let replica_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
     replica_status =
       option_of_yojson (value_for_key replica_status_of_yojson "ReplicaStatus") _list path;
     replica_arn = option_of_yojson (value_for_key string__of_yojson "ReplicaArn") _list path;
     replica_status_description =
       option_of_yojson
         (value_for_key replica_status_description_of_yojson "ReplicaStatusDescription")
         _list path;
     replica_status_percent_progress =
       option_of_yojson
         (value_for_key replica_status_percent_progress_of_yojson "ReplicaStatusPercentProgress")
         _list path;
     kms_master_key_id =
       option_of_yojson (value_for_key kms_master_key_id_of_yojson "KMSMasterKeyId") _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_override_of_yojson "ProvisionedThroughputOverride")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_override_of_yojson "OnDemandThroughputOverride")
         _list path;
     warm_throughput =
       option_of_yojson
         (value_for_key table_warm_throughput_description_of_yojson "WarmThroughput")
         _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key replica_global_secondary_index_description_list_of_yojson
            "GlobalSecondaryIndexes")
         _list path;
     replica_inaccessible_date_time =
       option_of_yojson (value_for_key date_of_yojson "ReplicaInaccessibleDateTime") _list path;
     replica_table_class_summary =
       option_of_yojson
         (value_for_key table_class_summary_of_yojson "ReplicaTableClassSummary")
         _list path;
     global_table_settings_replication_mode =
       option_of_yojson
         (value_for_key global_table_settings_replication_mode_of_yojson
            "GlobalTableSettingsReplicationMode")
         _list path;
   }
    : replica_description)

let replica_description_list_of_yojson tree path =
  list_of_yojson replica_description_of_yojson tree path

let global_table_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_group =
       option_of_yojson
         (value_for_key replica_description_list_of_yojson "ReplicationGroup")
         _list path;
     global_table_arn =
       option_of_yojson
         (value_for_key global_table_arn_string_of_yojson "GlobalTableArn")
         _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationDateTime") _list path;
     global_table_status =
       option_of_yojson (value_for_key global_table_status_of_yojson "GlobalTableStatus") _list path;
     global_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "GlobalTableName") _list path;
   }
    : global_table_description)

let create_global_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_description =
       option_of_yojson
         (value_for_key global_table_description_of_yojson "GlobalTableDescription")
         _list path;
   }
    : create_global_table_output)

let replica_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path }
    : replica)

let replica_list_of_yojson tree path = list_of_yojson replica_of_yojson tree path

let create_global_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_name = value_for_key table_name_of_yojson "GlobalTableName" _list path;
     replication_group = value_for_key replica_list_of_yojson "ReplicationGroup" _list path;
   }
    : create_global_table_input)

let create_global_table_witness_group_member_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = value_for_key region_name_of_yojson "RegionName" _list path }
    : create_global_table_witness_group_member_action)

let create_replica_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = value_for_key region_name_of_yojson "RegionName" _list path }
    : create_replica_action)

let replica_global_secondary_index_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_override_of_yojson "ProvisionedThroughputOverride")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_override_of_yojson "OnDemandThroughputOverride")
         _list path;
   }
    : replica_global_secondary_index)

let replica_global_secondary_index_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_of_yojson tree path

let create_replication_group_member_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
     kms_master_key_id =
       option_of_yojson (value_for_key kms_master_key_id_of_yojson "KMSMasterKeyId") _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_override_of_yojson "ProvisionedThroughputOverride")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_override_of_yojson "OnDemandThroughputOverride")
         _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key replica_global_secondary_index_list_of_yojson "GlobalSecondaryIndexes")
         _list path;
     table_class_override =
       option_of_yojson (value_for_key table_class_of_yojson "TableClassOverride") _list path;
   }
    : create_replication_group_member_action)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_in_use_exception)

let multi_region_consistency_of_yojson (tree : t) path =
  ((match tree with
    | `String "EVENTUAL" -> EVENTUAL
    | `String "STRONG" -> STRONG
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MultiRegionConsistency" value)
    | _ -> raise (deserialize_wrong_type_error path "MultiRegionConsistency")
     : multi_region_consistency)
    : multi_region_consistency)

let deletion_protection_enabled_of_yojson = bool_of_yojson
let restore_in_progress_of_yojson = bool_of_yojson

let restore_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_backup_arn =
       option_of_yojson (value_for_key backup_arn_of_yojson "SourceBackupArn") _list path;
     source_table_arn =
       option_of_yojson (value_for_key table_arn_of_yojson "SourceTableArn") _list path;
     restore_date_time = value_for_key date_of_yojson "RestoreDateTime" _list path;
     restore_in_progress =
       value_for_key restore_in_progress_of_yojson "RestoreInProgress" _list path;
   }
    : restore_summary)

let witness_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "WitnessStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "WitnessStatus")
     : witness_status)
    : witness_status)

let global_table_witness_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
     witness_status =
       option_of_yojson (value_for_key witness_status_of_yojson "WitnessStatus") _list path;
   }
    : global_table_witness_description)

let global_table_witness_description_list_of_yojson tree path =
  list_of_yojson global_table_witness_description_of_yojson tree path

let stream_arn_of_yojson = string_of_yojson
let non_negative_long_object_of_yojson = long_of_yojson

let provisioned_throughput_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_increase_date_time =
       option_of_yojson (value_for_key date_of_yojson "LastIncreaseDateTime") _list path;
     last_decrease_date_time =
       option_of_yojson (value_for_key date_of_yojson "LastDecreaseDateTime") _list path;
     number_of_decreases_today =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "NumberOfDecreasesToday")
         _list path;
     read_capacity_units =
       option_of_yojson
         (value_for_key non_negative_long_object_of_yojson "ReadCapacityUnits")
         _list path;
     write_capacity_units =
       option_of_yojson
         (value_for_key non_negative_long_object_of_yojson "WriteCapacityUnits")
         _list path;
   }
    : provisioned_throughput_description)

let global_secondary_index_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     projection = option_of_yojson (value_for_key projection_of_yojson "Projection") _list path;
     index_status = option_of_yojson (value_for_key index_status_of_yojson "IndexStatus") _list path;
     backfilling = option_of_yojson (value_for_key backfilling_of_yojson "Backfilling") _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_description_of_yojson "ProvisionedThroughput")
         _list path;
     index_size_bytes =
       option_of_yojson (value_for_key long_object_of_yojson "IndexSizeBytes") _list path;
     item_count = option_of_yojson (value_for_key long_object_of_yojson "ItemCount") _list path;
     index_arn = option_of_yojson (value_for_key string__of_yojson "IndexArn") _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     warm_throughput =
       option_of_yojson
         (value_for_key global_secondary_index_warm_throughput_description_of_yojson
            "WarmThroughput")
         _list path;
   }
    : global_secondary_index_description)

let global_secondary_index_description_list_of_yojson tree path =
  list_of_yojson global_secondary_index_description_of_yojson tree path

let local_secondary_index_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     projection = option_of_yojson (value_for_key projection_of_yojson "Projection") _list path;
     index_size_bytes =
       option_of_yojson (value_for_key long_object_of_yojson "IndexSizeBytes") _list path;
     item_count = option_of_yojson (value_for_key long_object_of_yojson "ItemCount") _list path;
     index_arn = option_of_yojson (value_for_key string__of_yojson "IndexArn") _list path;
   }
    : local_secondary_index_description)

let local_secondary_index_description_list_of_yojson tree path =
  list_of_yojson local_secondary_index_description_of_yojson tree path

let table_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_definitions =
       option_of_yojson
         (value_for_key attribute_definitions_of_yojson "AttributeDefinitions")
         _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     table_status = option_of_yojson (value_for_key table_status_of_yojson "TableStatus") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationDateTime") _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_description_of_yojson "ProvisionedThroughput")
         _list path;
     table_size_bytes =
       option_of_yojson (value_for_key long_object_of_yojson "TableSizeBytes") _list path;
     item_count = option_of_yojson (value_for_key long_object_of_yojson "ItemCount") _list path;
     table_arn = option_of_yojson (value_for_key string__of_yojson "TableArn") _list path;
     table_id = option_of_yojson (value_for_key table_id_of_yojson "TableId") _list path;
     billing_mode_summary =
       option_of_yojson
         (value_for_key billing_mode_summary_of_yojson "BillingModeSummary")
         _list path;
     local_secondary_indexes =
       option_of_yojson
         (value_for_key local_secondary_index_description_list_of_yojson "LocalSecondaryIndexes")
         _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key global_secondary_index_description_list_of_yojson "GlobalSecondaryIndexes")
         _list path;
     stream_specification =
       option_of_yojson
         (value_for_key stream_specification_of_yojson "StreamSpecification")
         _list path;
     latest_stream_label =
       option_of_yojson (value_for_key string__of_yojson "LatestStreamLabel") _list path;
     latest_stream_arn =
       option_of_yojson (value_for_key stream_arn_of_yojson "LatestStreamArn") _list path;
     global_table_version =
       option_of_yojson (value_for_key string__of_yojson "GlobalTableVersion") _list path;
     replicas =
       option_of_yojson (value_for_key replica_description_list_of_yojson "Replicas") _list path;
     global_table_witnesses =
       option_of_yojson
         (value_for_key global_table_witness_description_list_of_yojson "GlobalTableWitnesses")
         _list path;
     global_table_settings_replication_mode =
       option_of_yojson
         (value_for_key global_table_settings_replication_mode_of_yojson
            "GlobalTableSettingsReplicationMode")
         _list path;
     restore_summary =
       option_of_yojson (value_for_key restore_summary_of_yojson "RestoreSummary") _list path;
     sse_description =
       option_of_yojson (value_for_key sse_description_of_yojson "SSEDescription") _list path;
     archival_summary =
       option_of_yojson (value_for_key archival_summary_of_yojson "ArchivalSummary") _list path;
     table_class_summary =
       option_of_yojson (value_for_key table_class_summary_of_yojson "TableClassSummary") _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key deletion_protection_enabled_of_yojson "DeletionProtectionEnabled")
         _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     warm_throughput =
       option_of_yojson
         (value_for_key table_warm_throughput_description_of_yojson "WarmThroughput")
         _list path;
     multi_region_consistency =
       option_of_yojson
         (value_for_key multi_region_consistency_of_yojson "MultiRegionConsistency")
         _list path;
   }
    : table_description)

let create_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_description =
       option_of_yojson (value_for_key table_description_of_yojson "TableDescription") _list path;
   }
    : create_table_output)

let resource_policy_of_yojson = string_of_yojson
let tag_value_string_of_yojson = string_of_yojson
let tag_key_string_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_string_of_yojson "Key" _list path;
     value = value_for_key tag_value_string_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let sse_enabled_of_yojson = bool_of_yojson

let sse_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = option_of_yojson (value_for_key sse_enabled_of_yojson "Enabled") _list path;
     sse_type = option_of_yojson (value_for_key sse_type_of_yojson "SSEType") _list path;
     kms_master_key_id =
       option_of_yojson (value_for_key kms_master_key_id_of_yojson "KMSMasterKeyId") _list path;
   }
    : sse_specification)

let global_secondary_index_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
     key_schema = value_for_key key_schema_of_yojson "KeySchema" _list path;
     projection = value_for_key projection_of_yojson "Projection" _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     warm_throughput =
       option_of_yojson (value_for_key warm_throughput_of_yojson "WarmThroughput") _list path;
   }
    : global_secondary_index)

let global_secondary_index_list_of_yojson tree path =
  list_of_yojson global_secondary_index_of_yojson tree path

let local_secondary_index_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
     key_schema = value_for_key key_schema_of_yojson "KeySchema" _list path;
     projection = value_for_key projection_of_yojson "Projection" _list path;
   }
    : local_secondary_index)

let local_secondary_index_list_of_yojson tree path =
  list_of_yojson local_secondary_index_of_yojson tree path

let create_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_definitions =
       option_of_yojson
         (value_for_key attribute_definitions_of_yojson "AttributeDefinitions")
         _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     local_secondary_indexes =
       option_of_yojson
         (value_for_key local_secondary_index_list_of_yojson "LocalSecondaryIndexes")
         _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key global_secondary_index_list_of_yojson "GlobalSecondaryIndexes")
         _list path;
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     stream_specification =
       option_of_yojson
         (value_for_key stream_specification_of_yojson "StreamSpecification")
         _list path;
     sse_specification =
       option_of_yojson (value_for_key sse_specification_of_yojson "SSESpecification") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     table_class = option_of_yojson (value_for_key table_class_of_yojson "TableClass") _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key deletion_protection_enabled_of_yojson "DeletionProtectionEnabled")
         _list path;
     warm_throughput =
       option_of_yojson (value_for_key warm_throughput_of_yojson "WarmThroughput") _list path;
     resource_policy =
       option_of_yojson (value_for_key resource_policy_of_yojson "ResourcePolicy") _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     global_table_source_arn =
       option_of_yojson (value_for_key table_arn_of_yojson "GlobalTableSourceArn") _list path;
     global_table_settings_replication_mode =
       option_of_yojson
         (value_for_key global_table_settings_replication_mode_of_yojson
            "GlobalTableSettingsReplicationMode")
         _list path;
   }
    : create_table_input)

let csv_delimiter_of_yojson = string_of_yojson
let csv_header_of_yojson = string_of_yojson
let csv_header_list_of_yojson tree path = list_of_yojson csv_header_of_yojson tree path

let csv_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delimiter = option_of_yojson (value_for_key csv_delimiter_of_yojson "Delimiter") _list path;
     header_list =
       option_of_yojson (value_for_key csv_header_list_of_yojson "HeaderList") _list path;
   }
    : csv_options)

let delete_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key key_of_yojson "Key" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
   }
    : delete)

let delete_backup_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_description =
       option_of_yojson (value_for_key backup_description_of_yojson "BackupDescription") _list path;
   }
    : delete_backup_output)

let delete_backup_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ backup_arn = value_for_key backup_arn_of_yojson "BackupArn" _list path } : delete_backup_input)

let delete_global_secondary_index_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ index_name = value_for_key index_name_of_yojson "IndexName" _list path }
    : delete_global_secondary_index_action)

let delete_global_table_witness_group_member_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = value_for_key region_name_of_yojson "RegionName" _list path }
    : delete_global_table_witness_group_member_action)

let transaction_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : transaction_conflict_exception)

let delete_item_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = option_of_yojson (value_for_key attribute_map_of_yojson "Attributes") _list path;
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
     item_collection_metrics =
       option_of_yojson
         (value_for_key item_collection_metrics_of_yojson "ItemCollectionMetrics")
         _list path;
   }
    : delete_item_output)

let return_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "ALL_OLD" -> ALL_OLD
    | `String "UPDATED_OLD" -> UPDATED_OLD
    | `String "ALL_NEW" -> ALL_NEW
    | `String "UPDATED_NEW" -> UPDATED_NEW
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReturnValue" value)
    | _ -> raise (deserialize_wrong_type_error path "ReturnValue")
     : return_value)
    : return_value)

let expected_attribute_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key attribute_value_of_yojson "Value") _list path;
     exists = option_of_yojson (value_for_key boolean_object_of_yojson "Exists") _list path;
     comparison_operator =
       option_of_yojson
         (value_for_key comparison_operator_of_yojson "ComparisonOperator")
         _list path;
     attribute_value_list =
       option_of_yojson
         (value_for_key attribute_value_list_of_yojson "AttributeValueList")
         _list path;
   }
    : expected_attribute_value)

let expected_attribute_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson expected_attribute_value_of_yojson tree path

let delete_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     key = value_for_key key_of_yojson "Key" _list path;
     expected =
       option_of_yojson (value_for_key expected_attribute_map_of_yojson "Expected") _list path;
     conditional_operator =
       option_of_yojson
         (value_for_key conditional_operator_of_yojson "ConditionalOperator")
         _list path;
     return_values =
       option_of_yojson (value_for_key return_value_of_yojson "ReturnValues") _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     return_item_collection_metrics =
       option_of_yojson
         (value_for_key return_item_collection_metrics_of_yojson "ReturnItemCollectionMetrics")
         _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
   }
    : delete_item_input)

let delete_replica_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = value_for_key region_name_of_yojson "RegionName" _list path }
    : delete_replica_action)

let delete_replication_group_member_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = value_for_key region_name_of_yojson "RegionName" _list path }
    : delete_replication_group_member_action)

let policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : policy_not_found_exception)

let policy_revision_id_of_yojson = string_of_yojson

let delete_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "RevisionId") _list path;
   }
    : delete_resource_policy_output)

let resource_arn_string_of_yojson = string_of_yojson

let delete_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
     expected_revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "ExpectedRevisionId") _list path;
   }
    : delete_resource_policy_input)

let delete_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_description =
       option_of_yojson (value_for_key table_description_of_yojson "TableDescription") _list path;
   }
    : delete_table_output)

let delete_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table_name = value_for_key table_arn_of_yojson "TableName" _list path } : delete_table_input)

let describe_backup_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_description =
       option_of_yojson (value_for_key backup_description_of_yojson "BackupDescription") _list path;
   }
    : describe_backup_output)

let describe_backup_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ backup_arn = value_for_key backup_arn_of_yojson "BackupArn" _list path }
    : describe_backup_input)

let describe_continuous_backups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     continuous_backups_description =
       option_of_yojson
         (value_for_key continuous_backups_description_of_yojson "ContinuousBackupsDescription")
         _list path;
   }
    : describe_continuous_backups_output)

let describe_continuous_backups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table_name = value_for_key table_arn_of_yojson "TableName" _list path }
    : describe_continuous_backups_input)

let exception_description_of_yojson = string_of_yojson
let exception_name_of_yojson = string_of_yojson

let failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exception_name =
       option_of_yojson (value_for_key exception_name_of_yojson "ExceptionName") _list path;
     exception_description =
       option_of_yojson
         (value_for_key exception_description_of_yojson "ExceptionDescription")
         _list path;
   }
    : failure_exception)

let last_update_date_time_of_yojson = timestamp_epoch_seconds_of_yojson

let describe_contributor_insights_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     contributor_insights_rule_list =
       option_of_yojson
         (value_for_key contributor_insights_rule_list_of_yojson "ContributorInsightsRuleList")
         _list path;
     contributor_insights_status =
       option_of_yojson
         (value_for_key contributor_insights_status_of_yojson "ContributorInsightsStatus")
         _list path;
     last_update_date_time =
       option_of_yojson
         (value_for_key last_update_date_time_of_yojson "LastUpdateDateTime")
         _list path;
     failure_exception =
       option_of_yojson (value_for_key failure_exception_of_yojson "FailureException") _list path;
     contributor_insights_mode =
       option_of_yojson
         (value_for_key contributor_insights_mode_of_yojson "ContributorInsightsMode")
         _list path;
   }
    : describe_contributor_insights_output)

let describe_contributor_insights_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
   }
    : describe_contributor_insights_input)

let long_of_yojson = long_of_yojson

let endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address = value_for_key string__of_yojson "Address" _list path;
     cache_period_in_minutes = value_for_key long_of_yojson "CachePeriodInMinutes" _list path;
   }
    : endpoint)

let endpoints_of_yojson tree path = list_of_yojson endpoint_of_yojson tree path

let describe_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoints = value_for_key endpoints_of_yojson "Endpoints" _list path }
    : describe_endpoints_response)

let describe_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let export_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : export_not_found_exception)

let export_view_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEW_IMAGE" -> NEW_IMAGE
    | `String "NEW_AND_OLD_IMAGES" -> NEW_AND_OLD_IMAGES
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportViewType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportViewType")
     : export_view_type)
    : export_view_type)

let export_to_time_of_yojson = timestamp_epoch_seconds_of_yojson
let export_from_time_of_yojson = timestamp_epoch_seconds_of_yojson

let incremental_export_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_from_time =
       option_of_yojson (value_for_key export_from_time_of_yojson "ExportFromTime") _list path;
     export_to_time =
       option_of_yojson (value_for_key export_to_time_of_yojson "ExportToTime") _list path;
     export_view_type =
       option_of_yojson (value_for_key export_view_type_of_yojson "ExportViewType") _list path;
   }
    : incremental_export_specification)

let export_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FULL_EXPORT" -> FULL_EXPORT
    | `String "INCREMENTAL_EXPORT" -> INCREMENTAL_EXPORT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportType")
     : export_type)
    : export_type)

let export_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "DYNAMODB_JSON" -> DYNAMODB_JSON
    | `String "ION" -> ION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportFormat")
     : export_format)
    : export_format)

let failure_message_of_yojson = string_of_yojson
let failure_code_of_yojson = string_of_yojson
let s3_sse_kms_key_id_of_yojson = string_of_yojson

let s3_sse_algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "AES256" -> AES256
    | `String "KMS" -> KMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "S3SseAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "S3SseAlgorithm")
     : s3_sse_algorithm)
    : s3_sse_algorithm)

let s3_prefix_of_yojson = string_of_yojson
let s3_bucket_owner_of_yojson = string_of_yojson
let s3_bucket_of_yojson = string_of_yojson
let export_time_of_yojson = timestamp_epoch_seconds_of_yojson
let export_manifest_of_yojson = string_of_yojson
let export_end_time_of_yojson = timestamp_epoch_seconds_of_yojson
let export_start_time_of_yojson = timestamp_epoch_seconds_of_yojson

let export_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportStatus")
     : export_status)
    : export_status)

let export_arn_of_yojson = string_of_yojson

let export_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_arn = option_of_yojson (value_for_key export_arn_of_yojson "ExportArn") _list path;
     export_status =
       option_of_yojson (value_for_key export_status_of_yojson "ExportStatus") _list path;
     start_time =
       option_of_yojson (value_for_key export_start_time_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key export_end_time_of_yojson "EndTime") _list path;
     export_manifest =
       option_of_yojson (value_for_key export_manifest_of_yojson "ExportManifest") _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     table_id = option_of_yojson (value_for_key table_id_of_yojson "TableId") _list path;
     export_time = option_of_yojson (value_for_key export_time_of_yojson "ExportTime") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     s3_bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "S3Bucket") _list path;
     s3_bucket_owner =
       option_of_yojson (value_for_key s3_bucket_owner_of_yojson "S3BucketOwner") _list path;
     s3_prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "S3Prefix") _list path;
     s3_sse_algorithm =
       option_of_yojson (value_for_key s3_sse_algorithm_of_yojson "S3SseAlgorithm") _list path;
     s3_sse_kms_key_id =
       option_of_yojson (value_for_key s3_sse_kms_key_id_of_yojson "S3SseKmsKeyId") _list path;
     failure_code = option_of_yojson (value_for_key failure_code_of_yojson "FailureCode") _list path;
     failure_message =
       option_of_yojson (value_for_key failure_message_of_yojson "FailureMessage") _list path;
     export_format =
       option_of_yojson (value_for_key export_format_of_yojson "ExportFormat") _list path;
     billed_size_bytes =
       option_of_yojson (value_for_key billed_size_bytes_of_yojson "BilledSizeBytes") _list path;
     item_count = option_of_yojson (value_for_key item_count_of_yojson "ItemCount") _list path;
     export_type = option_of_yojson (value_for_key export_type_of_yojson "ExportType") _list path;
     incremental_export_specification =
       option_of_yojson
         (value_for_key incremental_export_specification_of_yojson "IncrementalExportSpecification")
         _list path;
   }
    : export_description)

let describe_export_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_description =
       option_of_yojson (value_for_key export_description_of_yojson "ExportDescription") _list path;
   }
    : describe_export_output)

let describe_export_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ export_arn = value_for_key export_arn_of_yojson "ExportArn" _list path }
    : describe_export_input)

let global_table_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : global_table_not_found_exception)

let describe_global_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_description =
       option_of_yojson
         (value_for_key global_table_description_of_yojson "GlobalTableDescription")
         _list path;
   }
    : describe_global_table_output)

let describe_global_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ global_table_name = value_for_key table_name_of_yojson "GlobalTableName" _list path }
    : describe_global_table_input)

let replica_global_secondary_index_settings_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
     index_status = option_of_yojson (value_for_key index_status_of_yojson "IndexStatus") _list path;
     provisioned_read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ProvisionedReadCapacityUnits")
         _list path;
     provisioned_read_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ProvisionedReadCapacityAutoScalingSettings")
         _list path;
     provisioned_write_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ProvisionedWriteCapacityUnits")
         _list path;
     provisioned_write_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ProvisionedWriteCapacityAutoScalingSettings")
         _list path;
   }
    : replica_global_secondary_index_settings_description)

let replica_global_secondary_index_settings_description_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_settings_description_of_yojson tree path

let replica_settings_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
     replica_status =
       option_of_yojson (value_for_key replica_status_of_yojson "ReplicaStatus") _list path;
     replica_billing_mode_summary =
       option_of_yojson
         (value_for_key billing_mode_summary_of_yojson "ReplicaBillingModeSummary")
         _list path;
     replica_provisioned_read_capacity_units =
       option_of_yojson
         (value_for_key non_negative_long_object_of_yojson "ReplicaProvisionedReadCapacityUnits")
         _list path;
     replica_provisioned_read_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ReplicaProvisionedReadCapacityAutoScalingSettings")
         _list path;
     replica_provisioned_write_capacity_units =
       option_of_yojson
         (value_for_key non_negative_long_object_of_yojson "ReplicaProvisionedWriteCapacityUnits")
         _list path;
     replica_provisioned_write_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ReplicaProvisionedWriteCapacityAutoScalingSettings")
         _list path;
     replica_global_secondary_index_settings =
       option_of_yojson
         (value_for_key replica_global_secondary_index_settings_description_list_of_yojson
            "ReplicaGlobalSecondaryIndexSettings")
         _list path;
     replica_table_class_summary =
       option_of_yojson
         (value_for_key table_class_summary_of_yojson "ReplicaTableClassSummary")
         _list path;
   }
    : replica_settings_description)

let replica_settings_description_list_of_yojson tree path =
  list_of_yojson replica_settings_description_of_yojson tree path

let describe_global_table_settings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "GlobalTableName") _list path;
     replica_settings =
       option_of_yojson
         (value_for_key replica_settings_description_list_of_yojson "ReplicaSettings")
         _list path;
   }
    : describe_global_table_settings_output)

let describe_global_table_settings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ global_table_name = value_for_key table_name_of_yojson "GlobalTableName" _list path }
    : describe_global_table_settings_input)

let import_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : import_not_found_exception)

let imported_item_count_of_yojson = long_of_yojson
let processed_item_count_of_yojson = long_of_yojson
let import_end_time_of_yojson = timestamp_epoch_seconds_of_yojson
let import_start_time_of_yojson = timestamp_epoch_seconds_of_yojson

let table_creation_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_name_of_yojson "TableName" _list path;
     attribute_definitions =
       value_for_key attribute_definitions_of_yojson "AttributeDefinitions" _list path;
     key_schema = value_for_key key_schema_of_yojson "KeySchema" _list path;
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     sse_specification =
       option_of_yojson (value_for_key sse_specification_of_yojson "SSESpecification") _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key global_secondary_index_list_of_yojson "GlobalSecondaryIndexes")
         _list path;
   }
    : table_creation_parameters)

let input_compression_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GZIP" -> GZIP
    | `String "ZSTD" -> ZSTD
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InputCompressionType" value)
    | _ -> raise (deserialize_wrong_type_error path "InputCompressionType")
     : input_compression_type)
    : input_compression_type)

let input_format_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ csv = option_of_yojson (value_for_key csv_options_of_yojson "Csv") _list path }
    : input_format_options)

let input_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "DYNAMODB_JSON" -> DYNAMODB_JSON
    | `String "ION" -> ION
    | `String "CSV" -> CSV
    | `String value -> raise (deserialize_unknown_enum_value_error path "InputFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "InputFormat")
     : input_format)
    : input_format)

let error_count_of_yojson = long_of_yojson

let s3_bucket_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket_owner =
       option_of_yojson (value_for_key s3_bucket_owner_of_yojson "S3BucketOwner") _list path;
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
     s3_key_prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "S3KeyPrefix") _list path;
   }
    : s3_bucket_source)

let import_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETED" -> COMPLETED
    | `String "CANCELLING" -> CANCELLING
    | `String "CANCELLED" -> CANCELLED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportStatus")
     : import_status)
    : import_status)

let import_arn_of_yojson = string_of_yojson

let import_table_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_arn = option_of_yojson (value_for_key import_arn_of_yojson "ImportArn") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "ImportStatus") _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     table_id = option_of_yojson (value_for_key table_id_of_yojson "TableId") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     s3_bucket_source =
       option_of_yojson (value_for_key s3_bucket_source_of_yojson "S3BucketSource") _list path;
     error_count = option_of_yojson (value_for_key error_count_of_yojson "ErrorCount") _list path;
     cloud_watch_log_group_arn =
       option_of_yojson
         (value_for_key cloud_watch_log_group_arn_of_yojson "CloudWatchLogGroupArn")
         _list path;
     input_format = option_of_yojson (value_for_key input_format_of_yojson "InputFormat") _list path;
     input_format_options =
       option_of_yojson
         (value_for_key input_format_options_of_yojson "InputFormatOptions")
         _list path;
     input_compression_type =
       option_of_yojson
         (value_for_key input_compression_type_of_yojson "InputCompressionType")
         _list path;
     table_creation_parameters =
       option_of_yojson
         (value_for_key table_creation_parameters_of_yojson "TableCreationParameters")
         _list path;
     start_time =
       option_of_yojson (value_for_key import_start_time_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key import_end_time_of_yojson "EndTime") _list path;
     processed_size_bytes =
       option_of_yojson (value_for_key long_object_of_yojson "ProcessedSizeBytes") _list path;
     processed_item_count =
       option_of_yojson
         (value_for_key processed_item_count_of_yojson "ProcessedItemCount")
         _list path;
     imported_item_count =
       option_of_yojson (value_for_key imported_item_count_of_yojson "ImportedItemCount") _list path;
     failure_code = option_of_yojson (value_for_key failure_code_of_yojson "FailureCode") _list path;
     failure_message =
       option_of_yojson (value_for_key failure_message_of_yojson "FailureMessage") _list path;
   }
    : import_table_description)

let describe_import_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_table_description =
       value_for_key import_table_description_of_yojson "ImportTableDescription" _list path;
   }
    : describe_import_output)

let describe_import_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ import_arn = value_for_key import_arn_of_yojson "ImportArn" _list path }
    : describe_import_input)

let destination_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLING" -> ENABLING
    | `String "ACTIVE" -> ACTIVE
    | `String "DISABLING" -> DISABLING
    | `String "DISABLED" -> DISABLED
    | `String "ENABLE_FAILED" -> ENABLE_FAILED
    | `String "UPDATING" -> UPDATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "DestinationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DestinationStatus")
     : destination_status)
    : destination_status)

let kinesis_data_stream_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_arn = option_of_yojson (value_for_key stream_arn_of_yojson "StreamArn") _list path;
     destination_status =
       option_of_yojson (value_for_key destination_status_of_yojson "DestinationStatus") _list path;
     destination_status_description =
       option_of_yojson (value_for_key string__of_yojson "DestinationStatusDescription") _list path;
     approximate_creation_date_time_precision =
       option_of_yojson
         (value_for_key approximate_creation_date_time_precision_of_yojson
            "ApproximateCreationDateTimePrecision")
         _list path;
   }
    : kinesis_data_stream_destination)

let kinesis_data_stream_destinations_of_yojson tree path =
  list_of_yojson kinesis_data_stream_destination_of_yojson tree path

let describe_kinesis_streaming_destination_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     kinesis_data_stream_destinations =
       option_of_yojson
         (value_for_key kinesis_data_stream_destinations_of_yojson "KinesisDataStreamDestinations")
         _list path;
   }
    : describe_kinesis_streaming_destination_output)

let describe_kinesis_streaming_destination_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table_name = value_for_key table_arn_of_yojson "TableName" _list path }
    : describe_kinesis_streaming_destination_input)

let describe_limits_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_max_read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "AccountMaxReadCapacityUnits")
         _list path;
     account_max_write_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "AccountMaxWriteCapacityUnits")
         _list path;
     table_max_read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "TableMaxReadCapacityUnits")
         _list path;
     table_max_write_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "TableMaxWriteCapacityUnits")
         _list path;
   }
    : describe_limits_output)

let describe_limits_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let describe_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table = option_of_yojson (value_for_key table_description_of_yojson "Table") _list path }
    : describe_table_output)

let describe_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table_name = value_for_key table_arn_of_yojson "TableName" _list path } : describe_table_input)

let replica_global_secondary_index_auto_scaling_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     index_status = option_of_yojson (value_for_key index_status_of_yojson "IndexStatus") _list path;
     provisioned_read_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ProvisionedReadCapacityAutoScalingSettings")
         _list path;
     provisioned_write_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ProvisionedWriteCapacityAutoScalingSettings")
         _list path;
   }
    : replica_global_secondary_index_auto_scaling_description)

let replica_global_secondary_index_auto_scaling_description_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_auto_scaling_description_of_yojson tree path

let replica_auto_scaling_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key replica_global_secondary_index_auto_scaling_description_list_of_yojson
            "GlobalSecondaryIndexes")
         _list path;
     replica_provisioned_read_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ReplicaProvisionedReadCapacityAutoScalingSettings")
         _list path;
     replica_provisioned_write_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ReplicaProvisionedWriteCapacityAutoScalingSettings")
         _list path;
     replica_status =
       option_of_yojson (value_for_key replica_status_of_yojson "ReplicaStatus") _list path;
   }
    : replica_auto_scaling_description)

let replica_auto_scaling_description_list_of_yojson tree path =
  list_of_yojson replica_auto_scaling_description_of_yojson tree path

let table_auto_scaling_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     table_status = option_of_yojson (value_for_key table_status_of_yojson "TableStatus") _list path;
     replicas =
       option_of_yojson
         (value_for_key replica_auto_scaling_description_list_of_yojson "Replicas")
         _list path;
   }
    : table_auto_scaling_description)

let describe_table_replica_auto_scaling_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_auto_scaling_description =
       option_of_yojson
         (value_for_key table_auto_scaling_description_of_yojson "TableAutoScalingDescription")
         _list path;
   }
    : describe_table_replica_auto_scaling_output)

let describe_table_replica_auto_scaling_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table_name = value_for_key table_arn_of_yojson "TableName" _list path }
    : describe_table_replica_auto_scaling_input)

let describe_time_to_live_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_to_live_description =
       option_of_yojson
         (value_for_key time_to_live_description_of_yojson "TimeToLiveDescription")
         _list path;
   }
    : describe_time_to_live_output)

let describe_time_to_live_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table_name = value_for_key table_arn_of_yojson "TableName" _list path }
    : describe_time_to_live_input)

let enable_kinesis_streaming_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approximate_creation_date_time_precision =
       option_of_yojson
         (value_for_key approximate_creation_date_time_precision_of_yojson
            "ApproximateCreationDateTimePrecision")
         _list path;
   }
    : enable_kinesis_streaming_configuration)

let kinesis_streaming_destination_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     stream_arn = option_of_yojson (value_for_key stream_arn_of_yojson "StreamArn") _list path;
     destination_status =
       option_of_yojson (value_for_key destination_status_of_yojson "DestinationStatus") _list path;
     enable_kinesis_streaming_configuration =
       option_of_yojson
         (value_for_key enable_kinesis_streaming_configuration_of_yojson
            "EnableKinesisStreamingConfiguration")
         _list path;
   }
    : kinesis_streaming_destination_output)

let kinesis_streaming_destination_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     stream_arn = value_for_key stream_arn_of_yojson "StreamArn" _list path;
     enable_kinesis_streaming_configuration =
       option_of_yojson
         (value_for_key enable_kinesis_streaming_configuration_of_yojson
            "EnableKinesisStreamingConfiguration")
         _list path;
   }
    : kinesis_streaming_destination_input)

let duplicate_item_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : duplicate_item_exception)

let time_to_live_enabled_of_yojson = bool_of_yojson

let time_to_live_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = value_for_key time_to_live_enabled_of_yojson "Enabled" _list path;
     attribute_name = value_for_key time_to_live_attribute_name_of_yojson "AttributeName" _list path;
   }
    : time_to_live_specification)

let update_time_to_live_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_to_live_specification =
       option_of_yojson
         (value_for_key time_to_live_specification_of_yojson "TimeToLiveSpecification")
         _list path;
   }
    : update_time_to_live_output)

let update_time_to_live_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     time_to_live_specification =
       value_for_key time_to_live_specification_of_yojson "TimeToLiveSpecification" _list path;
   }
    : update_time_to_live_input)

let update_table_replica_auto_scaling_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_auto_scaling_description =
       option_of_yojson
         (value_for_key table_auto_scaling_description_of_yojson "TableAutoScalingDescription")
         _list path;
   }
    : update_table_replica_auto_scaling_output)

let replica_global_secondary_index_auto_scaling_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     provisioned_read_capacity_auto_scaling_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ProvisionedReadCapacityAutoScalingUpdate")
         _list path;
   }
    : replica_global_secondary_index_auto_scaling_update)

let replica_global_secondary_index_auto_scaling_update_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_auto_scaling_update_of_yojson tree path

let replica_auto_scaling_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
     replica_global_secondary_index_updates =
       option_of_yojson
         (value_for_key replica_global_secondary_index_auto_scaling_update_list_of_yojson
            "ReplicaGlobalSecondaryIndexUpdates")
         _list path;
     replica_provisioned_read_capacity_auto_scaling_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ReplicaProvisionedReadCapacityAutoScalingUpdate")
         _list path;
   }
    : replica_auto_scaling_update)

let replica_auto_scaling_update_list_of_yojson tree path =
  list_of_yojson replica_auto_scaling_update_of_yojson tree path

let global_secondary_index_auto_scaling_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     provisioned_write_capacity_auto_scaling_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ProvisionedWriteCapacityAutoScalingUpdate")
         _list path;
   }
    : global_secondary_index_auto_scaling_update)

let global_secondary_index_auto_scaling_update_list_of_yojson tree path =
  list_of_yojson global_secondary_index_auto_scaling_update_of_yojson tree path

let update_table_replica_auto_scaling_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_secondary_index_updates =
       option_of_yojson
         (value_for_key global_secondary_index_auto_scaling_update_list_of_yojson
            "GlobalSecondaryIndexUpdates")
         _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     provisioned_write_capacity_auto_scaling_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ProvisionedWriteCapacityAutoScalingUpdate")
         _list path;
     replica_updates =
       option_of_yojson
         (value_for_key replica_auto_scaling_update_list_of_yojson "ReplicaUpdates")
         _list path;
   }
    : update_table_replica_auto_scaling_input)

let update_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_description =
       option_of_yojson (value_for_key table_description_of_yojson "TableDescription") _list path;
   }
    : update_table_output)

let global_table_witness_group_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create =
       option_of_yojson
         (value_for_key create_global_table_witness_group_member_action_of_yojson "Create")
         _list path;
     delete =
       option_of_yojson
         (value_for_key delete_global_table_witness_group_member_action_of_yojson "Delete")
         _list path;
   }
    : global_table_witness_group_update)

let global_table_witness_group_update_list_of_yojson tree path =
  list_of_yojson global_table_witness_group_update_of_yojson tree path

let update_replication_group_member_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
     kms_master_key_id =
       option_of_yojson (value_for_key kms_master_key_id_of_yojson "KMSMasterKeyId") _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_override_of_yojson "ProvisionedThroughputOverride")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_override_of_yojson "OnDemandThroughputOverride")
         _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key replica_global_secondary_index_list_of_yojson "GlobalSecondaryIndexes")
         _list path;
     table_class_override =
       option_of_yojson (value_for_key table_class_of_yojson "TableClassOverride") _list path;
   }
    : update_replication_group_member_action)

let replication_group_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create =
       option_of_yojson
         (value_for_key create_replication_group_member_action_of_yojson "Create")
         _list path;
     update =
       option_of_yojson
         (value_for_key update_replication_group_member_action_of_yojson "Update")
         _list path;
     delete =
       option_of_yojson
         (value_for_key delete_replication_group_member_action_of_yojson "Delete")
         _list path;
   }
    : replication_group_update)

let replication_group_update_list_of_yojson tree path =
  list_of_yojson replication_group_update_of_yojson tree path

let update_global_secondary_index_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     warm_throughput =
       option_of_yojson (value_for_key warm_throughput_of_yojson "WarmThroughput") _list path;
   }
    : update_global_secondary_index_action)

let global_secondary_index_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update =
       option_of_yojson
         (value_for_key update_global_secondary_index_action_of_yojson "Update")
         _list path;
     create =
       option_of_yojson
         (value_for_key create_global_secondary_index_action_of_yojson "Create")
         _list path;
     delete =
       option_of_yojson
         (value_for_key delete_global_secondary_index_action_of_yojson "Delete")
         _list path;
   }
    : global_secondary_index_update)

let global_secondary_index_update_list_of_yojson tree path =
  list_of_yojson global_secondary_index_update_of_yojson tree path

let update_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_definitions =
       option_of_yojson
         (value_for_key attribute_definitions_of_yojson "AttributeDefinitions")
         _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     global_secondary_index_updates =
       option_of_yojson
         (value_for_key global_secondary_index_update_list_of_yojson "GlobalSecondaryIndexUpdates")
         _list path;
     stream_specification =
       option_of_yojson
         (value_for_key stream_specification_of_yojson "StreamSpecification")
         _list path;
     sse_specification =
       option_of_yojson (value_for_key sse_specification_of_yojson "SSESpecification") _list path;
     replica_updates =
       option_of_yojson
         (value_for_key replication_group_update_list_of_yojson "ReplicaUpdates")
         _list path;
     table_class = option_of_yojson (value_for_key table_class_of_yojson "TableClass") _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key deletion_protection_enabled_of_yojson "DeletionProtectionEnabled")
         _list path;
     multi_region_consistency =
       option_of_yojson
         (value_for_key multi_region_consistency_of_yojson "MultiRegionConsistency")
         _list path;
     global_table_witness_updates =
       option_of_yojson
         (value_for_key global_table_witness_group_update_list_of_yojson "GlobalTableWitnessUpdates")
         _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     warm_throughput =
       option_of_yojson (value_for_key warm_throughput_of_yojson "WarmThroughput") _list path;
     global_table_settings_replication_mode =
       option_of_yojson
         (value_for_key global_table_settings_replication_mode_of_yojson
            "GlobalTableSettingsReplicationMode")
         _list path;
   }
    : update_table_input)

let update_kinesis_streaming_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approximate_creation_date_time_precision =
       option_of_yojson
         (value_for_key approximate_creation_date_time_precision_of_yojson
            "ApproximateCreationDateTimePrecision")
         _list path;
   }
    : update_kinesis_streaming_configuration)

let update_kinesis_streaming_destination_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     stream_arn = option_of_yojson (value_for_key stream_arn_of_yojson "StreamArn") _list path;
     destination_status =
       option_of_yojson (value_for_key destination_status_of_yojson "DestinationStatus") _list path;
     update_kinesis_streaming_configuration =
       option_of_yojson
         (value_for_key update_kinesis_streaming_configuration_of_yojson
            "UpdateKinesisStreamingConfiguration")
         _list path;
   }
    : update_kinesis_streaming_destination_output)

let update_kinesis_streaming_destination_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     stream_arn = value_for_key stream_arn_of_yojson "StreamArn" _list path;
     update_kinesis_streaming_configuration =
       option_of_yojson
         (value_for_key update_kinesis_streaming_configuration_of_yojson
            "UpdateKinesisStreamingConfiguration")
         _list path;
   }
    : update_kinesis_streaming_destination_input)

let update_item_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = option_of_yojson (value_for_key attribute_map_of_yojson "Attributes") _list path;
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
     item_collection_metrics =
       option_of_yojson
         (value_for_key item_collection_metrics_of_yojson "ItemCollectionMetrics")
         _list path;
   }
    : update_item_output)

let update_expression_of_yojson = string_of_yojson

let update_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     key = value_for_key key_of_yojson "Key" _list path;
     attribute_updates =
       option_of_yojson (value_for_key attribute_updates_of_yojson "AttributeUpdates") _list path;
     expected =
       option_of_yojson (value_for_key expected_attribute_map_of_yojson "Expected") _list path;
     conditional_operator =
       option_of_yojson
         (value_for_key conditional_operator_of_yojson "ConditionalOperator")
         _list path;
     return_values =
       option_of_yojson (value_for_key return_value_of_yojson "ReturnValues") _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     return_item_collection_metrics =
       option_of_yojson
         (value_for_key return_item_collection_metrics_of_yojson "ReturnItemCollectionMetrics")
         _list path;
     update_expression =
       option_of_yojson (value_for_key update_expression_of_yojson "UpdateExpression") _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
   }
    : update_item_input)

let replica_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : replica_not_found_exception)

let index_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : index_not_found_exception)

let update_global_table_settings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "GlobalTableName") _list path;
     replica_settings =
       option_of_yojson
         (value_for_key replica_settings_description_list_of_yojson "ReplicaSettings")
         _list path;
   }
    : update_global_table_settings_output)

let replica_global_secondary_index_settings_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
     provisioned_read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ProvisionedReadCapacityUnits")
         _list path;
     provisioned_read_capacity_auto_scaling_settings_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ProvisionedReadCapacityAutoScalingSettingsUpdate")
         _list path;
   }
    : replica_global_secondary_index_settings_update)

let replica_global_secondary_index_settings_update_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_settings_update_of_yojson tree path

let replica_settings_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
     replica_provisioned_read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ReplicaProvisionedReadCapacityUnits")
         _list path;
     replica_provisioned_read_capacity_auto_scaling_settings_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate")
         _list path;
     replica_global_secondary_index_settings_update =
       option_of_yojson
         (value_for_key replica_global_secondary_index_settings_update_list_of_yojson
            "ReplicaGlobalSecondaryIndexSettingsUpdate")
         _list path;
     replica_table_class =
       option_of_yojson (value_for_key table_class_of_yojson "ReplicaTableClass") _list path;
   }
    : replica_settings_update)

let replica_settings_update_list_of_yojson tree path =
  list_of_yojson replica_settings_update_of_yojson tree path

let global_table_global_secondary_index_settings_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
     provisioned_write_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ProvisionedWriteCapacityUnits")
         _list path;
     provisioned_write_capacity_auto_scaling_settings_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ProvisionedWriteCapacityAutoScalingSettingsUpdate")
         _list path;
   }
    : global_table_global_secondary_index_settings_update)

let global_table_global_secondary_index_settings_update_list_of_yojson tree path =
  list_of_yojson global_table_global_secondary_index_settings_update_of_yojson tree path

let update_global_table_settings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_name = value_for_key table_name_of_yojson "GlobalTableName" _list path;
     global_table_billing_mode =
       option_of_yojson (value_for_key billing_mode_of_yojson "GlobalTableBillingMode") _list path;
     global_table_provisioned_write_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "GlobalTableProvisionedWriteCapacityUnits")
         _list path;
     global_table_provisioned_write_capacity_auto_scaling_settings_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate")
         _list path;
     global_table_global_secondary_index_settings_update =
       option_of_yojson
         (value_for_key global_table_global_secondary_index_settings_update_list_of_yojson
            "GlobalTableGlobalSecondaryIndexSettingsUpdate")
         _list path;
     replica_settings_update =
       option_of_yojson
         (value_for_key replica_settings_update_list_of_yojson "ReplicaSettingsUpdate")
         _list path;
   }
    : update_global_table_settings_input)

let replica_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : replica_already_exists_exception)

let update_global_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_description =
       option_of_yojson
         (value_for_key global_table_description_of_yojson "GlobalTableDescription")
         _list path;
   }
    : update_global_table_output)

let replica_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create = option_of_yojson (value_for_key create_replica_action_of_yojson "Create") _list path;
     delete = option_of_yojson (value_for_key delete_replica_action_of_yojson "Delete") _list path;
   }
    : replica_update)

let replica_update_list_of_yojson tree path = list_of_yojson replica_update_of_yojson tree path

let update_global_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_name = value_for_key table_name_of_yojson "GlobalTableName" _list path;
     replica_updates = value_for_key replica_update_list_of_yojson "ReplicaUpdates" _list path;
   }
    : update_global_table_input)

let update_contributor_insights_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     contributor_insights_status =
       option_of_yojson
         (value_for_key contributor_insights_status_of_yojson "ContributorInsightsStatus")
         _list path;
     contributor_insights_mode =
       option_of_yojson
         (value_for_key contributor_insights_mode_of_yojson "ContributorInsightsMode")
         _list path;
   }
    : update_contributor_insights_output)

let update_contributor_insights_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     contributor_insights_action =
       value_for_key contributor_insights_action_of_yojson "ContributorInsightsAction" _list path;
     contributor_insights_mode =
       option_of_yojson
         (value_for_key contributor_insights_mode_of_yojson "ContributorInsightsMode")
         _list path;
   }
    : update_contributor_insights_input)

let update_continuous_backups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     continuous_backups_description =
       option_of_yojson
         (value_for_key continuous_backups_description_of_yojson "ContinuousBackupsDescription")
         _list path;
   }
    : update_continuous_backups_output)

let point_in_time_recovery_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     point_in_time_recovery_enabled =
       value_for_key boolean_object_of_yojson "PointInTimeRecoveryEnabled" _list path;
     recovery_period_in_days =
       option_of_yojson
         (value_for_key recovery_period_in_days_of_yojson "RecoveryPeriodInDays")
         _list path;
   }
    : point_in_time_recovery_specification)

let update_continuous_backups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     point_in_time_recovery_specification =
       value_for_key point_in_time_recovery_specification_of_yojson
         "PointInTimeRecoverySpecification" _list path;
   }
    : update_continuous_backups_input)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_string_of_yojson tree path

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_input)

let transaction_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : transaction_in_progress_exception)

let transaction_canceled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     cancellation_reasons =
       option_of_yojson
         (value_for_key cancellation_reason_list_of_yojson "CancellationReasons")
         _list path;
   }
    : transaction_canceled_exception)

let idempotent_parameter_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : idempotent_parameter_mismatch_exception)

let transact_write_items_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_capacity =
       option_of_yojson
         (value_for_key consumed_capacity_multiple_of_yojson "ConsumedCapacity")
         _list path;
     item_collection_metrics =
       option_of_yojson
         (value_for_key item_collection_metrics_per_table_of_yojson "ItemCollectionMetrics")
         _list path;
   }
    : transact_write_items_output)

let update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key key_of_yojson "Key" _list path;
     update_expression = value_for_key update_expression_of_yojson "UpdateExpression" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
   }
    : update)

let put_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item = value_for_key put_item_input_attribute_map_of_yojson "Item" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
   }
    : put)

let transact_write_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     condition_check =
       option_of_yojson (value_for_key condition_check_of_yojson "ConditionCheck") _list path;
     put = option_of_yojson (value_for_key put_of_yojson "Put") _list path;
     delete = option_of_yojson (value_for_key delete_of_yojson "Delete") _list path;
     update = option_of_yojson (value_for_key update_of_yojson "Update") _list path;
   }
    : transact_write_item)

let transact_write_item_list_of_yojson tree path =
  list_of_yojson transact_write_item_of_yojson tree path

let transact_write_items_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transact_items = value_for_key transact_write_item_list_of_yojson "TransactItems" _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     return_item_collection_metrics =
       option_of_yojson
         (value_for_key return_item_collection_metrics_of_yojson "ReturnItemCollectionMetrics")
         _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
   }
    : transact_write_items_input)

let item_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path }
    : item_response)

let item_response_list_of_yojson tree path = list_of_yojson item_response_of_yojson tree path

let transact_get_items_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_capacity =
       option_of_yojson
         (value_for_key consumed_capacity_multiple_of_yojson "ConsumedCapacity")
         _list path;
     responses =
       option_of_yojson (value_for_key item_response_list_of_yojson "Responses") _list path;
   }
    : transact_get_items_output)

let get_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key key_of_yojson "Key" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     projection_expression =
       option_of_yojson
         (value_for_key projection_expression_of_yojson "ProjectionExpression")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
   }
    : get)

let transact_get_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ get = value_for_key get_of_yojson "Get" _list path } : transact_get_item)

let transact_get_item_list_of_yojson tree path =
  list_of_yojson transact_get_item_of_yojson tree path

let transact_get_items_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transact_items = value_for_key transact_get_item_list_of_yojson "TransactItems" _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
   }
    : transact_get_items_input)

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_input)

let integer_of_yojson = int_of_yojson

let scan_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = option_of_yojson (value_for_key item_list_of_yojson "Items") _list path;
     count = option_of_yojson (value_for_key integer_of_yojson "Count") _list path;
     scanned_count = option_of_yojson (value_for_key integer_of_yojson "ScannedCount") _list path;
     last_evaluated_key =
       option_of_yojson (value_for_key key_of_yojson "LastEvaluatedKey") _list path;
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
   }
    : scan_output)

let scan_segment_of_yojson = int_of_yojson
let scan_total_segments_of_yojson = int_of_yojson

let filter_condition_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson condition_of_yojson tree path

let select_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL_ATTRIBUTES" -> ALL_ATTRIBUTES
    | `String "ALL_PROJECTED_ATTRIBUTES" -> ALL_PROJECTED_ATTRIBUTES
    | `String "SPECIFIC_ATTRIBUTES" -> SPECIFIC_ATTRIBUTES
    | `String "COUNT" -> COUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "Select" value)
    | _ -> raise (deserialize_wrong_type_error path "Select")
     : select)
    : select)

let positive_integer_object_of_yojson = int_of_yojson

let scan_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     attributes_to_get =
       option_of_yojson (value_for_key attribute_name_list_of_yojson "AttributesToGet") _list path;
     limit = option_of_yojson (value_for_key positive_integer_object_of_yojson "Limit") _list path;
     select = option_of_yojson (value_for_key select_of_yojson "Select") _list path;
     scan_filter =
       option_of_yojson (value_for_key filter_condition_map_of_yojson "ScanFilter") _list path;
     conditional_operator =
       option_of_yojson
         (value_for_key conditional_operator_of_yojson "ConditionalOperator")
         _list path;
     exclusive_start_key =
       option_of_yojson (value_for_key key_of_yojson "ExclusiveStartKey") _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     total_segments =
       option_of_yojson (value_for_key scan_total_segments_of_yojson "TotalSegments") _list path;
     segment = option_of_yojson (value_for_key scan_segment_of_yojson "Segment") _list path;
     projection_expression =
       option_of_yojson
         (value_for_key projection_expression_of_yojson "ProjectionExpression")
         _list path;
     filter_expression =
       option_of_yojson (value_for_key condition_expression_of_yojson "FilterExpression") _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
   }
    : scan_input)

let table_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : table_already_exists_exception)

let point_in_time_recovery_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : point_in_time_recovery_unavailable_exception)

let invalid_restore_time_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_restore_time_exception)

let restore_table_to_point_in_time_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_description =
       option_of_yojson (value_for_key table_description_of_yojson "TableDescription") _list path;
   }
    : restore_table_to_point_in_time_output)

let restore_table_to_point_in_time_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_table_arn =
       option_of_yojson (value_for_key table_arn_of_yojson "SourceTableArn") _list path;
     source_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "SourceTableName") _list path;
     target_table_name = value_for_key table_name_of_yojson "TargetTableName" _list path;
     use_latest_restorable_time =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "UseLatestRestorableTime")
         _list path;
     restore_date_time =
       option_of_yojson (value_for_key date_of_yojson "RestoreDateTime") _list path;
     billing_mode_override =
       option_of_yojson (value_for_key billing_mode_of_yojson "BillingModeOverride") _list path;
     global_secondary_index_override =
       option_of_yojson
         (value_for_key global_secondary_index_list_of_yojson "GlobalSecondaryIndexOverride")
         _list path;
     local_secondary_index_override =
       option_of_yojson
         (value_for_key local_secondary_index_list_of_yojson "LocalSecondaryIndexOverride")
         _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughputOverride")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughputOverride")
         _list path;
     sse_specification_override =
       option_of_yojson
         (value_for_key sse_specification_of_yojson "SSESpecificationOverride")
         _list path;
   }
    : restore_table_to_point_in_time_input)

let restore_table_from_backup_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_description =
       option_of_yojson (value_for_key table_description_of_yojson "TableDescription") _list path;
   }
    : restore_table_from_backup_output)

let restore_table_from_backup_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_table_name = value_for_key table_name_of_yojson "TargetTableName" _list path;
     backup_arn = value_for_key backup_arn_of_yojson "BackupArn" _list path;
     billing_mode_override =
       option_of_yojson (value_for_key billing_mode_of_yojson "BillingModeOverride") _list path;
     global_secondary_index_override =
       option_of_yojson
         (value_for_key global_secondary_index_list_of_yojson "GlobalSecondaryIndexOverride")
         _list path;
     local_secondary_index_override =
       option_of_yojson
         (value_for_key local_secondary_index_list_of_yojson "LocalSecondaryIndexOverride")
         _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughputOverride")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughputOverride")
         _list path;
     sse_specification_override =
       option_of_yojson
         (value_for_key sse_specification_of_yojson "SSESpecificationOverride")
         _list path;
   }
    : restore_table_from_backup_input)

let query_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = option_of_yojson (value_for_key item_list_of_yojson "Items") _list path;
     count = option_of_yojson (value_for_key integer_of_yojson "Count") _list path;
     scanned_count = option_of_yojson (value_for_key integer_of_yojson "ScannedCount") _list path;
     last_evaluated_key =
       option_of_yojson (value_for_key key_of_yojson "LastEvaluatedKey") _list path;
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
   }
    : query_output)

let key_expression_of_yojson = string_of_yojson

let key_conditions_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson condition_of_yojson tree path

let query_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     select = option_of_yojson (value_for_key select_of_yojson "Select") _list path;
     attributes_to_get =
       option_of_yojson (value_for_key attribute_name_list_of_yojson "AttributesToGet") _list path;
     limit = option_of_yojson (value_for_key positive_integer_object_of_yojson "Limit") _list path;
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
     key_conditions =
       option_of_yojson (value_for_key key_conditions_of_yojson "KeyConditions") _list path;
     query_filter =
       option_of_yojson (value_for_key filter_condition_map_of_yojson "QueryFilter") _list path;
     conditional_operator =
       option_of_yojson
         (value_for_key conditional_operator_of_yojson "ConditionalOperator")
         _list path;
     scan_index_forward =
       option_of_yojson (value_for_key boolean_object_of_yojson "ScanIndexForward") _list path;
     exclusive_start_key =
       option_of_yojson (value_for_key key_of_yojson "ExclusiveStartKey") _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     projection_expression =
       option_of_yojson
         (value_for_key projection_expression_of_yojson "ProjectionExpression")
         _list path;
     filter_expression =
       option_of_yojson (value_for_key condition_expression_of_yojson "FilterExpression") _list path;
     key_condition_expression =
       option_of_yojson (value_for_key key_expression_of_yojson "KeyConditionExpression") _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
   }
    : query_input)

let put_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "RevisionId") _list path;
   }
    : put_resource_policy_output)

let put_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
     policy = value_for_key resource_policy_of_yojson "Policy" _list path;
     expected_revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "ExpectedRevisionId") _list path;
     confirm_remove_self_resource_access =
       option_of_yojson
         (value_for_key confirm_remove_self_resource_access_of_yojson
            "ConfirmRemoveSelfResourceAccess")
         _list path;
   }
    : put_resource_policy_input)

let put_item_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = option_of_yojson (value_for_key attribute_map_of_yojson "Attributes") _list path;
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
     item_collection_metrics =
       option_of_yojson
         (value_for_key item_collection_metrics_of_yojson "ItemCollectionMetrics")
         _list path;
   }
    : put_item_output)

let put_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     item = value_for_key put_item_input_attribute_map_of_yojson "Item" _list path;
     expected =
       option_of_yojson (value_for_key expected_attribute_map_of_yojson "Expected") _list path;
     return_values =
       option_of_yojson (value_for_key return_value_of_yojson "ReturnValues") _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     return_item_collection_metrics =
       option_of_yojson
         (value_for_key return_item_collection_metrics_of_yojson "ReturnItemCollectionMetrics")
         _list path;
     conditional_operator =
       option_of_yojson
         (value_for_key conditional_operator_of_yojson "ConditionalOperator")
         _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
   }
    : put_item_input)

let next_token_string_of_yojson = string_of_yojson

let list_tags_of_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
   }
    : list_tags_of_resource_output)

let list_tags_of_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
   }
    : list_tags_of_resource_input)

let table_name_list_of_yojson tree path = list_of_yojson table_name_of_yojson tree path

let list_tables_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_names =
       option_of_yojson (value_for_key table_name_list_of_yojson "TableNames") _list path;
     last_evaluated_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "LastEvaluatedTableName") _list path;
   }
    : list_tables_output)

let list_tables_input_limit_of_yojson = int_of_yojson

let list_tables_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclusive_start_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "ExclusiveStartTableName") _list path;
     limit = option_of_yojson (value_for_key list_tables_input_limit_of_yojson "Limit") _list path;
   }
    : list_tables_input)

let import_next_token_of_yojson = string_of_yojson

let import_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_arn = option_of_yojson (value_for_key import_arn_of_yojson "ImportArn") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "ImportStatus") _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     s3_bucket_source =
       option_of_yojson (value_for_key s3_bucket_source_of_yojson "S3BucketSource") _list path;
     cloud_watch_log_group_arn =
       option_of_yojson
         (value_for_key cloud_watch_log_group_arn_of_yojson "CloudWatchLogGroupArn")
         _list path;
     input_format = option_of_yojson (value_for_key input_format_of_yojson "InputFormat") _list path;
     start_time =
       option_of_yojson (value_for_key import_start_time_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key import_end_time_of_yojson "EndTime") _list path;
   }
    : import_summary)

let import_summary_list_of_yojson tree path = list_of_yojson import_summary_of_yojson tree path

let list_imports_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_summary_list =
       option_of_yojson (value_for_key import_summary_list_of_yojson "ImportSummaryList") _list path;
     next_token =
       option_of_yojson (value_for_key import_next_token_of_yojson "NextToken") _list path;
   }
    : list_imports_output)

let list_imports_max_limit_of_yojson = int_of_yojson

let list_imports_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     page_size =
       option_of_yojson (value_for_key list_imports_max_limit_of_yojson "PageSize") _list path;
     next_token =
       option_of_yojson (value_for_key import_next_token_of_yojson "NextToken") _list path;
   }
    : list_imports_input)

let global_table_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "GlobalTableName") _list path;
     replication_group =
       option_of_yojson (value_for_key replica_list_of_yojson "ReplicationGroup") _list path;
   }
    : global_table)

let global_table_list_of_yojson tree path = list_of_yojson global_table_of_yojson tree path

let list_global_tables_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_tables =
       option_of_yojson (value_for_key global_table_list_of_yojson "GlobalTables") _list path;
     last_evaluated_global_table_name =
       option_of_yojson
         (value_for_key table_name_of_yojson "LastEvaluatedGlobalTableName")
         _list path;
   }
    : list_global_tables_output)

let list_global_tables_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclusive_start_global_table_name =
       option_of_yojson
         (value_for_key table_name_of_yojson "ExclusiveStartGlobalTableName")
         _list path;
     limit = option_of_yojson (value_for_key positive_integer_object_of_yojson "Limit") _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
   }
    : list_global_tables_input)

let export_next_token_of_yojson = string_of_yojson

let export_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_arn = option_of_yojson (value_for_key export_arn_of_yojson "ExportArn") _list path;
     export_status =
       option_of_yojson (value_for_key export_status_of_yojson "ExportStatus") _list path;
     export_type = option_of_yojson (value_for_key export_type_of_yojson "ExportType") _list path;
   }
    : export_summary)

let export_summaries_of_yojson tree path = list_of_yojson export_summary_of_yojson tree path

let list_exports_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_summaries =
       option_of_yojson (value_for_key export_summaries_of_yojson "ExportSummaries") _list path;
     next_token =
       option_of_yojson (value_for_key export_next_token_of_yojson "NextToken") _list path;
   }
    : list_exports_output)

let list_exports_max_limit_of_yojson = int_of_yojson

let list_exports_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     max_results =
       option_of_yojson (value_for_key list_exports_max_limit_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson (value_for_key export_next_token_of_yojson "NextToken") _list path;
   }
    : list_exports_input)

let list_contributor_insights_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contributor_insights_summaries =
       option_of_yojson
         (value_for_key contributor_insights_summaries_of_yojson "ContributorInsightsSummaries")
         _list path;
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
   }
    : list_contributor_insights_output)

let list_contributor_insights_limit_of_yojson = int_of_yojson

let list_contributor_insights_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_arn_of_yojson "TableName") _list path;
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_contributor_insights_limit_of_yojson "MaxResults")
         _list path;
   }
    : list_contributor_insights_input)

let list_backups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_summaries =
       option_of_yojson (value_for_key backup_summaries_of_yojson "BackupSummaries") _list path;
     last_evaluated_backup_arn =
       option_of_yojson (value_for_key backup_arn_of_yojson "LastEvaluatedBackupArn") _list path;
   }
    : list_backups_output)

let time_range_upper_bound_of_yojson = timestamp_epoch_seconds_of_yojson
let time_range_lower_bound_of_yojson = timestamp_epoch_seconds_of_yojson

let list_backups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_arn_of_yojson "TableName") _list path;
     limit = option_of_yojson (value_for_key backups_input_limit_of_yojson "Limit") _list path;
     time_range_lower_bound =
       option_of_yojson
         (value_for_key time_range_lower_bound_of_yojson "TimeRangeLowerBound")
         _list path;
     time_range_upper_bound =
       option_of_yojson
         (value_for_key time_range_upper_bound_of_yojson "TimeRangeUpperBound")
         _list path;
     exclusive_start_backup_arn =
       option_of_yojson (value_for_key backup_arn_of_yojson "ExclusiveStartBackupArn") _list path;
     backup_type =
       option_of_yojson (value_for_key backup_type_filter_of_yojson "BackupType") _list path;
   }
    : list_backups_input)

let import_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : import_conflict_exception)

let import_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_table_description =
       value_for_key import_table_description_of_yojson "ImportTableDescription" _list path;
   }
    : import_table_output)

let import_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     s3_bucket_source = value_for_key s3_bucket_source_of_yojson "S3BucketSource" _list path;
     input_format = value_for_key input_format_of_yojson "InputFormat" _list path;
     input_format_options =
       option_of_yojson
         (value_for_key input_format_options_of_yojson "InputFormatOptions")
         _list path;
     input_compression_type =
       option_of_yojson
         (value_for_key input_compression_type_of_yojson "InputCompressionType")
         _list path;
     table_creation_parameters =
       value_for_key table_creation_parameters_of_yojson "TableCreationParameters" _list path;
   }
    : import_table_input)

let get_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = option_of_yojson (value_for_key resource_policy_of_yojson "Policy") _list path;
     revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "RevisionId") _list path;
   }
    : get_resource_policy_output)

let get_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path }
    : get_resource_policy_input)

let get_item_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path;
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
   }
    : get_item_output)

let get_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     key = value_for_key key_of_yojson "Key" _list path;
     attributes_to_get =
       option_of_yojson (value_for_key attribute_name_list_of_yojson "AttributesToGet") _list path;
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     projection_expression =
       option_of_yojson
         (value_for_key projection_expression_of_yojson "ProjectionExpression")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
   }
    : get_item_input)

let invalid_export_time_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_export_time_exception)

let export_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : export_conflict_exception)

let export_table_to_point_in_time_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_description =
       option_of_yojson (value_for_key export_description_of_yojson "ExportDescription") _list path;
   }
    : export_table_to_point_in_time_output)

let export_table_to_point_in_time_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_arn = value_for_key table_arn_of_yojson "TableArn" _list path;
     export_time = option_of_yojson (value_for_key export_time_of_yojson "ExportTime") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
     s3_bucket_owner =
       option_of_yojson (value_for_key s3_bucket_owner_of_yojson "S3BucketOwner") _list path;
     s3_prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "S3Prefix") _list path;
     s3_sse_algorithm =
       option_of_yojson (value_for_key s3_sse_algorithm_of_yojson "S3SseAlgorithm") _list path;
     s3_sse_kms_key_id =
       option_of_yojson (value_for_key s3_sse_kms_key_id_of_yojson "S3SseKmsKeyId") _list path;
     export_format =
       option_of_yojson (value_for_key export_format_of_yojson "ExportFormat") _list path;
     export_type = option_of_yojson (value_for_key export_type_of_yojson "ExportType") _list path;
     incremental_export_specification =
       option_of_yojson
         (value_for_key incremental_export_specification_of_yojson "IncrementalExportSpecification")
         _list path;
   }
    : export_table_to_point_in_time_input)

let execute_transaction_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     responses =
       option_of_yojson (value_for_key item_response_list_of_yojson "Responses") _list path;
     consumed_capacity =
       option_of_yojson
         (value_for_key consumed_capacity_multiple_of_yojson "ConsumedCapacity")
         _list path;
   }
    : execute_transaction_output)

let parameterized_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statement = value_for_key parti_ql_statement_of_yojson "Statement" _list path;
     parameters =
       option_of_yojson
         (value_for_key prepared_statement_parameters_of_yojson "Parameters")
         _list path;
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
   }
    : parameterized_statement)

let parameterized_statements_of_yojson tree path =
  list_of_yojson parameterized_statement_of_yojson tree path

let execute_transaction_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transact_statements =
       value_for_key parameterized_statements_of_yojson "TransactStatements" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
   }
    : execute_transaction_input)

let parti_ql_next_token_of_yojson = string_of_yojson

let execute_statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = option_of_yojson (value_for_key item_list_of_yojson "Items") _list path;
     next_token =
       option_of_yojson (value_for_key parti_ql_next_token_of_yojson "NextToken") _list path;
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
     last_evaluated_key =
       option_of_yojson (value_for_key key_of_yojson "LastEvaluatedKey") _list path;
   }
    : execute_statement_output)

let execute_statement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statement = value_for_key parti_ql_statement_of_yojson "Statement" _list path;
     parameters =
       option_of_yojson
         (value_for_key prepared_statement_parameters_of_yojson "Parameters")
         _list path;
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
     next_token =
       option_of_yojson (value_for_key parti_ql_next_token_of_yojson "NextToken") _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     limit = option_of_yojson (value_for_key positive_integer_object_of_yojson "Limit") _list path;
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
   }
    : execute_statement_input)
