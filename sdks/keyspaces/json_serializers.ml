open Smaws_Lib.Json.SerializeHelpers
open Types

let ar_n_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let double_object_to_yojson = double_to_yojson
let integer_object_to_yojson = int_to_yojson
let boolean_object_to_yojson = bool_to_yojson

let target_tracking_scaling_policy_configuration_to_yojson
    (x : target_tracking_scaling_policy_configuration) =
  assoc_to_yojson
    [
      ("disableScaleIn", option_to_yojson boolean_object_to_yojson x.disable_scale_in);
      ("scaleInCooldown", option_to_yojson integer_object_to_yojson x.scale_in_cooldown);
      ("scaleOutCooldown", option_to_yojson integer_object_to_yojson x.scale_out_cooldown);
      ("targetValue", Some (double_object_to_yojson x.target_value));
    ]

let auto_scaling_policy_to_yojson (x : auto_scaling_policy) =
  assoc_to_yojson
    [
      ( "targetTrackingScalingPolicyConfiguration",
        option_to_yojson target_tracking_scaling_policy_configuration_to_yojson
          x.target_tracking_scaling_policy_configuration );
    ]

let capacity_units_to_yojson = long_to_yojson

let auto_scaling_settings_to_yojson (x : auto_scaling_settings) =
  assoc_to_yojson
    [
      ("autoScalingDisabled", option_to_yojson boolean_object_to_yojson x.auto_scaling_disabled);
      ("minimumUnits", option_to_yojson capacity_units_to_yojson x.minimum_units);
      ("maximumUnits", option_to_yojson capacity_units_to_yojson x.maximum_units);
      ("scalingPolicy", option_to_yojson auto_scaling_policy_to_yojson x.scaling_policy);
    ]

let auto_scaling_specification_to_yojson (x : auto_scaling_specification) =
  assoc_to_yojson
    [
      ( "writeCapacityAutoScaling",
        option_to_yojson auto_scaling_settings_to_yojson x.write_capacity_auto_scaling );
      ( "readCapacityAutoScaling",
        option_to_yojson auto_scaling_settings_to_yojson x.read_capacity_auto_scaling );
    ]

let throughput_mode_to_yojson (x : throughput_mode) =
  match x with PAY_PER_REQUEST -> `String "PAY_PER_REQUEST" | PROVISIONED -> `String "PROVISIONED"

let capacity_specification_to_yojson (x : capacity_specification) =
  assoc_to_yojson
    [
      ("throughputMode", Some (throughput_mode_to_yojson x.throughput_mode));
      ("readCapacityUnits", option_to_yojson capacity_units_to_yojson x.read_capacity_units);
      ("writeCapacityUnits", option_to_yojson capacity_units_to_yojson x.write_capacity_units);
    ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let capacity_specification_summary_to_yojson (x : capacity_specification_summary) =
  assoc_to_yojson
    [
      ("throughputMode", Some (throughput_mode_to_yojson x.throughput_mode));
      ("readCapacityUnits", option_to_yojson capacity_units_to_yojson x.read_capacity_units);
      ("writeCapacityUnits", option_to_yojson capacity_units_to_yojson x.write_capacity_units);
      ( "lastUpdateToPayPerRequestTimestamp",
        option_to_yojson timestamp_to_yojson x.last_update_to_pay_per_request_timestamp );
    ]

let cdc_propagate_tags_to_yojson (x : cdc_propagate_tags) =
  match x with TABLE -> `String "TABLE" | NONE -> `String "NONE"

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let view_type_to_yojson (x : view_type) =
  match x with
  | NEW_IMAGE -> `String "NEW_IMAGE"
  | OLD_IMAGE -> `String "OLD_IMAGE"
  | KEYS_ONLY -> `String "KEYS_ONLY"
  | NEW_AND_OLD_IMAGES -> `String "NEW_AND_OLD_IMAGES"

let cdc_status_to_yojson (x : cdc_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"
  | DISABLED -> `String "DISABLED"
  | DISABLING -> `String "DISABLING"

let cdc_specification_to_yojson (x : cdc_specification) =
  assoc_to_yojson
    [
      ("status", Some (cdc_status_to_yojson x.status));
      ("viewType", option_to_yojson view_type_to_yojson x.view_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("propagateTags", option_to_yojson cdc_propagate_tags_to_yojson x.propagate_tags);
    ]

let cdc_specification_summary_to_yojson (x : cdc_specification_summary) =
  assoc_to_yojson
    [
      ("status", Some (cdc_status_to_yojson x.status));
      ("viewType", option_to_yojson view_type_to_yojson x.view_type);
    ]

let client_side_timestamps_status_to_yojson (x : client_side_timestamps_status) =
  match x with ENABLED -> `String "ENABLED"

let client_side_timestamps_to_yojson (x : client_side_timestamps) =
  assoc_to_yojson [ ("status", Some (client_side_timestamps_status_to_yojson x.status)) ]

let sort_order_to_yojson (x : sort_order) =
  match x with ASC -> `String "ASC" | DESC -> `String "DESC"

let generic_string_to_yojson = string_to_yojson

let clustering_key_to_yojson (x : clustering_key) =
  assoc_to_yojson
    [
      ("name", Some (generic_string_to_yojson x.name));
      ("orderBy", Some (sort_order_to_yojson x.order_by));
    ]

let clustering_key_list_to_yojson tree = list_to_yojson clustering_key_to_yojson tree

let column_definition_to_yojson (x : column_definition) =
  assoc_to_yojson
    [
      ("name", Some (generic_string_to_yojson x.name));
      ("type", Some (generic_string_to_yojson x.type_));
    ]

let column_definition_list_to_yojson tree = list_to_yojson column_definition_to_yojson tree

let comment_to_yojson (x : comment) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let create_keyspace_response_to_yojson (x : create_keyspace_response) =
  assoc_to_yojson [ ("resourceArn", Some (ar_n_to_yojson x.resource_arn)) ]

let region_to_yojson = string_to_yojson
let region_list_to_yojson tree = list_to_yojson region_to_yojson tree

let rs_to_yojson (x : rs) =
  match x with SINGLE_REGION -> `String "SINGLE_REGION" | MULTI_REGION -> `String "MULTI_REGION"

let replication_specification_to_yojson (x : replication_specification) =
  assoc_to_yojson
    [
      ("replicationStrategy", Some (rs_to_yojson x.replication_strategy));
      ("regionList", option_to_yojson region_list_to_yojson x.region_list);
    ]

let keyspace_name_to_yojson = string_to_yojson

let create_keyspace_request_to_yojson (x : create_keyspace_request) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "replicationSpecification",
        option_to_yojson replication_specification_to_yojson x.replication_specification );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("resourceArn", option_to_yojson ar_n_to_yojson x.resource_arn);
    ]

let create_table_response_to_yojson (x : create_table_response) =
  assoc_to_yojson [ ("resourceArn", Some (ar_n_to_yojson x.resource_arn)) ]

let warm_throughput_specification_to_yojson (x : warm_throughput_specification) =
  assoc_to_yojson
    [
      ( "readUnitsPerSecond",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.read_units_per_second );
      ( "writeUnitsPerSecond",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.write_units_per_second );
    ]

let replica_specification_to_yojson (x : replica_specification) =
  assoc_to_yojson
    [
      ("region", Some (region_to_yojson x.region));
      ("readCapacityUnits", option_to_yojson capacity_units_to_yojson x.read_capacity_units);
      ( "readCapacityAutoScaling",
        option_to_yojson auto_scaling_settings_to_yojson x.read_capacity_auto_scaling );
    ]

let replica_specification_list_to_yojson tree = list_to_yojson replica_specification_to_yojson tree
let default_time_to_live_to_yojson = int_to_yojson

let time_to_live_status_to_yojson (x : time_to_live_status) =
  match x with ENABLED -> `String "ENABLED"

let time_to_live_to_yojson (x : time_to_live) =
  assoc_to_yojson [ ("status", Some (time_to_live_status_to_yojson x.status)) ]

let point_in_time_recovery_status_to_yojson (x : point_in_time_recovery_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let point_in_time_recovery_to_yojson (x : point_in_time_recovery) =
  assoc_to_yojson [ ("status", Some (point_in_time_recovery_status_to_yojson x.status)) ]

let kms_key_ar_n_to_yojson = string_to_yojson

let encryption_type_to_yojson (x : encryption_type) =
  match x with
  | CUSTOMER_MANAGED_KMS_KEY -> `String "CUSTOMER_MANAGED_KMS_KEY"
  | AWS_OWNED_KMS_KEY -> `String "AWS_OWNED_KMS_KEY"

let encryption_specification_to_yojson (x : encryption_specification) =
  assoc_to_yojson
    [
      ("type", Some (encryption_type_to_yojson x.type_));
      ("kmsKeyIdentifier", option_to_yojson kms_key_ar_n_to_yojson x.kms_key_identifier);
    ]

let static_column_to_yojson (x : static_column) =
  assoc_to_yojson [ ("name", Some (generic_string_to_yojson x.name)) ]

let static_column_list_to_yojson tree = list_to_yojson static_column_to_yojson tree

let partition_key_to_yojson (x : partition_key) =
  assoc_to_yojson [ ("name", Some (generic_string_to_yojson x.name)) ]

let partition_key_list_to_yojson tree = list_to_yojson partition_key_to_yojson tree

let schema_definition_to_yojson (x : schema_definition) =
  assoc_to_yojson
    [
      ("allColumns", Some (column_definition_list_to_yojson x.all_columns));
      ("partitionKeys", Some (partition_key_list_to_yojson x.partition_keys));
      ("clusteringKeys", option_to_yojson clustering_key_list_to_yojson x.clustering_keys);
      ("staticColumns", option_to_yojson static_column_list_to_yojson x.static_columns);
    ]

let table_name_to_yojson = string_to_yojson

let create_table_request_to_yojson (x : create_table_request) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("tableName", Some (table_name_to_yojson x.table_name));
      ("schemaDefinition", Some (schema_definition_to_yojson x.schema_definition));
      ("comment", option_to_yojson comment_to_yojson x.comment);
      ( "capacitySpecification",
        option_to_yojson capacity_specification_to_yojson x.capacity_specification );
      ( "encryptionSpecification",
        option_to_yojson encryption_specification_to_yojson x.encryption_specification );
      ( "pointInTimeRecovery",
        option_to_yojson point_in_time_recovery_to_yojson x.point_in_time_recovery );
      ("ttl", option_to_yojson time_to_live_to_yojson x.ttl);
      ("defaultTimeToLive", option_to_yojson default_time_to_live_to_yojson x.default_time_to_live);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "clientSideTimestamps",
        option_to_yojson client_side_timestamps_to_yojson x.client_side_timestamps );
      ( "autoScalingSpecification",
        option_to_yojson auto_scaling_specification_to_yojson x.auto_scaling_specification );
      ( "replicaSpecifications",
        option_to_yojson replica_specification_list_to_yojson x.replica_specifications );
      ("cdcSpecification", option_to_yojson cdc_specification_to_yojson x.cdc_specification);
      ( "warmThroughputSpecification",
        option_to_yojson warm_throughput_specification_to_yojson x.warm_throughput_specification );
    ]

let type_name_to_yojson = string_to_yojson

let create_type_response_to_yojson (x : create_type_response) =
  assoc_to_yojson
    [
      ("keyspaceArn", Some (ar_n_to_yojson x.keyspace_arn));
      ("typeName", Some (type_name_to_yojson x.type_name));
    ]

let field_definition_to_yojson (x : field_definition) =
  assoc_to_yojson
    [
      ("name", Some (generic_string_to_yojson x.name));
      ("type", Some (generic_string_to_yojson x.type_));
    ]

let field_list_to_yojson tree = list_to_yojson field_definition_to_yojson tree

let create_type_request_to_yojson (x : create_type_request) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("typeName", Some (type_name_to_yojson x.type_name));
      ("fieldDefinitions", Some (field_list_to_yojson x.field_definitions));
    ]

let delete_keyspace_response_to_yojson = unit_to_yojson

let delete_keyspace_request_to_yojson (x : delete_keyspace_request) =
  assoc_to_yojson [ ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name)) ]

let delete_table_response_to_yojson = unit_to_yojson

let delete_table_request_to_yojson (x : delete_table_request) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("tableName", Some (table_name_to_yojson x.table_name));
    ]

let delete_type_response_to_yojson (x : delete_type_response) =
  assoc_to_yojson
    [
      ("keyspaceArn", Some (ar_n_to_yojson x.keyspace_arn));
      ("typeName", Some (type_name_to_yojson x.type_name));
    ]

let delete_type_request_to_yojson (x : delete_type_request) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("typeName", Some (type_name_to_yojson x.type_name));
    ]

let depth_to_yojson = int_to_yojson
let tables_replication_progress_to_yojson = string_to_yojson

let keyspace_status_to_yojson (x : keyspace_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"

let replication_group_status_to_yojson (x : replication_group_status) =
  assoc_to_yojson
    [
      ("region", Some (region_to_yojson x.region));
      ("keyspaceStatus", Some (keyspace_status_to_yojson x.keyspace_status));
      ( "tablesReplicationProgress",
        option_to_yojson tables_replication_progress_to_yojson x.tables_replication_progress );
    ]

let replication_group_status_list_to_yojson tree =
  list_to_yojson replication_group_status_to_yojson tree

let get_keyspace_response_to_yojson (x : get_keyspace_response) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("resourceArn", Some (ar_n_to_yojson x.resource_arn));
      ("replicationStrategy", Some (rs_to_yojson x.replication_strategy));
      ("replicationRegions", option_to_yojson region_list_to_yojson x.replication_regions);
      ( "replicationGroupStatuses",
        option_to_yojson replication_group_status_list_to_yojson x.replication_group_statuses );
    ]

let get_keyspace_request_to_yojson (x : get_keyspace_request) =
  assoc_to_yojson [ ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name)) ]

let warm_throughput_status_to_yojson (x : warm_throughput_status) =
  match x with AVAILABLE -> `String "AVAILABLE" | UPDATING -> `String "UPDATING"

let warm_throughput_specification_summary_to_yojson (x : warm_throughput_specification_summary) =
  assoc_to_yojson
    [
      ( "readUnitsPerSecond",
        Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.read_units_per_second) );
      ( "writeUnitsPerSecond",
        Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.write_units_per_second) );
      ("status", Some (warm_throughput_status_to_yojson x.status));
    ]

let stream_arn_to_yojson = string_to_yojson

let table_status_to_yojson (x : table_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"
  | RESTORING -> `String "RESTORING"
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS -> `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS"

let replica_specification_summary_to_yojson (x : replica_specification_summary) =
  assoc_to_yojson
    [
      ("region", option_to_yojson region_to_yojson x.region);
      ("status", option_to_yojson table_status_to_yojson x.status);
      ( "capacitySpecification",
        option_to_yojson capacity_specification_summary_to_yojson x.capacity_specification );
      ( "warmThroughputSpecification",
        option_to_yojson warm_throughput_specification_summary_to_yojson
          x.warm_throughput_specification );
    ]

let replica_specification_summary_list_to_yojson tree =
  list_to_yojson replica_specification_summary_to_yojson tree

let point_in_time_recovery_summary_to_yojson (x : point_in_time_recovery_summary) =
  assoc_to_yojson
    [
      ("status", Some (point_in_time_recovery_status_to_yojson x.status));
      ( "earliestRestorableTimestamp",
        option_to_yojson timestamp_to_yojson x.earliest_restorable_timestamp );
    ]

let get_table_response_to_yojson (x : get_table_response) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("tableName", Some (table_name_to_yojson x.table_name));
      ("resourceArn", Some (ar_n_to_yojson x.resource_arn));
      ("creationTimestamp", option_to_yojson timestamp_to_yojson x.creation_timestamp);
      ("status", option_to_yojson table_status_to_yojson x.status);
      ("schemaDefinition", option_to_yojson schema_definition_to_yojson x.schema_definition);
      ( "capacitySpecification",
        option_to_yojson capacity_specification_summary_to_yojson x.capacity_specification );
      ( "encryptionSpecification",
        option_to_yojson encryption_specification_to_yojson x.encryption_specification );
      ( "pointInTimeRecovery",
        option_to_yojson point_in_time_recovery_summary_to_yojson x.point_in_time_recovery );
      ("ttl", option_to_yojson time_to_live_to_yojson x.ttl);
      ("defaultTimeToLive", option_to_yojson default_time_to_live_to_yojson x.default_time_to_live);
      ("comment", option_to_yojson comment_to_yojson x.comment);
      ( "clientSideTimestamps",
        option_to_yojson client_side_timestamps_to_yojson x.client_side_timestamps );
      ( "replicaSpecifications",
        option_to_yojson replica_specification_summary_list_to_yojson x.replica_specifications );
      ("latestStreamArn", option_to_yojson stream_arn_to_yojson x.latest_stream_arn);
      ("cdcSpecification", option_to_yojson cdc_specification_summary_to_yojson x.cdc_specification);
      ( "warmThroughputSpecification",
        option_to_yojson warm_throughput_specification_summary_to_yojson
          x.warm_throughput_specification );
    ]

let get_table_request_to_yojson (x : get_table_request) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("tableName", Some (table_name_to_yojson x.table_name));
    ]

let replica_auto_scaling_specification_to_yojson (x : replica_auto_scaling_specification) =
  assoc_to_yojson
    [
      ("region", option_to_yojson region_to_yojson x.region);
      ( "autoScalingSpecification",
        option_to_yojson auto_scaling_specification_to_yojson x.auto_scaling_specification );
    ]

let replica_auto_scaling_specification_list_to_yojson tree =
  list_to_yojson replica_auto_scaling_specification_to_yojson tree

let get_table_auto_scaling_settings_response_to_yojson
    (x : get_table_auto_scaling_settings_response) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("tableName", Some (table_name_to_yojson x.table_name));
      ("resourceArn", Some (ar_n_to_yojson x.resource_arn));
      ( "autoScalingSpecification",
        option_to_yojson auto_scaling_specification_to_yojson x.auto_scaling_specification );
      ( "replicaSpecifications",
        option_to_yojson replica_auto_scaling_specification_list_to_yojson x.replica_specifications
      );
    ]

let get_table_auto_scaling_settings_request_to_yojson (x : get_table_auto_scaling_settings_request)
    =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("tableName", Some (table_name_to_yojson x.table_name));
    ]

let type_name_list_to_yojson tree = list_to_yojson type_name_to_yojson tree
let table_name_list_to_yojson tree = list_to_yojson table_name_to_yojson tree

let type_status_to_yojson (x : type_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | RESTORING -> `String "RESTORING"

let get_type_response_to_yojson (x : get_type_response) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("typeName", Some (type_name_to_yojson x.type_name));
      ("fieldDefinitions", option_to_yojson field_list_to_yojson x.field_definitions);
      ("lastModifiedTimestamp", option_to_yojson timestamp_to_yojson x.last_modified_timestamp);
      ("status", option_to_yojson type_status_to_yojson x.status);
      ("directReferringTables", option_to_yojson table_name_list_to_yojson x.direct_referring_tables);
      ("directParentTypes", option_to_yojson type_name_list_to_yojson x.direct_parent_types);
      ("maxNestingDepth", option_to_yojson depth_to_yojson x.max_nesting_depth);
      ("keyspaceArn", Some (ar_n_to_yojson x.keyspace_arn));
    ]

let get_type_request_to_yojson (x : get_type_request) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("typeName", Some (type_name_to_yojson x.type_name));
    ]

let keyspace_summary_to_yojson (x : keyspace_summary) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("resourceArn", Some (ar_n_to_yojson x.resource_arn));
      ("replicationStrategy", Some (rs_to_yojson x.replication_strategy));
      ("replicationRegions", option_to_yojson region_list_to_yojson x.replication_regions);
    ]

let keyspace_summary_list_to_yojson tree = list_to_yojson keyspace_summary_to_yojson tree

let update_table_response_to_yojson (x : update_table_response) =
  assoc_to_yojson [ ("resourceArn", Some (ar_n_to_yojson x.resource_arn)) ]

let update_table_request_to_yojson (x : update_table_request) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("tableName", Some (table_name_to_yojson x.table_name));
      ("addColumns", option_to_yojson column_definition_list_to_yojson x.add_columns);
      ( "capacitySpecification",
        option_to_yojson capacity_specification_to_yojson x.capacity_specification );
      ( "encryptionSpecification",
        option_to_yojson encryption_specification_to_yojson x.encryption_specification );
      ( "pointInTimeRecovery",
        option_to_yojson point_in_time_recovery_to_yojson x.point_in_time_recovery );
      ("ttl", option_to_yojson time_to_live_to_yojson x.ttl);
      ("defaultTimeToLive", option_to_yojson default_time_to_live_to_yojson x.default_time_to_live);
      ( "clientSideTimestamps",
        option_to_yojson client_side_timestamps_to_yojson x.client_side_timestamps );
      ( "autoScalingSpecification",
        option_to_yojson auto_scaling_specification_to_yojson x.auto_scaling_specification );
      ( "replicaSpecifications",
        option_to_yojson replica_specification_list_to_yojson x.replica_specifications );
      ("cdcSpecification", option_to_yojson cdc_specification_to_yojson x.cdc_specification);
      ( "warmThroughputSpecification",
        option_to_yojson warm_throughput_specification_to_yojson x.warm_throughput_specification );
    ]

let update_keyspace_response_to_yojson (x : update_keyspace_response) =
  assoc_to_yojson [ ("resourceArn", Some (ar_n_to_yojson x.resource_arn)) ]

let update_keyspace_request_to_yojson (x : update_keyspace_request) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ( "replicationSpecification",
        Some (replication_specification_to_yojson x.replication_specification) );
      ( "clientSideTimestamps",
        option_to_yojson client_side_timestamps_to_yojson x.client_side_timestamps );
    ]

let untag_resource_response_to_yojson = unit_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (ar_n_to_yojson x.resource_arn));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (ar_n_to_yojson x.resource_arn));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let restore_table_response_to_yojson (x : restore_table_response) =
  assoc_to_yojson [ ("restoredTableARN", Some (ar_n_to_yojson x.restored_table_ar_n)) ]

let restore_table_request_to_yojson (x : restore_table_request) =
  assoc_to_yojson
    [
      ("sourceKeyspaceName", Some (keyspace_name_to_yojson x.source_keyspace_name));
      ("sourceTableName", Some (table_name_to_yojson x.source_table_name));
      ("targetKeyspaceName", Some (keyspace_name_to_yojson x.target_keyspace_name));
      ("targetTableName", Some (table_name_to_yojson x.target_table_name));
      ("restoreTimestamp", option_to_yojson timestamp_to_yojson x.restore_timestamp);
      ( "capacitySpecificationOverride",
        option_to_yojson capacity_specification_to_yojson x.capacity_specification_override );
      ( "encryptionSpecificationOverride",
        option_to_yojson encryption_specification_to_yojson x.encryption_specification_override );
      ( "pointInTimeRecoveryOverride",
        option_to_yojson point_in_time_recovery_to_yojson x.point_in_time_recovery_override );
      ("tagsOverride", option_to_yojson tag_list_to_yojson x.tags_override);
      ( "autoScalingSpecification",
        option_to_yojson auto_scaling_specification_to_yojson x.auto_scaling_specification );
      ( "replicaSpecifications",
        option_to_yojson replica_specification_list_to_yojson x.replica_specifications );
    ]

let next_token_to_yojson = string_to_yojson

let list_types_response_to_yojson (x : list_types_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("types", Some (type_name_list_to_yojson x.types));
    ]

let max_results_to_yojson = int_to_yojson

let list_types_request_to_yojson (x : list_types_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (ar_n_to_yojson x.resource_arn));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let table_summary_to_yojson (x : table_summary) =
  assoc_to_yojson
    [
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("tableName", Some (table_name_to_yojson x.table_name));
      ("resourceArn", Some (ar_n_to_yojson x.resource_arn));
    ]

let table_summary_list_to_yojson tree = list_to_yojson table_summary_to_yojson tree

let list_tables_response_to_yojson (x : list_tables_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("tables", option_to_yojson table_summary_list_to_yojson x.tables);
    ]

let list_tables_request_to_yojson (x : list_tables_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
    ]

let list_keyspaces_response_to_yojson (x : list_keyspaces_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("keyspaces", Some (keyspace_summary_list_to_yojson x.keyspaces));
    ]

let list_keyspaces_request_to_yojson (x : list_keyspaces_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]
