open Types

let exception_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_db_cluster_state_fault_to_query path (x : invalid_db_cluster_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_role_quota_exceeded_fault_to_query path (x : db_cluster_role_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_role_already_exists_fault_to_query path (x : db_cluster_role_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_not_found_fault_to_query path (x : db_cluster_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let add_role_to_db_cluster_message_to_query path (x : add_role_to_db_cluster_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      string__to_query (List.append path [ "RoleArn" ]) x.role_arn;
      (match x.feature_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FeatureName" ]) v);
    ]

let subscription_not_found_fault_to_query path (x : subscription_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let source_not_found_fault_to_query path (x : source_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let boolean__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let event_categories_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "EventCategory" string__to_query path xs

let source_ids_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SourceId" string__to_query path xs

let event_subscription_to_query path (x : event_subscription) =
  List.concat
    [
      (match x.customer_aws_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomerAwsId" ]) v);
      (match x.cust_subscription_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustSubscriptionId" ]) v);
      (match x.sns_topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnsTopicArn" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.subscription_creation_time with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubscriptionCreationTime" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      (match x.source_ids_list with
      | None -> []
      | Some v -> source_ids_list_to_query (List.append path [ "SourceIdsList" ]) v);
      (match x.event_categories_list with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategoriesList" ]) v);
      (match x.enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Enabled" ]) v);
      (match x.event_subscription_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EventSubscriptionArn" ]) v);
    ]

let add_source_identifier_to_subscription_result_to_query path
    (x : add_source_identifier_to_subscription_result) =
  List.concat
    [
      (match x.event_subscription with
      | None -> []
      | Some v -> event_subscription_to_query (List.append path [ "EventSubscription" ]) v);
    ]

let add_source_identifier_to_subscription_message_to_query path
    (x : add_source_identifier_to_subscription_message) =
  List.concat
    [
      string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name;
      string__to_query (List.append path [ "SourceIdentifier" ]) x.source_identifier;
    ]

let db_snapshot_not_found_fault_to_query path (x : db_snapshot_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_instance_not_found_fault_to_query path (x : db_instance_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let tag_to_query path (x : tag) =
  List.concat
    [
      (match x.key with None -> [] | Some v -> string__to_query (List.append path [ "Key" ]) v);
      (match x.value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Value" ]) v);
    ]

let tag_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Tag" tag_to_query path xs

let add_tags_to_resource_message_to_query path (x : add_tags_to_resource_message) =
  List.concat
    [
      string__to_query (List.append path [ "ResourceName" ]) x.resource_name;
      tag_list_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let invalid_global_cluster_state_fault_to_query path (x : invalid_global_cluster_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let global_cluster_not_found_fault_to_query path (x : global_cluster_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let failover_status_to_query path (x : failover_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | PENDING -> "pending"
    | FAILING_OVER -> "failing-over"
    | CANCELLING -> "cancelling")

let failover_state_to_query path (x : failover_state) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> failover_status_to_query (List.append path [ "Status" ]) v);
      (match x.from_db_cluster_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FromDbClusterArn" ]) v);
      (match x.to_db_cluster_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ToDbClusterArn" ]) v);
      (match x.is_data_loss_allowed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsDataLossAllowed" ]) v);
    ]

let readers_arn_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let global_cluster_member_to_query path (x : global_cluster_member) =
  List.concat
    [
      (match x.db_cluster_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterArn" ]) v);
      (match x.readers with
      | None -> []
      | Some v -> readers_arn_list_to_query (List.append path [ "Readers" ]) v);
      (match x.is_writer with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsWriter" ]) v);
    ]

let global_cluster_member_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "GlobalClusterMember"
    global_cluster_member_to_query path xs

let boolean_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let global_cluster_identifier_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let global_cluster_to_query path (x : global_cluster) =
  List.concat
    [
      (match x.global_cluster_identifier with
      | None -> []
      | Some v ->
          global_cluster_identifier_to_query (List.append path [ "GlobalClusterIdentifier" ]) v);
      (match x.global_cluster_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalClusterResourceId" ]) v);
      (match x.global_cluster_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalClusterArn" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.global_cluster_members with
      | None -> []
      | Some v ->
          global_cluster_member_list_to_query (List.append path [ "GlobalClusterMembers" ]) v);
      (match x.failover_state with
      | None -> []
      | Some v -> failover_state_to_query (List.append path [ "FailoverState" ]) v);
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
    ]

let switchover_global_cluster_result_to_query path (x : switchover_global_cluster_result) =
  List.concat
    [
      (match x.global_cluster with
      | None -> []
      | Some v -> global_cluster_to_query (List.append path [ "GlobalCluster" ]) v);
    ]

let switchover_global_cluster_message_to_query path (x : switchover_global_cluster_message) =
  List.concat
    [
      global_cluster_identifier_to_query
        (List.append path [ "GlobalClusterIdentifier" ])
        x.global_cluster_identifier;
      string__to_query
        (List.append path [ "TargetDbClusterIdentifier" ])
        x.target_db_cluster_identifier;
    ]

let invalid_db_instance_state_fault_to_query path (x : invalid_db_instance_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let t_stamp_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v
let double_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let serverless_v2_scaling_configuration_info_to_query path
    (x : serverless_v2_scaling_configuration_info) =
  List.concat
    [
      (match x.min_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinCapacity" ]) v);
      (match x.max_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxCapacity" ]) v);
    ]

let integer_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let log_type_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let pending_cloudwatch_logs_exports_to_query path (x : pending_cloudwatch_logs_exports) =
  List.concat
    [
      (match x.log_types_to_enable with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "LogTypesToEnable" ]) v);
      (match x.log_types_to_disable with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "LogTypesToDisable" ]) v);
    ]

let cluster_pending_modified_values_to_query path (x : cluster_pending_modified_values) =
  List.concat
    [
      (match x.pending_cloudwatch_logs_exports with
      | None -> []
      | Some v ->
          pending_cloudwatch_logs_exports_to_query
            (List.append path [ "PendingCloudwatchLogsExports" ])
            v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
    ]

let db_cluster_role_to_query path (x : db_cluster_role) =
  List.concat
    [
      (match x.role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RoleArn" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.feature_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FeatureName" ]) v);
    ]

let db_cluster_roles_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterRole" db_cluster_role_to_query path
    xs

let vpc_security_group_membership_to_query path (x : vpc_security_group_membership) =
  List.concat
    [
      (match x.vpc_security_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcSecurityGroupId" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
    ]

let vpc_security_group_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "VpcSecurityGroupMembership"
    vpc_security_group_membership_to_query path xs

let db_cluster_member_to_query path (x : db_cluster_member) =
  List.concat
    [
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
      (match x.is_cluster_writer with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsClusterWriter" ]) v);
      (match x.db_cluster_parameter_group_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupStatus" ]) v);
      (match x.promotion_tier with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PromotionTier" ]) v);
    ]

let db_cluster_member_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterMember" db_cluster_member_to_query
    path xs

let read_replica_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReadReplicaIdentifier" string__to_query path
    xs

let db_cluster_option_group_status_to_query path (x : db_cluster_option_group_status) =
  List.concat
    [
      (match x.db_cluster_option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterOptionGroupName" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
    ]

let db_cluster_option_group_memberships_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterOptionGroup"
    db_cluster_option_group_status_to_query path xs

let availability_zones_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AvailabilityZone" string__to_query path xs

let db_cluster_to_query path (x : db_cluster) =
  List.concat
    [
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.db_cluster_parameter_group with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroup" ]) v);
      (match x.db_subnet_group with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroup" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.percent_progress with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PercentProgress" ]) v);
      (match x.earliest_restorable_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EarliestRestorableTime" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.reader_endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReaderEndpoint" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "MultiAZ" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.latest_restorable_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "LatestRestorableTime" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.db_cluster_option_group_memberships with
      | None -> []
      | Some v ->
          db_cluster_option_group_memberships_to_query
            (List.append path [ "DBClusterOptionGroupMemberships" ])
            v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.replication_source_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationSourceIdentifier" ]) v);
      (match x.read_replica_identifiers with
      | None -> []
      | Some v ->
          read_replica_identifier_list_to_query (List.append path [ "ReadReplicaIdentifiers" ]) v);
      (match x.db_cluster_members with
      | None -> []
      | Some v -> db_cluster_member_list_to_query (List.append path [ "DBClusterMembers" ]) v);
      (match x.vpc_security_groups with
      | None -> []
      | Some v ->
          vpc_security_group_membership_list_to_query (List.append path [ "VpcSecurityGroups" ]) v);
      (match x.hosted_zone_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HostedZoneId" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.db_cluster_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbClusterResourceId" ]) v);
      (match x.db_cluster_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterArn" ]) v);
      (match x.associated_roles with
      | None -> []
      | Some v -> db_cluster_roles_to_query (List.append path [ "AssociatedRoles" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
      (match x.clone_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CloneGroupId" ]) v);
      (match x.cluster_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ClusterCreateTime" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.enabled_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnabledCloudwatchLogsExports" ]) v);
      (match x.pending_modified_values with
      | None -> []
      | Some v ->
          cluster_pending_modified_values_to_query (List.append path [ "PendingModifiedValues" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.cross_account_clone with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CrossAccountClone" ]) v);
      (match x.automatic_restart_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "AutomaticRestartTime" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_info_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.global_cluster_identifier with
      | None -> []
      | Some v ->
          global_cluster_identifier_to_query (List.append path [ "GlobalClusterIdentifier" ]) v);
      (match x.io_optimized_next_allowed_modification_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "IOOptimizedNextAllowedModificationTime" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
    ]

let stop_db_cluster_result_to_query path (x : stop_db_cluster_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let stop_db_cluster_message_to_query path (x : stop_db_cluster_message) =
  List.concat
    [ string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier ]

let start_db_cluster_result_to_query path (x : start_db_cluster_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let start_db_cluster_message_to_query path (x : start_db_cluster_message) =
  List.concat
    [ string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier ]

let storage_quota_exceeded_fault_to_query path (x : storage_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let option_group_not_found_fault_to_query path (x : option_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let network_type_not_supported_fault_to_query path (x : network_type_not_supported_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let kms_key_not_accessible_fault_to_query path (x : kms_key_not_accessible_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_vpc_network_state_fault_to_query path (x : invalid_vpc_network_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_subnet_to_query path (x : invalid_subnet) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_restore_fault_to_query path (x : invalid_restore_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_db_snapshot_state_fault_to_query path (x : invalid_db_snapshot_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_db_cluster_snapshot_state_fault_to_query path
    (x : invalid_db_cluster_snapshot_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let insufficient_storage_cluster_capacity_fault_to_query path
    (x : insufficient_storage_cluster_capacity_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let insufficient_db_cluster_capacity_fault_to_query path
    (x : insufficient_db_cluster_capacity_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_subnet_group_not_found_fault_to_query path (x : db_subnet_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_snapshot_not_found_fault_to_query path (x : db_cluster_snapshot_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_quota_exceeded_fault_to_query path (x : db_cluster_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_parameter_group_not_found_fault_to_query path
    (x : db_cluster_parameter_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_already_exists_fault_to_query path (x : db_cluster_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let restore_db_cluster_to_point_in_time_result_to_query path
    (x : restore_db_cluster_to_point_in_time_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let serverless_v2_scaling_configuration_to_query path (x : serverless_v2_scaling_configuration) =
  List.concat
    [
      (match x.min_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinCapacity" ]) v);
      (match x.max_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxCapacity" ]) v);
    ]

let vpc_security_group_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "VpcSecurityGroupId" string__to_query path xs

let restore_db_cluster_to_point_in_time_message_to_query path
    (x : restore_db_cluster_to_point_in_time_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      (match x.restore_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RestoreType" ]) v);
      string__to_query
        (List.append path [ "SourceDBClusterIdentifier" ])
        x.source_db_cluster_identifier;
      (match x.restore_to_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "RestoreToTime" ]) v);
      (match x.use_latest_restorable_time with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "UseLatestRestorableTime" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
    ]

let restore_db_cluster_from_snapshot_result_to_query path
    (x : restore_db_cluster_from_snapshot_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let restore_db_cluster_from_snapshot_message_to_query path
    (x : restore_db_cluster_from_snapshot_message) =
  List.concat
    [
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      string__to_query (List.append path [ "SnapshotIdentifier" ]) x.snapshot_identifier;
      string__to_query (List.append path [ "Engine" ]) x.engine;
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
    ]

let invalid_db_parameter_group_state_fault_to_query path
    (x : invalid_db_parameter_group_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_parameter_group_not_found_fault_to_query path (x : db_parameter_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_parameter_group_name_message_to_query path (x : db_parameter_group_name_message) =
  List.concat
    [
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
    ]

let apply_method_to_query path (x : apply_method) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Immediate -> "immediate" | Pending_reboot -> "pending-reboot")

let parameter_to_query path (x : parameter) =
  List.concat
    [
      (match x.parameter_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterName" ]) v);
      (match x.parameter_value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterValue" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Source" ]) v);
      (match x.apply_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ApplyType" ]) v);
      (match x.data_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DataType" ]) v);
      (match x.allowed_values with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AllowedValues" ]) v);
      (match x.is_modifiable with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsModifiable" ]) v);
      (match x.minimum_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MinimumEngineVersion" ]) v);
      (match x.apply_method with
      | None -> []
      | Some v -> apply_method_to_query (List.append path [ "ApplyMethod" ]) v);
    ]

let parameters_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Parameter" parameter_to_query path xs

let reset_db_parameter_group_message_to_query path (x : reset_db_parameter_group_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBParameterGroupName" ]) x.db_parameter_group_name;
      (match x.reset_all_parameters with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ResetAllParameters" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
    ]

let db_cluster_parameter_group_name_message_to_query path
    (x : db_cluster_parameter_group_name_message) =
  List.concat
    [
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
    ]

let reset_db_cluster_parameter_group_message_to_query path
    (x : reset_db_cluster_parameter_group_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterParameterGroupName" ])
        x.db_cluster_parameter_group_name;
      (match x.reset_all_parameters with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ResetAllParameters" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
    ]

let key_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let remove_tags_from_resource_message_to_query path (x : remove_tags_from_resource_message) =
  List.concat
    [
      string__to_query (List.append path [ "ResourceName" ]) x.resource_name;
      key_list_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
    ]

let remove_source_identifier_from_subscription_result_to_query path
    (x : remove_source_identifier_from_subscription_result) =
  List.concat
    [
      (match x.event_subscription with
      | None -> []
      | Some v -> event_subscription_to_query (List.append path [ "EventSubscription" ]) v);
    ]

let remove_source_identifier_from_subscription_message_to_query path
    (x : remove_source_identifier_from_subscription_message) =
  List.concat
    [
      string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name;
      string__to_query (List.append path [ "SourceIdentifier" ]) x.source_identifier;
    ]

let db_cluster_role_not_found_fault_to_query path (x : db_cluster_role_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let remove_role_from_db_cluster_message_to_query path (x : remove_role_from_db_cluster_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      string__to_query (List.append path [ "RoleArn" ]) x.role_arn;
      (match x.feature_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FeatureName" ]) v);
    ]

let remove_from_global_cluster_result_to_query path (x : remove_from_global_cluster_result) =
  List.concat
    [
      (match x.global_cluster with
      | None -> []
      | Some v -> global_cluster_to_query (List.append path [ "GlobalCluster" ]) v);
    ]

let remove_from_global_cluster_message_to_query path (x : remove_from_global_cluster_message) =
  List.concat
    [
      global_cluster_identifier_to_query
        (List.append path [ "GlobalClusterIdentifier" ])
        x.global_cluster_identifier;
      string__to_query (List.append path [ "DbClusterIdentifier" ]) x.db_cluster_identifier;
    ]

let domain_membership_to_query path (x : domain_membership) =
  List.concat
    [
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.fqd_n with None -> [] | Some v -> string__to_query (List.append path [ "FQDN" ]) v);
      (match x.iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IAMRoleName" ]) v);
    ]

let domain_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DomainMembership" domain_membership_to_query
    path xs

let integer_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let db_instance_status_info_to_query path (x : db_instance_status_info) =
  List.concat
    [
      (match x.status_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StatusType" ]) v);
      (match x.normal with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Normal" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Message" ]) v);
    ]

let db_instance_status_info_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBInstanceStatusInfo"
    db_instance_status_info_to_query path xs

let option_group_membership_to_query path (x : option_group_membership) =
  List.concat
    [
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
    ]

let option_group_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OptionGroupMembership"
    option_group_membership_to_query path xs

let read_replica_db_cluster_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReadReplicaDBClusterIdentifier"
    string__to_query path xs

let read_replica_db_instance_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReadReplicaDBInstanceIdentifier"
    string__to_query path xs

let pending_modified_values_to_query path (x : pending_modified_values) =
  List.concat
    [
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.pending_cloudwatch_logs_exports with
      | None -> []
      | Some v ->
          pending_cloudwatch_logs_exports_to_query
            (List.append path [ "PendingCloudwatchLogsExports" ])
            v);
    ]

let string_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let availability_zone_to_query path (x : availability_zone) =
  List.concat
    [
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
    ]

let subnet_to_query path (x : subnet) =
  List.concat
    [
      (match x.subnet_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetIdentifier" ]) v);
      (match x.subnet_availability_zone with
      | None -> []
      | Some v -> availability_zone_to_query (List.append path [ "SubnetAvailabilityZone" ]) v);
      (match x.subnet_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetStatus" ]) v);
    ]

let subnet_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Subnet" subnet_to_query path xs

let db_subnet_group_to_query path (x : db_subnet_group) =
  List.concat
    [
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.db_subnet_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupDescription" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.subnet_group_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetGroupStatus" ]) v);
      (match x.subnets with
      | None -> []
      | Some v -> subnet_list_to_query (List.append path [ "Subnets" ]) v);
      (match x.db_subnet_group_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupArn" ]) v);
      (match x.supported_network_types with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "SupportedNetworkTypes" ]) v);
    ]

let db_parameter_group_status_to_query path (x : db_parameter_group_status) =
  List.concat
    [
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
      (match x.parameter_apply_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterApplyStatus" ]) v);
    ]

let db_parameter_group_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBParameterGroup"
    db_parameter_group_status_to_query path xs

let db_security_group_membership_to_query path (x : db_security_group_membership) =
  List.concat
    [
      (match x.db_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSecurityGroupName" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
    ]

let db_security_group_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBSecurityGroup"
    db_security_group_membership_to_query path xs

let endpoint_to_query path (x : endpoint) =
  List.concat
    [
      (match x.address with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Address" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.hosted_zone_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HostedZoneId" ]) v);
    ]

let db_instance_to_query path (x : db_instance) =
  List.concat
    [
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.db_instance_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceStatus" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBName" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "Endpoint" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.instance_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "InstanceCreateTime" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.db_security_groups with
      | None -> []
      | Some v ->
          db_security_group_membership_list_to_query (List.append path [ "DBSecurityGroups" ]) v);
      (match x.vpc_security_groups with
      | None -> []
      | Some v ->
          vpc_security_group_membership_list_to_query (List.append path [ "VpcSecurityGroups" ]) v);
      (match x.db_parameter_groups with
      | None -> []
      | Some v ->
          db_parameter_group_status_list_to_query (List.append path [ "DBParameterGroups" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.db_subnet_group with
      | None -> []
      | Some v -> db_subnet_group_to_query (List.append path [ "DBSubnetGroup" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.pending_modified_values with
      | None -> []
      | Some v -> pending_modified_values_to_query (List.append path [ "PendingModifiedValues" ]) v);
      (match x.latest_restorable_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "LatestRestorableTime" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "MultiAZ" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.read_replica_source_db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReadReplicaSourceDBInstanceIdentifier" ]) v);
      (match x.read_replica_db_instance_identifiers with
      | None -> []
      | Some v ->
          read_replica_db_instance_identifier_list_to_query
            (List.append path [ "ReadReplicaDBInstanceIdentifiers" ])
            v);
      (match x.read_replica_db_cluster_identifiers with
      | None -> []
      | Some v ->
          read_replica_db_cluster_identifier_list_to_query
            (List.append path [ "ReadReplicaDBClusterIdentifiers" ])
            v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.option_group_memberships with
      | None -> []
      | Some v ->
          option_group_membership_list_to_query (List.append path [ "OptionGroupMemberships" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.secondary_availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SecondaryAvailabilityZone" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.status_infos with
      | None -> []
      | Some v -> db_instance_status_info_list_to_query (List.append path [ "StatusInfos" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.tde_credential_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TdeCredentialArn" ]) v);
      (match x.db_instance_port with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "DbInstancePort" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.dbi_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbiResourceId" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.domain_memberships with
      | None -> []
      | Some v -> domain_membership_list_to_query (List.append path [ "DomainMemberships" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.enhanced_monitoring_resource_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EnhancedMonitoringResourceArn" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.promotion_tier with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PromotionTier" ]) v);
      (match x.db_instance_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceArn" ]) v);
      (match x.timezone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Timezone" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
      (match x.performance_insights_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PerformanceInsightsEnabled" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enabled_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnabledCloudwatchLogsExports" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
    ]

let reboot_db_instance_result_to_query path (x : reboot_db_instance_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let reboot_db_instance_message_to_query path (x : reboot_db_instance_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
      (match x.force_failover with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ForceFailover" ]) v);
    ]

let promote_read_replica_db_cluster_result_to_query path
    (x : promote_read_replica_db_cluster_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let promote_read_replica_db_cluster_message_to_query path
    (x : promote_read_replica_db_cluster_message) =
  List.concat
    [ string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier ]

let global_cluster_already_exists_fault_to_query path (x : global_cluster_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_global_cluster_result_to_query path (x : modify_global_cluster_result) =
  List.concat
    [
      (match x.global_cluster with
      | None -> []
      | Some v -> global_cluster_to_query (List.append path [ "GlobalCluster" ]) v);
    ]

let modify_global_cluster_message_to_query path (x : modify_global_cluster_message) =
  List.concat
    [
      global_cluster_identifier_to_query
        (List.append path [ "GlobalClusterIdentifier" ])
        x.global_cluster_identifier;
      (match x.new_global_cluster_identifier with
      | None -> []
      | Some v ->
          global_cluster_identifier_to_query (List.append path [ "NewGlobalClusterIdentifier" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.allow_major_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AllowMajorVersionUpgrade" ]) v);
    ]

let subscription_category_not_found_fault_to_query path (x : subscription_category_not_found_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let sns_topic_arn_not_found_fault_to_query path (x : sns_topic_arn_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let sns_no_authorization_fault_to_query path (x : sns_no_authorization_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let sns_invalid_topic_fault_to_query path (x : sns_invalid_topic_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let event_subscription_quota_exceeded_fault_to_query path
    (x : event_subscription_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_event_subscription_result_to_query path (x : modify_event_subscription_result) =
  List.concat
    [
      (match x.event_subscription with
      | None -> []
      | Some v -> event_subscription_to_query (List.append path [ "EventSubscription" ]) v);
    ]

let modify_event_subscription_message_to_query path (x : modify_event_subscription_message) =
  List.concat
    [
      string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name;
      (match x.sns_topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnsTopicArn" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
      (match x.enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Enabled" ]) v);
    ]

let subnet_already_in_use_to_query path (x : subnet_already_in_use) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_subnet_quota_exceeded_fault_to_query path (x : db_subnet_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_subnet_group_does_not_cover_enough_a_zs_to_query path
    (x : db_subnet_group_does_not_cover_enough_a_zs) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_db_subnet_group_result_to_query path (x : modify_db_subnet_group_result) =
  List.concat
    [
      (match x.db_subnet_group with
      | None -> []
      | Some v -> db_subnet_group_to_query (List.append path [ "DBSubnetGroup" ]) v);
    ]

let subnet_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SubnetIdentifier" string__to_query path xs

let modify_db_subnet_group_message_to_query path (x : modify_db_subnet_group_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBSubnetGroupName" ]) x.db_subnet_group_name;
      (match x.db_subnet_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupDescription" ]) v);
      subnet_identifier_list_to_query (List.append path [ "SubnetIds" ]) x.subnet_ids;
    ]

let modify_db_parameter_group_message_to_query path (x : modify_db_parameter_group_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBParameterGroupName" ]) x.db_parameter_group_name;
      parameters_list_to_query (List.append path [ "Parameters" ]) x.parameters;
    ]

let storage_type_not_supported_fault_to_query path (x : storage_type_not_supported_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let provisioned_iops_not_available_in_az_fault_to_query path
    (x : provisioned_iops_not_available_in_az_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_db_security_group_state_fault_to_query path (x : invalid_db_security_group_state_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let insufficient_db_instance_capacity_fault_to_query path
    (x : insufficient_db_instance_capacity_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let domain_not_found_fault_to_query path (x : domain_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_upgrade_dependency_failure_fault_to_query path (x : db_upgrade_dependency_failure_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_security_group_not_found_fault_to_query path (x : db_security_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_instance_already_exists_fault_to_query path (x : db_instance_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let certificate_not_found_fault_to_query path (x : certificate_not_found_fault) =
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

let modify_db_instance_result_to_query path (x : modify_db_instance_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let cloudwatch_logs_export_configuration_to_query path (x : cloudwatch_logs_export_configuration) =
  List.concat
    [
      (match x.enable_log_types with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableLogTypes" ]) v);
      (match x.disable_log_types with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "DisableLogTypes" ]) v);
    ]

let sensitive_string_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let db_security_group_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBSecurityGroupName" string__to_query path
    xs

let modify_db_instance_message_to_query path (x : modify_db_instance_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.db_security_groups with
      | None -> []
      | Some v -> db_security_group_name_list_to_query (List.append path [ "DBSecurityGroups" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.apply_immediately with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ApplyImmediately" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.allow_major_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AllowMajorVersionUpgrade" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.new_db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NewDBInstanceIdentifier" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.tde_credential_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TdeCredentialArn" ]) v);
      (match x.tde_credential_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "TdeCredentialPassword" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.db_port_number with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "DBPortNumber" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.promotion_tier with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PromotionTier" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.cloudwatch_logs_export_configuration with
      | None -> []
      | Some v ->
          cloudwatch_logs_export_configuration_to_query
            (List.append path [ "CloudwatchLogsExportConfiguration" ])
            v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
    ]

let shared_snapshot_quota_exceeded_fault_to_query path (x : shared_snapshot_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let attribute_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AttributeValue" string__to_query path xs

let db_cluster_snapshot_attribute_to_query path (x : db_cluster_snapshot_attribute) =
  List.concat
    [
      (match x.attribute_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AttributeName" ]) v);
      (match x.attribute_values with
      | None -> []
      | Some v -> attribute_value_list_to_query (List.append path [ "AttributeValues" ]) v);
    ]

let db_cluster_snapshot_attribute_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterSnapshotAttribute"
    db_cluster_snapshot_attribute_to_query path xs

let db_cluster_snapshot_attributes_result_to_query path (x : db_cluster_snapshot_attributes_result)
    =
  List.concat
    [
      (match x.db_cluster_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterSnapshotIdentifier" ]) v);
      (match x.db_cluster_snapshot_attributes with
      | None -> []
      | Some v ->
          db_cluster_snapshot_attribute_list_to_query
            (List.append path [ "DBClusterSnapshotAttributes" ])
            v);
    ]

let modify_db_cluster_snapshot_attribute_result_to_query path
    (x : modify_db_cluster_snapshot_attribute_result) =
  List.concat
    [
      (match x.db_cluster_snapshot_attributes_result with
      | None -> []
      | Some v ->
          db_cluster_snapshot_attributes_result_to_query
            (List.append path [ "DBClusterSnapshotAttributesResult" ])
            v);
    ]

let modify_db_cluster_snapshot_attribute_message_to_query path
    (x : modify_db_cluster_snapshot_attribute_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterSnapshotIdentifier" ])
        x.db_cluster_snapshot_identifier;
      string__to_query (List.append path [ "AttributeName" ]) x.attribute_name;
      (match x.values_to_add with
      | None -> []
      | Some v -> attribute_value_list_to_query (List.append path [ "ValuesToAdd" ]) v);
      (match x.values_to_remove with
      | None -> []
      | Some v -> attribute_value_list_to_query (List.append path [ "ValuesToRemove" ]) v);
    ]

let modify_db_cluster_parameter_group_message_to_query path
    (x : modify_db_cluster_parameter_group_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterParameterGroupName" ])
        x.db_cluster_parameter_group_name;
      parameters_list_to_query (List.append path [ "Parameters" ]) x.parameters;
    ]

let invalid_db_cluster_endpoint_state_fault_to_query path
    (x : invalid_db_cluster_endpoint_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_endpoint_not_found_fault_to_query path (x : db_cluster_endpoint_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_db_cluster_endpoint_output_to_query path (x : modify_db_cluster_endpoint_output) =
  List.concat
    [
      (match x.db_cluster_endpoint_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointIdentifier" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.db_cluster_endpoint_resource_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointResourceIdentifier" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointType" ]) v);
      (match x.custom_endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomEndpointType" ]) v);
      (match x.static_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "StaticMembers" ]) v);
      (match x.excluded_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ExcludedMembers" ]) v);
      (match x.db_cluster_endpoint_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointArn" ]) v);
    ]

let modify_db_cluster_endpoint_message_to_query path (x : modify_db_cluster_endpoint_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterEndpointIdentifier" ])
        x.db_cluster_endpoint_identifier;
      (match x.endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointType" ]) v);
      (match x.static_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "StaticMembers" ]) v);
      (match x.excluded_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ExcludedMembers" ]) v);
    ]

let invalid_db_subnet_group_state_fault_to_query path (x : invalid_db_subnet_group_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_db_cluster_result_to_query path (x : modify_db_cluster_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let modify_db_cluster_message_to_query path (x : modify_db_cluster_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      (match x.new_db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NewDBClusterIdentifier" ]) v);
      (match x.apply_immediately with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ApplyImmediately" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.cloudwatch_logs_export_configuration with
      | None -> []
      | Some v ->
          cloudwatch_logs_export_configuration_to_query
            (List.append path [ "CloudwatchLogsExportConfiguration" ])
            v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.allow_major_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AllowMajorVersionUpgrade" ]) v);
      (match x.db_instance_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceParameterGroupName" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
    ]

let tag_list_message_to_query path (x : tag_list_message) =
  List.concat
    [
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
    ]

let filter_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Value" string__to_query path xs

let filter_to_query path (x : filter) =
  List.concat
    [
      string__to_query (List.append path [ "Name" ]) x.name;
      filter_value_list_to_query (List.append path [ "Values" ]) x.values;
    ]

let filter_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Filter" filter_to_query path xs

let list_tags_for_resource_message_to_query path (x : list_tags_for_resource_message) =
  List.concat
    [
      string__to_query (List.append path [ "ResourceName" ]) x.resource_name;
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
    ]

let failover_global_cluster_result_to_query path (x : failover_global_cluster_result) =
  List.concat
    [
      (match x.global_cluster with
      | None -> []
      | Some v -> global_cluster_to_query (List.append path [ "GlobalCluster" ]) v);
    ]

let failover_global_cluster_message_to_query path (x : failover_global_cluster_message) =
  List.concat
    [
      global_cluster_identifier_to_query
        (List.append path [ "GlobalClusterIdentifier" ])
        x.global_cluster_identifier;
      string__to_query
        (List.append path [ "TargetDbClusterIdentifier" ])
        x.target_db_cluster_identifier;
      (match x.allow_data_loss with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AllowDataLoss" ]) v);
      (match x.switchover with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Switchover" ]) v);
    ]

let failover_db_cluster_result_to_query path (x : failover_db_cluster_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let failover_db_cluster_message_to_query path (x : failover_db_cluster_message) =
  List.concat
    [
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.target_db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetDBInstanceIdentifier" ]) v);
    ]

let double_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let double_range_to_query path (x : double_range) =
  List.concat
    [
      (match x.from_ with None -> [] | Some v -> double_to_query (List.append path [ "From" ]) v);
      (match x.to_ with None -> [] | Some v -> double_to_query (List.append path [ "To" ]) v);
    ]

let double_range_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DoubleRange" double_range_to_query path xs

let range_to_query path (x : range) =
  List.concat
    [
      (match x.from_ with None -> [] | Some v -> integer_to_query (List.append path [ "From" ]) v);
      (match x.to_ with None -> [] | Some v -> integer_to_query (List.append path [ "To" ]) v);
      (match x.step with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Step" ]) v);
    ]

let range_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Range" range_to_query path xs

let valid_storage_options_to_query path (x : valid_storage_options) =
  List.concat
    [
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.storage_size with
      | None -> []
      | Some v -> range_list_to_query (List.append path [ "StorageSize" ]) v);
      (match x.provisioned_iops with
      | None -> []
      | Some v -> range_list_to_query (List.append path [ "ProvisionedIops" ]) v);
      (match x.iops_to_storage_ratio with
      | None -> []
      | Some v -> double_range_list_to_query (List.append path [ "IopsToStorageRatio" ]) v);
    ]

let valid_storage_options_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ValidStorageOptions"
    valid_storage_options_to_query path xs

let valid_db_instance_modifications_message_to_query path
    (x : valid_db_instance_modifications_message) =
  List.concat
    [
      (match x.storage with
      | None -> []
      | Some v -> valid_storage_options_list_to_query (List.append path [ "Storage" ]) v);
    ]

let describe_valid_db_instance_modifications_result_to_query path
    (x : describe_valid_db_instance_modifications_result) =
  List.concat
    [
      (match x.valid_db_instance_modifications_message with
      | None -> []
      | Some v ->
          valid_db_instance_modifications_message_to_query
            (List.append path [ "ValidDBInstanceModificationsMessage" ])
            v);
    ]

let describe_valid_db_instance_modifications_message_to_query path
    (x : describe_valid_db_instance_modifications_message) =
  List.concat
    [ string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier ]

let resource_not_found_fault_to_query path (x : resource_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let pending_maintenance_action_to_query path (x : pending_maintenance_action) =
  List.concat
    [
      (match x.action with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Action" ]) v);
      (match x.auto_applied_after_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "AutoAppliedAfterDate" ]) v);
      (match x.forced_apply_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ForcedApplyDate" ]) v);
      (match x.opt_in_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptInStatus" ]) v);
      (match x.current_apply_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CurrentApplyDate" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
    ]

let pending_maintenance_action_details_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "PendingMaintenanceAction"
    pending_maintenance_action_to_query path xs

let resource_pending_maintenance_actions_to_query path (x : resource_pending_maintenance_actions) =
  List.concat
    [
      (match x.resource_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceIdentifier" ]) v);
      (match x.pending_maintenance_action_details with
      | None -> []
      | Some v ->
          pending_maintenance_action_details_to_query
            (List.append path [ "PendingMaintenanceActionDetails" ])
            v);
    ]

let pending_maintenance_actions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ResourcePendingMaintenanceActions"
    resource_pending_maintenance_actions_to_query path xs

let pending_maintenance_actions_message_to_query path (x : pending_maintenance_actions_message) =
  List.concat
    [
      (match x.pending_maintenance_actions with
      | None -> []
      | Some v ->
          pending_maintenance_actions_to_query (List.append path [ "PendingMaintenanceActions" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_pending_maintenance_actions_message_to_query path
    (x : describe_pending_maintenance_actions_message) =
  List.concat
    [
      (match x.resource_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceIdentifier" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
    ]

let availability_zone_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AvailabilityZone" availability_zone_to_query
    path xs

let orderable_db_instance_option_to_query path (x : orderable_db_instance_option) =
  List.concat
    [
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zone_list_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.multi_az_capable with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "MultiAZCapable" ]) v);
      (match x.read_replica_capable with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReadReplicaCapable" ]) v);
      (match x.vpc with None -> [] | Some v -> boolean__to_query (List.append path [ "Vpc" ]) v);
      (match x.supports_storage_encryption with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsStorageEncryption" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.supports_iops with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsIops" ]) v);
      (match x.supports_enhanced_monitoring with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsEnhancedMonitoring" ]) v);
      (match x.supports_iam_database_authentication with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsIAMDatabaseAuthentication" ]) v);
      (match x.supports_performance_insights with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsPerformanceInsights" ]) v);
      (match x.min_storage_size with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MinStorageSize" ]) v);
      (match x.max_storage_size with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxStorageSize" ]) v);
      (match x.min_iops_per_db_instance with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MinIopsPerDbInstance" ]) v);
      (match x.max_iops_per_db_instance with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxIopsPerDbInstance" ]) v);
      (match x.min_iops_per_gib with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinIopsPerGib" ]) v);
      (match x.max_iops_per_gib with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxIopsPerGib" ]) v);
      (match x.supports_global_databases with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsGlobalDatabases" ]) v);
      (match x.supported_network_types with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "SupportedNetworkTypes" ]) v);
    ]

let orderable_db_instance_options_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OrderableDBInstanceOption"
    orderable_db_instance_option_to_query path xs

let orderable_db_instance_options_message_to_query path (x : orderable_db_instance_options_message)
    =
  List.concat
    [
      (match x.orderable_db_instance_options with
      | None -> []
      | Some v ->
          orderable_db_instance_options_list_to_query
            (List.append path [ "OrderableDBInstanceOptions" ])
            v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_orderable_db_instance_options_message_to_query path
    (x : describe_orderable_db_instance_options_message) =
  List.concat
    [
      string__to_query (List.append path [ "Engine" ]) x.engine;
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.vpc with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Vpc" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let global_cluster_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "GlobalClusterMember" global_cluster_to_query
    path xs

let global_clusters_message_to_query path (x : global_clusters_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.global_clusters with
      | None -> []
      | Some v -> global_cluster_list_to_query (List.append path [ "GlobalClusters" ]) v);
    ]

let describe_global_clusters_message_to_query path (x : describe_global_clusters_message) =
  List.concat
    [
      (match x.global_cluster_identifier with
      | None -> []
      | Some v ->
          global_cluster_identifier_to_query (List.append path [ "GlobalClusterIdentifier" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let event_subscriptions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "EventSubscription"
    event_subscription_to_query path xs

let event_subscriptions_message_to_query path (x : event_subscriptions_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.event_subscriptions_list with
      | None -> []
      | Some v ->
          event_subscriptions_list_to_query (List.append path [ "EventSubscriptionsList" ]) v);
    ]

let describe_event_subscriptions_message_to_query path (x : describe_event_subscriptions_message) =
  List.concat
    [
      (match x.subscription_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubscriptionName" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let source_type_to_query path (x : source_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Db_instance -> "db-instance"
    | Db_parameter_group -> "db-parameter-group"
    | Db_security_group -> "db-security-group"
    | Db_snapshot -> "db-snapshot"
    | Db_cluster -> "db-cluster"
    | Db_cluster_snapshot -> "db-cluster-snapshot")

let event_to_query path (x : event) =
  List.concat
    [
      (match x.source_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceIdentifier" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> source_type_to_query (List.append path [ "SourceType" ]) v);
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Message" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
      (match x.date with None -> [] | Some v -> t_stamp_to_query (List.append path [ "Date" ]) v);
      (match x.source_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceArn" ]) v);
    ]

let event_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Event" event_to_query path xs

let events_message_to_query path (x : events_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.events with
      | None -> []
      | Some v -> event_list_to_query (List.append path [ "Events" ]) v);
    ]

let describe_events_message_to_query path (x : describe_events_message) =
  List.concat
    [
      (match x.source_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceIdentifier" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> source_type_to_query (List.append path [ "SourceType" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Duration" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let event_categories_map_to_query path (x : event_categories_map) =
  List.concat
    [
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
    ]

let event_categories_map_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "EventCategoriesMap"
    event_categories_map_to_query path xs

let event_categories_message_to_query path (x : event_categories_message) =
  List.concat
    [
      (match x.event_categories_map_list with
      | None -> []
      | Some v ->
          event_categories_map_list_to_query (List.append path [ "EventCategoriesMapList" ]) v);
    ]

let describe_event_categories_message_to_query path (x : describe_event_categories_message) =
  List.concat
    [
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
    ]

let engine_defaults_to_query path (x : engine_defaults) =
  List.concat
    [
      (match x.db_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupFamily" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
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
      string__to_query (List.append path [ "DBParameterGroupFamily" ]) x.db_parameter_group_family;
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_engine_default_cluster_parameters_result_to_query path
    (x : describe_engine_default_cluster_parameters_result) =
  List.concat
    [
      (match x.engine_defaults with
      | None -> []
      | Some v -> engine_defaults_to_query (List.append path [ "EngineDefaults" ]) v);
    ]

let describe_engine_default_cluster_parameters_message_to_query path
    (x : describe_engine_default_cluster_parameters_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBParameterGroupFamily" ]) x.db_parameter_group_family;
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let db_subnet_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBSubnetGroup" db_subnet_group_to_query path
    xs

let db_subnet_group_message_to_query path (x : db_subnet_group_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_subnet_groups with
      | None -> []
      | Some v -> db_subnet_groups_to_query (List.append path [ "DBSubnetGroups" ]) v);
    ]

let describe_db_subnet_groups_message_to_query path (x : describe_db_subnet_groups_message) =
  List.concat
    [
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let db_parameter_group_details_to_query path (x : db_parameter_group_details) =
  List.concat
    [
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_parameters_message_to_query path (x : describe_db_parameters_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBParameterGroupName" ]) x.db_parameter_group_name;
      (match x.source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Source" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let db_parameter_group_to_query path (x : db_parameter_group) =
  List.concat
    [
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
      (match x.db_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupFamily" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.db_parameter_group_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupArn" ]) v);
    ]

let db_parameter_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBParameterGroup"
    db_parameter_group_to_query path xs

let db_parameter_groups_message_to_query path (x : db_parameter_groups_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_parameter_groups with
      | None -> []
      | Some v -> db_parameter_group_list_to_query (List.append path [ "DBParameterGroups" ]) v);
    ]

let describe_db_parameter_groups_message_to_query path (x : describe_db_parameter_groups_message) =
  List.concat
    [
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let db_instance_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBInstance" db_instance_to_query path xs

let db_instance_message_to_query path (x : db_instance_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_instances with
      | None -> []
      | Some v -> db_instance_list_to_query (List.append path [ "DBInstances" ]) v);
    ]

let describe_db_instances_message_to_query path (x : describe_db_instances_message) =
  List.concat
    [
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let timezone_to_query path (x : timezone) =
  List.concat
    [
      (match x.timezone_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TimezoneName" ]) v);
    ]

let supported_timezones_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Timezone" timezone_to_query path xs

let upgrade_target_to_query path (x : upgrade_target) =
  List.concat
    [
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.auto_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AutoUpgrade" ]) v);
      (match x.is_major_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsMajorVersionUpgrade" ]) v);
      (match x.supports_global_databases with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "SupportsGlobalDatabases" ]) v);
    ]

let valid_upgrade_target_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "UpgradeTarget" upgrade_target_to_query path
    xs

let character_set_to_query path (x : character_set) =
  List.concat
    [
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.character_set_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetDescription" ]) v);
    ]

let supported_character_sets_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CharacterSet" character_set_to_query path xs

let db_engine_version_to_query path (x : db_engine_version) =
  List.concat
    [
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.db_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupFamily" ]) v);
      (match x.db_engine_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBEngineDescription" ]) v);
      (match x.db_engine_version_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBEngineVersionDescription" ]) v);
      (match x.default_character_set with
      | None -> []
      | Some v -> character_set_to_query (List.append path [ "DefaultCharacterSet" ]) v);
      (match x.supported_character_sets with
      | None -> []
      | Some v ->
          supported_character_sets_list_to_query (List.append path [ "SupportedCharacterSets" ]) v);
      (match x.valid_upgrade_target with
      | None -> []
      | Some v -> valid_upgrade_target_list_to_query (List.append path [ "ValidUpgradeTarget" ]) v);
      (match x.supported_timezones with
      | None -> []
      | Some v -> supported_timezones_list_to_query (List.append path [ "SupportedTimezones" ]) v);
      (match x.exportable_log_types with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "ExportableLogTypes" ]) v);
      (match x.supports_log_exports_to_cloudwatch_logs with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsLogExportsToCloudwatchLogs" ]) v);
      (match x.supports_read_replica with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsReadReplica" ]) v);
      (match x.supports_global_databases with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsGlobalDatabases" ]) v);
    ]

let db_engine_version_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBEngineVersion" db_engine_version_to_query
    path xs

let db_engine_version_message_to_query path (x : db_engine_version_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_engine_versions with
      | None -> []
      | Some v -> db_engine_version_list_to_query (List.append path [ "DBEngineVersions" ]) v);
    ]

let describe_db_engine_versions_message_to_query path (x : describe_db_engine_versions_message) =
  List.concat
    [
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.db_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupFamily" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.default_only with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "DefaultOnly" ]) v);
      (match x.list_supported_character_sets with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ListSupportedCharacterSets" ]) v);
      (match x.list_supported_timezones with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ListSupportedTimezones" ]) v);
    ]

let db_cluster_snapshot_to_query path (x : db_cluster_snapshot) =
  List.concat
    [
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.db_cluster_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterSnapshotIdentifier" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.snapshot_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "SnapshotCreateTime" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.cluster_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ClusterCreateTime" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.snapshot_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotType" ]) v);
      (match x.percent_progress with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "PercentProgress" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.db_cluster_snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterSnapshotArn" ]) v);
      (match x.source_db_cluster_snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDBClusterSnapshotArn" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
    ]

let db_cluster_snapshot_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterSnapshot"
    db_cluster_snapshot_to_query path xs

let db_cluster_snapshot_message_to_query path (x : db_cluster_snapshot_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_cluster_snapshots with
      | None -> []
      | Some v -> db_cluster_snapshot_list_to_query (List.append path [ "DBClusterSnapshots" ]) v);
    ]

let describe_db_cluster_snapshots_message_to_query path (x : describe_db_cluster_snapshots_message)
    =
  List.concat
    [
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.db_cluster_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterSnapshotIdentifier" ]) v);
      (match x.snapshot_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotType" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.include_shared with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IncludeShared" ]) v);
      (match x.include_public with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IncludePublic" ]) v);
    ]

let describe_db_cluster_snapshot_attributes_result_to_query path
    (x : describe_db_cluster_snapshot_attributes_result) =
  List.concat
    [
      (match x.db_cluster_snapshot_attributes_result with
      | None -> []
      | Some v ->
          db_cluster_snapshot_attributes_result_to_query
            (List.append path [ "DBClusterSnapshotAttributesResult" ])
            v);
    ]

let describe_db_cluster_snapshot_attributes_message_to_query path
    (x : describe_db_cluster_snapshot_attributes_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterSnapshotIdentifier" ])
        x.db_cluster_snapshot_identifier;
    ]

let db_cluster_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBCluster" db_cluster_to_query path xs

let db_cluster_message_to_query path (x : db_cluster_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_clusters with
      | None -> []
      | Some v -> db_cluster_list_to_query (List.append path [ "DBClusters" ]) v);
    ]

let describe_db_clusters_message_to_query path (x : describe_db_clusters_message) =
  List.concat
    [
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let db_cluster_parameter_group_details_to_query path (x : db_cluster_parameter_group_details) =
  List.concat
    [
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_cluster_parameters_message_to_query path
    (x : describe_db_cluster_parameters_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterParameterGroupName" ])
        x.db_cluster_parameter_group_name;
      (match x.source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Source" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let db_cluster_parameter_group_to_query path (x : db_cluster_parameter_group) =
  List.concat
    [
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
      (match x.db_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupFamily" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.db_cluster_parameter_group_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupArn" ]) v);
    ]

let db_cluster_parameter_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterParameterGroup"
    db_cluster_parameter_group_to_query path xs

let db_cluster_parameter_groups_message_to_query path (x : db_cluster_parameter_groups_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_cluster_parameter_groups with
      | None -> []
      | Some v ->
          db_cluster_parameter_group_list_to_query
            (List.append path [ "DBClusterParameterGroups" ])
            v);
    ]

let describe_db_cluster_parameter_groups_message_to_query path
    (x : describe_db_cluster_parameter_groups_message) =
  List.concat
    [
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let db_cluster_endpoint_to_query path (x : db_cluster_endpoint) =
  List.concat
    [
      (match x.db_cluster_endpoint_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointIdentifier" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.db_cluster_endpoint_resource_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointResourceIdentifier" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointType" ]) v);
      (match x.custom_endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomEndpointType" ]) v);
      (match x.static_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "StaticMembers" ]) v);
      (match x.excluded_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ExcludedMembers" ]) v);
      (match x.db_cluster_endpoint_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointArn" ]) v);
    ]

let db_cluster_endpoint_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterEndpointList"
    db_cluster_endpoint_to_query path xs

let db_cluster_endpoint_message_to_query path (x : db_cluster_endpoint_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_cluster_endpoints with
      | None -> []
      | Some v -> db_cluster_endpoint_list_to_query (List.append path [ "DBClusterEndpoints" ]) v);
    ]

let describe_db_cluster_endpoints_message_to_query path (x : describe_db_cluster_endpoints_message)
    =
  List.concat
    [
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.db_cluster_endpoint_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointIdentifier" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let delete_global_cluster_result_to_query path (x : delete_global_cluster_result) =
  List.concat
    [
      (match x.global_cluster with
      | None -> []
      | Some v -> global_cluster_to_query (List.append path [ "GlobalCluster" ]) v);
    ]

let delete_global_cluster_message_to_query path (x : delete_global_cluster_message) =
  List.concat
    [
      global_cluster_identifier_to_query
        (List.append path [ "GlobalClusterIdentifier" ])
        x.global_cluster_identifier;
    ]

let invalid_event_subscription_state_fault_to_query path
    (x : invalid_event_subscription_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_event_subscription_result_to_query path (x : delete_event_subscription_result) =
  List.concat
    [
      (match x.event_subscription with
      | None -> []
      | Some v -> event_subscription_to_query (List.append path [ "EventSubscription" ]) v);
    ]

let delete_event_subscription_message_to_query path (x : delete_event_subscription_message) =
  List.concat [ string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name ]

let invalid_db_subnet_state_fault_to_query path (x : invalid_db_subnet_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_db_subnet_group_message_to_query path (x : delete_db_subnet_group_message) =
  List.concat [ string__to_query (List.append path [ "DBSubnetGroupName" ]) x.db_subnet_group_name ]

let delete_db_parameter_group_message_to_query path (x : delete_db_parameter_group_message) =
  List.concat
    [ string__to_query (List.append path [ "DBParameterGroupName" ]) x.db_parameter_group_name ]

let snapshot_quota_exceeded_fault_to_query path (x : snapshot_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_snapshot_already_exists_fault_to_query path (x : db_snapshot_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_db_instance_result_to_query path (x : delete_db_instance_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let delete_db_instance_message_to_query path (x : delete_db_instance_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
      (match x.skip_final_snapshot with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SkipFinalSnapshot" ]) v);
      (match x.final_db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FinalDBSnapshotIdentifier" ]) v);
    ]

let delete_db_cluster_snapshot_result_to_query path (x : delete_db_cluster_snapshot_result) =
  List.concat
    [
      (match x.db_cluster_snapshot with
      | None -> []
      | Some v -> db_cluster_snapshot_to_query (List.append path [ "DBClusterSnapshot" ]) v);
    ]

let delete_db_cluster_snapshot_message_to_query path (x : delete_db_cluster_snapshot_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterSnapshotIdentifier" ])
        x.db_cluster_snapshot_identifier;
    ]

let delete_db_cluster_parameter_group_message_to_query path
    (x : delete_db_cluster_parameter_group_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterParameterGroupName" ])
        x.db_cluster_parameter_group_name;
    ]

let delete_db_cluster_endpoint_output_to_query path (x : delete_db_cluster_endpoint_output) =
  List.concat
    [
      (match x.db_cluster_endpoint_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointIdentifier" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.db_cluster_endpoint_resource_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointResourceIdentifier" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointType" ]) v);
      (match x.custom_endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomEndpointType" ]) v);
      (match x.static_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "StaticMembers" ]) v);
      (match x.excluded_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ExcludedMembers" ]) v);
      (match x.db_cluster_endpoint_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointArn" ]) v);
    ]

let delete_db_cluster_endpoint_message_to_query path (x : delete_db_cluster_endpoint_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterEndpointIdentifier" ])
        x.db_cluster_endpoint_identifier;
    ]

let db_cluster_snapshot_already_exists_fault_to_query path
    (x : db_cluster_snapshot_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_db_cluster_result_to_query path (x : delete_db_cluster_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let delete_db_cluster_message_to_query path (x : delete_db_cluster_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      (match x.skip_final_snapshot with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SkipFinalSnapshot" ]) v);
      (match x.final_db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FinalDBSnapshotIdentifier" ]) v);
    ]

let global_cluster_quota_exceeded_fault_to_query path (x : global_cluster_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_global_cluster_result_to_query path (x : create_global_cluster_result) =
  List.concat
    [
      (match x.global_cluster with
      | None -> []
      | Some v -> global_cluster_to_query (List.append path [ "GlobalCluster" ]) v);
    ]

let create_global_cluster_message_to_query path (x : create_global_cluster_message) =
  List.concat
    [
      global_cluster_identifier_to_query
        (List.append path [ "GlobalClusterIdentifier" ])
        x.global_cluster_identifier;
      (match x.source_db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDBClusterIdentifier" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
    ]

let subscription_already_exist_fault_to_query path (x : subscription_already_exist_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_event_subscription_result_to_query path (x : create_event_subscription_result) =
  List.concat
    [
      (match x.event_subscription with
      | None -> []
      | Some v -> event_subscription_to_query (List.append path [ "EventSubscription" ]) v);
    ]

let create_event_subscription_message_to_query path (x : create_event_subscription_message) =
  List.concat
    [
      string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name;
      string__to_query (List.append path [ "SnsTopicArn" ]) x.sns_topic_arn;
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
      (match x.source_ids with
      | None -> []
      | Some v -> source_ids_list_to_query (List.append path [ "SourceIds" ]) v);
      (match x.enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Enabled" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let db_subnet_group_quota_exceeded_fault_to_query path (x : db_subnet_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_subnet_group_already_exists_fault_to_query path (x : db_subnet_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_db_subnet_group_result_to_query path (x : create_db_subnet_group_result) =
  List.concat
    [
      (match x.db_subnet_group with
      | None -> []
      | Some v -> db_subnet_group_to_query (List.append path [ "DBSubnetGroup" ]) v);
    ]

let create_db_subnet_group_message_to_query path (x : create_db_subnet_group_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBSubnetGroupName" ]) x.db_subnet_group_name;
      string__to_query
        (List.append path [ "DBSubnetGroupDescription" ])
        x.db_subnet_group_description;
      subnet_identifier_list_to_query (List.append path [ "SubnetIds" ]) x.subnet_ids;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let db_parameter_group_quota_exceeded_fault_to_query path
    (x : db_parameter_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_parameter_group_already_exists_fault_to_query path
    (x : db_parameter_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_db_parameter_group_result_to_query path (x : create_db_parameter_group_result) =
  List.concat
    [
      (match x.db_parameter_group with
      | None -> []
      | Some v -> db_parameter_group_to_query (List.append path [ "DBParameterGroup" ]) v);
    ]

let create_db_parameter_group_message_to_query path (x : create_db_parameter_group_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBParameterGroupName" ]) x.db_parameter_group_name;
      string__to_query (List.append path [ "DBParameterGroupFamily" ]) x.db_parameter_group_family;
      string__to_query (List.append path [ "Description" ]) x.description;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let instance_quota_exceeded_fault_to_query path (x : instance_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_db_instance_result_to_query path (x : create_db_instance_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let create_db_instance_message_to_query path (x : create_db_instance_message) =
  List.concat
    [
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBName" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      string__to_query (List.append path [ "DBInstanceClass" ]) x.db_instance_class;
      string__to_query (List.append path [ "Engine" ]) x.engine;
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.db_security_groups with
      | None -> []
      | Some v -> db_security_group_name_list_to_query (List.append path [ "DBSecurityGroups" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.tde_credential_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TdeCredentialArn" ]) v);
      (match x.tde_credential_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "TdeCredentialPassword" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.promotion_tier with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PromotionTier" ]) v);
      (match x.timezone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Timezone" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
    ]

let create_db_cluster_snapshot_result_to_query path (x : create_db_cluster_snapshot_result) =
  List.concat
    [
      (match x.db_cluster_snapshot with
      | None -> []
      | Some v -> db_cluster_snapshot_to_query (List.append path [ "DBClusterSnapshot" ]) v);
    ]

let create_db_cluster_snapshot_message_to_query path (x : create_db_cluster_snapshot_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterSnapshotIdentifier" ])
        x.db_cluster_snapshot_identifier;
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let create_db_cluster_parameter_group_result_to_query path
    (x : create_db_cluster_parameter_group_result) =
  List.concat
    [
      (match x.db_cluster_parameter_group with
      | None -> []
      | Some v ->
          db_cluster_parameter_group_to_query (List.append path [ "DBClusterParameterGroup" ]) v);
    ]

let create_db_cluster_parameter_group_message_to_query path
    (x : create_db_cluster_parameter_group_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterParameterGroupName" ])
        x.db_cluster_parameter_group_name;
      string__to_query (List.append path [ "DBParameterGroupFamily" ]) x.db_parameter_group_family;
      string__to_query (List.append path [ "Description" ]) x.description;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let db_cluster_endpoint_quota_exceeded_fault_to_query path
    (x : db_cluster_endpoint_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_endpoint_already_exists_fault_to_query path
    (x : db_cluster_endpoint_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_db_cluster_endpoint_output_to_query path (x : create_db_cluster_endpoint_output) =
  List.concat
    [
      (match x.db_cluster_endpoint_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointIdentifier" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.db_cluster_endpoint_resource_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointResourceIdentifier" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointType" ]) v);
      (match x.custom_endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomEndpointType" ]) v);
      (match x.static_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "StaticMembers" ]) v);
      (match x.excluded_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ExcludedMembers" ]) v);
      (match x.db_cluster_endpoint_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointArn" ]) v);
    ]

let create_db_cluster_endpoint_message_to_query path (x : create_db_cluster_endpoint_message) =
  List.concat
    [
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      string__to_query
        (List.append path [ "DBClusterEndpointIdentifier" ])
        x.db_cluster_endpoint_identifier;
      string__to_query (List.append path [ "EndpointType" ]) x.endpoint_type;
      (match x.static_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "StaticMembers" ]) v);
      (match x.excluded_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ExcludedMembers" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let create_db_cluster_result_to_query path (x : create_db_cluster_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let create_db_cluster_message_to_query path (x : create_db_cluster_message) =
  List.concat
    [
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      string__to_query (List.append path [ "Engine" ]) x.engine;
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.replication_source_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationSourceIdentifier" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.pre_signed_url with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreSignedUrl" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.global_cluster_identifier with
      | None -> []
      | Some v ->
          global_cluster_identifier_to_query (List.append path [ "GlobalClusterIdentifier" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
    ]

let copy_db_parameter_group_result_to_query path (x : copy_db_parameter_group_result) =
  List.concat
    [
      (match x.db_parameter_group with
      | None -> []
      | Some v -> db_parameter_group_to_query (List.append path [ "DBParameterGroup" ]) v);
    ]

let copy_db_parameter_group_message_to_query path (x : copy_db_parameter_group_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "SourceDBParameterGroupIdentifier" ])
        x.source_db_parameter_group_identifier;
      string__to_query
        (List.append path [ "TargetDBParameterGroupIdentifier" ])
        x.target_db_parameter_group_identifier;
      string__to_query
        (List.append path [ "TargetDBParameterGroupDescription" ])
        x.target_db_parameter_group_description;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let copy_db_cluster_snapshot_result_to_query path (x : copy_db_cluster_snapshot_result) =
  List.concat
    [
      (match x.db_cluster_snapshot with
      | None -> []
      | Some v -> db_cluster_snapshot_to_query (List.append path [ "DBClusterSnapshot" ]) v);
    ]

let copy_db_cluster_snapshot_message_to_query path (x : copy_db_cluster_snapshot_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "SourceDBClusterSnapshotIdentifier" ])
        x.source_db_cluster_snapshot_identifier;
      string__to_query
        (List.append path [ "TargetDBClusterSnapshotIdentifier" ])
        x.target_db_cluster_snapshot_identifier;
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.pre_signed_url with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreSignedUrl" ]) v);
      (match x.copy_tags with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTags" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let copy_db_cluster_parameter_group_result_to_query path
    (x : copy_db_cluster_parameter_group_result) =
  List.concat
    [
      (match x.db_cluster_parameter_group with
      | None -> []
      | Some v ->
          db_cluster_parameter_group_to_query (List.append path [ "DBClusterParameterGroup" ]) v);
    ]

let copy_db_cluster_parameter_group_message_to_query path
    (x : copy_db_cluster_parameter_group_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "SourceDBClusterParameterGroupIdentifier" ])
        x.source_db_cluster_parameter_group_identifier;
      string__to_query
        (List.append path [ "TargetDBClusterParameterGroupIdentifier" ])
        x.target_db_cluster_parameter_group_identifier;
      string__to_query
        (List.append path [ "TargetDBClusterParameterGroupDescription" ])
        x.target_db_cluster_parameter_group_description;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let apply_pending_maintenance_action_result_to_query path
    (x : apply_pending_maintenance_action_result) =
  List.concat
    [
      (match x.resource_pending_maintenance_actions with
      | None -> []
      | Some v ->
          resource_pending_maintenance_actions_to_query
            (List.append path [ "ResourcePendingMaintenanceActions" ])
            v);
    ]

let apply_pending_maintenance_action_message_to_query path
    (x : apply_pending_maintenance_action_message) =
  List.concat
    [
      string__to_query (List.append path [ "ResourceIdentifier" ]) x.resource_identifier;
      string__to_query (List.append path [ "ApplyAction" ]) x.apply_action;
      string__to_query (List.append path [ "OptInType" ]) x.opt_in_type;
    ]
