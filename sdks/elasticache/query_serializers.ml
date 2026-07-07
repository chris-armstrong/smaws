open Types

let exception_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let user_quota_exceeded_fault_to_query path (x : user_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let user_not_found_fault_to_query path (x : user_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let user_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let engine_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let user_group_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let user_group_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" user_group_id_to_query path xs

let authentication_type_to_query path (x : authentication_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with IAM -> "iam" | NO_PASSWORD -> "no-password" | PASSWORD -> "password")

let integer_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let authentication_to_query path (x : authentication) =
  List.concat
    [
      (match x.password_count with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PasswordCount" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> authentication_type_to_query (List.append path [ "Type" ]) v);
    ]

let user_to_query path (x : user) =
  List.concat
    [
      (match x.ar_n with None -> [] | Some v -> string__to_query (List.append path [ "ARN" ]) v);
      (match x.authentication with
      | None -> []
      | Some v -> authentication_to_query (List.append path [ "Authentication" ]) v);
      (match x.user_group_ids with
      | None -> []
      | Some v -> user_group_id_list_to_query (List.append path [ "UserGroupIds" ]) v);
      (match x.access_string with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AccessString" ]) v);
      (match x.minimum_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MinimumEngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> engine_type_to_query (List.append path [ "Engine" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "UserName" ]) v);
      (match x.user_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "UserId" ]) v);
    ]

let user_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" user_to_query path xs

let user_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let user_id_list_input_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" user_id_to_query path xs

let user_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" user_id_to_query path xs

let user_groups_update_status_to_query path (x : user_groups_update_status) =
  List.concat
    [
      (match x.user_group_ids_to_remove with
      | None -> []
      | Some v -> user_group_id_list_to_query (List.append path [ "UserGroupIdsToRemove" ]) v);
      (match x.user_group_ids_to_add with
      | None -> []
      | Some v -> user_group_id_list_to_query (List.append path [ "UserGroupIdsToAdd" ]) v);
    ]

let user_group_quota_exceeded_fault_to_query path (x : user_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let user_group_pending_changes_to_query path (x : user_group_pending_changes) =
  List.concat
    [
      (match x.user_ids_to_add with
      | None -> []
      | Some v -> user_id_list_to_query (List.append path [ "UserIdsToAdd" ]) v);
      (match x.user_ids_to_remove with
      | None -> []
      | Some v -> user_id_list_to_query (List.append path [ "UserIdsToRemove" ]) v);
    ]

let user_group_not_found_fault_to_query path (x : user_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let ug_replication_group_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let ug_serverless_cache_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let user_group_to_query path (x : user_group) =
  List.concat
    [
      (match x.ar_n with None -> [] | Some v -> string__to_query (List.append path [ "ARN" ]) v);
      (match x.serverless_caches with
      | None -> []
      | Some v -> ug_serverless_cache_id_list_to_query (List.append path [ "ServerlessCaches" ]) v);
      (match x.replication_groups with
      | None -> []
      | Some v -> ug_replication_group_id_list_to_query (List.append path [ "ReplicationGroups" ]) v);
      (match x.pending_changes with
      | None -> []
      | Some v -> user_group_pending_changes_to_query (List.append path [ "PendingChanges" ]) v);
      (match x.minimum_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MinimumEngineVersion" ]) v);
      (match x.user_ids with
      | None -> []
      | Some v -> user_id_list_to_query (List.append path [ "UserIds" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> engine_type_to_query (List.append path [ "Engine" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.user_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "UserGroupId" ]) v);
    ]

let user_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" user_group_to_query path xs

let user_group_id_list_input_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" user_group_id_to_query path xs

let user_group_already_exists_fault_to_query path (x : user_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let user_already_exists_fault_to_query path (x : user_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let t_stamp_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let service_update_severity_to_query path (x : service_update_severity) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | LOW -> "low"
    | MEDIUM -> "medium"
    | IMPORTANT -> "important"
    | CRITICAL -> "critical")

let service_update_status_to_query path (x : service_update_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with EXPIRED -> "expired" | CANCELLED -> "cancelled" | AVAILABLE -> "available")

let service_update_type_to_query path (x : service_update_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SECURITY_UPDATE -> "security-update")

let update_action_status_to_query path (x : update_action_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NOT_APPLICABLE -> "not-applicable"
    | SCHEDULED -> "scheduled"
    | SCHEDULING -> "scheduling"
    | COMPLETE -> "complete"
    | STOPPED -> "stopped"
    | STOPPING -> "stopping"
    | IN_PROGRESS -> "in-progress"
    | WAITING_TO_START -> "waiting-to-start"
    | NOT_APPLIED -> "not-applied")

let sla_met_to_query path (x : sla_met) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with NA -> "n/a" | NO -> "no" | YES -> "yes")

let node_update_status_to_query path (x : node_update_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | COMPLETE -> "complete"
    | STOPPED -> "stopped"
    | STOPPING -> "stopping"
    | IN_PROGRESS -> "in-progress"
    | WAITING_TO_START -> "waiting-to-start"
    | NOT_APPLIED -> "not-applied")

let node_update_initiated_by_to_query path (x : node_update_initiated_by) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with CUSTOMER -> "customer" | SYSTEM -> "system")

let node_group_member_update_status_to_query path (x : node_group_member_update_status) =
  List.concat
    [
      (match x.node_update_status_modified_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NodeUpdateStatusModifiedDate" ]) v);
      (match x.node_update_initiated_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NodeUpdateInitiatedDate" ]) v);
      (match x.node_update_initiated_by with
      | None -> []
      | Some v -> node_update_initiated_by_to_query (List.append path [ "NodeUpdateInitiatedBy" ]) v);
      (match x.node_update_end_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NodeUpdateEndDate" ]) v);
      (match x.node_update_start_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NodeUpdateStartDate" ]) v);
      (match x.node_deletion_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NodeDeletionDate" ]) v);
      (match x.node_update_status with
      | None -> []
      | Some v -> node_update_status_to_query (List.append path [ "NodeUpdateStatus" ]) v);
      (match x.cache_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeId" ]) v);
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
    ]

let node_group_member_update_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NodeGroupMemberUpdateStatus"
    node_group_member_update_status_to_query path xs

let node_group_update_status_to_query path (x : node_group_update_status) =
  List.concat
    [
      (match x.node_group_member_update_status with
      | None -> []
      | Some v ->
          node_group_member_update_status_list_to_query
            (List.append path [ "NodeGroupMemberUpdateStatus" ])
            v);
      (match x.node_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeGroupId" ]) v);
    ]

let node_group_update_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NodeGroupUpdateStatus"
    node_group_update_status_to_query path xs

let cache_node_update_status_to_query path (x : cache_node_update_status) =
  List.concat
    [
      (match x.node_update_status_modified_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NodeUpdateStatusModifiedDate" ]) v);
      (match x.node_update_initiated_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NodeUpdateInitiatedDate" ]) v);
      (match x.node_update_initiated_by with
      | None -> []
      | Some v -> node_update_initiated_by_to_query (List.append path [ "NodeUpdateInitiatedBy" ]) v);
      (match x.node_update_end_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NodeUpdateEndDate" ]) v);
      (match x.node_update_start_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NodeUpdateStartDate" ]) v);
      (match x.node_deletion_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "NodeDeletionDate" ]) v);
      (match x.node_update_status with
      | None -> []
      | Some v -> node_update_status_to_query (List.append path [ "NodeUpdateStatus" ]) v);
      (match x.cache_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeId" ]) v);
    ]

let cache_node_update_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheNodeUpdateStatus"
    cache_node_update_status_to_query path xs

let update_action_to_query path (x : update_action) =
  List.concat
    [
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.estimated_update_time with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EstimatedUpdateTime" ]) v);
      (match x.cache_node_update_status with
      | None -> []
      | Some v ->
          cache_node_update_status_list_to_query (List.append path [ "CacheNodeUpdateStatus" ]) v);
      (match x.node_group_update_status with
      | None -> []
      | Some v ->
          node_group_update_status_list_to_query (List.append path [ "NodeGroupUpdateStatus" ]) v);
      (match x.sla_met with
      | None -> []
      | Some v -> sla_met_to_query (List.append path [ "SlaMet" ]) v);
      (match x.update_action_status_modified_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "UpdateActionStatusModifiedDate" ]) v);
      (match x.nodes_updated with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodesUpdated" ]) v);
      (match x.update_action_status with
      | None -> []
      | Some v -> update_action_status_to_query (List.append path [ "UpdateActionStatus" ]) v);
      (match x.update_action_available_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "UpdateActionAvailableDate" ]) v);
      (match x.service_update_type with
      | None -> []
      | Some v -> service_update_type_to_query (List.append path [ "ServiceUpdateType" ]) v);
      (match x.service_update_recommended_apply_by_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ServiceUpdateRecommendedApplyByDate" ]) v);
      (match x.service_update_status with
      | None -> []
      | Some v -> service_update_status_to_query (List.append path [ "ServiceUpdateStatus" ]) v);
      (match x.service_update_severity with
      | None -> []
      | Some v -> service_update_severity_to_query (List.append path [ "ServiceUpdateSeverity" ]) v);
      (match x.service_update_release_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ServiceUpdateReleaseDate" ]) v);
      (match x.service_update_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServiceUpdateName" ]) v);
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
    ]

let update_action_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "UpdateAction" update_action_to_query path xs

let update_actions_message_to_query path (x : update_actions_message) =
  List.concat
    [
      (match x.update_actions with
      | None -> []
      | Some v -> update_action_list_to_query (List.append path [ "UpdateActions" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let update_action_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" update_action_status_to_query path
    xs

let processed_update_action_to_query path (x : processed_update_action) =
  List.concat
    [
      (match x.update_action_status with
      | None -> []
      | Some v -> update_action_status_to_query (List.append path [ "UpdateActionStatus" ]) v);
      (match x.service_update_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServiceUpdateName" ]) v);
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
    ]

let processed_update_action_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ProcessedUpdateAction"
    processed_update_action_to_query path xs

let unprocessed_update_action_to_query path (x : unprocessed_update_action) =
  List.concat
    [
      (match x.error_message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ErrorMessage" ]) v);
      (match x.error_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ErrorType" ]) v);
      (match x.service_update_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServiceUpdateName" ]) v);
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
    ]

let unprocessed_update_action_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "UnprocessedUpdateAction"
    unprocessed_update_action_to_query path xs

let update_action_results_message_to_query path (x : update_action_results_message) =
  List.concat
    [
      (match x.unprocessed_update_actions with
      | None -> []
      | Some v ->
          unprocessed_update_action_list_to_query
            (List.append path [ "UnprocessedUpdateActions" ])
            v);
      (match x.processed_update_actions with
      | None -> []
      | Some v ->
          processed_update_action_list_to_query (List.append path [ "ProcessedUpdateActions" ]) v);
    ]

let transit_encryption_mode_to_query path (x : transit_encryption_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with REQUIRED -> "required" | PREFERRED -> "preferred")

let time_range_filter_to_query path (x : time_range_filter) =
  List.concat
    [
      (match x.end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
    ]

let global_replication_group_info_to_query path (x : global_replication_group_info) =
  List.concat
    [
      (match x.global_replication_group_member_role with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalReplicationGroupMemberRole" ]) v);
      (match x.global_replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalReplicationGroupId" ]) v);
    ]

let pending_automatic_failover_status_to_query path (x : pending_automatic_failover_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DISABLED -> "disabled" | ENABLED -> "enabled")

let double_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let slot_migration_to_query path (x : slot_migration) =
  List.concat
    [
      (match x.progress_percentage with
      | None -> []
      | Some v -> double_to_query (List.append path [ "ProgressPercentage" ]) v);
    ]

let resharding_status_to_query path (x : resharding_status) =
  List.concat
    [
      (match x.slot_migration with
      | None -> []
      | Some v -> slot_migration_to_query (List.append path [ "SlotMigration" ]) v);
    ]

let auth_token_update_status_to_query path (x : auth_token_update_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ROTATING -> "ROTATING" | SETTING -> "SETTING")

let log_type_to_query path (x : log_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ENGINE_LOG -> "engine-log" | SLOW_LOG -> "slow-log")

let destination_type_to_query path (x : destination_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with KinesisFirehose -> "kinesis-firehose" | CloudWatchLogs -> "cloudwatch-logs")

let cloud_watch_logs_destination_details_to_query path (x : cloud_watch_logs_destination_details) =
  List.concat
    [
      (match x.log_group with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LogGroup" ]) v);
    ]

let kinesis_firehose_destination_details_to_query path (x : kinesis_firehose_destination_details) =
  List.concat
    [
      (match x.delivery_stream with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DeliveryStream" ]) v);
    ]

let destination_details_to_query path (x : destination_details) =
  List.concat
    [
      (match x.kinesis_firehose_details with
      | None -> []
      | Some v ->
          kinesis_firehose_destination_details_to_query
            (List.append path [ "KinesisFirehoseDetails" ])
            v);
      (match x.cloud_watch_logs_details with
      | None -> []
      | Some v ->
          cloud_watch_logs_destination_details_to_query
            (List.append path [ "CloudWatchLogsDetails" ])
            v);
    ]

let log_format_to_query path (x : log_format) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with JSON -> "json" | TEXT -> "text")

let pending_log_delivery_configuration_to_query path (x : pending_log_delivery_configuration) =
  List.concat
    [
      (match x.log_format with
      | None -> []
      | Some v -> log_format_to_query (List.append path [ "LogFormat" ]) v);
      (match x.destination_details with
      | None -> []
      | Some v -> destination_details_to_query (List.append path [ "DestinationDetails" ]) v);
      (match x.destination_type with
      | None -> []
      | Some v -> destination_type_to_query (List.append path [ "DestinationType" ]) v);
      (match x.log_type with
      | None -> []
      | Some v -> log_type_to_query (List.append path [ "LogType" ]) v);
    ]

let pending_log_delivery_configuration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    pending_log_delivery_configuration_to_query path xs

let boolean_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let cluster_mode_to_query path (x : cluster_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with COMPATIBLE -> "compatible" | DISABLED -> "disabled" | ENABLED -> "enabled")

let replication_group_pending_modified_values_to_query path
    (x : replication_group_pending_modified_values) =
  List.concat
    [
      (match x.cluster_mode with
      | None -> []
      | Some v -> cluster_mode_to_query (List.append path [ "ClusterMode" ]) v);
      (match x.transit_encryption_mode with
      | None -> []
      | Some v -> transit_encryption_mode_to_query (List.append path [ "TransitEncryptionMode" ]) v);
      (match x.transit_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "TransitEncryptionEnabled" ]) v);
      (match x.log_delivery_configurations with
      | None -> []
      | Some v ->
          pending_log_delivery_configuration_list_to_query
            (List.append path [ "LogDeliveryConfigurations" ])
            v);
      (match x.user_groups with
      | None -> []
      | Some v -> user_groups_update_status_to_query (List.append path [ "UserGroups" ]) v);
      (match x.auth_token_status with
      | None -> []
      | Some v -> auth_token_update_status_to_query (List.append path [ "AuthTokenStatus" ]) v);
      (match x.resharding with
      | None -> []
      | Some v -> resharding_status_to_query (List.append path [ "Resharding" ]) v);
      (match x.automatic_failover_status with
      | None -> []
      | Some v ->
          pending_automatic_failover_status_to_query
            (List.append path [ "AutomaticFailoverStatus" ])
            v);
      (match x.primary_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PrimaryClusterId" ]) v);
    ]

let cluster_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ClusterId" string__to_query path xs

let integer_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let endpoint_to_query path (x : endpoint) =
  List.concat
    [
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.address with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Address" ]) v);
    ]

let node_group_member_to_query path (x : node_group_member) =
  List.concat
    [
      (match x.current_role with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CurrentRole" ]) v);
      (match x.preferred_outpost_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredOutpostArn" ]) v);
      (match x.preferred_availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredAvailabilityZone" ]) v);
      (match x.read_endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "ReadEndpoint" ]) v);
      (match x.cache_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeId" ]) v);
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
    ]

let node_group_member_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NodeGroupMember" node_group_member_to_query
    path xs

let node_group_to_query path (x : node_group) =
  List.concat
    [
      (match x.node_group_members with
      | None -> []
      | Some v -> node_group_member_list_to_query (List.append path [ "NodeGroupMembers" ]) v);
      (match x.slots with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Slots" ]) v);
      (match x.reader_endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "ReaderEndpoint" ]) v);
      (match x.primary_endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "PrimaryEndpoint" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.node_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeGroupId" ]) v);
    ]

let node_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NodeGroup" node_group_to_query path xs

let automatic_failover_status_to_query path (x : automatic_failover_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | DISABLING -> "disabling"
    | ENABLING -> "enabling"
    | DISABLED -> "disabled"
    | ENABLED -> "enabled")

let multi_az_status_to_query path (x : multi_az_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DISABLED -> "disabled" | ENABLED -> "enabled")

let replication_group_outpost_arn_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReplicationGroupOutpostArn" string__to_query
    path xs

let storage_encryption_type_to_query path (x : storage_encryption_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SSE_KMS -> "sse-kms" | SSE_ELASTICACHE -> "sse-elasticache" | NONE -> "none")

let log_delivery_configuration_status_to_query path (x : log_delivery_configuration_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ERROR -> "error"
    | DISABLING -> "disabling"
    | MODIFYING -> "modifying"
    | ENABLING -> "enabling"
    | ACTIVE -> "active")

let log_delivery_configuration_to_query path (x : log_delivery_configuration) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Message" ]) v);
      (match x.status with
      | None -> []
      | Some v -> log_delivery_configuration_status_to_query (List.append path [ "Status" ]) v);
      (match x.log_format with
      | None -> []
      | Some v -> log_format_to_query (List.append path [ "LogFormat" ]) v);
      (match x.destination_details with
      | None -> []
      | Some v -> destination_details_to_query (List.append path [ "DestinationDetails" ]) v);
      (match x.destination_type with
      | None -> []
      | Some v -> destination_type_to_query (List.append path [ "DestinationType" ]) v);
      (match x.log_type with
      | None -> []
      | Some v -> log_type_to_query (List.append path [ "LogType" ]) v);
    ]

let log_delivery_configuration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "LogDeliveryConfiguration"
    log_delivery_configuration_to_query path xs

let data_tiering_status_to_query path (x : data_tiering_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DISABLED -> "disabled" | ENABLED -> "enabled")

let boolean__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let network_type_to_query path (x : network_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DUAL_STACK -> "dual_stack" | IPV6 -> "ipv6" | IPV4 -> "ipv4")

let ip_discovery_to_query path (x : ip_discovery) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with IPV6 -> "ipv6" | IPV4 -> "ipv4")

let durability_to_query path (x : durability) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | DISABLED -> "disabled"
    | SYNC -> "sync"
    | ASYNC -> "async"
    | DEFAULT -> "default")

let effective_durability_to_query path (x : effective_durability) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DISABLED -> "disabled" | SYNC -> "sync" | ASYNC -> "async")

let replication_group_to_query path (x : replication_group) =
  List.concat
    [
      (match x.effective_durability with
      | None -> []
      | Some v -> effective_durability_to_query (List.append path [ "EffectiveDurability" ]) v);
      (match x.durability with
      | None -> []
      | Some v -> durability_to_query (List.append path [ "Durability" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.cluster_mode with
      | None -> []
      | Some v -> cluster_mode_to_query (List.append path [ "ClusterMode" ]) v);
      (match x.transit_encryption_mode with
      | None -> []
      | Some v -> transit_encryption_mode_to_query (List.append path [ "TransitEncryptionMode" ]) v);
      (match x.ip_discovery with
      | None -> []
      | Some v -> ip_discovery_to_query (List.append path [ "IpDiscovery" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> network_type_to_query (List.append path [ "NetworkType" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.data_tiering with
      | None -> []
      | Some v -> data_tiering_status_to_query (List.append path [ "DataTiering" ]) v);
      (match x.replication_group_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ReplicationGroupCreateTime" ]) v);
      (match x.log_delivery_configurations with
      | None -> []
      | Some v ->
          log_delivery_configuration_list_to_query
            (List.append path [ "LogDeliveryConfigurations" ])
            v);
      (match x.user_group_ids with
      | None -> []
      | Some v -> user_group_id_list_to_query (List.append path [ "UserGroupIds" ]) v);
      (match x.ar_n with None -> [] | Some v -> string__to_query (List.append path [ "ARN" ]) v);
      (match x.storage_encryption_type with
      | None -> []
      | Some v -> storage_encryption_type_to_query (List.append path [ "StorageEncryptionType" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.member_clusters_outpost_arns with
      | None -> []
      | Some v ->
          replication_group_outpost_arn_list_to_query
            (List.append path [ "MemberClustersOutpostArns" ])
            v);
      (match x.at_rest_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AtRestEncryptionEnabled" ]) v);
      (match x.transit_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "TransitEncryptionEnabled" ]) v);
      (match x.auth_token_last_modified_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "AuthTokenLastModifiedDate" ]) v);
      (match x.auth_token_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AuthTokenEnabled" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.cluster_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ClusterEnabled" ]) v);
      (match x.snapshot_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotWindow" ]) v);
      (match x.snapshot_retention_limit with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SnapshotRetentionLimit" ]) v);
      (match x.configuration_endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "ConfigurationEndpoint" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> multi_az_status_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.automatic_failover with
      | None -> []
      | Some v -> automatic_failover_status_to_query (List.append path [ "AutomaticFailover" ]) v);
      (match x.snapshotting_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshottingClusterId" ]) v);
      (match x.node_groups with
      | None -> []
      | Some v -> node_group_list_to_query (List.append path [ "NodeGroups" ]) v);
      (match x.member_clusters with
      | None -> []
      | Some v -> cluster_id_list_to_query (List.append path [ "MemberClusters" ]) v);
      (match x.pending_modified_values with
      | None -> []
      | Some v ->
          replication_group_pending_modified_values_to_query
            (List.append path [ "PendingModifiedValues" ])
            v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.global_replication_group_info with
      | None -> []
      | Some v ->
          global_replication_group_info_to_query
            (List.append path [ "GlobalReplicationGroupInfo" ])
            v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
    ]

let test_migration_response_to_query path (x : test_migration_response) =
  List.concat
    [
      (match x.replication_group with
      | None -> []
      | Some v -> replication_group_to_query (List.append path [ "ReplicationGroup" ]) v);
    ]

let customer_node_endpoint_to_query path (x : customer_node_endpoint) =
  List.concat
    [
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.address with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Address" ]) v);
    ]

let customer_node_endpoint_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" customer_node_endpoint_to_query path
    xs

let test_migration_message_to_query path (x : test_migration_message) =
  List.concat
    [
      customer_node_endpoint_list_to_query
        (List.append path [ "CustomerNodeEndpointList" ])
        x.customer_node_endpoint_list;
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
    ]

let replication_group_not_found_fault_to_query path (x : replication_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let replication_group_already_under_migration_fault_to_query path
    (x : replication_group_already_under_migration_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_replication_group_state_fault_to_query path (x : invalid_replication_group_state_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let aws_query_error_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_parameter_value_exception_to_query path (x : invalid_parameter_value_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> aws_query_error_message_to_query (List.append path [ "message" ]) v);
    ]

let test_failover_result_to_query path (x : test_failover_result) =
  List.concat
    [
      (match x.replication_group with
      | None -> []
      | Some v -> replication_group_to_query (List.append path [ "ReplicationGroup" ]) v);
    ]

let test_failover_not_available_fault_to_query path (x : test_failover_not_available_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let allowed_node_group_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let test_failover_message_to_query path (x : test_failover_message) =
  List.concat
    [
      allowed_node_group_id_to_query (List.append path [ "NodeGroupId" ]) x.node_group_id;
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
    ]

let node_group_not_found_fault_to_query path (x : node_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_parameter_combination_exception_to_query path
    (x : invalid_parameter_combination_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> aws_query_error_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_kms_key_fault_to_query path (x : invalid_kms_key_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_cache_cluster_state_fault_to_query path (x : invalid_cache_cluster_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let api_call_rate_for_customer_exceeded_fault_to_query path
    (x : api_call_rate_for_customer_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let tag_quota_per_resource_exceeded_to_query path (x : tag_quota_per_resource_exceeded) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let tag_not_found_fault_to_query path (x : tag_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let tag_to_query path (x : tag) =
  List.concat
    [
      (match x.value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Value" ]) v);
      (match x.key with None -> [] | Some v -> string__to_query (List.append path [ "Key" ]) v);
    ]

let tag_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Tag" tag_to_query path xs

let tag_list_message_to_query path (x : tag_list_message) =
  List.concat
    [
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
    ]

let subnet_outpost_to_query path (x : subnet_outpost) =
  List.concat
    [
      (match x.subnet_outpost_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetOutpostArn" ]) v);
    ]

let subnet_not_allowed_fault_to_query path (x : subnet_not_allowed_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let availability_zone_to_query path (x : availability_zone) =
  List.concat
    [
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
    ]

let network_type_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" network_type_to_query path xs

let subnet_to_query path (x : subnet) =
  List.concat
    [
      (match x.supported_network_types with
      | None -> []
      | Some v -> network_type_list_to_query (List.append path [ "SupportedNetworkTypes" ]) v);
      (match x.subnet_outpost with
      | None -> []
      | Some v -> subnet_outpost_to_query (List.append path [ "SubnetOutpost" ]) v);
      (match x.subnet_availability_zone with
      | None -> []
      | Some v -> availability_zone_to_query (List.append path [ "SubnetAvailabilityZone" ]) v);
      (match x.subnet_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetIdentifier" ]) v);
    ]

let subnet_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Subnet" subnet_to_query path xs

let subnet_in_use_to_query path (x : subnet_in_use) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let subnet_ids_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SubnetId" string__to_query path xs

let subnet_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SubnetIdentifier" string__to_query path xs

let start_migration_response_to_query path (x : start_migration_response) =
  List.concat
    [
      (match x.replication_group with
      | None -> []
      | Some v -> replication_group_to_query (List.append path [ "ReplicationGroup" ]) v);
    ]

let start_migration_message_to_query path (x : start_migration_message) =
  List.concat
    [
      customer_node_endpoint_list_to_query
        (List.append path [ "CustomerNodeEndpointList" ])
        x.customer_node_endpoint_list;
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
    ]

let source_type_to_query path (x : source_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | User_group -> "user-group"
    | User -> "user"
    | Serverless_cache_snapshot -> "serverless-cache-snapshot"
    | Serverless_cache -> "serverless-cache"
    | Replication_group -> "replication-group"
    | Cache_subnet_group -> "cache-subnet-group"
    | Cache_security_group -> "cache-security-group"
    | Cache_parameter_group -> "cache-parameter-group"
    | Cache_cluster -> "cache-cluster")

let snapshot_quota_exceeded_fault_to_query path (x : snapshot_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let snapshot_not_found_fault_to_query path (x : snapshot_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let availability_zones_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AvailabilityZone" string__to_query path xs

let outpost_arns_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OutpostArn" string__to_query path xs

let node_group_configuration_to_query path (x : node_group_configuration) =
  List.concat
    [
      (match x.replica_outpost_arns with
      | None -> []
      | Some v -> outpost_arns_list_to_query (List.append path [ "ReplicaOutpostArns" ]) v);
      (match x.primary_outpost_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PrimaryOutpostArn" ]) v);
      (match x.replica_availability_zones with
      | None -> []
      | Some v ->
          availability_zones_list_to_query (List.append path [ "ReplicaAvailabilityZones" ]) v);
      (match x.primary_availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PrimaryAvailabilityZone" ]) v);
      (match x.replica_count with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ReplicaCount" ]) v);
      (match x.slots with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Slots" ]) v);
      (match x.node_group_id with
      | None -> []
      | Some v -> allowed_node_group_id_to_query (List.append path [ "NodeGroupId" ]) v);
    ]

let node_snapshot_to_query path (x : node_snapshot) =
  List.concat
    [
      (match x.snapshot_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "SnapshotCreateTime" ]) v);
      (match x.cache_node_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CacheNodeCreateTime" ]) v);
      (match x.cache_size with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSize" ]) v);
      (match x.node_group_configuration with
      | None -> []
      | Some v ->
          node_group_configuration_to_query (List.append path [ "NodeGroupConfiguration" ]) v);
      (match x.cache_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeId" ]) v);
      (match x.node_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeGroupId" ]) v);
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
    ]

let node_snapshot_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NodeSnapshot" node_snapshot_to_query path xs

let snapshot_to_query path (x : snapshot) =
  List.concat
    [
      (match x.durability with
      | None -> []
      | Some v -> durability_to_query (List.append path [ "Durability" ]) v);
      (match x.data_tiering with
      | None -> []
      | Some v -> data_tiering_status_to_query (List.append path [ "DataTiering" ]) v);
      (match x.ar_n with None -> [] | Some v -> string__to_query (List.append path [ "ARN" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.node_snapshots with
      | None -> []
      | Some v -> node_snapshot_list_to_query (List.append path [ "NodeSnapshots" ]) v);
      (match x.automatic_failover with
      | None -> []
      | Some v -> automatic_failover_status_to_query (List.append path [ "AutomaticFailover" ]) v);
      (match x.num_node_groups with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumNodeGroups" ]) v);
      (match x.snapshot_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotWindow" ]) v);
      (match x.snapshot_retention_limit with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SnapshotRetentionLimit" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.cache_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSubnetGroupName" ]) v);
      (match x.cache_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupName" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TopicArn" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.cache_cluster_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CacheClusterCreateTime" ]) v);
      (match x.preferred_outpost_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredOutpostArn" ]) v);
      (match x.preferred_availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredAvailabilityZone" ]) v);
      (match x.num_cache_nodes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumCacheNodes" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.snapshot_source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotSource" ]) v);
      (match x.snapshot_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotStatus" ]) v);
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
      (match x.replication_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupDescription" ]) v);
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
      (match x.snapshot_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotName" ]) v);
    ]

let snapshot_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Snapshot" snapshot_to_query path xs

let snapshot_feature_not_supported_fault_to_query path (x : snapshot_feature_not_supported_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let snapshot_arns_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SnapshotArn" string__to_query path xs

let snapshot_already_exists_fault_to_query path (x : snapshot_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let service_update_to_query path (x : service_update) =
  List.concat
    [
      (match x.estimated_update_time with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EstimatedUpdateTime" ]) v);
      (match x.auto_update_after_recommended_apply_by_date with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "AutoUpdateAfterRecommendedApplyByDate" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.service_update_type with
      | None -> []
      | Some v -> service_update_type_to_query (List.append path [ "ServiceUpdateType" ]) v);
      (match x.service_update_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServiceUpdateDescription" ]) v);
      (match x.service_update_status with
      | None -> []
      | Some v -> service_update_status_to_query (List.append path [ "ServiceUpdateStatus" ]) v);
      (match x.service_update_recommended_apply_by_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ServiceUpdateRecommendedApplyByDate" ]) v);
      (match x.service_update_severity with
      | None -> []
      | Some v -> service_update_severity_to_query (List.append path [ "ServiceUpdateSeverity" ]) v);
      (match x.service_update_end_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ServiceUpdateEndDate" ]) v);
      (match x.service_update_release_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ServiceUpdateReleaseDate" ]) v);
      (match x.service_update_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServiceUpdateName" ]) v);
    ]

let service_update_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ServiceUpdate" service_update_to_query path
    xs

let service_updates_message_to_query path (x : service_updates_message) =
  List.concat
    [
      (match x.service_updates with
      | None -> []
      | Some v -> service_update_list_to_query (List.append path [ "ServiceUpdates" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let service_update_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" service_update_status_to_query path
    xs

let service_update_not_found_fault_to_query path (x : service_update_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let service_linked_role_not_found_fault_to_query path (x : service_linked_role_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let serverless_cache_snapshot_quota_exceeded_fault_to_query path
    (x : serverless_cache_snapshot_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let serverless_cache_snapshot_not_found_fault_to_query path
    (x : serverless_cache_snapshot_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let serverless_cache_configuration_to_query path (x : serverless_cache_configuration) =
  List.concat
    [
      (match x.major_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MajorEngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.serverless_cache_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServerlessCacheName" ]) v);
    ]

let serverless_cache_snapshot_to_query path (x : serverless_cache_snapshot) =
  List.concat
    [
      (match x.serverless_cache_configuration with
      | None -> []
      | Some v ->
          serverless_cache_configuration_to_query
            (List.append path [ "ServerlessCacheConfiguration" ])
            v);
      (match x.bytes_used_for_cache with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BytesUsedForCache" ]) v);
      (match x.expiry_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ExpiryTime" ]) v);
      (match x.create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreateTime" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.snapshot_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotType" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.ar_n with None -> [] | Some v -> string__to_query (List.append path [ "ARN" ]) v);
      (match x.serverless_cache_snapshot_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServerlessCacheSnapshotName" ]) v);
    ]

let serverless_cache_snapshot_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ServerlessCacheSnapshot"
    serverless_cache_snapshot_to_query path xs

let serverless_cache_snapshot_already_exists_fault_to_query path
    (x : serverless_cache_snapshot_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let serverless_cache_quota_for_customer_exceeded_fault_to_query path
    (x : serverless_cache_quota_for_customer_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let serverless_cache_not_found_fault_to_query path (x : serverless_cache_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let data_storage_unit_to_query path (x : data_storage_unit) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with GB -> "GB")

let data_storage_to_query path (x : data_storage) =
  List.concat
    [
      data_storage_unit_to_query (List.append path [ "Unit" ]) x.unit_;
      (match x.minimum with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Minimum" ]) v);
      (match x.maximum with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Maximum" ]) v);
    ]

let ecpu_per_second_to_query path (x : ecpu_per_second) =
  List.concat
    [
      (match x.minimum with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Minimum" ]) v);
      (match x.maximum with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Maximum" ]) v);
    ]

let cache_usage_limits_to_query path (x : cache_usage_limits) =
  List.concat
    [
      (match x.ecpu_per_second with
      | None -> []
      | Some v -> ecpu_per_second_to_query (List.append path [ "ECPUPerSecond" ]) v);
      (match x.data_storage with
      | None -> []
      | Some v -> data_storage_to_query (List.append path [ "DataStorage" ]) v);
    ]

let security_group_ids_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SecurityGroupId" string__to_query path xs

let serverless_cache_to_query path (x : serverless_cache) =
  List.concat
    [
      (match x.network_type with
      | None -> []
      | Some v -> network_type_to_query (List.append path [ "NetworkType" ]) v);
      (match x.daily_snapshot_time with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DailySnapshotTime" ]) v);
      (match x.snapshot_retention_limit with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SnapshotRetentionLimit" ]) v);
      (match x.subnet_ids with
      | None -> []
      | Some v -> subnet_ids_list_to_query (List.append path [ "SubnetIds" ]) v);
      (match x.user_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "UserGroupId" ]) v);
      (match x.ar_n with None -> [] | Some v -> string__to_query (List.append path [ "ARN" ]) v);
      (match x.reader_endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "ReaderEndpoint" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "Endpoint" ]) v);
      (match x.security_group_ids with
      | None -> []
      | Some v -> security_group_ids_list_to_query (List.append path [ "SecurityGroupIds" ]) v);
      (match x.storage_encryption_type with
      | None -> []
      | Some v -> storage_encryption_type_to_query (List.append path [ "StorageEncryptionType" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.cache_usage_limits with
      | None -> []
      | Some v -> cache_usage_limits_to_query (List.append path [ "CacheUsageLimits" ]) v);
      (match x.full_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FullEngineVersion" ]) v);
      (match x.major_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MajorEngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreateTime" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.serverless_cache_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServerlessCacheName" ]) v);
    ]

let serverless_cache_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" serverless_cache_to_query path xs

let serverless_cache_already_exists_fault_to_query path (x : serverless_cache_already_exists_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let security_group_membership_to_query path (x : security_group_membership) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.security_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SecurityGroupId" ]) v);
    ]

let security_group_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" security_group_membership_to_query
    path xs

let scale_config_to_query path (x : scale_config) =
  List.concat
    [
      (match x.scale_interval_minutes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ScaleIntervalMinutes" ]) v);
      (match x.scale_percentage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ScalePercentage" ]) v);
    ]

let ec2_security_group_to_query path (x : ec2_security_group) =
  List.concat
    [
      (match x.ec2_security_group_owner_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupOwnerId" ]) v);
      (match x.ec2_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupName" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
    ]

let ec2_security_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "EC2SecurityGroup"
    ec2_security_group_to_query path xs

let cache_security_group_to_query path (x : cache_security_group) =
  List.concat
    [
      (match x.ar_n with None -> [] | Some v -> string__to_query (List.append path [ "ARN" ]) v);
      (match x.ec2_security_groups with
      | None -> []
      | Some v -> ec2_security_group_list_to_query (List.append path [ "EC2SecurityGroups" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.cache_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSecurityGroupName" ]) v);
      (match x.owner_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OwnerId" ]) v);
    ]

let revoke_cache_security_group_ingress_result_to_query path
    (x : revoke_cache_security_group_ingress_result) =
  List.concat
    [
      (match x.cache_security_group with
      | None -> []
      | Some v -> cache_security_group_to_query (List.append path [ "CacheSecurityGroup" ]) v);
    ]

let revoke_cache_security_group_ingress_message_to_query path
    (x : revoke_cache_security_group_ingress_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "EC2SecurityGroupOwnerId" ])
        x.ec2_security_group_owner_id;
      string__to_query (List.append path [ "EC2SecurityGroupName" ]) x.ec2_security_group_name;
      string__to_query (List.append path [ "CacheSecurityGroupName" ]) x.cache_security_group_name;
    ]

let invalid_cache_security_group_state_fault_to_query path
    (x : invalid_cache_security_group_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cache_security_group_not_found_fault_to_query path (x : cache_security_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let authorization_not_found_fault_to_query path (x : authorization_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let resharding_configuration_to_query path (x : resharding_configuration) =
  List.concat
    [
      (match x.preferred_availability_zones with
      | None -> []
      | Some v ->
          availability_zones_list_to_query (List.append path [ "PreferredAvailabilityZones" ]) v);
      (match x.node_group_id with
      | None -> []
      | Some v -> allowed_node_group_id_to_query (List.append path [ "NodeGroupId" ]) v);
    ]

let resharding_configuration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReshardingConfiguration"
    resharding_configuration_to_query path xs

let parameter_name_value_to_query path (x : parameter_name_value) =
  List.concat
    [
      (match x.parameter_value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterValue" ]) v);
      (match x.parameter_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterName" ]) v);
    ]

let parameter_name_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ParameterNameValue"
    parameter_name_value_to_query path xs

let reset_cache_parameter_group_message_to_query path (x : reset_cache_parameter_group_message) =
  List.concat
    [
      (match x.parameter_name_values with
      | None -> []
      | Some v -> parameter_name_value_list_to_query (List.append path [ "ParameterNameValues" ]) v);
      (match x.reset_all_parameters with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ResetAllParameters" ]) v);
      string__to_query (List.append path [ "CacheParameterGroupName" ]) x.cache_parameter_group_name;
    ]

let invalid_global_replication_group_state_fault_to_query path
    (x : invalid_global_replication_group_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_cache_parameter_group_state_fault_to_query path
    (x : invalid_cache_parameter_group_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cache_parameter_group_not_found_fault_to_query path (x : cache_parameter_group_not_found_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cache_parameter_group_name_message_to_query path (x : cache_parameter_group_name_message) =
  List.concat
    [
      (match x.cache_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupName" ]) v);
    ]

let reserved_cache_nodes_offering_not_found_fault_to_query path
    (x : reserved_cache_nodes_offering_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let recurring_charge_to_query path (x : recurring_charge) =
  List.concat
    [
      (match x.recurring_charge_frequency with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RecurringChargeFrequency" ]) v);
      (match x.recurring_charge_amount with
      | None -> []
      | Some v -> double_to_query (List.append path [ "RecurringChargeAmount" ]) v);
    ]

let recurring_charge_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "RecurringCharge" recurring_charge_to_query
    path xs

let reserved_cache_nodes_offering_to_query path (x : reserved_cache_nodes_offering) =
  List.concat
    [
      (match x.recurring_charges with
      | None -> []
      | Some v -> recurring_charge_list_to_query (List.append path [ "RecurringCharges" ]) v);
      (match x.offering_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OfferingType" ]) v);
      (match x.product_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ProductDescription" ]) v);
      (match x.usage_price with
      | None -> []
      | Some v -> double_to_query (List.append path [ "UsagePrice" ]) v);
      (match x.fixed_price with
      | None -> []
      | Some v -> double_to_query (List.append path [ "FixedPrice" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "Duration" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.reserved_cache_nodes_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedCacheNodesOfferingId" ]) v);
    ]

let reserved_cache_nodes_offering_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReservedCacheNodesOffering"
    reserved_cache_nodes_offering_to_query path xs

let reserved_cache_nodes_offering_message_to_query path (x : reserved_cache_nodes_offering_message)
    =
  List.concat
    [
      (match x.reserved_cache_nodes_offerings with
      | None -> []
      | Some v ->
          reserved_cache_nodes_offering_list_to_query
            (List.append path [ "ReservedCacheNodesOfferings" ])
            v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let reserved_cache_node_quota_exceeded_fault_to_query path
    (x : reserved_cache_node_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let reserved_cache_node_not_found_fault_to_query path (x : reserved_cache_node_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let reserved_cache_node_to_query path (x : reserved_cache_node) =
  List.concat
    [
      (match x.reservation_ar_n with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservationARN" ]) v);
      (match x.recurring_charges with
      | None -> []
      | Some v -> recurring_charge_list_to_query (List.append path [ "RecurringCharges" ]) v);
      (match x.state with
      | None -> []
      | Some v -> string__to_query (List.append path [ "State" ]) v);
      (match x.offering_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OfferingType" ]) v);
      (match x.product_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ProductDescription" ]) v);
      (match x.cache_node_count with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "CacheNodeCount" ]) v);
      (match x.usage_price with
      | None -> []
      | Some v -> double_to_query (List.append path [ "UsagePrice" ]) v);
      (match x.fixed_price with
      | None -> []
      | Some v -> double_to_query (List.append path [ "FixedPrice" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "Duration" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.reserved_cache_nodes_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedCacheNodesOfferingId" ]) v);
      (match x.reserved_cache_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedCacheNodeId" ]) v);
    ]

let reserved_cache_node_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReservedCacheNode"
    reserved_cache_node_to_query path xs

let reserved_cache_node_message_to_query path (x : reserved_cache_node_message) =
  List.concat
    [
      (match x.reserved_cache_nodes with
      | None -> []
      | Some v -> reserved_cache_node_list_to_query (List.append path [ "ReservedCacheNodes" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let reserved_cache_node_already_exists_fault_to_query path
    (x : reserved_cache_node_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let replication_group_not_under_migration_fault_to_query path
    (x : replication_group_not_under_migration_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let replication_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReplicationGroup" replication_group_to_query
    path xs

let replication_group_message_to_query path (x : replication_group_message) =
  List.concat
    [
      (match x.replication_groups with
      | None -> []
      | Some v -> replication_group_list_to_query (List.append path [ "ReplicationGroups" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let replication_group_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let replication_group_already_exists_fault_to_query path
    (x : replication_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let preferred_availability_zone_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "PreferredAvailabilityZone" string__to_query
    path xs

let preferred_outpost_arn_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "PreferredOutpostArn" string__to_query path
    xs

let configure_shard_to_query path (x : configure_shard) =
  List.concat
    [
      (match x.preferred_outpost_arns with
      | None -> []
      | Some v ->
          preferred_outpost_arn_list_to_query (List.append path [ "PreferredOutpostArns" ]) v);
      (match x.preferred_availability_zones with
      | None -> []
      | Some v ->
          preferred_availability_zone_list_to_query
            (List.append path [ "PreferredAvailabilityZones" ])
            v);
      integer_to_query (List.append path [ "NewReplicaCount" ]) x.new_replica_count;
      allowed_node_group_id_to_query (List.append path [ "NodeGroupId" ]) x.node_group_id;
    ]

let replica_configuration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ConfigureShard" configure_shard_to_query
    path xs

let key_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let remove_tags_from_resource_message_to_query path (x : remove_tags_from_resource_message) =
  List.concat
    [
      key_list_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      string__to_query (List.append path [ "ResourceName" ]) x.resource_name;
    ]

let invalid_serverless_cache_state_fault_to_query path (x : invalid_serverless_cache_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_serverless_cache_snapshot_state_fault_to_query path
    (x : invalid_serverless_cache_snapshot_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_arn_fault_to_query path (x : invalid_arn_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cache_subnet_group_not_found_fault_to_query path (x : cache_subnet_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cache_cluster_not_found_fault_to_query path (x : cache_cluster_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let remove_replicas_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let regional_configuration_to_query path (x : regional_configuration) =
  List.concat
    [
      resharding_configuration_list_to_query
        (List.append path [ "ReshardingConfiguration" ])
        x.resharding_configuration;
      string__to_query (List.append path [ "ReplicationGroupRegion" ]) x.replication_group_region;
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
    ]

let regional_configuration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "RegionalConfiguration"
    regional_configuration_to_query path xs

let cache_node_ids_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheNodeId" string__to_query path xs

let pending_modified_values_to_query path (x : pending_modified_values) =
  List.concat
    [
      (match x.scale_config with
      | None -> []
      | Some v -> scale_config_to_query (List.append path [ "ScaleConfig" ]) v);
      (match x.transit_encryption_mode with
      | None -> []
      | Some v -> transit_encryption_mode_to_query (List.append path [ "TransitEncryptionMode" ]) v);
      (match x.transit_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "TransitEncryptionEnabled" ]) v);
      (match x.log_delivery_configurations with
      | None -> []
      | Some v ->
          pending_log_delivery_configuration_list_to_query
            (List.append path [ "LogDeliveryConfigurations" ])
            v);
      (match x.auth_token_status with
      | None -> []
      | Some v -> auth_token_update_status_to_query (List.append path [ "AuthTokenStatus" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.cache_node_ids_to_remove with
      | None -> []
      | Some v -> cache_node_ids_list_to_query (List.append path [ "CacheNodeIdsToRemove" ]) v);
      (match x.num_cache_nodes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumCacheNodes" ]) v);
    ]

let notification_configuration_to_query path (x : notification_configuration) =
  List.concat
    [
      (match x.topic_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TopicStatus" ]) v);
      (match x.topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TopicArn" ]) v);
    ]

let cache_security_group_membership_to_query path (x : cache_security_group_membership) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.cache_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSecurityGroupName" ]) v);
    ]

let cache_security_group_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheSecurityGroup"
    cache_security_group_membership_to_query path xs

let cache_parameter_group_status_to_query path (x : cache_parameter_group_status) =
  List.concat
    [
      (match x.cache_node_ids_to_reboot with
      | None -> []
      | Some v -> cache_node_ids_list_to_query (List.append path [ "CacheNodeIdsToReboot" ]) v);
      (match x.parameter_apply_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterApplyStatus" ]) v);
      (match x.cache_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupName" ]) v);
    ]

let cache_node_to_query path (x : cache_node) =
  List.concat
    [
      (match x.customer_outpost_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomerOutpostArn" ]) v);
      (match x.customer_availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomerAvailabilityZone" ]) v);
      (match x.source_cache_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceCacheNodeId" ]) v);
      (match x.parameter_group_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterGroupStatus" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "Endpoint" ]) v);
      (match x.cache_node_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CacheNodeCreateTime" ]) v);
      (match x.cache_node_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeStatus" ]) v);
      (match x.cache_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeId" ]) v);
    ]

let cache_node_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheNode" cache_node_to_query path xs

let cache_cluster_to_query path (x : cache_cluster) =
  List.concat
    [
      (match x.transit_encryption_mode with
      | None -> []
      | Some v -> transit_encryption_mode_to_query (List.append path [ "TransitEncryptionMode" ]) v);
      (match x.ip_discovery with
      | None -> []
      | Some v -> ip_discovery_to_query (List.append path [ "IpDiscovery" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> network_type_to_query (List.append path [ "NetworkType" ]) v);
      (match x.log_delivery_configurations with
      | None -> []
      | Some v ->
          log_delivery_configuration_list_to_query
            (List.append path [ "LogDeliveryConfigurations" ])
            v);
      (match x.replication_group_log_delivery_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReplicationGroupLogDeliveryEnabled" ]) v);
      (match x.ar_n with None -> [] | Some v -> string__to_query (List.append path [ "ARN" ]) v);
      (match x.at_rest_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AtRestEncryptionEnabled" ]) v);
      (match x.transit_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "TransitEncryptionEnabled" ]) v);
      (match x.auth_token_last_modified_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "AuthTokenLastModifiedDate" ]) v);
      (match x.auth_token_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AuthTokenEnabled" ]) v);
      (match x.snapshot_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotWindow" ]) v);
      (match x.snapshot_retention_limit with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SnapshotRetentionLimit" ]) v);
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
      (match x.security_groups with
      | None -> []
      | Some v -> security_group_membership_list_to_query (List.append path [ "SecurityGroups" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.cache_nodes with
      | None -> []
      | Some v -> cache_node_list_to_query (List.append path [ "CacheNodes" ]) v);
      (match x.cache_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSubnetGroupName" ]) v);
      (match x.cache_parameter_group with
      | None -> []
      | Some v ->
          cache_parameter_group_status_to_query (List.append path [ "CacheParameterGroup" ]) v);
      (match x.cache_security_groups with
      | None -> []
      | Some v ->
          cache_security_group_membership_list_to_query
            (List.append path [ "CacheSecurityGroups" ])
            v);
      (match x.notification_configuration with
      | None -> []
      | Some v ->
          notification_configuration_to_query (List.append path [ "NotificationConfiguration" ]) v);
      (match x.pending_modified_values with
      | None -> []
      | Some v -> pending_modified_values_to_query (List.append path [ "PendingModifiedValues" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.cache_cluster_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CacheClusterCreateTime" ]) v);
      (match x.preferred_outpost_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredOutpostArn" ]) v);
      (match x.preferred_availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredAvailabilityZone" ]) v);
      (match x.num_cache_nodes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumCacheNodes" ]) v);
      (match x.cache_cluster_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterStatus" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.client_download_landing_page with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ClientDownloadLandingPage" ]) v);
      (match x.configuration_endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "ConfigurationEndpoint" ]) v);
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
    ]

let reboot_cache_cluster_result_to_query path (x : reboot_cache_cluster_result) =
  List.concat
    [
      (match x.cache_cluster with
      | None -> []
      | Some v -> cache_cluster_to_query (List.append path [ "CacheCluster" ]) v);
    ]

let reboot_cache_cluster_message_to_query path (x : reboot_cache_cluster_message) =
  List.concat
    [
      cache_node_ids_list_to_query
        (List.append path [ "CacheNodeIdsToReboot" ])
        x.cache_node_ids_to_reboot;
      string__to_query (List.append path [ "CacheClusterId" ]) x.cache_cluster_id;
    ]

let global_replication_group_member_to_query path (x : global_replication_group_member) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.automatic_failover with
      | None -> []
      | Some v -> automatic_failover_status_to_query (List.append path [ "AutomaticFailover" ]) v);
      (match x.role with None -> [] | Some v -> string__to_query (List.append path [ "Role" ]) v);
      (match x.replication_group_region with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupRegion" ]) v);
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
    ]

let global_replication_group_member_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "GlobalReplicationGroupMember"
    global_replication_group_member_to_query path xs

let global_node_group_to_query path (x : global_node_group) =
  List.concat
    [
      (match x.slots with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Slots" ]) v);
      (match x.global_node_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalNodeGroupId" ]) v);
    ]

let global_node_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "GlobalNodeGroup" global_node_group_to_query
    path xs

let global_replication_group_to_query path (x : global_replication_group) =
  List.concat
    [
      (match x.ar_n with None -> [] | Some v -> string__to_query (List.append path [ "ARN" ]) v);
      (match x.at_rest_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AtRestEncryptionEnabled" ]) v);
      (match x.transit_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "TransitEncryptionEnabled" ]) v);
      (match x.auth_token_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AuthTokenEnabled" ]) v);
      (match x.global_node_groups with
      | None -> []
      | Some v -> global_node_group_list_to_query (List.append path [ "GlobalNodeGroups" ]) v);
      (match x.cluster_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ClusterEnabled" ]) v);
      (match x.members with
      | None -> []
      | Some v -> global_replication_group_member_list_to_query (List.append path [ "Members" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.global_replication_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalReplicationGroupDescription" ]) v);
      (match x.global_replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalReplicationGroupId" ]) v);
    ]

let rebalance_slots_in_global_replication_group_result_to_query path
    (x : rebalance_slots_in_global_replication_group_result) =
  List.concat
    [
      (match x.global_replication_group with
      | None -> []
      | Some v ->
          global_replication_group_to_query (List.append path [ "GlobalReplicationGroup" ]) v);
    ]

let rebalance_slots_in_global_replication_group_message_to_query path
    (x : rebalance_slots_in_global_replication_group_message) =
  List.concat
    [
      boolean__to_query (List.append path [ "ApplyImmediately" ]) x.apply_immediately;
      string__to_query
        (List.append path [ "GlobalReplicationGroupId" ])
        x.global_replication_group_id;
    ]

let global_replication_group_not_found_fault_to_query path
    (x : global_replication_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let purchase_reserved_cache_nodes_offering_result_to_query path
    (x : purchase_reserved_cache_nodes_offering_result) =
  List.concat
    [
      (match x.reserved_cache_node with
      | None -> []
      | Some v -> reserved_cache_node_to_query (List.append path [ "ReservedCacheNode" ]) v);
    ]

let purchase_reserved_cache_nodes_offering_message_to_query path
    (x : purchase_reserved_cache_nodes_offering_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.cache_node_count with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "CacheNodeCount" ]) v);
      (match x.reserved_cache_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedCacheNodeId" ]) v);
      string__to_query
        (List.append path [ "ReservedCacheNodesOfferingId" ])
        x.reserved_cache_nodes_offering_id;
    ]

let password_list_input_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let change_type_to_query path (x : change_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Requires_reboot -> "requires-reboot" | Immediate -> "immediate")

let parameter_to_query path (x : parameter) =
  List.concat
    [
      (match x.change_type with
      | None -> []
      | Some v -> change_type_to_query (List.append path [ "ChangeType" ]) v);
      (match x.minimum_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MinimumEngineVersion" ]) v);
      (match x.is_modifiable with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsModifiable" ]) v);
      (match x.allowed_values with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AllowedValues" ]) v);
      (match x.data_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DataType" ]) v);
      (match x.source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Source" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.parameter_value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterValue" ]) v);
      (match x.parameter_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterName" ]) v);
    ]

let parameters_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Parameter" parameter_to_query path xs

let outpost_mode_to_query path (x : outpost_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with CROSS_OUTPOST -> "cross-outpost" | SINGLE_OUTPOST -> "single-outpost")

let node_type_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let node_quota_for_customer_exceeded_fault_to_query path
    (x : node_quota_for_customer_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let node_quota_for_cluster_exceeded_fault_to_query path (x : node_quota_for_cluster_exceeded_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let node_groups_to_retain_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NodeGroupToRetain"
    allowed_node_group_id_to_query path xs

let node_groups_to_remove_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NodeGroupToRemove"
    allowed_node_group_id_to_query path xs

let node_groups_per_replication_group_quota_exceeded_fault_to_query path
    (x : node_groups_per_replication_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let node_group_configuration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "NodeGroupConfiguration"
    node_group_configuration_to_query path xs

let no_operation_fault_to_query path (x : no_operation_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let access_string_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let input_authentication_type_to_query path (x : input_authentication_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with IAM -> "iam" | NO_PASSWORD -> "no-password-required" | PASSWORD -> "password")

let authentication_mode_to_query path (x : authentication_mode) =
  List.concat
    [
      (match x.passwords with
      | None -> []
      | Some v -> password_list_input_to_query (List.append path [ "Passwords" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> input_authentication_type_to_query (List.append path [ "Type" ]) v);
    ]

let modify_user_message_to_query path (x : modify_user_message) =
  List.concat
    [
      (match x.engine with
      | None -> []
      | Some v -> engine_type_to_query (List.append path [ "Engine" ]) v);
      (match x.authentication_mode with
      | None -> []
      | Some v -> authentication_mode_to_query (List.append path [ "AuthenticationMode" ]) v);
      (match x.no_password_required with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "NoPasswordRequired" ]) v);
      (match x.passwords with
      | None -> []
      | Some v -> password_list_input_to_query (List.append path [ "Passwords" ]) v);
      (match x.append_access_string with
      | None -> []
      | Some v -> access_string_to_query (List.append path [ "AppendAccessString" ]) v);
      (match x.access_string with
      | None -> []
      | Some v -> access_string_to_query (List.append path [ "AccessString" ]) v);
      user_id_to_query (List.append path [ "UserId" ]) x.user_id;
    ]

let modify_user_group_message_to_query path (x : modify_user_group_message) =
  List.concat
    [
      (match x.engine with
      | None -> []
      | Some v -> engine_type_to_query (List.append path [ "Engine" ]) v);
      (match x.user_ids_to_remove with
      | None -> []
      | Some v -> user_id_list_input_to_query (List.append path [ "UserIdsToRemove" ]) v);
      (match x.user_ids_to_add with
      | None -> []
      | Some v -> user_id_list_input_to_query (List.append path [ "UserIdsToAdd" ]) v);
      string__to_query (List.append path [ "UserGroupId" ]) x.user_group_id;
    ]

let invalid_user_group_state_fault_to_query path (x : invalid_user_group_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let duplicate_user_name_fault_to_query path (x : duplicate_user_name_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let default_user_required_to_query path (x : default_user_required) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_user_state_fault_to_query path (x : invalid_user_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_serverless_cache_response_to_query path (x : modify_serverless_cache_response) =
  List.concat
    [
      (match x.serverless_cache with
      | None -> []
      | Some v -> serverless_cache_to_query (List.append path [ "ServerlessCache" ]) v);
    ]

let modify_serverless_cache_request_to_query path (x : modify_serverless_cache_request) =
  List.concat
    [
      (match x.major_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MajorEngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.daily_snapshot_time with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DailySnapshotTime" ]) v);
      (match x.snapshot_retention_limit with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SnapshotRetentionLimit" ]) v);
      (match x.security_group_ids with
      | None -> []
      | Some v -> security_group_ids_list_to_query (List.append path [ "SecurityGroupIds" ]) v);
      (match x.user_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "UserGroupId" ]) v);
      (match x.remove_user_group with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "RemoveUserGroup" ]) v);
      (match x.cache_usage_limits with
      | None -> []
      | Some v -> cache_usage_limits_to_query (List.append path [ "CacheUsageLimits" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      string__to_query (List.append path [ "ServerlessCacheName" ]) x.serverless_cache_name;
    ]

let invalid_credentials_exception_to_query path (x : invalid_credentials_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_replication_group_shard_configuration_result_to_query path
    (x : modify_replication_group_shard_configuration_result) =
  List.concat
    [
      (match x.replication_group with
      | None -> []
      | Some v -> replication_group_to_query (List.append path [ "ReplicationGroup" ]) v);
    ]

let modify_replication_group_shard_configuration_message_to_query path
    (x : modify_replication_group_shard_configuration_message) =
  List.concat
    [
      (match x.node_groups_to_retain with
      | None -> []
      | Some v -> node_groups_to_retain_list_to_query (List.append path [ "NodeGroupsToRetain" ]) v);
      (match x.node_groups_to_remove with
      | None -> []
      | Some v -> node_groups_to_remove_list_to_query (List.append path [ "NodeGroupsToRemove" ]) v);
      (match x.resharding_configuration with
      | None -> []
      | Some v ->
          resharding_configuration_list_to_query (List.append path [ "ReshardingConfiguration" ]) v);
      boolean__to_query (List.append path [ "ApplyImmediately" ]) x.apply_immediately;
      integer_to_query (List.append path [ "NodeGroupCount" ]) x.node_group_count;
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
    ]

let invalid_vpc_network_state_fault_to_query path (x : invalid_vpc_network_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let insufficient_cache_cluster_capacity_fault_to_query path
    (x : insufficient_cache_cluster_capacity_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_replication_group_result_to_query path (x : modify_replication_group_result) =
  List.concat
    [
      (match x.replication_group with
      | None -> []
      | Some v -> replication_group_to_query (List.append path [ "ReplicationGroup" ]) v);
    ]

let cache_security_group_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheSecurityGroupName" string__to_query
    path xs

let auth_token_update_strategy_type_to_query path (x : auth_token_update_strategy_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DELETE -> "DELETE" | ROTATE -> "ROTATE" | SET -> "SET")

let log_delivery_configuration_request_to_query path (x : log_delivery_configuration_request) =
  List.concat
    [
      (match x.enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Enabled" ]) v);
      (match x.log_format with
      | None -> []
      | Some v -> log_format_to_query (List.append path [ "LogFormat" ]) v);
      (match x.destination_details with
      | None -> []
      | Some v -> destination_details_to_query (List.append path [ "DestinationDetails" ]) v);
      (match x.destination_type with
      | None -> []
      | Some v -> destination_type_to_query (List.append path [ "DestinationType" ]) v);
      (match x.log_type with
      | None -> []
      | Some v -> log_type_to_query (List.append path [ "LogType" ]) v);
    ]

let log_delivery_configuration_request_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "LogDeliveryConfigurationRequest"
    log_delivery_configuration_request_to_query path xs

let modify_replication_group_message_to_query path (x : modify_replication_group_message) =
  List.concat
    [
      (match x.durability with
      | None -> []
      | Some v -> durability_to_query (List.append path [ "Durability" ]) v);
      (match x.cluster_mode with
      | None -> []
      | Some v -> cluster_mode_to_query (List.append path [ "ClusterMode" ]) v);
      (match x.transit_encryption_mode with
      | None -> []
      | Some v -> transit_encryption_mode_to_query (List.append path [ "TransitEncryptionMode" ]) v);
      (match x.transit_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "TransitEncryptionEnabled" ]) v);
      (match x.ip_discovery with
      | None -> []
      | Some v -> ip_discovery_to_query (List.append path [ "IpDiscovery" ]) v);
      (match x.log_delivery_configurations with
      | None -> []
      | Some v ->
          log_delivery_configuration_request_list_to_query
            (List.append path [ "LogDeliveryConfigurations" ])
            v);
      (match x.remove_user_groups with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "RemoveUserGroups" ]) v);
      (match x.user_group_ids_to_remove with
      | None -> []
      | Some v -> user_group_id_list_to_query (List.append path [ "UserGroupIdsToRemove" ]) v);
      (match x.user_group_ids_to_add with
      | None -> []
      | Some v -> user_group_id_list_to_query (List.append path [ "UserGroupIdsToAdd" ]) v);
      (match x.auth_token_update_strategy with
      | None -> []
      | Some v ->
          auth_token_update_strategy_type_to_query
            (List.append path [ "AuthTokenUpdateStrategy" ])
            v);
      (match x.auth_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AuthToken" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.snapshot_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotWindow" ]) v);
      (match x.snapshot_retention_limit with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SnapshotRetentionLimit" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.apply_immediately with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ApplyImmediately" ]) v);
      (match x.notification_topic_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NotificationTopicStatus" ]) v);
      (match x.cache_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupName" ]) v);
      (match x.notification_topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NotificationTopicArn" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.security_group_ids with
      | None -> []
      | Some v -> security_group_ids_list_to_query (List.append path [ "SecurityGroupIds" ]) v);
      (match x.cache_security_group_names with
      | None -> []
      | Some v ->
          cache_security_group_name_list_to_query (List.append path [ "CacheSecurityGroupNames" ]) v);
      (match x.node_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NodeGroupId" ]) v);
      (match x.multi_az_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZEnabled" ]) v);
      (match x.automatic_failover_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutomaticFailoverEnabled" ]) v);
      (match x.snapshotting_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshottingClusterId" ]) v);
      (match x.primary_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PrimaryClusterId" ]) v);
      (match x.replication_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupDescription" ]) v);
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
    ]

let modify_global_replication_group_result_to_query path
    (x : modify_global_replication_group_result) =
  List.concat
    [
      (match x.global_replication_group with
      | None -> []
      | Some v ->
          global_replication_group_to_query (List.append path [ "GlobalReplicationGroup" ]) v);
    ]

let modify_global_replication_group_message_to_query path
    (x : modify_global_replication_group_message) =
  List.concat
    [
      (match x.automatic_failover_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutomaticFailoverEnabled" ]) v);
      (match x.global_replication_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalReplicationGroupDescription" ]) v);
      (match x.cache_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupName" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      boolean__to_query (List.append path [ "ApplyImmediately" ]) x.apply_immediately;
      string__to_query
        (List.append path [ "GlobalReplicationGroupId" ])
        x.global_replication_group_id;
    ]

let cache_subnet_group_to_query path (x : cache_subnet_group) =
  List.concat
    [
      (match x.supported_network_types with
      | None -> []
      | Some v -> network_type_list_to_query (List.append path [ "SupportedNetworkTypes" ]) v);
      (match x.ar_n with None -> [] | Some v -> string__to_query (List.append path [ "ARN" ]) v);
      (match x.subnets with
      | None -> []
      | Some v -> subnet_list_to_query (List.append path [ "Subnets" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.cache_subnet_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSubnetGroupDescription" ]) v);
      (match x.cache_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSubnetGroupName" ]) v);
    ]

let modify_cache_subnet_group_result_to_query path (x : modify_cache_subnet_group_result) =
  List.concat
    [
      (match x.cache_subnet_group with
      | None -> []
      | Some v -> cache_subnet_group_to_query (List.append path [ "CacheSubnetGroup" ]) v);
    ]

let modify_cache_subnet_group_message_to_query path (x : modify_cache_subnet_group_message) =
  List.concat
    [
      (match x.subnet_ids with
      | None -> []
      | Some v -> subnet_identifier_list_to_query (List.append path [ "SubnetIds" ]) v);
      (match x.cache_subnet_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSubnetGroupDescription" ]) v);
      string__to_query (List.append path [ "CacheSubnetGroupName" ]) x.cache_subnet_group_name;
    ]

let invalid_subnet_to_query path (x : invalid_subnet) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cache_subnet_quota_exceeded_fault_to_query path (x : cache_subnet_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_cache_parameter_group_message_to_query path (x : modify_cache_parameter_group_message) =
  List.concat
    [
      parameter_name_value_list_to_query
        (List.append path [ "ParameterNameValues" ])
        x.parameter_name_values;
      string__to_query (List.append path [ "CacheParameterGroupName" ]) x.cache_parameter_group_name;
    ]

let modify_cache_cluster_result_to_query path (x : modify_cache_cluster_result) =
  List.concat
    [
      (match x.cache_cluster with
      | None -> []
      | Some v -> cache_cluster_to_query (List.append path [ "CacheCluster" ]) v);
    ]

let az_mode_to_query path (x : az_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with CROSS_AZ -> "cross-az" | SINGLE_AZ -> "single-az")

let modify_cache_cluster_message_to_query path (x : modify_cache_cluster_message) =
  List.concat
    [
      (match x.scale_config with
      | None -> []
      | Some v -> scale_config_to_query (List.append path [ "ScaleConfig" ]) v);
      (match x.ip_discovery with
      | None -> []
      | Some v -> ip_discovery_to_query (List.append path [ "IpDiscovery" ]) v);
      (match x.log_delivery_configurations with
      | None -> []
      | Some v ->
          log_delivery_configuration_request_list_to_query
            (List.append path [ "LogDeliveryConfigurations" ])
            v);
      (match x.auth_token_update_strategy with
      | None -> []
      | Some v ->
          auth_token_update_strategy_type_to_query
            (List.append path [ "AuthTokenUpdateStrategy" ])
            v);
      (match x.auth_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AuthToken" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.snapshot_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotWindow" ]) v);
      (match x.snapshot_retention_limit with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SnapshotRetentionLimit" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.apply_immediately with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ApplyImmediately" ]) v);
      (match x.notification_topic_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NotificationTopicStatus" ]) v);
      (match x.cache_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupName" ]) v);
      (match x.notification_topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NotificationTopicArn" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.security_group_ids with
      | None -> []
      | Some v -> security_group_ids_list_to_query (List.append path [ "SecurityGroupIds" ]) v);
      (match x.cache_security_group_names with
      | None -> []
      | Some v ->
          cache_security_group_name_list_to_query (List.append path [ "CacheSecurityGroupNames" ]) v);
      (match x.new_availability_zones with
      | None -> []
      | Some v ->
          preferred_availability_zone_list_to_query (List.append path [ "NewAvailabilityZones" ]) v);
      (match x.az_mode with
      | None -> []
      | Some v -> az_mode_to_query (List.append path [ "AZMode" ]) v);
      (match x.cache_node_ids_to_remove with
      | None -> []
      | Some v -> cache_node_ids_list_to_query (List.append path [ "CacheNodeIdsToRemove" ]) v);
      (match x.num_cache_nodes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumCacheNodes" ]) v);
      string__to_query (List.append path [ "CacheClusterId" ]) x.cache_cluster_id;
    ]

let list_tags_for_resource_message_to_query path (x : list_tags_for_resource_message) =
  List.concat [ string__to_query (List.append path [ "ResourceName" ]) x.resource_name ]

let list_allowed_node_type_modifications_message_to_query path
    (x : list_allowed_node_type_modifications_message) =
  List.concat
    [
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
    ]

let allowed_node_type_modifications_message_to_query path
    (x : allowed_node_type_modifications_message) =
  List.concat
    [
      (match x.scale_down_modifications with
      | None -> []
      | Some v -> node_type_list_to_query (List.append path [ "ScaleDownModifications" ]) v);
      (match x.scale_up_modifications with
      | None -> []
      | Some v -> node_type_list_to_query (List.append path [ "ScaleUpModifications" ]) v);
    ]

let invalid_snapshot_state_fault_to_query path (x : invalid_snapshot_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let increase_replica_count_result_to_query path (x : increase_replica_count_result) =
  List.concat
    [
      (match x.replication_group with
      | None -> []
      | Some v -> replication_group_to_query (List.append path [ "ReplicationGroup" ]) v);
    ]

let increase_replica_count_message_to_query path (x : increase_replica_count_message) =
  List.concat
    [
      boolean__to_query (List.append path [ "ApplyImmediately" ]) x.apply_immediately;
      (match x.replica_configuration with
      | None -> []
      | Some v ->
          replica_configuration_list_to_query (List.append path [ "ReplicaConfiguration" ]) v);
      (match x.new_replica_count with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NewReplicaCount" ]) v);
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
    ]

let cluster_quota_for_customer_exceeded_fault_to_query path
    (x : cluster_quota_for_customer_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let increase_node_groups_in_global_replication_group_result_to_query path
    (x : increase_node_groups_in_global_replication_group_result) =
  List.concat
    [
      (match x.global_replication_group with
      | None -> []
      | Some v ->
          global_replication_group_to_query (List.append path [ "GlobalReplicationGroup" ]) v);
    ]

let increase_node_groups_in_global_replication_group_message_to_query path
    (x : increase_node_groups_in_global_replication_group_message) =
  List.concat
    [
      boolean__to_query (List.append path [ "ApplyImmediately" ]) x.apply_immediately;
      (match x.regional_configurations with
      | None -> []
      | Some v ->
          regional_configuration_list_to_query (List.append path [ "RegionalConfigurations" ]) v);
      integer_to_query (List.append path [ "NodeGroupCount" ]) x.node_group_count;
      string__to_query
        (List.append path [ "GlobalReplicationGroupId" ])
        x.global_replication_group_id;
    ]

let global_replication_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "GlobalReplicationGroup"
    global_replication_group_to_query path xs

let global_replication_group_already_exists_fault_to_query path
    (x : global_replication_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let global_node_group_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "GlobalNodeGroupId" string__to_query path xs

let filter_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let filter_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" filter_value_to_query path xs

let filter_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let filter_to_query path (x : filter) =
  List.concat
    [
      filter_value_list_to_query (List.append path [ "Values" ]) x.values;
      filter_name_to_query (List.append path [ "Name" ]) x.name;
    ]

let filter_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" filter_to_query path xs

let failover_global_replication_group_result_to_query path
    (x : failover_global_replication_group_result) =
  List.concat
    [
      (match x.global_replication_group with
      | None -> []
      | Some v ->
          global_replication_group_to_query (List.append path [ "GlobalReplicationGroup" ]) v);
    ]

let failover_global_replication_group_message_to_query path
    (x : failover_global_replication_group_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "PrimaryReplicationGroupId" ])
        x.primary_replication_group_id;
      string__to_query (List.append path [ "PrimaryRegion" ]) x.primary_region;
      string__to_query
        (List.append path [ "GlobalReplicationGroupId" ])
        x.global_replication_group_id;
    ]

let export_serverless_cache_snapshot_response_to_query path
    (x : export_serverless_cache_snapshot_response) =
  List.concat
    [
      (match x.serverless_cache_snapshot with
      | None -> []
      | Some v ->
          serverless_cache_snapshot_to_query (List.append path [ "ServerlessCacheSnapshot" ]) v);
    ]

let export_serverless_cache_snapshot_request_to_query path
    (x : export_serverless_cache_snapshot_request) =
  List.concat
    [
      string__to_query (List.append path [ "S3BucketName" ]) x.s3_bucket_name;
      string__to_query
        (List.append path [ "ServerlessCacheSnapshotName" ])
        x.serverless_cache_snapshot_name;
    ]

let event_to_query path (x : event) =
  List.concat
    [
      (match x.date with None -> [] | Some v -> t_stamp_to_query (List.append path [ "Date" ]) v);
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Message" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> source_type_to_query (List.append path [ "SourceType" ]) v);
      (match x.source_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceIdentifier" ]) v);
    ]

let event_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Event" event_to_query path xs

let events_message_to_query path (x : events_message) =
  List.concat
    [
      (match x.events with
      | None -> []
      | Some v -> event_list_to_query (List.append path [ "Events" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let cache_node_type_specific_value_to_query path (x : cache_node_type_specific_value) =
  List.concat
    [
      (match x.value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Value" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
    ]

let cache_node_type_specific_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheNodeTypeSpecificValue"
    cache_node_type_specific_value_to_query path xs

let cache_node_type_specific_parameter_to_query path (x : cache_node_type_specific_parameter) =
  List.concat
    [
      (match x.change_type with
      | None -> []
      | Some v -> change_type_to_query (List.append path [ "ChangeType" ]) v);
      (match x.cache_node_type_specific_values with
      | None -> []
      | Some v ->
          cache_node_type_specific_value_list_to_query
            (List.append path [ "CacheNodeTypeSpecificValues" ])
            v);
      (match x.minimum_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MinimumEngineVersion" ]) v);
      (match x.is_modifiable with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsModifiable" ]) v);
      (match x.allowed_values with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AllowedValues" ]) v);
      (match x.data_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DataType" ]) v);
      (match x.source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Source" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.parameter_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterName" ]) v);
    ]

let cache_node_type_specific_parameters_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheNodeTypeSpecificParameter"
    cache_node_type_specific_parameter_to_query path xs

let engine_defaults_to_query path (x : engine_defaults) =
  List.concat
    [
      (match x.cache_node_type_specific_parameters with
      | None -> []
      | Some v ->
          cache_node_type_specific_parameters_list_to_query
            (List.append path [ "CacheNodeTypeSpecificParameters" ])
            v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.cache_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupFamily" ]) v);
    ]

let disassociate_global_replication_group_result_to_query path
    (x : disassociate_global_replication_group_result) =
  List.concat
    [
      (match x.global_replication_group with
      | None -> []
      | Some v ->
          global_replication_group_to_query (List.append path [ "GlobalReplicationGroup" ]) v);
    ]

let disassociate_global_replication_group_message_to_query path
    (x : disassociate_global_replication_group_message) =
  List.concat
    [
      string__to_query (List.append path [ "ReplicationGroupRegion" ]) x.replication_group_region;
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
      string__to_query
        (List.append path [ "GlobalReplicationGroupId" ])
        x.global_replication_group_id;
    ]

let describe_users_result_to_query path (x : describe_users_result) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.users with
      | None -> []
      | Some v -> user_list_to_query (List.append path [ "Users" ]) v);
    ]

let describe_users_message_to_query path (x : describe_users_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.user_id with
      | None -> []
      | Some v -> user_id_to_query (List.append path [ "UserId" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> engine_type_to_query (List.append path [ "Engine" ]) v);
    ]

let describe_user_groups_result_to_query path (x : describe_user_groups_result) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.user_groups with
      | None -> []
      | Some v -> user_group_list_to_query (List.append path [ "UserGroups" ]) v);
    ]

let describe_user_groups_message_to_query path (x : describe_user_groups_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.user_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "UserGroupId" ]) v);
    ]

let cache_cluster_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let describe_update_actions_message_to_query path (x : describe_update_actions_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.show_node_level_update_status with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ShowNodeLevelUpdateStatus" ]) v);
      (match x.update_action_status with
      | None -> []
      | Some v -> update_action_status_list_to_query (List.append path [ "UpdateActionStatus" ]) v);
      (match x.service_update_time_range with
      | None -> []
      | Some v -> time_range_filter_to_query (List.append path [ "ServiceUpdateTimeRange" ]) v);
      (match x.service_update_status with
      | None -> []
      | Some v -> service_update_status_list_to_query (List.append path [ "ServiceUpdateStatus" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.cache_cluster_ids with
      | None -> []
      | Some v -> cache_cluster_id_list_to_query (List.append path [ "CacheClusterIds" ]) v);
      (match x.replication_group_ids with
      | None -> []
      | Some v -> replication_group_id_list_to_query (List.append path [ "ReplicationGroupIds" ]) v);
      (match x.service_update_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServiceUpdateName" ]) v);
    ]

let describe_snapshots_message_to_query path (x : describe_snapshots_message) =
  List.concat
    [
      (match x.show_node_group_config with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ShowNodeGroupConfig" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.snapshot_source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotSource" ]) v);
      (match x.snapshot_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotName" ]) v);
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
    ]

let describe_snapshots_list_message_to_query path (x : describe_snapshots_list_message) =
  List.concat
    [
      (match x.snapshots with
      | None -> []
      | Some v -> snapshot_list_to_query (List.append path [ "Snapshots" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_service_updates_message_to_query path (x : describe_service_updates_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.service_update_status with
      | None -> []
      | Some v -> service_update_status_list_to_query (List.append path [ "ServiceUpdateStatus" ]) v);
      (match x.service_update_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServiceUpdateName" ]) v);
    ]

let describe_serverless_caches_response_to_query path (x : describe_serverless_caches_response) =
  List.concat
    [
      (match x.serverless_caches with
      | None -> []
      | Some v -> serverless_cache_list_to_query (List.append path [ "ServerlessCaches" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_serverless_caches_request_to_query path (x : describe_serverless_caches_request) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxResults" ]) v);
      (match x.serverless_cache_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServerlessCacheName" ]) v);
    ]

let describe_serverless_cache_snapshots_response_to_query path
    (x : describe_serverless_cache_snapshots_response) =
  List.concat
    [
      (match x.serverless_cache_snapshots with
      | None -> []
      | Some v ->
          serverless_cache_snapshot_list_to_query
            (List.append path [ "ServerlessCacheSnapshots" ])
            v);
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
    ]

let describe_serverless_cache_snapshots_request_to_query path
    (x : describe_serverless_cache_snapshots_request) =
  List.concat
    [
      (match x.max_results with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
      (match x.snapshot_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotType" ]) v);
      (match x.serverless_cache_snapshot_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServerlessCacheSnapshotName" ]) v);
      (match x.serverless_cache_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServerlessCacheName" ]) v);
    ]

let describe_reserved_cache_nodes_offerings_message_to_query path
    (x : describe_reserved_cache_nodes_offerings_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.offering_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OfferingType" ]) v);
      (match x.product_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ProductDescription" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Duration" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.reserved_cache_nodes_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedCacheNodesOfferingId" ]) v);
    ]

let describe_reserved_cache_nodes_message_to_query path (x : describe_reserved_cache_nodes_message)
    =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.offering_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OfferingType" ]) v);
      (match x.product_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ProductDescription" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Duration" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.reserved_cache_nodes_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedCacheNodesOfferingId" ]) v);
      (match x.reserved_cache_node_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedCacheNodeId" ]) v);
    ]

let describe_replication_groups_message_to_query path (x : describe_replication_groups_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
    ]

let describe_global_replication_groups_result_to_query path
    (x : describe_global_replication_groups_result) =
  List.concat
    [
      (match x.global_replication_groups with
      | None -> []
      | Some v ->
          global_replication_group_list_to_query (List.append path [ "GlobalReplicationGroups" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_global_replication_groups_message_to_query path
    (x : describe_global_replication_groups_message) =
  List.concat
    [
      (match x.show_member_info with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ShowMemberInfo" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.global_replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalReplicationGroupId" ]) v);
    ]

let describe_events_message_to_query path (x : describe_events_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Duration" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> source_type_to_query (List.append path [ "SourceType" ]) v);
      (match x.source_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceIdentifier" ]) v);
    ]

let describe_engine_default_parameters_result_to_query path
    (x : describe_engine_default_parameters_result) =
  List.concat
    [
      (match x.engine_defaults with
      | None -> []
      | Some v -> engine_defaults_to_query (List.append path [ "EngineDefaults" ]) v);
    ]

let describe_engine_default_parameters_message_to_query path
    (x : describe_engine_default_parameters_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      string__to_query
        (List.append path [ "CacheParameterGroupFamily" ])
        x.cache_parameter_group_family;
    ]

let describe_cache_subnet_groups_message_to_query path (x : describe_cache_subnet_groups_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.cache_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSubnetGroupName" ]) v);
    ]

let cache_subnet_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheSubnetGroup"
    cache_subnet_group_to_query path xs

let cache_subnet_group_message_to_query path (x : cache_subnet_group_message) =
  List.concat
    [
      (match x.cache_subnet_groups with
      | None -> []
      | Some v -> cache_subnet_groups_to_query (List.append path [ "CacheSubnetGroups" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_cache_security_groups_message_to_query path
    (x : describe_cache_security_groups_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.cache_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSecurityGroupName" ]) v);
    ]

let cache_security_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheSecurityGroup"
    cache_security_group_to_query path xs

let cache_security_group_message_to_query path (x : cache_security_group_message) =
  List.concat
    [
      (match x.cache_security_groups with
      | None -> []
      | Some v -> cache_security_groups_to_query (List.append path [ "CacheSecurityGroups" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_cache_parameters_message_to_query path (x : describe_cache_parameters_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Source" ]) v);
      string__to_query (List.append path [ "CacheParameterGroupName" ]) x.cache_parameter_group_name;
    ]

let cache_parameter_group_details_to_query path (x : cache_parameter_group_details) =
  List.concat
    [
      (match x.cache_node_type_specific_parameters with
      | None -> []
      | Some v ->
          cache_node_type_specific_parameters_list_to_query
            (List.append path [ "CacheNodeTypeSpecificParameters" ])
            v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_cache_parameter_groups_message_to_query path
    (x : describe_cache_parameter_groups_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.cache_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupName" ]) v);
    ]

let cache_parameter_group_to_query path (x : cache_parameter_group) =
  List.concat
    [
      (match x.ar_n with None -> [] | Some v -> string__to_query (List.append path [ "ARN" ]) v);
      (match x.is_global with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsGlobal" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.cache_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupFamily" ]) v);
      (match x.cache_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupName" ]) v);
    ]

let cache_parameter_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheParameterGroup"
    cache_parameter_group_to_query path xs

let cache_parameter_groups_message_to_query path (x : cache_parameter_groups_message) =
  List.concat
    [
      (match x.cache_parameter_groups with
      | None -> []
      | Some v ->
          cache_parameter_group_list_to_query (List.append path [ "CacheParameterGroups" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_cache_engine_versions_message_to_query path
    (x : describe_cache_engine_versions_message) =
  List.concat
    [
      (match x.default_only with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "DefaultOnly" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.cache_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupFamily" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
    ]

let cache_engine_version_to_query path (x : cache_engine_version) =
  List.concat
    [
      (match x.cache_engine_version_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheEngineVersionDescription" ]) v);
      (match x.cache_engine_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheEngineDescription" ]) v);
      (match x.cache_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupFamily" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
    ]

let cache_engine_version_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheEngineVersion"
    cache_engine_version_to_query path xs

let cache_engine_version_message_to_query path (x : cache_engine_version_message) =
  List.concat
    [
      (match x.cache_engine_versions with
      | None -> []
      | Some v -> cache_engine_version_list_to_query (List.append path [ "CacheEngineVersions" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_cache_clusters_message_to_query path (x : describe_cache_clusters_message) =
  List.concat
    [
      (match x.show_cache_clusters_not_in_replication_groups with
      | None -> []
      | Some v ->
          boolean_optional_to_query
            (List.append path [ "ShowCacheClustersNotInReplicationGroups" ])
            v);
      (match x.show_cache_node_info with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ShowCacheNodeInfo" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
    ]

let cache_cluster_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CacheCluster" cache_cluster_to_query path xs

let cache_cluster_message_to_query path (x : cache_cluster_message) =
  List.concat
    [
      (match x.cache_clusters with
      | None -> []
      | Some v -> cache_cluster_list_to_query (List.append path [ "CacheClusters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let delete_user_message_to_query path (x : delete_user_message) =
  List.concat [ user_id_to_query (List.append path [ "UserId" ]) x.user_id ]

let delete_user_group_message_to_query path (x : delete_user_group_message) =
  List.concat [ string__to_query (List.append path [ "UserGroupId" ]) x.user_group_id ]

let default_user_associated_to_user_group_fault_to_query path
    (x : default_user_associated_to_user_group_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_snapshot_result_to_query path (x : delete_snapshot_result) =
  List.concat
    [
      (match x.snapshot with
      | None -> []
      | Some v -> snapshot_to_query (List.append path [ "Snapshot" ]) v);
    ]

let delete_snapshot_message_to_query path (x : delete_snapshot_message) =
  List.concat [ string__to_query (List.append path [ "SnapshotName" ]) x.snapshot_name ]

let delete_serverless_cache_snapshot_response_to_query path
    (x : delete_serverless_cache_snapshot_response) =
  List.concat
    [
      (match x.serverless_cache_snapshot with
      | None -> []
      | Some v ->
          serverless_cache_snapshot_to_query (List.append path [ "ServerlessCacheSnapshot" ]) v);
    ]

let delete_serverless_cache_snapshot_request_to_query path
    (x : delete_serverless_cache_snapshot_request) =
  List.concat
    [
      string__to_query
        (List.append path [ "ServerlessCacheSnapshotName" ])
        x.serverless_cache_snapshot_name;
    ]

let delete_serverless_cache_response_to_query path (x : delete_serverless_cache_response) =
  List.concat
    [
      (match x.serverless_cache with
      | None -> []
      | Some v -> serverless_cache_to_query (List.append path [ "ServerlessCache" ]) v);
    ]

let delete_serverless_cache_request_to_query path (x : delete_serverless_cache_request) =
  List.concat
    [
      (match x.final_snapshot_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FinalSnapshotName" ]) v);
      string__to_query (List.append path [ "ServerlessCacheName" ]) x.serverless_cache_name;
    ]

let delete_replication_group_result_to_query path (x : delete_replication_group_result) =
  List.concat
    [
      (match x.replication_group with
      | None -> []
      | Some v -> replication_group_to_query (List.append path [ "ReplicationGroup" ]) v);
    ]

let delete_replication_group_message_to_query path (x : delete_replication_group_message) =
  List.concat
    [
      (match x.final_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FinalSnapshotIdentifier" ]) v);
      (match x.retain_primary_cluster with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "RetainPrimaryCluster" ]) v);
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
    ]

let delete_global_replication_group_result_to_query path
    (x : delete_global_replication_group_result) =
  List.concat
    [
      (match x.global_replication_group with
      | None -> []
      | Some v ->
          global_replication_group_to_query (List.append path [ "GlobalReplicationGroup" ]) v);
    ]

let delete_global_replication_group_message_to_query path
    (x : delete_global_replication_group_message) =
  List.concat
    [
      boolean__to_query
        (List.append path [ "RetainPrimaryReplicationGroup" ])
        x.retain_primary_replication_group;
      string__to_query
        (List.append path [ "GlobalReplicationGroupId" ])
        x.global_replication_group_id;
    ]

let delete_cache_subnet_group_message_to_query path (x : delete_cache_subnet_group_message) =
  List.concat
    [ string__to_query (List.append path [ "CacheSubnetGroupName" ]) x.cache_subnet_group_name ]

let cache_subnet_group_in_use_to_query path (x : cache_subnet_group_in_use) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_cache_security_group_message_to_query path (x : delete_cache_security_group_message) =
  List.concat
    [ string__to_query (List.append path [ "CacheSecurityGroupName" ]) x.cache_security_group_name ]

let delete_cache_parameter_group_message_to_query path (x : delete_cache_parameter_group_message) =
  List.concat
    [
      string__to_query (List.append path [ "CacheParameterGroupName" ]) x.cache_parameter_group_name;
    ]

let delete_cache_cluster_result_to_query path (x : delete_cache_cluster_result) =
  List.concat
    [
      (match x.cache_cluster with
      | None -> []
      | Some v -> cache_cluster_to_query (List.append path [ "CacheCluster" ]) v);
    ]

let delete_cache_cluster_message_to_query path (x : delete_cache_cluster_message) =
  List.concat
    [
      (match x.final_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FinalSnapshotIdentifier" ]) v);
      string__to_query (List.append path [ "CacheClusterId" ]) x.cache_cluster_id;
    ]

let decrease_replica_count_result_to_query path (x : decrease_replica_count_result) =
  List.concat
    [
      (match x.replication_group with
      | None -> []
      | Some v -> replication_group_to_query (List.append path [ "ReplicationGroup" ]) v);
    ]

let decrease_replica_count_message_to_query path (x : decrease_replica_count_message) =
  List.concat
    [
      boolean__to_query (List.append path [ "ApplyImmediately" ]) x.apply_immediately;
      (match x.replicas_to_remove with
      | None -> []
      | Some v -> remove_replicas_list_to_query (List.append path [ "ReplicasToRemove" ]) v);
      (match x.replica_configuration with
      | None -> []
      | Some v ->
          replica_configuration_list_to_query (List.append path [ "ReplicaConfiguration" ]) v);
      (match x.new_replica_count with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NewReplicaCount" ]) v);
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
    ]

let decrease_node_groups_in_global_replication_group_result_to_query path
    (x : decrease_node_groups_in_global_replication_group_result) =
  List.concat
    [
      (match x.global_replication_group with
      | None -> []
      | Some v ->
          global_replication_group_to_query (List.append path [ "GlobalReplicationGroup" ]) v);
    ]

let decrease_node_groups_in_global_replication_group_message_to_query path
    (x : decrease_node_groups_in_global_replication_group_message) =
  List.concat
    [
      boolean__to_query (List.append path [ "ApplyImmediately" ]) x.apply_immediately;
      (match x.global_node_groups_to_retain with
      | None -> []
      | Some v ->
          global_node_group_id_list_to_query (List.append path [ "GlobalNodeGroupsToRetain" ]) v);
      (match x.global_node_groups_to_remove with
      | None -> []
      | Some v ->
          global_node_group_id_list_to_query (List.append path [ "GlobalNodeGroupsToRemove" ]) v);
      integer_to_query (List.append path [ "NodeGroupCount" ]) x.node_group_count;
      string__to_query
        (List.append path [ "GlobalReplicationGroupId" ])
        x.global_replication_group_id;
    ]

let create_user_message_to_query path (x : create_user_message) =
  List.concat
    [
      (match x.authentication_mode with
      | None -> []
      | Some v -> authentication_mode_to_query (List.append path [ "AuthenticationMode" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.no_password_required with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "NoPasswordRequired" ]) v);
      access_string_to_query (List.append path [ "AccessString" ]) x.access_string;
      (match x.passwords with
      | None -> []
      | Some v -> password_list_input_to_query (List.append path [ "Passwords" ]) v);
      engine_type_to_query (List.append path [ "Engine" ]) x.engine;
      user_name_to_query (List.append path [ "UserName" ]) x.user_name;
      user_id_to_query (List.append path [ "UserId" ]) x.user_id;
    ]

let create_user_group_message_to_query path (x : create_user_group_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.user_ids with
      | None -> []
      | Some v -> user_id_list_input_to_query (List.append path [ "UserIds" ]) v);
      engine_type_to_query (List.append path [ "Engine" ]) x.engine;
      string__to_query (List.append path [ "UserGroupId" ]) x.user_group_id;
    ]

let create_snapshot_result_to_query path (x : create_snapshot_result) =
  List.concat
    [
      (match x.snapshot with
      | None -> []
      | Some v -> snapshot_to_query (List.append path [ "Snapshot" ]) v);
    ]

let create_snapshot_message_to_query path (x : create_snapshot_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      string__to_query (List.append path [ "SnapshotName" ]) x.snapshot_name;
      (match x.cache_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheClusterId" ]) v);
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
    ]

let create_serverless_cache_snapshot_response_to_query path
    (x : create_serverless_cache_snapshot_response) =
  List.concat
    [
      (match x.serverless_cache_snapshot with
      | None -> []
      | Some v ->
          serverless_cache_snapshot_to_query (List.append path [ "ServerlessCacheSnapshot" ]) v);
    ]

let create_serverless_cache_snapshot_request_to_query path
    (x : create_serverless_cache_snapshot_request) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      string__to_query (List.append path [ "ServerlessCacheName" ]) x.serverless_cache_name;
      string__to_query
        (List.append path [ "ServerlessCacheSnapshotName" ])
        x.serverless_cache_snapshot_name;
    ]

let create_serverless_cache_response_to_query path (x : create_serverless_cache_response) =
  List.concat
    [
      (match x.serverless_cache with
      | None -> []
      | Some v -> serverless_cache_to_query (List.append path [ "ServerlessCache" ]) v);
    ]

let create_serverless_cache_request_to_query path (x : create_serverless_cache_request) =
  List.concat
    [
      (match x.network_type with
      | None -> []
      | Some v -> network_type_to_query (List.append path [ "NetworkType" ]) v);
      (match x.daily_snapshot_time with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DailySnapshotTime" ]) v);
      (match x.snapshot_retention_limit with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SnapshotRetentionLimit" ]) v);
      (match x.subnet_ids with
      | None -> []
      | Some v -> subnet_ids_list_to_query (List.append path [ "SubnetIds" ]) v);
      (match x.user_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "UserGroupId" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.snapshot_arns_to_restore with
      | None -> []
      | Some v -> snapshot_arns_list_to_query (List.append path [ "SnapshotArnsToRestore" ]) v);
      (match x.security_group_ids with
      | None -> []
      | Some v -> security_group_ids_list_to_query (List.append path [ "SecurityGroupIds" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.cache_usage_limits with
      | None -> []
      | Some v -> cache_usage_limits_to_query (List.append path [ "CacheUsageLimits" ]) v);
      (match x.major_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MajorEngineVersion" ]) v);
      string__to_query (List.append path [ "Engine" ]) x.engine;
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      string__to_query (List.append path [ "ServerlessCacheName" ]) x.serverless_cache_name;
    ]

let create_replication_group_result_to_query path (x : create_replication_group_result) =
  List.concat
    [
      (match x.replication_group with
      | None -> []
      | Some v -> replication_group_to_query (List.append path [ "ReplicationGroup" ]) v);
    ]

let create_replication_group_message_to_query path (x : create_replication_group_message) =
  List.concat
    [
      (match x.durability with
      | None -> []
      | Some v -> durability_to_query (List.append path [ "Durability" ]) v);
      (match x.serverless_cache_snapshot_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServerlessCacheSnapshotName" ]) v);
      (match x.cluster_mode with
      | None -> []
      | Some v -> cluster_mode_to_query (List.append path [ "ClusterMode" ]) v);
      (match x.transit_encryption_mode with
      | None -> []
      | Some v -> transit_encryption_mode_to_query (List.append path [ "TransitEncryptionMode" ]) v);
      (match x.ip_discovery with
      | None -> []
      | Some v -> ip_discovery_to_query (List.append path [ "IpDiscovery" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> network_type_to_query (List.append path [ "NetworkType" ]) v);
      (match x.data_tiering_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DataTieringEnabled" ]) v);
      (match x.log_delivery_configurations with
      | None -> []
      | Some v ->
          log_delivery_configuration_request_list_to_query
            (List.append path [ "LogDeliveryConfigurations" ])
            v);
      (match x.user_group_ids with
      | None -> []
      | Some v -> user_group_id_list_input_to_query (List.append path [ "UserGroupIds" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.at_rest_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AtRestEncryptionEnabled" ]) v);
      (match x.transit_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "TransitEncryptionEnabled" ]) v);
      (match x.auth_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AuthToken" ]) v);
      (match x.snapshot_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotWindow" ]) v);
      (match x.snapshot_retention_limit with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SnapshotRetentionLimit" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.notification_topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NotificationTopicArn" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.snapshot_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotName" ]) v);
      (match x.snapshot_arns with
      | None -> []
      | Some v -> snapshot_arns_list_to_query (List.append path [ "SnapshotArns" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.security_group_ids with
      | None -> []
      | Some v -> security_group_ids_list_to_query (List.append path [ "SecurityGroupIds" ]) v);
      (match x.cache_security_group_names with
      | None -> []
      | Some v ->
          cache_security_group_name_list_to_query (List.append path [ "CacheSecurityGroupNames" ]) v);
      (match x.cache_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSubnetGroupName" ]) v);
      (match x.cache_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupName" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.node_group_configuration with
      | None -> []
      | Some v ->
          node_group_configuration_list_to_query (List.append path [ "NodeGroupConfiguration" ]) v);
      (match x.replicas_per_node_group with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ReplicasPerNodeGroup" ]) v);
      (match x.num_node_groups with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumNodeGroups" ]) v);
      (match x.preferred_cache_cluster_a_zs with
      | None -> []
      | Some v ->
          availability_zones_list_to_query (List.append path [ "PreferredCacheClusterAZs" ]) v);
      (match x.num_cache_clusters with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumCacheClusters" ]) v);
      (match x.multi_az_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZEnabled" ]) v);
      (match x.automatic_failover_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutomaticFailoverEnabled" ]) v);
      (match x.primary_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PrimaryClusterId" ]) v);
      (match x.global_replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalReplicationGroupId" ]) v);
      string__to_query
        (List.append path [ "ReplicationGroupDescription" ])
        x.replication_group_description;
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
    ]

let create_global_replication_group_result_to_query path
    (x : create_global_replication_group_result) =
  List.concat
    [
      (match x.global_replication_group with
      | None -> []
      | Some v ->
          global_replication_group_to_query (List.append path [ "GlobalReplicationGroup" ]) v);
    ]

let create_global_replication_group_message_to_query path
    (x : create_global_replication_group_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "PrimaryReplicationGroupId" ])
        x.primary_replication_group_id;
      (match x.global_replication_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalReplicationGroupDescription" ]) v);
      string__to_query
        (List.append path [ "GlobalReplicationGroupIdSuffix" ])
        x.global_replication_group_id_suffix;
    ]

let create_cache_subnet_group_result_to_query path (x : create_cache_subnet_group_result) =
  List.concat
    [
      (match x.cache_subnet_group with
      | None -> []
      | Some v -> cache_subnet_group_to_query (List.append path [ "CacheSubnetGroup" ]) v);
    ]

let create_cache_subnet_group_message_to_query path (x : create_cache_subnet_group_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      subnet_identifier_list_to_query (List.append path [ "SubnetIds" ]) x.subnet_ids;
      string__to_query
        (List.append path [ "CacheSubnetGroupDescription" ])
        x.cache_subnet_group_description;
      string__to_query (List.append path [ "CacheSubnetGroupName" ]) x.cache_subnet_group_name;
    ]

let cache_subnet_group_quota_exceeded_fault_to_query path
    (x : cache_subnet_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cache_subnet_group_already_exists_fault_to_query path
    (x : cache_subnet_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_cache_security_group_result_to_query path (x : create_cache_security_group_result) =
  List.concat
    [
      (match x.cache_security_group with
      | None -> []
      | Some v -> cache_security_group_to_query (List.append path [ "CacheSecurityGroup" ]) v);
    ]

let create_cache_security_group_message_to_query path (x : create_cache_security_group_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query (List.append path [ "Description" ]) x.description;
      string__to_query (List.append path [ "CacheSecurityGroupName" ]) x.cache_security_group_name;
    ]

let cache_security_group_quota_exceeded_fault_to_query path
    (x : cache_security_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cache_security_group_already_exists_fault_to_query path
    (x : cache_security_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_cache_parameter_group_result_to_query path (x : create_cache_parameter_group_result) =
  List.concat
    [
      (match x.cache_parameter_group with
      | None -> []
      | Some v -> cache_parameter_group_to_query (List.append path [ "CacheParameterGroup" ]) v);
    ]

let create_cache_parameter_group_message_to_query path (x : create_cache_parameter_group_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query (List.append path [ "Description" ]) x.description;
      string__to_query
        (List.append path [ "CacheParameterGroupFamily" ])
        x.cache_parameter_group_family;
      string__to_query (List.append path [ "CacheParameterGroupName" ]) x.cache_parameter_group_name;
    ]

let cache_parameter_group_quota_exceeded_fault_to_query path
    (x : cache_parameter_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let cache_parameter_group_already_exists_fault_to_query path
    (x : cache_parameter_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_cache_cluster_result_to_query path (x : create_cache_cluster_result) =
  List.concat
    [
      (match x.cache_cluster with
      | None -> []
      | Some v -> cache_cluster_to_query (List.append path [ "CacheCluster" ]) v);
    ]

let create_cache_cluster_message_to_query path (x : create_cache_cluster_message) =
  List.concat
    [
      (match x.ip_discovery with
      | None -> []
      | Some v -> ip_discovery_to_query (List.append path [ "IpDiscovery" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> network_type_to_query (List.append path [ "NetworkType" ]) v);
      (match x.transit_encryption_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "TransitEncryptionEnabled" ]) v);
      (match x.log_delivery_configurations with
      | None -> []
      | Some v ->
          log_delivery_configuration_request_list_to_query
            (List.append path [ "LogDeliveryConfigurations" ])
            v);
      (match x.preferred_outpost_arns with
      | None -> []
      | Some v ->
          preferred_outpost_arn_list_to_query (List.append path [ "PreferredOutpostArns" ]) v);
      (match x.preferred_outpost_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredOutpostArn" ]) v);
      (match x.outpost_mode with
      | None -> []
      | Some v -> outpost_mode_to_query (List.append path [ "OutpostMode" ]) v);
      (match x.auth_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AuthToken" ]) v);
      (match x.snapshot_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotWindow" ]) v);
      (match x.snapshot_retention_limit with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SnapshotRetentionLimit" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.notification_topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NotificationTopicArn" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.snapshot_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotName" ]) v);
      (match x.snapshot_arns with
      | None -> []
      | Some v -> snapshot_arns_list_to_query (List.append path [ "SnapshotArns" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.security_group_ids with
      | None -> []
      | Some v -> security_group_ids_list_to_query (List.append path [ "SecurityGroupIds" ]) v);
      (match x.cache_security_group_names with
      | None -> []
      | Some v ->
          cache_security_group_name_list_to_query (List.append path [ "CacheSecurityGroupNames" ]) v);
      (match x.cache_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheSubnetGroupName" ]) v);
      (match x.cache_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheParameterGroupName" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.cache_node_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CacheNodeType" ]) v);
      (match x.num_cache_nodes with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "NumCacheNodes" ]) v);
      (match x.preferred_availability_zones with
      | None -> []
      | Some v ->
          preferred_availability_zone_list_to_query
            (List.append path [ "PreferredAvailabilityZones" ])
            v);
      (match x.preferred_availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredAvailabilityZone" ]) v);
      (match x.az_mode with
      | None -> []
      | Some v -> az_mode_to_query (List.append path [ "AZMode" ]) v);
      (match x.replication_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationGroupId" ]) v);
      string__to_query (List.append path [ "CacheClusterId" ]) x.cache_cluster_id;
    ]

let cache_cluster_already_exists_fault_to_query path (x : cache_cluster_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let copy_snapshot_result_to_query path (x : copy_snapshot_result) =
  List.concat
    [
      (match x.snapshot with
      | None -> []
      | Some v -> snapshot_to_query (List.append path [ "Snapshot" ]) v);
    ]

let copy_snapshot_message_to_query path (x : copy_snapshot_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.target_bucket with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetBucket" ]) v);
      string__to_query (List.append path [ "TargetSnapshotName" ]) x.target_snapshot_name;
      string__to_query (List.append path [ "SourceSnapshotName" ]) x.source_snapshot_name;
    ]

let copy_serverless_cache_snapshot_response_to_query path
    (x : copy_serverless_cache_snapshot_response) =
  List.concat
    [
      (match x.serverless_cache_snapshot with
      | None -> []
      | Some v ->
          serverless_cache_snapshot_to_query (List.append path [ "ServerlessCacheSnapshot" ]) v);
    ]

let copy_serverless_cache_snapshot_request_to_query path
    (x : copy_serverless_cache_snapshot_request) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      string__to_query
        (List.append path [ "TargetServerlessCacheSnapshotName" ])
        x.target_serverless_cache_snapshot_name;
      string__to_query
        (List.append path [ "SourceServerlessCacheSnapshotName" ])
        x.source_serverless_cache_snapshot_name;
    ]

let complete_migration_response_to_query path (x : complete_migration_response) =
  List.concat
    [
      (match x.replication_group with
      | None -> []
      | Some v -> replication_group_to_query (List.append path [ "ReplicationGroup" ]) v);
    ]

let complete_migration_message_to_query path (x : complete_migration_message) =
  List.concat
    [
      (match x.force with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Force" ]) v);
      string__to_query (List.append path [ "ReplicationGroupId" ]) x.replication_group_id;
    ]

let batch_stop_update_action_message_to_query path (x : batch_stop_update_action_message) =
  List.concat
    [
      string__to_query (List.append path [ "ServiceUpdateName" ]) x.service_update_name;
      (match x.cache_cluster_ids with
      | None -> []
      | Some v -> cache_cluster_id_list_to_query (List.append path [ "CacheClusterIds" ]) v);
      (match x.replication_group_ids with
      | None -> []
      | Some v -> replication_group_id_list_to_query (List.append path [ "ReplicationGroupIds" ]) v);
    ]

let batch_apply_update_action_message_to_query path (x : batch_apply_update_action_message) =
  List.concat
    [
      string__to_query (List.append path [ "ServiceUpdateName" ]) x.service_update_name;
      (match x.cache_cluster_ids with
      | None -> []
      | Some v -> cache_cluster_id_list_to_query (List.append path [ "CacheClusterIds" ]) v);
      (match x.replication_group_ids with
      | None -> []
      | Some v -> replication_group_id_list_to_query (List.append path [ "ReplicationGroupIds" ]) v);
    ]

let authorize_cache_security_group_ingress_result_to_query path
    (x : authorize_cache_security_group_ingress_result) =
  List.concat
    [
      (match x.cache_security_group with
      | None -> []
      | Some v -> cache_security_group_to_query (List.append path [ "CacheSecurityGroup" ]) v);
    ]

let authorize_cache_security_group_ingress_message_to_query path
    (x : authorize_cache_security_group_ingress_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "EC2SecurityGroupOwnerId" ])
        x.ec2_security_group_owner_id;
      string__to_query (List.append path [ "EC2SecurityGroupName" ]) x.ec2_security_group_name;
      string__to_query (List.append path [ "CacheSecurityGroupName" ]) x.cache_security_group_name;
    ]

let authorization_already_exists_fault_to_query path (x : authorization_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let add_tags_to_resource_message_to_query path (x : add_tags_to_resource_message) =
  List.concat
    [
      tag_list_to_query (List.append path [ "Tags" ]) x.tags;
      string__to_query (List.append path [ "ResourceName" ]) x.resource_name;
    ]
