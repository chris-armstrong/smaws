open Types

let write_forwarding_status_to_query path (x : write_forwarding_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | UNKNOWN -> "unknown"
    | DISABLING -> "disabling"
    | ENABLING -> "enabling"
    | DISABLED -> "disabled"
    | ENABLED -> "enabled")

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

let exception_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let vpc_encryption_control_violation_exception_to_query path
    (x : vpc_encryption_control_violation_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integer_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let integer_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let range_to_query path (x : range) =
  List.concat
    [
      (match x.step with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Step" ]) v);
      (match x.to_ with None -> [] | Some v -> integer_to_query (List.append path [ "To" ]) v);
      (match x.from_ with None -> [] | Some v -> integer_to_query (List.append path [ "From" ]) v);
    ]

let range_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Range" range_to_query path xs

let double_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let double_range_to_query path (x : double_range) =
  List.concat
    [
      (match x.to_ with None -> [] | Some v -> double_to_query (List.append path [ "To" ]) v);
      (match x.from_ with None -> [] | Some v -> double_to_query (List.append path [ "From" ]) v);
    ]

let double_range_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DoubleRange" double_range_to_query path xs

let boolean__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let valid_storage_options_to_query path (x : valid_storage_options) =
  List.concat
    [
      (match x.supports_storage_autoscaling with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsStorageAutoscaling" ]) v);
      (match x.storage_throughput_to_iops_ratio with
      | None -> []
      | Some v -> double_range_list_to_query (List.append path [ "StorageThroughputToIopsRatio" ]) v);
      (match x.provisioned_storage_throughput with
      | None -> []
      | Some v -> range_list_to_query (List.append path [ "ProvisionedStorageThroughput" ]) v);
      (match x.iops_to_storage_ratio with
      | None -> []
      | Some v -> double_range_list_to_query (List.append path [ "IopsToStorageRatio" ]) v);
      (match x.provisioned_iops with
      | None -> []
      | Some v -> range_list_to_query (List.append path [ "ProvisionedIops" ]) v);
      (match x.storage_size with
      | None -> []
      | Some v -> range_list_to_query (List.append path [ "StorageSize" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
    ]

let valid_storage_options_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ValidStorageOptions"
    valid_storage_options_to_query path xs

let valid_volume_options_to_query path (x : valid_volume_options) =
  List.concat
    [
      (match x.storage with
      | None -> []
      | Some v -> valid_storage_options_list_to_query (List.append path [ "Storage" ]) v);
      (match x.volume_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VolumeName" ]) v);
    ]

let valid_volume_options_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" valid_volume_options_to_query path
    xs

let engine_mode_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let boolean_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let upgrade_target_to_query path (x : upgrade_target) =
  List.concat
    [
      (match x.supports_integrations with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "SupportsIntegrations" ]) v);
      (match x.supports_local_write_forwarding with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "SupportsLocalWriteForwarding" ]) v);
      (match x.supports_limitless_database with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "SupportsLimitlessDatabase" ]) v);
      (match x.supports_babelfish with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "SupportsBabelfish" ]) v);
      (match x.supports_global_databases with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "SupportsGlobalDatabases" ]) v);
      (match x.supports_parallel_query with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "SupportsParallelQuery" ]) v);
      (match x.supported_engine_modes with
      | None -> []
      | Some v -> engine_mode_list_to_query (List.append path [ "SupportedEngineModes" ]) v);
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

let available_processor_feature_to_query path (x : available_processor_feature) =
  List.concat
    [
      (match x.allowed_values with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AllowedValues" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DefaultValue" ]) v);
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
    ]

let available_processor_feature_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AvailableProcessorFeature"
    available_processor_feature_to_query path xs

let valid_additional_storage_options_to_query path (x : valid_additional_storage_options) =
  List.concat
    [
      (match x.volumes with
      | None -> []
      | Some v -> valid_volume_options_list_to_query (List.append path [ "Volumes" ]) v);
      (match x.supports_additional_storage_volumes with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsAdditionalStorageVolumes" ]) v);
    ]

let valid_db_instance_modifications_message_to_query path
    (x : valid_db_instance_modifications_message) =
  List.concat
    [
      (match x.additional_storage with
      | None -> []
      | Some v ->
          valid_additional_storage_options_to_query (List.append path [ "AdditionalStorage" ]) v);
      (match x.supports_dedicated_log_volume with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsDedicatedLogVolume" ]) v);
      (match x.valid_processor_features with
      | None -> []
      | Some v ->
          available_processor_feature_list_to_query
            (List.append path [ "ValidProcessorFeatures" ])
            v);
      (match x.storage with
      | None -> []
      | Some v -> valid_storage_options_list_to_query (List.append path [ "Storage" ]) v);
    ]

let description_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let auth_user_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let auth_scheme_to_query path (x : auth_scheme) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with SECRETS -> "SECRETS")

let arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let iam_auth_mode_to_query path (x : iam_auth_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ENABLED -> "ENABLED" | REQUIRED -> "REQUIRED" | DISABLED -> "DISABLED")

let client_password_auth_type_to_query path (x : client_password_auth_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | SQL_SERVER_AUTHENTICATION -> "SQL_SERVER_AUTHENTICATION"
    | POSTGRES_MD5 -> "POSTGRES_MD5"
    | POSTGRES_SCRAM_SHA_256 -> "POSTGRES_SCRAM_SHA_256"
    | MYSQL_CACHING_SHA2_PASSWORD -> "MYSQL_CACHING_SHA2_PASSWORD"
    | MYSQL_NATIVE_PASSWORD -> "MYSQL_NATIVE_PASSWORD")

let user_auth_config_to_query path (x : user_auth_config) =
  List.concat
    [
      (match x.client_password_auth_type with
      | None -> []
      | Some v ->
          client_password_auth_type_to_query (List.append path [ "ClientPasswordAuthType" ]) v);
      (match x.iam_auth with
      | None -> []
      | Some v -> iam_auth_mode_to_query (List.append path [ "IAMAuth" ]) v);
      (match x.secret_arn with
      | None -> []
      | Some v -> arn_to_query (List.append path [ "SecretArn" ]) v);
      (match x.auth_scheme with
      | None -> []
      | Some v -> auth_scheme_to_query (List.append path [ "AuthScheme" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> auth_user_name_to_query (List.append path [ "UserName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
    ]

let user_auth_config_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" user_auth_config_to_query path xs

let user_auth_config_info_to_query path (x : user_auth_config_info) =
  List.concat
    [
      (match x.client_password_auth_type with
      | None -> []
      | Some v ->
          client_password_auth_type_to_query (List.append path [ "ClientPasswordAuthType" ]) v);
      (match x.iam_auth with
      | None -> []
      | Some v -> iam_auth_mode_to_query (List.append path [ "IAMAuth" ]) v);
      (match x.secret_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SecretArn" ]) v);
      (match x.auth_scheme with
      | None -> []
      | Some v -> auth_scheme_to_query (List.append path [ "AuthScheme" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "UserName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
    ]

let user_auth_config_info_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" user_auth_config_info_to_query path
    xs

let upgrade_rollout_order_to_query path (x : upgrade_rollout_order) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with LAST -> "last" | SECOND -> "second" | FIRST -> "first")

let unsupported_db_engine_version_fault_to_query path (x : unsupported_db_engine_version_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let timezone_to_query path (x : timezone) =
  List.concat
    [
      (match x.timezone_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TimezoneName" ]) v);
    ]

let t_stamp_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v
let sensitive_string_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tenant_database_pending_modified_values_to_query path
    (x : tenant_database_pending_modified_values) =
  List.concat
    [
      (match x.tenant_db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TenantDBName" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
    ]

let master_user_secret_to_query path (x : master_user_secret) =
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

let tenant_database_to_query path (x : tenant_database) =
  List.concat
    [
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.master_user_secret with
      | None -> []
      | Some v -> master_user_secret_to_query (List.append path [ "MasterUserSecret" ]) v);
      (match x.pending_modified_values with
      | None -> []
      | Some v ->
          tenant_database_pending_modified_values_to_query
            (List.append path [ "PendingModifiedValues" ])
            v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.nchar_character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NcharCharacterSetName" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.tenant_database_ar_n with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TenantDatabaseARN" ]) v);
      (match x.tenant_database_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TenantDatabaseResourceId" ]) v);
      (match x.dbi_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbiResourceId" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.tenant_db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TenantDBName" ]) v);
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
      (match x.tenant_database_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "TenantDatabaseCreateTime" ]) v);
    ]

let tenant_databases_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "TenantDatabase" tenant_database_to_query
    path xs

let tenant_databases_message_to_query path (x : tenant_databases_message) =
  List.concat
    [
      (match x.tenant_databases with
      | None -> []
      | Some v -> tenant_databases_list_to_query (List.append path [ "TenantDatabases" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let tenant_database_quota_exceeded_fault_to_query path (x : tenant_database_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let tenant_database_not_found_fault_to_query path (x : tenant_database_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let tenant_database_already_exists_fault_to_query path (x : tenant_database_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let target_type_to_query path (x : target_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | TRACKED_CLUSTER -> "TRACKED_CLUSTER"
    | RDS_SERVERLESS_ENDPOINT -> "RDS_SERVERLESS_ENDPOINT"
    | RDS_INSTANCE -> "RDS_INSTANCE")

let target_storage_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_state_to_query path (x : target_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Unused -> "UNUSED"
    | Unavailable -> "UNAVAILABLE"
    | Available -> "AVAILABLE"
    | Registering -> "REGISTERING")

let target_role_to_query path (x : target_role) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with UNKNOWN -> "UNKNOWN" | READ_ONLY -> "READ_ONLY" | READ_WRITE -> "READ_WRITE")

let target_health_reason_to_query path (x : target_health_reason) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | PROMOTED -> "PROMOTED"
    | INVALID_REPLICATION_STATE -> "INVALID_REPLICATION_STATE"
    | PENDING_PROXY_CAPACITY -> "PENDING_PROXY_CAPACITY"
    | AUTH_FAILURE -> "AUTH_FAILURE"
    | CONNECTION_FAILED -> "CONNECTION_FAILED"
    | UNREACHABLE -> "UNREACHABLE")

let target_health_to_query path (x : target_health) =
  List.concat
    [
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.reason with
      | None -> []
      | Some v -> target_health_reason_to_query (List.append path [ "Reason" ]) v);
      (match x.state with
      | None -> []
      | Some v -> target_state_to_query (List.append path [ "State" ]) v);
    ]

let db_proxy_target_to_query path (x : db_proxy_target) =
  List.concat
    [
      (match x.target_health with
      | None -> []
      | Some v -> target_health_to_query (List.append path [ "TargetHealth" ]) v);
      (match x.role with
      | None -> []
      | Some v -> target_role_to_query (List.append path [ "Role" ]) v);
      (match x.type_ with
      | None -> []
      | Some v -> target_type_to_query (List.append path [ "Type" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.rds_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RdsResourceId" ]) v);
      (match x.tracked_cluster_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TrackedClusterId" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.target_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetArn" ]) v);
    ]

let target_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" db_proxy_target_to_query path xs

let string_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let operator_sensitive_string_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let connection_pool_configuration_info_to_query path (x : connection_pool_configuration_info) =
  List.concat
    [
      (match x.init_query with
      | None -> []
      | Some v -> operator_sensitive_string_to_query (List.append path [ "InitQuery" ]) v);
      (match x.session_pinning_filters with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "SessionPinningFilters" ]) v);
      (match x.connection_borrow_timeout with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "ConnectionBorrowTimeout" ]) v);
      (match x.max_idle_connections_percent with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "MaxIdleConnectionsPercent" ]) v);
      (match x.max_connections_percent with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "MaxConnectionsPercent" ]) v);
    ]

let db_proxy_target_group_to_query path (x : db_proxy_target_group) =
  List.concat
    [
      (match x.updated_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "UpdatedDate" ]) v);
      (match x.created_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreatedDate" ]) v);
      (match x.connection_pool_config with
      | None -> []
      | Some v ->
          connection_pool_configuration_info_to_query
            (List.append path [ "ConnectionPoolConfig" ])
            v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.is_default with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsDefault" ]) v);
      (match x.target_group_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetGroupArn" ]) v);
      (match x.target_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetGroupName" ]) v);
      (match x.db_proxy_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBProxyName" ]) v);
    ]

let target_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" db_proxy_target_group_to_query path
    xs

let target_engine_version_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_db_parameter_group_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_db_instance_class_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_db_cluster_parameter_group_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let target_connection_network_type_to_query path (x : target_connection_network_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with IPV6 -> "IPV6" | IPV4 -> "IPV4")

let tag_specification_to_query path (x : tag_specification) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.resource_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceType" ]) v);
    ]

let tag_specification_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "item" tag_specification_to_query path xs

let tag_list_message_to_query path (x : tag_list_message) =
  List.concat
    [
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
    ]

let switchover_timeout_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

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

let db_security_group_membership_to_query path (x : db_security_group_membership) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.db_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSecurityGroupName" ]) v);
    ]

let db_security_group_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBSecurityGroup"
    db_security_group_membership_to_query path xs

let db_parameter_group_status_to_query path (x : db_parameter_group_status) =
  List.concat
    [
      (match x.parameter_apply_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterApplyStatus" ]) v);
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
    ]

let db_parameter_group_status_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBParameterGroup"
    db_parameter_group_status_to_query path xs

let availability_zone_to_query path (x : availability_zone) =
  List.concat
    [
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
    ]

let outpost_to_query path (x : outpost) =
  List.concat
    [ (match x.arn with None -> [] | Some v -> string__to_query (List.append path [ "Arn" ]) v) ]

let subnet_to_query path (x : subnet) =
  List.concat
    [
      (match x.subnet_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetStatus" ]) v);
      (match x.subnet_outpost with
      | None -> []
      | Some v -> outpost_to_query (List.append path [ "SubnetOutpost" ]) v);
      (match x.subnet_availability_zone with
      | None -> []
      | Some v -> availability_zone_to_query (List.append path [ "SubnetAvailabilityZone" ]) v);
      (match x.subnet_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SubnetIdentifier" ]) v);
    ]

let subnet_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Subnet" subnet_to_query path xs

let db_subnet_group_to_query path (x : db_subnet_group) =
  List.concat
    [
      (match x.supported_network_types with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "SupportedNetworkTypes" ]) v);
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

let log_type_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

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

let processor_feature_to_query path (x : processor_feature) =
  List.concat
    [
      (match x.value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Value" ]) v);
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
    ]

let processor_feature_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ProcessorFeature" processor_feature_to_query
    path xs

let automation_mode_to_query path (x : automation_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ALL_PAUSED -> "all-paused" | FULL -> "full")

let additional_storage_volume_to_query path (x : additional_storage_volume) =
  List.concat
    [
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.max_allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxAllocatedStorage" ]) v);
      (match x.iop_s with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "IOPS" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      string__to_query (List.append path [ "VolumeName" ]) x.volume_name;
    ]

let additional_storage_volumes_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" additional_storage_volume_to_query
    path xs

let pending_modified_values_to_query path (x : pending_modified_values) =
  List.concat
    [
      (match x.additional_storage_volumes with
      | None -> []
      | Some v ->
          additional_storage_volumes_list_to_query
            (List.append path [ "AdditionalStorageVolumes" ])
            v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.dedicated_log_volume with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DedicatedLogVolume" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
      (match x.multi_tenant with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiTenant" ]) v);
      (match x.resume_full_automation_mode_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ResumeFullAutomationModeTime" ]) v);
      (match x.automation_mode with
      | None -> []
      | Some v -> automation_mode_to_query (List.append path [ "AutomationMode" ]) v);
      (match x.processor_features with
      | None -> []
      | Some v -> processor_feature_list_to_query (List.append path [ "ProcessorFeatures" ]) v);
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
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
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
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
    ]

let read_replica_db_instance_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReadReplicaDBInstanceIdentifier"
    string__to_query path xs

let read_replica_db_cluster_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReadReplicaDBClusterIdentifier"
    string__to_query path xs

let replica_mode_to_query path (x : replica_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with MOUNTED -> "mounted" | OPEN_READ_ONLY -> "open-read-only")

let option_group_membership_to_query path (x : option_group_membership) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
    ]

let option_group_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OptionGroupMembership"
    option_group_membership_to_query path xs

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

let storage_encryption_type_to_query path (x : storage_encryption_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SSE -> "sse-rds" | CMK -> "sse-kms" | UNENCRYPTED -> "none")

let domain_membership_to_query path (x : domain_membership) =
  List.concat
    [
      (match x.dns_ips with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DnsIps" ]) v);
      (match x.auth_secret_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AuthSecretArn" ]) v);
      (match x.o_u with None -> [] | Some v -> string__to_query (List.append path [ "OU" ]) v);
      (match x.iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IAMRoleName" ]) v);
      (match x.fqd_n with None -> [] | Some v -> string__to_query (List.append path [ "FQDN" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
    ]

let domain_membership_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DomainMembership" domain_membership_to_query
    path xs

let database_insights_mode_to_query path (x : database_insights_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ADVANCED -> "advanced" | STANDARD -> "standard")

let db_instance_role_to_query path (x : db_instance_role) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.feature_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FeatureName" ]) v);
      (match x.role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RoleArn" ]) v);
    ]

let db_instance_roles_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBInstanceRole" db_instance_role_to_query
    path xs

let activity_stream_status_to_query path (x : activity_stream_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Stopping -> "stopping"
    | Started -> "started"
    | Starting -> "starting"
    | Stopped -> "stopped")

let activity_stream_mode_to_query path (x : activity_stream_mode) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Async -> "async" | Sync -> "sync")

let db_instance_automated_backups_replication_to_query path
    (x : db_instance_automated_backups_replication) =
  List.concat
    [
      (match x.db_instance_automated_backups_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceAutomatedBackupsArn" ]) v);
    ]

let db_instance_automated_backups_replication_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBInstanceAutomatedBackupsReplication"
    db_instance_automated_backups_replication_to_query path xs

let activity_stream_policy_status_to_query path (x : activity_stream_policy_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Unlocking_policy -> "unlocking-policy"
    | Locking_policy -> "locking-policy"
    | Unlocked -> "unlocked"
    | Locked -> "locked")

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

let additional_storage_volume_output_to_query path (x : additional_storage_volume_output) =
  List.concat
    [
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.max_allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxAllocatedStorage" ]) v);
      (match x.iop_s with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "IOPS" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.storage_volume_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageVolumeStatus" ]) v);
      (match x.volume_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VolumeName" ]) v);
    ]

let additional_storage_volumes_output_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    additional_storage_volume_output_to_query path xs

let db_instance_to_query path (x : db_instance) =
  List.concat
    [
      (match x.storage_volume_status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageVolumeStatus" ]) v);
      (match x.additional_storage_volumes with
      | None -> []
      | Some v ->
          additional_storage_volumes_output_list_to_query
            (List.append path [ "AdditionalStorageVolumes" ])
            v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
      (match x.is_storage_config_upgrade_available with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "IsStorageConfigUpgradeAvailable" ]) v);
      (match x.dedicated_log_volume with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "DedicatedLogVolume" ]) v);
      (match x.multi_tenant with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiTenant" ]) v);
      (match x.percent_progress with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PercentProgress" ]) v);
      (match x.read_replica_source_db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReadReplicaSourceDBClusterIdentifier" ]) v);
      (match x.master_user_secret with
      | None -> []
      | Some v -> master_user_secret_to_query (List.append path [ "MasterUserSecret" ]) v);
      (match x.db_system_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSystemId" ]) v);
      (match x.certificate_details with
      | None -> []
      | Some v -> certificate_details_to_query (List.append path [ "CertificateDetails" ]) v);
      (match x.activity_stream_policy_status with
      | None -> []
      | Some v ->
          activity_stream_policy_status_to_query
            (List.append path [ "ActivityStreamPolicyStatus" ])
            v);
      (match x.custom_iam_instance_profile with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomIamInstanceProfile" ]) v);
      (match x.automatic_restart_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "AutomaticRestartTime" ]) v);
      (match x.backup_target with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BackupTarget" ]) v);
      (match x.db_instance_automated_backups_replications with
      | None -> []
      | Some v ->
          db_instance_automated_backups_replication_list_to_query
            (List.append path [ "DBInstanceAutomatedBackupsReplications" ])
            v);
      (match x.aws_backup_recovery_point_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AwsBackupRecoveryPointArn" ]) v);
      (match x.activity_stream_engine_native_audit_fields_included with
      | None -> []
      | Some v ->
          boolean_optional_to_query
            (List.append path [ "ActivityStreamEngineNativeAuditFieldsIncluded" ])
            v);
      (match x.activity_stream_mode with
      | None -> []
      | Some v -> activity_stream_mode_to_query (List.append path [ "ActivityStreamMode" ]) v);
      (match x.activity_stream_kinesis_stream_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ActivityStreamKinesisStreamName" ]) v);
      (match x.activity_stream_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ActivityStreamKmsKeyId" ]) v);
      (match x.activity_stream_status with
      | None -> []
      | Some v -> activity_stream_status_to_query (List.append path [ "ActivityStreamStatus" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.customer_owned_ip_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CustomerOwnedIpEnabled" ]) v);
      (match x.resume_full_automation_mode_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ResumeFullAutomationModeTime" ]) v);
      (match x.automation_mode with
      | None -> []
      | Some v -> automation_mode_to_query (List.append path [ "AutomationMode" ]) v);
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.max_allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxAllocatedStorage" ]) v);
      (match x.listener_endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "ListenerEndpoint" ]) v);
      (match x.associated_roles with
      | None -> []
      | Some v -> db_instance_roles_to_query (List.append path [ "AssociatedRoles" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.processor_features with
      | None -> []
      | Some v -> processor_feature_list_to_query (List.append path [ "ProcessorFeatures" ]) v);
      (match x.enabled_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnabledCloudwatchLogsExports" ]) v);
      (match x.performance_insights_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "PerformanceInsightsRetentionPeriod" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.performance_insights_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PerformanceInsightsEnabled" ]) v);
      (match x.database_insights_mode with
      | None -> []
      | Some v -> database_insights_mode_to_query (List.append path [ "DatabaseInsightsMode" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
      (match x.timezone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Timezone" ]) v);
      (match x.db_instance_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceArn" ]) v);
      (match x.promotion_tier with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PromotionTier" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.enhanced_monitoring_resource_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EnhancedMonitoringResourceArn" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.domain_memberships with
      | None -> []
      | Some v -> domain_membership_list_to_query (List.append path [ "DomainMemberships" ]) v);
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
      (match x.db_instance_port with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "DbInstancePort" ]) v);
      (match x.tde_credential_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TdeCredentialArn" ]) v);
      (match x.storage_encryption_type with
      | None -> []
      | Some v -> storage_encryption_type_to_query (List.append path [ "StorageEncryptionType" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.status_infos with
      | None -> []
      | Some v -> db_instance_status_info_list_to_query (List.append path [ "StatusInfos" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.secondary_availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SecondaryAvailabilityZone" ]) v);
      (match x.nchar_character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NcharCharacterSetName" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.option_group_memberships with
      | None -> []
      | Some v ->
          option_group_membership_list_to_query (List.append path [ "OptionGroupMemberships" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.replica_mode with
      | None -> []
      | Some v -> replica_mode_to_query (List.append path [ "ReplicaMode" ]) v);
      (match x.read_replica_db_cluster_identifiers with
      | None -> []
      | Some v ->
          read_replica_db_cluster_identifier_list_to_query
            (List.append path [ "ReadReplicaDBClusterIdentifiers" ])
            v);
      (match x.read_replica_db_instance_identifiers with
      | None -> []
      | Some v ->
          read_replica_db_instance_identifier_list_to_query
            (List.append path [ "ReadReplicaDBInstanceIdentifiers" ])
            v);
      (match x.read_replica_source_db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReadReplicaSourceDBInstanceIdentifier" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "MultiAZ" ]) v);
      (match x.latest_restorable_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "LatestRestorableTime" ]) v);
      (match x.pending_modified_values with
      | None -> []
      | Some v -> pending_modified_values_to_query (List.append path [ "PendingModifiedValues" ]) v);
      (match x.upgrade_rollout_order with
      | None -> []
      | Some v -> upgrade_rollout_order_to_query (List.append path [ "UpgradeRolloutOrder" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.db_subnet_group with
      | None -> []
      | Some v -> db_subnet_group_to_query (List.append path [ "DBSubnetGroup" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.db_parameter_groups with
      | None -> []
      | Some v ->
          db_parameter_group_status_list_to_query (List.append path [ "DBParameterGroups" ]) v);
      (match x.vpc_security_groups with
      | None -> []
      | Some v ->
          vpc_security_group_membership_list_to_query (List.append path [ "VpcSecurityGroups" ]) v);
      (match x.db_security_groups with
      | None -> []
      | Some v ->
          db_security_group_membership_list_to_query (List.append path [ "DBSecurityGroups" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.instance_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "InstanceCreateTime" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> endpoint_to_query (List.append path [ "Endpoint" ]) v);
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBName" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
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

let switchover_read_replica_result_to_query path (x : switchover_read_replica_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let switchover_read_replica_message_to_query path (x : switchover_read_replica_message) =
  List.concat
    [ string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier ]

let invalid_db_instance_state_fault_to_query path (x : invalid_db_instance_state_fault) =
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

let global_cluster_identifier_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

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
      (match x.global_write_forwarding_status with
      | None -> []
      | Some v ->
          write_forwarding_status_to_query (List.append path [ "GlobalWriteForwardingStatus" ]) v);
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
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.global_cluster_members with
      | None -> []
      | Some v ->
          global_cluster_member_list_to_query (List.append path [ "GlobalClusterMembers" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.storage_encryption_type with
      | None -> []
      | Some v -> storage_encryption_type_to_query (List.append path [ "StorageEncryptionType" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
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

let switchover_detail_status_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let database_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let switchover_detail_to_query path (x : switchover_detail) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> switchover_detail_status_to_query (List.append path [ "Status" ]) v);
      (match x.target_member with
      | None -> []
      | Some v -> database_arn_to_query (List.append path [ "TargetMember" ]) v);
      (match x.source_member with
      | None -> []
      | Some v -> database_arn_to_query (List.append path [ "SourceMember" ]) v);
    ]

let switchover_detail_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" switchover_detail_to_query path xs

let blue_green_deployment_identifier_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let blue_green_deployment_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let blue_green_deployment_task_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let blue_green_deployment_task_status_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let blue_green_deployment_task_to_query path (x : blue_green_deployment_task) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> blue_green_deployment_task_status_to_query (List.append path [ "Status" ]) v);
      (match x.name with
      | None -> []
      | Some v -> blue_green_deployment_task_name_to_query (List.append path [ "Name" ]) v);
    ]

let blue_green_deployment_task_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" blue_green_deployment_task_to_query
    path xs

let blue_green_deployment_status_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let blue_green_deployment_status_details_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let blue_green_deployment_to_query path (x : blue_green_deployment) =
  List.concat
    [
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.delete_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "DeleteTime" ]) v);
      (match x.create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreateTime" ]) v);
      (match x.status_details with
      | None -> []
      | Some v ->
          blue_green_deployment_status_details_to_query (List.append path [ "StatusDetails" ]) v);
      (match x.status with
      | None -> []
      | Some v -> blue_green_deployment_status_to_query (List.append path [ "Status" ]) v);
      (match x.tasks with
      | None -> []
      | Some v -> blue_green_deployment_task_list_to_query (List.append path [ "Tasks" ]) v);
      (match x.switchover_details with
      | None -> []
      | Some v -> switchover_detail_list_to_query (List.append path [ "SwitchoverDetails" ]) v);
      (match x.target with
      | None -> []
      | Some v -> database_arn_to_query (List.append path [ "Target" ]) v);
      (match x.source with
      | None -> []
      | Some v -> database_arn_to_query (List.append path [ "Source" ]) v);
      (match x.blue_green_deployment_name with
      | None -> []
      | Some v ->
          blue_green_deployment_name_to_query (List.append path [ "BlueGreenDeploymentName" ]) v);
      (match x.blue_green_deployment_identifier with
      | None -> []
      | Some v ->
          blue_green_deployment_identifier_to_query
            (List.append path [ "BlueGreenDeploymentIdentifier" ])
            v);
    ]

let switchover_blue_green_deployment_response_to_query path
    (x : switchover_blue_green_deployment_response) =
  List.concat
    [
      (match x.blue_green_deployment with
      | None -> []
      | Some v -> blue_green_deployment_to_query (List.append path [ "BlueGreenDeployment" ]) v);
    ]

let switchover_blue_green_deployment_request_to_query path
    (x : switchover_blue_green_deployment_request) =
  List.concat
    [
      (match x.switchover_timeout with
      | None -> []
      | Some v -> switchover_timeout_to_query (List.append path [ "SwitchoverTimeout" ]) v);
      blue_green_deployment_identifier_to_query
        (List.append path [ "BlueGreenDeploymentIdentifier" ])
        x.blue_green_deployment_identifier;
    ]

let invalid_blue_green_deployment_state_fault_to_query path
    (x : invalid_blue_green_deployment_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let blue_green_deployment_not_found_fault_to_query path (x : blue_green_deployment_not_found_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let supported_timezones_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Timezone" timezone_to_query path xs

let lifecycle_support_name_to_query path (x : lifecycle_support_name) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | OPEN_SOURCE_RDS_EXTENDED_SUPPORT -> "open-source-rds-extended-support"
    | OPEN_SOURCE_RDS_STANDARD_SUPPORT -> "open-source-rds-standard-support")

let supported_engine_lifecycle_to_query path (x : supported_engine_lifecycle) =
  List.concat
    [
      t_stamp_to_query (List.append path [ "LifecycleSupportEndDate" ]) x.lifecycle_support_end_date;
      t_stamp_to_query
        (List.append path [ "LifecycleSupportStartDate" ])
        x.lifecycle_support_start_date;
      lifecycle_support_name_to_query
        (List.append path [ "LifecycleSupportName" ])
        x.lifecycle_support_name;
    ]

let supported_engine_lifecycle_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SupportedEngineLifecycle"
    supported_engine_lifecycle_to_query path xs

let character_set_to_query path (x : character_set) =
  List.concat
    [
      (match x.character_set_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetDescription" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
    ]

let supported_character_sets_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "CharacterSet" character_set_to_query path xs

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

let subnet_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SubnetIdentifier" string__to_query path xs

let subnet_already_in_use_to_query path (x : subnet_already_in_use) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let string255_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let storage_type_not_supported_fault_to_query path (x : storage_type_not_supported_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let storage_type_not_available_fault_to_query path (x : storage_type_not_available_fault) =
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

let stop_db_instance_result_to_query path (x : stop_db_instance_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let stop_db_instance_message_to_query path (x : stop_db_instance_message) =
  List.concat
    [
      (match x.db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSnapshotIdentifier" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let restore_window_to_query path (x : restore_window) =
  List.concat
    [
      (match x.latest_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "LatestTime" ]) v);
      (match x.earliest_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EarliestTime" ]) v);
    ]

let db_instance_automated_backup_to_query path (x : db_instance_automated_backup) =
  List.concat
    [
      (match x.additional_storage_volumes with
      | None -> []
      | Some v ->
          additional_storage_volumes_list_to_query
            (List.append path [ "AdditionalStorageVolumes" ])
            v);
      (match x.dedicated_log_volume with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DedicatedLogVolume" ]) v);
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.aws_backup_recovery_point_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AwsBackupRecoveryPointArn" ]) v);
      (match x.multi_tenant with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiTenant" ]) v);
      (match x.backup_target with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BackupTarget" ]) v);
      (match x.db_instance_automated_backups_replications with
      | None -> []
      | Some v ->
          db_instance_automated_backups_replication_list_to_query
            (List.append path [ "DBInstanceAutomatedBackupsReplications" ])
            v);
      (match x.db_instance_automated_backups_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceAutomatedBackupsArn" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
      (match x.timezone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Timezone" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.storage_encryption_type with
      | None -> []
      | Some v -> storage_encryption_type_to_query (List.append path [ "StorageEncryptionType" ]) v);
      (match x.encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Encrypted" ]) v);
      (match x.tde_credential_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TdeCredentialArn" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.instance_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "InstanceCreateTime" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.restore_window with
      | None -> []
      | Some v -> restore_window_to_query (List.append path [ "RestoreWindow" ]) v);
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
      (match x.region with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Region" ]) v);
      (match x.dbi_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbiResourceId" ]) v);
      (match x.db_instance_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceArn" ]) v);
    ]

let stop_db_instance_automated_backups_replication_result_to_query path
    (x : stop_db_instance_automated_backups_replication_result) =
  List.concat
    [
      (match x.db_instance_automated_backup with
      | None -> []
      | Some v ->
          db_instance_automated_backup_to_query (List.append path [ "DBInstanceAutomatedBackup" ]) v);
    ]

let stop_db_instance_automated_backups_replication_message_to_query path
    (x : stop_db_instance_automated_backups_replication_message) =
  List.concat
    [ string__to_query (List.append path [ "SourceDBInstanceArn" ]) x.source_db_instance_arn ]

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

let availability_zones_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AvailabilityZone" string__to_query path xs

let db_cluster_option_group_status_to_query path (x : db_cluster_option_group_status) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.db_cluster_option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterOptionGroupName" ]) v);
    ]

let db_cluster_option_group_memberships_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterOptionGroup"
    db_cluster_option_group_status_to_query path xs

let read_replica_identifier_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReadReplicaIdentifier" string__to_query path
    xs

let db_cluster_status_info_to_query path (x : db_cluster_status_info) =
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

let db_cluster_status_info_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterStatusInfo"
    db_cluster_status_info_to_query path xs

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
      (match x.feature_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FeatureName" ]) v);
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

let long_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let rds_custom_cluster_configuration_to_query path (x : rds_custom_cluster_configuration) =
  List.concat
    [
      (match x.replica_mode with
      | None -> []
      | Some v -> replica_mode_to_query (List.append path [ "ReplicaMode" ]) v);
      (match x.transit_gateway_multicast_domain_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TransitGatewayMulticastDomainId" ]) v);
      (match x.interconnect_subnet_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "InterconnectSubnetId" ]) v);
    ]

let cluster_pending_modified_values_to_query path (x : cluster_pending_modified_values) =
  List.concat
    [
      (match x.certificate_details with
      | None -> []
      | Some v -> certificate_details_to_query (List.append path [ "CertificateDetails" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.rds_custom_cluster_configuration with
      | None -> []
      | Some v ->
          rds_custom_cluster_configuration_to_query
            (List.append path [ "RdsCustomClusterConfiguration" ])
            v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.pending_cloudwatch_logs_exports with
      | None -> []
      | Some v ->
          pending_cloudwatch_logs_exports_to_query
            (List.append path [ "PendingCloudwatchLogsExports" ])
            v);
    ]

let scaling_configuration_info_to_query path (x : scaling_configuration_info) =
  List.concat
    [
      (match x.seconds_before_timeout with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SecondsBeforeTimeout" ]) v);
      (match x.timeout_action with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TimeoutAction" ]) v);
      (match x.seconds_until_auto_pause with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SecondsUntilAutoPause" ]) v);
      (match x.auto_pause with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoPause" ]) v);
      (match x.max_capacity with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxCapacity" ]) v);
      (match x.min_capacity with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MinCapacity" ]) v);
    ]

let double_optional_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.float_field path v

let serverless_v2_scaling_configuration_info_to_query path
    (x : serverless_v2_scaling_configuration_info) =
  List.concat
    [
      (match x.seconds_until_auto_pause with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SecondsUntilAutoPause" ]) v);
      (match x.max_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxCapacity" ]) v);
      (match x.min_capacity with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinCapacity" ]) v);
    ]

let local_write_forwarding_status_to_query path (x : local_write_forwarding_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | REQUESTED -> "requested"
    | DISABLING -> "disabling"
    | ENABLING -> "enabling"
    | DISABLED -> "disabled"
    | ENABLED -> "enabled")

let limitless_database_status_to_query path (x : limitless_database_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ERROR -> "error"
    | MODIFYING_MAX_CAPACITY -> "modifying-max-capacity"
    | DISABLING -> "disabling"
    | ENABLING -> "enabling"
    | DISABLED -> "disabled"
    | ENABLED -> "enabled"
    | NOT_IN_USE -> "not-in-use"
    | ACTIVE -> "active")

let limitless_database_to_query path (x : limitless_database) =
  List.concat
    [
      (match x.min_required_ac_u with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinRequiredACU" ]) v);
      (match x.status with
      | None -> []
      | Some v -> limitless_database_status_to_query (List.append path [ "Status" ]) v);
    ]

let cluster_scalability_type_to_query path (x : cluster_scalability_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with LIMITLESS -> "limitless" | STANDARD -> "standard")

let db_cluster_to_query path (x : db_cluster) =
  List.concat
    [
      (match x.internet_access_gateway_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "InternetAccessGatewayEnabled" ]) v);
      (match x.vpc_networking_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "VPCNetworkingEnabled" ]) v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
      (match x.certificate_details with
      | None -> []
      | Some v -> certificate_details_to_query (List.append path [ "CertificateDetails" ]) v);
      (match x.cluster_scalability_type with
      | None -> []
      | Some v ->
          cluster_scalability_type_to_query (List.append path [ "ClusterScalabilityType" ]) v);
      (match x.limitless_database with
      | None -> []
      | Some v -> limitless_database_to_query (List.append path [ "LimitlessDatabase" ]) v);
      (match x.aws_backup_recovery_point_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AwsBackupRecoveryPointArn" ]) v);
      (match x.local_write_forwarding_status with
      | None -> []
      | Some v ->
          local_write_forwarding_status_to_query
            (List.append path [ "LocalWriteForwardingStatus" ])
            v);
      (match x.master_user_secret with
      | None -> []
      | Some v -> master_user_secret_to_query (List.append path [ "MasterUserSecret" ]) v);
      (match x.db_system_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSystemId" ]) v);
      (match x.performance_insights_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "PerformanceInsightsRetentionPeriod" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.performance_insights_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PerformanceInsightsEnabled" ]) v);
      (match x.database_insights_mode with
      | None -> []
      | Some v -> database_insights_mode_to_query (List.append path [ "DatabaseInsightsMode" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.serverless_v2_platform_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServerlessV2PlatformVersion" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_info_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.automatic_restart_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "AutomaticRestartTime" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.global_write_forwarding_requested with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "GlobalWriteForwardingRequested" ]) v);
      (match x.global_write_forwarding_status with
      | None -> []
      | Some v ->
          write_forwarding_status_to_query (List.append path [ "GlobalWriteForwardingStatus" ]) v);
      (match x.global_cluster_identifier with
      | None -> []
      | Some v ->
          global_cluster_identifier_to_query (List.append path [ "GlobalClusterIdentifier" ]) v);
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.domain_memberships with
      | None -> []
      | Some v -> domain_membership_list_to_query (List.append path [ "DomainMemberships" ]) v);
      (match x.cross_account_clone with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CrossAccountClone" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.activity_stream_kinesis_stream_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ActivityStreamKinesisStreamName" ]) v);
      (match x.activity_stream_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ActivityStreamKmsKeyId" ]) v);
      (match x.activity_stream_status with
      | None -> []
      | Some v -> activity_stream_status_to_query (List.append path [ "ActivityStreamStatus" ]) v);
      (match x.activity_stream_mode with
      | None -> []
      | Some v -> activity_stream_mode_to_query (List.append path [ "ActivityStreamMode" ]) v);
      (match x.http_endpoint_enabled with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "HttpEndpointEnabled" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.io_optimized_next_allowed_modification_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "IOOptimizedNextAllowedModificationTime" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.db_cluster_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterInstanceClass" ]) v);
      (match x.rds_custom_cluster_configuration with
      | None -> []
      | Some v ->
          rds_custom_cluster_configuration_to_query
            (List.append path [ "RdsCustomClusterConfiguration" ])
            v);
      (match x.scaling_configuration_info with
      | None -> []
      | Some v ->
          scaling_configuration_info_to_query (List.append path [ "ScalingConfigurationInfo" ]) v);
      (match x.engine_mode with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineMode" ]) v);
      (match x.pending_modified_values with
      | None -> []
      | Some v ->
          cluster_pending_modified_values_to_query (List.append path [ "PendingModifiedValues" ]) v);
      (match x.capacity with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Capacity" ]) v);
      (match x.enabled_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnabledCloudwatchLogsExports" ]) v);
      (match x.backtrack_consumed_change_records with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "BacktrackConsumedChangeRecords" ]) v);
      (match x.backtrack_window with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "BacktrackWindow" ]) v);
      (match x.earliest_backtrack_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EarliestBacktrackTime" ]) v);
      (match x.cluster_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ClusterCreateTime" ]) v);
      (match x.clone_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CloneGroupId" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
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
      (match x.storage_encryption_type with
      | None -> []
      | Some v -> storage_encryption_type_to_query (List.append path [ "StorageEncryptionType" ]) v);
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
      (match x.status_infos with
      | None -> []
      | Some v -> db_cluster_status_info_list_to_query (List.append path [ "StatusInfos" ]) v);
      (match x.read_replica_identifiers with
      | None -> []
      | Some v ->
          read_replica_identifier_list_to_query (List.append path [ "ReadReplicaIdentifiers" ]) v);
      (match x.replication_source_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationSourceIdentifier" ]) v);
      (match x.upgrade_rollout_order with
      | None -> []
      | Some v -> upgrade_rollout_order_to_query (List.append path [ "UpgradeRolloutOrder" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.db_cluster_option_group_memberships with
      | None -> []
      | Some v ->
          db_cluster_option_group_memberships_to_query
            (List.append path [ "DBClusterOptionGroupMemberships" ])
            v);
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
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.custom_endpoints with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "CustomEndpoints" ]) v);
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
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
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

let invalid_db_shard_group_state_fault_to_query path (x : invalid_db_shard_group_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let stop_activity_stream_response_to_query path (x : stop_activity_stream_response) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> activity_stream_status_to_query (List.append path [ "Status" ]) v);
      (match x.kinesis_stream_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KinesisStreamName" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
    ]

let stop_activity_stream_request_to_query path (x : stop_activity_stream_request) =
  List.concat
    [
      (match x.apply_immediately with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ApplyImmediately" ]) v);
      string__to_query (List.append path [ "ResourceArn" ]) x.resource_arn;
    ]

let resource_not_found_fault_to_query path (x : resource_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let start_export_task_message_to_query path (x : start_export_task_message) =
  List.concat
    [
      (match x.export_only with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ExportOnly" ]) v);
      (match x.s3_prefix with
      | None -> []
      | Some v -> string__to_query (List.append path [ "S3Prefix" ]) v);
      string__to_query (List.append path [ "KmsKeyId" ]) x.kms_key_id;
      string__to_query (List.append path [ "IamRoleArn" ]) x.iam_role_arn;
      string__to_query (List.append path [ "S3BucketName" ]) x.s3_bucket_name;
      string__to_query (List.append path [ "SourceArn" ]) x.source_arn;
      string__to_query (List.append path [ "ExportTaskIdentifier" ]) x.export_task_identifier;
    ]

let kms_key_not_accessible_fault_to_query path (x : kms_key_not_accessible_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_s3_bucket_fault_to_query path (x : invalid_s3_bucket_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_export_source_state_fault_to_query path (x : invalid_export_source_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_export_only_fault_to_query path (x : invalid_export_only_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let iam_role_not_found_fault_to_query path (x : iam_role_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let iam_role_missing_permissions_fault_to_query path (x : iam_role_missing_permissions_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let export_task_already_exists_fault_to_query path (x : export_task_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_snapshot_not_found_fault_to_query path (x : db_snapshot_not_found_fault) =
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

let export_source_type_to_query path (x : export_source_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with CLUSTER -> "CLUSTER" | SNAPSHOT -> "SNAPSHOT")

let export_task_to_query path (x : export_task) =
  List.concat
    [
      (match x.source_type with
      | None -> []
      | Some v -> export_source_type_to_query (List.append path [ "SourceType" ]) v);
      (match x.warning_message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "WarningMessage" ]) v);
      (match x.failure_cause with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FailureCause" ]) v);
      (match x.total_extracted_data_in_g_b with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "TotalExtractedDataInGB" ]) v);
      (match x.percent_progress with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "PercentProgress" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.iam_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "IamRoleArn" ]) v);
      (match x.s3_prefix with
      | None -> []
      | Some v -> string__to_query (List.append path [ "S3Prefix" ]) v);
      (match x.s3_bucket with
      | None -> []
      | Some v -> string__to_query (List.append path [ "S3Bucket" ]) v);
      (match x.task_end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "TaskEndTime" ]) v);
      (match x.task_start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "TaskStartTime" ]) v);
      (match x.snapshot_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "SnapshotTime" ]) v);
      (match x.export_only with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ExportOnly" ]) v);
      (match x.source_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceArn" ]) v);
      (match x.export_task_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ExportTaskIdentifier" ]) v);
    ]

let start_db_instance_result_to_query path (x : start_db_instance_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let start_db_instance_message_to_query path (x : start_db_instance_message) =
  List.concat
    [ string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier ]

let start_db_instance_automated_backups_replication_result_to_query path
    (x : start_db_instance_automated_backups_replication_result) =
  List.concat
    [
      (match x.db_instance_automated_backup with
      | None -> []
      | Some v ->
          db_instance_automated_backup_to_query (List.append path [ "DBInstanceAutomatedBackup" ]) v);
    ]

let start_db_instance_automated_backups_replication_message_to_query path
    (x : start_db_instance_automated_backups_replication_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.pre_signed_url with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "PreSignedUrl" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      string__to_query (List.append path [ "SourceDBInstanceArn" ]) x.source_db_instance_arn;
    ]

let invalid_db_instance_automated_backup_state_fault_to_query path
    (x : invalid_db_instance_automated_backup_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_instance_automated_backup_quota_exceeded_fault_to_query path
    (x : db_instance_automated_backup_quota_exceeded_fault) =
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

let insufficient_db_instance_capacity_fault_to_query path
    (x : insufficient_db_instance_capacity_fault) =
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

let db_subnet_group_does_not_cover_enough_a_zs_to_query path
    (x : db_subnet_group_does_not_cover_enough_a_zs) =
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

let start_activity_stream_response_to_query path (x : start_activity_stream_response) =
  List.concat
    [
      (match x.apply_immediately with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ApplyImmediately" ]) v);
      (match x.engine_native_audit_fields_included with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EngineNativeAuditFieldsIncluded" ]) v);
      (match x.mode with
      | None -> []
      | Some v -> activity_stream_mode_to_query (List.append path [ "Mode" ]) v);
      (match x.status with
      | None -> []
      | Some v -> activity_stream_status_to_query (List.append path [ "Status" ]) v);
      (match x.kinesis_stream_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KinesisStreamName" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
    ]

let start_activity_stream_request_to_query path (x : start_activity_stream_request) =
  List.concat
    [
      (match x.engine_native_audit_fields_included with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EngineNativeAuditFieldsIncluded" ]) v);
      (match x.apply_immediately with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ApplyImmediately" ]) v);
      string__to_query (List.append path [ "KmsKeyId" ]) x.kms_key_id;
      activity_stream_mode_to_query (List.append path [ "Mode" ]) x.mode;
      string__to_query (List.append path [ "ResourceArn" ]) x.resource_arn;
    ]

let source_type_to_query path (x : source_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Zero_etl -> "zero-etl"
    | Db_shard_group -> "db-shard-group"
    | Blue_green_deployment -> "blue-green-deployment"
    | Db_proxy -> "db-proxy"
    | Custom_engine_version -> "custom-engine-version"
    | Db_cluster_snapshot -> "db-cluster-snapshot"
    | Db_cluster -> "db-cluster"
    | Db_snapshot -> "db-snapshot"
    | Db_security_group -> "db-security-group"
    | Db_parameter_group -> "db-parameter-group"
    | Db_instance -> "db-instance")

let source_region_to_query path (x : source_region) =
  List.concat
    [
      (match x.supports_db_instance_automated_backups_replication with
      | None -> []
      | Some v ->
          boolean__to_query (List.append path [ "SupportsDBInstanceAutomatedBackupsReplication" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.region_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RegionName" ]) v);
    ]

let source_region_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SourceRegion" source_region_to_query path xs

let source_region_message_to_query path (x : source_region_message) =
  List.concat
    [
      (match x.source_regions with
      | None -> []
      | Some v -> source_region_list_to_query (List.append path [ "SourceRegions" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let source_not_found_fault_to_query path (x : source_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let source_ids_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "SourceId" string__to_query path xs

let source_database_not_supported_fault_to_query path (x : source_database_not_supported_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let source_cluster_not_supported_fault_to_query path (x : source_cluster_not_supported_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let source_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

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
      (match x.seconds_until_auto_pause with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SecondsUntilAutoPause" ]) v);
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

let serverless_v2_platform_version_info_to_query path (x : serverless_v2_platform_version_info) =
  List.concat
    [
      (match x.is_default with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsDefault" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.serverless_v2_features_support with
      | None -> []
      | Some v ->
          serverless_v2_features_support_to_query
            (List.append path [ "ServerlessV2FeaturesSupport" ])
            v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.serverless_v2_platform_version_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServerlessV2PlatformVersionDescription" ]) v);
      (match x.serverless_v2_platform_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServerlessV2PlatformVersion" ]) v);
    ]

let serverless_v2_platform_version_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    serverless_v2_platform_version_info_to_query path xs

let serverless_v2_platform_versions_message_to_query path
    (x : serverless_v2_platform_versions_message) =
  List.concat
    [
      (match x.serverless_v2_platform_versions with
      | None -> []
      | Some v ->
          serverless_v2_platform_version_list_to_query
            (List.append path [ "ServerlessV2PlatformVersions" ])
            v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let scaling_configuration_to_query path (x : scaling_configuration) =
  List.concat
    [
      (match x.seconds_before_timeout with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SecondsBeforeTimeout" ]) v);
      (match x.timeout_action with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TimeoutAction" ]) v);
      (match x.seconds_until_auto_pause with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SecondsUntilAutoPause" ]) v);
      (match x.auto_pause with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoPause" ]) v);
      (match x.max_capacity with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxCapacity" ]) v);
      (match x.min_capacity with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MinCapacity" ]) v);
    ]

let scalar_reference_details_to_query path (x : scalar_reference_details) =
  List.concat
    [
      (match x.value with None -> [] | Some v -> double_to_query (List.append path [ "Value" ]) v);
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

let ec2_security_group_to_query path (x : ec2_security_group) =
  List.concat
    [
      (match x.ec2_security_group_owner_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupOwnerId" ]) v);
      (match x.ec2_security_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupId" ]) v);
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

let ip_range_to_query path (x : ip_range) =
  List.concat
    [
      (match x.cidri_p with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CIDRIP" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
    ]

let ip_range_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "IPRange" ip_range_to_query path xs

let db_security_group_to_query path (x : db_security_group) =
  List.concat
    [
      (match x.db_security_group_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSecurityGroupArn" ]) v);
      (match x.ip_ranges with
      | None -> []
      | Some v -> ip_range_list_to_query (List.append path [ "IPRanges" ]) v);
      (match x.ec2_security_groups with
      | None -> []
      | Some v -> ec2_security_group_list_to_query (List.append path [ "EC2SecurityGroups" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.db_security_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSecurityGroupDescription" ]) v);
      (match x.db_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSecurityGroupName" ]) v);
      (match x.owner_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OwnerId" ]) v);
    ]

let revoke_db_security_group_ingress_result_to_query path
    (x : revoke_db_security_group_ingress_result) =
  List.concat
    [
      (match x.db_security_group with
      | None -> []
      | Some v -> db_security_group_to_query (List.append path [ "DBSecurityGroup" ]) v);
    ]

let revoke_db_security_group_ingress_message_to_query path
    (x : revoke_db_security_group_ingress_message) =
  List.concat
    [
      (match x.ec2_security_group_owner_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupOwnerId" ]) v);
      (match x.ec2_security_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupId" ]) v);
      (match x.ec2_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupName" ]) v);
      (match x.cidri_p with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CIDRIP" ]) v);
      string__to_query (List.append path [ "DBSecurityGroupName" ]) x.db_security_group_name;
    ]

let invalid_db_security_group_state_fault_to_query path (x : invalid_db_security_group_state_fault)
    =
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

let restore_db_instance_to_point_in_time_result_to_query path
    (x : restore_db_instance_to_point_in_time_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let restore_db_instance_to_point_in_time_message_to_query path
    (x : restore_db_instance_to_point_in_time_message) =
  List.concat
    [
      (match x.master_user_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserSecretKmsKeyId" ]) v);
      (match x.manage_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterUserPassword" ]) v);
      (match x.tag_specifications with
      | None -> []
      | Some v -> tag_specification_list_to_query (List.append path [ "TagSpecifications" ]) v);
      (match x.additional_storage_volumes with
      | None -> []
      | Some v ->
          additional_storage_volumes_list_to_query
            (List.append path [ "AdditionalStorageVolumes" ])
            v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.dedicated_log_volume with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DedicatedLogVolume" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.custom_iam_instance_profile with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomIamInstanceProfile" ]) v);
      (match x.backup_target with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BackupTarget" ]) v);
      (match x.source_db_instance_automated_backups_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDBInstanceAutomatedBackupsArn" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.enable_customer_owned_ip with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableCustomerOwnedIp" ]) v);
      (match x.max_allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxAllocatedStorage" ]) v);
      (match x.source_dbi_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDbiResourceId" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
      (match x.use_default_processor_features with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "UseDefaultProcessorFeatures" ]) v);
      (match x.processor_features with
      | None -> []
      | Some v -> processor_feature_list_to_query (List.append path [ "ProcessorFeatures" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.domain_dns_ips with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DomainDnsIps" ]) v);
      (match x.domain_auth_secret_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainAuthSecretArn" ]) v);
      (match x.domain_ou with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainOu" ]) v);
      (match x.domain_fqdn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainFqdn" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.tde_credential_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "TdeCredentialPassword" ]) v);
      (match x.tde_credential_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TdeCredentialArn" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBName" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.use_latest_restorable_time with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "UseLatestRestorableTime" ]) v);
      (match x.restore_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "RestoreTime" ]) v);
      string__to_query
        (List.append path [ "TargetDBInstanceIdentifier" ])
        x.target_db_instance_identifier;
      (match x.source_db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDBInstanceIdentifier" ]) v);
    ]

let provisioned_iops_not_available_in_az_fault_to_query path
    (x : provisioned_iops_not_available_in_az_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let point_in_time_restore_not_enabled_fault_to_query path
    (x : point_in_time_restore_not_enabled_fault) =
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

let network_type_not_supported_to_query path (x : network_type_not_supported) =
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

let instance_quota_exceeded_fault_to_query path (x : instance_quota_exceeded_fault) =
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

let db_parameter_group_not_found_fault_to_query path (x : db_parameter_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_instance_automated_backup_not_found_fault_to_query path
    (x : db_instance_automated_backup_not_found_fault) =
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

let backup_policy_not_found_fault_to_query path (x : backup_policy_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let restore_db_instance_from_s3_result_to_query path (x : restore_db_instance_from_s3_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let db_security_group_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBSecurityGroupName" string__to_query path
    xs

let restore_db_instance_from_s3_message_to_query path (x : restore_db_instance_from_s3_message) =
  List.concat
    [
      (match x.tag_specifications with
      | None -> []
      | Some v -> tag_specification_list_to_query (List.append path [ "TagSpecifications" ]) v);
      (match x.additional_storage_volumes with
      | None -> []
      | Some v ->
          additional_storage_volumes_list_to_query
            (List.append path [ "AdditionalStorageVolumes" ])
            v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.dedicated_log_volume with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DedicatedLogVolume" ]) v);
      (match x.master_user_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserSecretKmsKeyId" ]) v);
      (match x.manage_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterUserPassword" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.max_allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxAllocatedStorage" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.use_default_processor_features with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "UseDefaultProcessorFeatures" ]) v);
      (match x.processor_features with
      | None -> []
      | Some v -> processor_feature_list_to_query (List.append path [ "ProcessorFeatures" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.performance_insights_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "PerformanceInsightsRetentionPeriod" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.database_insights_mode with
      | None -> []
      | Some v -> database_insights_mode_to_query (List.append path [ "DatabaseInsightsMode" ]) v);
      string__to_query (List.append path [ "S3IngestionRoleArn" ]) x.s3_ingestion_role_arn;
      (match x.s3_prefix with
      | None -> []
      | Some v -> string__to_query (List.append path [ "S3Prefix" ]) v);
      string__to_query (List.append path [ "S3BucketName" ]) x.s3_bucket_name;
      string__to_query (List.append path [ "SourceEngineVersion" ]) x.source_engine_version;
      string__to_query (List.append path [ "SourceEngine" ]) x.source_engine;
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.db_security_groups with
      | None -> []
      | Some v -> db_security_group_name_list_to_query (List.append path [ "DBSecurityGroups" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      string__to_query (List.append path [ "Engine" ]) x.engine;
      string__to_query (List.append path [ "DBInstanceClass" ]) x.db_instance_class;
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBName" ]) v);
    ]

let restore_db_instance_from_db_snapshot_result_to_query path
    (x : restore_db_instance_from_db_snapshot_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let restore_db_instance_from_db_snapshot_message_to_query path
    (x : restore_db_instance_from_db_snapshot_message) =
  List.concat
    [
      (match x.master_user_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserSecretKmsKeyId" ]) v);
      (match x.manage_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterUserPassword" ]) v);
      (match x.tag_specifications with
      | None -> []
      | Some v -> tag_specification_list_to_query (List.append path [ "TagSpecifications" ]) v);
      (match x.additional_storage_volumes with
      | None -> []
      | Some v ->
          additional_storage_volumes_list_to_query
            (List.append path [ "AdditionalStorageVolumes" ])
            v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.dedicated_log_volume with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DedicatedLogVolume" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.db_cluster_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterSnapshotIdentifier" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.custom_iam_instance_profile with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomIamInstanceProfile" ]) v);
      (match x.backup_target with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BackupTarget" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.enable_customer_owned_ip with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableCustomerOwnedIp" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
      (match x.use_default_processor_features with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "UseDefaultProcessorFeatures" ]) v);
      (match x.processor_features with
      | None -> []
      | Some v -> processor_feature_list_to_query (List.append path [ "ProcessorFeatures" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.domain_dns_ips with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DomainDnsIps" ]) v);
      (match x.domain_auth_secret_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainAuthSecretArn" ]) v);
      (match x.domain_ou with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainOu" ]) v);
      (match x.domain_fqdn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainFqdn" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.tde_credential_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "TdeCredentialPassword" ]) v);
      (match x.tde_credential_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TdeCredentialArn" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBName" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSnapshotIdentifier" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let invalid_db_snapshot_state_fault_to_query path (x : invalid_db_snapshot_state_fault) =
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
      (match x.enable_internet_access_gateway with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableInternetAccessGateway" ]) v);
      (match x.enable_vpc_networking with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableVPCNetworking" ]) v);
      (match x.tag_specifications with
      | None -> []
      | Some v -> tag_specification_list_to_query (List.append path [ "TagSpecifications" ]) v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.performance_insights_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "PerformanceInsightsRetentionPeriod" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.rds_custom_cluster_configuration with
      | None -> []
      | Some v ->
          rds_custom_cluster_configuration_to_query
            (List.append path [ "RdsCustomClusterConfiguration" ])
            v);
      (match x.engine_mode with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineMode" ]) v);
      (match x.scaling_configuration with
      | None -> []
      | Some v -> scaling_configuration_to_query (List.append path [ "ScalingConfiguration" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.source_db_cluster_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDbClusterResourceId" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.db_cluster_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterInstanceClass" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.backtrack_window with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "BacktrackWindow" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
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
      (match x.source_db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDBClusterIdentifier" ]) v);
      (match x.restore_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RestoreType" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
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

let db_cluster_automated_backup_not_found_fault_to_query path
    (x : db_cluster_automated_backup_not_found_fault) =
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
      (match x.enable_internet_access_gateway with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableInternetAccessGateway" ]) v);
      (match x.enable_vpc_networking with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableVPCNetworking" ]) v);
      (match x.tag_specifications with
      | None -> []
      | Some v -> tag_specification_list_to_query (List.append path [ "TagSpecifications" ]) v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.performance_insights_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "PerformanceInsightsRetentionPeriod" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.rds_custom_cluster_configuration with
      | None -> []
      | Some v ->
          rds_custom_cluster_configuration_to_query
            (List.append path [ "RdsCustomClusterConfiguration" ])
            v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.db_cluster_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterInstanceClass" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
      (match x.scaling_configuration with
      | None -> []
      | Some v -> scaling_configuration_to_query (List.append path [ "ScalingConfiguration" ]) v);
      (match x.engine_mode with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineMode" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.backtrack_window with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "BacktrackWindow" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
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

let restore_db_cluster_from_s3_result_to_query path (x : restore_db_cluster_from_s3_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let restore_db_cluster_from_s3_message_to_query path (x : restore_db_cluster_from_s3_message) =
  List.concat
    [
      (match x.tag_specifications with
      | None -> []
      | Some v -> tag_specification_list_to_query (List.append path [ "TagSpecifications" ]) v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
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
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.backtrack_window with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "BacktrackWindow" ]) v);
      string__to_query (List.append path [ "S3IngestionRoleArn" ]) x.s3_ingestion_role_arn;
      (match x.s3_prefix with
      | None -> []
      | Some v -> string__to_query (List.append path [ "S3Prefix" ]) v);
      string__to_query (List.append path [ "S3BucketName" ]) x.s3_bucket_name;
      string__to_query (List.append path [ "SourceEngineVersion" ]) x.source_engine_version;
      string__to_query (List.append path [ "SourceEngine" ]) x.source_engine;
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
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
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
      string__to_query (List.append path [ "MasterUsername" ]) x.master_username;
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
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
    ]

let invalid_db_subnet_group_state_fault_to_query path (x : invalid_db_subnet_group_state_fault) =
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

let potentially_sensitive_parameter_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let apply_method_to_query path (x : apply_method) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Pending_reboot -> "pending-reboot" | Immediate -> "immediate")

let parameter_to_query path (x : parameter) =
  List.concat
    [
      (match x.supported_engine_modes with
      | None -> []
      | Some v -> engine_mode_list_to_query (List.append path [ "SupportedEngineModes" ]) v);
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
      | Some v ->
          potentially_sensitive_parameter_value_to_query (List.append path [ "ParameterValue" ]) v);
      (match x.parameter_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ParameterName" ]) v);
    ]

let parameters_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Parameter" parameter_to_query path xs

let reset_db_parameter_group_message_to_query path (x : reset_db_parameter_group_message) =
  List.concat
    [
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
      (match x.reset_all_parameters with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ResetAllParameters" ]) v);
      string__to_query (List.append path [ "DBParameterGroupName" ]) x.db_parameter_group_name;
    ]

let invalid_db_parameter_group_state_fault_to_query path
    (x : invalid_db_parameter_group_state_fault) =
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

let db_cluster_parameter_group_name_message_to_query path
    (x : db_cluster_parameter_group_name_message) =
  List.concat
    [
      (match x.db_cluster_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterParameterGroupName" ]) v);
    ]

let reserved_db_instances_offering_not_found_fault_to_query path
    (x : reserved_db_instances_offering_not_found_fault) =
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

let reserved_db_instances_offering_to_query path (x : reserved_db_instances_offering) =
  List.concat
    [
      (match x.recurring_charges with
      | None -> []
      | Some v -> recurring_charge_list_to_query (List.append path [ "RecurringCharges" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "MultiAZ" ]) v);
      (match x.offering_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OfferingType" ]) v);
      (match x.product_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ProductDescription" ]) v);
      (match x.currency_code with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CurrencyCode" ]) v);
      (match x.usage_price with
      | None -> []
      | Some v -> double_to_query (List.append path [ "UsagePrice" ]) v);
      (match x.fixed_price with
      | None -> []
      | Some v -> double_to_query (List.append path [ "FixedPrice" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "Duration" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.reserved_db_instances_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedDBInstancesOfferingId" ]) v);
    ]

let reserved_db_instances_offering_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReservedDBInstancesOffering"
    reserved_db_instances_offering_to_query path xs

let reserved_db_instances_offering_message_to_query path
    (x : reserved_db_instances_offering_message) =
  List.concat
    [
      (match x.reserved_db_instances_offerings with
      | None -> []
      | Some v ->
          reserved_db_instances_offering_list_to_query
            (List.append path [ "ReservedDBInstancesOfferings" ])
            v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let reserved_db_instance_quota_exceeded_fault_to_query path
    (x : reserved_db_instance_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let reserved_db_instance_not_found_fault_to_query path (x : reserved_db_instance_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let reserved_db_instance_to_query path (x : reserved_db_instance) =
  List.concat
    [
      (match x.lease_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LeaseId" ]) v);
      (match x.reserved_db_instance_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedDBInstanceArn" ]) v);
      (match x.recurring_charges with
      | None -> []
      | Some v -> recurring_charge_list_to_query (List.append path [ "RecurringCharges" ]) v);
      (match x.state with
      | None -> []
      | Some v -> string__to_query (List.append path [ "State" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "MultiAZ" ]) v);
      (match x.offering_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OfferingType" ]) v);
      (match x.product_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ProductDescription" ]) v);
      (match x.db_instance_count with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "DBInstanceCount" ]) v);
      (match x.currency_code with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CurrencyCode" ]) v);
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
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.reserved_db_instances_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedDBInstancesOfferingId" ]) v);
      (match x.reserved_db_instance_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedDBInstanceId" ]) v);
    ]

let reserved_db_instance_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ReservedDBInstance"
    reserved_db_instance_to_query path xs

let reserved_db_instance_message_to_query path (x : reserved_db_instance_message) =
  List.concat
    [
      (match x.reserved_db_instances with
      | None -> []
      | Some v -> reserved_db_instance_list_to_query (List.append path [ "ReservedDBInstances" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let reserved_db_instance_already_exists_fault_to_query path
    (x : reserved_db_instance_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let key_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let remove_tags_from_resource_message_to_query path (x : remove_tags_from_resource_message) =
  List.concat
    [
      key_list_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      string__to_query (List.append path [ "ResourceName" ]) x.resource_name;
    ]

let invalid_db_cluster_endpoint_state_fault_to_query path
    (x : invalid_db_cluster_endpoint_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integration_not_found_fault_to_query path (x : integration_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_snapshot_tenant_database_not_found_fault_to_query path
    (x : db_snapshot_tenant_database_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_shard_group_not_found_fault_to_query path (x : db_shard_group_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_proxy_target_group_not_found_fault_to_query path (x : db_proxy_target_group_not_found_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_proxy_not_found_fault_to_query path (x : db_proxy_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_proxy_endpoint_not_found_fault_to_query path (x : db_proxy_endpoint_not_found_fault) =
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

let remove_role_from_db_instance_message_to_query path (x : remove_role_from_db_instance_message) =
  List.concat
    [
      string__to_query (List.append path [ "FeatureName" ]) x.feature_name;
      string__to_query (List.append path [ "RoleArn" ]) x.role_arn;
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let db_instance_role_not_found_fault_to_query path (x : db_instance_role_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let remove_role_from_db_cluster_message_to_query path (x : remove_role_from_db_cluster_message) =
  List.concat
    [
      (match x.feature_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FeatureName" ]) v);
      string__to_query (List.append path [ "RoleArn" ]) x.role_arn;
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
    ]

let db_cluster_role_not_found_fault_to_query path (x : db_cluster_role_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
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

let register_db_proxy_targets_response_to_query path (x : register_db_proxy_targets_response) =
  List.concat
    [
      (match x.db_proxy_targets with
      | None -> []
      | Some v -> target_list_to_query (List.append path [ "DBProxyTargets" ]) v);
    ]

let db_proxy_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let db_proxy_target_group_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let register_db_proxy_targets_request_to_query path (x : register_db_proxy_targets_request) =
  List.concat
    [
      (match x.db_cluster_identifiers with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DBClusterIdentifiers" ]) v);
      (match x.db_instance_identifiers with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DBInstanceIdentifiers" ]) v);
      (match x.target_group_name with
      | None -> []
      | Some v -> db_proxy_target_group_name_to_query (List.append path [ "TargetGroupName" ]) v);
      db_proxy_name_to_query (List.append path [ "DBProxyName" ]) x.db_proxy_name;
    ]

let invalid_db_proxy_state_fault_to_query path (x : invalid_db_proxy_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let insufficient_available_i_ps_in_subnet_fault_to_query path
    (x : insufficient_available_i_ps_in_subnet_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_proxy_target_already_registered_fault_to_query path
    (x : db_proxy_target_already_registered_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let reference_details_to_query path (x : reference_details) =
  List.concat
    [
      (match x.scalar_reference_details with
      | None -> []
      | Some v ->
          scalar_reference_details_to_query (List.append path [ "ScalarReferenceDetails" ]) v);
    ]

let recommended_action_update_to_query path (x : recommended_action_update) =
  List.concat
    [
      string__to_query (List.append path [ "Status" ]) x.status;
      string__to_query (List.append path [ "ActionId" ]) x.action_id;
    ]

let recommended_action_update_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" recommended_action_update_to_query
    path xs

let recommended_action_parameter_to_query path (x : recommended_action_parameter) =
  List.concat
    [
      (match x.value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Value" ]) v);
      (match x.key with None -> [] | Some v -> string__to_query (List.append path [ "Key" ]) v);
    ]

let recommended_action_parameter_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    recommended_action_parameter_to_query path xs

let metric_reference_to_query path (x : metric_reference) =
  List.concat
    [
      (match x.reference_details with
      | None -> []
      | Some v -> reference_details_to_query (List.append path [ "ReferenceDetails" ]) v);
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
    ]

let metric_reference_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_reference_to_query path xs

let performance_insights_metric_dimension_group_to_query path
    (x : performance_insights_metric_dimension_group) =
  List.concat
    [
      (match x.limit with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "Limit" ]) v);
      (match x.group with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Group" ]) v);
      (match x.dimensions with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "Dimensions" ]) v);
    ]

let performance_insights_metric_query_to_query path (x : performance_insights_metric_query) =
  List.concat
    [
      (match x.metric with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Metric" ]) v);
      (match x.group_by with
      | None -> []
      | Some v ->
          performance_insights_metric_dimension_group_to_query (List.append path [ "GroupBy" ]) v);
    ]

let metric_query_to_query path (x : metric_query) =
  List.concat
    [
      (match x.performance_insights_metric_query with
      | None -> []
      | Some v ->
          performance_insights_metric_query_to_query
            (List.append path [ "PerformanceInsightsMetricQuery" ])
            v);
    ]

let metric_to_query path (x : metric) =
  List.concat
    [
      (match x.metric_query with
      | None -> []
      | Some v -> metric_query_to_query (List.append path [ "MetricQuery" ]) v);
      (match x.statistics_details with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StatisticsDetails" ]) v);
      (match x.references with
      | None -> []
      | Some v -> metric_reference_list_to_query (List.append path [ "References" ]) v);
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
    ]

let metric_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" metric_to_query path xs

let performance_issue_details_to_query path (x : performance_issue_details) =
  List.concat
    [
      (match x.analysis with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Analysis" ]) v);
      (match x.metrics with
      | None -> []
      | Some v -> metric_list_to_query (List.append path [ "Metrics" ]) v);
      (match x.end_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "EndTime" ]) v);
      (match x.start_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "StartTime" ]) v);
    ]

let issue_details_to_query path (x : issue_details) =
  List.concat
    [
      (match x.performance_issue_details with
      | None -> []
      | Some v ->
          performance_issue_details_to_query (List.append path [ "PerformanceIssueDetails" ]) v);
    ]

let context_attribute_to_query path (x : context_attribute) =
  List.concat
    [
      (match x.value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Value" ]) v);
      (match x.key with None -> [] | Some v -> string__to_query (List.append path [ "Key" ]) v);
    ]

let context_attribute_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" context_attribute_to_query path xs

let recommended_action_to_query path (x : recommended_action) =
  List.concat
    [
      (match x.context_attributes with
      | None -> []
      | Some v -> context_attribute_list_to_query (List.append path [ "ContextAttributes" ]) v);
      (match x.issue_details with
      | None -> []
      | Some v -> issue_details_to_query (List.append path [ "IssueDetails" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.apply_modes with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ApplyModes" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> recommended_action_parameter_list_to_query (List.append path [ "Parameters" ]) v);
      (match x.operation with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Operation" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.title with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Title" ]) v);
      (match x.action_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ActionId" ]) v);
    ]

let recommended_action_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" recommended_action_to_query path xs

let db_shard_group_identifier_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let reboot_db_shard_group_message_to_query path (x : reboot_db_shard_group_message) =
  List.concat
    [
      db_shard_group_identifier_to_query
        (List.append path [ "DBShardGroupIdentifier" ])
        x.db_shard_group_identifier;
    ]

let db_shard_group_to_query path (x : db_shard_group) =
  List.concat
    [
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.db_shard_group_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBShardGroupArn" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.compute_redundancy with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ComputeRedundancy" ]) v);
      (match x.min_ac_u with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinACU" ]) v);
      (match x.max_ac_u with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxACU" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.db_shard_group_identifier with
      | None -> []
      | Some v ->
          db_shard_group_identifier_to_query (List.append path [ "DBShardGroupIdentifier" ]) v);
      (match x.db_shard_group_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBShardGroupResourceId" ]) v);
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

let reboot_db_cluster_result_to_query path (x : reboot_db_cluster_result) =
  List.concat
    [
      (match x.db_cluster with
      | None -> []
      | Some v -> db_cluster_to_query (List.append path [ "DBCluster" ]) v);
    ]

let reboot_db_cluster_message_to_query path (x : reboot_db_cluster_message) =
  List.concat
    [ string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier ]

let purchase_reserved_db_instances_offering_result_to_query path
    (x : purchase_reserved_db_instances_offering_result) =
  List.concat
    [
      (match x.reserved_db_instance with
      | None -> []
      | Some v -> reserved_db_instance_to_query (List.append path [ "ReservedDBInstance" ]) v);
    ]

let purchase_reserved_db_instances_offering_message_to_query path
    (x : purchase_reserved_db_instances_offering_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.db_instance_count with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "DBInstanceCount" ]) v);
      (match x.reserved_db_instance_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedDBInstanceId" ]) v);
      string__to_query
        (List.append path [ "ReservedDBInstancesOfferingId" ])
        x.reserved_db_instances_offering_id;
    ]

let promote_read_replica_result_to_query path (x : promote_read_replica_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let promote_read_replica_message_to_query path (x : promote_read_replica_message) =
  List.concat
    [
      (match x.tag_specifications with
      | None -> []
      | Some v -> tag_specification_list_to_query (List.append path [ "TagSpecifications" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
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

let potentially_sensitive_option_setting_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

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

let activity_stream_mode_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let available_additional_storage_volumes_option_to_query path
    (x : available_additional_storage_volumes_option) =
  List.concat
    [
      (match x.max_storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxStorageThroughput" ]) v);
      (match x.min_storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MinStorageThroughput" ]) v);
      (match x.max_iops_per_gib with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxIopsPerGib" ]) v);
      (match x.min_iops_per_gib with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinIopsPerGib" ]) v);
      (match x.max_iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxIops" ]) v);
      (match x.min_iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MinIops" ]) v);
      (match x.max_storage_size with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxStorageSize" ]) v);
      (match x.min_storage_size with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MinStorageSize" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.supports_iops with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsIops" ]) v);
      (match x.supports_storage_throughput with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsStorageThroughput" ]) v);
      (match x.supports_storage_autoscaling with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsStorageAutoscaling" ]) v);
    ]

let available_additional_storage_volumes_option_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AvailableAdditionalStorageVolumesOption"
    available_additional_storage_volumes_option_to_query path xs

let orderable_db_instance_option_to_query path (x : orderable_db_instance_option) =
  List.concat
    [
      (match x.available_additional_storage_volumes_options with
      | None -> []
      | Some v ->
          available_additional_storage_volumes_option_list_to_query
            (List.append path [ "AvailableAdditionalStorageVolumesOptions" ])
            v);
      (match x.supports_http_endpoint with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsHttpEndpoint" ]) v);
      (match x.supports_additional_storage_volumes with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "SupportsAdditionalStorageVolumes" ]) v);
      (match x.supports_dedicated_log_volume with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsDedicatedLogVolume" ]) v);
      (match x.supports_clusters with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsClusters" ]) v);
      (match x.supported_network_types with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "SupportedNetworkTypes" ]) v);
      (match x.supports_global_databases with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsGlobalDatabases" ]) v);
      (match x.supported_activity_stream_modes with
      | None -> []
      | Some v ->
          activity_stream_mode_list_to_query (List.append path [ "SupportedActivityStreamModes" ]) v);
      (match x.outpost_capable with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "OutpostCapable" ]) v);
      (match x.supports_kerberos_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "SupportsKerberosAuthentication" ]) v);
      (match x.supports_storage_autoscaling with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "SupportsStorageAutoscaling" ]) v);
      (match x.supported_engine_modes with
      | None -> []
      | Some v -> engine_mode_list_to_query (List.append path [ "SupportedEngineModes" ]) v);
      (match x.available_processor_features with
      | None -> []
      | Some v ->
          available_processor_feature_list_to_query
            (List.append path [ "AvailableProcessorFeatures" ])
            v);
      (match x.max_storage_throughput_per_iops with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxStorageThroughputPerIops" ]) v);
      (match x.min_storage_throughput_per_iops with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinStorageThroughputPerIops" ]) v);
      (match x.max_storage_throughput_per_db_instance with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "MaxStorageThroughputPerDbInstance" ]) v);
      (match x.min_storage_throughput_per_db_instance with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "MinStorageThroughputPerDbInstance" ]) v);
      (match x.max_iops_per_gib with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxIopsPerGib" ]) v);
      (match x.min_iops_per_gib with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinIopsPerGib" ]) v);
      (match x.max_iops_per_db_instance with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxIopsPerDbInstance" ]) v);
      (match x.min_iops_per_db_instance with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MinIopsPerDbInstance" ]) v);
      (match x.max_storage_size with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxStorageSize" ]) v);
      (match x.min_storage_size with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MinStorageSize" ]) v);
      (match x.supports_performance_insights with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsPerformanceInsights" ]) v);
      (match x.supports_iam_database_authentication with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsIAMDatabaseAuthentication" ]) v);
      (match x.supports_enhanced_monitoring with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsEnhancedMonitoring" ]) v);
      (match x.supports_storage_throughput with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsStorageThroughput" ]) v);
      (match x.supports_iops with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsIops" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.supports_storage_encryption with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsStorageEncryption" ]) v);
      (match x.vpc with None -> [] | Some v -> boolean__to_query (List.append path [ "Vpc" ]) v);
      (match x.read_replica_capable with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReadReplicaCapable" ]) v);
      (match x.multi_az_capable with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "MultiAZCapable" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zone_list_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.availability_zone_group with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZoneGroup" ]) v);
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

let option_setting_to_query path (x : option_setting) =
  List.concat
    [
      (match x.is_collection with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsCollection" ]) v);
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
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DefaultValue" ]) v);
      (match x.value with
      | None -> []
      | Some v ->
          potentially_sensitive_option_setting_value_to_query (List.append path [ "Value" ]) v);
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
    ]

let option_setting_configuration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OptionSetting" option_setting_to_query path
    xs

let option__to_query path (x : option_) =
  List.concat
    [
      (match x.vpc_security_group_memberships with
      | None -> []
      | Some v ->
          vpc_security_group_membership_list_to_query
            (List.append path [ "VpcSecurityGroupMemberships" ])
            v);
      (match x.db_security_group_memberships with
      | None -> []
      | Some v ->
          db_security_group_membership_list_to_query
            (List.append path [ "DBSecurityGroupMemberships" ])
            v);
      (match x.option_settings with
      | None -> []
      | Some v ->
          option_setting_configuration_list_to_query (List.append path [ "OptionSettings" ]) v);
      (match x.option_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionVersion" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.permanent with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Permanent" ]) v);
      (match x.persistent with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Persistent" ]) v);
      (match x.option_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionDescription" ]) v);
      (match x.option_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionName" ]) v);
    ]

let options_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Option" option__to_query path xs

let options_depended_on_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OptionName" string__to_query path xs

let options_conflicts_with_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OptionConflictName" string__to_query path xs

let option_version_to_query path (x : option_version) =
  List.concat
    [
      (match x.is_default with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsDefault" ]) v);
      (match x.version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Version" ]) v);
    ]

let option_settings_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OptionSetting" option_setting_to_query path
    xs

let option_names_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let option_group_to_query path (x : option_group) =
  List.concat
    [
      (match x.copy_timestamp with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CopyTimestamp" ]) v);
      (match x.source_account_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceAccountId" ]) v);
      (match x.source_option_group with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceOptionGroup" ]) v);
      (match x.option_group_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupArn" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.allows_vpc_and_non_vpc_instance_memberships with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AllowsVpcAndNonVpcInstanceMemberships" ]) v);
      (match x.options with
      | None -> []
      | Some v -> options_list_to_query (List.append path [ "Options" ]) v);
      (match x.major_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MajorEngineVersion" ]) v);
      (match x.engine_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineName" ]) v);
      (match x.option_group_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupDescription" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
    ]

let option_groups_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OptionGroup" option_group_to_query path xs

let option_groups_to_query path (x : option_groups) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.option_groups_list with
      | None -> []
      | Some v -> option_groups_list_to_query (List.append path [ "OptionGroupsList" ]) v);
    ]

let option_group_quota_exceeded_fault_to_query path (x : option_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let minimum_engine_version_per_allowed_value_to_query path
    (x : minimum_engine_version_per_allowed_value) =
  List.concat
    [
      (match x.minimum_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MinimumEngineVersion" ]) v);
      (match x.allowed_value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AllowedValue" ]) v);
    ]

let minimum_engine_version_per_allowed_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "MinimumEngineVersionPerAllowedValue"
    minimum_engine_version_per_allowed_value_to_query path xs

let option_group_option_setting_to_query path (x : option_group_option_setting) =
  List.concat
    [
      (match x.minimum_engine_version_per_allowed_value with
      | None -> []
      | Some v ->
          minimum_engine_version_per_allowed_value_list_to_query
            (List.append path [ "MinimumEngineVersionPerAllowedValue" ])
            v);
      (match x.is_required with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsRequired" ]) v);
      (match x.is_modifiable with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsModifiable" ]) v);
      (match x.allowed_values with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AllowedValues" ]) v);
      (match x.apply_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ApplyType" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DefaultValue" ]) v);
      (match x.setting_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SettingDescription" ]) v);
      (match x.setting_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SettingName" ]) v);
    ]

let option_group_option_settings_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OptionGroupOptionSetting"
    option_group_option_setting_to_query path xs

let option_group_option_versions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OptionVersion" option_version_to_query path
    xs

let option_group_option_to_query path (x : option_group_option) =
  List.concat
    [
      (match x.copyable_cross_account with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyableCrossAccount" ]) v);
      (match x.option_group_option_versions with
      | None -> []
      | Some v ->
          option_group_option_versions_list_to_query
            (List.append path [ "OptionGroupOptionVersions" ])
            v);
      (match x.option_group_option_settings with
      | None -> []
      | Some v ->
          option_group_option_settings_list_to_query
            (List.append path [ "OptionGroupOptionSettings" ])
            v);
      (match x.supports_option_version_downgrade with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "SupportsOptionVersionDowngrade" ]) v);
      (match x.vpc_only with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "VpcOnly" ]) v);
      (match x.requires_auto_minor_engine_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "RequiresAutoMinorEngineVersionUpgrade" ]) v);
      (match x.permanent with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Permanent" ]) v);
      (match x.persistent with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Persistent" ]) v);
      (match x.options_conflicts_with with
      | None -> []
      | Some v -> options_conflicts_with_to_query (List.append path [ "OptionsConflictsWith" ]) v);
      (match x.options_depended_on with
      | None -> []
      | Some v -> options_depended_on_to_query (List.append path [ "OptionsDependedOn" ]) v);
      (match x.default_port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "DefaultPort" ]) v);
      (match x.port_required with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "PortRequired" ]) v);
      (match x.minimum_required_minor_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MinimumRequiredMinorEngineVersion" ]) v);
      (match x.major_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MajorEngineVersion" ]) v);
      (match x.engine_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineName" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.name with None -> [] | Some v -> string__to_query (List.append path [ "Name" ]) v);
    ]

let option_group_options_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OptionGroupOption"
    option_group_option_to_query path xs

let option_group_options_message_to_query path (x : option_group_options_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.option_group_options with
      | None -> []
      | Some v -> option_group_options_list_to_query (List.append path [ "OptionGroupOptions" ]) v);
    ]

let option_group_already_exists_fault_to_query path (x : option_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let option_configuration_to_query path (x : option_configuration) =
  List.concat
    [
      (match x.option_settings with
      | None -> []
      | Some v -> option_settings_list_to_query (List.append path [ "OptionSettings" ]) v);
      (match x.vpc_security_group_memberships with
      | None -> []
      | Some v ->
          vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupMemberships" ]) v);
      (match x.db_security_group_memberships with
      | None -> []
      | Some v ->
          db_security_group_name_list_to_query (List.append path [ "DBSecurityGroupMemberships" ]) v);
      (match x.option_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionVersion" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      string__to_query (List.append path [ "OptionName" ]) x.option_name;
    ]

let option_configuration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "OptionConfiguration"
    option_configuration_to_query path xs

let modify_tenant_database_result_to_query path (x : modify_tenant_database_result) =
  List.concat
    [
      (match x.tenant_database with
      | None -> []
      | Some v -> tenant_database_to_query (List.append path [ "TenantDatabase" ]) v);
    ]

let modify_tenant_database_message_to_query path (x : modify_tenant_database_message) =
  List.concat
    [
      (match x.master_user_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserSecretKmsKeyId" ]) v);
      (match x.rotate_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "RotateMasterUserPassword" ]) v);
      (match x.manage_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterUserPassword" ]) v);
      (match x.new_tenant_db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NewTenantDBName" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
      string__to_query (List.append path [ "TenantDBName" ]) x.tenant_db_name;
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let modify_option_group_result_to_query path (x : modify_option_group_result) =
  List.concat
    [
      (match x.option_group with
      | None -> []
      | Some v -> option_group_to_query (List.append path [ "OptionGroup" ]) v);
    ]

let modify_option_group_message_to_query path (x : modify_option_group_message) =
  List.concat
    [
      (match x.apply_immediately with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ApplyImmediately" ]) v);
      (match x.options_to_remove with
      | None -> []
      | Some v -> option_names_list_to_query (List.append path [ "OptionsToRemove" ]) v);
      (match x.options_to_include with
      | None -> []
      | Some v -> option_configuration_list_to_query (List.append path [ "OptionsToInclude" ]) v);
      string__to_query (List.append path [ "OptionGroupName" ]) x.option_group_name;
    ]

let invalid_option_group_state_fault_to_query path (x : invalid_option_group_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integration_identifier_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let integration_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let data_filter_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let integration_description_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let modify_integration_message_to_query path (x : modify_integration_message) =
  List.concat
    [
      (match x.description with
      | None -> []
      | Some v -> integration_description_to_query (List.append path [ "Description" ]) v);
      (match x.data_filter with
      | None -> []
      | Some v -> data_filter_to_query (List.append path [ "DataFilter" ]) v);
      (match x.integration_name with
      | None -> []
      | Some v -> integration_name_to_query (List.append path [ "IntegrationName" ]) v);
      integration_identifier_to_query
        (List.append path [ "IntegrationIdentifier" ])
        x.integration_identifier;
    ]

let invalid_integration_state_fault_to_query path (x : invalid_integration_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integration_conflict_operation_fault_to_query path (x : integration_conflict_operation_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integration_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let encryption_context_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" string__to_query
    string__to_query path pairs

let integration_status_to_query path (x : integration_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NEEDS_ATTENTION -> "needs_attention"
    | SYNCING -> "syncing"
    | DELETING -> "deleting"
    | FAILED -> "failed"
    | MODIFYING -> "modifying"
    | ACTIVE -> "active"
    | CREATING -> "creating")

let integration_error_to_query path (x : integration_error) =
  List.concat
    [
      (match x.error_message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ErrorMessage" ]) v);
      string__to_query (List.append path [ "ErrorCode" ]) x.error_code;
    ]

let integration_error_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "IntegrationError" integration_error_to_query
    path xs

let integration_to_query path (x : integration) =
  List.concat
    [
      (match x.errors with
      | None -> []
      | Some v -> integration_error_list_to_query (List.append path [ "Errors" ]) v);
      (match x.create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreateTime" ]) v);
      (match x.description with
      | None -> []
      | Some v -> integration_description_to_query (List.append path [ "Description" ]) v);
      (match x.data_filter with
      | None -> []
      | Some v -> data_filter_to_query (List.append path [ "DataFilter" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.status with
      | None -> []
      | Some v -> integration_status_to_query (List.append path [ "Status" ]) v);
      (match x.additional_encryption_context with
      | None -> []
      | Some v ->
          encryption_context_map_to_query (List.append path [ "AdditionalEncryptionContext" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KMSKeyId" ]) v);
      (match x.integration_arn with
      | None -> []
      | Some v -> integration_arn_to_query (List.append path [ "IntegrationArn" ]) v);
      (match x.integration_name with
      | None -> []
      | Some v -> integration_name_to_query (List.append path [ "IntegrationName" ]) v);
      (match x.target_arn with
      | None -> []
      | Some v -> arn_to_query (List.append path [ "TargetArn" ]) v);
      (match x.source_arn with
      | None -> []
      | Some v -> source_arn_to_query (List.append path [ "SourceArn" ]) v);
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
      (match x.allow_major_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AllowMajorVersionUpgrade" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
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

let global_cluster_already_exists_fault_to_query path (x : global_cluster_already_exists_fault) =
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

let db_snapshot_to_query path (x : db_snapshot) =
  List.concat
    [
      (match x.snapshot_availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotAvailabilityZone" ]) v);
      (match x.additional_storage_volumes with
      | None -> []
      | Some v ->
          additional_storage_volumes_list_to_query
            (List.append path [ "AdditionalStorageVolumes" ])
            v);
      (match x.dedicated_log_volume with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "DedicatedLogVolume" ]) v);
      (match x.multi_tenant with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiTenant" ]) v);
      (match x.db_system_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSystemId" ]) v);
      (match x.snapshot_database_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "SnapshotDatabaseTime" ]) v);
      (match x.original_snapshot_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "OriginalSnapshotCreateTime" ]) v);
      (match x.snapshot_target with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotTarget" ]) v);
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.dbi_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbiResourceId" ]) v);
      (match x.processor_features with
      | None -> []
      | Some v -> processor_feature_list_to_query (List.append path [ "ProcessorFeatures" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
      (match x.timezone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Timezone" ]) v);
      (match x.db_snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSnapshotArn" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.storage_encryption_type with
      | None -> []
      | Some v -> storage_encryption_type_to_query (List.append path [ "StorageEncryptionType" ]) v);
      (match x.encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "Encrypted" ]) v);
      (match x.tde_credential_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TdeCredentialArn" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.source_db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDBSnapshotIdentifier" ]) v);
      (match x.source_region with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceRegion" ]) v);
      (match x.percent_progress with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "PercentProgress" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.snapshot_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotType" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.instance_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "InstanceCreateTime" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.snapshot_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "SnapshotCreateTime" ]) v);
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
      (match x.db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSnapshotIdentifier" ]) v);
    ]

let modify_db_snapshot_result_to_query path (x : modify_db_snapshot_result) =
  List.concat
    [
      (match x.db_snapshot with
      | None -> []
      | Some v -> db_snapshot_to_query (List.append path [ "DBSnapshot" ]) v);
    ]

let modify_db_snapshot_message_to_query path (x : modify_db_snapshot_message) =
  List.concat
    [
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      string__to_query (List.append path [ "DBSnapshotIdentifier" ]) x.db_snapshot_identifier;
    ]

let attribute_value_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AttributeValue" string__to_query path xs

let db_snapshot_attribute_to_query path (x : db_snapshot_attribute) =
  List.concat
    [
      (match x.attribute_values with
      | None -> []
      | Some v -> attribute_value_list_to_query (List.append path [ "AttributeValues" ]) v);
      (match x.attribute_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AttributeName" ]) v);
    ]

let db_snapshot_attribute_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBSnapshotAttribute"
    db_snapshot_attribute_to_query path xs

let db_snapshot_attributes_result_to_query path (x : db_snapshot_attributes_result) =
  List.concat
    [
      (match x.db_snapshot_attributes with
      | None -> []
      | Some v ->
          db_snapshot_attribute_list_to_query (List.append path [ "DBSnapshotAttributes" ]) v);
      (match x.db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSnapshotIdentifier" ]) v);
    ]

let modify_db_snapshot_attribute_result_to_query path (x : modify_db_snapshot_attribute_result) =
  List.concat
    [
      (match x.db_snapshot_attributes_result with
      | None -> []
      | Some v ->
          db_snapshot_attributes_result_to_query
            (List.append path [ "DBSnapshotAttributesResult" ])
            v);
    ]

let modify_db_snapshot_attribute_message_to_query path (x : modify_db_snapshot_attribute_message) =
  List.concat
    [
      (match x.values_to_remove with
      | None -> []
      | Some v -> attribute_value_list_to_query (List.append path [ "ValuesToRemove" ]) v);
      (match x.values_to_add with
      | None -> []
      | Some v -> attribute_value_list_to_query (List.append path [ "ValuesToAdd" ]) v);
      string__to_query (List.append path [ "AttributeName" ]) x.attribute_name;
      string__to_query (List.append path [ "DBSnapshotIdentifier" ]) x.db_snapshot_identifier;
    ]

let modify_db_shard_group_message_to_query path (x : modify_db_shard_group_message) =
  List.concat
    [
      (match x.compute_redundancy with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ComputeRedundancy" ]) v);
      (match x.min_ac_u with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinACU" ]) v);
      (match x.max_ac_u with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MaxACU" ]) v);
      db_shard_group_identifier_to_query
        (List.append path [ "DBShardGroupIdentifier" ])
        x.db_shard_group_identifier;
    ]

let db_shard_group_already_exists_fault_to_query path (x : db_shard_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_db_recommendation_message_to_query path (x : modify_db_recommendation_message) =
  List.concat
    [
      (match x.recommended_action_updates with
      | None -> []
      | Some v ->
          recommended_action_update_list_to_query
            (List.append path [ "RecommendedActionUpdates" ])
            v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.locale with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Locale" ]) v);
      string__to_query (List.append path [ "RecommendationId" ]) x.recommendation_id;
    ]

let doc_link_to_query path (x : doc_link) =
  List.concat
    [
      (match x.url with None -> [] | Some v -> string__to_query (List.append path [ "Url" ]) v);
      (match x.text with None -> [] | Some v -> string__to_query (List.append path [ "Text" ]) v);
    ]

let doc_link_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" doc_link_to_query path xs

let db_recommendation_to_query path (x : db_recommendation) =
  List.concat
    [
      (match x.issue_details with
      | None -> []
      | Some v -> issue_details_to_query (List.append path [ "IssueDetails" ]) v);
      (match x.links with
      | None -> []
      | Some v -> doc_link_list_to_query (List.append path [ "Links" ]) v);
      (match x.additional_info with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AdditionalInfo" ]) v);
      (match x.impact with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Impact" ]) v);
      (match x.type_recommendation with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TypeRecommendation" ]) v);
      (match x.type_detection with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TypeDetection" ]) v);
      (match x.source with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Source" ]) v);
      (match x.category with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Category" ]) v);
      (match x.recommended_actions with
      | None -> []
      | Some v -> recommended_action_list_to_query (List.append path [ "RecommendedActions" ]) v);
      (match x.reason with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Reason" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.recommendation with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Recommendation" ]) v);
      (match x.detection with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Detection" ]) v);
      (match x.updated_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "UpdatedTime" ]) v);
      (match x.created_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreatedTime" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.resource_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceArn" ]) v);
      (match x.severity with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Severity" ]) v);
      (match x.type_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TypeId" ]) v);
      (match x.recommendation_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RecommendationId" ]) v);
    ]

let db_recommendation_message_to_query path (x : db_recommendation_message) =
  List.concat
    [
      (match x.db_recommendation with
      | None -> []
      | Some v -> db_recommendation_to_query (List.append path [ "DBRecommendation" ]) v);
    ]

let modify_db_proxy_target_group_response_to_query path (x : modify_db_proxy_target_group_response)
    =
  List.concat
    [
      (match x.db_proxy_target_group with
      | None -> []
      | Some v -> db_proxy_target_group_to_query (List.append path [ "DBProxyTargetGroup" ]) v);
    ]

let connection_pool_configuration_to_query path (x : connection_pool_configuration) =
  List.concat
    [
      (match x.init_query with
      | None -> []
      | Some v -> operator_sensitive_string_to_query (List.append path [ "InitQuery" ]) v);
      (match x.session_pinning_filters with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "SessionPinningFilters" ]) v);
      (match x.connection_borrow_timeout with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ConnectionBorrowTimeout" ]) v);
      (match x.max_idle_connections_percent with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxIdleConnectionsPercent" ]) v);
      (match x.max_connections_percent with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxConnectionsPercent" ]) v);
    ]

let modify_db_proxy_target_group_request_to_query path (x : modify_db_proxy_target_group_request) =
  List.concat
    [
      (match x.new_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NewName" ]) v);
      (match x.connection_pool_config with
      | None -> []
      | Some v ->
          connection_pool_configuration_to_query (List.append path [ "ConnectionPoolConfig" ]) v);
      db_proxy_name_to_query (List.append path [ "DBProxyName" ]) x.db_proxy_name;
      db_proxy_target_group_name_to_query
        (List.append path [ "TargetGroupName" ])
        x.target_group_name;
    ]

let db_proxy_status_to_query path (x : db_proxy_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | REACTIVATING -> "reactivating"
    | SUSPENDING -> "suspending"
    | SUSPENDED -> "suspended"
    | DELETING -> "deleting"
    | CREATING -> "creating"
    | INSUFFICIENT_RESOURCE_LIMITS -> "insufficient-resource-limits"
    | INCOMPATIBLE_NETWORK -> "incompatible-network"
    | MODIFYING -> "modifying"
    | AVAILABLE -> "available")

let endpoint_network_type_to_query path (x : endpoint_network_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with DUAL -> "DUAL" | IPV6 -> "IPV6" | IPV4 -> "IPV4")

let db_proxy_to_query path (x : db_proxy) =
  List.concat
    [
      (match x.target_connection_network_type with
      | None -> []
      | Some v ->
          target_connection_network_type_to_query
            (List.append path [ "TargetConnectionNetworkType" ])
            v);
      (match x.endpoint_network_type with
      | None -> []
      | Some v -> endpoint_network_type_to_query (List.append path [ "EndpointNetworkType" ]) v);
      (match x.updated_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "UpdatedDate" ]) v);
      (match x.created_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreatedDate" ]) v);
      (match x.debug_logging with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "DebugLogging" ]) v);
      (match x.idle_client_timeout with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "IdleClientTimeout" ]) v);
      (match x.require_tl_s with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "RequireTLS" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RoleArn" ]) v);
      (match x.auth with
      | None -> []
      | Some v -> user_auth_config_info_list_to_query (List.append path [ "Auth" ]) v);
      (match x.default_auth_scheme with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DefaultAuthScheme" ]) v);
      (match x.vpc_subnet_ids with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "VpcSubnetIds" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.engine_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineFamily" ]) v);
      (match x.status with
      | None -> []
      | Some v -> db_proxy_status_to_query (List.append path [ "Status" ]) v);
      (match x.db_proxy_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBProxyArn" ]) v);
      (match x.db_proxy_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBProxyName" ]) v);
    ]

let modify_db_proxy_response_to_query path (x : modify_db_proxy_response) =
  List.concat
    [
      (match x.db_proxy with
      | None -> []
      | Some v -> db_proxy_to_query (List.append path [ "DBProxy" ]) v);
    ]

let default_auth_scheme_to_query path (x : default_auth_scheme) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with NONE -> "NONE" | IAM_AUTH -> "IAM_AUTH")

let modify_db_proxy_request_to_query path (x : modify_db_proxy_request) =
  List.concat
    [
      (match x.security_groups with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "SecurityGroups" ]) v);
      (match x.role_arn with
      | None -> []
      | Some v -> arn_to_query (List.append path [ "RoleArn" ]) v);
      (match x.debug_logging with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DebugLogging" ]) v);
      (match x.idle_client_timeout with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "IdleClientTimeout" ]) v);
      (match x.require_tl_s with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "RequireTLS" ]) v);
      (match x.auth with
      | None -> []
      | Some v -> user_auth_config_list_to_query (List.append path [ "Auth" ]) v);
      (match x.default_auth_scheme with
      | None -> []
      | Some v -> default_auth_scheme_to_query (List.append path [ "DefaultAuthScheme" ]) v);
      (match x.new_db_proxy_name with
      | None -> []
      | Some v -> db_proxy_name_to_query (List.append path [ "NewDBProxyName" ]) v);
      db_proxy_name_to_query (List.append path [ "DBProxyName" ]) x.db_proxy_name;
    ]

let db_proxy_endpoint_status_to_query path (x : db_proxy_endpoint_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | DELETING -> "deleting"
    | CREATING -> "creating"
    | INSUFFICIENT_RESOURCE_LIMITS -> "insufficient-resource-limits"
    | INCOMPATIBLE_NETWORK -> "incompatible-network"
    | MODIFYING -> "modifying"
    | AVAILABLE -> "available")

let db_proxy_endpoint_target_role_to_query path (x : db_proxy_endpoint_target_role) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with READ_ONLY -> "READ_ONLY" | READ_WRITE -> "READ_WRITE")

let db_proxy_endpoint_to_query path (x : db_proxy_endpoint) =
  List.concat
    [
      (match x.endpoint_network_type with
      | None -> []
      | Some v -> endpoint_network_type_to_query (List.append path [ "EndpointNetworkType" ]) v);
      (match x.is_default with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IsDefault" ]) v);
      (match x.target_role with
      | None -> []
      | Some v -> db_proxy_endpoint_target_role_to_query (List.append path [ "TargetRole" ]) v);
      (match x.created_date with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreatedDate" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.vpc_subnet_ids with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "VpcSubnetIds" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.status with
      | None -> []
      | Some v -> db_proxy_endpoint_status_to_query (List.append path [ "Status" ]) v);
      (match x.db_proxy_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBProxyName" ]) v);
      (match x.db_proxy_endpoint_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBProxyEndpointArn" ]) v);
      (match x.db_proxy_endpoint_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBProxyEndpointName" ]) v);
    ]

let modify_db_proxy_endpoint_response_to_query path (x : modify_db_proxy_endpoint_response) =
  List.concat
    [
      (match x.db_proxy_endpoint with
      | None -> []
      | Some v -> db_proxy_endpoint_to_query (List.append path [ "DBProxyEndpoint" ]) v);
    ]

let db_proxy_endpoint_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let modify_db_proxy_endpoint_request_to_query path (x : modify_db_proxy_endpoint_request) =
  List.concat
    [
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.new_db_proxy_endpoint_name with
      | None -> []
      | Some v -> db_proxy_endpoint_name_to_query (List.append path [ "NewDBProxyEndpointName" ]) v);
      db_proxy_endpoint_name_to_query
        (List.append path [ "DBProxyEndpointName" ])
        x.db_proxy_endpoint_name;
    ]

let invalid_db_proxy_endpoint_state_fault_to_query path (x : invalid_db_proxy_endpoint_state_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_proxy_endpoint_already_exists_fault_to_query path
    (x : db_proxy_endpoint_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_proxy_already_exists_fault_to_query path (x : db_proxy_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let modify_db_parameter_group_message_to_query path (x : modify_db_parameter_group_message) =
  List.concat
    [
      parameters_list_to_query (List.append path [ "Parameters" ]) x.parameters;
      string__to_query (List.append path [ "DBParameterGroupName" ]) x.db_parameter_group_name;
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
      (match x.disable_log_types with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "DisableLogTypes" ]) v);
      (match x.enable_log_types with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableLogTypes" ]) v);
    ]

let aws_backup_recovery_point_arn_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let modify_additional_storage_volume_to_query path (x : modify_additional_storage_volume) =
  List.concat
    [
      (match x.set_for_delete with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "SetForDelete" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.max_allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxAllocatedStorage" ]) v);
      (match x.iop_s with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "IOPS" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      string__to_query (List.append path [ "VolumeName" ]) x.volume_name;
    ]

let modify_additional_storage_volumes_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    modify_additional_storage_volume_to_query path xs

let master_user_authentication_type_to_query path (x : master_user_authentication_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with IAM_DB_AUTH -> "iam-db-auth" | PASSWORD -> "password")

let modify_db_instance_message_to_query path (x : modify_db_instance_message) =
  List.concat
    [
      (match x.master_user_authentication_type with
      | None -> []
      | Some v ->
          master_user_authentication_type_to_query
            (List.append path [ "MasterUserAuthenticationType" ])
            v);
      (match x.tag_specifications with
      | None -> []
      | Some v -> tag_specification_list_to_query (List.append path [ "TagSpecifications" ]) v);
      (match x.additional_storage_volumes with
      | None -> []
      | Some v ->
          modify_additional_storage_volumes_list_to_query
            (List.append path [ "AdditionalStorageVolumes" ])
            v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.dedicated_log_volume with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DedicatedLogVolume" ]) v);
      (match x.multi_tenant with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiTenant" ]) v);
      (match x.master_user_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserSecretKmsKeyId" ]) v);
      (match x.rotate_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "RotateMasterUserPassword" ]) v);
      (match x.manage_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterUserPassword" ]) v);
      (match x.aws_backup_recovery_point_arn with
      | None -> []
      | Some v ->
          aws_backup_recovery_point_arn_to_query
            (List.append path [ "AwsBackupRecoveryPointArn" ])
            v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.enable_customer_owned_ip with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableCustomerOwnedIp" ]) v);
      (match x.resume_full_automation_mode_minutes with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "ResumeFullAutomationModeMinutes" ]) v);
      (match x.automation_mode with
      | None -> []
      | Some v -> automation_mode_to_query (List.append path [ "AutomationMode" ]) v);
      (match x.replica_mode with
      | None -> []
      | Some v -> replica_mode_to_query (List.append path [ "ReplicaMode" ]) v);
      (match x.certificate_rotation_restart with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CertificateRotationRestart" ]) v);
      (match x.max_allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxAllocatedStorage" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.use_default_processor_features with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "UseDefaultProcessorFeatures" ]) v);
      (match x.processor_features with
      | None -> []
      | Some v -> processor_feature_list_to_query (List.append path [ "ProcessorFeatures" ]) v);
      (match x.cloudwatch_logs_export_configuration with
      | None -> []
      | Some v ->
          cloudwatch_logs_export_configuration_to_query
            (List.append path [ "CloudwatchLogsExportConfiguration" ])
            v);
      (match x.performance_insights_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "PerformanceInsightsRetentionPeriod" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.database_insights_mode with
      | None -> []
      | Some v -> database_insights_mode_to_query (List.append path [ "DatabaseInsightsMode" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.promotion_tier with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PromotionTier" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.db_port_number with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "DBPortNumber" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.disable_domain with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DisableDomain" ]) v);
      (match x.domain_dns_ips with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DomainDnsIps" ]) v);
      (match x.domain_auth_secret_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainAuthSecretArn" ]) v);
      (match x.domain_ou with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainOu" ]) v);
      (match x.domain_fqdn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainFqdn" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.tde_credential_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "TdeCredentialPassword" ]) v);
      (match x.tde_credential_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TdeCredentialArn" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.new_db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NewDBInstanceIdentifier" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.allow_major_version_upgrade with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AllowMajorVersionUpgrade" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.apply_immediately with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ApplyImmediately" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.db_security_groups with
      | None -> []
      | Some v -> db_security_group_name_list_to_query (List.append path [ "DBSecurityGroups" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let db_upgrade_dependency_failure_fault_to_query path (x : db_upgrade_dependency_failure_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

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

let modify_db_cluster_message_to_query path (x : modify_db_cluster_message) =
  List.concat
    [
      (match x.master_user_authentication_type with
      | None -> []
      | Some v ->
          master_user_authentication_type_to_query
            (List.append path [ "MasterUserAuthenticationType" ])
            v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.enable_limitless_database with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableLimitlessDatabase" ]) v);
      (match x.aws_backup_recovery_point_arn with
      | None -> []
      | Some v ->
          aws_backup_recovery_point_arn_to_query
            (List.append path [ "AwsBackupRecoveryPointArn" ])
            v);
      (match x.allow_engine_mode_change with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AllowEngineModeChange" ]) v);
      (match x.engine_mode with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineMode" ]) v);
      (match x.master_user_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserSecretKmsKeyId" ]) v);
      (match x.enable_local_write_forwarding with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableLocalWriteForwarding" ]) v);
      (match x.rotate_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "RotateMasterUserPassword" ]) v);
      (match x.manage_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterUserPassword" ]) v);
      (match x.performance_insights_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "PerformanceInsightsRetentionPeriod" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.database_insights_mode with
      | None -> []
      | Some v -> database_insights_mode_to_query (List.append path [ "DatabaseInsightsMode" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.db_cluster_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterInstanceClass" ]) v);
      (match x.enable_global_write_forwarding with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableGlobalWriteForwarding" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.enable_http_endpoint with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableHttpEndpoint" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.scaling_configuration with
      | None -> []
      | Some v -> scaling_configuration_to_query (List.append path [ "ScalingConfiguration" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.db_instance_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceParameterGroupName" ]) v);
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
      (match x.backtrack_window with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "BacktrackWindow" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
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

let modify_db_cluster_endpoint_message_to_query path (x : modify_db_cluster_endpoint_message) =
  List.concat
    [
      (match x.excluded_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ExcludedMembers" ]) v);
      (match x.static_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "StaticMembers" ]) v);
      (match x.endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointType" ]) v);
      string__to_query
        (List.append path [ "DBClusterEndpointIdentifier" ])
        x.db_cluster_endpoint_identifier;
    ]

let db_cluster_endpoint_not_found_fault_to_query path (x : db_cluster_endpoint_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_endpoint_to_query path (x : db_cluster_endpoint) =
  List.concat
    [
      (match x.db_cluster_endpoint_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointArn" ]) v);
      (match x.excluded_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ExcludedMembers" ]) v);
      (match x.static_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "StaticMembers" ]) v);
      (match x.custom_endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomEndpointType" ]) v);
      (match x.endpoint_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointType" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Endpoint" ]) v);
      (match x.db_cluster_endpoint_resource_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointResourceIdentifier" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.db_cluster_endpoint_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointIdentifier" ]) v);
    ]

let custom_engine_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let custom_engine_version_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let custom_engine_version_status_to_query path (x : custom_engine_version_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Inactive_except_restore -> "inactive-except-restore"
    | Inactive -> "inactive"
    | Available -> "available")

let modify_custom_db_engine_version_message_to_query path
    (x : modify_custom_db_engine_version_message) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> custom_engine_version_status_to_query (List.append path [ "Status" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      custom_engine_version_to_query (List.append path [ "EngineVersion" ]) x.engine_version;
      custom_engine_name_to_query (List.append path [ "Engine" ]) x.engine;
    ]

let invalid_custom_db_engine_version_state_fault_to_query path
    (x : invalid_custom_db_engine_version_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let custom_db_engine_version_not_found_fault_to_query path
    (x : custom_db_engine_version_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let custom_db_engine_version_manifest_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let custom_db_engine_version_am_i_to_query path (x : custom_db_engine_version_am_i) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.image_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ImageId" ]) v);
    ]

let feature_name_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

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
      (match x.supports_integrations with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsIntegrations" ]) v);
      (match x.supports_local_write_forwarding with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "SupportsLocalWriteForwarding" ]) v);
      (match x.supported_ca_certificate_identifiers with
      | None -> []
      | Some v ->
          ca_certificate_identifiers_list_to_query
            (List.append path [ "SupportedCACertificateIdentifiers" ])
            v);
      (match x.supports_certificate_rotation_without_restart with
      | None -> []
      | Some v ->
          boolean_optional_to_query
            (List.append path [ "SupportsCertificateRotationWithoutRestart" ])
            v);
      (match x.supports_limitless_database with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsLimitlessDatabase" ]) v);
      (match x.supports_babelfish with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsBabelfish" ]) v);
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.supports_global_databases with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsGlobalDatabases" ]) v);
      (match x.supports_parallel_query with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsParallelQuery" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.supported_feature_names with
      | None -> []
      | Some v -> feature_name_list_to_query (List.append path [ "SupportedFeatureNames" ]) v);
      (match x.supported_engine_modes with
      | None -> []
      | Some v -> engine_mode_list_to_query (List.append path [ "SupportedEngineModes" ]) v);
      (match x.supports_read_replica with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsReadReplica" ]) v);
      (match x.supports_log_exports_to_cloudwatch_logs with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SupportsLogExportsToCloudwatchLogs" ]) v);
      (match x.exportable_log_types with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "ExportableLogTypes" ]) v);
      (match x.supported_timezones with
      | None -> []
      | Some v -> supported_timezones_list_to_query (List.append path [ "SupportedTimezones" ]) v);
      (match x.valid_upgrade_target with
      | None -> []
      | Some v -> valid_upgrade_target_list_to_query (List.append path [ "ValidUpgradeTarget" ]) v);
      (match x.supported_nchar_character_sets with
      | None -> []
      | Some v ->
          supported_character_sets_list_to_query
            (List.append path [ "SupportedNcharCharacterSets" ])
            v);
      (match x.supported_character_sets with
      | None -> []
      | Some v ->
          supported_character_sets_list_to_query (List.append path [ "SupportedCharacterSets" ]) v);
      (match x.create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CreateTime" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KMSKeyId" ]) v);
      (match x.db_engine_media_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBEngineMediaType" ]) v);
      (match x.image with
      | None -> []
      | Some v -> custom_db_engine_version_am_i_to_query (List.append path [ "Image" ]) v);
      (match x.failure_reason with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FailureReason" ]) v);
      (match x.default_character_set with
      | None -> []
      | Some v -> character_set_to_query (List.append path [ "DefaultCharacterSet" ]) v);
      (match x.db_engine_version_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBEngineVersionDescription" ]) v);
      (match x.db_engine_version_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBEngineVersionArn" ]) v);
      (match x.db_engine_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBEngineDescription" ]) v);
      (match x.db_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupFamily" ]) v);
      (match x.custom_db_engine_version_manifest with
      | None -> []
      | Some v ->
          custom_db_engine_version_manifest_to_query
            (List.append path [ "CustomDBEngineVersionManifest" ])
            v);
      (match x.database_installation_files with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DatabaseInstallationFiles" ]) v);
      (match x.database_installation_files_s3_prefix with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseInstallationFilesS3Prefix" ]) v);
      (match x.database_installation_files_s3_bucket_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseInstallationFilesS3BucketName" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.major_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MajorEngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
    ]

let modify_current_db_cluster_capacity_message_to_query path
    (x : modify_current_db_cluster_capacity_message) =
  List.concat
    [
      (match x.timeout_action with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TimeoutAction" ]) v);
      (match x.seconds_before_timeout with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SecondsBeforeTimeout" ]) v);
      (match x.capacity with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Capacity" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
    ]

let invalid_db_cluster_capacity_fault_to_query path (x : invalid_db_cluster_capacity_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_capacity_info_to_query path (x : db_cluster_capacity_info) =
  List.concat
    [
      (match x.timeout_action with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TimeoutAction" ]) v);
      (match x.seconds_before_timeout with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "SecondsBeforeTimeout" ]) v);
      (match x.current_capacity with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "CurrentCapacity" ]) v);
      (match x.pending_capacity with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PendingCapacity" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
    ]

let certificate_to_query path (x : certificate) =
  List.concat
    [
      (match x.customer_override_valid_till with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "CustomerOverrideValidTill" ]) v);
      (match x.customer_override with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CustomerOverride" ]) v);
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

let modify_certificates_result_to_query path (x : modify_certificates_result) =
  List.concat
    [
      (match x.certificate with
      | None -> []
      | Some v -> certificate_to_query (List.append path [ "Certificate" ]) v);
    ]

let modify_certificates_message_to_query path (x : modify_certificates_message) =
  List.concat
    [
      (match x.remove_customer_override with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "RemoveCustomerOverride" ]) v);
      (match x.certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CertificateIdentifier" ]) v);
    ]

let modify_activity_stream_response_to_query path (x : modify_activity_stream_response) =
  List.concat
    [
      (match x.policy_status with
      | None -> []
      | Some v -> activity_stream_policy_status_to_query (List.append path [ "PolicyStatus" ]) v);
      (match x.engine_native_audit_fields_included with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EngineNativeAuditFieldsIncluded" ]) v);
      (match x.mode with
      | None -> []
      | Some v -> activity_stream_mode_to_query (List.append path [ "Mode" ]) v);
      (match x.status with
      | None -> []
      | Some v -> activity_stream_status_to_query (List.append path [ "Status" ]) v);
      (match x.kinesis_stream_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KinesisStreamName" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
    ]

let audit_policy_state_to_query path (x : audit_policy_state) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with UNLOCKED_POLICY -> "unlocked" | LOCKED_POLICY -> "locked")

let modify_activity_stream_request_to_query path (x : modify_activity_stream_request) =
  List.concat
    [
      (match x.audit_policy_state with
      | None -> []
      | Some v -> audit_policy_state_to_query (List.append path [ "AuditPolicyState" ]) v);
      (match x.resource_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceArn" ]) v);
    ]

let max_records_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let max_db_shard_group_limit_reached_to_query path (x : max_db_shard_group_limit_reached) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let marker_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let major_engine_version_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let long_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

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

let kms_key_id_or_arn_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_resource_state_fault_to_query path (x : invalid_resource_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_export_task_state_fault_to_query path (x : invalid_export_task_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
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

let invalid_db_subnet_group_fault_to_query path (x : invalid_db_subnet_group_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_db_cluster_automated_backup_state_fault_to_query path
    (x : invalid_db_cluster_automated_backup_state_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integration_quota_exceeded_fault_to_query path (x : integration_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let integration_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "Integration" integration_to_query path xs

let integration_already_exists_fault_to_query path (x : integration_already_exists_fault) =
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
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
    ]

let export_tasks_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "ExportTask" export_task_to_query path xs

let export_tasks_message_to_query path (x : export_tasks_message) =
  List.concat
    [
      (match x.export_tasks with
      | None -> []
      | Some v -> export_tasks_list_to_query (List.append path [ "ExportTasks" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let export_task_not_found_fault_to_query path (x : export_task_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
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

let engine_family_to_query path (x : engine_family) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SQLSERVER -> "SQLSERVER" | POSTGRESQL -> "POSTGRESQL" | MYSQL -> "MYSQL")

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

let engine_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let enable_http_endpoint_response_to_query path (x : enable_http_endpoint_response) =
  List.concat
    [
      (match x.http_endpoint_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "HttpEndpointEnabled" ]) v);
      (match x.resource_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceArn" ]) v);
    ]

let enable_http_endpoint_request_to_query path (x : enable_http_endpoint_request) =
  List.concat [ string__to_query (List.append path [ "ResourceArn" ]) x.resource_arn ]

let ec2_image_properties_not_supported_fault_to_query path
    (x : ec2_image_properties_not_supported_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let download_db_log_file_portion_message_to_query path (x : download_db_log_file_portion_message) =
  List.concat
    [
      (match x.number_of_lines with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "NumberOfLines" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      string__to_query (List.append path [ "LogFileName" ]) x.log_file_name;
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let download_db_log_file_portion_details_to_query path (x : download_db_log_file_portion_details) =
  List.concat
    [
      (match x.additional_data_pending with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "AdditionalDataPending" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.log_file_data with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "LogFileData" ]) v);
    ]

let db_log_file_not_found_fault_to_query path (x : db_log_file_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_instance_not_ready_fault_to_query path (x : db_instance_not_ready_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let disable_http_endpoint_response_to_query path (x : disable_http_endpoint_response) =
  List.concat
    [
      (match x.http_endpoint_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "HttpEndpointEnabled" ]) v);
      (match x.resource_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ResourceArn" ]) v);
    ]

let disable_http_endpoint_request_to_query path (x : disable_http_endpoint_request) =
  List.concat [ string__to_query (List.append path [ "ResourceArn" ]) x.resource_arn ]

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

let describe_tenant_databases_message_to_query path (x : describe_tenant_databases_message) =
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
      (match x.tenant_db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TenantDBName" ]) v);
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
    ]

let describe_source_regions_message_to_query path (x : describe_source_regions_message) =
  List.concat
    [
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.region_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "RegionName" ]) v);
    ]

let describe_serverless_v2_platform_versions_message_to_query path
    (x : describe_serverless_v2_platform_versions_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.include_all with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "IncludeAll" ]) v);
      (match x.default_only with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DefaultOnly" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
      (match x.serverless_v2_platform_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ServerlessV2PlatformVersion" ]) v);
    ]

let describe_reserved_db_instances_offerings_message_to_query path
    (x : describe_reserved_db_instances_offerings_message) =
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
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.offering_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OfferingType" ]) v);
      (match x.product_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ProductDescription" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Duration" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.reserved_db_instances_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedDBInstancesOfferingId" ]) v);
    ]

let describe_reserved_db_instances_message_to_query path
    (x : describe_reserved_db_instances_message) =
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
      (match x.lease_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LeaseId" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.offering_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OfferingType" ]) v);
      (match x.product_description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ProductDescription" ]) v);
      (match x.duration with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Duration" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.reserved_db_instances_offering_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedDBInstancesOfferingId" ]) v);
      (match x.reserved_db_instance_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReservedDBInstanceId" ]) v);
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
      (match x.availability_zone_group with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZoneGroup" ]) v);
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

let describe_option_groups_message_to_query path (x : describe_option_groups_message) =
  List.concat
    [
      (match x.major_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MajorEngineVersion" ]) v);
      (match x.engine_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineName" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
    ]

let describe_option_group_options_message_to_query path (x : describe_option_group_options_message)
    =
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
      (match x.major_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MajorEngineVersion" ]) v);
      string__to_query (List.append path [ "EngineName" ]) x.engine_name;
    ]

let describe_integrations_response_to_query path (x : describe_integrations_response) =
  List.concat
    [
      (match x.integrations with
      | None -> []
      | Some v -> integration_list_to_query (List.append path [ "Integrations" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
    ]

let describe_integrations_message_to_query path (x : describe_integrations_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.integration_identifier with
      | None -> []
      | Some v -> integration_identifier_to_query (List.append path [ "IntegrationIdentifier" ]) v);
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

let describe_export_tasks_message_to_query path (x : describe_export_tasks_message) =
  List.concat
    [
      (match x.source_type with
      | None -> []
      | Some v -> export_source_type_to_query (List.append path [ "SourceType" ]) v);
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.source_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceArn" ]) v);
      (match x.export_task_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ExportTaskIdentifier" ]) v);
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
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      string__to_query (List.append path [ "DBParameterGroupFamily" ]) x.db_parameter_group_family;
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

let describe_db_snapshots_message_to_query path (x : describe_db_snapshots_message) =
  List.concat
    [
      (match x.dbi_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbiResourceId" ]) v);
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
      (match x.db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSnapshotIdentifier" ]) v);
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
    ]

let db_snapshot_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBSnapshot" db_snapshot_to_query path xs

let db_snapshot_message_to_query path (x : db_snapshot_message) =
  List.concat
    [
      (match x.db_snapshots with
      | None -> []
      | Some v -> db_snapshot_list_to_query (List.append path [ "DBSnapshots" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_snapshot_tenant_databases_message_to_query path
    (x : describe_db_snapshot_tenant_databases_message) =
  List.concat
    [
      (match x.dbi_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbiResourceId" ]) v);
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
      (match x.db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSnapshotIdentifier" ]) v);
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
    ]

let db_snapshot_tenant_database_to_query path (x : db_snapshot_tenant_database) =
  List.concat
    [
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.nchar_character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NcharCharacterSetName" ]) v);
      (match x.db_snapshot_tenant_database_ar_n with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSnapshotTenantDatabaseARN" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.tenant_database_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TenantDatabaseResourceId" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.tenant_db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TenantDBName" ]) v);
      (match x.tenant_database_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "TenantDatabaseCreateTime" ]) v);
      (match x.snapshot_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotType" ]) v);
      (match x.engine_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineName" ]) v);
      (match x.dbi_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbiResourceId" ]) v);
      (match x.db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceIdentifier" ]) v);
      (match x.db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSnapshotIdentifier" ]) v);
    ]

let db_snapshot_tenant_databases_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBSnapshotTenantDatabase"
    db_snapshot_tenant_database_to_query path xs

let db_snapshot_tenant_databases_message_to_query path (x : db_snapshot_tenant_databases_message) =
  List.concat
    [
      (match x.db_snapshot_tenant_databases with
      | None -> []
      | Some v ->
          db_snapshot_tenant_databases_list_to_query
            (List.append path [ "DBSnapshotTenantDatabases" ])
            v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_snapshot_attributes_result_to_query path
    (x : describe_db_snapshot_attributes_result) =
  List.concat
    [
      (match x.db_snapshot_attributes_result with
      | None -> []
      | Some v ->
          db_snapshot_attributes_result_to_query
            (List.append path [ "DBSnapshotAttributesResult" ])
            v);
    ]

let describe_db_snapshot_attributes_message_to_query path
    (x : describe_db_snapshot_attributes_message) =
  List.concat
    [ string__to_query (List.append path [ "DBSnapshotIdentifier" ]) x.db_snapshot_identifier ]

let db_shard_groups_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBShardGroup" db_shard_group_to_query path
    xs

let describe_db_shard_groups_response_to_query path (x : describe_db_shard_groups_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_shard_groups with
      | None -> []
      | Some v -> db_shard_groups_list_to_query (List.append path [ "DBShardGroups" ]) v);
    ]

let describe_db_shard_groups_message_to_query path (x : describe_db_shard_groups_message) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.db_shard_group_identifier with
      | None -> []
      | Some v ->
          db_shard_group_identifier_to_query (List.append path [ "DBShardGroupIdentifier" ]) v);
    ]

let describe_db_security_groups_message_to_query path (x : describe_db_security_groups_message) =
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
      (match x.db_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSecurityGroupName" ]) v);
    ]

let db_security_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBSecurityGroup" db_security_group_to_query
    path xs

let db_security_group_message_to_query path (x : db_security_group_message) =
  List.concat
    [
      (match x.db_security_groups with
      | None -> []
      | Some v -> db_security_groups_to_query (List.append path [ "DBSecurityGroups" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_recommendations_message_to_query path (x : describe_db_recommendations_message) =
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
      (match x.locale with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Locale" ]) v);
      (match x.last_updated_before with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "LastUpdatedBefore" ]) v);
      (match x.last_updated_after with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "LastUpdatedAfter" ]) v);
    ]

let db_recommendation_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" db_recommendation_to_query path xs

let db_recommendations_message_to_query path (x : db_recommendations_message) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_recommendations with
      | None -> []
      | Some v -> db_recommendation_list_to_query (List.append path [ "DBRecommendations" ]) v);
    ]

let describe_db_proxy_targets_response_to_query path (x : describe_db_proxy_targets_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.targets with
      | None -> []
      | Some v -> target_list_to_query (List.append path [ "Targets" ]) v);
    ]

let describe_db_proxy_targets_request_to_query path (x : describe_db_proxy_targets_request) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.target_group_name with
      | None -> []
      | Some v -> db_proxy_target_group_name_to_query (List.append path [ "TargetGroupName" ]) v);
      db_proxy_name_to_query (List.append path [ "DBProxyName" ]) x.db_proxy_name;
    ]

let db_proxy_target_not_found_fault_to_query path (x : db_proxy_target_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let describe_db_proxy_target_groups_response_to_query path
    (x : describe_db_proxy_target_groups_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.target_groups with
      | None -> []
      | Some v -> target_group_list_to_query (List.append path [ "TargetGroups" ]) v);
    ]

let describe_db_proxy_target_groups_request_to_query path
    (x : describe_db_proxy_target_groups_request) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.target_group_name with
      | None -> []
      | Some v -> db_proxy_target_group_name_to_query (List.append path [ "TargetGroupName" ]) v);
      db_proxy_name_to_query (List.append path [ "DBProxyName" ]) x.db_proxy_name;
    ]

let db_proxy_endpoint_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" db_proxy_endpoint_to_query path xs

let describe_db_proxy_endpoints_response_to_query path (x : describe_db_proxy_endpoints_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_proxy_endpoints with
      | None -> []
      | Some v -> db_proxy_endpoint_list_to_query (List.append path [ "DBProxyEndpoints" ]) v);
    ]

let describe_db_proxy_endpoints_request_to_query path (x : describe_db_proxy_endpoints_request) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.db_proxy_endpoint_name with
      | None -> []
      | Some v -> db_proxy_endpoint_name_to_query (List.append path [ "DBProxyEndpointName" ]) v);
      (match x.db_proxy_name with
      | None -> []
      | Some v -> db_proxy_name_to_query (List.append path [ "DBProxyName" ]) v);
    ]

let db_proxy_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" db_proxy_to_query path xs

let describe_db_proxies_response_to_query path (x : describe_db_proxies_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_proxies with
      | None -> []
      | Some v -> db_proxy_list_to_query (List.append path [ "DBProxies" ]) v);
    ]

let describe_db_proxies_request_to_query path (x : describe_db_proxies_request) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.db_proxy_name with
      | None -> []
      | Some v -> db_proxy_name_to_query (List.append path [ "DBProxyName" ]) v);
    ]

let describe_db_parameters_message_to_query path (x : describe_db_parameters_message) =
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
      string__to_query (List.append path [ "DBParameterGroupName" ]) x.db_parameter_group_name;
    ]

let db_parameter_group_details_to_query path (x : db_parameter_group_details) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.parameters with
      | None -> []
      | Some v -> parameters_list_to_query (List.append path [ "Parameters" ]) v);
    ]

let describe_db_parameter_groups_message_to_query path (x : describe_db_parameter_groups_message) =
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
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
    ]

let db_parameter_group_to_query path (x : db_parameter_group) =
  List.concat
    [
      (match x.db_parameter_group_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupArn" ]) v);
      (match x.description with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Description" ]) v);
      (match x.db_parameter_group_family with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupFamily" ]) v);
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
    ]

let db_parameter_group_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBParameterGroup"
    db_parameter_group_to_query path xs

let db_parameter_groups_message_to_query path (x : db_parameter_groups_message) =
  List.concat
    [
      (match x.db_parameter_groups with
      | None -> []
      | Some v -> db_parameter_group_list_to_query (List.append path [ "DBParameterGroups" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let db_major_engine_version_to_query path (x : db_major_engine_version) =
  List.concat
    [
      (match x.supported_engine_lifecycles with
      | None -> []
      | Some v ->
          supported_engine_lifecycle_list_to_query
            (List.append path [ "SupportedEngineLifecycles" ])
            v);
      (match x.major_engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MajorEngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
    ]

let db_major_engine_versions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBMajorEngineVersion"
    db_major_engine_version_to_query path xs

let describe_db_major_engine_versions_response_to_query path
    (x : describe_db_major_engine_versions_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.db_major_engine_versions with
      | None -> []
      | Some v ->
          db_major_engine_versions_list_to_query (List.append path [ "DBMajorEngineVersions" ]) v);
    ]

let describe_db_major_engine_versions_request_to_query path
    (x : describe_db_major_engine_versions_request) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.major_engine_version with
      | None -> []
      | Some v -> major_engine_version_to_query (List.append path [ "MajorEngineVersion" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> engine_to_query (List.append path [ "Engine" ]) v);
    ]

let describe_db_log_files_details_to_query path (x : describe_db_log_files_details) =
  List.concat
    [
      (match x.size with None -> [] | Some v -> long_to_query (List.append path [ "Size" ]) v);
      (match x.last_written with
      | None -> []
      | Some v -> long_to_query (List.append path [ "LastWritten" ]) v);
      (match x.log_file_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LogFileName" ]) v);
    ]

let describe_db_log_files_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DescribeDBLogFilesDetails"
    describe_db_log_files_details_to_query path xs

let describe_db_log_files_response_to_query path (x : describe_db_log_files_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.describe_db_log_files with
      | None -> []
      | Some v -> describe_db_log_files_list_to_query (List.append path [ "DescribeDBLogFiles" ]) v);
    ]

let describe_db_log_files_message_to_query path (x : describe_db_log_files_message) =
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
      (match x.file_size with
      | None -> []
      | Some v -> long_to_query (List.append path [ "FileSize" ]) v);
      (match x.file_last_written with
      | None -> []
      | Some v -> long_to_query (List.append path [ "FileLastWritten" ]) v);
      (match x.filename_contains with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FilenameContains" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
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

let describe_db_instance_automated_backups_message_to_query path
    (x : describe_db_instance_automated_backups_message) =
  List.concat
    [
      (match x.db_instance_automated_backups_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceAutomatedBackupsArn" ]) v);
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
      (match x.dbi_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbiResourceId" ]) v);
    ]

let db_instance_automated_backup_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBInstanceAutomatedBackup"
    db_instance_automated_backup_to_query path xs

let db_instance_automated_backup_message_to_query path (x : db_instance_automated_backup_message) =
  List.concat
    [
      (match x.db_instance_automated_backups with
      | None -> []
      | Some v ->
          db_instance_automated_backup_list_to_query
            (List.append path [ "DBInstanceAutomatedBackups" ])
            v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_engine_versions_message_to_query path (x : describe_db_engine_versions_message) =
  List.concat
    [
      (match x.include_all with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "IncludeAll" ]) v);
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
      (match x.db_cluster_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbClusterResourceId" ]) v);
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
      (match x.db_system_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSystemId" ]) v);
      (match x.db_cluster_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbClusterResourceId" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
      (match x.source_db_cluster_snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDBClusterSnapshotArn" ]) v);
      (match x.db_cluster_snapshot_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterSnapshotArn" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.storage_encryption_type with
      | None -> []
      | Some v -> storage_encryption_type_to_query (List.append path [ "StorageEncryptionType" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.percent_progress with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "PercentProgress" ]) v);
      (match x.snapshot_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotType" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
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
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.engine_mode with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineMode" ]) v);
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

let describe_db_cluster_endpoints_message_to_query path (x : describe_db_cluster_endpoints_message)
    =
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
      (match x.db_cluster_endpoint_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterEndpointIdentifier" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
    ]

let db_cluster_endpoint_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterEndpointList"
    db_cluster_endpoint_to_query path xs

let db_cluster_endpoint_message_to_query path (x : db_cluster_endpoint_message) =
  List.concat
    [
      (match x.db_cluster_endpoints with
      | None -> []
      | Some v -> db_cluster_endpoint_list_to_query (List.append path [ "DBClusterEndpoints" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_cluster_backtracks_message_to_query path
    (x : describe_db_cluster_backtracks_message) =
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
      (match x.backtrack_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BacktrackIdentifier" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
    ]

let db_cluster_backtrack_not_found_fault_to_query path (x : db_cluster_backtrack_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_backtrack_to_query path (x : db_cluster_backtrack) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.backtrack_request_creation_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "BacktrackRequestCreationTime" ]) v);
      (match x.backtracked_from with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "BacktrackedFrom" ]) v);
      (match x.backtrack_to with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "BacktrackTo" ]) v);
      (match x.backtrack_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BacktrackIdentifier" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
    ]

let db_cluster_backtrack_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterBacktrack"
    db_cluster_backtrack_to_query path xs

let db_cluster_backtrack_message_to_query path (x : db_cluster_backtrack_message) =
  List.concat
    [
      (match x.db_cluster_backtracks with
      | None -> []
      | Some v -> db_cluster_backtrack_list_to_query (List.append path [ "DBClusterBacktracks" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
    ]

let describe_db_cluster_automated_backups_message_to_query path
    (x : describe_db_cluster_automated_backups_message) =
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
      (match x.db_cluster_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbClusterResourceId" ]) v);
    ]

let db_cluster_automated_backup_to_query path (x : db_cluster_automated_backup) =
  List.concat
    [
      (match x.tag_list with
      | None -> []
      | Some v -> tag_list_to_query (List.append path [ "TagList" ]) v);
      (match x.aws_backup_recovery_point_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AwsBackupRecoveryPointArn" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.port with None -> [] | Some v -> integer_to_query (List.append path [ "Port" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.engine_mode with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineMode" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.db_cluster_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterArn" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.storage_encryption_type with
      | None -> []
      | Some v -> storage_encryption_type_to_query (List.append path [ "StorageEncryptionType" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.cluster_create_time with
      | None -> []
      | Some v -> t_stamp_to_query (List.append path [ "ClusterCreateTime" ]) v);
      (match x.iam_database_authentication_enabled with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "IAMDatabaseAuthenticationEnabled" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.region with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Region" ]) v);
      (match x.db_cluster_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbClusterResourceId" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      (match x.restore_window with
      | None -> []
      | Some v -> restore_window_to_query (List.append path [ "RestoreWindow" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.db_cluster_automated_backups_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterAutomatedBackupsArn" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "VpcId" ]) v);
      (match x.engine with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Engine" ]) v);
    ]

let db_cluster_automated_backup_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "DBClusterAutomatedBackup"
    db_cluster_automated_backup_to_query path xs

let db_cluster_automated_backup_message_to_query path (x : db_cluster_automated_backup_message) =
  List.concat
    [
      (match x.db_cluster_automated_backups with
      | None -> []
      | Some v ->
          db_cluster_automated_backup_list_to_query
            (List.append path [ "DBClusterAutomatedBackups" ])
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
      (match x.default_certificate_for_new_launches with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DefaultCertificateForNewLaunches" ]) v);
    ]

let blue_green_deployment_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" blue_green_deployment_to_query path
    xs

let describe_blue_green_deployments_response_to_query path
    (x : describe_blue_green_deployments_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.blue_green_deployments with
      | None -> []
      | Some v ->
          blue_green_deployment_list_to_query (List.append path [ "BlueGreenDeployments" ]) v);
    ]

let describe_blue_green_deployments_request_to_query path
    (x : describe_blue_green_deployments_request) =
  List.concat
    [
      (match x.max_records with
      | None -> []
      | Some v -> max_records_to_query (List.append path [ "MaxRecords" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Marker" ]) v);
      (match x.filters with
      | None -> []
      | Some v -> filter_list_to_query (List.append path [ "Filters" ]) v);
      (match x.blue_green_deployment_identifier with
      | None -> []
      | Some v ->
          blue_green_deployment_identifier_to_query
            (List.append path [ "BlueGreenDeploymentIdentifier" ])
            v);
    ]

let describe_account_attributes_message_to_query path _x = []

let account_quota_to_query path (x : account_quota) =
  List.concat
    [
      (match x.max with None -> [] | Some v -> long_to_query (List.append path [ "Max" ]) v);
      (match x.used with None -> [] | Some v -> long_to_query (List.append path [ "Used" ]) v);
      (match x.account_quota_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AccountQuotaName" ]) v);
    ]

let account_quota_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "AccountQuota" account_quota_to_query path xs

let account_attributes_message_to_query path (x : account_attributes_message) =
  List.concat
    [
      (match x.account_quotas with
      | None -> []
      | Some v -> account_quota_list_to_query (List.append path [ "AccountQuotas" ]) v);
    ]

let deregister_db_proxy_targets_response_to_query path _x = []

let deregister_db_proxy_targets_request_to_query path (x : deregister_db_proxy_targets_request) =
  List.concat
    [
      (match x.db_cluster_identifiers with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DBClusterIdentifiers" ]) v);
      (match x.db_instance_identifiers with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DBInstanceIdentifiers" ]) v);
      (match x.target_group_name with
      | None -> []
      | Some v -> db_proxy_target_group_name_to_query (List.append path [ "TargetGroupName" ]) v);
      db_proxy_name_to_query (List.append path [ "DBProxyName" ]) x.db_proxy_name;
    ]

let delete_tenant_database_result_to_query path (x : delete_tenant_database_result) =
  List.concat
    [
      (match x.tenant_database with
      | None -> []
      | Some v -> tenant_database_to_query (List.append path [ "TenantDatabase" ]) v);
    ]

let delete_tenant_database_message_to_query path (x : delete_tenant_database_message) =
  List.concat
    [
      (match x.final_db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FinalDBSnapshotIdentifier" ]) v);
      (match x.skip_final_snapshot with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SkipFinalSnapshot" ]) v);
      string__to_query (List.append path [ "TenantDBName" ]) x.tenant_db_name;
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let delete_option_group_message_to_query path (x : delete_option_group_message) =
  List.concat [ string__to_query (List.append path [ "OptionGroupName" ]) x.option_group_name ]

let delete_integration_message_to_query path (x : delete_integration_message) =
  List.concat
    [
      integration_identifier_to_query
        (List.append path [ "IntegrationIdentifier" ])
        x.integration_identifier;
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

let delete_db_snapshot_result_to_query path (x : delete_db_snapshot_result) =
  List.concat
    [
      (match x.db_snapshot with
      | None -> []
      | Some v -> db_snapshot_to_query (List.append path [ "DBSnapshot" ]) v);
    ]

let delete_db_snapshot_message_to_query path (x : delete_db_snapshot_message) =
  List.concat
    [ string__to_query (List.append path [ "DBSnapshotIdentifier" ]) x.db_snapshot_identifier ]

let delete_db_shard_group_message_to_query path (x : delete_db_shard_group_message) =
  List.concat
    [
      db_shard_group_identifier_to_query
        (List.append path [ "DBShardGroupIdentifier" ])
        x.db_shard_group_identifier;
    ]

let delete_db_security_group_message_to_query path (x : delete_db_security_group_message) =
  List.concat
    [ string__to_query (List.append path [ "DBSecurityGroupName" ]) x.db_security_group_name ]

let delete_db_proxy_response_to_query path (x : delete_db_proxy_response) =
  List.concat
    [
      (match x.db_proxy with
      | None -> []
      | Some v -> db_proxy_to_query (List.append path [ "DBProxy" ]) v);
    ]

let delete_db_proxy_request_to_query path (x : delete_db_proxy_request) =
  List.concat [ db_proxy_name_to_query (List.append path [ "DBProxyName" ]) x.db_proxy_name ]

let delete_db_proxy_endpoint_response_to_query path (x : delete_db_proxy_endpoint_response) =
  List.concat
    [
      (match x.db_proxy_endpoint with
      | None -> []
      | Some v -> db_proxy_endpoint_to_query (List.append path [ "DBProxyEndpoint" ]) v);
    ]

let delete_db_proxy_endpoint_request_to_query path (x : delete_db_proxy_endpoint_request) =
  List.concat
    [
      db_proxy_endpoint_name_to_query
        (List.append path [ "DBProxyEndpointName" ])
        x.db_proxy_endpoint_name;
    ]

let delete_db_parameter_group_message_to_query path (x : delete_db_parameter_group_message) =
  List.concat
    [ string__to_query (List.append path [ "DBParameterGroupName" ]) x.db_parameter_group_name ]

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
      (match x.delete_automated_backups with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeleteAutomatedBackups" ]) v);
      (match x.final_db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FinalDBSnapshotIdentifier" ]) v);
      (match x.skip_final_snapshot with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SkipFinalSnapshot" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let delete_db_instance_automated_backup_result_to_query path
    (x : delete_db_instance_automated_backup_result) =
  List.concat
    [
      (match x.db_instance_automated_backup with
      | None -> []
      | Some v ->
          db_instance_automated_backup_to_query (List.append path [ "DBInstanceAutomatedBackup" ]) v);
    ]

let delete_db_instance_automated_backup_message_to_query path
    (x : delete_db_instance_automated_backup_message) =
  List.concat
    [
      (match x.db_instance_automated_backups_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceAutomatedBackupsArn" ]) v);
      (match x.dbi_resource_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DbiResourceId" ]) v);
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
      (match x.delete_automated_backups with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeleteAutomatedBackups" ]) v);
      (match x.final_db_snapshot_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FinalDBSnapshotIdentifier" ]) v);
      (match x.skip_final_snapshot with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "SkipFinalSnapshot" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
    ]

let delete_db_cluster_endpoint_message_to_query path (x : delete_db_cluster_endpoint_message) =
  List.concat
    [
      string__to_query
        (List.append path [ "DBClusterEndpointIdentifier" ])
        x.db_cluster_endpoint_identifier;
    ]

let delete_db_cluster_automated_backup_result_to_query path
    (x : delete_db_cluster_automated_backup_result) =
  List.concat
    [
      (match x.db_cluster_automated_backup with
      | None -> []
      | Some v ->
          db_cluster_automated_backup_to_query (List.append path [ "DBClusterAutomatedBackup" ]) v);
    ]

let delete_db_cluster_automated_backup_message_to_query path
    (x : delete_db_cluster_automated_backup_message) =
  List.concat
    [ string__to_query (List.append path [ "DbClusterResourceId" ]) x.db_cluster_resource_id ]

let db_cluster_snapshot_already_exists_fault_to_query path
    (x : db_cluster_snapshot_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_cluster_automated_backup_quota_exceeded_fault_to_query path
    (x : db_cluster_automated_backup_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_custom_db_engine_version_message_to_query path
    (x : delete_custom_db_engine_version_message) =
  List.concat
    [
      custom_engine_version_to_query (List.append path [ "EngineVersion" ]) x.engine_version;
      custom_engine_name_to_query (List.append path [ "Engine" ]) x.engine;
    ]

let delete_blue_green_deployment_response_to_query path (x : delete_blue_green_deployment_response)
    =
  List.concat
    [
      (match x.blue_green_deployment with
      | None -> []
      | Some v -> blue_green_deployment_to_query (List.append path [ "BlueGreenDeployment" ]) v);
    ]

let delete_blue_green_deployment_request_to_query path (x : delete_blue_green_deployment_request) =
  List.concat
    [
      (match x.delete_target with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeleteTarget" ]) v);
      blue_green_deployment_identifier_to_query
        (List.append path [ "BlueGreenDeploymentIdentifier" ])
        x.blue_green_deployment_identifier;
    ]

let db_subnet_group_quota_exceeded_fault_to_query path (x : db_subnet_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_subnet_group_not_allowed_fault_to_query path (x : db_subnet_group_not_allowed_fault) =
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

let db_security_group_quota_exceeded_fault_to_query path
    (x : db_security_group_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_security_group_not_supported_fault_to_query path (x : db_security_group_not_supported_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_security_group_already_exists_fault_to_query path
    (x : db_security_group_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_proxy_quota_exceeded_fault_to_query path (x : db_proxy_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_proxy_endpoint_quota_exceeded_fault_to_query path
    (x : db_proxy_endpoint_quota_exceeded_fault) =
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

let db_instance_role_quota_exceeded_fault_to_query path (x : db_instance_role_quota_exceeded_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let db_instance_role_already_exists_fault_to_query path (x : db_instance_role_already_exists_fault)
    =
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

let custom_db_engine_version_quota_exceeded_fault_to_query path
    (x : custom_db_engine_version_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let custom_db_engine_version_already_exists_fault_to_query path
    (x : custom_db_engine_version_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let custom_availability_zone_not_found_fault_to_query path
    (x : custom_availability_zone_not_found_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_tenant_database_result_to_query path (x : create_tenant_database_result) =
  List.concat
    [
      (match x.tenant_database with
      | None -> []
      | Some v -> tenant_database_to_query (List.append path [ "TenantDatabase" ]) v);
    ]

let create_tenant_database_message_to_query path (x : create_tenant_database_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.master_user_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserSecretKmsKeyId" ]) v);
      (match x.manage_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterUserPassword" ]) v);
      (match x.nchar_character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NcharCharacterSetName" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
      string__to_query (List.append path [ "MasterUsername" ]) x.master_username;
      string__to_query (List.append path [ "TenantDBName" ]) x.tenant_db_name;
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let create_option_group_result_to_query path (x : create_option_group_result) =
  List.concat
    [
      (match x.option_group with
      | None -> []
      | Some v -> option_group_to_query (List.append path [ "OptionGroup" ]) v);
    ]

let create_option_group_message_to_query path (x : create_option_group_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query (List.append path [ "OptionGroupDescription" ]) x.option_group_description;
      string__to_query (List.append path [ "MajorEngineVersion" ]) x.major_engine_version;
      string__to_query (List.append path [ "EngineName" ]) x.engine_name;
      string__to_query (List.append path [ "OptionGroupName" ]) x.option_group_name;
    ]

let create_integration_message_to_query path (x : create_integration_message) =
  List.concat
    [
      (match x.description with
      | None -> []
      | Some v -> integration_description_to_query (List.append path [ "Description" ]) v);
      (match x.data_filter with
      | None -> []
      | Some v -> data_filter_to_query (List.append path [ "DataFilter" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.additional_encryption_context with
      | None -> []
      | Some v ->
          encryption_context_map_to_query (List.append path [ "AdditionalEncryptionContext" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KMSKeyId" ]) v);
      integration_name_to_query (List.append path [ "IntegrationName" ]) x.integration_name;
      arn_to_query (List.append path [ "TargetArn" ]) x.target_arn;
      source_arn_to_query (List.append path [ "SourceArn" ]) x.source_arn;
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
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
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

let create_db_snapshot_result_to_query path (x : create_db_snapshot_result) =
  List.concat
    [
      (match x.db_snapshot with
      | None -> []
      | Some v -> db_snapshot_to_query (List.append path [ "DBSnapshot" ]) v);
    ]

let create_db_snapshot_message_to_query path (x : create_db_snapshot_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
      string__to_query (List.append path [ "DBSnapshotIdentifier" ]) x.db_snapshot_identifier;
    ]

let create_db_shard_group_message_to_query path (x : create_db_shard_group_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.min_ac_u with
      | None -> []
      | Some v -> double_optional_to_query (List.append path [ "MinACU" ]) v);
      double_optional_to_query (List.append path [ "MaxACU" ]) x.max_ac_u;
      (match x.compute_redundancy with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "ComputeRedundancy" ]) v);
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
      string__to_query (List.append path [ "DBShardGroupIdentifier" ]) x.db_shard_group_identifier;
    ]

let create_db_security_group_result_to_query path (x : create_db_security_group_result) =
  List.concat
    [
      (match x.db_security_group with
      | None -> []
      | Some v -> db_security_group_to_query (List.append path [ "DBSecurityGroup" ]) v);
    ]

let create_db_security_group_message_to_query path (x : create_db_security_group_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query
        (List.append path [ "DBSecurityGroupDescription" ])
        x.db_security_group_description;
      string__to_query (List.append path [ "DBSecurityGroupName" ]) x.db_security_group_name;
    ]

let create_db_proxy_response_to_query path (x : create_db_proxy_response) =
  List.concat
    [
      (match x.db_proxy with
      | None -> []
      | Some v -> db_proxy_to_query (List.append path [ "DBProxy" ]) v);
    ]

let create_db_proxy_request_to_query path (x : create_db_proxy_request) =
  List.concat
    [
      (match x.target_connection_network_type with
      | None -> []
      | Some v ->
          target_connection_network_type_to_query
            (List.append path [ "TargetConnectionNetworkType" ])
            v);
      (match x.endpoint_network_type with
      | None -> []
      | Some v -> endpoint_network_type_to_query (List.append path [ "EndpointNetworkType" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.debug_logging with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "DebugLogging" ]) v);
      (match x.idle_client_timeout with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "IdleClientTimeout" ]) v);
      (match x.require_tl_s with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "RequireTLS" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      string_list_to_query (List.append path [ "VpcSubnetIds" ]) x.vpc_subnet_ids;
      arn_to_query (List.append path [ "RoleArn" ]) x.role_arn;
      (match x.auth with
      | None -> []
      | Some v -> user_auth_config_list_to_query (List.append path [ "Auth" ]) v);
      (match x.default_auth_scheme with
      | None -> []
      | Some v -> default_auth_scheme_to_query (List.append path [ "DefaultAuthScheme" ]) v);
      engine_family_to_query (List.append path [ "EngineFamily" ]) x.engine_family;
      db_proxy_name_to_query (List.append path [ "DBProxyName" ]) x.db_proxy_name;
    ]

let create_db_proxy_endpoint_response_to_query path (x : create_db_proxy_endpoint_response) =
  List.concat
    [
      (match x.db_proxy_endpoint with
      | None -> []
      | Some v -> db_proxy_endpoint_to_query (List.append path [ "DBProxyEndpoint" ]) v);
    ]

let create_db_proxy_endpoint_request_to_query path (x : create_db_proxy_endpoint_request) =
  List.concat
    [
      (match x.endpoint_network_type with
      | None -> []
      | Some v -> endpoint_network_type_to_query (List.append path [ "EndpointNetworkType" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.target_role with
      | None -> []
      | Some v -> db_proxy_endpoint_target_role_to_query (List.append path [ "TargetRole" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      string_list_to_query (List.append path [ "VpcSubnetIds" ]) x.vpc_subnet_ids;
      db_proxy_endpoint_name_to_query
        (List.append path [ "DBProxyEndpointName" ])
        x.db_proxy_endpoint_name;
      db_proxy_name_to_query (List.append path [ "DBProxyName" ]) x.db_proxy_name;
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
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query (List.append path [ "Description" ]) x.description;
      string__to_query (List.append path [ "DBParameterGroupFamily" ]) x.db_parameter_group_family;
      string__to_query (List.append path [ "DBParameterGroupName" ]) x.db_parameter_group_name;
    ]

let create_db_instance_result_to_query path (x : create_db_instance_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let create_db_instance_read_replica_result_to_query path
    (x : create_db_instance_read_replica_result) =
  List.concat
    [
      (match x.db_instance with
      | None -> []
      | Some v -> db_instance_to_query (List.append path [ "DBInstance" ]) v);
    ]

let create_db_instance_read_replica_message_to_query path
    (x : create_db_instance_read_replica_message) =
  List.concat
    [
      (match x.tag_specifications with
      | None -> []
      | Some v -> tag_specification_list_to_query (List.append path [ "TagSpecifications" ]) v);
      (match x.additional_storage_volumes with
      | None -> []
      | Some v ->
          additional_storage_volumes_list_to_query
            (List.append path [ "AdditionalStorageVolumes" ])
            v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.upgrade_storage_config with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "UpgradeStorageConfig" ]) v);
      (match x.dedicated_log_volume with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DedicatedLogVolume" ]) v);
      (match x.source_db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDBClusterIdentifier" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.custom_iam_instance_profile with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomIamInstanceProfile" ]) v);
      (match x.backup_target with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BackupTarget" ]) v);
      (match x.max_allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxAllocatedStorage" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.enable_customer_owned_ip with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableCustomerOwnedIp" ]) v);
      (match x.replica_mode with
      | None -> []
      | Some v -> replica_mode_to_query (List.append path [ "ReplicaMode" ]) v);
      (match x.domain_dns_ips with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DomainDnsIps" ]) v);
      (match x.domain_auth_secret_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainAuthSecretArn" ]) v);
      (match x.domain_ou with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainOu" ]) v);
      (match x.domain_fqdn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainFqdn" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.use_default_processor_features with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "UseDefaultProcessorFeatures" ]) v);
      (match x.processor_features with
      | None -> []
      | Some v -> processor_feature_list_to_query (List.append path [ "ProcessorFeatures" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.performance_insights_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "PerformanceInsightsRetentionPeriod" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.database_insights_mode with
      | None -> []
      | Some v -> database_insights_mode_to_query (List.append path [ "DatabaseInsightsMode" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.pre_signed_url with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "PreSignedUrl" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.db_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBInstanceClass" ]) v);
      (match x.source_db_instance_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SourceDBInstanceIdentifier" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let create_db_instance_message_to_query path (x : create_db_instance_message) =
  List.concat
    [
      (match x.master_user_authentication_type with
      | None -> []
      | Some v ->
          master_user_authentication_type_to_query
            (List.append path [ "MasterUserAuthenticationType" ])
            v);
      (match x.tag_specifications with
      | None -> []
      | Some v -> tag_specification_list_to_query (List.append path [ "TagSpecifications" ]) v);
      (match x.additional_storage_volumes with
      | None -> []
      | Some v ->
          additional_storage_volumes_list_to_query
            (List.append path [ "AdditionalStorageVolumes" ])
            v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
      (match x.dedicated_log_volume with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DedicatedLogVolume" ]) v);
      (match x.multi_tenant with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiTenant" ]) v);
      (match x.master_user_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserSecretKmsKeyId" ]) v);
      (match x.manage_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterUserPassword" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.db_system_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSystemId" ]) v);
      (match x.custom_iam_instance_profile with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomIamInstanceProfile" ]) v);
      (match x.backup_target with
      | None -> []
      | Some v -> string__to_query (List.append path [ "BackupTarget" ]) v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.enable_customer_owned_ip with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableCustomerOwnedIp" ]) v);
      (match x.max_allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MaxAllocatedStorage" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.processor_features with
      | None -> []
      | Some v -> processor_feature_list_to_query (List.append path [ "ProcessorFeatures" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.performance_insights_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "PerformanceInsightsRetentionPeriod" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.database_insights_mode with
      | None -> []
      | Some v -> database_insights_mode_to_query (List.append path [ "DatabaseInsightsMode" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.timezone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Timezone" ]) v);
      (match x.promotion_tier with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "PromotionTier" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.domain_dns_ips with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DomainDnsIps" ]) v);
      (match x.domain_auth_secret_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainAuthSecretArn" ]) v);
      (match x.domain_ou with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainOu" ]) v);
      (match x.domain_fqdn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainFqdn" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.tde_credential_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "TdeCredentialPassword" ]) v);
      (match x.tde_credential_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TdeCredentialArn" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.db_cluster_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterIdentifier" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.nchar_character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NcharCharacterSetName" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "StorageThroughput" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.license_model with
      | None -> []
      | Some v -> string__to_query (List.append path [ "LicenseModel" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.engine_version with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineVersion" ]) v);
      (match x.multi_a_z with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "MultiAZ" ]) v);
      (match x.port with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Port" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.db_parameter_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBParameterGroupName" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.db_subnet_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSubnetGroupName" ]) v);
      (match x.availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "AvailabilityZone" ]) v);
      (match x.vpc_security_group_ids with
      | None -> []
      | Some v -> vpc_security_group_id_list_to_query (List.append path [ "VpcSecurityGroupIds" ]) v);
      (match x.db_security_groups with
      | None -> []
      | Some v -> db_security_group_name_list_to_query (List.append path [ "DBSecurityGroups" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
      (match x.master_username with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUsername" ]) v);
      string__to_query (List.append path [ "Engine" ]) x.engine;
      string__to_query (List.append path [ "DBInstanceClass" ]) x.db_instance_class;
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
      (match x.db_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBName" ]) v);
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
      (match x.with_express_configuration with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "WithExpressConfiguration" ]) v);
      (match x.master_user_authentication_type with
      | None -> []
      | Some v ->
          master_user_authentication_type_to_query
            (List.append path [ "MasterUserAuthenticationType" ])
            v);
      (match x.tag_specifications with
      | None -> []
      | Some v -> tag_specification_list_to_query (List.append path [ "TagSpecifications" ]) v);
      (match x.engine_lifecycle_support with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineLifecycleSupport" ]) v);
      (match x.ca_certificate_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CACertificateIdentifier" ]) v);
      (match x.master_user_secret_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MasterUserSecretKmsKeyId" ]) v);
      (match x.enable_local_write_forwarding with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableLocalWriteForwarding" ]) v);
      (match x.manage_master_user_password with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "ManageMasterUserPassword" ]) v);
      (match x.db_system_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBSystemId" ]) v);
      (match x.cluster_scalability_type with
      | None -> []
      | Some v ->
          cluster_scalability_type_to_query (List.append path [ "ClusterScalabilityType" ]) v);
      (match x.enable_limitless_database with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableLimitlessDatabase" ]) v);
      (match x.performance_insights_retention_period with
      | None -> []
      | Some v ->
          integer_optional_to_query (List.append path [ "PerformanceInsightsRetentionPeriod" ]) v);
      (match x.performance_insights_kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PerformanceInsightsKMSKeyId" ]) v);
      (match x.enable_performance_insights with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnablePerformanceInsights" ]) v);
      (match x.database_insights_mode with
      | None -> []
      | Some v -> database_insights_mode_to_query (List.append path [ "DatabaseInsightsMode" ]) v);
      (match x.monitoring_role_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MonitoringRoleArn" ]) v);
      (match x.monitoring_interval with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "MonitoringInterval" ]) v);
      (match x.serverless_v2_scaling_configuration with
      | None -> []
      | Some v ->
          serverless_v2_scaling_configuration_to_query
            (List.append path [ "ServerlessV2ScalingConfiguration" ])
            v);
      (match x.network_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NetworkType" ]) v);
      (match x.enable_global_write_forwarding with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableGlobalWriteForwarding" ]) v);
      (match x.domain_iam_role_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DomainIAMRoleName" ]) v);
      (match x.domain with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Domain" ]) v);
      (match x.copy_tags_to_snapshot with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTagsToSnapshot" ]) v);
      (match x.enable_http_endpoint with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "EnableHttpEndpoint" ]) v);
      (match x.global_cluster_identifier with
      | None -> []
      | Some v ->
          global_cluster_identifier_to_query (List.append path [ "GlobalClusterIdentifier" ]) v);
      (match x.deletion_protection with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "DeletionProtection" ]) v);
      (match x.auto_minor_version_upgrade with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "AutoMinorVersionUpgrade" ]) v);
      (match x.publicly_accessible with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "PubliclyAccessible" ]) v);
      (match x.iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "Iops" ]) v);
      (match x.storage_type with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StorageType" ]) v);
      (match x.allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "AllocatedStorage" ]) v);
      (match x.db_cluster_instance_class with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DBClusterInstanceClass" ]) v);
      (match x.rds_custom_cluster_configuration with
      | None -> []
      | Some v ->
          rds_custom_cluster_configuration_to_query
            (List.append path [ "RdsCustomClusterConfiguration" ])
            v);
      (match x.scaling_configuration with
      | None -> []
      | Some v -> scaling_configuration_to_query (List.append path [ "ScalingConfiguration" ]) v);
      (match x.engine_mode with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EngineMode" ]) v);
      (match x.enable_cloudwatch_logs_exports with
      | None -> []
      | Some v -> log_type_list_to_query (List.append path [ "EnableCloudwatchLogsExports" ]) v);
      (match x.backtrack_window with
      | None -> []
      | Some v -> long_optional_to_query (List.append path [ "BacktrackWindow" ]) v);
      (match x.enable_iam_database_authentication with
      | None -> []
      | Some v ->
          boolean_optional_to_query (List.append path [ "EnableIAMDatabaseAuthentication" ]) v);
      (match x.pre_signed_url with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "PreSignedUrl" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      (match x.storage_encrypted with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "StorageEncrypted" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.replication_source_identifier with
      | None -> []
      | Some v -> string__to_query (List.append path [ "ReplicationSourceIdentifier" ]) v);
      (match x.preferred_maintenance_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredMaintenanceWindow" ]) v);
      (match x.preferred_backup_window with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PreferredBackupWindow" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.master_user_password with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "MasterUserPassword" ]) v);
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
      (match x.database_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "DatabaseName" ]) v);
      (match x.character_set_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CharacterSetName" ]) v);
      (match x.backup_retention_period with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "BackupRetentionPeriod" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
    ]

let create_db_cluster_endpoint_message_to_query path (x : create_db_cluster_endpoint_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.excluded_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "ExcludedMembers" ]) v);
      (match x.static_members with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "StaticMembers" ]) v);
      string__to_query (List.append path [ "EndpointType" ]) x.endpoint_type;
      string__to_query
        (List.append path [ "DBClusterEndpointIdentifier" ])
        x.db_cluster_endpoint_identifier;
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
    ]

let bucket_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let create_custom_db_engine_version_message_to_query path
    (x : create_custom_db_engine_version_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.manifest with
      | None -> []
      | Some v -> custom_db_engine_version_manifest_to_query (List.append path [ "Manifest" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.use_aws_provided_latest_image with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "UseAwsProvidedLatestImage" ]) v);
      (match x.source_custom_db_engine_version_identifier with
      | None -> []
      | Some v ->
          string255_to_query (List.append path [ "SourceCustomDbEngineVersionIdentifier" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> kms_key_id_or_arn_to_query (List.append path [ "KMSKeyId" ]) v);
      (match x.image_id with
      | None -> []
      | Some v -> string255_to_query (List.append path [ "ImageId" ]) v);
      (match x.database_installation_files with
      | None -> []
      | Some v -> string_list_to_query (List.append path [ "DatabaseInstallationFiles" ]) v);
      (match x.database_installation_files_s3_prefix with
      | None -> []
      | Some v -> string255_to_query (List.append path [ "DatabaseInstallationFilesS3Prefix" ]) v);
      (match x.database_installation_files_s3_bucket_name with
      | None -> []
      | Some v ->
          bucket_name_to_query (List.append path [ "DatabaseInstallationFilesS3BucketName" ]) v);
      custom_engine_version_to_query (List.append path [ "EngineVersion" ]) x.engine_version;
      custom_engine_name_to_query (List.append path [ "Engine" ]) x.engine;
    ]

let create_custom_db_engine_version_fault_to_query path (x : create_custom_db_engine_version_fault)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let create_blue_green_deployment_response_to_query path (x : create_blue_green_deployment_response)
    =
  List.concat
    [
      (match x.blue_green_deployment with
      | None -> []
      | Some v -> blue_green_deployment_to_query (List.append path [ "BlueGreenDeployment" ]) v);
    ]

let create_blue_green_deployment_request_to_query path (x : create_blue_green_deployment_request) =
  List.concat
    [
      (match x.target_storage_throughput with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "TargetStorageThroughput" ]) v);
      (match x.target_allocated_storage with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "TargetAllocatedStorage" ]) v);
      (match x.target_storage_type with
      | None -> []
      | Some v -> target_storage_type_to_query (List.append path [ "TargetStorageType" ]) v);
      (match x.target_iops with
      | None -> []
      | Some v -> integer_optional_to_query (List.append path [ "TargetIops" ]) v);
      (match x.upgrade_target_storage_config with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "UpgradeTargetStorageConfig" ]) v);
      (match x.target_db_instance_class with
      | None -> []
      | Some v -> target_db_instance_class_to_query (List.append path [ "TargetDBInstanceClass" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.target_db_cluster_parameter_group_name with
      | None -> []
      | Some v ->
          target_db_cluster_parameter_group_name_to_query
            (List.append path [ "TargetDBClusterParameterGroupName" ])
            v);
      (match x.target_db_parameter_group_name with
      | None -> []
      | Some v ->
          target_db_parameter_group_name_to_query
            (List.append path [ "TargetDBParameterGroupName" ])
            v);
      (match x.target_engine_version with
      | None -> []
      | Some v -> target_engine_version_to_query (List.append path [ "TargetEngineVersion" ]) v);
      database_arn_to_query (List.append path [ "Source" ]) x.source;
      blue_green_deployment_name_to_query
        (List.append path [ "BlueGreenDeploymentName" ])
        x.blue_green_deployment_name;
    ]

let blue_green_deployment_already_exists_fault_to_query path
    (x : blue_green_deployment_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let copy_option_group_result_to_query path (x : copy_option_group_result) =
  List.concat
    [
      (match x.option_group with
      | None -> []
      | Some v -> option_group_to_query (List.append path [ "OptionGroup" ]) v);
    ]

let copy_option_group_message_to_query path (x : copy_option_group_message) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query
        (List.append path [ "TargetOptionGroupDescription" ])
        x.target_option_group_description;
      string__to_query
        (List.append path [ "TargetOptionGroupIdentifier" ])
        x.target_option_group_identifier;
      string__to_query
        (List.append path [ "SourceOptionGroupIdentifier" ])
        x.source_option_group_identifier;
    ]

let copy_db_snapshot_result_to_query path (x : copy_db_snapshot_result) =
  List.concat
    [
      (match x.db_snapshot with
      | None -> []
      | Some v -> db_snapshot_to_query (List.append path [ "DBSnapshot" ]) v);
    ]

let copy_db_snapshot_message_to_query path (x : copy_db_snapshot_message) =
  List.concat
    [
      (match x.snapshot_availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotAvailabilityZone" ]) v);
      (match x.copy_option_group with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyOptionGroup" ]) v);
      (match x.snapshot_target with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SnapshotTarget" ]) v);
      (match x.target_custom_availability_zone with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetCustomAvailabilityZone" ]) v);
      (match x.option_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "OptionGroupName" ]) v);
      (match x.pre_signed_url with
      | None -> []
      | Some v -> sensitive_string_to_query (List.append path [ "PreSignedUrl" ]) v);
      (match x.copy_tags with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "CopyTags" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.kms_key_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "KmsKeyId" ]) v);
      string__to_query
        (List.append path [ "TargetDBSnapshotIdentifier" ])
        x.target_db_snapshot_identifier;
      string__to_query
        (List.append path [ "SourceDBSnapshotIdentifier" ])
        x.source_db_snapshot_identifier;
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
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      string__to_query
        (List.append path [ "TargetDBParameterGroupDescription" ])
        x.target_db_parameter_group_description;
      string__to_query
        (List.append path [ "TargetDBParameterGroupIdentifier" ])
        x.target_db_parameter_group_identifier;
      string__to_query
        (List.append path [ "SourceDBParameterGroupIdentifier" ])
        x.source_db_parameter_group_identifier;
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
      | Some v -> sensitive_string_to_query (List.append path [ "PreSignedUrl" ]) v);
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

let cancel_export_task_message_to_query path (x : cancel_export_task_message) =
  List.concat
    [ string__to_query (List.append path [ "ExportTaskIdentifier" ]) x.export_task_identifier ]

let backtrack_db_cluster_message_to_query path (x : backtrack_db_cluster_message) =
  List.concat
    [
      (match x.use_earliest_time_on_point_in_time_unavailable with
      | None -> []
      | Some v ->
          boolean_optional_to_query
            (List.append path [ "UseEarliestTimeOnPointInTimeUnavailable" ])
            v);
      (match x.force with
      | None -> []
      | Some v -> boolean_optional_to_query (List.append path [ "Force" ]) v);
      t_stamp_to_query (List.append path [ "BacktrackTo" ]) x.backtrack_to;
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
    ]

let authorize_db_security_group_ingress_result_to_query path
    (x : authorize_db_security_group_ingress_result) =
  List.concat
    [
      (match x.db_security_group with
      | None -> []
      | Some v -> db_security_group_to_query (List.append path [ "DBSecurityGroup" ]) v);
    ]

let authorize_db_security_group_ingress_message_to_query path
    (x : authorize_db_security_group_ingress_message) =
  List.concat
    [
      (match x.ec2_security_group_owner_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupOwnerId" ]) v);
      (match x.ec2_security_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupId" ]) v);
      (match x.ec2_security_group_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EC2SecurityGroupName" ]) v);
      (match x.cidri_p with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CIDRIP" ]) v);
      string__to_query (List.append path [ "DBSecurityGroupName" ]) x.db_security_group_name;
    ]

let authorization_quota_exceeded_fault_to_query path (x : authorization_quota_exceeded_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
    ]

let authorization_already_exists_fault_to_query path (x : authorization_already_exists_fault) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "message" ]) v);
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

let add_role_to_db_instance_message_to_query path (x : add_role_to_db_instance_message) =
  List.concat
    [
      string__to_query (List.append path [ "FeatureName" ]) x.feature_name;
      string__to_query (List.append path [ "RoleArn" ]) x.role_arn;
      string__to_query (List.append path [ "DBInstanceIdentifier" ]) x.db_instance_identifier;
    ]

let add_role_to_db_cluster_message_to_query path (x : add_role_to_db_cluster_message) =
  List.concat
    [
      (match x.feature_name with
      | None -> []
      | Some v -> string__to_query (List.append path [ "FeatureName" ]) v);
      string__to_query (List.append path [ "RoleArn" ]) x.role_arn;
      string__to_query (List.append path [ "DBClusterIdentifier" ]) x.db_cluster_identifier;
    ]
