open Types

let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let vpc_security_group_membership_to_query path (x : vpc_security_group_membership) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.vpc_security_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcSecurityGroupId" ]) v);
    ]

let vpc_security_group_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "VpcSecurityGroupMembership"
    vpc_security_group_membership_to_query path xs

let vpc_security_group_id_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "VpcSecurityGroupId" string__to_query path xs

let boolean__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let upgrade_target_to_query path (x : upgrade_target) =
  List.concat
    [
      (match x.is_major_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsMajorVersionUpgrade" ]) v);
      (match x.auto_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AutoUpgrade" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
    ]

let valid_upgrade_target_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "UpgradeTarget" upgrade_target_to_query path
    xs

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

let t_stamp_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let global_cluster_identifier_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let boolean_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let readers_arn_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let global_cluster_member_synchronization_status_to_query path
    (x : global_cluster_member_synchronization_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with PENDING_RESYNC -> "pending-resync" | CONNECTED -> "connected")

let global_cluster_member_to_query path (x : global_cluster_member) =
  List.concat
    [
      (match x.synchronization_status with
      | None -> []
      | Some v ->
          global_cluster_member_synchronization_status_to_query
            (List.append path [ "SynchronizationStatus" ])
            v);
      (match x.is_writer with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsWriter" ]) v);
      (match x.readers with
      | None -> []
      | Some v -> readers_arn_list_to_query (List.append path [ "Readers" ]) v);
      (match x.db_cluster_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterArn" ]) v);
    ]

let global_cluster_member_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "GlobalClusterMember"
    global_cluster_member_to_query path xs

let failover_status_to_query path (x : failover_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | CANCELLING -> "cancelling"
    | FAILING_OVER -> "failing-over"
    | PENDING -> "pending")

let failover_state_to_query path (x : failover_state) =
  List.concat
    [
      (match x.is_data_loss_allowed with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsDataLossAllowed" ]) v);
      (match x.to_db_cluster_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ToDbClusterArn" ]) v);
      (match x.from_db_cluster_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FromDbClusterArn" ]) v);
      (match x.status with
      | None -> []
      | Some v -> failover_status_to_query (List.append path [ "Status" ]) v);
    ]

let global_cluster_to_query path (x : global_cluster) =
  List.concat
    [
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.failover_state with
      | None -> []
      | Some v -> failover_state_to_query (List.append path [ "FailoverState" ]) v);
      (match x.global_cluster_members with
      | None -> []
      | Some v ->
          global_cluster_member_list_to_query (List.append path [ "GlobalClusterMembers" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.global_cluster_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalClusterArn" ]) v);
      (match x.global_cluster_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "GlobalClusterResourceId" ]) v);
      (match x.global_cluster_identifier with
      | None -> []
      | Some v ->
          global_cluster_identifier_to_query (List.append path [ "GlobalClusterIdentifier" ]) v);
    ]

let switchover_global_cluster_result_to_query path (x : switchover_global_cluster_result) =
  List.concat
    [
      (match x.global_cluster with
      | None -> []
      | Some v -> global_cluster_to_query (List.append path [ "GlobalCluster" ]) v);
    ]

let db_cluster_identifier_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let switchover_global_cluster_message_to_query path (x : switchover_global_cluster_message) =
  List.concat
    [
      db_cluster_identifier_to_query
        (List.append path [ "TargetDbClusterIdentifier" ])
        x.target_db_cluster_identifier;
      global_cluster_identifier_to_query
        (List.append path [ "GlobalClusterIdentifier" ])
        x.global_cluster_identifier;
    ]

let exception_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_global_cluster_state_fault_to_query path (x : invalid_global_cluster_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_db_cluster_state_fault_to_query path (x : invalid_db_cluster_state_fault) =
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

let db_cluster_not_found_fault_to_query path (x : db_cluster_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let subscription_not_found_fault_to_query path (x : subscription_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let subscription_category_not_found_fault_to_query path (x : subscription_category_not_found_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let subscription_already_exist_fault_to_query path (x : subscription_already_exist_fault) =
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

let subnet_to_query path (x : subnet) =
  List.concat
    [
      (match x.subnet_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetStatus" ]) v);
      (match x.subnet_availability_zone with
      | None -> []
      | Some v -> availability_zone_to_query (List.append path [ "SubnetAvailabilityZone" ]) v);
      (match x.subnet_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetIdentifier" ]) v);
    ]

let subnet_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Subnet" subnet_to_query path xs

let subnet_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SubnetIdentifier" string__to_query path xs

let subnet_already_in_use_to_query path (x : subnet_already_in_use) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let storage_type_not_supported_fault_to_query path (x : storage_type_not_supported_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let storage_quota_exceeded_fault_to_query path (x : storage_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let availability_zones_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AvailabilityZone" string__to_query path xs

let integer_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let read_replica_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReadReplicaIdentifier" string__to_query path
    xs

let db_cluster_member_to_query path (x : db_cluster_member) =
  List.concat
    [
      (match x.promotion_tier with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PromotionTier" ]) v);
      (match x.db_cluster_parameter_group_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupStatus" ]) v);
      (match x.is_cluster_writer with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsClusterWriter" ]) v);
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
    ]

let db_cluster_member_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterMember" db_cluster_member_to_query
    path xs

let db_cluster_role_to_query path (x : db_cluster_role) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RoleArn" ]) v);
    ]

let db_cluster_roles_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterRole" db_cluster_role_to_query path
    xs

let log_type_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let double_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let serverless_v2_scaling_configuration_info_to_query path
    (x : serverless_v2_scaling_configuration_info) =
  List.concat
    [
      (match x.max_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxCapacity" ]) v);
      (match x.min_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinCapacity" ]) v);
    ]

let cluster_master_user_secret_to_query path (x : cluster_master_user_secret) =
  List.concat
    [
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.secret_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SecretStatus" ]) v);
      (match x.secret_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SecretArn" ]) v);
    ]

let db_cluster_to_query path (x : db_cluster) =
  List.concat
    [
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.master_user_secret with
      | None -> []
      | Some v -> cluster_master_user_secret_to_query (List.append path [ "MasterUserSecret" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_info_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.io_optimized_next_allowed_modification_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "IOOptimizedNextAllowedModificationTime" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.enabled_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnabledCloudwatchLogsExports" ]) v);
      (match x.cluster_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ClusterCreateTime" ]) v);
      (match x.clone_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CloneGroupId" ]) v);
      (match x.associated_roles with
      | None -> []
      | Some v -> db_cluster_roles_to_query (List.append path [ "AssociatedRoles" ]) v);
      (match x.db_cluster_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterArn" ]) v);
      (match x.db_cluster_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbClusterResourceId" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.hosted_zone_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HostedZoneId" ]) v);
      (match x.vpc_security_groups with
      | None -> []
      | Some v ->
          vpc_security_group_membership_list_to_query (List.append path [ "VpcSecurityGroups" ]) v);
      (match x.db_cluster_members with
      | None -> []
      | Some v -> db_cluster_member_list_to_query (List.append path [ "DBClusterMembers" ]) v);
      (match x.read_replica_identifiers with
      | None -> []
      | Some v ->
          read_replica_identifier_list_to_query (List.append path [ "ReadReplicaIdentifiers" ]) v);
      (match x.replication_source_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationSourceIdentifier" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.latest_restorable_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "LatestRestorableTime" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "MultiAZ" ]) v);
      (match x.reader_endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReaderEndpoint" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.earliest_restorable_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EarliestRestorableTime" ]) v);
      (match x.percent_progress with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PercentProgress" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.db_subnet_group with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroup" ]) v);
      (match x.db_cluster_parameter_group with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroup" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
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

let invalid_db_instance_state_fault_to_query path (x : invalid_db_instance_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

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

let source_type_to_query path (x : source_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Db_cluster_snapshot -> "db-cluster-snapshot"
    | Db_cluster -> "db-cluster"
    | Db_snapshot -> "db-snapshot"
    | Db_security_group -> "db-security-group"
    | Db_parameter_group -> "db-parameter-group"
    | Db_instance -> "db-instance")

let source_not_found_fault_to_query path (x : source_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let source_ids_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SourceId" string__to_query path xs

let snapshot_quota_exceeded_fault_to_query path (x : snapshot_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let shared_snapshot_quota_exceeded_fault_to_query path (x : shared_snapshot_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let serverless_v2_scaling_configuration_to_query path (x : serverless_v2_scaling_configuration) =
  List.concat
    [
      (match x.max_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxCapacity" ]) v);
      (match x.min_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinCapacity" ]) v);
    ]

let serverless_v2_features_support_to_query path (x : serverless_v2_features_support) =
  List.concat
    [
      (match x.max_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxCapacity" ]) v);
      (match x.min_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinCapacity" ]) v);
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

let restore_db_cluster_to_point_in_time_result_to_query path
    (x : restore_db_cluster_to_point_in_time_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let restore_db_cluster_to_point_in_time_message_to_query path
    (x : restore_db_cluster_to_point_in_time_message) =
  List.concat
    [
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.use_latest_restorable_time with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "UseLatestRestorableTime" ]) v);
      (match x.restore_to_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "RestoreToTime" ]) v);
      string__to_query
        (List.append path [ "SourceDBClusterIdentifier" ])
        x.source_db_cluster_identifier;
      (match x.restore_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RestoreType" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
    ]

let network_type_not_supported_to_query path (x : network_type_not_supported) =
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

let db_cluster_already_exists_fault_to_query path (x : db_cluster_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
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
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      string__to_query (List.append path [ "Engine" ]) x.engine;
      string__to_query (List.append path [ "SnapshotIdentifier" ]) x.snapshot_identifier;
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
    ]

let db_snapshot_not_found_fault_to_query path (x : db_snapshot_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let pending_maintenance_action_to_query path (x : pending_maintenance_action) =
  List.concat
    [
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.current_apply_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CurrentApplyDate" ]) v);
      (match x.opt_in_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptInStatus" ]) v);
      (match x.forced_apply_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ForcedApplyDate" ]) v);
      (match x.auto_applied_after_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "AutoAppliedAfterDate" ]) v);
      (match x.action with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Action" ]) v);
    ]

let pending_maintenance_action_details_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "PendingMaintenanceAction"
    pending_maintenance_action_to_query path xs

let resource_pending_maintenance_actions_to_query path (x : resource_pending_maintenance_actions) =
  List.concat
    [
      (match x.pending_maintenance_action_details with
      | None -> []
      | Some v ->
          pending_maintenance_action_details_to_query
            (List.append path [ "PendingMaintenanceActionDetails" ])
            v);
      (match x.resource_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceIdentifier" ]) v);
    ]

let resource_not_found_fault_to_query path (x : resource_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let apply_method_to_query path (x : apply_method) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Pending_reboot -> "pending-reboot" | Immediate -> "immediate")

let parameter_to_query path (x : parameter) =
  List.concat
    [
      (match x.apply_method with
      | None -> []
      | Some v -> apply_method_to_query (List.append path [ "ApplyMethod" ]) v);
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
      (match x.apply_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ApplyType" ]) v);
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

let reset_db_cluster_parameter_group_message_to_query path
    (x : reset_db_cluster_parameter_group_message) =
  List.concat
    [
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
      (match x.reset_all_parameters with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ResetAllParameters" ]) v);
      string__to_query
        (List.append path [ "DBClusterParameterGroupName" ])
        x.db_cluster_parameter_group_name;
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

let db_cluster_parameter_group_name_message_to_query path
    (x : db_cluster_parameter_group_name_message) =
  List.concat
    [
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
    ]

let key_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let remove_tags_from_resource_message_to_query path (x : remove_tags_from_resource_message) =
  List.concat
    [
      key_list_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      string__to_query (List.append path [ "ResourceName" ]) x.resource_name;
    ]

let db_instance_not_found_fault_to_query path (x : db_instance_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let event_categories_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "EventCategory" string__to_query path xs

let event_subscription_to_query path (x : event_subscription) =
  List.concat
    [
      (match x.event_subscription_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EventSubscriptionArn" ]) v);
      (match x.enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Enabled" ]) v);
      (match x.event_categories_list with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategoriesList" ]) v);
      (match x.source_ids_list with
      | None -> []
      | Some v -> source_ids_list_to_query (List.append path [ "SourceIdsList" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      (match x.subscription_creation_time with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubscriptionCreationTime" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.sns_topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnsTopicArn" ]) v);
      (match x.cust_subscription_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustSubscriptionId" ]) v);
      (match x.customer_aws_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomerAwsId" ]) v);
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
      string__to_query (List.append path [ "SourceIdentifier" ]) x.source_identifier;
      string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name;
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
      string__to_query (List.append path [ "DbClusterIdentifier" ]) x.db_cluster_identifier;
      global_cluster_identifier_to_query
        (List.append path [ "GlobalClusterIdentifier" ])
        x.global_cluster_identifier;
    ]

let integer_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let endpoint_to_query path (x : endpoint) =
  List.concat
    [
      (match x.hosted_zone_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "HostedZoneId" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.address with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Address" ]) v);
    ]

let network_type_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let db_subnet_group_to_query path (x : db_subnet_group) =
  List.concat
    [
      (match x.supported_network_types with
      | None -> []
      | Some v -> network_type_list_to_query (List.append path [ "SupportedNetworkTypes" ]) v);
      (match x.db_subnet_group_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupArn" ]) v);
      (match x.subnets with
      | None -> []
      | Some v -> subnet_list_to_query (List.append path [ "Subnets" ]) v);
      (match x.subnet_group_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetGroupStatus" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.db_subnet_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupDescription" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
    ]

let pending_cloudwatch_logs_exports_to_query path (x : pending_cloudwatch_logs_exports) =
  List.concat
    [
      (match x.log_types_to_disable with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "LogTypesToDisable" ]) v);
      (match x.log_types_to_enable with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "LogTypesToEnable" ]) v);
    ]

let pending_modified_values_to_query path (x : pending_modified_values) =
  List.concat
    [
      (match x.pending_cloudwatch_logs_exports with
      | None -> []
      | Some v ->
          pending_cloudwatch_logs_exports_to_query
            (List.append path [ "PendingCloudwatchLogsExports" ])
            v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
    ]

let db_instance_status_info_to_query path (x : db_instance_status_info) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Message" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.normal with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Normal" ]) v);
      (match x.status_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StatusType" ]) v);
    ]

let db_instance_status_info_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBInstanceStatusInfo"
    db_instance_status_info_to_query path xs

let certificate_details_to_query path (x : certificate_details) =
  List.concat
    [
      (match x.valid_till with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ValidTill" ]) v);
      (match x.ca_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CAIdentifier" ]) v);
    ]

let db_instance_to_query path (x : db_instance) =
  List.concat
    [
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.performance_insights_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PerformanceInsightsEnabled" ]) v);
      (match x.certificate_details with
      | None -> []
      | Some v -> certificate_details_to_query (List.append path [ "CertificateDetails" ]) v);
      (match x.enabled_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnabledCloudwatchLogsExports" ]) v);
      (match x.db_instance_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceArn" ]) v);
      (match x.promotion_tier with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PromotionTier" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.dbi_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbiResourceId" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.status_infos with
      | None -> []
      | Some v -> db_instance_status_info_list_to_query (List.append path [ "StatusInfos" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.latest_restorable_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "LatestRestorableTime" ]) v);
      (match x.pending_modified_values with
      | None -> []
      | Some v -> pending_modified_values_to_query (List.append path [ "PendingModifiedValues" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.db_subnet_group with
      | None -> []
      | Some v -> db_subnet_group_to_query (List.append path [ "DBSubnetGroup" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.vpc_security_groups with
      | None -> []
      | Some v ->
          vpc_security_group_membership_list_to_query (List.append path [ "VpcSecurityGroups" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.instance_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "InstanceCreateTime" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "Endpoint" ]) v);
      (match x.db_instance_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceStatus" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
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
      (match x.force_failover with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ForceFailover" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let pending_maintenance_actions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ResourcePendingMaintenanceActions"
    resource_pending_maintenance_actions_to_query path xs

let pending_maintenance_actions_message_to_query path (x : pending_maintenance_actions_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.pending_maintenance_actions with
      | None -> []
      | Some v ->
          pending_maintenance_actions_to_query (List.append path [ "PendingMaintenanceActions" ]) v);
    ]

let availability_zone_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AvailabilityZone" availability_zone_to_query
    path xs

let orderable_db_instance_option_to_query path (x : orderable_db_instance_option) =
  List.concat
    [
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.vpc with None -> [] | Some v -> boolean__to_query (List.append path [ "Vpc" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zone_list_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
    ]

let orderable_db_instance_options_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OrderableDBInstanceOption"
    orderable_db_instance_option_to_query path xs

let orderable_db_instance_options_message_to_query path (x : orderable_db_instance_options_message)
    =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.orderable_db_instance_options with
      | None -> []
      | Some v ->
          orderable_db_instance_options_list_to_query
            (List.append path [ "OrderableDBInstanceOptions" ])
            v);
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
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.new_global_cluster_identifier with
      | None -> []
      | Some v ->
          global_cluster_identifier_to_query (List.append path [ "NewGlobalClusterIdentifier" ]) v);
      global_cluster_identifier_to_query
        (List.append path [ "GlobalClusterIdentifier" ])
        x.global_cluster_identifier;
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
      (match x.enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Enabled" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      (match x.sns_topic_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnsTopicArn" ]) v);
      string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name;
    ]

let event_subscription_quota_exceeded_fault_to_query path
    (x : event_subscription_quota_exceeded_fault) =
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

let modify_db_subnet_group_message_to_query path (x : modify_db_subnet_group_message) =
  List.concat
    [
      subnet_identifier_list_to_query (List.append path [ "SubnetIds" ]) x.subnet_ids;
      (match x.db_subnet_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupDescription" ]) v);
      string__to_query (List.append path [ "DBSubnetGroupName" ]) x.db_subnet_group_name;
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

let modify_db_instance_result_to_query path (x : modify_db_instance_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let modify_db_instance_message_to_query path (x : modify_db_instance_message) =
  List.concat
    [
      (match x.certificate_rotation_restart with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CertificateRotationRestart" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.promotion_tier with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PromotionTier" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.new_db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NewDBInstanceIdentifier" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.apply_immediately with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ApplyImmediately" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
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

let attribute_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AttributeValue" string__to_query path xs

let db_cluster_snapshot_attribute_to_query path (x : db_cluster_snapshot_attribute) =
  List.concat
    [
      (match x.attribute_values with
      | None -> []
      | Some v -> attribute_value_list_to_query (List.append path [ "AttributeValues" ]) v);
      (match x.attribute_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AttributeName" ]) v);
    ]

let db_cluster_snapshot_attribute_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterSnapshotAttribute"
    db_cluster_snapshot_attribute_to_query path xs

let db_cluster_snapshot_attributes_result_to_query path (x : db_cluster_snapshot_attributes_result)
    =
  List.concat
    [
      (match x.db_cluster_snapshot_attributes with
      | None -> []
      | Some v ->
          db_cluster_snapshot_attribute_list_to_query
            (List.append path [ "DBClusterSnapshotAttributes" ])
            v);
      (match x.db_cluster_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterSnapshotIdentifier" ]) v);
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
      (match x.values_to_remove with
      | None -> []
      | Some v -> attribute_value_list_to_query (List.append path [ "ValuesToRemove" ]) v);
      (match x.values_to_add with
      | None -> []
      | Some v -> attribute_value_list_to_query (List.append path [ "ValuesToAdd" ]) v);
      string__to_query (List.append path [ "AttributeName" ]) x.attribute_name;
      string__to_query
        (List.append path [ "DBClusterSnapshotIdentifier" ])
        x.db_cluster_snapshot_identifier;
    ]

let modify_db_cluster_result_to_query path (x : modify_db_cluster_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let modify_db_cluster_parameter_group_message_to_query path
    (x : modify_db_cluster_parameter_group_message) =
  List.concat
    [
      parameters_list_to_query (List.append path [ "Parameters" ]) x.parameters;
      string__to_query
        (List.append path [ "DBClusterParameterGroupName" ])
        x.db_cluster_parameter_group_name;
    ]

let cloudwatch_logs_export_configuration_to_query path (x : cloudwatch_logs_export_configuration) =
  List.concat
    [
      (match x.disable_log_types with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "DisableLogTypes" ]) v);
      (match x.enable_log_types with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableLogTypes" ]) v);
    ]

let modify_db_cluster_message_to_query path (x : modify_db_cluster_message) =
  List.concat
    [
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.rotate_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "RotateMasterUserPassword" ]) v);
      (match x.master_user_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserSecretKmsKeyId" ]) v);
      (match x.manage_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterUserPassword" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.allow_major_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AllowMajorVersionUpgrade" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.cloudwatch_logs_export_configuration with
      | None -> []
      | Some v ->
          cloudwatch_logs_export_configuration_to_query
            (List.append path [ "CloudwatchLogsExportConfiguration" ])
            v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.apply_immediately with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ApplyImmediately" ]) v);
      (match x.new_db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NewDBClusterIdentifier" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
    ]

let invalid_db_subnet_group_state_fault_to_query path (x : invalid_db_subnet_group_state_fault) =
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

let filter_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Value" string__to_query path xs

let filter_to_query path (x : filter) =
  List.concat
    [
      filter_value_list_to_query (List.append path [ "Values" ]) x.values;
      string__to_query (List.append path [ "Name" ]) x.name;
    ]

let filter_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Filter" filter_to_query path xs

let list_tags_for_resource_message_to_query path (x : list_tags_for_resource_message) =
  List.concat
    [
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      string__to_query (List.append path [ "ResourceName" ]) x.resource_name;
    ]

let invalid_event_subscription_state_fault_to_query path
    (x : invalid_event_subscription_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_db_subnet_state_fault_to_query path (x : invalid_db_subnet_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let instance_quota_exceeded_fault_to_query path (x : instance_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let global_cluster_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "GlobalClusterMember" global_cluster_to_query
    path xs

let global_clusters_message_to_query path (x : global_clusters_message) =
  List.concat
    [
      (match x.global_clusters with
      | None -> []
      | Some v -> global_cluster_list_to_query (List.append path [ "GlobalClusters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let global_cluster_quota_exceeded_fault_to_query path (x : global_cluster_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let global_cluster_already_exists_fault_to_query path (x : global_cluster_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
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
      (match x.switchover with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Switchover" ]) v);
      (match x.allow_data_loss with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AllowDataLoss" ]) v);
      db_cluster_identifier_to_query
        (List.append path [ "TargetDbClusterIdentifier" ])
        x.target_db_cluster_identifier;
      global_cluster_identifier_to_query
        (List.append path [ "GlobalClusterIdentifier" ])
        x.global_cluster_identifier;
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
      (match x.target_db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetDBInstanceIdentifier" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
    ]

let event_to_query path (x : event) =
  List.concat
    [
      (match x.source_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceArn" ]) v);
      (match x.date with None -> [] | Some v -> t_stamp_to_query (List.append path [ "Date" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
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

let event_subscriptions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "EventSubscription"
    event_subscription_to_query path xs

let event_subscriptions_message_to_query path (x : event_subscriptions_message) =
  List.concat
    [
      (match x.event_subscriptions_list with
      | None -> []
      | Some v ->
          event_subscriptions_list_to_query (List.append path [ "EventSubscriptionsList" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let event_categories_map_to_query path (x : event_categories_map) =
  List.concat
    [
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
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

let engine_defaults_to_query path (x : engine_defaults) =
  List.concat
    [
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupFamily" ]) v);
    ]

let describe_pending_maintenance_actions_message_to_query path
    (x : describe_pending_maintenance_actions_message) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.resource_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceIdentifier" ]) v);
    ]

let describe_orderable_db_instance_options_message_to_query path
    (x : describe_orderable_db_instance_options_message) =
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
      (match x.vpc with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Vpc" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      string__to_query (List.append path [ "Engine" ]) x.engine;
    ]

let describe_global_clusters_message_to_query path (x : describe_global_clusters_message) =
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
      (match x.global_cluster_identifier with
      | None -> []
      | Some v ->
          global_cluster_identifier_to_query (List.append path [ "GlobalClusterIdentifier" ]) v);
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
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
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

let describe_event_subscriptions_message_to_query path (x : describe_event_subscriptions_message) =
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
      (match x.subscription_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubscriptionName" ]) v);
    ]

let describe_event_categories_message_to_query path (x : describe_event_categories_message) =
  List.concat
    [
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
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
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      string__to_query (List.append path [ "DBParameterGroupFamily" ]) x.db_parameter_group_family;
    ]

let describe_db_subnet_groups_message_to_query path (x : describe_db_subnet_groups_message) =
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
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
    ]

let db_subnet_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBSubnetGroup" db_subnet_group_to_query path
    xs

let db_subnet_group_message_to_query path (x : db_subnet_group_message) =
  List.concat
    [
      (match x.db_subnet_groups with
      | None -> []
      | Some v -> db_subnet_groups_to_query (List.append path [ "DBSubnetGroups" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_instances_message_to_query path (x : describe_db_instances_message) =
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
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
    ]

let db_instance_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBInstance" db_instance_to_query path xs

let db_instance_message_to_query path (x : db_instance_message) =
  List.concat
    [
      (match x.db_instances with
      | None -> []
      | Some v -> db_instance_list_to_query (List.append path [ "DBInstances" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_engine_versions_message_to_query path (x : describe_db_engine_versions_message) =
  List.concat
    [
      (match x.list_supported_timezones with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ListSupportedTimezones" ]) v);
      (match x.list_supported_character_sets with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ListSupportedCharacterSets" ]) v);
      (match x.default_only with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "DefaultOnly" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.db_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupFamily" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
    ]

let ca_certificate_identifiers_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let db_engine_version_to_query path (x : db_engine_version) =
  List.concat
    [
      (match x.serverless_v2_features_support with
      | None -> []
      | Some v ->
          serverless_v2_features_support_to_query
            (List.append path [ "ServerlessV2FeaturesSupport" ])
            v);
      (match x.supports_certificate_rotation_without_restart with
      | None -> []
      | Some v ->
          boolean_optional_to_query
            (List.append path [ "SupportsCertificateRotationWithoutRestart" ])
            v);
      (match x.supported_ca_certificate_identifiers with
      | None -> []
      | Some v ->
          ca_certificate_identifiers_list_to_query
            (List.append path [ "SupportedCACertificateIdentifiers" ])
            v);
      (match x.supports_log_exports_to_cloudwatch_logs with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsLogExportsToCloudwatchLogs" ]) v);
      (match x.exportable_log_types with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "ExportableLogTypes" ]) v);
      (match x.valid_upgrade_target with
      | None -> []
      | Some v -> valid_upgrade_target_list_to_query (List.append path [ "ValidUpgradeTarget" ]) v);
      (match x.db_engine_version_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBEngineVersionDescription" ]) v);
      (match x.db_engine_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBEngineDescription" ]) v);
      (match x.db_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupFamily" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
    ]

let db_engine_version_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBEngineVersion" db_engine_version_to_query
    path xs

let db_engine_version_message_to_query path (x : db_engine_version_message) =
  List.concat
    [
      (match x.db_engine_versions with
      | None -> []
      | Some v -> db_engine_version_list_to_query (List.append path [ "DBEngineVersions" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_clusters_message_to_query path (x : describe_db_clusters_message) =
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
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
    ]

let db_cluster_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBCluster" db_cluster_to_query path xs

let db_cluster_message_to_query path (x : db_cluster_message) =
  List.concat
    [
      (match x.db_clusters with
      | None -> []
      | Some v -> db_cluster_list_to_query (List.append path [ "DBClusters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_cluster_snapshots_message_to_query path (x : describe_db_cluster_snapshots_message)
    =
  List.concat
    [
      (match x.include_public with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IncludePublic" ]) v);
      (match x.include_shared with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IncludeShared" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.snapshot_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotType" ]) v);
      (match x.db_cluster_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterSnapshotIdentifier" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
    ]

let db_cluster_snapshot_to_query path (x : db_cluster_snapshot) =
  List.concat
    [
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.source_db_cluster_snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDBClusterSnapshotArn" ]) v);
      (match x.db_cluster_snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterSnapshotArn" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.percent_progress with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "PercentProgress" ]) v);
      (match x.snapshot_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotType" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.cluster_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ClusterCreateTime" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.snapshot_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "SnapshotCreateTime" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.db_cluster_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterSnapshotIdentifier" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
    ]

let db_cluster_snapshot_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterSnapshot"
    db_cluster_snapshot_to_query path xs

let db_cluster_snapshot_message_to_query path (x : db_cluster_snapshot_message) =
  List.concat
    [
      (match x.db_cluster_snapshots with
      | None -> []
      | Some v -> db_cluster_snapshot_list_to_query (List.append path [ "DBClusterSnapshots" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
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

let describe_db_cluster_parameters_message_to_query path
    (x : describe_db_cluster_parameters_message) =
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
      (match x.source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Source" ]) v);
      string__to_query
        (List.append path [ "DBClusterParameterGroupName" ])
        x.db_cluster_parameter_group_name;
    ]

let db_cluster_parameter_group_details_to_query path (x : db_cluster_parameter_group_details) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
    ]

let describe_db_cluster_parameter_groups_message_to_query path
    (x : describe_db_cluster_parameter_groups_message) =
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
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
    ]

let db_cluster_parameter_group_to_query path (x : db_cluster_parameter_group) =
  List.concat
    [
      (match x.db_cluster_parameter_group_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupArn" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.db_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupFamily" ]) v);
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
    ]

let db_cluster_parameter_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterParameterGroup"
    db_cluster_parameter_group_to_query path xs

let db_cluster_parameter_groups_message_to_query path (x : db_cluster_parameter_groups_message) =
  List.concat
    [
      (match x.db_cluster_parameter_groups with
      | None -> []
      | Some v ->
          db_cluster_parameter_group_list_to_query
            (List.append path [ "DBClusterParameterGroups" ])
            v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_certificates_message_to_query path (x : describe_certificates_message) =
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
      (match x.certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CertificateIdentifier" ]) v);
    ]

let certificate_to_query path (x : certificate) =
  List.concat
    [
      (match x.certificate_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CertificateArn" ]) v);
      (match x.valid_till with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ValidTill" ]) v);
      (match x.valid_from with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ValidFrom" ]) v);
      (match x.thumbprint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Thumbprint" ]) v);
      (match x.certificate_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CertificateType" ]) v);
      (match x.certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CertificateIdentifier" ]) v);
    ]

let certificate_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Certificate" certificate_to_query path xs

let certificate_message_to_query path (x : certificate_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.certificates with
      | None -> []
      | Some v -> certificate_list_to_query (List.append path [ "Certificates" ]) v);
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

let delete_event_subscription_result_to_query path (x : delete_event_subscription_result) =
  List.concat
    [
      (match x.event_subscription with
      | None -> []
      | Some v -> event_subscription_to_query (List.append path [ "EventSubscription" ]) v);
    ]

let delete_event_subscription_message_to_query path (x : delete_event_subscription_message) =
  List.concat [ string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name ]

let delete_db_subnet_group_message_to_query path (x : delete_db_subnet_group_message) =
  List.concat [ string__to_query (List.append path [ "DBSubnetGroupName" ]) x.db_subnet_group_name ]

let delete_db_instance_result_to_query path (x : delete_db_instance_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let delete_db_instance_message_to_query path (x : delete_db_instance_message) =
  List.concat
    [ string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier ]

let db_snapshot_already_exists_fault_to_query path (x : db_snapshot_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
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

let delete_db_cluster_result_to_query path (x : delete_db_cluster_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let delete_db_cluster_parameter_group_message_to_query path
    (x : delete_db_cluster_parameter_group_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterParameterGroupName" ])
        x.db_cluster_parameter_group_name;
    ]

let delete_db_cluster_message_to_query path (x : delete_db_cluster_message) =
  List.concat
    [
      (match x.final_db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FinalDBSnapshotIdentifier" ]) v);
      (match x.skip_final_snapshot with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SkipFinalSnapshot" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
    ]

let db_cluster_snapshot_already_exists_fault_to_query path
    (x : db_cluster_snapshot_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
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
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.source_db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDBClusterIdentifier" ]) v);
      global_cluster_identifier_to_query
        (List.append path [ "GlobalClusterIdentifier" ])
        x.global_cluster_identifier;
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
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Enabled" ]) v);
      (match x.source_ids with
      | None -> []
      | Some v -> source_ids_list_to_query (List.append path [ "SourceIds" ]) v);
      (match x.event_categories with
      | None -> []
      | Some v -> event_categories_list_to_query (List.append path [ "EventCategories" ]) v);
      (match x.source_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceType" ]) v);
      string__to_query (List.append path [ "SnsTopicArn" ]) x.sns_topic_arn;
      string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name;
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
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      subnet_identifier_list_to_query (List.append path [ "SubnetIds" ]) x.subnet_ids;
      string__to_query
        (List.append path [ "DBSubnetGroupDescription" ])
        x.db_subnet_group_description;
      string__to_query (List.append path [ "DBSubnetGroupName" ]) x.db_subnet_group_name;
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
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.promotion_tier with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PromotionTier" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      string__to_query (List.append path [ "Engine" ]) x.engine;
      string__to_query (List.append path [ "DBInstanceClass" ]) x.db_instance_class;
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
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
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      string__to_query
        (List.append path [ "DBClusterSnapshotIdentifier" ])
        x.db_cluster_snapshot_identifier;
    ]

let create_db_cluster_result_to_query path (x : create_db_cluster_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
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
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query (List.append path [ "Description" ]) x.description;
      string__to_query (List.append path [ "DBParameterGroupFamily" ]) x.db_parameter_group_family;
      string__to_query
        (List.append path [ "DBClusterParameterGroupName" ])
        x.db_cluster_parameter_group_name;
    ]

let create_db_cluster_message_to_query path (x : create_db_cluster_message) =
  List.concat
    [
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.master_user_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserSecretKmsKeyId" ]) v);
      (match x.manage_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterUserPassword" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.global_cluster_identifier with
      | None -> []
      | Some v ->
          global_cluster_identifier_to_query (List.append path [ "GlobalClusterIdentifier" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.pre_signed_url with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreSignedUrl" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      string__to_query (List.append path [ "Engine" ]) x.engine;
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
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
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.copy_tags with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTags" ]) v);
      (match x.pre_signed_url with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreSignedUrl" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      string__to_query
        (List.append path [ "TargetDBClusterSnapshotIdentifier" ])
        x.target_db_cluster_snapshot_identifier;
      string__to_query
        (List.append path [ "SourceDBClusterSnapshotIdentifier" ])
        x.source_db_cluster_snapshot_identifier;
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
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query
        (List.append path [ "TargetDBClusterParameterGroupDescription" ])
        x.target_db_cluster_parameter_group_description;
      string__to_query
        (List.append path [ "TargetDBClusterParameterGroupIdentifier" ])
        x.target_db_cluster_parameter_group_identifier;
      string__to_query
        (List.append path [ "SourceDBClusterParameterGroupIdentifier" ])
        x.source_db_cluster_parameter_group_identifier;
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
      string__to_query (List.append path [ "OptInType" ]) x.opt_in_type;
      string__to_query (List.append path [ "ApplyAction" ]) x.apply_action;
      string__to_query (List.append path [ "ResourceIdentifier" ]) x.resource_identifier;
    ]

let add_tags_to_resource_message_to_query path (x : add_tags_to_resource_message) =
  List.concat
    [
      tag_list_to_query (List.append path [ "Tags" ]) x.tags;
      string__to_query (List.append path [ "ResourceName" ]) x.resource_name;
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
      string__to_query (List.append path [ "SourceIdentifier" ]) x.source_identifier;
      string__to_query (List.append path [ "SubscriptionName" ]) x.subscription_name;
    ]
