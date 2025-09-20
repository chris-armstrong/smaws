open Smaws_Lib.Json.DeserializeHelpers
open Types

let string_attribute_value_of_yojson = string_of_yojson
let number_attribute_value_of_yojson = string_of_yojson
let binary_attribute_value_of_yojson = blob_of_yojson

let string_set_attribute_value_of_yojson tree path =
  list_of_yojson string_attribute_value_of_yojson tree path

let number_set_attribute_value_of_yojson tree path =
  list_of_yojson number_attribute_value_of_yojson tree path

let binary_set_attribute_value_of_yojson tree path =
  list_of_yojson binary_attribute_value_of_yojson tree path

let attribute_name_of_yojson = string_of_yojson
let null_attribute_value_of_yojson = bool_of_yojson
let boolean_attribute_value_of_yojson = bool_of_yojson

let rec attribute_value_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "BOOL" -> BOOL (boolean_attribute_value_of_yojson value_ path)
   | "NULL" -> NULL (null_attribute_value_of_yojson value_ path)
   | "L" -> L (list_attribute_value_of_yojson value_ path)
   | "M" -> M (map_attribute_value_of_yojson value_ path)
   | "BS" -> BS (binary_set_attribute_value_of_yojson value_ path)
   | "NS" -> NS (number_set_attribute_value_of_yojson value_ path)
   | "SS" -> SS (string_set_attribute_value_of_yojson value_ path)
   | "B" -> B (binary_attribute_value_of_yojson value_ path)
   | "N" -> N (number_attribute_value_of_yojson value_ path)
   | "S" -> S (string_attribute_value_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "AttributeValue" unknown)
    : attribute_value)

and list_attribute_value_of_yojson tree path = list_of_yojson attribute_value_of_yojson tree path

and map_attribute_value_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let put_item_input_attribute_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let put_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ item = value_for_key put_item_input_attribute_map_of_yojson "Item" _list path } : put_request)

let key_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let delete_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key = value_for_key key_of_yojson "Key" _list path } : delete_request)

let write_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_request =
       option_of_yojson (value_for_key delete_request_of_yojson "DeleteRequest") _list path;
     put_request = option_of_yojson (value_for_key put_request_of_yojson "PutRequest") _list path;
   }
    : write_request)

let write_requests_of_yojson tree path = list_of_yojson write_request_of_yojson tree path

let witness_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "WitnessStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "WitnessStatus")
     : witness_status)
    : witness_status)

let long_object_of_yojson = long_of_yojson

let warm_throughput_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     write_units_per_second =
       option_of_yojson (value_for_key long_object_of_yojson "WriteUnitsPerSecond") _list path;
     read_units_per_second =
       option_of_yojson (value_for_key long_object_of_yojson "ReadUnitsPerSecond") _list path;
   }
    : warm_throughput)

let time_to_live_enabled_of_yojson = bool_of_yojson
let time_to_live_attribute_name_of_yojson = string_of_yojson

let time_to_live_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name = value_for_key time_to_live_attribute_name_of_yojson "AttributeName" _list path;
     enabled = value_for_key time_to_live_enabled_of_yojson "Enabled" _list path;
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

let table_arn_of_yojson = string_of_yojson

let update_time_to_live_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_to_live_specification =
       value_for_key time_to_live_specification_of_yojson "TimeToLiveSpecification" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : update_time_to_live_input)

let error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_found_exception)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_in_use_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let string__of_yojson = string_of_yojson

let invalid_endpoint_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_endpoint_exception)

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_server_error)

let table_name_of_yojson = string_of_yojson

let table_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "REPLICATION_NOT_AUTHORIZED" -> REPLICATION_NOT_AUTHORIZED
    | `String "ARCHIVED" -> ARCHIVED
    | `String "ARCHIVING" -> ARCHIVING
    | `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS" -> INACCESSIBLE_ENCRYPTION_CREDENTIALS
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "TableStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TableStatus")
     : table_status)
    : table_status)

let region_name_of_yojson = string_of_yojson
let index_name_of_yojson = string_of_yojson

let index_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "IndexStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "IndexStatus")
     : index_status)
    : index_status)

let positive_long_object_of_yojson = long_of_yojson
let boolean_object_of_yojson = bool_of_yojson
let auto_scaling_policy_name_of_yojson = string_of_yojson
let integer_object_of_yojson = int_of_yojson
let double_object_of_yojson = double_of_yojson

let auto_scaling_target_tracking_scaling_policy_configuration_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_value = value_for_key double_object_of_yojson "TargetValue" _list path;
     scale_out_cooldown =
       option_of_yojson (value_for_key integer_object_of_yojson "ScaleOutCooldown") _list path;
     scale_in_cooldown =
       option_of_yojson (value_for_key integer_object_of_yojson "ScaleInCooldown") _list path;
     disable_scale_in =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableScaleIn") _list path;
   }
    : auto_scaling_target_tracking_scaling_policy_configuration_description)

let auto_scaling_policy_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_tracking_scaling_policy_configuration =
       option_of_yojson
         (value_for_key
            auto_scaling_target_tracking_scaling_policy_configuration_description_of_yojson
            "TargetTrackingScalingPolicyConfiguration")
         _list path;
     policy_name =
       option_of_yojson (value_for_key auto_scaling_policy_name_of_yojson "PolicyName") _list path;
   }
    : auto_scaling_policy_description)

let auto_scaling_policy_description_list_of_yojson tree path =
  list_of_yojson auto_scaling_policy_description_of_yojson tree path

let auto_scaling_settings_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_policies =
       option_of_yojson
         (value_for_key auto_scaling_policy_description_list_of_yojson "ScalingPolicies")
         _list path;
     auto_scaling_role_arn =
       option_of_yojson (value_for_key string__of_yojson "AutoScalingRoleArn") _list path;
     auto_scaling_disabled =
       option_of_yojson (value_for_key boolean_object_of_yojson "AutoScalingDisabled") _list path;
     maximum_units =
       option_of_yojson (value_for_key positive_long_object_of_yojson "MaximumUnits") _list path;
     minimum_units =
       option_of_yojson (value_for_key positive_long_object_of_yojson "MinimumUnits") _list path;
   }
    : auto_scaling_settings_description)

let replica_global_secondary_index_auto_scaling_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioned_write_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ProvisionedWriteCapacityAutoScalingSettings")
         _list path;
     provisioned_read_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ProvisionedReadCapacityAutoScalingSettings")
         _list path;
     index_status = option_of_yojson (value_for_key index_status_of_yojson "IndexStatus") _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
   }
    : replica_global_secondary_index_auto_scaling_description)

let replica_global_secondary_index_auto_scaling_description_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_auto_scaling_description_of_yojson tree path

let replica_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "REPLICATION_NOT_AUTHORIZED" -> REPLICATION_NOT_AUTHORIZED
    | `String "ARCHIVED" -> ARCHIVED
    | `String "ARCHIVING" -> ARCHIVING
    | `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS" -> INACCESSIBLE_ENCRYPTION_CREDENTIALS
    | `String "REGION_DISABLED" -> REGION_DISABLED
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String "CREATION_FAILED" -> CREATION_FAILED
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReplicaStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplicaStatus")
     : replica_status)
    : replica_status)

let replica_auto_scaling_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_status =
       option_of_yojson (value_for_key replica_status_of_yojson "ReplicaStatus") _list path;
     replica_provisioned_write_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ReplicaProvisionedWriteCapacityAutoScalingSettings")
         _list path;
     replica_provisioned_read_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ReplicaProvisionedReadCapacityAutoScalingSettings")
         _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key replica_global_secondary_index_auto_scaling_description_list_of_yojson
            "GlobalSecondaryIndexes")
         _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
   }
    : replica_auto_scaling_description)

let replica_auto_scaling_description_list_of_yojson tree path =
  list_of_yojson replica_auto_scaling_description_of_yojson tree path

let table_auto_scaling_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replicas =
       option_of_yojson
         (value_for_key replica_auto_scaling_description_list_of_yojson "Replicas")
         _list path;
     table_status = option_of_yojson (value_for_key table_status_of_yojson "TableStatus") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
   }
    : table_auto_scaling_description)

let update_table_replica_auto_scaling_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_auto_scaling_description =
       option_of_yojson
         (value_for_key table_auto_scaling_description_of_yojson "TableAutoScalingDescription")
         _list path;
   }
    : update_table_replica_auto_scaling_output)

let auto_scaling_role_arn_of_yojson = string_of_yojson

let auto_scaling_target_tracking_scaling_policy_configuration_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_value = value_for_key double_object_of_yojson "TargetValue" _list path;
     scale_out_cooldown =
       option_of_yojson (value_for_key integer_object_of_yojson "ScaleOutCooldown") _list path;
     scale_in_cooldown =
       option_of_yojson (value_for_key integer_object_of_yojson "ScaleInCooldown") _list path;
     disable_scale_in =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableScaleIn") _list path;
   }
    : auto_scaling_target_tracking_scaling_policy_configuration_update)

let auto_scaling_policy_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_tracking_scaling_policy_configuration =
       value_for_key auto_scaling_target_tracking_scaling_policy_configuration_update_of_yojson
         "TargetTrackingScalingPolicyConfiguration" _list path;
     policy_name =
       option_of_yojson (value_for_key auto_scaling_policy_name_of_yojson "PolicyName") _list path;
   }
    : auto_scaling_policy_update)

let auto_scaling_settings_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_policy_update =
       option_of_yojson
         (value_for_key auto_scaling_policy_update_of_yojson "ScalingPolicyUpdate")
         _list path;
     auto_scaling_role_arn =
       option_of_yojson
         (value_for_key auto_scaling_role_arn_of_yojson "AutoScalingRoleArn")
         _list path;
     auto_scaling_disabled =
       option_of_yojson (value_for_key boolean_object_of_yojson "AutoScalingDisabled") _list path;
     maximum_units =
       option_of_yojson (value_for_key positive_long_object_of_yojson "MaximumUnits") _list path;
     minimum_units =
       option_of_yojson (value_for_key positive_long_object_of_yojson "MinimumUnits") _list path;
   }
    : auto_scaling_settings_update)

let global_secondary_index_auto_scaling_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioned_write_capacity_auto_scaling_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ProvisionedWriteCapacityAutoScalingUpdate")
         _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
   }
    : global_secondary_index_auto_scaling_update)

let global_secondary_index_auto_scaling_update_list_of_yojson tree path =
  list_of_yojson global_secondary_index_auto_scaling_update_of_yojson tree path

let replica_global_secondary_index_auto_scaling_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioned_read_capacity_auto_scaling_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ProvisionedReadCapacityAutoScalingUpdate")
         _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
   }
    : replica_global_secondary_index_auto_scaling_update)

let replica_global_secondary_index_auto_scaling_update_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_auto_scaling_update_of_yojson tree path

let replica_auto_scaling_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_provisioned_read_capacity_auto_scaling_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ReplicaProvisionedReadCapacityAutoScalingUpdate")
         _list path;
     replica_global_secondary_index_updates =
       option_of_yojson
         (value_for_key replica_global_secondary_index_auto_scaling_update_list_of_yojson
            "ReplicaGlobalSecondaryIndexUpdates")
         _list path;
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
   }
    : replica_auto_scaling_update)

let replica_auto_scaling_update_list_of_yojson tree path =
  list_of_yojson replica_auto_scaling_update_of_yojson tree path

let update_table_replica_auto_scaling_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_updates =
       option_of_yojson
         (value_for_key replica_auto_scaling_update_list_of_yojson "ReplicaUpdates")
         _list path;
     provisioned_write_capacity_auto_scaling_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ProvisionedWriteCapacityAutoScalingUpdate")
         _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     global_secondary_index_updates =
       option_of_yojson
         (value_for_key global_secondary_index_auto_scaling_update_list_of_yojson
            "GlobalSecondaryIndexUpdates")
         _list path;
   }
    : update_table_replica_auto_scaling_input)

let key_schema_attribute_name_of_yojson = string_of_yojson

let scalar_attribute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "B" -> B
    | `String "N" -> N
    | `String "S" -> S
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScalarAttributeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalarAttributeType")
     : scalar_attribute_type)
    : scalar_attribute_type)

let attribute_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_type = value_for_key scalar_attribute_type_of_yojson "AttributeType" _list path;
     attribute_name = value_for_key key_schema_attribute_name_of_yojson "AttributeName" _list path;
   }
    : attribute_definition)

let attribute_definitions_of_yojson tree path =
  list_of_yojson attribute_definition_of_yojson tree path

let key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RANGE" -> RANGE
    | `String "HASH" -> HASH
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyType")
     : key_type)
    : key_type)

let key_schema_element_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_type = value_for_key key_type_of_yojson "KeyType" _list path;
     attribute_name = value_for_key key_schema_attribute_name_of_yojson "AttributeName" _list path;
   }
    : key_schema_element)

let key_schema_of_yojson tree path = list_of_yojson key_schema_element_of_yojson tree path
let date_of_yojson = timestamp_epoch_seconds_of_yojson
let non_negative_long_object_of_yojson = long_of_yojson

let provisioned_throughput_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     write_capacity_units =
       option_of_yojson
         (value_for_key non_negative_long_object_of_yojson "WriteCapacityUnits")
         _list path;
     read_capacity_units =
       option_of_yojson
         (value_for_key non_negative_long_object_of_yojson "ReadCapacityUnits")
         _list path;
     number_of_decreases_today =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "NumberOfDecreasesToday")
         _list path;
     last_decrease_date_time =
       option_of_yojson (value_for_key date_of_yojson "LastDecreaseDateTime") _list path;
     last_increase_date_time =
       option_of_yojson (value_for_key date_of_yojson "LastIncreaseDateTime") _list path;
   }
    : provisioned_throughput_description)

let table_id_of_yojson = string_of_yojson

let billing_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "PAY_PER_REQUEST" -> PAY_PER_REQUEST
    | `String "PROVISIONED" -> PROVISIONED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingMode")
     : billing_mode)
    : billing_mode)

let billing_mode_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_update_to_pay_per_request_date_time =
       option_of_yojson
         (value_for_key date_of_yojson "LastUpdateToPayPerRequestDateTime")
         _list path;
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
   }
    : billing_mode_summary)

let projection_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INCLUDE" -> INCLUDE
    | `String "KEYS_ONLY" -> KEYS_ONLY
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProjectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProjectionType")
     : projection_type)
    : projection_type)

let non_key_attribute_name_of_yojson = string_of_yojson

let non_key_attribute_name_list_of_yojson tree path =
  list_of_yojson non_key_attribute_name_of_yojson tree path

let projection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     non_key_attributes =
       option_of_yojson
         (value_for_key non_key_attribute_name_list_of_yojson "NonKeyAttributes")
         _list path;
     projection_type =
       option_of_yojson (value_for_key projection_type_of_yojson "ProjectionType") _list path;
   }
    : projection)

let local_secondary_index_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_arn = option_of_yojson (value_for_key string__of_yojson "IndexArn") _list path;
     item_count = option_of_yojson (value_for_key long_object_of_yojson "ItemCount") _list path;
     index_size_bytes =
       option_of_yojson (value_for_key long_object_of_yojson "IndexSizeBytes") _list path;
     projection = option_of_yojson (value_for_key projection_of_yojson "Projection") _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
   }
    : local_secondary_index_description)

let local_secondary_index_description_list_of_yojson tree path =
  list_of_yojson local_secondary_index_description_of_yojson tree path

let backfilling_of_yojson = bool_of_yojson

let on_demand_throughput_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_write_request_units =
       option_of_yojson (value_for_key long_object_of_yojson "MaxWriteRequestUnits") _list path;
     max_read_request_units =
       option_of_yojson (value_for_key long_object_of_yojson "MaxReadRequestUnits") _list path;
   }
    : on_demand_throughput)

let global_secondary_index_warm_throughput_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key index_status_of_yojson "Status") _list path;
     write_units_per_second =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "WriteUnitsPerSecond")
         _list path;
     read_units_per_second =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ReadUnitsPerSecond")
         _list path;
   }
    : global_secondary_index_warm_throughput_description)

let global_secondary_index_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     warm_throughput =
       option_of_yojson
         (value_for_key global_secondary_index_warm_throughput_description_of_yojson
            "WarmThroughput")
         _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     index_arn = option_of_yojson (value_for_key string__of_yojson "IndexArn") _list path;
     item_count = option_of_yojson (value_for_key long_object_of_yojson "ItemCount") _list path;
     index_size_bytes =
       option_of_yojson (value_for_key long_object_of_yojson "IndexSizeBytes") _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_description_of_yojson "ProvisionedThroughput")
         _list path;
     backfilling = option_of_yojson (value_for_key backfilling_of_yojson "Backfilling") _list path;
     index_status = option_of_yojson (value_for_key index_status_of_yojson "IndexStatus") _list path;
     projection = option_of_yojson (value_for_key projection_of_yojson "Projection") _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
   }
    : global_secondary_index_description)

let global_secondary_index_description_list_of_yojson tree path =
  list_of_yojson global_secondary_index_description_of_yojson tree path

let stream_enabled_of_yojson = bool_of_yojson

let stream_view_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KEYS_ONLY" -> KEYS_ONLY
    | `String "NEW_AND_OLD_IMAGES" -> NEW_AND_OLD_IMAGES
    | `String "OLD_IMAGE" -> OLD_IMAGE
    | `String "NEW_IMAGE" -> NEW_IMAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamViewType" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamViewType")
     : stream_view_type)
    : stream_view_type)

let stream_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_view_type =
       option_of_yojson (value_for_key stream_view_type_of_yojson "StreamViewType") _list path;
     stream_enabled = value_for_key stream_enabled_of_yojson "StreamEnabled" _list path;
   }
    : stream_specification)

let stream_arn_of_yojson = string_of_yojson
let replica_status_description_of_yojson = string_of_yojson
let replica_status_percent_progress_of_yojson = string_of_yojson
let kms_master_key_id_of_yojson = string_of_yojson

let provisioned_throughput_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ReadCapacityUnits")
         _list path;
   }
    : provisioned_throughput_override)

let on_demand_throughput_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_read_request_units =
       option_of_yojson (value_for_key long_object_of_yojson "MaxReadRequestUnits") _list path;
   }
    : on_demand_throughput_override)

let table_warm_throughput_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key table_status_of_yojson "Status") _list path;
     write_units_per_second =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "WriteUnitsPerSecond")
         _list path;
     read_units_per_second =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ReadUnitsPerSecond")
         _list path;
   }
    : table_warm_throughput_description)

let replica_global_secondary_index_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     warm_throughput =
       option_of_yojson
         (value_for_key global_secondary_index_warm_throughput_description_of_yojson
            "WarmThroughput")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_override_of_yojson "OnDemandThroughputOverride")
         _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_override_of_yojson "ProvisionedThroughputOverride")
         _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
   }
    : replica_global_secondary_index_description)

let replica_global_secondary_index_description_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_description_of_yojson tree path

let table_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD_INFREQUENT_ACCESS" -> STANDARD_INFREQUENT_ACCESS
    | `String "STANDARD" -> STANDARD
    | `String value -> raise (deserialize_unknown_enum_value_error path "TableClass" value)
    | _ -> raise (deserialize_wrong_type_error path "TableClass")
     : table_class)
    : table_class)

let table_class_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_update_date_time =
       option_of_yojson (value_for_key date_of_yojson "LastUpdateDateTime") _list path;
     table_class = option_of_yojson (value_for_key table_class_of_yojson "TableClass") _list path;
   }
    : table_class_summary)

let replica_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_table_class_summary =
       option_of_yojson
         (value_for_key table_class_summary_of_yojson "ReplicaTableClassSummary")
         _list path;
     replica_inaccessible_date_time =
       option_of_yojson (value_for_key date_of_yojson "ReplicaInaccessibleDateTime") _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key replica_global_secondary_index_description_list_of_yojson
            "GlobalSecondaryIndexes")
         _list path;
     warm_throughput =
       option_of_yojson
         (value_for_key table_warm_throughput_description_of_yojson "WarmThroughput")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_override_of_yojson "OnDemandThroughputOverride")
         _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_override_of_yojson "ProvisionedThroughputOverride")
         _list path;
     kms_master_key_id =
       option_of_yojson (value_for_key kms_master_key_id_of_yojson "KMSMasterKeyId") _list path;
     replica_status_percent_progress =
       option_of_yojson
         (value_for_key replica_status_percent_progress_of_yojson "ReplicaStatusPercentProgress")
         _list path;
     replica_status_description =
       option_of_yojson
         (value_for_key replica_status_description_of_yojson "ReplicaStatusDescription")
         _list path;
     replica_status =
       option_of_yojson (value_for_key replica_status_of_yojson "ReplicaStatus") _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
   }
    : replica_description)

let replica_description_list_of_yojson tree path =
  list_of_yojson replica_description_of_yojson tree path

let global_table_witness_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     witness_status =
       option_of_yojson (value_for_key witness_status_of_yojson "WitnessStatus") _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
   }
    : global_table_witness_description)

let global_table_witness_description_list_of_yojson tree path =
  list_of_yojson global_table_witness_description_of_yojson tree path

let backup_arn_of_yojson = string_of_yojson
let restore_in_progress_of_yojson = bool_of_yojson

let restore_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     restore_in_progress =
       value_for_key restore_in_progress_of_yojson "RestoreInProgress" _list path;
     restore_date_time = value_for_key date_of_yojson "RestoreDateTime" _list path;
     source_table_arn =
       option_of_yojson (value_for_key table_arn_of_yojson "SourceTableArn") _list path;
     source_backup_arn =
       option_of_yojson (value_for_key backup_arn_of_yojson "SourceBackupArn") _list path;
   }
    : restore_summary)

let sse_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATING" -> UPDATING
    | `String "DISABLED" -> DISABLED
    | `String "DISABLING" -> DISABLING
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SSEStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SSEStatus")
     : sse_status)
    : sse_status)

let sse_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS" -> KMS
    | `String "AES256" -> AES256
    | `String value -> raise (deserialize_unknown_enum_value_error path "SSEType" value)
    | _ -> raise (deserialize_wrong_type_error path "SSEType")
     : sse_type)
    : sse_type)

let kms_master_key_arn_of_yojson = string_of_yojson

let sse_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inaccessible_encryption_date_time =
       option_of_yojson (value_for_key date_of_yojson "InaccessibleEncryptionDateTime") _list path;
     kms_master_key_arn =
       option_of_yojson (value_for_key kms_master_key_arn_of_yojson "KMSMasterKeyArn") _list path;
     sse_type = option_of_yojson (value_for_key sse_type_of_yojson "SSEType") _list path;
     status = option_of_yojson (value_for_key sse_status_of_yojson "Status") _list path;
   }
    : sse_description)

let archival_reason_of_yojson = string_of_yojson

let archival_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     archival_backup_arn =
       option_of_yojson (value_for_key backup_arn_of_yojson "ArchivalBackupArn") _list path;
     archival_reason =
       option_of_yojson (value_for_key archival_reason_of_yojson "ArchivalReason") _list path;
     archival_date_time =
       option_of_yojson (value_for_key date_of_yojson "ArchivalDateTime") _list path;
   }
    : archival_summary)

let deletion_protection_enabled_of_yojson = bool_of_yojson

let multi_region_consistency_of_yojson (tree : t) path =
  ((match tree with
    | `String "STRONG" -> STRONG
    | `String "EVENTUAL" -> EVENTUAL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MultiRegionConsistency" value)
    | _ -> raise (deserialize_wrong_type_error path "MultiRegionConsistency")
     : multi_region_consistency)
    : multi_region_consistency)

let table_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_region_consistency =
       option_of_yojson
         (value_for_key multi_region_consistency_of_yojson "MultiRegionConsistency")
         _list path;
     warm_throughput =
       option_of_yojson
         (value_for_key table_warm_throughput_description_of_yojson "WarmThroughput")
         _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key deletion_protection_enabled_of_yojson "DeletionProtectionEnabled")
         _list path;
     table_class_summary =
       option_of_yojson (value_for_key table_class_summary_of_yojson "TableClassSummary") _list path;
     archival_summary =
       option_of_yojson (value_for_key archival_summary_of_yojson "ArchivalSummary") _list path;
     sse_description =
       option_of_yojson (value_for_key sse_description_of_yojson "SSEDescription") _list path;
     restore_summary =
       option_of_yojson (value_for_key restore_summary_of_yojson "RestoreSummary") _list path;
     global_table_witnesses =
       option_of_yojson
         (value_for_key global_table_witness_description_list_of_yojson "GlobalTableWitnesses")
         _list path;
     replicas =
       option_of_yojson (value_for_key replica_description_list_of_yojson "Replicas") _list path;
     global_table_version =
       option_of_yojson (value_for_key string__of_yojson "GlobalTableVersion") _list path;
     latest_stream_arn =
       option_of_yojson (value_for_key stream_arn_of_yojson "LatestStreamArn") _list path;
     latest_stream_label =
       option_of_yojson (value_for_key string__of_yojson "LatestStreamLabel") _list path;
     stream_specification =
       option_of_yojson
         (value_for_key stream_specification_of_yojson "StreamSpecification")
         _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key global_secondary_index_description_list_of_yojson "GlobalSecondaryIndexes")
         _list path;
     local_secondary_indexes =
       option_of_yojson
         (value_for_key local_secondary_index_description_list_of_yojson "LocalSecondaryIndexes")
         _list path;
     billing_mode_summary =
       option_of_yojson
         (value_for_key billing_mode_summary_of_yojson "BillingModeSummary")
         _list path;
     table_id = option_of_yojson (value_for_key table_id_of_yojson "TableId") _list path;
     table_arn = option_of_yojson (value_for_key string__of_yojson "TableArn") _list path;
     item_count = option_of_yojson (value_for_key long_object_of_yojson "ItemCount") _list path;
     table_size_bytes =
       option_of_yojson (value_for_key long_object_of_yojson "TableSizeBytes") _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_description_of_yojson "ProvisionedThroughput")
         _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationDateTime") _list path;
     table_status = option_of_yojson (value_for_key table_status_of_yojson "TableStatus") _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     attribute_definitions =
       option_of_yojson
         (value_for_key attribute_definitions_of_yojson "AttributeDefinitions")
         _list path;
   }
    : table_description)

let update_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_description =
       option_of_yojson (value_for_key table_description_of_yojson "TableDescription") _list path;
   }
    : update_table_output)

let provisioned_throughput_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     write_capacity_units =
       value_for_key positive_long_object_of_yojson "WriteCapacityUnits" _list path;
     read_capacity_units =
       value_for_key positive_long_object_of_yojson "ReadCapacityUnits" _list path;
   }
    : provisioned_throughput)

let update_global_secondary_index_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     warm_throughput =
       option_of_yojson (value_for_key warm_throughput_of_yojson "WarmThroughput") _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
   }
    : update_global_secondary_index_action)

let create_global_secondary_index_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     warm_throughput =
       option_of_yojson (value_for_key warm_throughput_of_yojson "WarmThroughput") _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     projection = value_for_key projection_of_yojson "Projection" _list path;
     key_schema = value_for_key key_schema_of_yojson "KeySchema" _list path;
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
   }
    : create_global_secondary_index_action)

let delete_global_secondary_index_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ index_name = value_for_key index_name_of_yojson "IndexName" _list path }
    : delete_global_secondary_index_action)

let global_secondary_index_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete =
       option_of_yojson
         (value_for_key delete_global_secondary_index_action_of_yojson "Delete")
         _list path;
     create =
       option_of_yojson
         (value_for_key create_global_secondary_index_action_of_yojson "Create")
         _list path;
     update =
       option_of_yojson
         (value_for_key update_global_secondary_index_action_of_yojson "Update")
         _list path;
   }
    : global_secondary_index_update)

let global_secondary_index_update_list_of_yojson tree path =
  list_of_yojson global_secondary_index_update_of_yojson tree path

let sse_enabled_of_yojson = bool_of_yojson

let sse_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_master_key_id =
       option_of_yojson (value_for_key kms_master_key_id_of_yojson "KMSMasterKeyId") _list path;
     sse_type = option_of_yojson (value_for_key sse_type_of_yojson "SSEType") _list path;
     enabled = option_of_yojson (value_for_key sse_enabled_of_yojson "Enabled") _list path;
   }
    : sse_specification)

let replica_global_secondary_index_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_override_of_yojson "OnDemandThroughputOverride")
         _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_override_of_yojson "ProvisionedThroughputOverride")
         _list path;
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
   }
    : replica_global_secondary_index)

let replica_global_secondary_index_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_of_yojson tree path

let create_replication_group_member_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_class_override =
       option_of_yojson (value_for_key table_class_of_yojson "TableClassOverride") _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key replica_global_secondary_index_list_of_yojson "GlobalSecondaryIndexes")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_override_of_yojson "OnDemandThroughputOverride")
         _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_override_of_yojson "ProvisionedThroughputOverride")
         _list path;
     kms_master_key_id =
       option_of_yojson (value_for_key kms_master_key_id_of_yojson "KMSMasterKeyId") _list path;
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
   }
    : create_replication_group_member_action)

let update_replication_group_member_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_class_override =
       option_of_yojson (value_for_key table_class_of_yojson "TableClassOverride") _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key replica_global_secondary_index_list_of_yojson "GlobalSecondaryIndexes")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_override_of_yojson "OnDemandThroughputOverride")
         _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_override_of_yojson "ProvisionedThroughputOverride")
         _list path;
     kms_master_key_id =
       option_of_yojson (value_for_key kms_master_key_id_of_yojson "KMSMasterKeyId") _list path;
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
   }
    : update_replication_group_member_action)

let delete_replication_group_member_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = value_for_key region_name_of_yojson "RegionName" _list path }
    : delete_replication_group_member_action)

let replication_group_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete =
       option_of_yojson
         (value_for_key delete_replication_group_member_action_of_yojson "Delete")
         _list path;
     update =
       option_of_yojson
         (value_for_key update_replication_group_member_action_of_yojson "Update")
         _list path;
     create =
       option_of_yojson
         (value_for_key create_replication_group_member_action_of_yojson "Create")
         _list path;
   }
    : replication_group_update)

let replication_group_update_list_of_yojson tree path =
  list_of_yojson replication_group_update_of_yojson tree path

let create_global_table_witness_group_member_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = value_for_key region_name_of_yojson "RegionName" _list path }
    : create_global_table_witness_group_member_action)

let delete_global_table_witness_group_member_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = value_for_key region_name_of_yojson "RegionName" _list path }
    : delete_global_table_witness_group_member_action)

let global_table_witness_group_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete =
       option_of_yojson
         (value_for_key delete_global_table_witness_group_member_action_of_yojson "Delete")
         _list path;
     create =
       option_of_yojson
         (value_for_key create_global_table_witness_group_member_action_of_yojson "Create")
         _list path;
   }
    : global_table_witness_group_update)

let global_table_witness_group_update_list_of_yojson tree path =
  list_of_yojson global_table_witness_group_update_of_yojson tree path

let update_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     warm_throughput =
       option_of_yojson (value_for_key warm_throughput_of_yojson "WarmThroughput") _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     global_table_witness_updates =
       option_of_yojson
         (value_for_key global_table_witness_group_update_list_of_yojson "GlobalTableWitnessUpdates")
         _list path;
     multi_region_consistency =
       option_of_yojson
         (value_for_key multi_region_consistency_of_yojson "MultiRegionConsistency")
         _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key deletion_protection_enabled_of_yojson "DeletionProtectionEnabled")
         _list path;
     table_class = option_of_yojson (value_for_key table_class_of_yojson "TableClass") _list path;
     replica_updates =
       option_of_yojson
         (value_for_key replication_group_update_list_of_yojson "ReplicaUpdates")
         _list path;
     sse_specification =
       option_of_yojson (value_for_key sse_specification_of_yojson "SSESpecification") _list path;
     stream_specification =
       option_of_yojson
         (value_for_key stream_specification_of_yojson "StreamSpecification")
         _list path;
     global_secondary_index_updates =
       option_of_yojson
         (value_for_key global_secondary_index_update_list_of_yojson "GlobalSecondaryIndexUpdates")
         _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     attribute_definitions =
       option_of_yojson
         (value_for_key attribute_definitions_of_yojson "AttributeDefinitions")
         _list path;
   }
    : update_table_input)

let destination_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATING" -> UPDATING
    | `String "ENABLE_FAILED" -> ENABLE_FAILED
    | `String "DISABLED" -> DISABLED
    | `String "DISABLING" -> DISABLING
    | `String "ACTIVE" -> ACTIVE
    | `String "ENABLING" -> ENABLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "DestinationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DestinationStatus")
     : destination_status)
    : destination_status)

let approximate_creation_date_time_precision_of_yojson (tree : t) path =
  ((match tree with
    | `String "MICROSECOND" -> MICROSECOND
    | `String "MILLISECOND" -> MILLISECOND
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ApproximateCreationDateTimePrecision" value)
    | _ -> raise (deserialize_wrong_type_error path "ApproximateCreationDateTimePrecision")
     : approximate_creation_date_time_precision)
    : approximate_creation_date_time_precision)

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
     update_kinesis_streaming_configuration =
       option_of_yojson
         (value_for_key update_kinesis_streaming_configuration_of_yojson
            "UpdateKinesisStreamingConfiguration")
         _list path;
     destination_status =
       option_of_yojson (value_for_key destination_status_of_yojson "DestinationStatus") _list path;
     stream_arn = option_of_yojson (value_for_key stream_arn_of_yojson "StreamArn") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
   }
    : update_kinesis_streaming_destination_output)

let update_kinesis_streaming_destination_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_kinesis_streaming_configuration =
       option_of_yojson
         (value_for_key update_kinesis_streaming_configuration_of_yojson
            "UpdateKinesisStreamingConfiguration")
         _list path;
     stream_arn = value_for_key stream_arn_of_yojson "StreamArn" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : update_kinesis_streaming_destination_input)

let attribute_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let consumed_capacity_units_of_yojson = double_of_yojson

let capacity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_units =
       option_of_yojson (value_for_key consumed_capacity_units_of_yojson "CapacityUnits") _list path;
     write_capacity_units =
       option_of_yojson
         (value_for_key consumed_capacity_units_of_yojson "WriteCapacityUnits")
         _list path;
     read_capacity_units =
       option_of_yojson
         (value_for_key consumed_capacity_units_of_yojson "ReadCapacityUnits")
         _list path;
   }
    : capacity)

let secondary_indexes_capacity_map_of_yojson tree path =
  map_of_yojson index_name_of_yojson capacity_of_yojson tree path

let consumed_capacity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_secondary_indexes =
       option_of_yojson
         (value_for_key secondary_indexes_capacity_map_of_yojson "GlobalSecondaryIndexes")
         _list path;
     local_secondary_indexes =
       option_of_yojson
         (value_for_key secondary_indexes_capacity_map_of_yojson "LocalSecondaryIndexes")
         _list path;
     table = option_of_yojson (value_for_key capacity_of_yojson "Table") _list path;
     write_capacity_units =
       option_of_yojson
         (value_for_key consumed_capacity_units_of_yojson "WriteCapacityUnits")
         _list path;
     read_capacity_units =
       option_of_yojson
         (value_for_key consumed_capacity_units_of_yojson "ReadCapacityUnits")
         _list path;
     capacity_units =
       option_of_yojson (value_for_key consumed_capacity_units_of_yojson "CapacityUnits") _list path;
     table_name = option_of_yojson (value_for_key table_arn_of_yojson "TableName") _list path;
   }
    : consumed_capacity)

let item_collection_key_attribute_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let item_collection_size_estimate_bound_of_yojson = double_of_yojson

let item_collection_size_estimate_range_of_yojson tree path =
  list_of_yojson item_collection_size_estimate_bound_of_yojson tree path

let item_collection_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     size_estimate_range_g_b =
       option_of_yojson
         (value_for_key item_collection_size_estimate_range_of_yojson "SizeEstimateRangeGB")
         _list path;
     item_collection_key =
       option_of_yojson
         (value_for_key item_collection_key_attribute_map_of_yojson "ItemCollectionKey")
         _list path;
   }
    : item_collection_metrics)

let update_item_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item_collection_metrics =
       option_of_yojson
         (value_for_key item_collection_metrics_of_yojson "ItemCollectionMetrics")
         _list path;
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
     attributes = option_of_yojson (value_for_key attribute_map_of_yojson "Attributes") _list path;
   }
    : update_item_output)

let attribute_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETE" -> DELETE
    | `String "PUT" -> PUT
    | `String "ADD" -> ADD
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttributeAction" value)
    | _ -> raise (deserialize_wrong_type_error path "AttributeAction")
     : attribute_action)
    : attribute_action)

let attribute_value_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = option_of_yojson (value_for_key attribute_action_of_yojson "Action") _list path;
     value = option_of_yojson (value_for_key attribute_value_of_yojson "Value") _list path;
   }
    : attribute_value_update)

let attribute_updates_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_update_of_yojson tree path

let comparison_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "BEGINS_WITH" -> BEGINS_WITH
    | `String "NOT_CONTAINS" -> NOT_CONTAINS
    | `String "CONTAINS" -> CONTAINS
    | `String "NULL" -> NULL
    | `String "NOT_NULL" -> NOT_NULL
    | `String "BETWEEN" -> BETWEEN
    | `String "GT" -> GT
    | `String "GE" -> GE
    | `String "LT" -> LT
    | `String "LE" -> LE
    | `String "IN" -> IN
    | `String "NE" -> NE
    | `String "EQ" -> EQ
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")
     : comparison_operator)
    : comparison_operator)

let attribute_value_list_of_yojson tree path = list_of_yojson attribute_value_of_yojson tree path

let expected_attribute_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_value_list =
       option_of_yojson
         (value_for_key attribute_value_list_of_yojson "AttributeValueList")
         _list path;
     comparison_operator =
       option_of_yojson
         (value_for_key comparison_operator_of_yojson "ComparisonOperator")
         _list path;
     exists = option_of_yojson (value_for_key boolean_object_of_yojson "Exists") _list path;
     value = option_of_yojson (value_for_key attribute_value_of_yojson "Value") _list path;
   }
    : expected_attribute_value)

let expected_attribute_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson expected_attribute_value_of_yojson tree path

let conditional_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "OR" -> OR
    | `String "AND" -> AND
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConditionalOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ConditionalOperator")
     : conditional_operator)
    : conditional_operator)

let return_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATED_NEW" -> UPDATED_NEW
    | `String "ALL_NEW" -> ALL_NEW
    | `String "UPDATED_OLD" -> UPDATED_OLD
    | `String "ALL_OLD" -> ALL_OLD
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReturnValue" value)
    | _ -> raise (deserialize_wrong_type_error path "ReturnValue")
     : return_value)
    : return_value)

let return_consumed_capacity_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "TOTAL" -> TOTAL
    | `String "INDEXES" -> INDEXES
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReturnConsumedCapacity" value)
    | _ -> raise (deserialize_wrong_type_error path "ReturnConsumedCapacity")
     : return_consumed_capacity)
    : return_consumed_capacity)

let return_item_collection_metrics_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "SIZE" -> SIZE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReturnItemCollectionMetrics" value)
    | _ -> raise (deserialize_wrong_type_error path "ReturnItemCollectionMetrics")
     : return_item_collection_metrics)
    : return_item_collection_metrics)

let update_expression_of_yojson = string_of_yojson
let condition_expression_of_yojson = string_of_yojson
let expression_attribute_name_variable_of_yojson = string_of_yojson

let expression_attribute_name_map_of_yojson tree path =
  map_of_yojson expression_attribute_name_variable_of_yojson attribute_name_of_yojson tree path

let expression_attribute_value_variable_of_yojson = string_of_yojson

let expression_attribute_value_map_of_yojson tree path =
  map_of_yojson expression_attribute_value_variable_of_yojson attribute_value_of_yojson tree path

let return_values_on_condition_check_failure_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "ALL_OLD" -> ALL_OLD
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ReturnValuesOnConditionCheckFailure" value)
    | _ -> raise (deserialize_wrong_type_error path "ReturnValuesOnConditionCheckFailure")
     : return_values_on_condition_check_failure)
    : return_values_on_condition_check_failure)

let update_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     update_expression =
       option_of_yojson (value_for_key update_expression_of_yojson "UpdateExpression") _list path;
     return_item_collection_metrics =
       option_of_yojson
         (value_for_key return_item_collection_metrics_of_yojson "ReturnItemCollectionMetrics")
         _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     return_values =
       option_of_yojson (value_for_key return_value_of_yojson "ReturnValues") _list path;
     conditional_operator =
       option_of_yojson
         (value_for_key conditional_operator_of_yojson "ConditionalOperator")
         _list path;
     expected =
       option_of_yojson (value_for_key expected_attribute_map_of_yojson "Expected") _list path;
     attribute_updates =
       option_of_yojson (value_for_key attribute_updates_of_yojson "AttributeUpdates") _list path;
     key = value_for_key key_of_yojson "Key" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : update_item_input)

let transaction_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : transaction_conflict_exception)

let request_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : request_limit_exceeded)

let replicated_write_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : replicated_write_conflict_exception)

let provisioned_throughput_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : provisioned_throughput_exceeded_exception)

let item_collection_size_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : item_collection_size_limit_exceeded_exception)

let conditional_check_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
   }
    : conditional_check_failed_exception)

let replica_global_secondary_index_settings_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioned_write_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ProvisionedWriteCapacityAutoScalingSettings")
         _list path;
     provisioned_write_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ProvisionedWriteCapacityUnits")
         _list path;
     provisioned_read_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ProvisionedReadCapacityAutoScalingSettings")
         _list path;
     provisioned_read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ProvisionedReadCapacityUnits")
         _list path;
     index_status = option_of_yojson (value_for_key index_status_of_yojson "IndexStatus") _list path;
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
   }
    : replica_global_secondary_index_settings_description)

let replica_global_secondary_index_settings_description_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_settings_description_of_yojson tree path

let replica_settings_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_table_class_summary =
       option_of_yojson
         (value_for_key table_class_summary_of_yojson "ReplicaTableClassSummary")
         _list path;
     replica_global_secondary_index_settings =
       option_of_yojson
         (value_for_key replica_global_secondary_index_settings_description_list_of_yojson
            "ReplicaGlobalSecondaryIndexSettings")
         _list path;
     replica_provisioned_write_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ReplicaProvisionedWriteCapacityAutoScalingSettings")
         _list path;
     replica_provisioned_write_capacity_units =
       option_of_yojson
         (value_for_key non_negative_long_object_of_yojson "ReplicaProvisionedWriteCapacityUnits")
         _list path;
     replica_provisioned_read_capacity_auto_scaling_settings =
       option_of_yojson
         (value_for_key auto_scaling_settings_description_of_yojson
            "ReplicaProvisionedReadCapacityAutoScalingSettings")
         _list path;
     replica_provisioned_read_capacity_units =
       option_of_yojson
         (value_for_key non_negative_long_object_of_yojson "ReplicaProvisionedReadCapacityUnits")
         _list path;
     replica_billing_mode_summary =
       option_of_yojson
         (value_for_key billing_mode_summary_of_yojson "ReplicaBillingModeSummary")
         _list path;
     replica_status =
       option_of_yojson (value_for_key replica_status_of_yojson "ReplicaStatus") _list path;
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
   }
    : replica_settings_description)

let replica_settings_description_list_of_yojson tree path =
  list_of_yojson replica_settings_description_of_yojson tree path

let update_global_table_settings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_settings =
       option_of_yojson
         (value_for_key replica_settings_description_list_of_yojson "ReplicaSettings")
         _list path;
     global_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "GlobalTableName") _list path;
   }
    : update_global_table_settings_output)

let global_table_global_secondary_index_settings_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioned_write_capacity_auto_scaling_settings_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ProvisionedWriteCapacityAutoScalingSettingsUpdate")
         _list path;
     provisioned_write_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ProvisionedWriteCapacityUnits")
         _list path;
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
   }
    : global_table_global_secondary_index_settings_update)

let global_table_global_secondary_index_settings_update_list_of_yojson tree path =
  list_of_yojson global_table_global_secondary_index_settings_update_of_yojson tree path

let replica_global_secondary_index_settings_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provisioned_read_capacity_auto_scaling_settings_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ProvisionedReadCapacityAutoScalingSettingsUpdate")
         _list path;
     provisioned_read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ProvisionedReadCapacityUnits")
         _list path;
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
   }
    : replica_global_secondary_index_settings_update)

let replica_global_secondary_index_settings_update_list_of_yojson tree path =
  list_of_yojson replica_global_secondary_index_settings_update_of_yojson tree path

let replica_settings_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_table_class =
       option_of_yojson (value_for_key table_class_of_yojson "ReplicaTableClass") _list path;
     replica_global_secondary_index_settings_update =
       option_of_yojson
         (value_for_key replica_global_secondary_index_settings_update_list_of_yojson
            "ReplicaGlobalSecondaryIndexSettingsUpdate")
         _list path;
     replica_provisioned_read_capacity_auto_scaling_settings_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate")
         _list path;
     replica_provisioned_read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "ReplicaProvisionedReadCapacityUnits")
         _list path;
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
   }
    : replica_settings_update)

let replica_settings_update_list_of_yojson tree path =
  list_of_yojson replica_settings_update_of_yojson tree path

let update_global_table_settings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_settings_update =
       option_of_yojson
         (value_for_key replica_settings_update_list_of_yojson "ReplicaSettingsUpdate")
         _list path;
     global_table_global_secondary_index_settings_update =
       option_of_yojson
         (value_for_key global_table_global_secondary_index_settings_update_list_of_yojson
            "GlobalTableGlobalSecondaryIndexSettingsUpdate")
         _list path;
     global_table_provisioned_write_capacity_auto_scaling_settings_update =
       option_of_yojson
         (value_for_key auto_scaling_settings_update_of_yojson
            "GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate")
         _list path;
     global_table_provisioned_write_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "GlobalTableProvisionedWriteCapacityUnits")
         _list path;
     global_table_billing_mode =
       option_of_yojson (value_for_key billing_mode_of_yojson "GlobalTableBillingMode") _list path;
     global_table_name = value_for_key table_name_of_yojson "GlobalTableName" _list path;
   }
    : update_global_table_settings_input)

let replica_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : replica_not_found_exception)

let index_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : index_not_found_exception)

let global_table_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : global_table_not_found_exception)

let global_table_arn_string_of_yojson = string_of_yojson

let global_table_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "GlobalTableStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "GlobalTableStatus")
     : global_table_status)
    : global_table_status)

let global_table_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "GlobalTableName") _list path;
     global_table_status =
       option_of_yojson (value_for_key global_table_status_of_yojson "GlobalTableStatus") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationDateTime") _list path;
     global_table_arn =
       option_of_yojson
         (value_for_key global_table_arn_string_of_yojson "GlobalTableArn")
         _list path;
     replication_group =
       option_of_yojson
         (value_for_key replica_description_list_of_yojson "ReplicationGroup")
         _list path;
   }
    : global_table_description)

let update_global_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_description =
       option_of_yojson
         (value_for_key global_table_description_of_yojson "GlobalTableDescription")
         _list path;
   }
    : update_global_table_output)

let create_replica_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = value_for_key region_name_of_yojson "RegionName" _list path }
    : create_replica_action)

let delete_replica_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = value_for_key region_name_of_yojson "RegionName" _list path }
    : delete_replica_action)

let replica_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete = option_of_yojson (value_for_key delete_replica_action_of_yojson "Delete") _list path;
     create = option_of_yojson (value_for_key create_replica_action_of_yojson "Create") _list path;
   }
    : replica_update)

let replica_update_list_of_yojson tree path = list_of_yojson replica_update_of_yojson tree path

let update_global_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_updates = value_for_key replica_update_list_of_yojson "ReplicaUpdates" _list path;
     global_table_name = value_for_key table_name_of_yojson "GlobalTableName" _list path;
   }
    : update_global_table_input)

let table_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : table_not_found_exception)

let replica_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : replica_already_exists_exception)

let contributor_insights_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "DISABLED" -> DISABLED
    | `String "DISABLING" -> DISABLING
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContributorInsightsStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContributorInsightsStatus")
     : contributor_insights_status)
    : contributor_insights_status)

let update_contributor_insights_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contributor_insights_status =
       option_of_yojson
         (value_for_key contributor_insights_status_of_yojson "ContributorInsightsStatus")
         _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
   }
    : update_contributor_insights_output)

let contributor_insights_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLE" -> DISABLE
    | `String "ENABLE" -> ENABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContributorInsightsAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ContributorInsightsAction")
     : contributor_insights_action)
    : contributor_insights_action)

let update_contributor_insights_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contributor_insights_action =
       value_for_key contributor_insights_action_of_yojson "ContributorInsightsAction" _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : update_contributor_insights_input)

let continuous_backups_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContinuousBackupsStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContinuousBackupsStatus")
     : continuous_backups_status)
    : continuous_backups_status)

let point_in_time_recovery_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PointInTimeRecoveryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PointInTimeRecoveryStatus")
     : point_in_time_recovery_status)
    : point_in_time_recovery_status)

let recovery_period_in_days_of_yojson = int_of_yojson

let point_in_time_recovery_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_restorable_date_time =
       option_of_yojson (value_for_key date_of_yojson "LatestRestorableDateTime") _list path;
     earliest_restorable_date_time =
       option_of_yojson (value_for_key date_of_yojson "EarliestRestorableDateTime") _list path;
     recovery_period_in_days =
       option_of_yojson
         (value_for_key recovery_period_in_days_of_yojson "RecoveryPeriodInDays")
         _list path;
     point_in_time_recovery_status =
       option_of_yojson
         (value_for_key point_in_time_recovery_status_of_yojson "PointInTimeRecoveryStatus")
         _list path;
   }
    : point_in_time_recovery_description)

let continuous_backups_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     point_in_time_recovery_description =
       option_of_yojson
         (value_for_key point_in_time_recovery_description_of_yojson
            "PointInTimeRecoveryDescription")
         _list path;
     continuous_backups_status =
       value_for_key continuous_backups_status_of_yojson "ContinuousBackupsStatus" _list path;
   }
    : continuous_backups_description)

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
     recovery_period_in_days =
       option_of_yojson
         (value_for_key recovery_period_in_days_of_yojson "RecoveryPeriodInDays")
         _list path;
     point_in_time_recovery_enabled =
       value_for_key boolean_object_of_yojson "PointInTimeRecoveryEnabled" _list path;
   }
    : point_in_time_recovery_specification)

let update_continuous_backups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     point_in_time_recovery_specification =
       value_for_key point_in_time_recovery_specification_of_yojson
         "PointInTimeRecoverySpecification" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : update_continuous_backups_input)

let continuous_backups_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : continuous_backups_unavailable_exception)

let update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     update_expression = value_for_key update_expression_of_yojson "UpdateExpression" _list path;
     key = value_for_key key_of_yojson "Key" _list path;
   }
    : update)

let resource_arn_string_of_yojson = string_of_yojson
let tag_key_string_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_string_of_yojson tree path

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_input)

let transaction_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : transaction_in_progress_exception)

let code_of_yojson = string_of_yojson

let cancellation_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key code_of_yojson "Code") _list path;
     item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path;
   }
    : cancellation_reason)

let cancellation_reason_list_of_yojson tree path =
  list_of_yojson cancellation_reason_of_yojson tree path

let transaction_canceled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cancellation_reasons =
       option_of_yojson
         (value_for_key cancellation_reason_list_of_yojson "CancellationReasons")
         _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : transaction_canceled_exception)

let consumed_capacity_multiple_of_yojson tree path =
  list_of_yojson consumed_capacity_of_yojson tree path

let item_collection_metrics_multiple_of_yojson tree path =
  list_of_yojson item_collection_metrics_of_yojson tree path

let item_collection_metrics_per_table_of_yojson tree path =
  map_of_yojson table_arn_of_yojson item_collection_metrics_multiple_of_yojson tree path

let transact_write_items_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item_collection_metrics =
       option_of_yojson
         (value_for_key item_collection_metrics_per_table_of_yojson "ItemCollectionMetrics")
         _list path;
     consumed_capacity =
       option_of_yojson
         (value_for_key consumed_capacity_multiple_of_yojson "ConsumedCapacity")
         _list path;
   }
    : transact_write_items_output)

let condition_check_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     condition_expression =
       value_for_key condition_expression_of_yojson "ConditionExpression" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     key = value_for_key key_of_yojson "Key" _list path;
   }
    : condition_check)

let put_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     item = value_for_key put_item_input_attribute_map_of_yojson "Item" _list path;
   }
    : put)

let delete_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     key = value_for_key key_of_yojson "Key" _list path;
   }
    : delete)

let transact_write_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update = option_of_yojson (value_for_key update_of_yojson "Update") _list path;
     delete = option_of_yojson (value_for_key delete_of_yojson "Delete") _list path;
     put = option_of_yojson (value_for_key put_of_yojson "Put") _list path;
     condition_check =
       option_of_yojson (value_for_key condition_check_of_yojson "ConditionCheck") _list path;
   }
    : transact_write_item)

let transact_write_item_list_of_yojson tree path =
  list_of_yojson transact_write_item_of_yojson tree path

let client_request_token_of_yojson = string_of_yojson

let transact_write_items_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     return_item_collection_metrics =
       option_of_yojson
         (value_for_key return_item_collection_metrics_of_yojson "ReturnItemCollectionMetrics")
         _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     transact_items = value_for_key transact_write_item_list_of_yojson "TransactItems" _list path;
   }
    : transact_write_items_input)

let idempotent_parameter_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : idempotent_parameter_mismatch_exception)

let item_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path }
    : item_response)

let item_response_list_of_yojson tree path = list_of_yojson item_response_of_yojson tree path

let transact_get_items_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     responses =
       option_of_yojson (value_for_key item_response_list_of_yojson "Responses") _list path;
     consumed_capacity =
       option_of_yojson
         (value_for_key consumed_capacity_multiple_of_yojson "ConsumedCapacity")
         _list path;
   }
    : transact_get_items_output)

let projection_expression_of_yojson = string_of_yojson

let get_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     projection_expression =
       option_of_yojson
         (value_for_key projection_expression_of_yojson "ProjectionExpression")
         _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     key = value_for_key key_of_yojson "Key" _list path;
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
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     transact_items = value_for_key transact_get_item_list_of_yojson "TransactItems" _list path;
   }
    : transact_get_items_input)

let time_to_live_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String "DISABLING" -> DISABLING
    | `String "ENABLING" -> ENABLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "TimeToLiveStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeToLiveStatus")
     : time_to_live_status)
    : time_to_live_status)

let time_to_live_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name =
       option_of_yojson
         (value_for_key time_to_live_attribute_name_of_yojson "AttributeName")
         _list path;
     time_to_live_status =
       option_of_yojson (value_for_key time_to_live_status_of_yojson "TimeToLiveStatus") _list path;
   }
    : time_to_live_description)

let time_range_upper_bound_of_yojson = timestamp_epoch_seconds_of_yojson
let time_range_lower_bound_of_yojson = timestamp_epoch_seconds_of_yojson
let tag_value_string_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_string_of_yojson "Value" _list path;
     key = value_for_key tag_key_string_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_input)

let table_name_list_of_yojson tree path = list_of_yojson table_name_of_yojson tree path

let table_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : table_in_use_exception)

let global_secondary_index_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     warm_throughput =
       option_of_yojson (value_for_key warm_throughput_of_yojson "WarmThroughput") _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     projection = value_for_key projection_of_yojson "Projection" _list path;
     key_schema = value_for_key key_schema_of_yojson "KeySchema" _list path;
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
   }
    : global_secondary_index)

let global_secondary_index_list_of_yojson tree path =
  list_of_yojson global_secondary_index_of_yojson tree path

let table_creation_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_secondary_indexes =
       option_of_yojson
         (value_for_key global_secondary_index_list_of_yojson "GlobalSecondaryIndexes")
         _list path;
     sse_specification =
       option_of_yojson (value_for_key sse_specification_of_yojson "SSESpecification") _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     key_schema = value_for_key key_schema_of_yojson "KeySchema" _list path;
     attribute_definitions =
       value_for_key attribute_definitions_of_yojson "AttributeDefinitions" _list path;
     table_name = value_for_key table_name_of_yojson "TableName" _list path;
   }
    : table_creation_parameters)

let table_creation_date_time_of_yojson = timestamp_epoch_seconds_of_yojson

let table_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : table_already_exists_exception)

let local_secondary_index_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     projection = option_of_yojson (value_for_key projection_of_yojson "Projection") _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
   }
    : local_secondary_index_info)

let local_secondary_indexes_of_yojson tree path =
  list_of_yojson local_secondary_index_info_of_yojson tree path

let global_secondary_index_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     projection = option_of_yojson (value_for_key projection_of_yojson "Projection") _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
   }
    : global_secondary_index_info)

let global_secondary_indexes_of_yojson tree path =
  list_of_yojson global_secondary_index_info_of_yojson tree path

let source_table_feature_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sse_description =
       option_of_yojson (value_for_key sse_description_of_yojson "SSEDescription") _list path;
     time_to_live_description =
       option_of_yojson
         (value_for_key time_to_live_description_of_yojson "TimeToLiveDescription")
         _list path;
     stream_description =
       option_of_yojson
         (value_for_key stream_specification_of_yojson "StreamDescription")
         _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key global_secondary_indexes_of_yojson "GlobalSecondaryIndexes")
         _list path;
     local_secondary_indexes =
       option_of_yojson
         (value_for_key local_secondary_indexes_of_yojson "LocalSecondaryIndexes")
         _list path;
   }
    : source_table_feature_details)

let item_count_of_yojson = long_of_yojson

let source_table_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     item_count = option_of_yojson (value_for_key item_count_of_yojson "ItemCount") _list path;
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     provisioned_throughput =
       value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput" _list path;
     table_creation_date_time =
       value_for_key table_creation_date_time_of_yojson "TableCreationDateTime" _list path;
     key_schema = value_for_key key_schema_of_yojson "KeySchema" _list path;
     table_size_bytes =
       option_of_yojson (value_for_key long_object_of_yojson "TableSizeBytes") _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     table_id = value_for_key table_id_of_yojson "TableId" _list path;
     table_name = value_for_key table_name_of_yojson "TableName" _list path;
   }
    : source_table_details)

let select_of_yojson (tree : t) path =
  ((match tree with
    | `String "COUNT" -> COUNT
    | `String "SPECIFIC_ATTRIBUTES" -> SPECIFIC_ATTRIBUTES
    | `String "ALL_PROJECTED_ATTRIBUTES" -> ALL_PROJECTED_ATTRIBUTES
    | `String "ALL_ATTRIBUTES" -> ALL_ATTRIBUTES
    | `String value -> raise (deserialize_unknown_enum_value_error path "Select" value)
    | _ -> raise (deserialize_wrong_type_error path "Select")
     : select)
    : select)

let scan_total_segments_of_yojson = int_of_yojson
let scan_segment_of_yojson = int_of_yojson
let item_list_of_yojson tree path = list_of_yojson attribute_map_of_yojson tree path
let integer_of_yojson = int_of_yojson

let scan_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
     last_evaluated_key =
       option_of_yojson (value_for_key key_of_yojson "LastEvaluatedKey") _list path;
     scanned_count = option_of_yojson (value_for_key integer_of_yojson "ScannedCount") _list path;
     count = option_of_yojson (value_for_key integer_of_yojson "Count") _list path;
     items = option_of_yojson (value_for_key item_list_of_yojson "Items") _list path;
   }
    : scan_output)

let attribute_name_list_of_yojson tree path = list_of_yojson attribute_name_of_yojson tree path
let positive_integer_object_of_yojson = int_of_yojson

let condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comparison_operator =
       value_for_key comparison_operator_of_yojson "ComparisonOperator" _list path;
     attribute_value_list =
       option_of_yojson
         (value_for_key attribute_value_list_of_yojson "AttributeValueList")
         _list path;
   }
    : condition)

let filter_condition_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson condition_of_yojson tree path

let consistent_read_of_yojson = bool_of_yojson

let scan_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     filter_expression =
       option_of_yojson (value_for_key condition_expression_of_yojson "FilterExpression") _list path;
     projection_expression =
       option_of_yojson
         (value_for_key projection_expression_of_yojson "ProjectionExpression")
         _list path;
     segment = option_of_yojson (value_for_key scan_segment_of_yojson "Segment") _list path;
     total_segments =
       option_of_yojson (value_for_key scan_total_segments_of_yojson "TotalSegments") _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     exclusive_start_key =
       option_of_yojson (value_for_key key_of_yojson "ExclusiveStartKey") _list path;
     conditional_operator =
       option_of_yojson
         (value_for_key conditional_operator_of_yojson "ConditionalOperator")
         _list path;
     scan_filter =
       option_of_yojson (value_for_key filter_condition_map_of_yojson "ScanFilter") _list path;
     select = option_of_yojson (value_for_key select_of_yojson "Select") _list path;
     limit = option_of_yojson (value_for_key positive_integer_object_of_yojson "Limit") _list path;
     attributes_to_get =
       option_of_yojson (value_for_key attribute_name_list_of_yojson "AttributesToGet") _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : scan_input)

let s3_sse_kms_key_id_of_yojson = string_of_yojson

let s3_sse_algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS" -> KMS
    | `String "AES256" -> AES256
    | `String value -> raise (deserialize_unknown_enum_value_error path "S3SseAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "S3SseAlgorithm")
     : s3_sse_algorithm)
    : s3_sse_algorithm)

let s3_prefix_of_yojson = string_of_yojson
let s3_bucket_owner_of_yojson = string_of_yojson
let s3_bucket_of_yojson = string_of_yojson

let s3_bucket_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_key_prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "S3KeyPrefix") _list path;
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
     s3_bucket_owner =
       option_of_yojson (value_for_key s3_bucket_owner_of_yojson "S3BucketOwner") _list path;
   }
    : s3_bucket_source)

let restore_table_to_point_in_time_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_description =
       option_of_yojson (value_for_key table_description_of_yojson "TableDescription") _list path;
   }
    : restore_table_to_point_in_time_output)

let local_secondary_index_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     projection = value_for_key projection_of_yojson "Projection" _list path;
     key_schema = value_for_key key_schema_of_yojson "KeySchema" _list path;
     index_name = value_for_key index_name_of_yojson "IndexName" _list path;
   }
    : local_secondary_index)

let local_secondary_index_list_of_yojson tree path =
  list_of_yojson local_secondary_index_of_yojson tree path

let restore_table_to_point_in_time_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sse_specification_override =
       option_of_yojson
         (value_for_key sse_specification_of_yojson "SSESpecificationOverride")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughputOverride")
         _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughputOverride")
         _list path;
     local_secondary_index_override =
       option_of_yojson
         (value_for_key local_secondary_index_list_of_yojson "LocalSecondaryIndexOverride")
         _list path;
     global_secondary_index_override =
       option_of_yojson
         (value_for_key global_secondary_index_list_of_yojson "GlobalSecondaryIndexOverride")
         _list path;
     billing_mode_override =
       option_of_yojson (value_for_key billing_mode_of_yojson "BillingModeOverride") _list path;
     restore_date_time =
       option_of_yojson (value_for_key date_of_yojson "RestoreDateTime") _list path;
     use_latest_restorable_time =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "UseLatestRestorableTime")
         _list path;
     target_table_name = value_for_key table_name_of_yojson "TargetTableName" _list path;
     source_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "SourceTableName") _list path;
     source_table_arn =
       option_of_yojson (value_for_key table_arn_of_yojson "SourceTableArn") _list path;
   }
    : restore_table_to_point_in_time_input)

let point_in_time_recovery_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : point_in_time_recovery_unavailable_exception)

let invalid_restore_time_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_restore_time_exception)

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
     sse_specification_override =
       option_of_yojson
         (value_for_key sse_specification_of_yojson "SSESpecificationOverride")
         _list path;
     on_demand_throughput_override =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughputOverride")
         _list path;
     provisioned_throughput_override =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughputOverride")
         _list path;
     local_secondary_index_override =
       option_of_yojson
         (value_for_key local_secondary_index_list_of_yojson "LocalSecondaryIndexOverride")
         _list path;
     global_secondary_index_override =
       option_of_yojson
         (value_for_key global_secondary_index_list_of_yojson "GlobalSecondaryIndexOverride")
         _list path;
     billing_mode_override =
       option_of_yojson (value_for_key billing_mode_of_yojson "BillingModeOverride") _list path;
     backup_arn = value_for_key backup_arn_of_yojson "BackupArn" _list path;
     target_table_name = value_for_key table_name_of_yojson "TargetTableName" _list path;
   }
    : restore_table_from_backup_input)

let backup_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : backup_not_found_exception)

let backup_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : backup_in_use_exception)

let resource_policy_of_yojson = string_of_yojson

let replica_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path }
    : replica)

let replica_list_of_yojson tree path = list_of_yojson replica_of_yojson tree path

let query_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
     last_evaluated_key =
       option_of_yojson (value_for_key key_of_yojson "LastEvaluatedKey") _list path;
     scanned_count = option_of_yojson (value_for_key integer_of_yojson "ScannedCount") _list path;
     count = option_of_yojson (value_for_key integer_of_yojson "Count") _list path;
     items = option_of_yojson (value_for_key item_list_of_yojson "Items") _list path;
   }
    : query_output)

let key_conditions_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson condition_of_yojson tree path

let key_expression_of_yojson = string_of_yojson

let query_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     key_condition_expression =
       option_of_yojson (value_for_key key_expression_of_yojson "KeyConditionExpression") _list path;
     filter_expression =
       option_of_yojson (value_for_key condition_expression_of_yojson "FilterExpression") _list path;
     projection_expression =
       option_of_yojson
         (value_for_key projection_expression_of_yojson "ProjectionExpression")
         _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     exclusive_start_key =
       option_of_yojson (value_for_key key_of_yojson "ExclusiveStartKey") _list path;
     scan_index_forward =
       option_of_yojson (value_for_key boolean_object_of_yojson "ScanIndexForward") _list path;
     conditional_operator =
       option_of_yojson
         (value_for_key conditional_operator_of_yojson "ConditionalOperator")
         _list path;
     query_filter =
       option_of_yojson (value_for_key filter_condition_map_of_yojson "QueryFilter") _list path;
     key_conditions =
       option_of_yojson (value_for_key key_conditions_of_yojson "KeyConditions") _list path;
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
     limit = option_of_yojson (value_for_key positive_integer_object_of_yojson "Limit") _list path;
     attributes_to_get =
       option_of_yojson (value_for_key attribute_name_list_of_yojson "AttributesToGet") _list path;
     select = option_of_yojson (value_for_key select_of_yojson "Select") _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : query_input)

let policy_revision_id_of_yojson = string_of_yojson

let put_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "RevisionId") _list path;
   }
    : put_resource_policy_output)

let confirm_remove_self_resource_access_of_yojson = bool_of_yojson

let put_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     confirm_remove_self_resource_access =
       option_of_yojson
         (value_for_key confirm_remove_self_resource_access_of_yojson
            "ConfirmRemoveSelfResourceAccess")
         _list path;
     expected_revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "ExpectedRevisionId") _list path;
     policy = value_for_key resource_policy_of_yojson "Policy" _list path;
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
   }
    : put_resource_policy_input)

let policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : policy_not_found_exception)

let put_item_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item_collection_metrics =
       option_of_yojson
         (value_for_key item_collection_metrics_of_yojson "ItemCollectionMetrics")
         _list path;
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
     attributes = option_of_yojson (value_for_key attribute_map_of_yojson "Attributes") _list path;
   }
    : put_item_output)

let put_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     conditional_operator =
       option_of_yojson
         (value_for_key conditional_operator_of_yojson "ConditionalOperator")
         _list path;
     return_item_collection_metrics =
       option_of_yojson
         (value_for_key return_item_collection_metrics_of_yojson "ReturnItemCollectionMetrics")
         _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     return_values =
       option_of_yojson (value_for_key return_value_of_yojson "ReturnValues") _list path;
     expected =
       option_of_yojson (value_for_key expected_attribute_map_of_yojson "Expected") _list path;
     item = value_for_key put_item_input_attribute_map_of_yojson "Item" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : put_item_input)

let processed_item_count_of_yojson = long_of_yojson

let prepared_statement_parameters_of_yojson tree path =
  list_of_yojson attribute_value_of_yojson tree path

let parti_ql_statement_of_yojson = string_of_yojson
let parti_ql_next_token_of_yojson = string_of_yojson

let batch_statement_error_code_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "DuplicateItem" -> DuplicateItem
    | `String "AccessDenied" -> AccessDenied
    | `String "ResourceNotFound" -> ResourceNotFound
    | `String "InternalServerError" -> InternalServerError
    | `String "ThrottlingError" -> ThrottlingError
    | `String "TransactionConflict" -> TransactionConflict
    | `String "ProvisionedThroughputExceeded" -> ProvisionedThroughputExceeded
    | `String "ValidationError" -> ValidationError
    | `String "RequestLimitExceeded" -> RequestLimitExceeded
    | `String "ItemCollectionSizeLimitExceeded" -> ItemCollectionSizeLimitExceeded
    | `String "ConditionalCheckFailed" -> ConditionalCheckFailed
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BatchStatementErrorCodeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchStatementErrorCodeEnum")
     : batch_statement_error_code_enum)
    : batch_statement_error_code_enum)

let batch_statement_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code =
       option_of_yojson (value_for_key batch_statement_error_code_enum_of_yojson "Code") _list path;
   }
    : batch_statement_error)

let batch_statement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     error = option_of_yojson (value_for_key batch_statement_error_of_yojson "Error") _list path;
   }
    : batch_statement_response)

let parti_ql_batch_response_of_yojson tree path =
  list_of_yojson batch_statement_response_of_yojson tree path

let batch_statement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
     parameters =
       option_of_yojson
         (value_for_key prepared_statement_parameters_of_yojson "Parameters")
         _list path;
     statement = value_for_key parti_ql_statement_of_yojson "Statement" _list path;
   }
    : batch_statement_request)

let parti_ql_batch_request_of_yojson tree path =
  list_of_yojson batch_statement_request_of_yojson tree path

let parameterized_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
     parameters =
       option_of_yojson
         (value_for_key prepared_statement_parameters_of_yojson "Parameters")
         _list path;
     statement = value_for_key parti_ql_statement_of_yojson "Statement" _list path;
   }
    : parameterized_statement)

let parameterized_statements_of_yojson tree path =
  list_of_yojson parameterized_statement_of_yojson tree path

let next_token_string_of_yojson = string_of_yojson
let long_of_yojson = long_of_yojson

let list_tags_of_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : list_tags_of_resource_output)

let list_tags_of_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
   }
    : list_tags_of_resource_input)

let list_tables_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_evaluated_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "LastEvaluatedTableName") _list path;
     table_names =
       option_of_yojson (value_for_key table_name_list_of_yojson "TableNames") _list path;
   }
    : list_tables_output)

let list_tables_input_limit_of_yojson = int_of_yojson

let list_tables_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key list_tables_input_limit_of_yojson "Limit") _list path;
     exclusive_start_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "ExclusiveStartTableName") _list path;
   }
    : list_tables_input)

let import_arn_of_yojson = string_of_yojson

let import_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "CANCELLED" -> CANCELLED
    | `String "CANCELLING" -> CANCELLING
    | `String "COMPLETED" -> COMPLETED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportStatus")
     : import_status)
    : import_status)

let cloud_watch_log_group_arn_of_yojson = string_of_yojson

let input_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "CSV" -> CSV
    | `String "ION" -> ION
    | `String "DYNAMODB_JSON" -> DYNAMODB_JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "InputFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "InputFormat")
     : input_format)
    : input_format)

let import_start_time_of_yojson = timestamp_epoch_seconds_of_yojson
let import_end_time_of_yojson = timestamp_epoch_seconds_of_yojson

let import_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = option_of_yojson (value_for_key import_end_time_of_yojson "EndTime") _list path;
     start_time =
       option_of_yojson (value_for_key import_start_time_of_yojson "StartTime") _list path;
     input_format = option_of_yojson (value_for_key input_format_of_yojson "InputFormat") _list path;
     cloud_watch_log_group_arn =
       option_of_yojson
         (value_for_key cloud_watch_log_group_arn_of_yojson "CloudWatchLogGroupArn")
         _list path;
     s3_bucket_source =
       option_of_yojson (value_for_key s3_bucket_source_of_yojson "S3BucketSource") _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "ImportStatus") _list path;
     import_arn = option_of_yojson (value_for_key import_arn_of_yojson "ImportArn") _list path;
   }
    : import_summary)

let import_summary_list_of_yojson tree path = list_of_yojson import_summary_of_yojson tree path
let import_next_token_of_yojson = string_of_yojson

let list_imports_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key import_next_token_of_yojson "NextToken") _list path;
     import_summary_list =
       option_of_yojson (value_for_key import_summary_list_of_yojson "ImportSummaryList") _list path;
   }
    : list_imports_output)

let list_imports_max_limit_of_yojson = int_of_yojson

let list_imports_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key import_next_token_of_yojson "NextToken") _list path;
     page_size =
       option_of_yojson (value_for_key list_imports_max_limit_of_yojson "PageSize") _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
   }
    : list_imports_input)

let global_table_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_group =
       option_of_yojson (value_for_key replica_list_of_yojson "ReplicationGroup") _list path;
     global_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "GlobalTableName") _list path;
   }
    : global_table)

let global_table_list_of_yojson tree path = list_of_yojson global_table_of_yojson tree path

let list_global_tables_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_evaluated_global_table_name =
       option_of_yojson
         (value_for_key table_name_of_yojson "LastEvaluatedGlobalTableName")
         _list path;
     global_tables =
       option_of_yojson (value_for_key global_table_list_of_yojson "GlobalTables") _list path;
   }
    : list_global_tables_output)

let list_global_tables_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
     limit = option_of_yojson (value_for_key positive_integer_object_of_yojson "Limit") _list path;
     exclusive_start_global_table_name =
       option_of_yojson
         (value_for_key table_name_of_yojson "ExclusiveStartGlobalTableName")
         _list path;
   }
    : list_global_tables_input)

let export_arn_of_yojson = string_of_yojson

let export_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportStatus")
     : export_status)
    : export_status)

let export_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INCREMENTAL_EXPORT" -> INCREMENTAL_EXPORT
    | `String "FULL_EXPORT" -> FULL_EXPORT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportType")
     : export_type)
    : export_type)

let export_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_type = option_of_yojson (value_for_key export_type_of_yojson "ExportType") _list path;
     export_status =
       option_of_yojson (value_for_key export_status_of_yojson "ExportStatus") _list path;
     export_arn = option_of_yojson (value_for_key export_arn_of_yojson "ExportArn") _list path;
   }
    : export_summary)

let export_summaries_of_yojson tree path = list_of_yojson export_summary_of_yojson tree path
let export_next_token_of_yojson = string_of_yojson

let list_exports_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key export_next_token_of_yojson "NextToken") _list path;
     export_summaries =
       option_of_yojson (value_for_key export_summaries_of_yojson "ExportSummaries") _list path;
   }
    : list_exports_output)

let list_exports_max_limit_of_yojson = int_of_yojson

let list_exports_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key export_next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key list_exports_max_limit_of_yojson "MaxResults") _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
   }
    : list_exports_input)

let contributor_insights_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contributor_insights_status =
       option_of_yojson
         (value_for_key contributor_insights_status_of_yojson "ContributorInsightsStatus")
         _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
   }
    : contributor_insights_summary)

let contributor_insights_summaries_of_yojson tree path =
  list_of_yojson contributor_insights_summary_of_yojson tree path

let list_contributor_insights_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
     contributor_insights_summaries =
       option_of_yojson
         (value_for_key contributor_insights_summaries_of_yojson "ContributorInsightsSummaries")
         _list path;
   }
    : list_contributor_insights_output)

let list_contributor_insights_limit_of_yojson = int_of_yojson

let list_contributor_insights_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key list_contributor_insights_limit_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
     table_name = option_of_yojson (value_for_key table_arn_of_yojson "TableName") _list path;
   }
    : list_contributor_insights_input)

let backup_name_of_yojson = string_of_yojson
let backup_creation_date_time_of_yojson = timestamp_epoch_seconds_of_yojson

let backup_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "DELETED" -> DELETED
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackupStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BackupStatus")
     : backup_status)
    : backup_status)

let backup_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_BACKUP" -> AWS_BACKUP
    | `String "SYSTEM" -> SYSTEM
    | `String "USER" -> USER
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackupType" value)
    | _ -> raise (deserialize_wrong_type_error path "BackupType")
     : backup_type)
    : backup_type)

let backup_size_bytes_of_yojson = long_of_yojson

let backup_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_size_bytes =
       option_of_yojson (value_for_key backup_size_bytes_of_yojson "BackupSizeBytes") _list path;
     backup_type = option_of_yojson (value_for_key backup_type_of_yojson "BackupType") _list path;
     backup_status =
       option_of_yojson (value_for_key backup_status_of_yojson "BackupStatus") _list path;
     backup_expiry_date_time =
       option_of_yojson (value_for_key date_of_yojson "BackupExpiryDateTime") _list path;
     backup_creation_date_time =
       option_of_yojson
         (value_for_key backup_creation_date_time_of_yojson "BackupCreationDateTime")
         _list path;
     backup_name = option_of_yojson (value_for_key backup_name_of_yojson "BackupName") _list path;
     backup_arn = option_of_yojson (value_for_key backup_arn_of_yojson "BackupArn") _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     table_id = option_of_yojson (value_for_key table_id_of_yojson "TableId") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
   }
    : backup_summary)

let backup_summaries_of_yojson tree path = list_of_yojson backup_summary_of_yojson tree path

let list_backups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_evaluated_backup_arn =
       option_of_yojson (value_for_key backup_arn_of_yojson "LastEvaluatedBackupArn") _list path;
     backup_summaries =
       option_of_yojson (value_for_key backup_summaries_of_yojson "BackupSummaries") _list path;
   }
    : list_backups_output)

let backups_input_limit_of_yojson = int_of_yojson

let backup_type_filter_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "AWS_BACKUP" -> AWS_BACKUP
    | `String "SYSTEM" -> SYSTEM
    | `String "USER" -> USER
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackupTypeFilter" value)
    | _ -> raise (deserialize_wrong_type_error path "BackupTypeFilter")
     : backup_type_filter)
    : backup_type_filter)

let list_backups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_type =
       option_of_yojson (value_for_key backup_type_filter_of_yojson "BackupType") _list path;
     exclusive_start_backup_arn =
       option_of_yojson (value_for_key backup_arn_of_yojson "ExclusiveStartBackupArn") _list path;
     time_range_upper_bound =
       option_of_yojson
         (value_for_key time_range_upper_bound_of_yojson "TimeRangeUpperBound")
         _list path;
     time_range_lower_bound =
       option_of_yojson
         (value_for_key time_range_lower_bound_of_yojson "TimeRangeLowerBound")
         _list path;
     limit = option_of_yojson (value_for_key backups_input_limit_of_yojson "Limit") _list path;
     table_name = option_of_yojson (value_for_key table_arn_of_yojson "TableName") _list path;
   }
    : list_backups_input)

let last_update_date_time_of_yojson = timestamp_epoch_seconds_of_yojson

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
     enable_kinesis_streaming_configuration =
       option_of_yojson
         (value_for_key enable_kinesis_streaming_configuration_of_yojson
            "EnableKinesisStreamingConfiguration")
         _list path;
     destination_status =
       option_of_yojson (value_for_key destination_status_of_yojson "DestinationStatus") _list path;
     stream_arn = option_of_yojson (value_for_key stream_arn_of_yojson "StreamArn") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
   }
    : kinesis_streaming_destination_output)

let kinesis_streaming_destination_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_kinesis_streaming_configuration =
       option_of_yojson
         (value_for_key enable_kinesis_streaming_configuration_of_yojson
            "EnableKinesisStreamingConfiguration")
         _list path;
     stream_arn = value_for_key stream_arn_of_yojson "StreamArn" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : kinesis_streaming_destination_input)

let kinesis_data_stream_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approximate_creation_date_time_precision =
       option_of_yojson
         (value_for_key approximate_creation_date_time_precision_of_yojson
            "ApproximateCreationDateTimePrecision")
         _list path;
     destination_status_description =
       option_of_yojson (value_for_key string__of_yojson "DestinationStatusDescription") _list path;
     destination_status =
       option_of_yojson (value_for_key destination_status_of_yojson "DestinationStatus") _list path;
     stream_arn = option_of_yojson (value_for_key stream_arn_of_yojson "StreamArn") _list path;
   }
    : kinesis_data_stream_destination)

let kinesis_data_stream_destinations_of_yojson tree path =
  list_of_yojson kinesis_data_stream_destination_of_yojson tree path

let key_list_of_yojson tree path = list_of_yojson key_of_yojson tree path

let keys_and_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     projection_expression =
       option_of_yojson
         (value_for_key projection_expression_of_yojson "ProjectionExpression")
         _list path;
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
     attributes_to_get =
       option_of_yojson (value_for_key attribute_name_list_of_yojson "AttributesToGet") _list path;
     keys = value_for_key key_list_of_yojson "Keys" _list path;
   }
    : keys_and_attributes)

let invalid_export_time_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_export_time_exception)

let csv_delimiter_of_yojson = string_of_yojson
let csv_header_of_yojson = string_of_yojson
let csv_header_list_of_yojson tree path = list_of_yojson csv_header_of_yojson tree path

let csv_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     header_list =
       option_of_yojson (value_for_key csv_header_list_of_yojson "HeaderList") _list path;
     delimiter = option_of_yojson (value_for_key csv_delimiter_of_yojson "Delimiter") _list path;
   }
    : csv_options)

let input_format_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ csv = option_of_yojson (value_for_key csv_options_of_yojson "Csv") _list path }
    : input_format_options)

let input_compression_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "ZSTD" -> ZSTD
    | `String "GZIP" -> GZIP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InputCompressionType" value)
    | _ -> raise (deserialize_wrong_type_error path "InputCompressionType")
     : input_compression_type)
    : input_compression_type)

let export_from_time_of_yojson = timestamp_epoch_seconds_of_yojson
let export_to_time_of_yojson = timestamp_epoch_seconds_of_yojson

let export_view_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEW_AND_OLD_IMAGES" -> NEW_AND_OLD_IMAGES
    | `String "NEW_IMAGE" -> NEW_IMAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportViewType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportViewType")
     : export_view_type)
    : export_view_type)

let incremental_export_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_view_type =
       option_of_yojson (value_for_key export_view_type_of_yojson "ExportViewType") _list path;
     export_to_time =
       option_of_yojson (value_for_key export_to_time_of_yojson "ExportToTime") _list path;
     export_from_time =
       option_of_yojson (value_for_key export_from_time_of_yojson "ExportFromTime") _list path;
   }
    : incremental_export_specification)

let imported_item_count_of_yojson = long_of_yojson
let client_token_of_yojson = string_of_yojson
let error_count_of_yojson = long_of_yojson
let failure_code_of_yojson = string_of_yojson
let failure_message_of_yojson = string_of_yojson

let import_table_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson (value_for_key failure_message_of_yojson "FailureMessage") _list path;
     failure_code = option_of_yojson (value_for_key failure_code_of_yojson "FailureCode") _list path;
     imported_item_count =
       option_of_yojson (value_for_key imported_item_count_of_yojson "ImportedItemCount") _list path;
     processed_item_count =
       option_of_yojson
         (value_for_key processed_item_count_of_yojson "ProcessedItemCount")
         _list path;
     processed_size_bytes =
       option_of_yojson (value_for_key long_object_of_yojson "ProcessedSizeBytes") _list path;
     end_time = option_of_yojson (value_for_key import_end_time_of_yojson "EndTime") _list path;
     start_time =
       option_of_yojson (value_for_key import_start_time_of_yojson "StartTime") _list path;
     table_creation_parameters =
       option_of_yojson
         (value_for_key table_creation_parameters_of_yojson "TableCreationParameters")
         _list path;
     input_compression_type =
       option_of_yojson
         (value_for_key input_compression_type_of_yojson "InputCompressionType")
         _list path;
     input_format_options =
       option_of_yojson
         (value_for_key input_format_options_of_yojson "InputFormatOptions")
         _list path;
     input_format = option_of_yojson (value_for_key input_format_of_yojson "InputFormat") _list path;
     cloud_watch_log_group_arn =
       option_of_yojson
         (value_for_key cloud_watch_log_group_arn_of_yojson "CloudWatchLogGroupArn")
         _list path;
     error_count = option_of_yojson (value_for_key error_count_of_yojson "ErrorCount") _list path;
     s3_bucket_source =
       option_of_yojson (value_for_key s3_bucket_source_of_yojson "S3BucketSource") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     table_id = option_of_yojson (value_for_key table_id_of_yojson "TableId") _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "ImportStatus") _list path;
     import_arn = option_of_yojson (value_for_key import_arn_of_yojson "ImportArn") _list path;
   }
    : import_table_description)

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
     table_creation_parameters =
       value_for_key table_creation_parameters_of_yojson "TableCreationParameters" _list path;
     input_compression_type =
       option_of_yojson
         (value_for_key input_compression_type_of_yojson "InputCompressionType")
         _list path;
     input_format_options =
       option_of_yojson
         (value_for_key input_format_options_of_yojson "InputFormatOptions")
         _list path;
     input_format = value_for_key input_format_of_yojson "InputFormat" _list path;
     s3_bucket_source = value_for_key s3_bucket_source_of_yojson "S3BucketSource" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : import_table_input)

let import_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : import_conflict_exception)

let import_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : import_not_found_exception)

let global_table_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : global_table_already_exists_exception)

let get_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "RevisionId") _list path;
     policy = option_of_yojson (value_for_key resource_policy_of_yojson "Policy") _list path;
   }
    : get_resource_policy_output)

let get_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path }
    : get_resource_policy_input)

let get_item_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
     item = option_of_yojson (value_for_key attribute_map_of_yojson "Item") _list path;
   }
    : get_item_output)

let get_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     projection_expression =
       option_of_yojson
         (value_for_key projection_expression_of_yojson "ProjectionExpression")
         _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
     attributes_to_get =
       option_of_yojson (value_for_key attribute_name_list_of_yojson "AttributesToGet") _list path;
     key = value_for_key key_of_yojson "Key" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : get_item_input)

let exception_name_of_yojson = string_of_yojson
let exception_description_of_yojson = string_of_yojson

let failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exception_description =
       option_of_yojson
         (value_for_key exception_description_of_yojson "ExceptionDescription")
         _list path;
     exception_name =
       option_of_yojson (value_for_key exception_name_of_yojson "ExceptionName") _list path;
   }
    : failure_exception)

let export_time_of_yojson = timestamp_epoch_seconds_of_yojson
let export_start_time_of_yojson = timestamp_epoch_seconds_of_yojson
let export_end_time_of_yojson = timestamp_epoch_seconds_of_yojson
let export_manifest_of_yojson = string_of_yojson

let export_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "ION" -> ION
    | `String "DYNAMODB_JSON" -> DYNAMODB_JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportFormat")
     : export_format)
    : export_format)

let billed_size_bytes_of_yojson = long_of_yojson

let export_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     incremental_export_specification =
       option_of_yojson
         (value_for_key incremental_export_specification_of_yojson "IncrementalExportSpecification")
         _list path;
     export_type = option_of_yojson (value_for_key export_type_of_yojson "ExportType") _list path;
     item_count = option_of_yojson (value_for_key item_count_of_yojson "ItemCount") _list path;
     billed_size_bytes =
       option_of_yojson (value_for_key billed_size_bytes_of_yojson "BilledSizeBytes") _list path;
     export_format =
       option_of_yojson (value_for_key export_format_of_yojson "ExportFormat") _list path;
     failure_message =
       option_of_yojson (value_for_key failure_message_of_yojson "FailureMessage") _list path;
     failure_code = option_of_yojson (value_for_key failure_code_of_yojson "FailureCode") _list path;
     s3_sse_kms_key_id =
       option_of_yojson (value_for_key s3_sse_kms_key_id_of_yojson "S3SseKmsKeyId") _list path;
     s3_sse_algorithm =
       option_of_yojson (value_for_key s3_sse_algorithm_of_yojson "S3SseAlgorithm") _list path;
     s3_prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "S3Prefix") _list path;
     s3_bucket_owner =
       option_of_yojson (value_for_key s3_bucket_owner_of_yojson "S3BucketOwner") _list path;
     s3_bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "S3Bucket") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     export_time = option_of_yojson (value_for_key export_time_of_yojson "ExportTime") _list path;
     table_id = option_of_yojson (value_for_key table_id_of_yojson "TableId") _list path;
     table_arn = option_of_yojson (value_for_key table_arn_of_yojson "TableArn") _list path;
     export_manifest =
       option_of_yojson (value_for_key export_manifest_of_yojson "ExportManifest") _list path;
     end_time = option_of_yojson (value_for_key export_end_time_of_yojson "EndTime") _list path;
     start_time =
       option_of_yojson (value_for_key export_start_time_of_yojson "StartTime") _list path;
     export_status =
       option_of_yojson (value_for_key export_status_of_yojson "ExportStatus") _list path;
     export_arn = option_of_yojson (value_for_key export_arn_of_yojson "ExportArn") _list path;
   }
    : export_description)

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
     incremental_export_specification =
       option_of_yojson
         (value_for_key incremental_export_specification_of_yojson "IncrementalExportSpecification")
         _list path;
     export_type = option_of_yojson (value_for_key export_type_of_yojson "ExportType") _list path;
     export_format =
       option_of_yojson (value_for_key export_format_of_yojson "ExportFormat") _list path;
     s3_sse_kms_key_id =
       option_of_yojson (value_for_key s3_sse_kms_key_id_of_yojson "S3SseKmsKeyId") _list path;
     s3_sse_algorithm =
       option_of_yojson (value_for_key s3_sse_algorithm_of_yojson "S3SseAlgorithm") _list path;
     s3_prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "S3Prefix") _list path;
     s3_bucket_owner =
       option_of_yojson (value_for_key s3_bucket_owner_of_yojson "S3BucketOwner") _list path;
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     export_time = option_of_yojson (value_for_key export_time_of_yojson "ExportTime") _list path;
     table_arn = value_for_key table_arn_of_yojson "TableArn" _list path;
   }
    : export_table_to_point_in_time_input)

let export_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : export_conflict_exception)

let export_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : export_not_found_exception)

let execute_transaction_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_capacity =
       option_of_yojson
         (value_for_key consumed_capacity_multiple_of_yojson "ConsumedCapacity")
         _list path;
     responses =
       option_of_yojson (value_for_key item_response_list_of_yojson "Responses") _list path;
   }
    : execute_transaction_output)

let execute_transaction_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     transact_statements =
       value_for_key parameterized_statements_of_yojson "TransactStatements" _list path;
   }
    : execute_transaction_input)

let execute_statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_evaluated_key =
       option_of_yojson (value_for_key key_of_yojson "LastEvaluatedKey") _list path;
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
     next_token =
       option_of_yojson (value_for_key parti_ql_next_token_of_yojson "NextToken") _list path;
     items = option_of_yojson (value_for_key item_list_of_yojson "Items") _list path;
   }
    : execute_statement_output)

let execute_statement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
     limit = option_of_yojson (value_for_key positive_integer_object_of_yojson "Limit") _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     next_token =
       option_of_yojson (value_for_key parti_ql_next_token_of_yojson "NextToken") _list path;
     consistent_read =
       option_of_yojson (value_for_key consistent_read_of_yojson "ConsistentRead") _list path;
     parameters =
       option_of_yojson
         (value_for_key prepared_statement_parameters_of_yojson "Parameters")
         _list path;
     statement = value_for_key parti_ql_statement_of_yojson "Statement" _list path;
   }
    : execute_statement_input)

let duplicate_item_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : duplicate_item_exception)

let endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cache_period_in_minutes = value_for_key long_of_yojson "CachePeriodInMinutes" _list path;
     address = value_for_key string__of_yojson "Address" _list path;
   }
    : endpoint)

let endpoints_of_yojson tree path = list_of_yojson endpoint_of_yojson tree path

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

let describe_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table = option_of_yojson (value_for_key table_description_of_yojson "Table") _list path }
    : describe_table_output)

let describe_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table_name = value_for_key table_arn_of_yojson "TableName" _list path } : describe_table_input)

let describe_limits_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_max_write_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "TableMaxWriteCapacityUnits")
         _list path;
     table_max_read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "TableMaxReadCapacityUnits")
         _list path;
     account_max_write_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "AccountMaxWriteCapacityUnits")
         _list path;
     account_max_read_capacity_units =
       option_of_yojson
         (value_for_key positive_long_object_of_yojson "AccountMaxReadCapacityUnits")
         _list path;
   }
    : describe_limits_output)

let describe_limits_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let describe_kinesis_streaming_destination_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kinesis_data_stream_destinations =
       option_of_yojson
         (value_for_key kinesis_data_stream_destinations_of_yojson "KinesisDataStreamDestinations")
         _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
   }
    : describe_kinesis_streaming_destination_output)

let describe_kinesis_streaming_destination_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table_name = value_for_key table_arn_of_yojson "TableName" _list path }
    : describe_kinesis_streaming_destination_input)

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

let describe_global_table_settings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_settings =
       option_of_yojson
         (value_for_key replica_settings_description_list_of_yojson "ReplicaSettings")
         _list path;
     global_table_name =
       option_of_yojson (value_for_key table_name_of_yojson "GlobalTableName") _list path;
   }
    : describe_global_table_settings_output)

let describe_global_table_settings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ global_table_name = value_for_key table_name_of_yojson "GlobalTableName" _list path }
    : describe_global_table_settings_input)

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

let describe_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoints = value_for_key endpoints_of_yojson "Endpoints" _list path }
    : describe_endpoints_response)

let describe_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let contributor_insights_rule_of_yojson = string_of_yojson

let contributor_insights_rule_list_of_yojson tree path =
  list_of_yojson contributor_insights_rule_of_yojson tree path

let describe_contributor_insights_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_exception =
       option_of_yojson (value_for_key failure_exception_of_yojson "FailureException") _list path;
     last_update_date_time =
       option_of_yojson
         (value_for_key last_update_date_time_of_yojson "LastUpdateDateTime")
         _list path;
     contributor_insights_status =
       option_of_yojson
         (value_for_key contributor_insights_status_of_yojson "ContributorInsightsStatus")
         _list path;
     contributor_insights_rule_list =
       option_of_yojson
         (value_for_key contributor_insights_rule_list_of_yojson "ContributorInsightsRuleList")
         _list path;
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
   }
    : describe_contributor_insights_output)

let describe_contributor_insights_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = option_of_yojson (value_for_key index_name_of_yojson "IndexName") _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : describe_contributor_insights_input)

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

let backup_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_expiry_date_time =
       option_of_yojson (value_for_key date_of_yojson "BackupExpiryDateTime") _list path;
     backup_creation_date_time =
       value_for_key backup_creation_date_time_of_yojson "BackupCreationDateTime" _list path;
     backup_type = value_for_key backup_type_of_yojson "BackupType" _list path;
     backup_status = value_for_key backup_status_of_yojson "BackupStatus" _list path;
     backup_size_bytes =
       option_of_yojson (value_for_key backup_size_bytes_of_yojson "BackupSizeBytes") _list path;
     backup_name = value_for_key backup_name_of_yojson "BackupName" _list path;
     backup_arn = value_for_key backup_arn_of_yojson "BackupArn" _list path;
   }
    : backup_details)

let backup_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_table_feature_details =
       option_of_yojson
         (value_for_key source_table_feature_details_of_yojson "SourceTableFeatureDetails")
         _list path;
     source_table_details =
       option_of_yojson
         (value_for_key source_table_details_of_yojson "SourceTableDetails")
         _list path;
     backup_details =
       option_of_yojson (value_for_key backup_details_of_yojson "BackupDetails") _list path;
   }
    : backup_description)

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

let delete_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "RevisionId") _list path;
   }
    : delete_resource_policy_output)

let delete_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expected_revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "ExpectedRevisionId") _list path;
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
   }
    : delete_resource_policy_input)

let delete_item_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item_collection_metrics =
       option_of_yojson
         (value_for_key item_collection_metrics_of_yojson "ItemCollectionMetrics")
         _list path;
     consumed_capacity =
       option_of_yojson (value_for_key consumed_capacity_of_yojson "ConsumedCapacity") _list path;
     attributes = option_of_yojson (value_for_key attribute_map_of_yojson "Attributes") _list path;
   }
    : delete_item_output)

let delete_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_values_on_condition_check_failure =
       option_of_yojson
         (value_for_key return_values_on_condition_check_failure_of_yojson
            "ReturnValuesOnConditionCheckFailure")
         _list path;
     expression_attribute_values =
       option_of_yojson
         (value_for_key expression_attribute_value_map_of_yojson "ExpressionAttributeValues")
         _list path;
     expression_attribute_names =
       option_of_yojson
         (value_for_key expression_attribute_name_map_of_yojson "ExpressionAttributeNames")
         _list path;
     condition_expression =
       option_of_yojson
         (value_for_key condition_expression_of_yojson "ConditionExpression")
         _list path;
     return_item_collection_metrics =
       option_of_yojson
         (value_for_key return_item_collection_metrics_of_yojson "ReturnItemCollectionMetrics")
         _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     return_values =
       option_of_yojson (value_for_key return_value_of_yojson "ReturnValues") _list path;
     conditional_operator =
       option_of_yojson
         (value_for_key conditional_operator_of_yojson "ConditionalOperator")
         _list path;
     expected =
       option_of_yojson (value_for_key expected_attribute_map_of_yojson "Expected") _list path;
     key = value_for_key key_of_yojson "Key" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : delete_item_input)

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

let create_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_description =
       option_of_yojson (value_for_key table_description_of_yojson "TableDescription") _list path;
   }
    : create_table_output)

let create_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_demand_throughput =
       option_of_yojson
         (value_for_key on_demand_throughput_of_yojson "OnDemandThroughput")
         _list path;
     resource_policy =
       option_of_yojson (value_for_key resource_policy_of_yojson "ResourcePolicy") _list path;
     warm_throughput =
       option_of_yojson (value_for_key warm_throughput_of_yojson "WarmThroughput") _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key deletion_protection_enabled_of_yojson "DeletionProtectionEnabled")
         _list path;
     table_class = option_of_yojson (value_for_key table_class_of_yojson "TableClass") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     sse_specification =
       option_of_yojson (value_for_key sse_specification_of_yojson "SSESpecification") _list path;
     stream_specification =
       option_of_yojson
         (value_for_key stream_specification_of_yojson "StreamSpecification")
         _list path;
     provisioned_throughput =
       option_of_yojson
         (value_for_key provisioned_throughput_of_yojson "ProvisionedThroughput")
         _list path;
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     global_secondary_indexes =
       option_of_yojson
         (value_for_key global_secondary_index_list_of_yojson "GlobalSecondaryIndexes")
         _list path;
     local_secondary_indexes =
       option_of_yojson
         (value_for_key local_secondary_index_list_of_yojson "LocalSecondaryIndexes")
         _list path;
     key_schema = value_for_key key_schema_of_yojson "KeySchema" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
     attribute_definitions =
       value_for_key attribute_definitions_of_yojson "AttributeDefinitions" _list path;
   }
    : create_table_input)

let create_global_table_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_table_description =
       option_of_yojson
         (value_for_key global_table_description_of_yojson "GlobalTableDescription")
         _list path;
   }
    : create_global_table_output)

let create_global_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_group = value_for_key replica_list_of_yojson "ReplicationGroup" _list path;
     global_table_name = value_for_key table_name_of_yojson "GlobalTableName" _list path;
   }
    : create_global_table_input)

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
     backup_name = value_for_key backup_name_of_yojson "BackupName" _list path;
     table_name = value_for_key table_arn_of_yojson "TableName" _list path;
   }
    : create_backup_input)

let batch_write_item_request_map_of_yojson tree path =
  map_of_yojson table_arn_of_yojson write_requests_of_yojson tree path

let batch_write_item_output_of_yojson tree path =
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
     unprocessed_items =
       option_of_yojson
         (value_for_key batch_write_item_request_map_of_yojson "UnprocessedItems")
         _list path;
   }
    : batch_write_item_output)

let batch_write_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_item_collection_metrics =
       option_of_yojson
         (value_for_key return_item_collection_metrics_of_yojson "ReturnItemCollectionMetrics")
         _list path;
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     request_items = value_for_key batch_write_item_request_map_of_yojson "RequestItems" _list path;
   }
    : batch_write_item_input)

let batch_get_response_map_of_yojson tree path =
  map_of_yojson table_arn_of_yojson item_list_of_yojson tree path

let batch_get_request_map_of_yojson tree path =
  map_of_yojson table_arn_of_yojson keys_and_attributes_of_yojson tree path

let batch_get_item_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_capacity =
       option_of_yojson
         (value_for_key consumed_capacity_multiple_of_yojson "ConsumedCapacity")
         _list path;
     unprocessed_keys =
       option_of_yojson (value_for_key batch_get_request_map_of_yojson "UnprocessedKeys") _list path;
     responses =
       option_of_yojson (value_for_key batch_get_response_map_of_yojson "Responses") _list path;
   }
    : batch_get_item_output)

let batch_get_item_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     request_items = value_for_key batch_get_request_map_of_yojson "RequestItems" _list path;
   }
    : batch_get_item_input)

let batch_execute_statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_capacity =
       option_of_yojson
         (value_for_key consumed_capacity_multiple_of_yojson "ConsumedCapacity")
         _list path;
     responses =
       option_of_yojson (value_for_key parti_ql_batch_response_of_yojson "Responses") _list path;
   }
    : batch_execute_statement_output)

let batch_execute_statement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_consumed_capacity =
       option_of_yojson
         (value_for_key return_consumed_capacity_of_yojson "ReturnConsumedCapacity")
         _list path;
     statements = value_for_key parti_ql_batch_request_of_yojson "Statements" _list path;
   }
    : batch_execute_statement_input)
