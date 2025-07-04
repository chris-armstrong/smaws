open Smaws_Lib.Json.DeserializeHelpers
open Types
let base_unit_of_yojson = unit_of_yojson
let rs_of_yojson (tree : t) path =
  (match tree with
   | `String "SINGLE_REGION" -> SINGLE_REGION
   | `String "MULTI_REGION" -> MULTI_REGION
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "rs" value)
   | _ -> raise (deserialize_wrong_type_error path "rs") : rs)
let region_of_yojson = string_of_yojson
let kms_key_ar_n_of_yojson = string_of_yojson
let base_string_of_yojson = string_of_yojson
let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key base_string_of_yojson "message")
          _list path)
   } : validation_exception)
let ar_n_of_yojson = string_of_yojson
let update_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = (value_for_key ar_n_of_yojson "resourceArn" _list path) } : 
    update_table_response)
let keyspace_name_of_yojson = string_of_yojson
let table_name_of_yojson = string_of_yojson
let generic_string_of_yojson = string_of_yojson
let column_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = (value_for_key generic_string_of_yojson "type" _list path);
     name = (value_for_key generic_string_of_yojson "name" _list path)
   } : column_definition)
let column_definition_list_of_yojson tree path =
  list_of_yojson column_definition_of_yojson tree path
let throughput_mode_of_yojson (tree : t) path =
  (match tree with
   | `String "PAY_PER_REQUEST" -> PAY_PER_REQUEST
   | `String "PROVISIONED" -> PROVISIONED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ThroughputMode" value)
   | _ -> raise (deserialize_wrong_type_error path "ThroughputMode") : 
  throughput_mode)
let capacity_units_of_yojson = long_of_yojson
let capacity_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     write_capacity_units =
       (option_of_yojson
          (value_for_key capacity_units_of_yojson "writeCapacityUnits") _list
          path);
     read_capacity_units =
       (option_of_yojson
          (value_for_key capacity_units_of_yojson "readCapacityUnits") _list
          path);
     throughput_mode =
       (value_for_key throughput_mode_of_yojson "throughputMode" _list path)
   } : capacity_specification)
let encryption_type_of_yojson (tree : t) path =
  (match tree with
   | `String "CUSTOMER_MANAGED_KMS_KEY" -> CUSTOMER_MANAGED_KMS_KEY
   | `String "AWS_OWNED_KMS_KEY" -> AWS_OWNED_KMS_KEY
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "EncryptionType" value)
   | _ -> raise (deserialize_wrong_type_error path "EncryptionType") : 
  encryption_type)
let encryption_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_identifier =
       (option_of_yojson
          (value_for_key kms_key_ar_n_of_yojson "kmsKeyIdentifier") _list
          path);
     type_ = (value_for_key encryption_type_of_yojson "type" _list path)
   } : encryption_specification)
let point_in_time_recovery_status_of_yojson (tree : t) path =
  (match tree with
   | `String "ENABLED" -> ENABLED
   | `String "DISABLED" -> DISABLED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "PointInTimeRecoveryStatus" value)
   | _ ->
       raise (deserialize_wrong_type_error path "PointInTimeRecoveryStatus") : 
  point_in_time_recovery_status)
let point_in_time_recovery_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       (value_for_key point_in_time_recovery_status_of_yojson "status" _list
          path)
   } : point_in_time_recovery)
let time_to_live_status_of_yojson (tree : t) path =
  (match tree with
   | `String "ENABLED" -> ENABLED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "TimeToLiveStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "TimeToLiveStatus") : 
  time_to_live_status)
let time_to_live_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       (value_for_key time_to_live_status_of_yojson "status" _list path)
   } : time_to_live)
let default_time_to_live_of_yojson = int_of_yojson
let client_side_timestamps_status_of_yojson (tree : t) path =
  (match tree with
   | `String "ENABLED" -> ENABLED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "ClientSideTimestampsStatus" value)
   | _ ->
       raise (deserialize_wrong_type_error path "ClientSideTimestampsStatus") : 
  client_side_timestamps_status)
let client_side_timestamps_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       (value_for_key client_side_timestamps_status_of_yojson "status" _list
          path)
   } : client_side_timestamps)
let boolean_object_of_yojson = bool_of_yojson
let integer_object_of_yojson = int_of_yojson
let double_object_of_yojson = double_of_yojson
let target_tracking_scaling_policy_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_value =
       (value_for_key double_object_of_yojson "targetValue" _list path);
     scale_out_cooldown =
       (option_of_yojson
          (value_for_key integer_object_of_yojson "scaleOutCooldown") _list
          path);
     scale_in_cooldown =
       (option_of_yojson
          (value_for_key integer_object_of_yojson "scaleInCooldown") _list
          path);
     disable_scale_in =
       (option_of_yojson
          (value_for_key boolean_object_of_yojson "disableScaleIn") _list
          path)
   } : target_tracking_scaling_policy_configuration)
let auto_scaling_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_tracking_scaling_policy_configuration =
       (option_of_yojson
          (value_for_key
             target_tracking_scaling_policy_configuration_of_yojson
             "targetTrackingScalingPolicyConfiguration") _list path)
   } : auto_scaling_policy)
let auto_scaling_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scaling_policy =
       (option_of_yojson
          (value_for_key auto_scaling_policy_of_yojson "scalingPolicy") _list
          path);
     maximum_units =
       (option_of_yojson
          (value_for_key capacity_units_of_yojson "maximumUnits") _list path);
     minimum_units =
       (option_of_yojson
          (value_for_key capacity_units_of_yojson "minimumUnits") _list path);
     auto_scaling_disabled =
       (option_of_yojson
          (value_for_key boolean_object_of_yojson "autoScalingDisabled")
          _list path)
   } : auto_scaling_settings)
let auto_scaling_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     read_capacity_auto_scaling =
       (option_of_yojson
          (value_for_key auto_scaling_settings_of_yojson
             "readCapacityAutoScaling") _list path);
     write_capacity_auto_scaling =
       (option_of_yojson
          (value_for_key auto_scaling_settings_of_yojson
             "writeCapacityAutoScaling") _list path)
   } : auto_scaling_specification)
let replica_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     read_capacity_auto_scaling =
       (option_of_yojson
          (value_for_key auto_scaling_settings_of_yojson
             "readCapacityAutoScaling") _list path);
     read_capacity_units =
       (option_of_yojson
          (value_for_key capacity_units_of_yojson "readCapacityUnits") _list
          path);
     region = (value_for_key region_of_yojson "region" _list path)
   } : replica_specification)
let replica_specification_list_of_yojson tree path =
  list_of_yojson replica_specification_of_yojson tree path
let update_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_specifications =
       (option_of_yojson
          (value_for_key replica_specification_list_of_yojson
             "replicaSpecifications") _list path);
     auto_scaling_specification =
       (option_of_yojson
          (value_for_key auto_scaling_specification_of_yojson
             "autoScalingSpecification") _list path);
     client_side_timestamps =
       (option_of_yojson
          (value_for_key client_side_timestamps_of_yojson
             "clientSideTimestamps") _list path);
     default_time_to_live =
       (option_of_yojson
          (value_for_key default_time_to_live_of_yojson "defaultTimeToLive")
          _list path);
     ttl =
       (option_of_yojson (value_for_key time_to_live_of_yojson "ttl") _list
          path);
     point_in_time_recovery =
       (option_of_yojson
          (value_for_key point_in_time_recovery_of_yojson
             "pointInTimeRecovery") _list path);
     encryption_specification =
       (option_of_yojson
          (value_for_key encryption_specification_of_yojson
             "encryptionSpecification") _list path);
     capacity_specification =
       (option_of_yojson
          (value_for_key capacity_specification_of_yojson
             "capacitySpecification") _list path);
     add_columns =
       (option_of_yojson
          (value_for_key column_definition_list_of_yojson "addColumns") _list
          path);
     table_name = (value_for_key table_name_of_yojson "tableName" _list path);
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : update_table_request)
let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key base_string_of_yojson "message")
          _list path)
   } : service_quota_exceeded_exception)
let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       (option_of_yojson (value_for_key ar_n_of_yojson "resourceArn") _list
          path);
     message =
       (option_of_yojson (value_for_key base_string_of_yojson "message")
          _list path)
   } : resource_not_found_exception)
let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key base_string_of_yojson "message")
          _list path)
   } : internal_server_exception)
let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key base_string_of_yojson "message")
          _list path)
   } : conflict_exception)
let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key base_string_of_yojson "message")
          _list path)
   } : access_denied_exception)
let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = (value_for_key tag_value_of_yojson "value" _list path);
     key = (value_for_key tag_key_of_yojson "key" _list path)
   } : tag)
let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = (value_for_key tag_list_of_yojson "tags" _list path);
     resource_arn = (value_for_key ar_n_of_yojson "resourceArn" _list path)
   } : untag_resource_request)
let timestamp__of_yojson = timestamp_epoch_seconds_of_yojson
let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = (value_for_key tag_list_of_yojson "tags" _list path);
     resource_arn = (value_for_key ar_n_of_yojson "resourceArn" _list path)
   } : tag_resource_request)
let table_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = (value_for_key ar_n_of_yojson "resourceArn" _list path);
     table_name = (value_for_key table_name_of_yojson "tableName" _list path);
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : table_summary)
let table_summary_list_of_yojson tree path =
  list_of_yojson table_summary_of_yojson tree path
let table_status_of_yojson (tree : t) path =
  (match tree with
   | `String "ACTIVE" -> ACTIVE
   | `String "CREATING" -> CREATING
   | `String "UPDATING" -> UPDATING
   | `String "DELETING" -> DELETING
   | `String "DELETED" -> DELETED
   | `String "RESTORING" -> RESTORING
   | `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS" ->
       INACCESSIBLE_ENCRYPTION_CREDENTIALS
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "TableStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "TableStatus") : table_status)
let static_column_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = (value_for_key generic_string_of_yojson "name" _list path) } : 
    static_column)
let static_column_list_of_yojson tree path =
  list_of_yojson static_column_of_yojson tree path
let sort_order_of_yojson (tree : t) path =
  (match tree with
   | `String "ASC" -> ASC
   | `String "DESC" -> DESC
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "SortOrder" value)
   | _ -> raise (deserialize_wrong_type_error path "SortOrder") : sort_order)
let partition_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = (value_for_key generic_string_of_yojson "name" _list path) } : 
    partition_key)
let partition_key_list_of_yojson tree path =
  list_of_yojson partition_key_of_yojson tree path
let clustering_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     order_by = (value_for_key sort_order_of_yojson "orderBy" _list path);
     name = (value_for_key generic_string_of_yojson "name" _list path)
   } : clustering_key)
let clustering_key_list_of_yojson tree path =
  list_of_yojson clustering_key_of_yojson tree path
let schema_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     static_columns =
       (option_of_yojson
          (value_for_key static_column_list_of_yojson "staticColumns") _list
          path);
     clustering_keys =
       (option_of_yojson
          (value_for_key clustering_key_list_of_yojson "clusteringKeys")
          _list path);
     partition_keys =
       (value_for_key partition_key_list_of_yojson "partitionKeys" _list path);
     all_columns =
       (value_for_key column_definition_list_of_yojson "allColumns" _list
          path)
   } : schema_definition)
let restore_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     restored_table_ar_n =
       (value_for_key ar_n_of_yojson "restoredTableARN" _list path)
   } : restore_table_response)
let restore_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_specifications =
       (option_of_yojson
          (value_for_key replica_specification_list_of_yojson
             "replicaSpecifications") _list path);
     auto_scaling_specification =
       (option_of_yojson
          (value_for_key auto_scaling_specification_of_yojson
             "autoScalingSpecification") _list path);
     tags_override =
       (option_of_yojson (value_for_key tag_list_of_yojson "tagsOverride")
          _list path);
     point_in_time_recovery_override =
       (option_of_yojson
          (value_for_key point_in_time_recovery_of_yojson
             "pointInTimeRecoveryOverride") _list path);
     encryption_specification_override =
       (option_of_yojson
          (value_for_key encryption_specification_of_yojson
             "encryptionSpecificationOverride") _list path);
     capacity_specification_override =
       (option_of_yojson
          (value_for_key capacity_specification_of_yojson
             "capacitySpecificationOverride") _list path);
     restore_timestamp =
       (option_of_yojson
          (value_for_key timestamp__of_yojson "restoreTimestamp") _list path);
     target_table_name =
       (value_for_key table_name_of_yojson "targetTableName" _list path);
     target_keyspace_name =
       (value_for_key keyspace_name_of_yojson "targetKeyspaceName" _list path);
     source_table_name =
       (value_for_key table_name_of_yojson "sourceTableName" _list path);
     source_keyspace_name =
       (value_for_key keyspace_name_of_yojson "sourceKeyspaceName" _list path)
   } : restore_table_request)
let region_list_of_yojson tree path =
  list_of_yojson region_of_yojson tree path
let replication_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_list =
       (option_of_yojson (value_for_key region_list_of_yojson "regionList")
          _list path);
     replication_strategy =
       (value_for_key rs_of_yojson "replicationStrategy" _list path)
   } : replication_specification)
let capacity_specification_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_update_to_pay_per_request_timestamp =
       (option_of_yojson
          (value_for_key timestamp__of_yojson
             "lastUpdateToPayPerRequestTimestamp") _list path);
     write_capacity_units =
       (option_of_yojson
          (value_for_key capacity_units_of_yojson "writeCapacityUnits") _list
          path);
     read_capacity_units =
       (option_of_yojson
          (value_for_key capacity_units_of_yojson "readCapacityUnits") _list
          path);
     throughput_mode =
       (value_for_key throughput_mode_of_yojson "throughputMode" _list path)
   } : capacity_specification_summary)
let replica_specification_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_specification =
       (option_of_yojson
          (value_for_key capacity_specification_summary_of_yojson
             "capacitySpecification") _list path);
     status =
       (option_of_yojson (value_for_key table_status_of_yojson "status")
          _list path);
     region =
       (option_of_yojson (value_for_key region_of_yojson "region") _list path)
   } : replica_specification_summary)
let replica_specification_summary_list_of_yojson tree path =
  list_of_yojson replica_specification_summary_of_yojson tree path
let replica_auto_scaling_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_scaling_specification =
       (option_of_yojson
          (value_for_key auto_scaling_specification_of_yojson
             "autoScalingSpecification") _list path);
     region =
       (option_of_yojson (value_for_key region_of_yojson "region") _list path)
   } : replica_auto_scaling_specification)
let replica_auto_scaling_specification_list_of_yojson tree path =
  list_of_yojson replica_auto_scaling_specification_of_yojson tree path
let point_in_time_recovery_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     earliest_restorable_timestamp =
       (option_of_yojson
          (value_for_key timestamp__of_yojson "earliestRestorableTimestamp")
          _list path);
     status =
       (value_for_key point_in_time_recovery_status_of_yojson "status" _list
          path)
   } : point_in_time_recovery_summary)
let next_token_of_yojson = string_of_yojson
let max_results_of_yojson = int_of_yojson
let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path)
   } : list_tags_for_resource_response)
let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "maxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path);
     resource_arn = (value_for_key ar_n_of_yojson "resourceArn" _list path)
   } : list_tags_for_resource_request)
let list_tables_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tables =
       (option_of_yojson
          (value_for_key table_summary_list_of_yojson "tables") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path)
   } : list_tables_response)
let list_tables_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "maxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path)
   } : list_tables_request)
let keyspace_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_regions =
       (option_of_yojson
          (value_for_key region_list_of_yojson "replicationRegions") _list
          path);
     replication_strategy =
       (value_for_key rs_of_yojson "replicationStrategy" _list path);
     resource_arn = (value_for_key ar_n_of_yojson "resourceArn" _list path);
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : keyspace_summary)
let keyspace_summary_list_of_yojson tree path =
  list_of_yojson keyspace_summary_of_yojson tree path
let list_keyspaces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     keyspaces =
       (value_for_key keyspace_summary_list_of_yojson "keyspaces" _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path)
   } : list_keyspaces_response)
let list_keyspaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "maxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path)
   } : list_keyspaces_request)
let get_table_auto_scaling_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_specifications =
       (option_of_yojson
          (value_for_key replica_auto_scaling_specification_list_of_yojson
             "replicaSpecifications") _list path);
     auto_scaling_specification =
       (option_of_yojson
          (value_for_key auto_scaling_specification_of_yojson
             "autoScalingSpecification") _list path);
     resource_arn = (value_for_key ar_n_of_yojson "resourceArn" _list path);
     table_name = (value_for_key table_name_of_yojson "tableName" _list path);
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : get_table_auto_scaling_settings_response)
let get_table_auto_scaling_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = (value_for_key table_name_of_yojson "tableName" _list path);
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : get_table_auto_scaling_settings_request)
let comment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = (value_for_key base_string_of_yojson "message" _list path) } : 
    comment)
let get_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_specifications =
       (option_of_yojson
          (value_for_key replica_specification_summary_list_of_yojson
             "replicaSpecifications") _list path);
     client_side_timestamps =
       (option_of_yojson
          (value_for_key client_side_timestamps_of_yojson
             "clientSideTimestamps") _list path);
     comment =
       (option_of_yojson (value_for_key comment_of_yojson "comment") _list
          path);
     default_time_to_live =
       (option_of_yojson
          (value_for_key default_time_to_live_of_yojson "defaultTimeToLive")
          _list path);
     ttl =
       (option_of_yojson (value_for_key time_to_live_of_yojson "ttl") _list
          path);
     point_in_time_recovery =
       (option_of_yojson
          (value_for_key point_in_time_recovery_summary_of_yojson
             "pointInTimeRecovery") _list path);
     encryption_specification =
       (option_of_yojson
          (value_for_key encryption_specification_of_yojson
             "encryptionSpecification") _list path);
     capacity_specification =
       (option_of_yojson
          (value_for_key capacity_specification_summary_of_yojson
             "capacitySpecification") _list path);
     schema_definition =
       (option_of_yojson
          (value_for_key schema_definition_of_yojson "schemaDefinition")
          _list path);
     status =
       (option_of_yojson (value_for_key table_status_of_yojson "status")
          _list path);
     creation_timestamp =
       (option_of_yojson
          (value_for_key timestamp__of_yojson "creationTimestamp") _list path);
     resource_arn = (value_for_key ar_n_of_yojson "resourceArn" _list path);
     table_name = (value_for_key table_name_of_yojson "tableName" _list path);
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : get_table_response)
let get_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = (value_for_key table_name_of_yojson "tableName" _list path);
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : get_table_request)
let get_keyspace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_regions =
       (option_of_yojson
          (value_for_key region_list_of_yojson "replicationRegions") _list
          path);
     replication_strategy =
       (value_for_key rs_of_yojson "replicationStrategy" _list path);
     resource_arn = (value_for_key ar_n_of_yojson "resourceArn" _list path);
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : get_keyspace_response)
let get_keyspace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : get_keyspace_request)
let delete_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = (value_for_key table_name_of_yojson "tableName" _list path);
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : delete_table_request)
let delete_keyspace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_keyspace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : delete_keyspace_request)
let create_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = (value_for_key ar_n_of_yojson "resourceArn" _list path) } : 
    create_table_response)
let create_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_specifications =
       (option_of_yojson
          (value_for_key replica_specification_list_of_yojson
             "replicaSpecifications") _list path);
     auto_scaling_specification =
       (option_of_yojson
          (value_for_key auto_scaling_specification_of_yojson
             "autoScalingSpecification") _list path);
     client_side_timestamps =
       (option_of_yojson
          (value_for_key client_side_timestamps_of_yojson
             "clientSideTimestamps") _list path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path);
     default_time_to_live =
       (option_of_yojson
          (value_for_key default_time_to_live_of_yojson "defaultTimeToLive")
          _list path);
     ttl =
       (option_of_yojson (value_for_key time_to_live_of_yojson "ttl") _list
          path);
     point_in_time_recovery =
       (option_of_yojson
          (value_for_key point_in_time_recovery_of_yojson
             "pointInTimeRecovery") _list path);
     encryption_specification =
       (option_of_yojson
          (value_for_key encryption_specification_of_yojson
             "encryptionSpecification") _list path);
     capacity_specification =
       (option_of_yojson
          (value_for_key capacity_specification_of_yojson
             "capacitySpecification") _list path);
     comment =
       (option_of_yojson (value_for_key comment_of_yojson "comment") _list
          path);
     schema_definition =
       (value_for_key schema_definition_of_yojson "schemaDefinition" _list
          path);
     table_name = (value_for_key table_name_of_yojson "tableName" _list path);
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : create_table_request)
let create_keyspace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = (value_for_key ar_n_of_yojson "resourceArn" _list path) } : 
    create_keyspace_response)
let create_keyspace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_specification =
       (option_of_yojson
          (value_for_key replication_specification_of_yojson
             "replicationSpecification") _list path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path);
     keyspace_name =
       (value_for_key keyspace_name_of_yojson "keyspaceName" _list path)
   } : create_keyspace_request)
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson