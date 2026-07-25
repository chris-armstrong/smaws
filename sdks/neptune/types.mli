type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec invalid_db_cluster_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The DB cluster is not in a valid state.\n"]

type nonrec db_cluster_role_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "You have exceeded the maximum number of IAM roles that can be associated with the specified DB \
   cluster.\n"]

type nonrec db_cluster_role_already_exists_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "The specified IAM role Amazon Resource Name (ARN) is already associated with the specified DB \
   cluster.\n"]

type nonrec db_cluster_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc " {i DBClusterIdentifier} does not refer to an existing DB cluster.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec add_role_to_db_cluster_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc "The name of the DB cluster to associate the IAM role with.\n"]
  role_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to associate with the Neptune DB cluster, \
         for example [arn:aws:iam::123456789012:role/NeptuneAccessRole].\n"]
  feature_name : string_ option;
      [@ocaml.doc
        "The name of the feature for the Neptune DB cluster that the IAM role is to be associated \
         with. For the list of supported feature names, see [DBEngineVersion].\n"]
}
[@@ocaml.doc ""]

type nonrec subscription_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The designated subscription could not be found.\n"]

type nonrec source_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The source could not be found.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec event_categories_list = string_ list [@@ocaml.doc ""]

type nonrec source_ids_list = string_ list [@@ocaml.doc ""]

type nonrec event_subscription = {
  customer_aws_id : string_ option;
      [@ocaml.doc
        "The Amazon customer account associated with the event notification subscription.\n"]
  cust_subscription_id : string_ option; [@ocaml.doc "The event notification subscription Id.\n"]
  sns_topic_arn : string_ option;
      [@ocaml.doc "The topic ARN of the event notification subscription.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the event notification subscription.\n\n\
        \ Constraints:\n\
        \ \n\
        \  Can be one of the following: creating | modifying | deleting | active | no-permission | \
         topic-not-exist\n\
        \  \n\
        \   The status \"no-permission\" indicates that Neptune no longer has permission to post \
         to the SNS topic. The status \"topic-not-exist\" indicates that the topic was deleted \
         after the subscription was created.\n\
        \   "]
  subscription_creation_time : string_ option;
      [@ocaml.doc "The time the event notification subscription was created.\n"]
  source_type : string_ option;
      [@ocaml.doc "The source type for the event notification subscription.\n"]
  source_ids_list : source_ids_list option;
      [@ocaml.doc "A list of source IDs for the event notification subscription.\n"]
  event_categories_list : event_categories_list option;
      [@ocaml.doc "A list of event categories for the event notification subscription.\n"]
  enabled : boolean_ option;
      [@ocaml.doc
        "A Boolean value indicating if the subscription is enabled. True indicates the \
         subscription is enabled.\n"]
  event_subscription_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the event subscription.\n"]
}
[@@ocaml.doc
  "Contains the results of a successful invocation of the [DescribeEventSubscriptions] action.\n"]

type nonrec add_source_identifier_to_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec add_source_identifier_to_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc
        "The name of the event notification subscription you want to add a source identifier to.\n"]
  source_identifier : string_;
      [@ocaml.doc
        "The identifier of the event source to be added.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If the source type is a DB instance, then a [DBInstanceIdentifier] must be \
         supplied.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is a DB security group, a [DBSecurityGroupName] must be \
         supplied.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is a DB parameter group, a [DBParameterGroupName] must be \
         supplied.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is a DB snapshot, a [DBSnapshotIdentifier] must be supplied.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec db_snapshot_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc " {i DBSnapshotIdentifier} does not refer to an existing DB snapshot.\n"]

type nonrec db_instance_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc " {i DBInstanceIdentifier} does not refer to an existing DB instance.\n"]

type nonrec tag = {
  key : string_ option;
      [@ocaml.doc
        "A key is the required name of the tag. The string value can be from 1 to 128 Unicode \
         characters in length and can't be prefixed with [aws:] or [rds:]. The string can only \
         contain the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' \
         (Java regex: \"^(\\[\\\\p\\{L\\}\\\\p\\{Z\\}\\\\p\\{N\\}_.:/=+\\\\-\\]*)$\").\n"]
  value : string_ option;
      [@ocaml.doc
        "A value is the optional value of the tag. The string value can be from 1 to 256 Unicode \
         characters in length and can't be prefixed with [aws:] or [rds:]. The string can only \
         contain the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' \
         (Java regex: \"^(\\[\\\\p\\{L\\}\\\\p\\{Z\\}\\\\p\\{N\\}_.:/=+\\\\-\\]*)$\").\n"]
}
[@@ocaml.doc "Metadata assigned to an Amazon Neptune resource consisting of a key-value pair.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec add_tags_to_resource_message = {
  resource_name : string_;
      [@ocaml.doc
        "The Amazon Neptune resource that the tags are added to. This value is an Amazon Resource \
         Name (ARN). For information about creating an ARN, see \
         {{:https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing} \
         Constructing an Amazon Resource Name (ARN)}.\n"]
  tags : tag_list; [@ocaml.doc "The tags to be assigned to the Amazon Neptune resource.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_global_cluster_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "The global cluster is in an invalid state and can't perform the requested operation. \n"]

type nonrec global_cluster_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "The [GlobalClusterIdentifier] doesn't refer to an existing global database cluster. \n"]

type nonrec failover_status =
  | PENDING [@ocaml.doc ""]
  | FAILING_OVER [@ocaml.doc ""]
  | CANCELLING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec failover_state = {
  status : failover_status option;
      [@ocaml.doc
        "The current status of the global cluster. Possible values are as follows:\n\n\
        \ {ul\n\
        \       {-  pending \194\150 The service received a request to switch over or fail over \
         the global cluster. The global cluster's primary DB cluster and the specified secondary \
         DB cluster are being verified before the operation starts.\n\
        \           \n\
        \            }\n\
        \       {-  failing-over \194\150 Neptune is promoting the chosen secondary Neptune DB \
         cluster to become the new primary DB cluster to fail over the global cluster.\n\
        \           \n\
        \            }\n\
        \       {-  cancelling \194\150 The request to switch over or fail over the global cluster \
         was cancelled and the primary Neptune DB cluster and the selected secondary Neptune DB \
         cluster are returning to their previous states.\n\
        \           \n\
        \            }\n\
        \       {-  switching-over \194\150 This status covers the range of Neptune internal \
         operations that take place during the switchover process, such as demoting the primary \
         Neptune DB cluster, promoting the secondary Neptune DB cluster, and synchronizing \
         replicas.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  from_db_cluster_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Neptune DB cluster that is currently being demoted, \
         and which is associated with this state.\n"]
  to_db_cluster_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Neptune DB cluster that is currently being \
         promoted, and which is associated with this state.\n"]
  is_data_loss_allowed : boolean_ option;
      [@ocaml.doc
        "Indicates whether the operation is a global switchover or a global failover. If data loss \
         is allowed, then the operation is a global failover. Otherwise, it's a switchover.\n"]
}
[@@ocaml.doc
  "Contains the state of scheduled or in-process operations on a global cluster (Neptune global \
   database). This data type is empty unless a switchover or failover operation is scheduled or is \
   in progress on the Neptune global database.\n"]

type nonrec readers_arn_list = string_ list [@@ocaml.doc ""]

type nonrec global_cluster_member = {
  db_cluster_arn : string_ option;
      [@ocaml.doc " The Amazon Resource Name (ARN) for each Neptune cluster. \n"]
  readers : readers_arn_list option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) for each read-only secondary cluster associated with the \
         Neptune global database. \n"]
  is_writer : boolean_ option;
      [@ocaml.doc
        " Specifies whether the Neptune cluster is the primary cluster (that is, has read-write \
         capability) for the Neptune global database with which it is associated. \n"]
}
[@@ocaml.doc
  " A data structure with information about any primary and secondary clusters associated with an \
   Neptune global database. \n"]

type nonrec global_cluster_member_list = global_cluster_member list [@@ocaml.doc ""]

type nonrec boolean_optional = bool [@@ocaml.doc ""]

type nonrec global_cluster_identifier = string [@@ocaml.doc ""]

type nonrec global_cluster = {
  global_cluster_identifier : global_cluster_identifier option;
      [@ocaml.doc
        "Contains a user-supplied global database cluster identifier. This identifier is the \
         unique key that identifies a global database.\n"]
  global_cluster_resource_id : string_ option;
      [@ocaml.doc
        "An immutable identifier for the global database that is unique within all regions. This \
         identifier is found in CloudTrail log entries whenever the KMS key for the DB cluster is \
         accessed.\n"]
  global_cluster_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the global database.\n"]
  status : string_ option; [@ocaml.doc "Specifies the current state of this global database.\n"]
  engine : string_ option;
      [@ocaml.doc "The Neptune database engine used by the global database ([\"neptune\"]).\n"]
  engine_version : string_ option;
      [@ocaml.doc "The Neptune engine version used by the global database.\n"]
  database_name : string_ option;
      [@ocaml.doc "The default database name within the new global database cluster.\n"]
  storage_encrypted : boolean_optional option;
      [@ocaml.doc "The storage encryption setting for the global database.\n"]
  deletion_protection : boolean_optional option;
      [@ocaml.doc "The deletion protection setting for the global database.\n"]
  global_cluster_members : global_cluster_member_list option;
      [@ocaml.doc
        "A list of cluster ARNs and instance ARNs for all the DB clusters that are part of the \
         global database.\n"]
  failover_state : failover_state option;
      [@ocaml.doc
        "A data object containing all properties for the current state of an in-process or pending \
         switchover or failover process for this global cluster (Neptune global database). This \
         object is empty unless the [SwitchoverGlobalCluster] or [FailoverGlobalCluster] operation \
         was called on this global cluster.\n"]
  tag_list : tag_list option; [@ocaml.doc "A list of global cluster tags.\n"]
}
[@@ocaml.doc
  "Contains the details of an Amazon Neptune global database.\n\n\
  \ This data type is used as a response element for the [CreateGlobalCluster], \
   [DescribeGlobalClusters], [ModifyGlobalCluster], [DeleteGlobalCluster], \
   [FailoverGlobalCluster], and [RemoveFromGlobalCluster] actions.\n\
  \ "]

type nonrec switchover_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec switchover_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc
        "The identifier of the global database cluster to switch over. This parameter isn't \
         case-sensitive.\n\n\
        \ Constraints: Must match the identifier of an existing global database cluster.\n\
        \ "]
  target_db_cluster_identifier : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the secondary Neptune DB cluster that you want to \
         promote to primary for the global database.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_db_instance_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The specified DB instance is not in the {i available} state.\n"]

type nonrec t_stamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec double_optional = float [@@ocaml.doc ""]

type nonrec serverless_v2_scaling_configuration_info = {
  min_capacity : double_optional option;
      [@ocaml.doc
        "The minimum number of Neptune capacity units (NCUs) for a DB instance in a Neptune \
         Serverless cluster. You can specify NCU values in half-step increments, such as 8, 8.5, \
         9, and so on.\n"]
  max_capacity : double_optional option;
      [@ocaml.doc
        "The maximum number of Neptune capacity units (NCUs) for a DB instance in a Neptune \
         Serverless cluster. You can specify NCU values in half-step increments, such as 40, 40.5, \
         41, and so on.\n"]
}
[@@ocaml.doc
  "Shows the scaling configuration for a Neptune Serverless DB cluster.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html}Using \
   Amazon Neptune Serverless} in the {i Amazon Neptune User Guide}.\n\
  \ "]

type nonrec integer_optional = int [@@ocaml.doc ""]

type nonrec log_type_list = string_ list [@@ocaml.doc ""]

type nonrec pending_cloudwatch_logs_exports = {
  log_types_to_enable : log_type_list option;
      [@ocaml.doc
        "Log types that are in the process of being deactivated. After they are deactivated, these \
         log types aren't exported to CloudWatch Logs.\n"]
  log_types_to_disable : log_type_list option;
      [@ocaml.doc
        "Log types that are in the process of being enabled. After they are enabled, these log \
         types are exported to CloudWatch Logs.\n"]
}
[@@ocaml.doc
  "A list of the log types whose configuration is still pending. In other words, these log types \
   are in the process of being activated or deactivated.\n\n\
  \ Valid log types are: [audit] (to publish audit logs) and [slowquery] (to publish slow-query \
   logs). See \
   {{:https://docs.aws.amazon.com/neptune/latest/userguide/cloudwatch-logs.html}Publishing Neptune \
   logs to Amazon CloudWatch logs}.\n\
  \ "]

type nonrec cluster_pending_modified_values = {
  pending_cloudwatch_logs_exports : pending_cloudwatch_logs_exports option;
      [@ocaml.doc
        "This [PendingCloudwatchLogsExports] structure specifies pending changes to which \
         CloudWatch logs are enabled and which are disabled.\n"]
  db_cluster_identifier : string_ option;
      [@ocaml.doc "The DBClusterIdentifier value for the DB cluster.\n"]
  iam_database_authentication_enabled : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether mapping of Amazon Web Services Identity and Access \
         Management (IAM) accounts to database accounts is enabled.\n"]
  engine_version : string_ option; [@ocaml.doc "The database engine version.\n"]
  backup_retention_period : integer_optional option;
      [@ocaml.doc "The number of days for which automatic DB snapshots are retained.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "The pending change in storage type for the DB cluster. \194\160 Valid Values:\n\n\
        \ {ul\n\
        \       {-   {b  [standard] } \194\160 \226\128\147 \194\160 ( {i the default} ) \
         Configures cost-effective database storage for applications with moderate to small I/O \
         usage.\n\
        \           \n\
        \            }\n\
        \       {-   {b  [iopt1] } \194\160 \226\128\147 \194\160 Enables \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/storage-types.html#provisioned-iops-storage}I/O-Optimized \
         storage} that's designed to meet the needs of I/O-intensive graph workloads that require \
         predictable pricing with low I/O latency and consistent I/O throughput.\n\
        \           \n\
        \            Neptune I/O-Optimized storage is only available starting with engine release \
         1.3.0.0.\n\
        \            \n\
        \             }\n\
        \       }\n\
        \  "]
  allocated_storage : integer_optional option;
      [@ocaml.doc
        "The allocated storage size in gibibytes (GiB) for database engines. For Neptune, \
         [AllocatedStorage] always returns 1, because Neptune DB cluster storage size isn't fixed, \
         but instead automatically adjusts as needed.\n"]
  iops : integer_optional option;
      [@ocaml.doc
        "The Provisioned IOPS (I/O operations per second) value. This setting is only for Multi-AZ \
         DB clusters.\n"]
  network_type : string_ option;
      [@ocaml.doc
        "The pending change in network type for the DB cluster.\n\n\
        \ Valid Values: [IPV4], [DUAL] \n\
        \ "]
}
[@@ocaml.doc
  "This data type is used as a response element in the [ModifyDBCluster] operation and contains \
   changes that will be applied during the next maintenance window.\n"]

type nonrec db_cluster_role = {
  role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that is associated with the DB cluster.\n"]
  status : string_ option;
      [@ocaml.doc
        "Describes the state of association between the IAM role and the DB cluster. The Status \
         property returns one of the following values:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] - the IAM role ARN is associated with the DB cluster and can be used \
         to access other Amazon services on your behalf.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING] - the IAM role ARN is being associated with the DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [INVALID] - the IAM role ARN is associated with the DB cluster, but the DB \
         cluster is unable to assume the IAM role in order to access other Amazon services on your \
         behalf.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  feature_name : string_ option;
      [@ocaml.doc
        "The name of the feature associated with the Amazon Identity and Access Management (IAM) \
         role. For the list of supported feature names, see [DescribeDBEngineVersions]. \n"]
}
[@@ocaml.doc
  "Describes an Amazon Identity and Access Management (IAM) role that is associated with a DB \
   cluster.\n"]

type nonrec db_cluster_roles = db_cluster_role list [@@ocaml.doc ""]

type nonrec vpc_security_group_membership = {
  vpc_security_group_id : string_ option; [@ocaml.doc "The name of the VPC security group.\n"]
  status : string_ option; [@ocaml.doc "The status of the VPC security group.\n"]
}
[@@ocaml.doc
  "This data type is used as a response element for queries on VPC security group membership.\n"]

type nonrec vpc_security_group_membership_list = vpc_security_group_membership list [@@ocaml.doc ""]

type nonrec db_cluster_member = {
  db_instance_identifier : string_ option;
      [@ocaml.doc "Specifies the instance identifier for this member of the DB cluster.\n"]
  is_cluster_writer : boolean_ option;
      [@ocaml.doc
        "Value that is [true] if the cluster member is the primary instance for the DB cluster and \
         [false] otherwise.\n"]
  db_cluster_parameter_group_status : string_ option;
      [@ocaml.doc
        "Specifies the status of the DB cluster parameter group for this member of the DB cluster.\n"]
  promotion_tier : integer_optional option;
      [@ocaml.doc
        "A value that specifies the order in which a Read Replica is promoted to the primary \
         instance after a failure of the existing primary instance.\n"]
}
[@@ocaml.doc "Contains information about an instance that is part of a DB cluster.\n"]

type nonrec db_cluster_member_list = db_cluster_member list [@@ocaml.doc ""]

type nonrec read_replica_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec db_cluster_option_group_status = {
  db_cluster_option_group_name : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  status : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
}
[@@ocaml.doc "Not supported by Neptune.\n"]

type nonrec db_cluster_option_group_memberships = db_cluster_option_group_status list
[@@ocaml.doc ""]

type nonrec availability_zones = string_ list [@@ocaml.doc ""]

type nonrec db_cluster = {
  allocated_storage : integer_optional option;
      [@ocaml.doc
        " [AllocatedStorage] always returns 1, because Neptune DB cluster storage size is not \
         fixed, but instead automatically adjusts as needed.\n"]
  availability_zones : availability_zones option;
      [@ocaml.doc
        "Provides the list of EC2 Availability Zones that instances in the DB cluster can be \
         created in.\n"]
  backup_retention_period : integer_optional option;
      [@ocaml.doc "Specifies the number of days for which automatic DB snapshots are retained.\n"]
  character_set_name : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  database_name : string_ option;
      [@ocaml.doc
        "Contains the name of the initial database of this DB cluster that was provided at create \
         time, if one was specified when the DB cluster was created. This same name is returned \
         for the life of the DB cluster.\n"]
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "Contains a user-supplied DB cluster identifier. This identifier is the unique key that \
         identifies a DB cluster.\n"]
  db_cluster_parameter_group : string_ option;
      [@ocaml.doc "Specifies the name of the DB cluster parameter group for the DB cluster.\n"]
  db_subnet_group : string_ option;
      [@ocaml.doc
        "Specifies information on the subnet group associated with the DB cluster, including the \
         name, description, and subnets in the subnet group.\n"]
  status : string_ option; [@ocaml.doc "Specifies the current state of this DB cluster.\n"]
  percent_progress : string_ option;
      [@ocaml.doc "Specifies the progress of the operation as a percentage.\n"]
  earliest_restorable_time : t_stamp option;
      [@ocaml.doc
        "Specifies the earliest time to which a database can be restored with point-in-time restore.\n"]
  endpoint : string_ option;
      [@ocaml.doc "Specifies the connection endpoint for the primary instance of the DB cluster.\n"]
  reader_endpoint : string_ option;
      [@ocaml.doc
        "The reader endpoint for the DB cluster. The reader endpoint for a DB cluster \
         load-balances connections across the Read Replicas that are available in a DB cluster. As \
         clients request new connections to the reader endpoint, Neptune distributes the \
         connection requests among the Read Replicas in the DB cluster. This functionality can \
         help balance your read workload across multiple Read Replicas in your DB cluster.\n\n\
        \ If a failover occurs, and the Read Replica that you are connected to is promoted to be \
         the primary instance, your connection is dropped. To continue sending your read workload \
         to other Read Replicas in the cluster, you can then reconnect to the reader endpoint.\n\
        \ "]
  multi_a_z : boolean_ option;
      [@ocaml.doc
        "Specifies whether the DB cluster has instances in multiple Availability Zones.\n"]
  engine : string_ option;
      [@ocaml.doc "Provides the name of the database engine to be used for this DB cluster.\n"]
  engine_version : string_ option; [@ocaml.doc "Indicates the database engine version.\n"]
  latest_restorable_time : t_stamp option;
      [@ocaml.doc
        "Specifies the latest time to which a database can be restored with point-in-time restore.\n"]
  port : integer_optional option;
      [@ocaml.doc "Specifies the port that the database engine is listening on.\n"]
  master_username : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  db_cluster_option_group_memberships : db_cluster_option_group_memberships option;
      [@ocaml.doc "Not supported by Neptune.\n"]
  preferred_backup_window : string_ option;
      [@ocaml.doc
        "Specifies the daily time range during which automated backups are created if automated \
         backups are enabled, as determined by the [BackupRetentionPeriod].\n"]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "Specifies the weekly time range during which system maintenance can occur, in Universal \
         Coordinated Time (UTC).\n"]
  replication_source_identifier : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  read_replica_identifiers : read_replica_identifier_list option;
      [@ocaml.doc
        "Contains one or more identifiers of the Read Replicas associated with this DB cluster.\n"]
  db_cluster_members : db_cluster_member_list option;
      [@ocaml.doc "Provides the list of instances that make up the DB cluster.\n"]
  vpc_security_groups : vpc_security_group_membership_list option;
      [@ocaml.doc "Provides a list of VPC security groups that the DB cluster belongs to.\n"]
  hosted_zone_id : string_ option;
      [@ocaml.doc "Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.\n"]
  storage_encrypted : boolean_ option;
      [@ocaml.doc "Specifies whether the DB cluster is encrypted.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "If [StorageEncrypted] is true, the Amazon KMS key identifier for the encrypted DB cluster.\n"]
  db_cluster_resource_id : string_ option;
      [@ocaml.doc
        "The Amazon Region-unique, immutable identifier for the DB cluster. This identifier is \
         found in Amazon CloudTrail log entries whenever the Amazon KMS key for the DB cluster is \
         accessed.\n"]
  db_cluster_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the DB cluster.\n"]
  associated_roles : db_cluster_roles option;
      [@ocaml.doc
        "Provides a list of the Amazon Identity and Access Management (IAM) roles that are \
         associated with the DB cluster. IAM roles that are associated with a DB cluster grant \
         permission for the DB cluster to access other Amazon services on your behalf.\n"]
  iam_database_authentication_enabled : boolean_ option;
      [@ocaml.doc
        "True if mapping of Amazon Identity and Access Management (IAM) accounts to database \
         accounts is enabled, and otherwise false.\n"]
  clone_group_id : string_ option;
      [@ocaml.doc "Identifies the clone group to which the DB cluster is associated.\n"]
  cluster_create_time : t_stamp option;
      [@ocaml.doc
        "Specifies the time when the DB cluster was created, in Universal Coordinated Time (UTC).\n"]
  copy_tags_to_snapshot : boolean_optional option;
      [@ocaml.doc
        " {i If set to [true], tags are copied to any snapshot of the DB cluster that is created.} \n"]
  enabled_cloudwatch_logs_exports : log_type_list option;
      [@ocaml.doc
        "A list of the log types that this DB cluster is configured to export to CloudWatch Logs. \
         Valid log types are: [audit] (to publish audit logs to CloudWatch) and slowquery (to \
         publish slow-query logs to CloudWatch). See \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/cloudwatch-logs.html}Publishing \
         Neptune logs to Amazon CloudWatch logs}.\n"]
  pending_modified_values : cluster_pending_modified_values option;
      [@ocaml.doc
        "This data type is used as a response element in the [ModifyDBCluster] operation and \
         contains changes that will be applied during the next maintenance window.\n"]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "Indicates whether or not the DB cluster has deletion protection enabled. The database \
         can't be deleted when deletion protection is enabled.\n"]
  cross_account_clone : boolean_optional option;
      [@ocaml.doc "If set to [true], the DB cluster can be cloned across accounts.\n"]
  automatic_restart_time : t_stamp option;
      [@ocaml.doc "Time at which the DB cluster will be automatically restarted.\n"]
  serverless_v2_scaling_configuration : serverless_v2_scaling_configuration_info option;
      [@ocaml.doc
        "Shows the scaling configuration for a Neptune Serverless DB cluster.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html}Using \
         Amazon Neptune Serverless} in the {i Amazon Neptune User Guide}.\n\
        \ "]
  global_cluster_identifier : global_cluster_identifier option;
      [@ocaml.doc
        "Contains a user-supplied global database cluster identifier. This identifier is the \
         unique key that identifies a global database.\n"]
  io_optimized_next_allowed_modification_time : t_stamp option;
      [@ocaml.doc "The next time you can modify the DB cluster to use the [iopt1] storage type.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "The storage type used by the DB cluster.\n\n\
        \ Valid Values:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [standard] } \194\160 \226\128\147 \194\160 ( {i the default} ) Provides \
         cost-effective database storage for applications with moderate to small I/O usage.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [iopt1] } \194\160 \226\128\147 \194\160 Enables \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/storage-types.html#provisioned-iops-storage}I/O-Optimized \
         storage} that's designed to meet the needs of I/O-intensive graph workloads that require \
         predictable pricing with low I/O latency and consistent I/O throughput.\n\
        \            \n\
        \             Neptune I/O-Optimized storage is only available starting with engine release \
         1.3.0.0.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  network_type : string_ option;
      [@ocaml.doc
        "The network type of the DB cluster.\n\n\
        \ Valid Values:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [IPV4] } \194\160 \226\128\147 \194\160 The DB cluster uses only IPv4 \
         addresses for communication.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [DUAL] } \194\160 \226\128\147 \194\160 The DB cluster uses both IPv4 \
         and IPv6 addresses for communication.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Contains the details of an Amazon Neptune DB cluster.\n\n\
  \ This data type is used as a response element in the [DescribeDBClusters].\n\
  \ "]

type nonrec stop_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec stop_db_cluster_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The DB cluster identifier of the Neptune DB cluster to be stopped. This parameter is \
         stored as a lowercase string.\n"]
}
[@@ocaml.doc ""]

type nonrec start_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec start_db_cluster_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The DB cluster identifier of the Neptune DB cluster to be started. This parameter is \
         stored as a lowercase string.\n"]
}
[@@ocaml.doc ""]

type nonrec storage_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "Request would result in user exceeding the allowed amount of storage available across all DB \
   instances.\n"]

type nonrec option_group_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The designated option group could not be found.\n"]

type nonrec network_type_not_supported_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "The specified {i NetworkType} is not supported for the DB cluster, DB subnet group, or \
   orderable DB instance option.\n"]

type nonrec kms_key_not_accessible_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "Error accessing KMS key.\n"]

type nonrec invalid_vpc_network_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "DB subnet group does not cover all Availability Zones after it is created because users' change.\n"]

type nonrec invalid_subnet = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "The requested subnet is invalid, or multiple subnets were requested that are not all in a \
   common VPC.\n"]

type nonrec invalid_restore_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "Cannot restore from vpc backup to non-vpc DB instance.\n"]

type nonrec invalid_db_snapshot_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The state of the DB snapshot does not allow deletion.\n"]

type nonrec invalid_db_cluster_snapshot_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The supplied value is not a valid DB cluster snapshot state.\n"]

type nonrec insufficient_storage_cluster_capacity_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "There is insufficient storage available for the current action. You may be able to resolve this \
   error by updating your subnet group to use different Availability Zones that have more storage \
   available.\n"]

type nonrec insufficient_db_cluster_capacity_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The DB cluster does not have enough capacity for the current operation.\n"]

type nonrec db_subnet_group_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc " {i DBSubnetGroupName} does not refer to an existing DB subnet group.\n"]

type nonrec db_cluster_snapshot_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  " {i DBClusterSnapshotIdentifier} does not refer to an existing DB cluster snapshot.\n"]

type nonrec db_cluster_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "User attempted to create a new DB cluster and the user has already reached the maximum allowed \
   DB cluster quota.\n"]

type nonrec db_cluster_parameter_group_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  " {i DBClusterParameterGroupName} does not refer to an existing DB Cluster parameter group.\n"]

type nonrec db_cluster_already_exists_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "User already has a DB cluster with the given identifier.\n"]

type nonrec restore_db_cluster_to_point_in_time_result = {
  db_cluster : db_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec serverless_v2_scaling_configuration = {
  min_capacity : double_optional option;
      [@ocaml.doc
        "The minimum number of Neptune capacity units (NCUs) for a DB instance in a Neptune \
         Serverless cluster. You can specify NCU values in half-step increments, such as 8, 8.5, \
         9, and so on.\n"]
  max_capacity : double_optional option;
      [@ocaml.doc
        "The maximum number of Neptune capacity units (NCUs) for a DB instance in a Neptune \
         Serverless cluster. You can specify NCU values in half-step increments, such as 40, 40.5, \
         41, and so on.\n"]
}
[@@ocaml.doc
  "Contains the scaling configuration of a Neptune Serverless DB cluster.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html}Using \
   Amazon Neptune Serverless} in the {i Amazon Neptune User Guide}.\n\
  \ "]

type nonrec vpc_security_group_id_list = string_ list [@@ocaml.doc ""]

type nonrec restore_db_cluster_to_point_in_time_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The name of the new DB cluster to be created.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  restore_type : string_ option;
      [@ocaml.doc
        "The type of restore to be performed. You can specify one of the following values:\n\n\
        \ {ul\n\
        \       {-   [full-copy] - The new DB cluster is restored as a full copy of the source DB \
         cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [copy-on-write] - The new DB cluster is restored as a clone of the source DB \
         cluster.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If you don't specify a [RestoreType] value, then the new DB cluster is restored as a \
         full copy of the source DB cluster.\n\
        \   "]
  source_db_cluster_identifier : string_;
      [@ocaml.doc
        "The identifier of the source DB cluster from which to restore.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing DBCluster.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  restore_to_time : t_stamp option;
      [@ocaml.doc
        "The date and time to restore the DB cluster to.\n\n\
        \ Valid Values: Value must be a time in Universal Coordinated Time (UTC) format\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be before the latest restorable time for the DB instance\n\
        \             \n\
        \              }\n\
        \         {-  Must be specified if [UseLatestRestorableTime] parameter is not provided\n\
        \             \n\
        \              }\n\
        \         {-  Cannot be specified if [UseLatestRestorableTime] parameter is true\n\
        \             \n\
        \              }\n\
        \         {-  Cannot be specified if [RestoreType] parameter is [copy-on-write] \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   Example: [2015-03-07T23:45:00Z] \n\
        \   "]
  use_latest_restorable_time : boolean_ option;
      [@ocaml.doc
        "A value that is set to [true] to restore the DB cluster to the latest restorable backup \
         time, and [false] otherwise.\n\n\
        \ Default: [false] \n\
        \ \n\
        \  Constraints: Cannot be specified if [RestoreToTime] parameter is provided.\n\
        \  "]
  port : integer_optional option;
      [@ocaml.doc
        "The port number on which the new DB cluster accepts connections.\n\n\
        \ Constraints: Value must be [1150-65535] \n\
        \ \n\
        \  Default: The same port as the original DB cluster.\n\
        \  "]
  db_subnet_group_name : string_ option;
      [@ocaml.doc
        "The DB subnet group name to use for the new DB cluster.\n\n\
        \ Constraints: If supplied, must match the name of an existing DBSubnetGroup.\n\
        \ \n\
        \  Example: [mySubnetgroup] \n\
        \  "]
  option_group_name : string_ option; [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of VPC security groups that the new DB cluster belongs to.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be applied to the restored DB cluster.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Amazon KMS key identifier to use when restoring an encrypted DB cluster from an \
         encrypted DB cluster.\n\n\
        \ The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If \
         you are restoring a DB cluster with the same Amazon account that owns the KMS encryption \
         key used to encrypt the new DB cluster, then you can use the KMS key alias instead of the \
         ARN for the KMS encryption key.\n\
        \ \n\
        \  You can restore to a new DB cluster and encrypt the new DB cluster with a KMS key that \
         is different than the KMS key used to encrypt the source DB cluster. The new DB cluster \
         is encrypted with the KMS key identified by the [KmsKeyId] parameter.\n\
        \  \n\
        \   If you do not specify a value for the [KmsKeyId] parameter, then the following will \
         occur:\n\
        \   \n\
        \    {ul\n\
        \          {-  If the DB cluster is encrypted, then the restored DB cluster is encrypted \
         using the KMS key that was used to encrypt the source DB cluster.\n\
        \              \n\
        \               }\n\
        \          {-  If the DB cluster is not encrypted, then the restored DB cluster is not \
         encrypted.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   If [DBClusterIdentifier] refers to a DB cluster that is not encrypted, then the \
         restore request is rejected.\n\
        \   "]
  enable_iam_database_authentication : boolean_optional option;
      [@ocaml.doc
        "True to enable mapping of Amazon Identity and Access Management (IAM) accounts to \
         database accounts, and otherwise false.\n\n\
        \ Default: [false] \n\
        \ "]
  enable_cloudwatch_logs_exports : log_type_list option;
      [@ocaml.doc
        "The list of logs that the restored DB cluster is to export to CloudWatch Logs.\n"]
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the DB cluster parameter group to associate with the new DB cluster.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match the name of an existing DBClusterParameterGroup.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether the DB cluster has deletion protection enabled. The \
         database can't be deleted when deletion protection is enabled. By default, deletion \
         protection is disabled. \n"]
  serverless_v2_scaling_configuration : serverless_v2_scaling_configuration option;
      [@ocaml.doc
        "Contains the scaling configuration of a Neptune Serverless DB cluster.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html}Using \
         Amazon Neptune Serverless} in the {i Amazon Neptune User Guide}.\n\
        \ "]
  storage_type : string_ option;
      [@ocaml.doc
        "Specifies the storage type to be associated with the DB cluster.\n\n\
        \ Valid values: [standard], [iopt1] \n\
        \ \n\
        \  Default: [standard] \n\
        \  "]
  network_type : string_ option;
      [@ocaml.doc
        "The network type of the DB cluster.\n\n\
        \ Valid Values:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [IPV4] } \194\160 \226\128\147 \194\160 ( {i the default} ) The DB \
         cluster uses only IPv4 addresses for communication.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [DUAL] } \194\160 \226\128\147 \194\160 The DB cluster uses both IPv4 \
         and IPv6 addresses for communication. The DB subnet group associated with the cluster \
         must support IPv6.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec restore_db_cluster_from_snapshot_result = {
  db_cluster : db_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec restore_db_cluster_from_snapshot_message = {
  availability_zones : availability_zones option;
      [@ocaml.doc
        "Provides the list of EC2 Availability Zones that instances in the restored DB cluster can \
         be created in.\n"]
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The name of the DB cluster to create from the DB snapshot or DB cluster snapshot. This \
         parameter isn't case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-snapshot-id] \n\
        \   "]
  snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier for the DB snapshot or DB cluster snapshot to restore from.\n\n\
        \ You can use either the name or the Amazon Resource Name (ARN) to specify a DB cluster \
         snapshot. However, you can use only the ARN to specify a DB snapshot.\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must match the identifier of an existing Snapshot.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  engine : string_;
      [@ocaml.doc
        "The database engine to use for the new DB cluster.\n\n\
        \ Default: The same as source\n\
        \ \n\
        \  Constraint: Must be compatible with the engine of the source\n\
        \  "]
  engine_version : string_ option;
      [@ocaml.doc "The version of the database engine to use for the new DB cluster.\n"]
  port : integer_optional option;
      [@ocaml.doc
        "The port number on which the new DB cluster accepts connections.\n\n\
        \ Constraints: Value must be [1150-65535] \n\
        \ \n\
        \  Default: The same port as the original DB cluster.\n\
        \  "]
  db_subnet_group_name : string_ option;
      [@ocaml.doc
        "The name of the DB subnet group to use for the new DB cluster.\n\n\
        \ Constraints: If supplied, must match the name of an existing DBSubnetGroup.\n\
        \ \n\
        \  Example: [mySubnetgroup] \n\
        \  "]
  database_name : string_ option; [@ocaml.doc "Not supported.\n"]
  option_group_name : string_ option; [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of VPC security groups that the new DB cluster will belong to.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the restored DB cluster.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Amazon KMS key identifier to use when restoring an encrypted DB cluster from a DB \
         snapshot or DB cluster snapshot.\n\n\
        \ The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If \
         you are restoring a DB cluster with the same Amazon account that owns the KMS encryption \
         key used to encrypt the new DB cluster, then you can use the KMS key alias instead of the \
         ARN for the KMS encryption key.\n\
        \ \n\
        \  If you do not specify a value for the [KmsKeyId] parameter, then the following will \
         occur:\n\
        \  \n\
        \   {ul\n\
        \         {-  If the DB snapshot or DB cluster snapshot in [SnapshotIdentifier] is \
         encrypted, then the restored DB cluster is encrypted using the KMS key that was used to \
         encrypt the DB snapshot or DB cluster snapshot.\n\
        \             \n\
        \              }\n\
        \         {-  If the DB snapshot or DB cluster snapshot in [SnapshotIdentifier] is not \
         encrypted, then the restored DB cluster is not encrypted.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  enable_iam_database_authentication : boolean_optional option;
      [@ocaml.doc
        "True to enable mapping of Amazon Identity and Access Management (IAM) accounts to \
         database accounts, and otherwise false.\n\n\
        \ Default: [false] \n\
        \ "]
  enable_cloudwatch_logs_exports : log_type_list option;
      [@ocaml.doc
        "The list of logs that the restored DB cluster is to export to Amazon CloudWatch Logs.\n"]
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the DB cluster parameter group to associate with the new DB cluster.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match the name of an existing DBClusterParameterGroup.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether the DB cluster has deletion protection enabled. The \
         database can't be deleted when deletion protection is enabled. By default, deletion \
         protection is disabled. \n"]
  copy_tags_to_snapshot : boolean_optional option;
      [@ocaml.doc
        " {i If set to [true], tags are copied to any snapshot of the restored DB cluster that is \
         created.} \n"]
  serverless_v2_scaling_configuration : serverless_v2_scaling_configuration option;
      [@ocaml.doc
        "Contains the scaling configuration of a Neptune Serverless DB cluster.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html}Using \
         Amazon Neptune Serverless} in the {i Amazon Neptune User Guide}.\n\
        \ "]
  storage_type : string_ option;
      [@ocaml.doc
        "Specifies the storage type to be associated with the DB cluster.\n\n\
        \ Valid values: [standard], [iopt1] \n\
        \ \n\
        \  Default: [standard] \n\
        \  "]
  network_type : string_ option;
      [@ocaml.doc
        "The network type of the DB cluster.\n\n\
        \ Valid Values:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [IPV4] } \194\160 \226\128\147 \194\160 ( {i the default} ) The DB \
         cluster uses only IPv4 addresses for communication.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [DUAL] } \194\160 \226\128\147 \194\160 The DB cluster uses both IPv4 \
         and IPv6 addresses for communication. The DB subnet group associated with the cluster \
         must support IPv6.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec invalid_db_parameter_group_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "The DB parameter group is in use or is in an invalid state. If you are attempting to delete the \
   parameter group, you cannot delete it when the parameter group is in this state.\n"]

type nonrec db_parameter_group_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc " {i DBParameterGroupName} does not refer to an existing DB parameter group.\n"]

type nonrec db_parameter_group_name_message = {
  db_parameter_group_name : string_ option;
      [@ocaml.doc "Provides the name of the DB parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec apply_method = Immediate [@ocaml.doc ""] | Pending_reboot [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec parameter = {
  parameter_name : string_ option; [@ocaml.doc "Specifies the name of the parameter.\n"]
  parameter_value : string_ option; [@ocaml.doc "Specifies the value of the parameter.\n"]
  description : string_ option; [@ocaml.doc "Provides a description of the parameter.\n"]
  source : string_ option; [@ocaml.doc "Indicates the source of the parameter value.\n"]
  apply_type : string_ option; [@ocaml.doc "Specifies the engine specific parameters type.\n"]
  data_type : string_ option; [@ocaml.doc "Specifies the valid data type for the parameter.\n"]
  allowed_values : string_ option;
      [@ocaml.doc "Specifies the valid range of values for the parameter.\n"]
  is_modifiable : boolean_ option;
      [@ocaml.doc
        " Indicates whether ([true]) or not ([false]) the parameter can be modified. Some \
         parameters have security or operational implications that prevent them from being changed.\n"]
  minimum_engine_version : string_ option;
      [@ocaml.doc "The earliest engine version to which the parameter can apply.\n"]
  apply_method : apply_method option; [@ocaml.doc "Indicates when to apply parameter updates.\n"]
}
[@@ocaml.doc "Specifies a parameter.\n"]

type nonrec parameters_list = parameter list [@@ocaml.doc ""]

type nonrec reset_db_parameter_group_message = {
  db_parameter_group_name : string_;
      [@ocaml.doc
        "The name of the DB parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the name of an existing DBParameterGroup.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  reset_all_parameters : boolean_ option;
      [@ocaml.doc
        "Specifies whether ([true]) or not ([false]) to reset all parameters in the DB parameter \
         group to default values.\n\n\
        \ Default: [true] \n\
        \ "]
  parameters : parameters_list option;
      [@ocaml.doc
        "To reset the entire DB parameter group, specify the [DBParameterGroup] name and \
         [ResetAllParameters] parameters. To reset specific parameters, provide a list of the \
         following: [ParameterName] and [ApplyMethod]. A maximum of 20 parameters can be modified \
         in a single request.\n\n\
        \ Valid Values (for Apply method): [pending-reboot] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec db_cluster_parameter_group_name_message = {
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the DB cluster parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be 1 to 255 letters or numbers.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    This value is stored as a lowercase string.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc ""]

type nonrec reset_db_cluster_parameter_group_message = {
  db_cluster_parameter_group_name : string_;
      [@ocaml.doc "The name of the DB cluster parameter group to reset.\n"]
  reset_all_parameters : boolean_ option;
      [@ocaml.doc
        "A value that is set to [true] to reset all parameters in the DB cluster parameter group \
         to their default values, and [false] otherwise. You can't use this parameter if there is \
         a list of parameter names specified for the [Parameters] parameter.\n"]
  parameters : parameters_list option;
      [@ocaml.doc
        "A list of parameter names in the DB cluster parameter group to reset to the default \
         values. You can't use this parameter if the [ResetAllParameters] parameter is set to \
         [true].\n"]
}
[@@ocaml.doc ""]

type nonrec key_list = string_ list [@@ocaml.doc ""]

type nonrec remove_tags_from_resource_message = {
  resource_name : string_;
      [@ocaml.doc
        "The Amazon Neptune resource that the tags are removed from. This value is an Amazon \
         Resource Name (ARN). For information about creating an ARN, see \
         {{:https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing} \
         Constructing an Amazon Resource Name (ARN)}.\n"]
  tag_keys : key_list; [@ocaml.doc "The tag key (name) of the tag to be removed.\n"]
}
[@@ocaml.doc ""]

type nonrec remove_source_identifier_from_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec remove_source_identifier_from_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc
        "The name of the event notification subscription you want to remove a source identifier \
         from.\n"]
  source_identifier : string_;
      [@ocaml.doc
        " The source identifier to be removed from the subscription, such as the {b DB instance \
         identifier} for a DB instance or the name of a security group.\n"]
}
[@@ocaml.doc ""]

type nonrec db_cluster_role_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "The specified IAM role Amazon Resource Name (ARN) is not associated with the specified DB \
   cluster.\n"]

type nonrec remove_role_from_db_cluster_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc "The name of the DB cluster to disassociate the IAM role from.\n"]
  role_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to disassociate from the DB cluster, for \
         example [arn:aws:iam::123456789012:role/NeptuneAccessRole].\n"]
  feature_name : string_ option;
      [@ocaml.doc
        "The name of the feature for the DB cluster that the IAM role is to be disassociated from. \
         For the list of supported feature names, see [DescribeDBEngineVersions].\n"]
}
[@@ocaml.doc ""]

type nonrec remove_from_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec remove_from_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc
        "The identifier of the Neptune global database from which to detach the specified Neptune \
         DB cluster.\n"]
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) identifying the cluster to be detached from the Neptune \
         global database cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec domain_membership = {
  domain : string_ option; [@ocaml.doc "The identifier of the Active Directory Domain.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the DB instance's Active Directory Domain membership, such as joined, \
         pending-join, failed etc).\n"]
  fqd_n : string_ option;
      [@ocaml.doc "The fully qualified domain name of the Active Directory Domain.\n"]
  iam_role_name : string_ option;
      [@ocaml.doc
        "The name of the IAM role to be used when making API calls to the Directory Service.\n"]
}
[@@ocaml.doc "An Active Directory Domain membership record associated with a DB instance.\n"]

type nonrec domain_membership_list = domain_membership list [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec db_instance_status_info = {
  status_type : string_ option; [@ocaml.doc "This value is currently \"read replication.\"\n"]
  normal : boolean_ option;
      [@ocaml.doc
        "Boolean value that is true if the instance is operating normally, or false if the \
         instance is in an error state.\n"]
  status : string_ option;
      [@ocaml.doc
        "Status of the DB instance. For a StatusType of read replica, the values can be \
         replicating, error, stopped, or terminated.\n"]
  message : string_ option;
      [@ocaml.doc
        "Details of the error if there is an error for the instance. If the instance is not in an \
         error state, this value is blank.\n"]
}
[@@ocaml.doc "Provides a list of status information for a DB instance.\n"]

type nonrec db_instance_status_info_list = db_instance_status_info list [@@ocaml.doc ""]

type nonrec option_group_membership = {
  option_group_name : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  status : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
}
[@@ocaml.doc "Not supported by Neptune.\n"]

type nonrec option_group_membership_list = option_group_membership list [@@ocaml.doc ""]

type nonrec read_replica_db_cluster_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec read_replica_db_instance_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec pending_modified_values = {
  db_instance_class : string_ option;
      [@ocaml.doc
        " Contains the new [DBInstanceClass] for the DB instance that will be applied or is \
         currently being applied.\n"]
  allocated_storage : integer_optional option;
      [@ocaml.doc
        " Contains the new [AllocatedStorage] size for the DB instance that will be applied or is \
         currently being applied.\n"]
  master_user_password : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  port : integer_optional option; [@ocaml.doc "Specifies the pending port for the DB instance.\n"]
  backup_retention_period : integer_optional option;
      [@ocaml.doc
        "Specifies the pending number of days for which automated backups are retained.\n"]
  multi_a_z : boolean_optional option;
      [@ocaml.doc
        "Indicates that the Single-AZ DB instance is to change to a Multi-AZ deployment.\n"]
  engine_version : string_ option; [@ocaml.doc "Indicates the database engine version.\n"]
  license_model : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  iops : integer_optional option;
      [@ocaml.doc
        "Specifies the new Provisioned IOPS value for the DB instance that will be applied or is \
         currently being applied.\n"]
  db_instance_identifier : string_ option;
      [@ocaml.doc
        " Contains the new [DBInstanceIdentifier] for the DB instance that will be applied or is \
         currently being applied.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "Not applicable. In Neptune the storage type is managed at the DB Cluster level.\n"]
  ca_certificate_identifier : string_ option;
      [@ocaml.doc "Specifies the identifier of the CA certificate for the DB instance.\n"]
  db_subnet_group_name : string_ option;
      [@ocaml.doc "The new DB subnet group for the DB instance.\n"]
  pending_cloudwatch_logs_exports : pending_cloudwatch_logs_exports option;
      [@ocaml.doc
        "This [PendingCloudwatchLogsExports] structure specifies pending changes to which \
         CloudWatch logs are enabled and which are disabled.\n"]
}
[@@ocaml.doc "This data type is used as a response element in the [ModifyDBInstance] action.\n"]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec availability_zone = {
  name : string_ option; [@ocaml.doc "The name of the availability zone.\n"]
}
[@@ocaml.doc "Specifies an Availability Zone.\n"]

type nonrec subnet = {
  subnet_identifier : string_ option; [@ocaml.doc "Specifies the identifier of the subnet.\n"]
  subnet_availability_zone : availability_zone option;
      [@ocaml.doc "Specifies the EC2 Availability Zone that the subnet is in.\n"]
  subnet_status : string_ option; [@ocaml.doc "Specifies the status of the subnet.\n"]
}
[@@ocaml.doc
  "Specifies a subnet.\n\n\
  \  This data type is used as a response element in the [DescribeDBSubnetGroups] action.\n\
  \ "]

type nonrec subnet_list = subnet list [@@ocaml.doc ""]

type nonrec db_subnet_group = {
  db_subnet_group_name : string_ option; [@ocaml.doc "The name of the DB subnet group.\n"]
  db_subnet_group_description : string_ option;
      [@ocaml.doc "Provides the description of the DB subnet group.\n"]
  vpc_id : string_ option; [@ocaml.doc "Provides the VpcId of the DB subnet group.\n"]
  subnet_group_status : string_ option; [@ocaml.doc "Provides the status of the DB subnet group.\n"]
  subnets : subnet_list option; [@ocaml.doc " Contains a list of [Subnet] elements.\n"]
  db_subnet_group_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the DB subnet group.\n"]
  supported_network_types : string_list option;
      [@ocaml.doc
        "The network types supported by the DB subnet group.\n\n\
        \ Valid network types include [IPV4] and [DUAL]. A DB subnet group supports [DUAL] if all \
         subnets in the group have both IPv4 and IPv6 CIDRs.\n\
        \ "]
}
[@@ocaml.doc
  "Contains the details of an Amazon Neptune DB subnet group.\n\n\
  \ This data type is used as a response element in the [DescribeDBSubnetGroups] action.\n\
  \ "]

type nonrec db_parameter_group_status = {
  db_parameter_group_name : string_ option; [@ocaml.doc "The name of the DB parameter group.\n"]
  parameter_apply_status : string_ option; [@ocaml.doc "The status of parameter updates.\n"]
}
[@@ocaml.doc
  "The status of the DB parameter group.\n\n\
  \ This data type is used as a response element in the following actions:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreateDBInstance] \n\
  \            \n\
  \             }\n\
  \        {-   [DeleteDBInstance] \n\
  \            \n\
  \             }\n\
  \        {-   [ModifyDBInstance] \n\
  \            \n\
  \             }\n\
  \        {-   [RebootDBInstance] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec db_parameter_group_status_list = db_parameter_group_status list [@@ocaml.doc ""]

type nonrec db_security_group_membership = {
  db_security_group_name : string_ option; [@ocaml.doc "The name of the DB security group.\n"]
  status : string_ option; [@ocaml.doc "The status of the DB security group.\n"]
}
[@@ocaml.doc "Specifies membership in a designated DB security group.\n"]

type nonrec db_security_group_membership_list = db_security_group_membership list [@@ocaml.doc ""]

type nonrec endpoint = {
  address : string_ option; [@ocaml.doc "Specifies the DNS address of the DB instance.\n"]
  port : integer option;
      [@ocaml.doc "Specifies the port that the database engine is listening on.\n"]
  hosted_zone_id : string_ option;
      [@ocaml.doc "Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.\n"]
}
[@@ocaml.doc
  "Specifies a connection endpoint.\n\n\
  \ For the data structure that represents Amazon Neptune DB cluster endpoints, see \
   [DBClusterEndpoint].\n\
  \ "]

type nonrec db_instance = {
  db_instance_identifier : string_ option;
      [@ocaml.doc
        "Contains a user-supplied database identifier. This identifier is the unique key that \
         identifies a DB instance.\n"]
  db_instance_class : string_ option;
      [@ocaml.doc
        "Contains the name of the compute and memory capacity class of the DB instance.\n"]
  engine : string_ option;
      [@ocaml.doc "Provides the name of the database engine to be used for this DB instance.\n"]
  db_instance_status : string_ option;
      [@ocaml.doc "Specifies the current state of this database.\n"]
  master_username : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  db_name : string_ option; [@ocaml.doc "The database name.\n"]
  endpoint : endpoint option; [@ocaml.doc "Specifies the connection endpoint.\n"]
  allocated_storage : integer option; [@ocaml.doc "Not supported by Neptune.\n"]
  instance_create_time : t_stamp option;
      [@ocaml.doc "Provides the date and time the DB instance was created.\n"]
  preferred_backup_window : string_ option;
      [@ocaml.doc
        " Specifies the daily time range during which automated backups are created if automated \
         backups are enabled, as determined by the [BackupRetentionPeriod].\n"]
  backup_retention_period : integer option;
      [@ocaml.doc "Specifies the number of days for which automatic DB snapshots are retained.\n"]
  db_security_groups : db_security_group_membership_list option;
      [@ocaml.doc
        " Provides List of DB security group elements containing only [DBSecurityGroup.Name] and \
         [DBSecurityGroup.Status] subelements.\n"]
  vpc_security_groups : vpc_security_group_membership_list option;
      [@ocaml.doc
        "Provides a list of VPC security group elements that the DB instance belongs to.\n"]
  db_parameter_groups : db_parameter_group_status_list option;
      [@ocaml.doc "Provides the list of DB parameter groups applied to this DB instance.\n"]
  availability_zone : string_ option;
      [@ocaml.doc "Specifies the name of the Availability Zone the DB instance is located in.\n"]
  db_subnet_group : db_subnet_group option;
      [@ocaml.doc
        "Specifies information on the subnet group associated with the DB instance, including the \
         name, description, and subnets in the subnet group.\n"]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "Specifies the weekly time range during which system maintenance can occur, in Universal \
         Coordinated Time (UTC).\n"]
  pending_modified_values : pending_modified_values option;
      [@ocaml.doc
        "Specifies that changes to the DB instance are pending. This element is only included when \
         changes are pending. Specific changes are identified by subelements.\n"]
  latest_restorable_time : t_stamp option;
      [@ocaml.doc
        "Specifies the latest time to which a database can be restored with point-in-time restore.\n"]
  multi_a_z : boolean_ option;
      [@ocaml.doc "Specifies if the DB instance is a Multi-AZ deployment.\n"]
  engine_version : string_ option; [@ocaml.doc "Indicates the database engine version.\n"]
  auto_minor_version_upgrade : boolean_ option;
      [@ocaml.doc "Indicates that minor version patches are applied automatically.\n"]
  read_replica_source_db_instance_identifier : string_ option;
      [@ocaml.doc
        "Contains the identifier of the source DB instance if this DB instance is a Read Replica.\n"]
  read_replica_db_instance_identifiers : read_replica_db_instance_identifier_list option;
      [@ocaml.doc
        "Contains one or more identifiers of the Read Replicas associated with this DB instance.\n"]
  read_replica_db_cluster_identifiers : read_replica_db_cluster_identifier_list option;
      [@ocaml.doc
        "Contains one or more identifiers of DB clusters that are Read Replicas of this DB instance.\n"]
  license_model : string_ option; [@ocaml.doc "License model information for this DB instance.\n"]
  iops : integer_optional option;
      [@ocaml.doc "Specifies the Provisioned IOPS (I/O operations per second) value.\n"]
  option_group_memberships : option_group_membership_list option;
      [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  character_set_name : string_ option; [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  secondary_availability_zone : string_ option;
      [@ocaml.doc
        "If present, specifies the name of the secondary Availability Zone for a DB instance with \
         multi-AZ support.\n"]
  publicly_accessible : boolean_ option;
      [@ocaml.doc
        "Indicates whether the DB instance is publicly accessible.\n\n\
        \ When the DB instance is publicly accessible and you connect from outside of the DB \
         instance's virtual private cloud (VPC), its Domain Name System (DNS) endpoint resolves to \
         the public IP address. When you connect from within the same VPC as the DB instance, the \
         endpoint resolves to the private IP address. Access to the DB instance is ultimately \
         controlled by the security group it uses. That public access isn't permitted if the \
         security group assigned to the DB cluster doesn't permit it.\n\
        \ \n\
        \  When the DB instance isn't publicly accessible, it is an internal DB instance with a \
         DNS name that resolves to a private IP address.\n\
        \  "]
  status_infos : db_instance_status_info_list option;
      [@ocaml.doc
        "The status of a Read Replica. If the instance is not a Read Replica, this is blank.\n"]
  storage_type : string_ option;
      [@ocaml.doc "Specifies the storage type associated with the DB instance.\n"]
  tde_credential_arn : string_ option;
      [@ocaml.doc
        "The ARN from the key store with which the instance is associated for TDE encryption.\n"]
  db_instance_port : integer option;
      [@ocaml.doc
        "Specifies the port that the DB instance listens on. If the DB instance is part of a DB \
         cluster, this can be a different port than the DB cluster port.\n"]
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "If the DB instance is a member of a DB cluster, contains the name of the DB cluster that \
         the DB instance is a member of.\n"]
  storage_encrypted : boolean_ option;
      [@ocaml.doc "Not supported: The encryption for DB instances is managed by the DB cluster.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc " Not supported: The encryption for DB instances is managed by the DB cluster.\n"]
  dbi_resource_id : string_ option;
      [@ocaml.doc
        "The Amazon Region-unique, immutable identifier for the DB instance. This identifier is \
         found in Amazon CloudTrail log entries whenever the Amazon KMS key for the DB instance is \
         accessed.\n"]
  ca_certificate_identifier : string_ option;
      [@ocaml.doc "The identifier of the CA certificate for this DB instance.\n"]
  domain_memberships : domain_membership_list option; [@ocaml.doc "Not supported\n"]
  copy_tags_to_snapshot : boolean_ option;
      [@ocaml.doc
        "Specifies whether tags are copied from the DB instance to snapshots of the DB instance.\n"]
  monitoring_interval : integer_optional option;
      [@ocaml.doc
        "The interval, in seconds, between points when Enhanced Monitoring metrics are collected \
         for the DB instance.\n"]
  enhanced_monitoring_resource_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon CloudWatch Logs log stream that receives the \
         Enhanced Monitoring metrics data for the DB instance.\n"]
  monitoring_role_arn : string_ option;
      [@ocaml.doc
        "The ARN for the IAM role that permits Neptune to send Enhanced Monitoring metrics to \
         Amazon CloudWatch Logs.\n"]
  promotion_tier : integer_optional option;
      [@ocaml.doc
        "A value that specifies the order in which a Read Replica is promoted to the primary \
         instance after a failure of the existing primary instance. \n"]
  db_instance_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the DB instance.\n"]
  timezone : string_ option; [@ocaml.doc "Not supported.\n"]
  iam_database_authentication_enabled : boolean_ option;
      [@ocaml.doc
        "True if Amazon Identity and Access Management (IAM) authentication is enabled, and \
         otherwise false.\n"]
  performance_insights_enabled : boolean_optional option;
      [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  performance_insights_kms_key_id : string_ option;
      [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  enabled_cloudwatch_logs_exports : log_type_list option;
      [@ocaml.doc
        "A list of log types that this DB instance is configured to export to CloudWatch Logs.\n"]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "Indicates whether or not the DB instance has deletion protection enabled. The instance \
         can't be deleted when deletion protection is enabled. See \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/manage-console-instances-delete.html}Deleting \
         a DB Instance}.\n"]
  network_type : string_ option;
      [@ocaml.doc
        "The network type of the DB instance. Inherited from the DB cluster.\n\n\
        \ Valid Values: [IPV4], [DUAL] \n\
        \ "]
}
[@@ocaml.doc
  "Contains the details of an Amazon Neptune DB instance.\n\n\
  \ This data type is used as a response element in the [DescribeDBInstances] action.\n\
  \ "]

type nonrec reboot_db_instance_result = { db_instance : db_instance option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec reboot_db_instance_message = {
  db_instance_identifier : string_;
      [@ocaml.doc
        "The DB instance identifier. This parameter is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing DBInstance.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  force_failover : boolean_optional option;
      [@ocaml.doc
        " When [true], the reboot is conducted through a MultiAZ failover.\n\n\
        \ Constraint: You can't specify [true] if the instance is not configured for MultiAZ.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec promote_read_replica_db_cluster_result = {
  db_cluster : db_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec promote_read_replica_db_cluster_message = {
  db_cluster_identifier : string_; [@ocaml.doc "Not supported.\n"]
}
[@@ocaml.doc ""]

type nonrec global_cluster_already_exists_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "The [GlobalClusterIdentifier] already exists. Choose a new global database identifier (unique \
   name) to create a new global database cluster.\n"]

type nonrec modify_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec modify_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc
        "The DB cluster identifier for the global cluster being modified. This parameter is not \
         case-sensitive.\n\n\
        \ Constraints: Must match the identifier of an existing global database cluster.\n\
        \ "]
  new_global_cluster_identifier : global_cluster_identifier option;
      [@ocaml.doc
        "A new cluster identifier to assign to the global database. This value is stored as a \
         lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Can't end with a hyphen or contain two consecutive hyphens\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster2] \n\
        \   "]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "Indicates whether the global database has deletion protection enabled. The global \
         database cannot be deleted when deletion protection is enabled.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The version number of the database engine to which you want to upgrade. Changing this \
         parameter will result in an outage. The change is applied during the next maintenance \
         window unless [ApplyImmediately] is enabled.\n\n\
        \ To list all of the available Neptune engine versions, use the following command:\n\
        \ "]
  allow_major_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether major version upgrades are allowed.\n\n\
        \ Constraints: You must allow major version upgrades if you specify a value for the \
         [EngineVersion] parameter that is a different major version than the DB cluster's current \
         version.\n\
        \ \n\
        \  If you upgrade the major version of a global database, the cluster and DB instance \
         parameter groups are set to the default parameter groups for the new version, so you will \
         need to apply any custom parameter groups after completing the upgrade.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec subscription_category_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The designated subscription category could not be found.\n"]

type nonrec sns_topic_arn_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The ARN of the SNS topic could not be found.\n"]

type nonrec sns_no_authorization_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "There is no SNS authorization.\n"]

type nonrec sns_invalid_topic_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The SNS topic is invalid.\n"]

type nonrec event_subscription_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "You have exceeded the number of events you can subscribe to.\n"]

type nonrec modify_event_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec modify_event_subscription_message = {
  subscription_name : string_; [@ocaml.doc "The name of the event notification subscription.\n"]
  sns_topic_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the SNS topic created for event notification. The ARN \
         is created by Amazon SNS when you create a topic and subscribe to it.\n"]
  source_type : string_ option;
      [@ocaml.doc
        "The type of source that is generating the events. For example, if you want to be notified \
         of events generated by a DB instance, you would set this parameter to db-instance. if \
         this value is not specified, all events are returned.\n\n\
        \ Valid values: db-instance | db-parameter-group | db-security-group | db-snapshot\n\
        \ "]
  event_categories : event_categories_list option;
      [@ocaml.doc
        " A list of event categories for a SourceType that you want to subscribe to. You can see a \
         list of the categories for a given SourceType by using the {b DescribeEventCategories} \
         action.\n"]
  enabled : boolean_optional option;
      [@ocaml.doc " A Boolean value; set to {b true} to activate the subscription.\n"]
}
[@@ocaml.doc ""]

type nonrec subnet_already_in_use = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The DB subnet is already in use in the Availability Zone.\n"]

type nonrec db_subnet_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "Request would result in user exceeding the allowed number of subnets in a DB subnet groups.\n"]

type nonrec db_subnet_group_does_not_cover_enough_a_zs = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "Subnets in the DB subnet group should cover at least two Availability Zones unless there is \
   only one Availability Zone.\n"]

type nonrec modify_db_subnet_group_result = {
  db_subnet_group : db_subnet_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec subnet_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec modify_db_subnet_group_message = {
  db_subnet_group_name : string_;
      [@ocaml.doc
        "The name for the DB subnet group. This value is stored as a lowercase string. You can't \
         modify the default subnet group.\n\n\
        \ Constraints: Must match the name of an existing DBSubnetGroup. Must not be default.\n\
        \ \n\
        \  Example: [mySubnetgroup] \n\
        \  "]
  db_subnet_group_description : string_ option;
      [@ocaml.doc "The description for the DB subnet group.\n"]
  subnet_ids : subnet_identifier_list; [@ocaml.doc "The EC2 subnet IDs for the DB subnet group.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_db_parameter_group_message = {
  db_parameter_group_name : string_;
      [@ocaml.doc
        "The name of the DB parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match the name of an existing DBParameterGroup.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  parameters : parameters_list;
      [@ocaml.doc
        "An array of parameter names, values, and the apply method for the parameter update. At \
         least one parameter name, value, and apply method must be supplied; subsequent arguments \
         are optional. A maximum of 20 parameters can be modified in a single request.\n\n\
        \ Valid Values (for the application method): [immediate | pending-reboot] \n\
        \ \n\
        \   You can use the immediate value with dynamic parameters only. You can use the \
         pending-reboot value for both dynamic and static parameters, and changes are applied when \
         you reboot the DB instance without failover.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec storage_type_not_supported_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc " {i StorageType} specified cannot be associated with the DB Instance.\n"]

type nonrec provisioned_iops_not_available_in_az_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "Provisioned IOPS not available in the specified Availability Zone.\n"]

type nonrec invalid_db_security_group_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The state of the DB security group does not allow deletion.\n"]

type nonrec insufficient_db_instance_capacity_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "Specified DB instance class is not available in the specified Availability Zone.\n"]

type nonrec domain_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc " {i Domain} does not refer to an existing Active Directory Domain.\n"]

type nonrec db_upgrade_dependency_failure_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The DB upgrade failed because a resource the DB depends on could not be modified.\n"]

type nonrec db_security_group_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc " {i DBSecurityGroupName} does not refer to an existing DB security group.\n"]

type nonrec db_instance_already_exists_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "User already has a DB instance with the given identifier.\n"]

type nonrec certificate_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc " {i CertificateIdentifier} does not refer to an existing certificate.\n"]

type nonrec authorization_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "Specified CIDRIP or EC2 security group is not authorized for the specified DB security group.\n\n\
  \ Neptune may not also be authorized via IAM to perform necessary actions on your behalf.\n\
  \ "]

type nonrec modify_db_instance_result = { db_instance : db_instance option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec cloudwatch_logs_export_configuration = {
  enable_log_types : log_type_list option; [@ocaml.doc "The list of log types to enable.\n"]
  disable_log_types : log_type_list option; [@ocaml.doc "The list of log types to disable.\n"]
}
[@@ocaml.doc
  "The configuration setting for the log types to be enabled for export to CloudWatch Logs for a \
   specific DB instance or DB cluster.\n\n\
  \ The [EnableLogTypes] and [DisableLogTypes] arrays determine which logs will be exported (or \
   not exported) to CloudWatch Logs.\n\
  \ \n\
  \  Valid log types are: [audit] (to publish audit logs) and [slowquery] (to publish slow-query \
   logs). See \
   {{:https://docs.aws.amazon.com/neptune/latest/userguide/cloudwatch-logs.html}Publishing Neptune \
   logs to Amazon CloudWatch logs}.\n\
  \  "]

type nonrec sensitive_string = string [@@ocaml.doc ""]

type nonrec db_security_group_name_list = string_ list [@@ocaml.doc ""]

type nonrec modify_db_instance_message = {
  db_instance_identifier : string_;
      [@ocaml.doc
        "The DB instance identifier. This value is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing DBInstance.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  allocated_storage : integer_optional option; [@ocaml.doc "Not supported by Neptune.\n"]
  db_instance_class : string_ option;
      [@ocaml.doc
        "The new compute and memory capacity of the DB instance, for example, [db.m4.large]. Not \
         all DB instance classes are available in all Amazon Regions.\n\n\
        \ If you modify the DB instance class, an outage occurs during the change. The change is \
         applied during the next maintenance window, unless [ApplyImmediately] is specified as \
         [true] for this request.\n\
        \ \n\
        \  Default: Uses existing setting\n\
        \  "]
  db_subnet_group_name : string_ option;
      [@ocaml.doc
        "The new DB subnet group for the DB instance. You can use this parameter to move your DB \
         instance to a different VPC.\n\n\
        \ Changing the subnet group causes an outage during the change. The change is applied \
         during the next maintenance window, unless you specify [true] for the [ApplyImmediately] \
         parameter.\n\
        \ \n\
        \  Constraints: If supplied, must match the name of an existing DBSubnetGroup.\n\
        \  \n\
        \   Example: [mySubnetGroup] \n\
        \   "]
  db_security_groups : db_security_group_name_list option;
      [@ocaml.doc
        "A list of DB security groups to authorize on this DB instance. Changing this setting \
         doesn't result in an outage and the change is asynchronously applied as soon as \
         possible.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match existing DBSecurityGroups.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        "A list of EC2 VPC security groups to authorize on this DB instance. This change is \
         asynchronously applied as soon as possible.\n\n\
        \ Not applicable. The associated list of EC2 VPC security groups is managed by the DB \
         cluster. For more information, see [ModifyDBCluster].\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  If supplied, must match existing VpcSecurityGroupIds.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  apply_immediately : boolean_ option;
      [@ocaml.doc
        "Specifies whether the modifications in this request and any pending modifications are \
         asynchronously applied as soon as possible, regardless of the \
         [PreferredMaintenanceWindow] setting for the DB instance.\n\n\
        \  If this parameter is set to [false], changes to the DB instance are applied during the \
         next maintenance window. Some parameter changes can cause an outage and are applied on \
         the next call to [RebootDBInstance], or the next failure reboot.\n\
        \ \n\
        \  Default: [false] \n\
        \  "]
  master_user_password : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  db_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the DB parameter group to apply to the DB instance. Changing this setting \
         doesn't result in an outage. The parameter group name itself is changed immediately, but \
         the actual parameter changes are not applied until you reboot the instance without \
         failover. The db instance will NOT be rebooted automatically and the parameter changes \
         will NOT be applied during the next maintenance window.\n\n\
        \ Default: Uses existing setting\n\
        \ \n\
        \  Constraints: The DB parameter group must be in the same DB parameter group family as \
         this DB instance.\n\
        \  "]
  backup_retention_period : integer_optional option;
      [@ocaml.doc
        "Not applicable. The retention period for automated backups is managed by the DB cluster. \
         For more information, see [ModifyDBCluster].\n\n\
        \ Default: Uses existing setting\n\
        \ "]
  preferred_backup_window : string_ option;
      [@ocaml.doc
        " The daily time range during which automated backups are created if automated backups are \
         enabled.\n\n\
        \ Not applicable. The daily time range for creating automated backups is managed by the DB \
         cluster. For more information, see [ModifyDBCluster].\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be in the format hh24:mi-hh24:mi\n\
        \             \n\
        \              }\n\
        \         {-  Must be in Universal Time Coordinated (UTC)\n\
        \             \n\
        \              }\n\
        \         {-  Must not conflict with the preferred maintenance window\n\
        \             \n\
        \              }\n\
        \         {-  Must be at least 30 minutes\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The weekly time range (in UTC) during which system maintenance can occur, which might \
         result in an outage. Changing this parameter doesn't result in an outage, except in the \
         following situation, and the change is asynchronously applied as soon as possible. If \
         there are pending actions that cause a reboot, and the maintenance window is changed to \
         include the current time, then changing this parameter will cause a reboot of the DB \
         instance. If moving this window to the current time, there must be at least 30 minutes \
         between the current time and end of the window to ensure pending changes are applied.\n\n\
        \ Default: Uses existing setting\n\
        \ \n\
        \  Format: ddd:hh24:mi-ddd:hh24:mi\n\
        \  \n\
        \   Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun\n\
        \   \n\
        \    Constraints: Must be at least 30 minutes\n\
        \    "]
  multi_a_z : boolean_optional option;
      [@ocaml.doc
        "Specifies if the DB instance is a Multi-AZ deployment. Changing this parameter doesn't \
         result in an outage and the change is applied during the next maintenance window unless \
         the [ApplyImmediately] parameter is set to [true] for this request.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The version number of the database engine to upgrade to. Currently, setting this \
         parameter has no effect. To upgrade your database engine to the most recent release, use \
         the [ApplyPendingMaintenanceAction] API.\n"]
  allow_major_version_upgrade : boolean_ option;
      [@ocaml.doc
        "Indicates that major version upgrades are allowed. Changing this parameter doesn't result \
         in an outage and the change is asynchronously applied as soon as possible.\n"]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        " Indicates that minor version upgrades are applied automatically to the DB instance \
         during the maintenance window. Changing this parameter doesn't result in an outage except \
         in the following case and the change is asynchronously applied as soon as possible. An \
         outage will result if this parameter is set to [true] during the maintenance window, and \
         a newer minor version is available, and Neptune has enabled auto patching for that engine \
         version.\n"]
  license_model : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  iops : integer_optional option;
      [@ocaml.doc
        "The new Provisioned IOPS (I/O operations per second) value for the instance.\n\n\
        \ Changing this setting doesn't result in an outage and the change is applied during the \
         next maintenance window unless the [ApplyImmediately] parameter is set to [true] for this \
         request.\n\
        \ \n\
        \  Default: Uses existing setting\n\
        \  "]
  option_group_name : string_ option; [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  new_db_instance_identifier : string_ option;
      [@ocaml.doc
        " The new DB instance identifier for the DB instance when renaming a DB instance. When you \
         change the DB instance identifier, an instance reboot will occur immediately if you set \
         [Apply Immediately] to true, or will occur during the next maintenance window if [Apply \
         Immediately] to false. This value is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [mydbinstance] \n\
        \   "]
  storage_type : string_ option;
      [@ocaml.doc
        "Not applicable. In Neptune the storage type is managed at the DB Cluster level.\n"]
  tde_credential_arn : string_ option;
      [@ocaml.doc
        "The ARN from the key store with which to associate the instance for TDE encryption.\n"]
  tde_credential_password : sensitive_string option;
      [@ocaml.doc
        "The password for the given ARN from the key store in order to access the device.\n"]
  ca_certificate_identifier : string_ option;
      [@ocaml.doc "Indicates the certificate that needs to be associated with the instance.\n"]
  domain : string_ option; [@ocaml.doc "Not supported.\n"]
  copy_tags_to_snapshot : boolean_optional option;
      [@ocaml.doc
        "True to copy all tags from the DB instance to snapshots of the DB instance, and otherwise \
         false. The default is false.\n"]
  monitoring_interval : integer_optional option;
      [@ocaml.doc
        "The interval, in seconds, between points when Enhanced Monitoring metrics are collected \
         for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The \
         default is 0.\n\n\
        \ If [MonitoringRoleArn] is specified, then you must also set [MonitoringInterval] to a \
         value other than 0.\n\
        \ \n\
        \  Valid Values: [0, 1, 5, 10, 15, 30, 60] \n\
        \  "]
  db_port_number : integer_optional option;
      [@ocaml.doc
        "The port number on which the database accepts connections.\n\n\
        \ The value of the [DBPortNumber] parameter must not match any of the port values \
         specified for options in the option group for the DB instance.\n\
        \ \n\
        \  Your database will restart when you change the [DBPortNumber] value regardless of the \
         value of the [ApplyImmediately] parameter.\n\
        \  \n\
        \    Default: [8182] \n\
        \   "]
  publicly_accessible : boolean_optional option;
      [@ocaml.doc
        "Indicates whether the DB instance is publicly accessible.\n\n\
        \ When the DB instance is publicly accessible and you connect from outside of the DB \
         instance's virtual private cloud (VPC), its Domain Name System (DNS) endpoint resolves to \
         the public IP address. When you connect from within the same VPC as the DB instance, the \
         endpoint resolves to the private IP address. Access to the DB instance is ultimately \
         controlled by the security group it uses. That public access isn't permitted if the \
         security group assigned to the DB cluster doesn't permit it.\n\
        \ \n\
        \  When the DB instance isn't publicly accessible, it is an internal DB instance with a \
         DNS name that resolves to a private IP address.\n\
        \  "]
  monitoring_role_arn : string_ option;
      [@ocaml.doc
        "The ARN for the IAM role that permits Neptune to send enhanced monitoring metrics to \
         Amazon CloudWatch Logs. For example, [arn:aws:iam:123456789012:role/emaccess].\n\n\
        \ If [MonitoringInterval] is set to a value other than 0, then you must supply a \
         [MonitoringRoleArn] value.\n\
        \ "]
  domain_iam_role_name : string_ option; [@ocaml.doc "Not supported\n"]
  promotion_tier : integer_optional option;
      [@ocaml.doc
        "A value that specifies the order in which a Read Replica is promoted to the primary \
         instance after a failure of the existing primary instance.\n\n\
        \ Default: 1\n\
        \ \n\
        \  Valid Values: 0 - 15\n\
        \  "]
  enable_iam_database_authentication : boolean_optional option;
      [@ocaml.doc
        "True to enable mapping of Amazon Identity and Access Management (IAM) accounts to \
         database accounts, and otherwise false.\n\n\
        \ You can enable IAM database authentication for the following database engines\n\
        \ \n\
        \  Not applicable. Mapping Amazon IAM accounts to database accounts is managed by the DB \
         cluster. For more information, see [ModifyDBCluster].\n\
        \  \n\
        \   Default: [false] \n\
        \   "]
  enable_performance_insights : boolean_optional option;
      [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  performance_insights_kms_key_id : string_ option;
      [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  cloudwatch_logs_export_configuration : cloudwatch_logs_export_configuration option;
      [@ocaml.doc
        "The configuration setting for the log types to be enabled for export to CloudWatch Logs \
         for a specific DB instance or DB cluster.\n"]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether the DB instance has deletion protection enabled. The \
         database can't be deleted when deletion protection is enabled. By default, deletion \
         protection is disabled. See \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/manage-console-instances-delete.html}Deleting \
         a DB Instance}.\n"]
}
[@@ocaml.doc ""]

type nonrec shared_snapshot_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "You have exceeded the maximum number of accounts that you can share a manual DB snapshot with.\n"]

type nonrec attribute_value_list = string_ list [@@ocaml.doc ""]

type nonrec db_cluster_snapshot_attribute = {
  attribute_name : string_ option;
      [@ocaml.doc
        "The name of the manual DB cluster snapshot attribute.\n\n\
        \ The attribute named [restore] refers to the list of Amazon accounts that have permission \
         to copy or restore the manual DB cluster snapshot. For more information, see the \
         [ModifyDBClusterSnapshotAttribute] API action.\n\
        \ "]
  attribute_values : attribute_value_list option;
      [@ocaml.doc
        "The value(s) for the manual DB cluster snapshot attribute.\n\n\
        \ If the [AttributeName] field is set to [restore], then this element returns a list of \
         IDs of the Amazon accounts that are authorized to copy or restore the manual DB cluster \
         snapshot. If a value of [all] is in the list, then the manual DB cluster snapshot is \
         public and available for any Amazon account to copy or restore.\n\
        \ "]
}
[@@ocaml.doc
  "Contains the name and values of a manual DB cluster snapshot attribute.\n\n\
  \ Manual DB cluster snapshot attributes are used to authorize other Amazon accounts to restore a \
   manual DB cluster snapshot. For more information, see the [ModifyDBClusterSnapshotAttribute] \
   API action.\n\
  \ "]

type nonrec db_cluster_snapshot_attribute_list = db_cluster_snapshot_attribute list [@@ocaml.doc ""]

type nonrec db_cluster_snapshot_attributes_result = {
  db_cluster_snapshot_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the manual DB cluster snapshot that the attributes apply to.\n"]
  db_cluster_snapshot_attributes : db_cluster_snapshot_attribute_list option;
      [@ocaml.doc "The list of attributes and values for the manual DB cluster snapshot.\n"]
}
[@@ocaml.doc
  "Contains the results of a successful call to the [DescribeDBClusterSnapshotAttributes] API \
   action.\n\n\
  \ Manual DB cluster snapshot attributes are used to authorize other Amazon accounts to copy or \
   restore a manual DB cluster snapshot. For more information, see the \
   [ModifyDBClusterSnapshotAttribute] API action.\n\
  \ "]

type nonrec modify_db_cluster_snapshot_attribute_result = {
  db_cluster_snapshot_attributes_result : db_cluster_snapshot_attributes_result option;
      [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec modify_db_cluster_snapshot_attribute_message = {
  db_cluster_snapshot_identifier : string_;
      [@ocaml.doc "The identifier for the DB cluster snapshot to modify the attributes for.\n"]
  attribute_name : string_;
      [@ocaml.doc
        "The name of the DB cluster snapshot attribute to modify.\n\n\
        \ To manage authorization for other Amazon accounts to copy or restore a manual DB cluster \
         snapshot, set this value to [restore].\n\
        \ "]
  values_to_add : attribute_value_list option;
      [@ocaml.doc
        "A list of DB cluster snapshot attributes to add to the attribute specified by \
         [AttributeName].\n\n\
        \ To authorize other Amazon accounts to copy or restore a manual DB cluster snapshot, set \
         this list to include one or more Amazon account IDs, or [all] to make the manual DB \
         cluster snapshot restorable by any Amazon account. Do not add the [all] value for any \
         manual DB cluster snapshots that contain private information that you don't want \
         available to all Amazon accounts.\n\
        \ "]
  values_to_remove : attribute_value_list option;
      [@ocaml.doc
        "A list of DB cluster snapshot attributes to remove from the attribute specified by \
         [AttributeName].\n\n\
        \ To remove authorization for other Amazon accounts to copy or restore a manual DB cluster \
         snapshot, set this list to include one or more Amazon account identifiers, or [all] to \
         remove authorization for any Amazon account to copy or restore the DB cluster snapshot. \
         If you specify [all], an Amazon account whose account ID is explicitly added to the \
         [restore] attribute can still copy or restore a manual DB cluster snapshot.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec modify_db_cluster_parameter_group_message = {
  db_cluster_parameter_group_name : string_;
      [@ocaml.doc "The name of the DB cluster parameter group to modify.\n"]
  parameters : parameters_list;
      [@ocaml.doc "A list of parameters in the DB cluster parameter group to modify.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_db_cluster_endpoint_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "The requested operation cannot be performed on the endpoint while the endpoint is in this state.\n"]

type nonrec db_cluster_endpoint_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The specified custom endpoint doesn't exist.\n"]

type nonrec modify_db_cluster_endpoint_output = {
  db_cluster_endpoint_identifier : string_ option;
      [@ocaml.doc
        "The identifier associated with the endpoint. This parameter is stored as a lowercase \
         string.\n"]
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The DB cluster identifier of the DB cluster associated with the endpoint. This parameter \
         is stored as a lowercase string.\n"]
  db_cluster_endpoint_resource_identifier : string_ option;
      [@ocaml.doc
        "A unique system-generated identifier for an endpoint. It remains the same for the whole \
         life of the endpoint.\n"]
  endpoint : string_ option; [@ocaml.doc "The DNS address of the endpoint.\n"]
  status : string_ option;
      [@ocaml.doc
        "The current status of the endpoint. One of: [creating], [available], [deleting], \
         [inactive], [modifying]. The [inactive] state applies to an endpoint that cannot be used \
         for a certain kind of cluster, such as a [writer] endpoint for a read-only secondary \
         cluster in a global database.\n"]
  endpoint_type : string_ option;
      [@ocaml.doc "The type of the endpoint. One of: [READER], [WRITER], [CUSTOM].\n"]
  custom_endpoint_type : string_ option;
      [@ocaml.doc
        "The type associated with a custom endpoint. One of: [READER], [WRITER], [ANY].\n"]
  static_members : string_list option;
      [@ocaml.doc "List of DB instance identifiers that are part of the custom endpoint group.\n"]
  excluded_members : string_list option;
      [@ocaml.doc
        "List of DB instance identifiers that aren't part of the custom endpoint group. All other \
         eligible instances are reachable through the custom endpoint. Only relevant if the list \
         of static members is empty.\n"]
  db_cluster_endpoint_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the endpoint.\n"]
}
[@@ocaml.doc
  "This data type represents the information you need to connect to an Amazon Neptune DB cluster. \
   This data type is used as a response element in the following actions:\n\n\
  \ {ul\n\
  \       {-   [CreateDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       {-   [DescribeDBClusterEndpoints] \n\
  \           \n\
  \            }\n\
  \       {-   [ModifyDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       {-   [DeleteDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For the data structure that represents Amazon RDS DB instance endpoints, see [Endpoint].\n\
  \   "]

type nonrec modify_db_cluster_endpoint_message = {
  db_cluster_endpoint_identifier : string_;
      [@ocaml.doc
        "The identifier of the endpoint to modify. This parameter is stored as a lowercase string.\n"]
  endpoint_type : string_ option;
      [@ocaml.doc "The type of the endpoint. One of: [READER], [WRITER], [ANY].\n"]
  static_members : string_list option;
      [@ocaml.doc "List of DB instance identifiers that are part of the custom endpoint group.\n"]
  excluded_members : string_list option;
      [@ocaml.doc
        "List of DB instance identifiers that aren't part of the custom endpoint group. All other \
         eligible instances are reachable through the custom endpoint. Only relevant if the list \
         of static members is empty.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_db_subnet_group_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The DB subnet group cannot be deleted because it is in use.\n"]

type nonrec modify_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec modify_db_cluster_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The DB cluster identifier for the cluster being modified. This parameter is not \
         case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing DBCluster.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  new_db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The new DB cluster identifier for the DB cluster when renaming a DB cluster. This value \
         is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens\n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster2] \n\
        \   "]
  apply_immediately : boolean_ option;
      [@ocaml.doc
        "A value that specifies whether the modifications in this request and any pending \
         modifications are asynchronously applied as soon as possible, regardless of the \
         [PreferredMaintenanceWindow] setting for the DB cluster. If this parameter is set to \
         [false], changes to the DB cluster are applied during the next maintenance window.\n\n\
        \ The [ApplyImmediately] parameter only affects [NewDBClusterIdentifier] values. If you \
         set the [ApplyImmediately] parameter value to false, then changes to \
         [NewDBClusterIdentifier] values are applied during the next maintenance window. All other \
         changes are applied immediately, regardless of the value of the [ApplyImmediately] \
         parameter.\n\
        \ \n\
        \  Default: [false] \n\
        \  "]
  backup_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days for which automated backups are retained. You must specify a minimum \
         value of 1.\n\n\
        \ Default: 1\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be a value from 1 to 35\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc "The name of the DB cluster parameter group to use for the DB cluster.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of VPC security groups that the DB cluster will belong to.\n"]
  port : integer_optional option;
      [@ocaml.doc
        "The port number on which the DB cluster accepts connections.\n\n\
        \ Constraints: Value must be [1150-65535] \n\
        \ \n\
        \  Default: The same port as the original DB cluster.\n\
        \  "]
  master_user_password : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  option_group_name : string_ option; [@ocaml.doc " {i Not supported by Neptune.} \n"]
  preferred_backup_window : string_ option;
      [@ocaml.doc
        "The daily time range during which automated backups are created if automated backups are \
         enabled, using the [BackupRetentionPeriod] parameter.\n\n\
        \ The default is a 30-minute window selected at random from an 8-hour block of time for \
         each Amazon Region.\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be in the format [hh24:mi-hh24:mi].\n\
        \             \n\
        \              }\n\
        \         {-  Must be in Universal Coordinated Time (UTC).\n\
        \             \n\
        \              }\n\
        \         {-  Must not conflict with the preferred maintenance window.\n\
        \             \n\
        \              }\n\
        \         {-  Must be at least 30 minutes.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The weekly time range during which system maintenance can occur, in Universal Coordinated \
         Time (UTC).\n\n\
        \ Format: [ddd:hh24:mi-ddd:hh24:mi] \n\
        \ \n\
        \  The default is a 30-minute window selected at random from an 8-hour block of time for \
         each Amazon Region, occurring on a random day of the week.\n\
        \  \n\
        \   Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.\n\
        \   \n\
        \    Constraints: Minimum 30-minute window.\n\
        \    "]
  enable_iam_database_authentication : boolean_optional option;
      [@ocaml.doc
        "True to enable mapping of Amazon Identity and Access Management (IAM) accounts to \
         database accounts, and otherwise false.\n\n\
        \ Default: [false] \n\
        \ "]
  cloudwatch_logs_export_configuration : cloudwatch_logs_export_configuration option;
      [@ocaml.doc
        "The configuration setting for the log types to be enabled for export to CloudWatch Logs \
         for a specific DB cluster. See \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/cloudwatch-logs.html#cloudwatch-logs-cli}Using \
         the CLI to publish Neptune audit logs to CloudWatch Logs}.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The version number of the database engine to which you want to upgrade. Changing this \
         parameter results in an outage. The change is applied during the next maintenance window \
         unless the [ApplyImmediately] parameter is set to true.\n\n\
        \ For a list of valid engine versions, see \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/engine-releases.html}Engine \
         Releases for Amazon Neptune}, or call [DescribeDBEngineVersions].\n\
        \ "]
  allow_major_version_upgrade : boolean_ option;
      [@ocaml.doc
        "A value that indicates whether upgrades between different major versions are allowed.\n\n\
        \ Constraints: You must set the allow-major-version-upgrade flag when providing an \
         [EngineVersion] parameter that uses a different major version than the DB cluster's \
         current version.\n\
        \ "]
  db_instance_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the DB parameter group to apply to all instances of the DB cluster. \n\n\
        \  When you apply a parameter group using [DBInstanceParameterGroupName], parameter \
         changes aren't applied during the next maintenance window but instead are applied \
         immediately.\n\
        \  \n\
        \    Default: The existing name setting\n\
        \    \n\
        \     Constraints:\n\
        \     \n\
        \      {ul\n\
        \            {-  The DB parameter group must be in the same DB parameter group family as \
         the target DB cluster version.\n\
        \                \n\
        \                 }\n\
        \            {-  The [DBInstanceParameterGroupName] parameter is only valid in combination \
         with the [AllowMajorVersionUpgrade] parameter.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \  "]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether the DB cluster has deletion protection enabled. The \
         database can't be deleted when deletion protection is enabled. By default, deletion \
         protection is disabled.\n"]
  copy_tags_to_snapshot : boolean_optional option;
      [@ocaml.doc
        " {i If set to [true], tags are copied to any snapshot of the DB cluster that is created.} \n"]
  serverless_v2_scaling_configuration : serverless_v2_scaling_configuration option;
      [@ocaml.doc
        "Contains the scaling configuration of a Neptune Serverless DB cluster.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html}Using \
         Amazon Neptune Serverless} in the {i Amazon Neptune User Guide}.\n\
        \ "]
  storage_type : string_ option;
      [@ocaml.doc
        "The storage type to associate with the DB cluster.\n\n\
        \ Valid Values:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [standard] } \194\160 \226\128\147 \194\160 ( {i the default} ) \
         Configures cost-effective database storage for applications with moderate to small I/O \
         usage.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [iopt1] } \194\160 \226\128\147 \194\160 Enables \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/storage-types.html#provisioned-iops-storage}I/O-Optimized \
         storage} that's designed to meet the needs of I/O-intensive graph workloads that require \
         predictable pricing with low I/O latency and consistent I/O throughput.\n\
        \            \n\
        \             Neptune I/O-Optimized storage is only available starting with engine release \
         1.3.0.0.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  network_type : string_ option;
      [@ocaml.doc
        "The network type of the DB cluster.\n\n\
        \ Valid Values:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [IPV4] } \194\160 \226\128\147 \194\160 The DB cluster uses only IPv4 \
         addresses for communication.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [DUAL] } \194\160 \226\128\147 \194\160 The DB cluster uses both IPv4 \
         and IPv6 addresses for communication. The DB subnet group associated with the cluster \
         must support IPv6.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec tag_list_message = {
  tag_list : tag_list option;
      [@ocaml.doc "List of tags returned by the ListTagsForResource operation.\n"]
}
[@@ocaml.doc ""]

type nonrec filter_value_list = string_ list [@@ocaml.doc ""]

type nonrec filter = {
  name : string_; [@ocaml.doc "This parameter is not currently supported.\n"]
  values : filter_value_list; [@ocaml.doc "This parameter is not currently supported.\n"]
}
[@@ocaml.doc "This type is not currently supported.\n"]

type nonrec filter_list = filter list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_message = {
  resource_name : string_;
      [@ocaml.doc
        "The Amazon Neptune resource with tags to be listed. This value is an Amazon Resource Name \
         (ARN). For information about creating an ARN, see \
         {{:https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing} \
         Constructing an Amazon Resource Name (ARN)}.\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
}
[@@ocaml.doc ""]

type nonrec failover_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec failover_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc
        "Identifier of the Neptune global database that should be failed over. The identifier is \
         the unique key assigned by the user when the Neptune global database was created. In \
         other words, it's the name of the global database that you want to fail over.\n\n\
        \ Constraints: Must match the identifier of an existing Neptune global database.\n\
        \ "]
  target_db_cluster_identifier : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the secondary Neptune DB cluster that you want to \
         promote to primary for the global database.\n"]
  allow_data_loss : boolean_optional option;
      [@ocaml.doc
        "Specifies whether to allow data loss for this global database cluster operation. Allowing \
         data loss triggers a global failover operation.\n\n\
        \ If you don't specify [AllowDataLoss], the global database cluster operation defaults to \
         a switchover.\n\
        \ \n\
        \  Constraints: Can't be specified together with the [Switchover] parameter.\n\
        \  "]
  switchover : boolean_optional option;
      [@ocaml.doc
        "Specifies whether to switch over this global database cluster.\n\n\
        \ Constraints: Can't be specified together with the [AllowDataLoss] parameter.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec failover_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec failover_db_cluster_message = {
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "A DB cluster identifier to force a failover for. This parameter is not case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing DBCluster.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  target_db_instance_identifier : string_ option;
      [@ocaml.doc
        "The name of the instance to promote to the primary instance.\n\n\
        \ You must specify the instance identifier for an Read Replica in the DB cluster. For \
         example, [mydbcluster-replica1].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec double_range = {
  from_ : double option; [@ocaml.doc "The minimum value in the range.\n"]
  to_ : double option; [@ocaml.doc "The maximum value in the range.\n"]
}
[@@ocaml.doc "A range of double values.\n"]

type nonrec double_range_list = double_range list [@@ocaml.doc ""]

type nonrec range = {
  from_ : integer option; [@ocaml.doc "The minimum value in the range.\n"]
  to_ : integer option; [@ocaml.doc "The maximum value in the range.\n"]
  step : integer_optional option;
      [@ocaml.doc
        "The step value for the range. For example, if you have a range of 5,000 to 10,000, with a \
         step value of 1,000, the valid values start at 5,000 and step up by 1,000. Even though \
         7,500 is within the range, it isn't a valid value for the range. The valid values are \
         5,000, 6,000, 7,000, 8,000...\n"]
}
[@@ocaml.doc "A range of integer values.\n"]

type nonrec range_list = range list [@@ocaml.doc ""]

type nonrec valid_storage_options = {
  storage_type : string_ option;
      [@ocaml.doc
        "Not applicable. In Neptune the storage type is managed at the DB Cluster level.\n"]
  storage_size : range_list option;
      [@ocaml.doc
        "Not applicable. In Neptune the storage type is managed at the DB Cluster level.\n"]
  provisioned_iops : range_list option;
      [@ocaml.doc
        "Not applicable. In Neptune the storage type is managed at the DB Cluster level.\n"]
  iops_to_storage_ratio : double_range_list option;
      [@ocaml.doc
        "Not applicable. In Neptune the storage type is managed at the DB Cluster level.\n"]
}
[@@ocaml.doc "Not applicable. In Neptune the storage type is managed at the DB Cluster level.\n"]

type nonrec valid_storage_options_list = valid_storage_options list [@@ocaml.doc ""]

type nonrec valid_db_instance_modifications_message = {
  storage : valid_storage_options_list option;
      [@ocaml.doc "Valid storage options for your DB instance.\n"]
}
[@@ocaml.doc
  "Information about valid modifications that you can make to your DB instance. Contains the \
   result of a successful call to the [DescribeValidDBInstanceModifications] action. You can use \
   this information when you call [ModifyDBInstance]. \n"]

type nonrec describe_valid_db_instance_modifications_result = {
  valid_db_instance_modifications_message : valid_db_instance_modifications_message option;
      [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_valid_db_instance_modifications_message = {
  db_instance_identifier : string_;
      [@ocaml.doc "The customer identifier or the ARN of your DB instance.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The specified resource ID was not found.\n"]

type nonrec pending_maintenance_action = {
  action : string_ option;
      [@ocaml.doc "The type of pending maintenance action that is available for the resource.\n"]
  auto_applied_after_date : t_stamp option;
      [@ocaml.doc
        "The date of the maintenance window when the action is applied. The maintenance action is \
         applied to the resource during its first maintenance window after this date. If this date \
         is specified, any [next-maintenance] opt-in requests are ignored.\n"]
  forced_apply_date : t_stamp option;
      [@ocaml.doc
        "The date when the maintenance action is automatically applied. The maintenance action is \
         applied to the resource on this date regardless of the maintenance window for the \
         resource. If this date is specified, any [immediate] opt-in requests are ignored.\n"]
  opt_in_status : string_ option;
      [@ocaml.doc "Indicates the type of opt-in request that has been received for the resource.\n"]
  current_apply_date : t_stamp option;
      [@ocaml.doc
        "The effective date when the pending maintenance action is applied to the resource. This \
         date takes into account opt-in requests received from the [ApplyPendingMaintenanceAction] \
         API, the [AutoAppliedAfterDate], and the [ForcedApplyDate]. This value is blank if an \
         opt-in request has not been received and nothing has been specified as \
         [AutoAppliedAfterDate] or [ForcedApplyDate].\n"]
  description : string_ option;
      [@ocaml.doc "A description providing more detail about the maintenance action.\n"]
}
[@@ocaml.doc "Provides information about a pending maintenance action for a resource.\n"]

type nonrec pending_maintenance_action_details = pending_maintenance_action list [@@ocaml.doc ""]

type nonrec resource_pending_maintenance_actions = {
  resource_identifier : string_ option;
      [@ocaml.doc "The ARN of the resource that has pending maintenance actions.\n"]
  pending_maintenance_action_details : pending_maintenance_action_details option;
      [@ocaml.doc
        "A list that provides details about the pending maintenance actions for the resource.\n"]
}
[@@ocaml.doc "Describes the pending maintenance actions for a resource.\n"]

type nonrec pending_maintenance_actions = resource_pending_maintenance_actions list [@@ocaml.doc ""]

type nonrec pending_maintenance_actions_message = {
  pending_maintenance_actions : pending_maintenance_actions option;
      [@ocaml.doc "A list of the pending maintenance actions for the resource.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous [DescribePendingMaintenanceActions] \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to a number of records specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_pending_maintenance_actions_message = {
  resource_identifier : string_ option;
      [@ocaml.doc "The ARN of a resource to return pending maintenance actions for.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "A filter that specifies one or more resources to return pending maintenance actions for.\n\n\
        \ Supported filters:\n\
        \ \n\
        \  {ul\n\
        \        {-   [db-cluster-id] - Accepts DB cluster identifiers and DB cluster Amazon \
         Resource Names (ARNs). The results list will only include pending maintenance actions for \
         the DB clusters identified by these ARNs.\n\
        \            \n\
        \             }\n\
        \        {-   [db-instance-id] - Accepts DB instance identifiers and DB instance ARNs. The \
         results list will only include pending maintenance actions for the DB instances \
         identified by these ARNs.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous [DescribePendingMaintenanceActions] \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to a number of records specified by [MaxRecords].\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec availability_zone_list = availability_zone list [@@ocaml.doc ""]

type nonrec orderable_db_instance_option = {
  engine : string_ option; [@ocaml.doc "The engine type of a DB instance.\n"]
  engine_version : string_ option; [@ocaml.doc "The engine version of a DB instance.\n"]
  db_instance_class : string_ option; [@ocaml.doc "The DB instance class for a DB instance.\n"]
  license_model : string_ option; [@ocaml.doc "The license model for a DB instance.\n"]
  availability_zones : availability_zone_list option;
      [@ocaml.doc "A list of Availability Zones for a DB instance.\n"]
  multi_az_capable : boolean_ option;
      [@ocaml.doc "Indicates whether a DB instance is Multi-AZ capable.\n"]
  read_replica_capable : boolean_ option;
      [@ocaml.doc "Indicates whether a DB instance can have a Read Replica.\n"]
  vpc : boolean_ option; [@ocaml.doc "Indicates whether a DB instance is in a VPC.\n"]
  supports_storage_encryption : boolean_ option;
      [@ocaml.doc "Indicates whether a DB instance supports encrypted storage.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "Not applicable. In Neptune the storage type is managed at the DB Cluster level.\n"]
  supports_iops : boolean_ option;
      [@ocaml.doc "Indicates whether a DB instance supports provisioned IOPS.\n"]
  supports_enhanced_monitoring : boolean_ option;
      [@ocaml.doc
        "Indicates whether a DB instance supports Enhanced Monitoring at intervals from 1 to 60 \
         seconds.\n"]
  supports_iam_database_authentication : boolean_ option;
      [@ocaml.doc "Indicates whether a DB instance supports IAM database authentication.\n"]
  supports_performance_insights : boolean_ option; [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  min_storage_size : integer_optional option;
      [@ocaml.doc "Minimum storage size for a DB instance.\n"]
  max_storage_size : integer_optional option;
      [@ocaml.doc "Maximum storage size for a DB instance.\n"]
  min_iops_per_db_instance : integer_optional option;
      [@ocaml.doc "Minimum total provisioned IOPS for a DB instance.\n"]
  max_iops_per_db_instance : integer_optional option;
      [@ocaml.doc "Maximum total provisioned IOPS for a DB instance.\n"]
  min_iops_per_gib : double_optional option;
      [@ocaml.doc "Minimum provisioned IOPS per GiB for a DB instance.\n"]
  max_iops_per_gib : double_optional option;
      [@ocaml.doc "Maximum provisioned IOPS per GiB for a DB instance.\n"]
  supports_global_databases : boolean_ option;
      [@ocaml.doc
        "A value that indicates whether you can use Neptune global databases with a specific \
         combination of other DB engine attributes.\n"]
  supported_network_types : string_list option;
      [@ocaml.doc "The network types supported by the orderable DB instance option.\n"]
}
[@@ocaml.doc
  "Contains a list of available options for a DB instance.\n\n\
  \  This data type is used as a response element in the [DescribeOrderableDBInstanceOptions] \
   action.\n\
  \ "]

type nonrec orderable_db_instance_options_list = orderable_db_instance_option list [@@ocaml.doc ""]

type nonrec orderable_db_instance_options_message = {
  orderable_db_instance_options : orderable_db_instance_options_list option;
      [@ocaml.doc
        "An [OrderableDBInstanceOption] structure containing information about orderable options \
         for the DB instance.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous OrderableDBInstanceOptions request. \
         If this parameter is specified, the response includes only records beyond the marker, up \
         to the value specified by [MaxRecords] .\n"]
}
[@@ocaml.doc ""]

type nonrec describe_orderable_db_instance_options_message = {
  engine : string_; [@ocaml.doc "The name of the engine to retrieve DB instance options for.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The engine version filter value. Specify this parameter to show only the available \
         offerings matching the specified engine version.\n"]
  db_instance_class : string_ option;
      [@ocaml.doc
        "The DB instance class filter value. Specify this parameter to show only the available \
         offerings matching the specified DB instance class.\n"]
  license_model : string_ option;
      [@ocaml.doc
        "The license model filter value. Specify this parameter to show only the available \
         offerings matching the specified license model.\n"]
  vpc : boolean_optional option;
      [@ocaml.doc
        "The VPC filter value. Specify this parameter to show only the available VPC or non-VPC \
         offerings.\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous DescribeOrderableDBInstanceOptions \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords] .\n"]
}
[@@ocaml.doc ""]

type nonrec global_cluster_list = global_cluster list [@@ocaml.doc ""]

type nonrec global_clusters_message = {
  marker : string_ option;
      [@ocaml.doc
        "A pagination token. If this parameter is returned in the response, more records are \
         available, which can be retrieved by one or more additional calls to \
         [DescribeGlobalClusters].\n"]
  global_clusters : global_cluster_list option;
      [@ocaml.doc "The list of global clusters and instances returned by this request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_global_clusters_message = {
  global_cluster_identifier : global_cluster_identifier option;
      [@ocaml.doc
        "The user-supplied DB cluster identifier. If this parameter is specified, only information \
         about the specified DB cluster is returned. This parameter is not case-sensitive.\n\n\
        \ Constraints: If supplied, must match an existing DB cluster identifier.\n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination marker token is included in the response that \
         you can use to retrieve the remaining results.\n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "({i Optional}) A pagination token returned by a previous call to \
         [DescribeGlobalClusters]. If this parameter is specified, the response will only include \
         records beyond the marker, up to the number specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec event_subscriptions_list = event_subscription list [@@ocaml.doc ""]

type nonrec event_subscriptions_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous DescribeOrderableDBInstanceOptions \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n"]
  event_subscriptions_list : event_subscriptions_list option;
      [@ocaml.doc "A list of EventSubscriptions data types.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_event_subscriptions_message = {
  subscription_name : string_ option;
      [@ocaml.doc "The name of the event notification subscription you want to describe.\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous DescribeOrderableDBInstanceOptions \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords] .\n"]
}
[@@ocaml.doc ""]

type nonrec source_type =
  | Db_instance [@ocaml.doc ""]
  | Db_parameter_group [@ocaml.doc ""]
  | Db_security_group [@ocaml.doc ""]
  | Db_snapshot [@ocaml.doc ""]
  | Db_cluster [@ocaml.doc ""]
  | Db_cluster_snapshot [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event = {
  source_identifier : string_ option;
      [@ocaml.doc "Provides the identifier for the source of the event.\n"]
  source_type : source_type option; [@ocaml.doc "Specifies the source type for this event.\n"]
  message : string_ option; [@ocaml.doc "Provides the text of this event.\n"]
  event_categories : event_categories_list option;
      [@ocaml.doc "Specifies the category for the event.\n"]
  date : t_stamp option; [@ocaml.doc "Specifies the date and time of the event.\n"]
  source_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) for the event.\n"]
}
[@@ocaml.doc " This data type is used as a response element in the [DescribeEvents] action.\n"]

type nonrec event_list = event list [@@ocaml.doc ""]

type nonrec events_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous Events request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords] .\n"]
  events : event_list option; [@ocaml.doc " A list of [Event] instances.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_events_message = {
  source_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the event source for which events are returned. If not specified, then \
         all sources are included in the response.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If SourceIdentifier is supplied, SourceType must also be provided.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is [DBInstance], then a [DBInstanceIdentifier] must be \
         supplied.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is [DBSecurityGroup], a [DBSecurityGroupName] must be \
         supplied.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is [DBParameterGroup], a [DBParameterGroupName] must be \
         supplied.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is [DBSnapshot], a [DBSnapshotIdentifier] must be supplied.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  source_type : source_type option;
      [@ocaml.doc
        "The event source to retrieve events for. If no value is specified, all events are returned.\n"]
  start_time : t_stamp option;
      [@ocaml.doc
        " The beginning of the time interval to retrieve events for, specified in ISO 8601 format. \
         For more information about ISO 8601, go to the \
         {{:http://en.wikipedia.org/wiki/ISO_8601}ISO8601 Wikipedia page.} \n\n\
        \ Example: 2009-07-08T18:00Z\n\
        \ "]
  end_time : t_stamp option;
      [@ocaml.doc
        " The end of the time interval for which to retrieve events, specified in ISO 8601 format. \
         For more information about ISO 8601, go to the \
         {{:http://en.wikipedia.org/wiki/ISO_8601}ISO8601 Wikipedia page.} \n\n\
        \ Example: 2009-07-08T18:00Z\n\
        \ "]
  duration : integer_optional option;
      [@ocaml.doc "The number of minutes to retrieve events for.\n\n Default: 60\n "]
  event_categories : event_categories_list option;
      [@ocaml.doc
        "A list of event categories that trigger notifications for a event notification \
         subscription.\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous DescribeEvents request. If this \
         parameter is specified, the response includes only records beyond the marker, up to the \
         value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec event_categories_map = {
  source_type : string_ option;
      [@ocaml.doc "The source type that the returned categories belong to\n"]
  event_categories : event_categories_list option;
      [@ocaml.doc "The event categories for the specified source type\n"]
}
[@@ocaml.doc
  "Contains the results of a successful invocation of the [DescribeEventCategories] action.\n"]

type nonrec event_categories_map_list = event_categories_map list [@@ocaml.doc ""]

type nonrec event_categories_message = {
  event_categories_map_list : event_categories_map_list option;
      [@ocaml.doc "A list of EventCategoriesMap data types.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_event_categories_message = {
  source_type : string_ option;
      [@ocaml.doc
        "The type of source that is generating the events.\n\n\
        \ Valid values: db-instance | db-parameter-group | db-security-group | db-snapshot\n\
        \ "]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
}
[@@ocaml.doc ""]

type nonrec engine_defaults = {
  db_parameter_group_family : string_ option;
      [@ocaml.doc
        "Specifies the name of the DB parameter group family that the engine default parameters \
         apply to.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous EngineDefaults request. If this \
         parameter is specified, the response includes only records beyond the marker, up to the \
         value specified by [MaxRecords] .\n"]
  parameters : parameters_list option; [@ocaml.doc "Contains a list of engine default parameters.\n"]
}
[@@ocaml.doc
  " Contains the result of a successful invocation of the [DescribeEngineDefaultParameters] action.\n"]

type nonrec describe_engine_default_parameters_result = {
  engine_defaults : engine_defaults option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_engine_default_parameters_message = {
  db_parameter_group_family : string_; [@ocaml.doc "The name of the DB parameter group family.\n"]
  filters : filter_list option; [@ocaml.doc "Not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous [DescribeEngineDefaultParameters] \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_engine_default_cluster_parameters_result = {
  engine_defaults : engine_defaults option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_engine_default_cluster_parameters_message = {
  db_parameter_group_family : string_;
      [@ocaml.doc
        "The name of the DB cluster parameter group family to return engine parameter information \
         for.\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous \
         [DescribeEngineDefaultClusterParameters] request. If this parameter is specified, the \
         response includes only records beyond the marker, up to the value specified by \
         [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec db_subnet_groups = db_subnet_group list [@@ocaml.doc ""]

type nonrec db_subnet_group_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  db_subnet_groups : db_subnet_groups option; [@ocaml.doc " A list of [DBSubnetGroup] instances.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_db_subnet_groups_message = {
  db_subnet_group_name : string_ option;
      [@ocaml.doc "The name of the DB subnet group to return details for.\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous DescribeDBSubnetGroups request. If \
         this parameter is specified, the response includes only records beyond the marker, up to \
         the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec db_parameter_group_details = {
  parameters : parameters_list option; [@ocaml.doc "A list of [Parameter] values.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_db_parameters_message = {
  db_parameter_group_name : string_;
      [@ocaml.doc
        "The name of a specific DB parameter group to return details for.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match the name of an existing DBParameterGroup.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  source : string_ option;
      [@ocaml.doc
        "The parameter types to return.\n\n\
        \ Default: All parameter types returned\n\
        \ \n\
        \  Valid Values: [user | system | engine-default] \n\
        \  "]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeDBParameters] request. If \
         this parameter is specified, the response includes only records beyond the marker, up to \
         the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec db_parameter_group = {
  db_parameter_group_name : string_ option;
      [@ocaml.doc "Provides the name of the DB parameter group.\n"]
  db_parameter_group_family : string_ option;
      [@ocaml.doc
        "Provides the name of the DB parameter group family that this DB parameter group is \
         compatible with.\n"]
  description : string_ option;
      [@ocaml.doc "Provides the customer-specified description for this DB parameter group.\n"]
  db_parameter_group_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the DB parameter group.\n"]
}
[@@ocaml.doc
  "Contains the details of an Amazon Neptune DB parameter group.\n\n\
  \ This data type is used as a response element in the [DescribeDBParameterGroups] action.\n\
  \ "]

type nonrec db_parameter_group_list = db_parameter_group list [@@ocaml.doc ""]

type nonrec db_parameter_groups_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  db_parameter_groups : db_parameter_group_list option;
      [@ocaml.doc "A list of [DBParameterGroup] instances.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_db_parameter_groups_message = {
  db_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of a specific DB parameter group to return details for.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match the name of an existing DBClusterParameterGroup.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeDBParameterGroups] request. \
         If this parameter is specified, the response includes only records beyond the marker, up \
         to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec db_instance_list = db_instance list [@@ocaml.doc ""]

type nonrec db_instance_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords] .\n"]
  db_instances : db_instance_list option; [@ocaml.doc " A list of [DBInstance] instances.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_db_instances_message = {
  db_instance_identifier : string_ option;
      [@ocaml.doc
        "The user-supplied instance identifier. If this parameter is specified, information from \
         only the specific DB instance is returned. This parameter isn't case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match the identifier of an existing DBInstance.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "A filter that specifies one or more DB instances to describe.\n\n\
        \ Supported filters:\n\
        \ \n\
        \  {ul\n\
        \        {-   [db-cluster-id] - Accepts DB cluster identifiers and DB cluster Amazon \
         Resource Names (ARNs). The results list will only include information about the DB \
         instances associated with the DB clusters identified by these ARNs.\n\
        \            \n\
        \             }\n\
        \        {-   [engine] - Accepts an engine name (such as [neptune]), and restricts the \
         results list to DB instances created by that engine.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For example, to invoke this API from the Amazon CLI and filter so that only Neptune DB \
         instances are returned, you could use the following command:\n\
        \   "]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous [DescribeDBInstances] request. If \
         this parameter is specified, the response includes only records beyond the marker, up to \
         the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec timezone = {
  timezone_name : string_ option; [@ocaml.doc "The name of the time zone.\n"]
}
[@@ocaml.doc "A time zone associated with a [DBInstance].\n"]

type nonrec supported_timezones_list = timezone list [@@ocaml.doc ""]

type nonrec upgrade_target = {
  engine : string_ option; [@ocaml.doc "The name of the upgrade target database engine.\n"]
  engine_version : string_ option;
      [@ocaml.doc "The version number of the upgrade target database engine.\n"]
  description : string_ option;
      [@ocaml.doc "The version of the database engine that a DB instance can be upgraded to.\n"]
  auto_upgrade : boolean_ option;
      [@ocaml.doc
        "A value that indicates whether the target version is applied to any source DB instances \
         that have AutoMinorVersionUpgrade set to true.\n"]
  is_major_version_upgrade : boolean_ option;
      [@ocaml.doc
        "A value that indicates whether a database engine is upgraded to a major version.\n"]
  supports_global_databases : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether you can use Neptune global databases with the target \
         engine version.\n"]
}
[@@ocaml.doc "The version of the database engine that a DB instance can be upgraded to.\n"]

type nonrec valid_upgrade_target_list = upgrade_target list [@@ocaml.doc ""]

type nonrec character_set = {
  character_set_name : string_ option; [@ocaml.doc "The name of the character set.\n"]
  character_set_description : string_ option; [@ocaml.doc "The description of the character set.\n"]
}
[@@ocaml.doc "Specifies a character set.\n"]

type nonrec supported_character_sets_list = character_set list [@@ocaml.doc ""]

type nonrec db_engine_version = {
  engine : string_ option; [@ocaml.doc "The name of the database engine.\n"]
  engine_version : string_ option; [@ocaml.doc "The version number of the database engine.\n"]
  db_parameter_group_family : string_ option;
      [@ocaml.doc "The name of the DB parameter group family for the database engine.\n"]
  db_engine_description : string_ option; [@ocaml.doc "The description of the database engine.\n"]
  db_engine_version_description : string_ option;
      [@ocaml.doc "The description of the database engine version.\n"]
  default_character_set : character_set option; [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  supported_character_sets : supported_character_sets_list option;
      [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  valid_upgrade_target : valid_upgrade_target_list option;
      [@ocaml.doc
        "A list of engine versions that this database engine version can be upgraded to.\n"]
  supported_timezones : supported_timezones_list option;
      [@ocaml.doc
        "A list of the time zones supported by this engine for the [Timezone] parameter of the \
         [CreateDBInstance] action.\n"]
  exportable_log_types : log_type_list option;
      [@ocaml.doc
        "The types of logs that the database engine has available for export to CloudWatch Logs.\n"]
  supports_log_exports_to_cloudwatch_logs : boolean_ option;
      [@ocaml.doc
        "A value that indicates whether the engine version supports exporting the log types \
         specified by ExportableLogTypes to CloudWatch Logs.\n"]
  supports_read_replica : boolean_ option;
      [@ocaml.doc "Indicates whether the database engine version supports read replicas.\n"]
  supports_global_databases : boolean_ option;
      [@ocaml.doc
        "A value that indicates whether you can use Aurora global databases with a specific DB \
         engine version.\n"]
}
[@@ocaml.doc
  " This data type is used as a response element in the action [DescribeDBEngineVersions].\n"]

type nonrec db_engine_version_list = db_engine_version list [@@ocaml.doc ""]

type nonrec db_engine_version_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  db_engine_versions : db_engine_version_list option;
      [@ocaml.doc " A list of [DBEngineVersion] elements.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_db_engine_versions_message = {
  engine : string_ option; [@ocaml.doc "The database engine to return.\n"]
  engine_version : string_ option;
      [@ocaml.doc "The database engine version to return.\n\n Example: [5.1.49] \n "]
  db_parameter_group_family : string_ option;
      [@ocaml.doc
        "The name of a specific DB parameter group family to return details for.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match an existing DBParameterGroupFamily.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  filters : filter_list option; [@ocaml.doc "Not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more than the [MaxRecords] \
         value is available, a pagination token called a marker is included in the response so \
         that the following results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  default_only : boolean_ option;
      [@ocaml.doc
        "Indicates that only the default version of the specified engine or engine and major \
         version combination is returned.\n"]
  list_supported_character_sets : boolean_optional option;
      [@ocaml.doc
        "If this parameter is specified and the requested engine supports the [CharacterSetName] \
         parameter for [CreateDBInstance], the response includes a list of supported character \
         sets for each engine version.\n"]
  list_supported_timezones : boolean_optional option;
      [@ocaml.doc
        "If this parameter is specified and the requested engine supports the [TimeZone] parameter \
         for [CreateDBInstance], the response includes a list of supported time zones for each \
         engine version.\n"]
}
[@@ocaml.doc ""]

type nonrec db_cluster_snapshot = {
  availability_zones : availability_zones option;
      [@ocaml.doc
        "Provides the list of EC2 Availability Zones that instances in the DB cluster snapshot can \
         be restored in.\n"]
  db_cluster_snapshot_identifier : string_ option;
      [@ocaml.doc
        "Specifies the identifier for a DB cluster snapshot. Must match the identifier of an \
         existing snapshot.\n\n\
        \ After you restore a DB cluster using a [DBClusterSnapshotIdentifier], you must specify \
         the same [DBClusterSnapshotIdentifier] for any future updates to the DB cluster. When you \
         specify this property for an update, the DB cluster is not restored from the snapshot \
         again, and the data in the database is not changed.\n\
        \ \n\
        \  However, if you don't specify the [DBClusterSnapshotIdentifier], an empty DB cluster is \
         created, and the original DB cluster is deleted. If you specify a property that is \
         different from the previous snapshot restore property, the DB cluster is restored from \
         the snapshot specified by the [DBClusterSnapshotIdentifier], and the original DB cluster \
         is deleted.\n\
        \  "]
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "Specifies the DB cluster identifier of the DB cluster that this DB cluster snapshot was \
         created from.\n"]
  snapshot_create_time : t_stamp option;
      [@ocaml.doc
        "Provides the time when the snapshot was taken, in Universal Coordinated Time (UTC).\n"]
  engine : string_ option; [@ocaml.doc "Specifies the name of the database engine.\n"]
  allocated_storage : integer option;
      [@ocaml.doc "Specifies the allocated storage size in gibibytes (GiB).\n"]
  status : string_ option; [@ocaml.doc "Specifies the status of this DB cluster snapshot.\n"]
  port : integer option;
      [@ocaml.doc
        "Specifies the port that the DB cluster was listening on at the time of the snapshot.\n"]
  vpc_id : string_ option;
      [@ocaml.doc "Provides the VPC ID associated with the DB cluster snapshot.\n"]
  cluster_create_time : t_stamp option;
      [@ocaml.doc
        "Specifies the time when the DB cluster was created, in Universal Coordinated Time (UTC).\n"]
  master_username : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  engine_version : string_ option;
      [@ocaml.doc "Provides the version of the database engine for this DB cluster snapshot.\n"]
  license_model : string_ option;
      [@ocaml.doc "Provides the license model information for this DB cluster snapshot.\n"]
  snapshot_type : string_ option; [@ocaml.doc "Provides the type of the DB cluster snapshot.\n"]
  percent_progress : integer option;
      [@ocaml.doc "Specifies the percentage of the estimated data that has been transferred.\n"]
  storage_encrypted : boolean_ option;
      [@ocaml.doc "Specifies whether the DB cluster snapshot is encrypted.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "If [StorageEncrypted] is true, the Amazon KMS key identifier for the encrypted DB cluster \
         snapshot.\n"]
  db_cluster_snapshot_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the DB cluster snapshot.\n"]
  source_db_cluster_snapshot_arn : string_ option;
      [@ocaml.doc
        "If the DB cluster snapshot was copied from a source DB cluster snapshot, the Amazon \
         Resource Name (ARN) for the source DB cluster snapshot, otherwise, a null value.\n"]
  iam_database_authentication_enabled : boolean_ option;
      [@ocaml.doc
        "True if mapping of Amazon Identity and Access Management (IAM) accounts to database \
         accounts is enabled, and otherwise false.\n"]
  storage_type : string_ option;
      [@ocaml.doc "The storage type associated with the DB cluster snapshot.\n"]
}
[@@ocaml.doc
  "Contains the details for an Amazon Neptune DB cluster snapshot\n\n\
  \ This data type is used as a response element in the [DescribeDBClusterSnapshots] action.\n\
  \ "]

type nonrec db_cluster_snapshot_list = db_cluster_snapshot list [@@ocaml.doc ""]

type nonrec db_cluster_snapshot_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous [DescribeDBClusterSnapshots] \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords]. \n"]
  db_cluster_snapshots : db_cluster_snapshot_list option;
      [@ocaml.doc "Provides a list of DB cluster snapshots for the user.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_db_cluster_snapshots_message = {
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The ID of the DB cluster to retrieve the list of DB cluster snapshots for. This parameter \
         can't be used in conjunction with the [DBClusterSnapshotIdentifier] parameter. This \
         parameter is not case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match the identifier of an existing DBCluster.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  db_cluster_snapshot_identifier : string_ option;
      [@ocaml.doc
        "A specific DB cluster snapshot identifier to describe. This parameter can't be used in \
         conjunction with the [DBClusterIdentifier] parameter. This value is stored as a lowercase \
         string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match the identifier of an existing DBClusterSnapshot.\n\
        \            \n\
        \             }\n\
        \        {-  If this identifier is for an automated snapshot, the [SnapshotType] parameter \
         must also be specified.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  snapshot_type : string_ option;
      [@ocaml.doc
        "The type of DB cluster snapshots to be returned. You can specify one of the following \
         values:\n\n\
        \ {ul\n\
        \       {-   [automated] - Return all DB cluster snapshots that have been automatically \
         taken by Amazon Neptune for my Amazon account.\n\
        \           \n\
        \            }\n\
        \       {-   [manual] - Return all DB cluster snapshots that have been taken by my Amazon \
         account.\n\
        \           \n\
        \            }\n\
        \       {-   [shared] - Return all manual DB cluster snapshots that have been shared to my \
         Amazon account.\n\
        \           \n\
        \            }\n\
        \       {-   [public] - Return all DB cluster snapshots that have been marked as public.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If you don't specify a [SnapshotType] value, then both automated and manual DB cluster \
         snapshots are returned. You can include shared DB cluster snapshots with these results by \
         setting the [IncludeShared] parameter to [true]. You can include public DB cluster \
         snapshots with these results by setting the [IncludePublic] parameter to [true].\n\
        \   \n\
        \    The [IncludeShared] and [IncludePublic] parameters don't apply for [SnapshotType] \
         values of [manual] or [automated]. The [IncludePublic] parameter doesn't apply when \
         [SnapshotType] is set to [shared]. The [IncludeShared] parameter doesn't apply when \
         [SnapshotType] is set to [public].\n\
        \    "]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeDBClusterSnapshots] request. \
         If this parameter is specified, the response includes only records beyond the marker, up \
         to the value specified by [MaxRecords]. \n"]
  include_shared : boolean_ option;
      [@ocaml.doc
        "True to include shared manual DB cluster snapshots from other Amazon accounts that this \
         Amazon account has been given permission to copy or restore, and otherwise false. The \
         default is [false].\n\n\
        \ You can give an Amazon account permission to restore a manual DB cluster snapshot from \
         another Amazon account by the [ModifyDBClusterSnapshotAttribute] API action.\n\
        \ "]
  include_public : boolean_ option;
      [@ocaml.doc
        "True to include manual DB cluster snapshots that are public and can be copied or restored \
         by any Amazon account, and otherwise false. The default is [false]. The default is \
         false.\n\n\
        \ You can share a manual DB cluster snapshot as public by using the \
         [ModifyDBClusterSnapshotAttribute] API action.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_db_cluster_snapshot_attributes_result = {
  db_cluster_snapshot_attributes_result : db_cluster_snapshot_attributes_result option;
      [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_db_cluster_snapshot_attributes_message = {
  db_cluster_snapshot_identifier : string_;
      [@ocaml.doc "The identifier for the DB cluster snapshot to describe the attributes for.\n"]
}
[@@ocaml.doc ""]

type nonrec db_cluster_list = db_cluster list [@@ocaml.doc ""]

type nonrec db_cluster_message = {
  marker : string_ option;
      [@ocaml.doc
        "A pagination token that can be used in a subsequent DescribeDBClusters request.\n"]
  db_clusters : db_cluster_list option; [@ocaml.doc "Contains a list of DB clusters for the user.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_db_clusters_message = {
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The user-supplied DB cluster identifier. If this parameter is specified, information from \
         only the specific DB cluster is returned. This parameter isn't case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match an existing DBClusterIdentifier.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "A filter that specifies one or more DB clusters to describe.\n\n\
        \ Supported filters:\n\
        \ \n\
        \  {ul\n\
        \        {-   [db-cluster-id] - Accepts DB cluster identifiers and DB cluster Amazon \
         Resource Names (ARNs). The results list will only include information about the DB \
         clusters identified by these ARNs.\n\
        \            \n\
        \             }\n\
        \        {-   [engine] - Accepts an engine name (such as [neptune]), and restricts the \
         results list to DB clusters created by that engine.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For example, to invoke this API from the Amazon CLI and filter so that only Neptune DB \
         clusters are returned, you could use the following command:\n\
        \   "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeDBClusters] request. If this \
         parameter is specified, the response includes only records beyond the marker, up to the \
         value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec db_cluster_parameter_group_details = {
  parameters : parameters_list option;
      [@ocaml.doc "Provides a list of parameters for the DB cluster parameter group.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous DescribeDBClusterParameters request. \
         If this parameter is specified, the response includes only records beyond the marker, up \
         to the value specified by [MaxRecords] .\n"]
}
[@@ocaml.doc ""]

type nonrec describe_db_cluster_parameters_message = {
  db_cluster_parameter_group_name : string_;
      [@ocaml.doc
        "The name of a specific DB cluster parameter group to return parameter details for.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match the name of an existing DBClusterParameterGroup.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  source : string_ option;
      [@ocaml.doc
        " A value that indicates to return only parameters for a specific source. Parameter \
         sources can be [engine], [service], or [customer].\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous [DescribeDBClusterParameters] \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords]. \n"]
}
[@@ocaml.doc ""]

type nonrec db_cluster_parameter_group = {
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc "Provides the name of the DB cluster parameter group.\n"]
  db_parameter_group_family : string_ option;
      [@ocaml.doc
        "Provides the name of the DB parameter group family that this DB cluster parameter group \
         is compatible with.\n"]
  description : string_ option;
      [@ocaml.doc
        "Provides the customer-specified description for this DB cluster parameter group.\n"]
  db_cluster_parameter_group_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the DB cluster parameter group.\n"]
}
[@@ocaml.doc
  "Contains the details of an Amazon Neptune DB cluster parameter group.\n\n\
  \ This data type is used as a response element in the [DescribeDBClusterParameterGroups] action.\n\
  \ "]

type nonrec db_cluster_parameter_group_list = db_cluster_parameter_group list [@@ocaml.doc ""]

type nonrec db_cluster_parameter_groups_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous [DescribeDBClusterParameterGroups] \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n"]
  db_cluster_parameter_groups : db_cluster_parameter_group_list option;
      [@ocaml.doc "A list of DB cluster parameter groups.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_db_cluster_parameter_groups_message = {
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of a specific DB cluster parameter group to return details for.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match the name of an existing DBClusterParameterGroup.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous [DescribeDBClusterParameterGroups] \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec db_cluster_endpoint = {
  db_cluster_endpoint_identifier : string_ option;
      [@ocaml.doc
        "The identifier associated with the endpoint. This parameter is stored as a lowercase \
         string.\n"]
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The DB cluster identifier of the DB cluster associated with the endpoint. This parameter \
         is stored as a lowercase string.\n"]
  db_cluster_endpoint_resource_identifier : string_ option;
      [@ocaml.doc
        "A unique system-generated identifier for an endpoint. It remains the same for the whole \
         life of the endpoint.\n"]
  endpoint : string_ option; [@ocaml.doc "The DNS address of the endpoint.\n"]
  status : string_ option;
      [@ocaml.doc
        "The current status of the endpoint. One of: [creating], [available], [deleting], \
         [inactive], [modifying]. The [inactive] state applies to an endpoint that cannot be used \
         for a certain kind of cluster, such as a [writer] endpoint for a read-only secondary \
         cluster in a global database.\n"]
  endpoint_type : string_ option;
      [@ocaml.doc "The type of the endpoint. One of: [READER], [WRITER], [CUSTOM].\n"]
  custom_endpoint_type : string_ option;
      [@ocaml.doc
        "The type associated with a custom endpoint. One of: [READER], [WRITER], [ANY].\n"]
  static_members : string_list option;
      [@ocaml.doc "List of DB instance identifiers that are part of the custom endpoint group.\n"]
  excluded_members : string_list option;
      [@ocaml.doc
        "List of DB instance identifiers that aren't part of the custom endpoint group. All other \
         eligible instances are reachable through the custom endpoint. Only relevant if the list \
         of static members is empty.\n"]
  db_cluster_endpoint_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the endpoint.\n"]
}
[@@ocaml.doc
  "This data type represents the information you need to connect to an Amazon Neptune DB cluster. \
   This data type is used as a response element in the following actions:\n\n\
  \ {ul\n\
  \       {-   [CreateDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       {-   [DescribeDBClusterEndpoints] \n\
  \           \n\
  \            }\n\
  \       {-   [ModifyDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       {-   [DeleteDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For the data structure that represents Amazon Neptune DB instance endpoints, see [Endpoint].\n\
  \   "]

type nonrec db_cluster_endpoint_list = db_cluster_endpoint list [@@ocaml.doc ""]

type nonrec db_cluster_endpoint_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeDBClusterEndpoints] request. \
         If this parameter is specified, the response includes only records beyond the marker, up \
         to the value specified by [MaxRecords].\n"]
  db_cluster_endpoints : db_cluster_endpoint_list option;
      [@ocaml.doc
        "Contains the details of the endpoints associated with the cluster and matching any filter \
         conditions.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_db_cluster_endpoints_message = {
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The DB cluster identifier of the DB cluster associated with the endpoint. This parameter \
         is stored as a lowercase string.\n"]
  db_cluster_endpoint_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the endpoint to describe. This parameter is stored as a lowercase string.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "A set of name-value pairs that define which endpoints to include in the output. The \
         filters are specified as name-value pairs, in the format \n\
         {[\n\
         Name={i endpoint_type},Values={i endpoint_type1},{i endpoint_type2},...\n\
         ]}\n\
         . [Name] can be one of: [db-cluster-endpoint-type], [db-cluster-endpoint-custom-type], \
         [db-cluster-endpoint-id], [db-cluster-endpoint-status]. [Values] for the [ \
         db-cluster-endpoint-type] filter can be one or more of: [reader], [writer], [custom]. \
         [Values] for the [db-cluster-endpoint-custom-type] filter can be one or more of: \
         [reader], [any]. [Values] for the [db-cluster-endpoint-status] filter can be one or more \
         of: [available], [creating], [deleting], [inactive], [modifying]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so you can retrieve the remaining results.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeDBClusterEndpoints] request. \
         If this parameter is specified, the response includes only records beyond the marker, up \
         to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc "The cluster identifier of the global database cluster being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_event_subscription_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The event subscription is in an invalid state.\n"]

type nonrec delete_event_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_event_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc "The name of the event notification subscription you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_db_subnet_state_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The DB subnet is not in the {i available} state.\n"]

type nonrec delete_db_subnet_group_message = {
  db_subnet_group_name : string_;
      [@ocaml.doc
        "The name of the database subnet group to delete.\n\n\
        \  You can't delete the default subnet group.\n\
        \  \n\
        \    Constraints:\n\
        \    \n\
        \     Constraints: Must match the name of an existing DBSubnetGroup. Must not be default.\n\
        \     \n\
        \      Example: [mySubnetgroup] \n\
        \      "]
}
[@@ocaml.doc ""]

type nonrec delete_db_parameter_group_message = {
  db_parameter_group_name : string_;
      [@ocaml.doc
        "The name of the DB parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be the name of an existing DB parameter group\n\
        \            \n\
        \             }\n\
        \        {-  You can't delete a default DB parameter group\n\
        \            \n\
        \             }\n\
        \        {-  Cannot be associated with any DB instances\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec snapshot_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "Request would result in user exceeding the allowed number of DB snapshots.\n"]

type nonrec db_snapshot_already_exists_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc " {i DBSnapshotIdentifier} is already used by an existing snapshot.\n"]

type nonrec delete_db_instance_result = { db_instance : db_instance option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec delete_db_instance_message = {
  db_instance_identifier : string_;
      [@ocaml.doc
        "The DB instance identifier for the DB instance to be deleted. This parameter isn't \
         case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the name of an existing DB instance.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  skip_final_snapshot : boolean_ option;
      [@ocaml.doc
        " Determines whether a final DB snapshot is created before the DB instance is deleted. If \
         [true] is specified, no DBSnapshot is created. If [false] is specified, a DB snapshot is \
         created before the DB instance is deleted.\n\n\
        \ Note that when a DB instance is in a failure state and has a status of 'failed', \
         'incompatible-restore', or 'incompatible-network', it can only be deleted when the \
         SkipFinalSnapshot parameter is set to \"true\".\n\
        \ \n\
        \  Specify [true] when deleting a Read Replica.\n\
        \  \n\
        \    The FinalDBSnapshotIdentifier parameter must be specified if SkipFinalSnapshot is \
         [false].\n\
        \    \n\
        \      Default: [false] \n\
        \      "]
  final_db_snapshot_identifier : string_ option;
      [@ocaml.doc
        " The DBSnapshotIdentifier of the new DBSnapshot created when SkipFinalSnapshot is set to \
         [false].\n\n\
        \  Specifying this parameter and also setting the SkipFinalSnapshot parameter to true \
         results in an error.\n\
        \  \n\
        \    Constraints:\n\
        \    \n\
        \     {ul\n\
        \           {-  Must be 1 to 255 letters or numbers.\n\
        \               \n\
        \                }\n\
        \           {-  First character must be a letter\n\
        \               \n\
        \                }\n\
        \           {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \               \n\
        \                }\n\
        \           {-  Cannot be specified when deleting a Read Replica.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_db_cluster_snapshot_result = {
  db_cluster_snapshot : db_cluster_snapshot option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_db_cluster_snapshot_message = {
  db_cluster_snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier of the DB cluster snapshot to delete.\n\n\
        \ Constraints: Must be the name of an existing DB cluster snapshot in the [available] state.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_db_cluster_parameter_group_message = {
  db_cluster_parameter_group_name : string_;
      [@ocaml.doc
        "The name of the DB cluster parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be the name of an existing DB cluster parameter group.\n\
        \            \n\
        \             }\n\
        \        {-  You can't delete a default DB cluster parameter group.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot be associated with any DB clusters.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_db_cluster_endpoint_output = {
  db_cluster_endpoint_identifier : string_ option;
      [@ocaml.doc
        "The identifier associated with the endpoint. This parameter is stored as a lowercase \
         string.\n"]
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The DB cluster identifier of the DB cluster associated with the endpoint. This parameter \
         is stored as a lowercase string.\n"]
  db_cluster_endpoint_resource_identifier : string_ option;
      [@ocaml.doc
        "A unique system-generated identifier for an endpoint. It remains the same for the whole \
         life of the endpoint.\n"]
  endpoint : string_ option; [@ocaml.doc "The DNS address of the endpoint.\n"]
  status : string_ option;
      [@ocaml.doc
        "The current status of the endpoint. One of: [creating], [available], [deleting], \
         [inactive], [modifying]. The [inactive] state applies to an endpoint that cannot be used \
         for a certain kind of cluster, such as a [writer] endpoint for a read-only secondary \
         cluster in a global database.\n"]
  endpoint_type : string_ option;
      [@ocaml.doc "The type of the endpoint. One of: [READER], [WRITER], [CUSTOM].\n"]
  custom_endpoint_type : string_ option;
      [@ocaml.doc
        "The type associated with a custom endpoint. One of: [READER], [WRITER], [ANY].\n"]
  static_members : string_list option;
      [@ocaml.doc "List of DB instance identifiers that are part of the custom endpoint group.\n"]
  excluded_members : string_list option;
      [@ocaml.doc
        "List of DB instance identifiers that aren't part of the custom endpoint group. All other \
         eligible instances are reachable through the custom endpoint. Only relevant if the list \
         of static members is empty.\n"]
  db_cluster_endpoint_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the endpoint.\n"]
}
[@@ocaml.doc
  "This data type represents the information you need to connect to an Amazon Neptune DB cluster. \
   This data type is used as a response element in the following actions:\n\n\
  \ {ul\n\
  \       {-   [CreateDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       {-   [DescribeDBClusterEndpoints] \n\
  \           \n\
  \            }\n\
  \       {-   [ModifyDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       {-   [DeleteDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For the data structure that represents Amazon RDS DB instance endpoints, see [Endpoint].\n\
  \   "]

type nonrec delete_db_cluster_endpoint_message = {
  db_cluster_endpoint_identifier : string_;
      [@ocaml.doc
        "The identifier associated with the custom endpoint. This parameter is stored as a \
         lowercase string.\n"]
}
[@@ocaml.doc ""]

type nonrec db_cluster_snapshot_already_exists_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "User already has a DB cluster snapshot with the given identifier.\n"]

type nonrec delete_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec delete_db_cluster_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The DB cluster identifier for the DB cluster to be deleted. This parameter isn't \
         case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match an existing DBClusterIdentifier.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  skip_final_snapshot : boolean_ option;
      [@ocaml.doc
        " Determines whether a final DB cluster snapshot is created before the DB cluster is \
         deleted. If [true] is specified, no DB cluster snapshot is created. If [false] is \
         specified, a DB cluster snapshot is created before the DB cluster is deleted.\n\n\
        \  You must specify a [FinalDBSnapshotIdentifier] parameter if [SkipFinalSnapshot] is \
         [false].\n\
        \  \n\
        \    Default: [false] \n\
        \    "]
  final_db_snapshot_identifier : string_ option;
      [@ocaml.doc
        " The DB cluster snapshot identifier of the new DB cluster snapshot created when \
         [SkipFinalSnapshot] is set to [false].\n\n\
        \   Specifying this parameter and also setting the [SkipFinalSnapshot] parameter to true \
         results in an error.\n\
        \  \n\
        \    Constraints:\n\
        \    \n\
        \     {ul\n\
        \           {-  Must be 1 to 255 letters, numbers, or hyphens.\n\
        \               \n\
        \                }\n\
        \           {-  First character must be a letter\n\
        \               \n\
        \                }\n\
        \           {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec global_cluster_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc
  "The number of global database clusters for this account is already at the maximum allowed.\n"]

type nonrec create_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc "The cluster identifier of the new global database cluster.\n"]
  source_db_cluster_identifier : string_ option;
      [@ocaml.doc
        "({i Optional}) The Amazon Resource Name (ARN) of an existing Neptune DB cluster to use as \
         the primary cluster of the new global database.\n"]
  engine : string_ option;
      [@ocaml.doc
        "The name of the database engine to be used in the global database.\n\n\
        \ Valid values: [neptune] \n\
        \ "]
  engine_version : string_ option;
      [@ocaml.doc
        "The Neptune engine version to be used by the global database.\n\n\
        \ Valid values: [1.2.0.0] or above.\n\
        \ "]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "The deletion protection setting for the new global database. The global database can't be \
         deleted when deletion protection is enabled.\n"]
  database_name : string_ option;
      [@ocaml.doc "The name for the new global database (up to 64 alpha-numeric characters).\n"]
  tags : tag_list option; [@ocaml.doc "Tags to assign to the global cluster.\n"]
  storage_encrypted : boolean_optional option;
      [@ocaml.doc "The storage encryption setting for the new global database cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec subscription_already_exist_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "This subscription already exists.\n"]

type nonrec create_event_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_event_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc
        "The name of the subscription.\n\n\
        \ Constraints: The name must be less than 255 characters.\n\
        \ "]
  sns_topic_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the SNS topic created for event notification. The ARN \
         is created by Amazon SNS when you create a topic and subscribe to it.\n"]
  source_type : string_ option;
      [@ocaml.doc
        "The type of source that is generating the events. For example, if you want to be notified \
         of events generated by a DB instance, you would set this parameter to db-instance. if \
         this value is not specified, all events are returned.\n\n\
        \ Valid values: [db-instance] | [db-cluster] | [db-parameter-group] | [db-security-group] \
         | [db-snapshot] | [db-cluster-snapshot] \n\
        \ "]
  event_categories : event_categories_list option;
      [@ocaml.doc
        " A list of event categories for a SourceType that you want to subscribe to. You can see a \
         list of the categories for a given SourceType by using the {b DescribeEventCategories} \
         action.\n"]
  source_ids : source_ids_list option;
      [@ocaml.doc
        "The list of identifiers of the event sources for which events are returned. If not \
         specified, then all sources are included in the response. An identifier must begin with a \
         letter and must contain only ASCII letters, digits, and hyphens; it can't end with a \
         hyphen or contain two consecutive hyphens.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If SourceIds are supplied, SourceType must also be provided.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is a DB instance, then a [DBInstanceIdentifier] must be \
         supplied.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is a DB security group, a [DBSecurityGroupName] must be \
         supplied.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is a DB parameter group, a [DBParameterGroupName] must be \
         supplied.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is a DB snapshot, a [DBSnapshotIdentifier] must be supplied.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  enabled : boolean_optional option;
      [@ocaml.doc
        " A Boolean value; set to {b true} to activate the subscription, set to {b false} to \
         create the subscription but not activate it.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be applied to the new event subscription.\n"]
}
[@@ocaml.doc ""]

type nonrec db_subnet_group_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "Request would result in user exceeding the allowed number of DB subnet groups.\n"]

type nonrec db_subnet_group_already_exists_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc " {i DBSubnetGroupName} is already used by an existing DB subnet group.\n"]

type nonrec create_db_subnet_group_result = {
  db_subnet_group : db_subnet_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_db_subnet_group_message = {
  db_subnet_group_name : string_;
      [@ocaml.doc
        "The name for the DB subnet group. This value is stored as a lowercase string.\n\n\
        \ Constraints: Must contain no more than 255 letters, numbers, periods, underscores, \
         spaces, or hyphens. Must not be default.\n\
        \ \n\
        \  Example: [mySubnetgroup] \n\
        \  "]
  db_subnet_group_description : string_; [@ocaml.doc "The description for the DB subnet group.\n"]
  subnet_ids : subnet_identifier_list; [@ocaml.doc "The EC2 Subnet IDs for the DB subnet group.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the new DB subnet group.\n"]
}
[@@ocaml.doc ""]

type nonrec db_parameter_group_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "Request would result in user exceeding the allowed number of DB parameter groups.\n"]

type nonrec db_parameter_group_already_exists_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "A DB parameter group with the same name exists.\n"]

type nonrec create_db_parameter_group_result = {
  db_parameter_group : db_parameter_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_db_parameter_group_message = {
  db_parameter_group_name : string_;
      [@ocaml.doc
        "The name of the DB parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be 1 to 255 letters, numbers, or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    This value is stored as a lowercase string.\n\
        \    \n\
        \     "]
  db_parameter_group_family : string_;
      [@ocaml.doc
        "The DB parameter group family name. A DB parameter group can be associated with one and \
         only one DB parameter group family, and can be applied only to a DB instance running a \
         database engine and engine version compatible with that DB parameter group family.\n"]
  description : string_; [@ocaml.doc "The description for the DB parameter group.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the new DB parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "Request would result in user exceeding the allowed number of DB instances.\n"]

type nonrec create_db_instance_result = { db_instance : db_instance option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec create_db_instance_message = {
  db_name : string_ option; [@ocaml.doc "Not supported.\n"]
  db_instance_identifier : string_;
      [@ocaml.doc
        "The DB instance identifier. This parameter is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [mydbinstance] \n\
        \   "]
  allocated_storage : integer_optional option; [@ocaml.doc "Not supported by Neptune.\n"]
  db_instance_class : string_;
      [@ocaml.doc
        "The compute and memory capacity of the DB instance, for example, [db.m4.large]. Not all \
         DB instance classes are available in all Amazon Regions.\n"]
  engine : string_;
      [@ocaml.doc
        "The name of the database engine to be used for this instance.\n\n\
        \ Valid Values: [neptune] \n\
        \ "]
  master_username : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  master_user_password : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  db_security_groups : db_security_group_name_list option;
      [@ocaml.doc
        "A list of DB security groups to associate with this DB instance.\n\n\
        \ Default: The default DB security group for the database engine.\n\
        \ "]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        "A list of EC2 VPC security groups to associate with this DB instance.\n\n\
        \ Not applicable. The associated list of EC2 VPC security groups is managed by the DB \
         cluster. For more information, see [CreateDBCluster].\n\
        \ \n\
        \  Default: The default EC2 VPC security group for the DB subnet group's VPC.\n\
        \  "]
  availability_zone : string_ option;
      [@ocaml.doc
        " The EC2 Availability Zone that the DB instance is created in\n\n\
        \ Default: A random, system-chosen Availability Zone in the endpoint's Amazon Region.\n\
        \ \n\
        \   Example: [us-east-1d] \n\
        \  \n\
        \    Constraint: The AvailabilityZone parameter can't be specified if the MultiAZ \
         parameter is set to [true]. The specified Availability Zone must be in the same Amazon \
         Region as the current endpoint.\n\
        \   "]
  db_subnet_group_name : string_ option;
      [@ocaml.doc
        "A DB subnet group to associate with this DB instance.\n\n\
        \ If there is no DB subnet group, then it is a non-VPC DB instance.\n\
        \ "]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The time range each week during which system maintenance can occur, in Universal \
         Coordinated Time (UTC).\n\n\
        \  Format: [ddd:hh24:mi-ddd:hh24:mi] \n\
        \ \n\
        \  The default is a 30-minute window selected at random from an 8-hour block of time for \
         each Amazon Region, occurring on a random day of the week.\n\
        \  \n\
        \   Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.\n\
        \   \n\
        \    Constraints: Minimum 30-minute window.\n\
        \    "]
  db_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the DB parameter group to associate with this DB instance. If this argument \
         is omitted, the default DBParameterGroup for the specified engine is used.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be 1 to 255 letters, numbers, or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  backup_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days for which automated backups are retained.\n\n\
        \ Not applicable. The retention period for automated backups is managed by the DB cluster. \
         For more information, see [CreateDBCluster].\n\
        \ \n\
        \  Default: 1\n\
        \  \n\
        \   Constraints:\n\
        \   \n\
        \    {ul\n\
        \          {-  Must be a value from 0 to 35\n\
        \              \n\
        \               }\n\
        \          {-  Cannot be set to 0 if the DB instance is a source to Read Replicas\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  preferred_backup_window : string_ option;
      [@ocaml.doc
        " The daily time range during which automated backups are created.\n\n\
        \ Not applicable. The daily time range for creating automated backups is managed by the DB \
         cluster. For more information, see [CreateDBCluster].\n\
        \ "]
  port : integer_optional option;
      [@ocaml.doc
        "The port number on which the database accepts connections.\n\n\
        \ Not applicable. The port is managed by the DB cluster. For more information, see \
         [CreateDBCluster].\n\
        \ \n\
        \   Default: [8182] \n\
        \  \n\
        \   Type: Integer\n\
        \   "]
  multi_a_z : boolean_optional option;
      [@ocaml.doc
        "Specifies if the DB instance is a Multi-AZ deployment. You can't set the AvailabilityZone \
         parameter if the MultiAZ parameter is set to true.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The version number of the database engine to use. Currently, setting this parameter has \
         no effect.\n"]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "Indicates that minor engine upgrades are applied automatically to the DB instance during \
         the maintenance window.\n\n\
        \ Default: [true] \n\
        \ "]
  license_model : string_ option;
      [@ocaml.doc
        "License model information for this DB instance.\n\n\
        \  Valid values: [license-included] | [bring-your-own-license] | [general-public-license] \n\
        \ "]
  iops : integer_optional option;
      [@ocaml.doc
        "The amount of Provisioned IOPS (input/output operations per second) to be initially \
         allocated for the DB instance.\n"]
  option_group_name : string_ option; [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  character_set_name : string_ option; [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  publicly_accessible : boolean_optional option;
      [@ocaml.doc
        "Indicates whether the DB instance is publicly accessible.\n\n\
        \ When the DB instance is publicly accessible and you connect from outside of the DB \
         instance's virtual private cloud (VPC), its Domain Name System (DNS) endpoint resolves to \
         the public IP address. When you connect from within the same VPC as the DB instance, the \
         endpoint resolves to the private IP address. Access to the DB instance is ultimately \
         controlled by the security group it uses. That public access isn't permitted if the \
         security group assigned to the DB cluster doesn't permit it.\n\
        \ \n\
        \  When the DB instance isn't publicly accessible, it is an internal DB instance with a \
         DNS name that resolves to a private IP address.\n\
        \  "]
  tags : tag_list option; [@ocaml.doc "The tags to assign to the new instance.\n"]
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The identifier of the DB cluster that the instance will belong to.\n\n\
        \ For information on creating a DB cluster, see [CreateDBCluster].\n\
        \ \n\
        \  Type: String\n\
        \  "]
  storage_type : string_ option;
      [@ocaml.doc
        "Not applicable. In Neptune the storage type is managed at the DB Cluster level.\n"]
  tde_credential_arn : string_ option;
      [@ocaml.doc
        "The ARN from the key store with which to associate the instance for TDE encryption.\n"]
  tde_credential_password : sensitive_string option;
      [@ocaml.doc
        "The password for the given ARN from the key store in order to access the device.\n"]
  storage_encrypted : boolean_optional option;
      [@ocaml.doc
        "Specifies whether the DB instance is encrypted.\n\n\
        \ Not applicable. The encryption for DB instances is managed by the DB cluster. For more \
         information, see [CreateDBCluster].\n\
        \ \n\
        \  Default: false\n\
        \  "]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Amazon KMS key identifier for an encrypted DB instance.\n\n\
        \ The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If \
         you are creating a DB instance with the same Amazon account that owns the KMS encryption \
         key used to encrypt the new DB instance, then you can use the KMS key alias instead of \
         the ARN for the KMS encryption key.\n\
        \ \n\
        \  Not applicable. The KMS key identifier is managed by the DB cluster. For more \
         information, see [CreateDBCluster].\n\
        \  \n\
        \   If the [StorageEncrypted] parameter is true, and you do not specify a value for the \
         [KmsKeyId] parameter, then Amazon Neptune will use your default encryption key. Amazon \
         KMS creates the default encryption key for your Amazon account. Your Amazon account has a \
         different default encryption key for each Amazon Region.\n\
        \   "]
  domain : string_ option;
      [@ocaml.doc "Specify the Active Directory Domain to create the instance in.\n"]
  copy_tags_to_snapshot : boolean_optional option;
      [@ocaml.doc
        "True to copy all tags from the DB instance to snapshots of the DB instance, and otherwise \
         false. The default is false.\n"]
  monitoring_interval : integer_optional option;
      [@ocaml.doc
        "The interval, in seconds, between points when Enhanced Monitoring metrics are collected \
         for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The \
         default is 0.\n\n\
        \ If [MonitoringRoleArn] is specified, then you must also set [MonitoringInterval] to a \
         value other than 0.\n\
        \ \n\
        \  Valid Values: [0, 1, 5, 10, 15, 30, 60] \n\
        \  "]
  monitoring_role_arn : string_ option;
      [@ocaml.doc
        "The ARN for the IAM role that permits Neptune to send enhanced monitoring metrics to \
         Amazon CloudWatch Logs. For example, [arn:aws:iam:123456789012:role/emaccess].\n\n\
        \ If [MonitoringInterval] is set to a value other than 0, then you must supply a \
         [MonitoringRoleArn] value.\n\
        \ "]
  domain_iam_role_name : string_ option;
      [@ocaml.doc
        "Specify the name of the IAM role to be used when making API calls to the Directory Service.\n"]
  promotion_tier : integer_optional option;
      [@ocaml.doc
        "A value that specifies the order in which an Read Replica is promoted to the primary \
         instance after a failure of the existing primary instance. \n\n\
        \ Default: 1\n\
        \ \n\
        \  Valid Values: 0 - 15\n\
        \  "]
  timezone : string_ option; [@ocaml.doc "The time zone of the DB instance.\n"]
  enable_iam_database_authentication : boolean_optional option;
      [@ocaml.doc "Not supported by Neptune (ignored).\n"]
  enable_performance_insights : boolean_optional option;
      [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  performance_insights_kms_key_id : string_ option;
      [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  enable_cloudwatch_logs_exports : log_type_list option;
      [@ocaml.doc
        "The list of log types that need to be enabled for exporting to CloudWatch Logs.\n"]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether the DB instance has deletion protection enabled. The \
         database can't be deleted when deletion protection is enabled. By default, deletion \
         protection is disabled. See \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/manage-console-instances-delete.html}Deleting \
         a DB Instance}.\n\n\
        \ DB instances in a DB cluster can be deleted even when deletion protection is enabled in \
         their parent DB cluster.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_db_cluster_snapshot_result = {
  db_cluster_snapshot : db_cluster_snapshot option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_db_cluster_snapshot_message = {
  db_cluster_snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier of the DB cluster snapshot. This parameter is stored as a lowercase \
         string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster1-snapshot1] \n\
        \   "]
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The identifier of the DB cluster to create a snapshot for. This parameter is not \
         case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing DBCluster.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster1] \n\
        \   "]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the DB cluster snapshot.\n"]
}
[@@ocaml.doc ""]

type nonrec create_db_cluster_parameter_group_result = {
  db_cluster_parameter_group : db_cluster_parameter_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_db_cluster_parameter_group_message = {
  db_cluster_parameter_group_name : string_;
      [@ocaml.doc
        "The name of the DB cluster parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the name of an existing DBClusterParameterGroup.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    This value is stored as a lowercase string.\n\
        \    \n\
        \     "]
  db_parameter_group_family : string_;
      [@ocaml.doc
        "The DB cluster parameter group family name. A DB cluster parameter group can be \
         associated with one and only one DB cluster parameter group family, and can be applied \
         only to a DB cluster running a database engine and engine version compatible with that DB \
         cluster parameter group family.\n"]
  description : string_; [@ocaml.doc "The description for the DB cluster parameter group.\n"]
  tags : tag_list option;
      [@ocaml.doc "The tags to be assigned to the new DB cluster parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec db_cluster_endpoint_quota_exceeded_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The cluster already has the maximum number of custom endpoints.\n"]

type nonrec db_cluster_endpoint_already_exists_fault = {
  message : exception_message option;
      [@ocaml.doc "A message describing the details of the problem.\n"]
}
[@@ocaml.doc "The specified custom endpoint cannot be created because it already exists.\n"]

type nonrec create_db_cluster_endpoint_output = {
  db_cluster_endpoint_identifier : string_ option;
      [@ocaml.doc
        "The identifier associated with the endpoint. This parameter is stored as a lowercase \
         string.\n"]
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The DB cluster identifier of the DB cluster associated with the endpoint. This parameter \
         is stored as a lowercase string.\n"]
  db_cluster_endpoint_resource_identifier : string_ option;
      [@ocaml.doc
        "A unique system-generated identifier for an endpoint. It remains the same for the whole \
         life of the endpoint.\n"]
  endpoint : string_ option; [@ocaml.doc "The DNS address of the endpoint.\n"]
  status : string_ option;
      [@ocaml.doc
        "The current status of the endpoint. One of: [creating], [available], [deleting], \
         [inactive], [modifying]. The [inactive] state applies to an endpoint that cannot be used \
         for a certain kind of cluster, such as a [writer] endpoint for a read-only secondary \
         cluster in a global database.\n"]
  endpoint_type : string_ option;
      [@ocaml.doc "The type of the endpoint. One of: [READER], [WRITER], [CUSTOM].\n"]
  custom_endpoint_type : string_ option;
      [@ocaml.doc
        "The type associated with a custom endpoint. One of: [READER], [WRITER], [ANY].\n"]
  static_members : string_list option;
      [@ocaml.doc "List of DB instance identifiers that are part of the custom endpoint group.\n"]
  excluded_members : string_list option;
      [@ocaml.doc
        "List of DB instance identifiers that aren't part of the custom endpoint group. All other \
         eligible instances are reachable through the custom endpoint. Only relevant if the list \
         of static members is empty.\n"]
  db_cluster_endpoint_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the endpoint.\n"]
}
[@@ocaml.doc
  "This data type represents the information you need to connect to an Amazon Neptune DB cluster. \
   This data type is used as a response element in the following actions:\n\n\
  \ {ul\n\
  \       {-   [CreateDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       {-   [DescribeDBClusterEndpoints] \n\
  \           \n\
  \            }\n\
  \       {-   [ModifyDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       {-   [DeleteDBClusterEndpoint] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For the data structure that represents Amazon Neptune DB instance endpoints, see [Endpoint].\n\
  \   "]

type nonrec create_db_cluster_endpoint_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The DB cluster identifier of the DB cluster associated with the endpoint. This parameter \
         is stored as a lowercase string.\n"]
  db_cluster_endpoint_identifier : string_;
      [@ocaml.doc
        "The identifier to use for the new endpoint. This parameter is stored as a lowercase string.\n"]
  endpoint_type : string_;
      [@ocaml.doc "The type of the endpoint. One of: [READER], [WRITER], [ANY].\n"]
  static_members : string_list option;
      [@ocaml.doc "List of DB instance identifiers that are part of the custom endpoint group.\n"]
  excluded_members : string_list option;
      [@ocaml.doc
        "List of DB instance identifiers that aren't part of the custom endpoint group. All other \
         eligible instances are reachable through the custom endpoint. Only relevant if the list \
         of static members is empty.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the Amazon Neptune resource.\n"]
}
[@@ocaml.doc ""]

type nonrec create_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec create_db_cluster_message = {
  availability_zones : availability_zones option;
      [@ocaml.doc
        "A list of EC2 Availability Zones that instances in the DB cluster can be created in.\n"]
  backup_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days for which automated backups are retained. You must specify a minimum \
         value of 1.\n\n\
        \ Default: 1\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be a value from 1 to 35\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  character_set_name : string_ option; [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  copy_tags_to_snapshot : boolean_optional option;
      [@ocaml.doc
        " {i If set to [true], tags are copied to any snapshot of the DB cluster that is created.} \n"]
  database_name : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The DB cluster identifier. This parameter is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster1] \n\
        \   "]
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc
        " The name of the DB cluster parameter group to associate with this DB cluster. If this \
         argument is omitted, the default is used.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If supplied, must match the name of an existing DBClusterParameterGroup.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of EC2 VPC security groups to associate with this DB cluster.\n"]
  db_subnet_group_name : string_ option;
      [@ocaml.doc
        "A DB subnet group to associate with this DB cluster.\n\n\
        \ Constraints: Must match the name of an existing DBSubnetGroup. Must not be default.\n\
        \ \n\
        \  Example: [mySubnetgroup] \n\
        \  "]
  engine : string_;
      [@ocaml.doc
        "The name of the database engine to be used for this DB cluster.\n\n\
        \ Valid Values: [neptune] \n\
        \ "]
  engine_version : string_ option;
      [@ocaml.doc
        "The version number of the database engine to use for the new DB cluster.\n\n\
        \ Example: [1.2.1.0] \n\
        \ "]
  port : integer_optional option;
      [@ocaml.doc
        "The port number on which the instances in the DB cluster accept connections.\n\n\
        \  Default: [8182] \n\
        \ "]
  master_username : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  master_user_password : string_ option; [@ocaml.doc "Not supported by Neptune.\n"]
  option_group_name : string_ option; [@ocaml.doc " {i (Not supported by Neptune)} \n"]
  preferred_backup_window : string_ option;
      [@ocaml.doc
        "The daily time range during which automated backups are created if automated backups are \
         enabled using the [BackupRetentionPeriod] parameter.\n\n\
        \ The default is a 30-minute window selected at random from an 8-hour block of time for \
         each Amazon Region. To see the time blocks available, see \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/manage-console-maintaining.html#manage-console-maintaining-window}Neptune \
         Maintenance Window} in the {i Amazon Neptune User Guide.} \n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be in the format [hh24:mi-hh24:mi].\n\
        \             \n\
        \              }\n\
        \         {-  Must be in Universal Coordinated Time (UTC).\n\
        \             \n\
        \              }\n\
        \         {-  Must not conflict with the preferred maintenance window.\n\
        \             \n\
        \              }\n\
        \         {-  Must be at least 30 minutes.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The weekly time range during which system maintenance can occur, in Universal Coordinated \
         Time (UTC).\n\n\
        \ Format: [ddd:hh24:mi-ddd:hh24:mi] \n\
        \ \n\
        \  The default is a 30-minute window selected at random from an 8-hour block of time for \
         each Amazon Region, occurring on a random day of the week. To see the time blocks \
         available, see \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/manage-console-maintaining.html#manage-console-maintaining-window}Neptune \
         Maintenance Window} in the {i Amazon Neptune User Guide.} \n\
        \  \n\
        \   Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.\n\
        \   \n\
        \    Constraints: Minimum 30-minute window.\n\
        \    "]
  replication_source_identifier : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source DB instance or DB cluster if this DB cluster \
         is created as a Read Replica.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to assign to the new DB cluster.\n"]
  storage_encrypted : boolean_optional option;
      [@ocaml.doc "Specifies whether the DB cluster is encrypted.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Amazon KMS key identifier for an encrypted DB cluster.\n\n\
        \ The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If \
         you are creating a DB cluster with the same Amazon account that owns the KMS encryption \
         key used to encrypt the new DB cluster, then you can use the KMS key alias instead of the \
         ARN for the KMS encryption key.\n\
        \ \n\
        \  If an encryption key is not specified in [KmsKeyId]:\n\
        \  \n\
        \   {ul\n\
        \         {-  If [ReplicationSourceIdentifier] identifies an encrypted source, then Amazon \
         Neptune will use the encryption key used to encrypt the source. Otherwise, Amazon Neptune \
         will use your default encryption key.\n\
        \             \n\
        \              }\n\
        \         {-  If the [StorageEncrypted] parameter is true and \
         [ReplicationSourceIdentifier] is not specified, then Amazon Neptune will use your default \
         encryption key.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   Amazon KMS creates the default encryption key for your Amazon account. Your Amazon \
         account has a different default encryption key for each Amazon Region.\n\
        \   \n\
        \    If you create a Read Replica of an encrypted DB cluster in another Amazon Region, you \
         must set [KmsKeyId] to a KMS key ID that is valid in the destination Amazon Region. This \
         key is used to encrypt the Read Replica in that Amazon Region.\n\
        \    "]
  pre_signed_url : string_ option; [@ocaml.doc "This parameter is not currently supported.\n"]
  enable_iam_database_authentication : boolean_optional option;
      [@ocaml.doc
        "If set to [true], enables Amazon Identity and Access Management (IAM) authentication for \
         the entire DB cluster (this cannot be set at an instance level).\n\n\
        \ Default: [false].\n\
        \ "]
  enable_cloudwatch_logs_exports : log_type_list option;
      [@ocaml.doc
        "A list of the log types that this DB cluster should export to CloudWatch Logs. Valid log \
         types are: [audit] (to publish audit logs) and [slowquery] (to publish slow-query logs). \
         See \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/cloudwatch-logs.html}Publishing \
         Neptune logs to Amazon CloudWatch logs}.\n"]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether the DB cluster has deletion protection enabled. The \
         database can't be deleted when deletion protection is enabled. By default, deletion \
         protection is enabled.\n"]
  serverless_v2_scaling_configuration : serverless_v2_scaling_configuration option;
      [@ocaml.doc
        "Contains the scaling configuration of a Neptune Serverless DB cluster.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/neptune-serverless-using.html}Using \
         Amazon Neptune Serverless} in the {i Amazon Neptune User Guide}.\n\
        \ "]
  global_cluster_identifier : global_cluster_identifier option;
      [@ocaml.doc
        "The ID of the Neptune global database to which this new DB cluster should be added.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "The storage type for the new DB cluster.\n\n\
        \ Valid Values:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [standard] } \194\160 \226\128\147 \194\160 ( {i the default} ) \
         Configures cost-effective database storage for applications with moderate to small I/O \
         usage. When set to [standard], the storage type is not returned in the response.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [iopt1] } \194\160 \226\128\147 \194\160 Enables \
         {{:https://docs.aws.amazon.com/neptune/latest/userguide/storage-types.html#provisioned-iops-storage}I/O-Optimized \
         storage} that's designed to meet the needs of I/O-intensive graph workloads that require \
         predictable pricing with low I/O latency and consistent I/O throughput.\n\
        \            \n\
        \             Neptune I/O-Optimized storage is only available starting with engine release \
         1.3.0.0.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  network_type : string_ option;
      [@ocaml.doc
        "The network type of the DB cluster.\n\n\
        \ Valid Values:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [IPV4] } \194\160 \226\128\147 \194\160 ( {i the default} ) The DB \
         cluster uses only IPv4 addresses for communication.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [DUAL] } \194\160 \226\128\147 \194\160 The DB cluster uses both IPv4 \
         and IPv6 addresses for communication. The DB subnet group associated with the cluster \
         must support IPv6.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec copy_db_parameter_group_result = {
  db_parameter_group : db_parameter_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec copy_db_parameter_group_message = {
  source_db_parameter_group_identifier : string_;
      [@ocaml.doc
        "The identifier or ARN for the source DB parameter group. For information about creating \
         an ARN, see \
         {{:https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing} \
         Constructing an Amazon Resource Name (ARN)}.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must specify a valid DB parameter group.\n\
        \            \n\
        \             }\n\
        \        {-  Must specify a valid DB parameter group identifier, for example \
         [my-db-param-group], or a valid ARN.\n\
        \            \n\
        \             }\n\
        \        {-  The source DB parameter group must be in the same Amazon Region as the copy. \
         Neptune does not support cross-Region copying of parameter groups.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  target_db_parameter_group_identifier : string_;
      [@ocaml.doc
        "The identifier for the copied DB parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Cannot be null, empty, or blank.\n\
        \            \n\
        \             }\n\
        \        {-  Must contain from 1 to 255 letters, numbers, or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-db-parameter-group] \n\
        \   "]
  target_db_parameter_group_description : string_;
      [@ocaml.doc "A description for the copied DB parameter group.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the copied DB parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec copy_db_cluster_snapshot_result = {
  db_cluster_snapshot : db_cluster_snapshot option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec copy_db_cluster_snapshot_message = {
  source_db_cluster_snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier of the DB cluster snapshot to copy. This parameter is not case-sensitive. \
         If the source DB cluster snapshot is in a different region or owned by another account, \
         specify the snapshot ARN.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must specify a valid system snapshot in the \"available\" state.\n\
        \            \n\
        \             }\n\
        \        {-  Specify a valid DB snapshot identifier.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster-snapshot1] \n\
        \   "]
  target_db_cluster_snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier of the new DB cluster snapshot to create from the source DB cluster \
         snapshot. This parameter is not case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster-snapshot2] \n\
        \   "]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Amazon KMS key ID for an encrypted DB cluster snapshot. The KMS key ID is the Amazon \
         Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption \
         key.\n\n\
        \ If you copy an encrypted DB cluster snapshot from your Amazon account, you can specify a \
         value for [KmsKeyId] to encrypt the copy with a new KMS encryption key. If you don't \
         specify a value for [KmsKeyId], then the copy of the DB cluster snapshot is encrypted \
         with the same KMS key as the source DB cluster snapshot.\n\
        \ \n\
        \  If you copy an encrypted DB cluster snapshot that is shared from another Amazon \
         account, then you must specify a value for [KmsKeyId].\n\
        \  \n\
        \    KMS encryption keys are specific to the Amazon Region that they are created in, and \
         you can't use encryption keys from one Amazon Region in another Amazon Region.\n\
        \   \n\
        \    You cannot encrypt an unencrypted DB cluster snapshot when you copy it. If you try to \
         copy an unencrypted DB cluster snapshot and specify a value for the KmsKeyId parameter, \
         an error is returned.\n\
        \    "]
  pre_signed_url : string_ option; [@ocaml.doc "Not currently supported.\n"]
  copy_tags : boolean_optional option;
      [@ocaml.doc
        "True to copy all tags from the source DB cluster snapshot to the target DB cluster \
         snapshot, and otherwise false. The default is false.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to assign to the new DB cluster snapshot copy.\n"]
}
[@@ocaml.doc ""]

type nonrec copy_db_cluster_parameter_group_result = {
  db_cluster_parameter_group : db_cluster_parameter_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec copy_db_cluster_parameter_group_message = {
  source_db_cluster_parameter_group_identifier : string_;
      [@ocaml.doc
        "The identifier or Amazon Resource Name (ARN) for the source DB cluster parameter group. \
         For information about creating an ARN, see \
         {{:https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing} \
         Constructing an Amazon Resource Name (ARN)}.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must specify a valid DB cluster parameter group.\n\
        \            \n\
        \             }\n\
        \        {-  Must specify a valid DB cluster parameter group identifier, for example \
         [my-db-cluster-param-group], or a valid ARN.\n\
        \            \n\
        \             }\n\
        \        {-  The source DB cluster parameter group must be in the same Amazon Region as \
         the copy. Neptune does not support cross-Region copying of parameter groups.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  target_db_cluster_parameter_group_identifier : string_;
      [@ocaml.doc
        "The identifier for the copied DB cluster parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Cannot be null, empty, or blank\n\
        \            \n\
        \             }\n\
        \        {-  Must contain from 1 to 255 letters, numbers, or hyphens\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster-param-group1] \n\
        \   "]
  target_db_cluster_parameter_group_description : string_;
      [@ocaml.doc "A description for the copied DB cluster parameter group.\n"]
  tags : tag_list option;
      [@ocaml.doc "The tags to be assigned to the copied DB cluster parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec apply_pending_maintenance_action_result = {
  resource_pending_maintenance_actions : resource_pending_maintenance_actions option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec apply_pending_maintenance_action_message = {
  resource_identifier : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that the pending maintenance action \
         applies to. For information about creating an ARN, see \
         {{:https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing} \
         Constructing an Amazon Resource Name (ARN)}.\n"]
  apply_action : string_;
      [@ocaml.doc
        "The pending maintenance action to apply to this resource.\n\n\
        \ Valid values: [system-update], [db-upgrade] \n\
        \ "]
  opt_in_type : string_;
      [@ocaml.doc
        "A value that specifies the type of opt-in request, or undoes an opt-in request. An opt-in \
         request of type [immediate] can't be undone.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [immediate] - Apply the maintenance action immediately.\n\
        \            \n\
        \             }\n\
        \        {-   [next-maintenance] - Apply the maintenance action during the next \
         maintenance window for the resource.\n\
        \            \n\
        \             }\n\
        \        {-   [undo-opt-in] - Cancel any existing [next-maintenance] opt-in requests.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]
