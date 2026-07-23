type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec subscription_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The subscription name does not exist. \n"]

type nonrec source_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested source could not be found. \n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec event_categories_list = string_ list [@@ocaml.doc ""]

type nonrec source_ids_list = string_ list [@@ocaml.doc ""]

type nonrec event_subscription = {
  customer_aws_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services customer account that is associated with the Amazon DocumentDB \
         event notification subscription.\n"]
  cust_subscription_id : string_ option;
      [@ocaml.doc "The Amazon DocumentDB event notification subscription ID.\n"]
  sns_topic_arn : string_ option;
      [@ocaml.doc "The topic ARN of the Amazon DocumentDB event notification subscription.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the Amazon DocumentDB event notification subscription.\n\n\
        \ Constraints:\n\
        \ \n\
        \  Can be one of the following: [creating], [modifying], [deleting], [active], \
         [no-permission], [topic-not-exist] \n\
        \  \n\
        \   The [no-permission] status indicates that Amazon DocumentDB no longer has permission \
         to post to the SNS topic. The [topic-not-exist] status indicates that the topic was \
         deleted after the subscription was created.\n\
        \   "]
  subscription_creation_time : string_ option;
      [@ocaml.doc
        "The time at which the Amazon DocumentDB event notification subscription was created.\n"]
  source_type : string_ option;
      [@ocaml.doc "The source type for the Amazon DocumentDB event notification subscription.\n"]
  source_ids_list : source_ids_list option;
      [@ocaml.doc
        "A list of source IDs for the Amazon DocumentDB event notification subscription.\n"]
  event_categories_list : event_categories_list option;
      [@ocaml.doc
        "A list of event categories for the Amazon DocumentDB event notification subscription.\n"]
  enabled : boolean_ option;
      [@ocaml.doc
        "A Boolean value indicating whether the subscription is enabled. A value of [true] \
         indicates that the subscription is enabled.\n"]
  event_subscription_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the event subscription.\n"]
}
[@@ocaml.doc "Detailed information about an event to which you have subscribed.\n"]

type nonrec add_source_identifier_to_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec add_source_identifier_to_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc
        "The name of the Amazon DocumentDB event notification subscription that you want to add a \
         source identifier to.\n"]
  source_identifier : string_;
      [@ocaml.doc
        "The identifier of the event source to be added:\n\n\
        \ {ul\n\
        \       {-  If the source type is an instance, a [DBInstanceIdentifier] must be provided.\n\
        \           \n\
        \            }\n\
        \       {-  If the source type is a security group, a [DBSecurityGroupName] must be \
         provided.\n\
        \           \n\
        \            }\n\
        \       {-  If the source type is a parameter group, a [DBParameterGroupName] must be \
         provided.\n\
        \           \n\
        \            }\n\
        \       {-  If the source type is a snapshot, a [DBSnapshotIdentifier] must be provided.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Represents the input to [AddSourceIdentifierToSubscription]. \n"]

type nonrec db_snapshot_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc " [DBSnapshotIdentifier] doesn't refer to an existing snapshot. \n"]

type nonrec db_instance_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc " [DBInstanceIdentifier] doesn't refer to an existing instance. \n"]

type nonrec db_cluster_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc " [DBClusterIdentifier] doesn't refer to an existing cluster. \n"]

type nonrec tag = {
  key : string_ option;
      [@ocaml.doc
        "The required name of the tag. The string value can be from 1 to 128 Unicode characters in \
         length and can't be prefixed with \"[aws:]\" or \"[rds:]\". The string can contain only \
         the set of Unicode letters, digits, white space, '_', '.', '/', '=', '+', '-' (Java \
         regex: \"^(\\[\\\\p\\{L\\}\\\\p\\{Z\\}\\\\p\\{N\\}_.:/=+\\\\-\\]*)$\").\n"]
  value : string_ option;
      [@ocaml.doc
        "The optional value of the tag. The string value can be from 1 to 256 Unicode characters \
         in length and can't be prefixed with \"[aws:]\" or \"[rds:]\". The string can contain \
         only the set of Unicode letters, digits, white space, '_', '.', '/', '=', '+', '-' (Java \
         regex: \"^(\\[\\\\p\\{L\\}\\\\p\\{Z\\}\\\\p\\{N\\}_.:/=+\\\\-\\]*)$\").\n"]
}
[@@ocaml.doc "Metadata assigned to an Amazon DocumentDB resource consisting of a key-value pair.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec add_tags_to_resource_message = {
  resource_name : string_;
      [@ocaml.doc
        "The Amazon DocumentDB resource that the tags are added to. This value is an Amazon \
         Resource Name .\n"]
  tags : tag_list; [@ocaml.doc "The tags to be assigned to the Amazon DocumentDB resource.\n"]
}
[@@ocaml.doc "Represents the input to [AddTagsToResource]. \n"]

type nonrec invalid_global_cluster_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The requested operation can't be performed while the cluster is in this state.\n"]

type nonrec invalid_db_cluster_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The cluster isn't in a valid state.\n"]

type nonrec global_cluster_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The [GlobalClusterIdentifier] doesn't refer to an existing global cluster.\n"]

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
        \       {-   {b pending} \226\128\147 The service received a request to switch over or \
         fail over the global cluster. The global cluster's primary cluster and the specified \
         secondary cluster are being verified before the operation starts.\n\
        \           \n\
        \            }\n\
        \       {-   {b failing-over} \226\128\147 The chosen secondary cluster is being promoted \
         to become the new primary cluster to fail over the global cluster.\n\
        \           \n\
        \            }\n\
        \       {-   {b cancelling} \226\128\147 The request to switch over or fail over the \
         global cluster was cancelled and the primary cluster and the selected secondary cluster \
         are returning to their previous states.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  from_db_cluster_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon DocumentDB cluster that is currently being \
         demoted, and which is associated with this state.\n"]
  to_db_cluster_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon DocumentDB cluster that is currently being \
         promoted, and which is associated with this state.\n"]
  is_data_loss_allowed : boolean_ option;
      [@ocaml.doc
        "Indicates whether the operation is a global switchover or a global failover. If data loss \
         is allowed, then the operation is a global failover. Otherwise, it's a switchover.\n"]
}
[@@ocaml.doc
  "Contains the state of scheduled or in-process operations on an Amazon DocumentDB global \
   cluster. This data type is empty unless a switchover or failover operation is scheduled or is \
   in progress on the global cluster.\n"]

type nonrec global_cluster_member_synchronization_status =
  | CONNECTED [@ocaml.doc ""]
  | PENDING_RESYNC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec readers_arn_list = string_ list [@@ocaml.doc ""]

type nonrec global_cluster_member = {
  db_cluster_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for each Amazon DocumentDB cluster.\n"]
  readers : readers_arn_list option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for each read-only secondary cluster associated with the \
         Amazon DocumentDB global cluster.\n"]
  is_writer : boolean_ option;
      [@ocaml.doc
        " Specifies whether the Amazon DocumentDB cluster is the primary cluster (that is, has \
         read-write capability) for the Amazon DocumentDB global cluster with which it is \
         associated. \n"]
  synchronization_status : global_cluster_member_synchronization_status option;
      [@ocaml.doc
        "The status of synchronization of each Amazon DocumentDB cluster in the global cluster.\n"]
}
[@@ocaml.doc
  "A data structure with information about any primary and secondary clusters associated with an \
   Amazon DocumentDB global clusters. \n"]

type nonrec global_cluster_member_list = global_cluster_member list [@@ocaml.doc ""]

type nonrec boolean_optional = bool [@@ocaml.doc ""]

type nonrec global_cluster_identifier = string [@@ocaml.doc ""]

type nonrec global_cluster = {
  global_cluster_identifier : global_cluster_identifier option;
      [@ocaml.doc
        "Contains a user-supplied global cluster identifier. This identifier is the unique key \
         that identifies a global cluster. \n"]
  global_cluster_resource_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services RegionRegion-unique, immutable identifier for the global database \
         cluster. This identifier is found in CloudTrail log entries whenever the KMS customer \
         master key (CMK) for the cluster is accessed. \n"]
  global_cluster_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the global cluster.\n"]
  status : string_ option; [@ocaml.doc "Specifies the current state of this global cluster.\n"]
  engine : string_ option;
      [@ocaml.doc "The Amazon DocumentDB database engine used by the global cluster. \n"]
  engine_version : string_ option; [@ocaml.doc "Indicates the database engine version.\n"]
  database_name : string_ option;
      [@ocaml.doc "The default database name within the new global cluster.\n"]
  storage_encrypted : boolean_optional option;
      [@ocaml.doc "The storage encryption setting for the global cluster.\n"]
  deletion_protection : boolean_optional option;
      [@ocaml.doc "The deletion protection setting for the new global cluster.\n"]
  global_cluster_members : global_cluster_member_list option;
      [@ocaml.doc
        "The list of cluster IDs for secondary clusters within the global cluster. Currently \
         limited to one item. \n"]
  failover_state : failover_state option;
      [@ocaml.doc
        "A data object containing all properties for the current state of an in-process or pending \
         switchover or failover process for this global cluster. This object is empty unless the \
         [SwitchoverGlobalCluster] or [FailoverGlobalCluster] operation was called on this global \
         cluster.\n"]
  tag_list : tag_list option; [@ocaml.doc "A list of global cluster tags.\n"]
}
[@@ocaml.doc "A data type representing an Amazon DocumentDB global cluster.\n"]

type nonrec switchover_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec db_cluster_identifier = string [@@ocaml.doc ""]

type nonrec switchover_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc
        "The identifier of the Amazon DocumentDB global database cluster to switch over. The \
         identifier is the unique key assigned by the user when the cluster is created. In other \
         words, it's the name of the global cluster. This parameter isn\226\128\153t \
         case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing global cluster (Amazon DocumentDB \
         global database).\n\
        \            \n\
        \             }\n\
        \        {-  Minimum length of 1. Maximum length of 255.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Pattern: [\\[A-Za-z\\]\\[0-9A-Za-z-:._\\]*] \n\
        \   "]
  target_db_cluster_identifier : db_cluster_identifier;
      [@ocaml.doc
        "The identifier of the secondary Amazon DocumentDB cluster to promote to the new primary \
         for the global database cluster. Use the Amazon Resource Name (ARN) for the identifier so \
         that Amazon DocumentDB can locate the cluster in its Amazon Web Services region.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing secondary cluster.\n\
        \            \n\
        \             }\n\
        \        {-  Minimum length of 1. Maximum length of 255.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Pattern: [\\[A-Za-z\\]\\[0-9A-Za-z-:._\\]*] \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec invalid_db_instance_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc " The specified instance isn't in the {i available} state. \n"]

type nonrec cluster_master_user_secret = {
  secret_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the secret.\n"]
  secret_status : string_ option;
      [@ocaml.doc
        "The status of the secret.\n\n\
        \ The possible status values include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  creating - The secret is being created.\n\
        \            \n\
        \             }\n\
        \        {-  active - The secret is available for normal use and rotation.\n\
        \            \n\
        \             }\n\
        \        {-  rotating - The secret is being rotated.\n\
        \            \n\
        \             }\n\
        \        {-  impaired - The secret can be used to access database credentials, but it \
         can't be rotated. A secret might have this status if, for example, permissions are \
         changed so that Amazon DocumentDB can no longer access either the secret or the KMS key \
         for the secret.\n\
        \            \n\
        \             When a secret has this status, you can correct the condition that caused the \
         status. Alternatively, modify the instance to turn off automatic management of database \
         credentials, and then modify the instance again to turn on automatic management of \
         database credentials.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services KMS key identifier that is used to encrypt the secret.\n"]
}
[@@ocaml.doc
  "Contains the secret managed by Amazon DocumentDB in Amazon Web Services Secrets Manager for the \
   master user password.\n"]

type nonrec double_optional = float [@@ocaml.doc ""]

type nonrec serverless_v2_scaling_configuration_info = {
  min_capacity : double_optional option;
      [@ocaml.doc
        "The minimum number of Amazon DocumentDB capacity units (DCUs) for an instance in an \
         Amazon DocumentDB Serverless cluster. You can specify DCU values in half-step increments, \
         such as 8, 8.5, 9, and so on.\n"]
  max_capacity : double_optional option;
      [@ocaml.doc
        "The maximum number of Amazon DocumentDB capacity units (DCUs) for an instance in an \
         Amazon DocumentDB Serverless cluster. You can specify DCU values in half-step increments, \
         such as 32, 32.5, 33, and so on. \n"]
}
[@@ocaml.doc "Retrieves the scaling configuration for an Amazon DocumentDB Serverless cluster.\n"]

type nonrec t_stamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec log_type_list = string_ list [@@ocaml.doc ""]

type nonrec db_cluster_role = {
  role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAMrole that is associated with the DB cluster.\n"]
  status : string_ option;
      [@ocaml.doc
        "Describes the state of association between the IAMrole and the cluster. The [Status] \
         property returns one of the following values:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] - The IAMrole ARN is associated with the cluster and can be used to \
         access other Amazon Web Services services on your behalf.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING] - The IAMrole ARN is being associated with the cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [INVALID] - The IAMrole ARN is associated with the cluster, but the cluster \
         cannot assume the IAMrole to access other Amazon Web Services services on your behalf.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Describes an Identity and Access Management (IAM) role that is associated with a cluster.\n"]

type nonrec db_cluster_roles = db_cluster_role list [@@ocaml.doc ""]

type nonrec vpc_security_group_membership = {
  vpc_security_group_id : string_ option; [@ocaml.doc "The name of the VPC security group.\n"]
  status : string_ option; [@ocaml.doc "The status of the VPC security group.\n"]
}
[@@ocaml.doc
  "Used as a response element for queries on virtual private cloud (VPC) security group membership.\n"]

type nonrec vpc_security_group_membership_list = vpc_security_group_membership list [@@ocaml.doc ""]

type nonrec integer_optional = int [@@ocaml.doc ""]

type nonrec db_cluster_member = {
  db_instance_identifier : string_ option;
      [@ocaml.doc "Specifies the instance identifier for this member of the cluster.\n"]
  is_cluster_writer : boolean_ option;
      [@ocaml.doc
        "A value that is [true] if the cluster member is the primary instance for the cluster and \
         [false] otherwise.\n"]
  db_cluster_parameter_group_status : string_ option;
      [@ocaml.doc
        "Specifies the status of the cluster parameter group for this member of the DB cluster.\n"]
  promotion_tier : integer_optional option;
      [@ocaml.doc
        "A value that specifies the order in which an Amazon DocumentDB replica is promoted to the \
         primary instance after a failure of the existing primary instance. \n"]
}
[@@ocaml.doc "Contains information about an instance that is part of a cluster.\n"]

type nonrec db_cluster_member_list = db_cluster_member list [@@ocaml.doc ""]

type nonrec read_replica_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec availability_zones = string_ list [@@ocaml.doc ""]

type nonrec db_cluster = {
  availability_zones : availability_zones option;
      [@ocaml.doc
        "Provides the list of Amazon EC2 Availability Zones that instances in the cluster can be \
         created in.\n"]
  backup_retention_period : integer_optional option;
      [@ocaml.doc "Specifies the number of days for which automatic snapshots are retained.\n"]
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "Contains a user-supplied cluster identifier. This identifier is the unique key that \
         identifies a cluster.\n"]
  db_cluster_parameter_group : string_ option;
      [@ocaml.doc "Specifies the name of the cluster parameter group for the cluster.\n"]
  db_subnet_group : string_ option;
      [@ocaml.doc
        "Specifies information on the subnet group that is associated with the cluster, including \
         the name, description, and subnets in the subnet group.\n"]
  status : string_ option; [@ocaml.doc "Specifies the current state of this cluster.\n"]
  percent_progress : string_ option;
      [@ocaml.doc "Specifies the progress of the operation as a percentage.\n"]
  earliest_restorable_time : t_stamp option;
      [@ocaml.doc
        "The earliest time to which a database can be restored with point-in-time restore.\n"]
  endpoint : string_ option;
      [@ocaml.doc "Specifies the connection endpoint for the primary instance of the cluster.\n"]
  reader_endpoint : string_ option;
      [@ocaml.doc
        "The reader endpoint for the cluster. The reader endpoint for a cluster load balances \
         connections across the Amazon DocumentDB replicas that are available in a cluster. As \
         clients request new connections to the reader endpoint, Amazon DocumentDB distributes the \
         connection requests among the Amazon DocumentDB replicas in the cluster. This \
         functionality can help balance your read workload across multiple Amazon DocumentDB \
         replicas in your cluster. \n\n\
        \ If a failover occurs, and the Amazon DocumentDB replica that you are connected to is \
         promoted to be the primary instance, your connection is dropped. To continue sending your \
         read workload to other Amazon DocumentDB replicas in the cluster, you can then reconnect \
         to the reader endpoint.\n\
        \ "]
  multi_a_z : boolean_ option;
      [@ocaml.doc "Specifies whether the cluster has instances in multiple Availability Zones.\n"]
  engine : string_ option;
      [@ocaml.doc "Provides the name of the database engine to be used for this cluster.\n"]
  engine_version : string_ option; [@ocaml.doc "Indicates the database engine version.\n"]
  latest_restorable_time : t_stamp option;
      [@ocaml.doc
        "Specifies the latest time to which a database can be restored with point-in-time restore.\n"]
  port : integer_optional option;
      [@ocaml.doc "Specifies the port that the database engine is listening on.\n"]
  master_username : string_ option; [@ocaml.doc "Contains the master user name for the cluster.\n"]
  preferred_backup_window : string_ option;
      [@ocaml.doc
        "Specifies the daily time range during which automated backups are created if automated \
         backups are enabled, as determined by the [BackupRetentionPeriod]. \n"]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "Specifies the weekly time range during which system maintenance can occur, in Universal \
         Coordinated Time (UTC).\n"]
  replication_source_identifier : string_ option;
      [@ocaml.doc
        "Contains the identifier of the source cluster if this cluster is a secondary cluster.\n"]
  read_replica_identifiers : read_replica_identifier_list option;
      [@ocaml.doc
        "Contains one or more identifiers of the secondary clusters that are associated with this \
         cluster.\n"]
  db_cluster_members : db_cluster_member_list option;
      [@ocaml.doc "Provides the list of instances that make up the cluster.\n"]
  vpc_security_groups : vpc_security_group_membership_list option;
      [@ocaml.doc
        "Provides a list of virtual private cloud (VPC) security groups that the cluster belongs to.\n"]
  hosted_zone_id : string_ option;
      [@ocaml.doc "Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.\n"]
  storage_encrypted : boolean_ option; [@ocaml.doc "Specifies whether the cluster is encrypted.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "If [StorageEncrypted] is [true], the KMS key identifier for the encrypted cluster.\n"]
  db_cluster_resource_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services Region-unique, immutable identifier for the cluster. This \
         identifier is found in CloudTrail log entries whenever the KMS key for the cluster is \
         accessed.\n"]
  db_cluster_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) for the cluster.\n"]
  associated_roles : db_cluster_roles option;
      [@ocaml.doc
        "Provides a list of the Identity and Access Management (IAM) roles that are associated \
         with the cluster. (IAM) roles that are associated with a cluster grant permission for the \
         cluster to access other Amazon Web Services services on your behalf.\n"]
  clone_group_id : string_ option;
      [@ocaml.doc "Identifies the clone group to which the DB cluster is associated.\n"]
  cluster_create_time : t_stamp option;
      [@ocaml.doc
        "Specifies the time when the cluster was created, in Universal Coordinated Time (UTC).\n"]
  enabled_cloudwatch_logs_exports : log_type_list option;
      [@ocaml.doc
        "A list of log types that this cluster is configured to export to Amazon CloudWatch Logs.\n"]
  deletion_protection : boolean_ option;
      [@ocaml.doc
        "Specifies whether this cluster can be deleted. If [DeletionProtection] is enabled, the \
         cluster cannot be deleted unless it is modified and [DeletionProtection] is disabled. \
         [DeletionProtection] protects clusters from being accidentally deleted.\n"]
  io_optimized_next_allowed_modification_time : t_stamp option;
      [@ocaml.doc
        "The next time you can modify the Amazon DocumentDB cluster to use the iopt1 storage type.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "Storage type associated with your cluster\n\n\
        \ For information on storage types for Amazon DocumentDB clusters, see Cluster storage \
         configurations in the {i Amazon DocumentDB Developer Guide}.\n\
        \ \n\
        \  Valid values for storage type - [standard | iopt1] \n\
        \  \n\
        \   Default value is [standard ] \n\
        \   "]
  serverless_v2_scaling_configuration : serverless_v2_scaling_configuration_info option;
      [@ocaml.doc "The scaling configuration of an Amazon DocumentDB Serverless cluster.\n"]
  master_user_secret : cluster_master_user_secret option;
      [@ocaml.doc
        "The secret managed by Amazon DocumentDB in Amazon Web Services Secrets Manager for the \
         master user password.\n"]
  network_type : string_ option;
      [@ocaml.doc
        "The network type of the cluster.\n\n\
        \ The network type is determined by the [DBSubnetGroup] specified for the cluster. A \
         [DBSubnetGroup] can support only the IPv4 protocol or the IPv4 and the IPv6 protocols \
         ([DUAL]).\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/vpc-clusters.html}DocumentDB \
         clusters in a VPC} in the Amazon DocumentDB Developer Guide.\n\
        \  \n\
        \   Valid Values: [IPV4] | [DUAL] \n\
        \   "]
}
[@@ocaml.doc "Detailed information about a cluster. \n"]

type nonrec stop_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec stop_db_cluster_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc "The identifier of the cluster to stop. Example: [docdb-2019-05-28-15-24-52] \n"]
}
[@@ocaml.doc ""]

type nonrec start_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec start_db_cluster_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The identifier of the cluster to restart. Example: [docdb-2019-05-28-15-24-52] \n"]
}
[@@ocaml.doc ""]

type nonrec storage_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request would cause you to exceed the allowed amount of storage available across all \
   instances.\n"]

type nonrec network_type_not_supported = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The network type is not supported by either [DBSubnetGroup] or the DB engine version.\n"]

type nonrec kms_key_not_accessible_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "An error occurred when accessing an KMS key.\n"]

type nonrec invalid_vpc_network_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The subnet group doesn't cover all Availability Zones after it is created because of changes \
   that were made.\n"]

type nonrec invalid_subnet = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The requested subnet is not valid, or multiple subnets were requested that are not all in a \
   common virtual private cloud (VPC).\n"]

type nonrec invalid_restore_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "You cannot restore from a virtual private cloud (VPC) backup to a non-VPC DB instance.\n"]

type nonrec invalid_db_snapshot_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The state of the snapshot doesn't allow deletion.\n"]

type nonrec invalid_db_cluster_snapshot_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The provided value isn't a valid cluster snapshot state.\n"]

type nonrec insufficient_storage_cluster_capacity_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "There is not enough storage available for the current action. You might be able to resolve this \
   error by updating your subnet group to use different Availability Zones that have more storage \
   available. \n"]

type nonrec insufficient_db_cluster_capacity_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The cluster doesn't have enough capacity for the current operation.\n"]

type nonrec db_subnet_group_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc " [DBSubnetGroupName] doesn't refer to an existing subnet group. \n"]

type nonrec db_cluster_snapshot_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc " [DBClusterSnapshotIdentifier] doesn't refer to an existing cluster snapshot. \n"]

type nonrec db_cluster_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The cluster can't be created because you have reached the maximum allowed quota of clusters.\n"]

type nonrec db_cluster_already_exists_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "You already have a cluster with the given identifier.\n"]

type nonrec restore_db_cluster_to_point_in_time_result = {
  db_cluster : db_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec serverless_v2_scaling_configuration = {
  min_capacity : double_optional option;
      [@ocaml.doc
        "The minimum number of Amazon DocumentDB capacity units (DCUs) for an instance in an \
         Amazon DocumentDB Serverless cluster. You can specify DCU values in half-step increments, \
         such as 8, 8.5, 9, and so on.\n"]
  max_capacity : double_optional option;
      [@ocaml.doc
        "The maximum number of Amazon DocumentDB capacity units (DCUs) for an instance in an \
         Amazon DocumentDB Serverless cluster. You can specify DCU values in half-step increments, \
         such as 32, 32.5, 33, and so on.\n"]
}
[@@ocaml.doc "Sets the scaling configuration of an Amazon DocumentDB Serverless cluster.\n"]

type nonrec vpc_security_group_id_list = string_ list [@@ocaml.doc ""]

type nonrec restore_db_cluster_to_point_in_time_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The name of the new cluster to be created.\n\n\
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
        \   Constraints: You can't specify [copy-on-write] if the engine version of the source DB \
         cluster is earlier than 1.11.\n\
        \   \n\
        \    If you don't specify a [RestoreType] value, then the new DB cluster is restored as a \
         full copy of the source DB cluster.\n\
        \    "]
  source_db_cluster_identifier : string_;
      [@ocaml.doc
        "The identifier of the source cluster from which to restore.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing [DBCluster].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  restore_to_time : t_stamp option;
      [@ocaml.doc
        "The date and time to restore the cluster to.\n\n\
        \ Valid values: A time in Universal Coordinated Time (UTC) format.\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be before the latest restorable time for the instance.\n\
        \             \n\
        \              }\n\
        \         {-  Must be specified if the [UseLatestRestorableTime] parameter is not provided.\n\
        \             \n\
        \              }\n\
        \         {-  Cannot be specified if the [UseLatestRestorableTime] parameter is [true].\n\
        \             \n\
        \              }\n\
        \         {-  Cannot be specified if the [RestoreType] parameter is [copy-on-write].\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   Example: [2015-03-07T23:45:00Z] \n\
        \   "]
  use_latest_restorable_time : boolean_ option;
      [@ocaml.doc
        "A value that is set to [true] to restore the cluster to the latest restorable backup \
         time, and [false] otherwise. \n\n\
        \ Default: [false] \n\
        \ \n\
        \  Constraints: Cannot be specified if the [RestoreToTime] parameter is provided.\n\
        \  "]
  port : integer_optional option;
      [@ocaml.doc
        "The port number on which the new cluster accepts connections.\n\n\
        \ Constraints: Must be a value from [1150] to [65535]. \n\
        \ \n\
        \  Default: The default port for the engine.\n\
        \  "]
  db_subnet_group_name : string_ option;
      [@ocaml.doc
        "The subnet group name to use for the new cluster.\n\n\
        \ Constraints: If provided, must match the name of an existing [DBSubnetGroup].\n\
        \ \n\
        \  Example: [mySubnetgroup] \n\
        \  "]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of VPC security groups that the new cluster belongs to.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the restored cluster.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The KMS key identifier to use when restoring an encrypted cluster from an encrypted \
         cluster.\n\n\
        \ The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If \
         you are restoring a cluster with the same Amazon Web Services account that owns the KMS \
         encryption key used to encrypt the new cluster, then you can use the KMS key alias \
         instead of the ARN for the KMS encryption key.\n\
        \ \n\
        \  You can restore to a new cluster and encrypt the new cluster with an KMS key that is \
         different from the KMS key used to encrypt the source cluster. The new DB cluster is \
         encrypted with the KMS key identified by the [KmsKeyId] parameter.\n\
        \  \n\
        \   If you do not specify a value for the [KmsKeyId] parameter, then the following occurs:\n\
        \   \n\
        \    {ul\n\
        \          {-  If the cluster is encrypted, then the restored cluster is encrypted using \
         the KMS key that was used to encrypt the source cluster.\n\
        \              \n\
        \               }\n\
        \          {-  If the cluster is not encrypted, then the restored cluster is not encrypted.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   If [DBClusterIdentifier] refers to a cluster that is not encrypted, then the restore \
         request is rejected.\n\
        \   "]
  enable_cloudwatch_logs_exports : log_type_list option;
      [@ocaml.doc
        "A list of log types that must be enabled for exporting to Amazon CloudWatch Logs.\n"]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "Specifies whether this cluster can be deleted. If [DeletionProtection] is enabled, the \
         cluster cannot be deleted unless it is modified and [DeletionProtection] is disabled. \
         [DeletionProtection] protects clusters from being accidentally deleted.\n"]
  serverless_v2_scaling_configuration : serverless_v2_scaling_configuration option;
      [@ocaml.doc
        "Contains the scaling configuration of an Amazon DocumentDB Serverless cluster.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "The storage type to associate with the DB cluster.\n\n\
        \ For information on storage types for Amazon DocumentDB clusters, see Cluster storage \
         configurations in the {i Amazon DocumentDB Developer Guide}.\n\
        \ \n\
        \  Valid values for storage type - [standard | iopt1] \n\
        \  \n\
        \   Default value is [standard ] \n\
        \   "]
  network_type : string_ option;
      [@ocaml.doc
        "The network type of the cluster.\n\n\
        \ The network type is determined by the [DBSubnetGroup] specified for the cluster. A \
         [DBSubnetGroup] can support only the IPv4 protocol or the IPv4 and the IPv6 protocols \
         ([DUAL]).\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/vpc-clusters.html}DocumentDB \
         clusters in a VPC} in the Amazon DocumentDB Developer Guide.\n\
        \  \n\
        \   Valid Values: [IPV4] | [DUAL] \n\
        \   "]
}
[@@ocaml.doc "Represents the input to [RestoreDBClusterToPointInTime].\n"]

type nonrec restore_db_cluster_from_snapshot_result = {
  db_cluster : db_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec restore_db_cluster_from_snapshot_message = {
  availability_zones : availability_zones option;
      [@ocaml.doc
        "Provides the list of Amazon EC2 Availability Zones that instances in the restored DB \
         cluster can be created in.\n"]
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The name of the cluster to create from the snapshot or cluster snapshot. This parameter \
         isn't case sensitive.\n\n\
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
        \   Example: [my-snapshot-id] \n\
        \   "]
  snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier for the snapshot or cluster snapshot to restore from.\n\n\
        \ You can use either the name or the Amazon Resource Name (ARN) to specify a cluster \
         snapshot. However, you can use only the ARN to specify a snapshot.\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must match the identifier of an existing snapshot.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  engine : string_;
      [@ocaml.doc
        "The database engine to use for the new cluster.\n\n\
        \ Default: The same as source.\n\
        \ \n\
        \  Constraint: Must be compatible with the engine of the source.\n\
        \  "]
  engine_version : string_ option;
      [@ocaml.doc "The version of the database engine to use for the new cluster.\n"]
  port : integer_optional option;
      [@ocaml.doc
        "The port number on which the new cluster accepts connections.\n\n\
        \ Constraints: Must be a value from [1150] to [65535].\n\
        \ \n\
        \  Default: The same port as the original cluster.\n\
        \  "]
  db_subnet_group_name : string_ option;
      [@ocaml.doc
        "The name of the subnet group to use for the new cluster.\n\n\
        \ Constraints: If provided, must match the name of an existing [DBSubnetGroup].\n\
        \ \n\
        \  Example: [mySubnetgroup] \n\
        \  "]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        "A list of virtual private cloud (VPC) security groups that the new cluster will belong to.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the restored cluster.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The KMS key identifier to use when restoring an encrypted cluster from a DB snapshot or \
         cluster snapshot.\n\n\
        \ The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If \
         you are restoring a cluster with the same Amazon Web Services account that owns the KMS \
         encryption key used to encrypt the new cluster, then you can use the KMS key alias \
         instead of the ARN for the KMS encryption key.\n\
        \ \n\
        \  If you do not specify a value for the [KmsKeyId] parameter, then the following occurs:\n\
        \  \n\
        \   {ul\n\
        \         {-  If the snapshot or cluster snapshot in [SnapshotIdentifier] is encrypted, \
         then the restored cluster is encrypted using the KMS key that was used to encrypt the \
         snapshot or the cluster snapshot.\n\
        \             \n\
        \              }\n\
        \         {-  If the snapshot or the cluster snapshot in [SnapshotIdentifier] is not \
         encrypted, then the restored DB cluster is not encrypted.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  enable_cloudwatch_logs_exports : log_type_list option;
      [@ocaml.doc
        "A list of log types that must be enabled for exporting to Amazon CloudWatch Logs.\n"]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "Specifies whether this cluster can be deleted. If [DeletionProtection] is enabled, the \
         cluster cannot be deleted unless it is modified and [DeletionProtection] is disabled. \
         [DeletionProtection] protects clusters from being accidentally deleted.\n"]
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the DB cluster parameter group to associate with this DB cluster.\n\n\
        \  {i Type:} String. \194\160 \194\160 \194\160 {i Required:} No.\n\
        \ \n\
        \  If this argument is omitted, the default DB cluster parameter group is used. If \
         supplied, must match the name of an existing default DB cluster parameter group. The \
         string must consist of from 1 to 255 letters, numbers or hyphens. Its first character \
         must be a letter, and it cannot end with a hyphen or contain two consecutive hyphens.\n\
        \  "]
  serverless_v2_scaling_configuration : serverless_v2_scaling_configuration option;
      [@ocaml.doc
        "Contains the scaling configuration of an Amazon DocumentDB Serverless cluster.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "The storage type to associate with the DB cluster.\n\n\
        \ For information on storage types for Amazon DocumentDB clusters, see Cluster storage \
         configurations in the {i Amazon DocumentDB Developer Guide}.\n\
        \ \n\
        \  Valid values for storage type - [standard | iopt1] \n\
        \  \n\
        \   Default value is [standard ] \n\
        \   "]
  network_type : string_ option;
      [@ocaml.doc
        "The network type of the cluster.\n\n\
        \ The network type is determined by the [DBSubnetGroup] specified for the cluster. A \
         [DBSubnetGroup] can support only the IPv4 protocol or the IPv4 and the IPv6 protocols \
         ([DUAL]).\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/vpc-clusters.html}DocumentDB \
         clusters in a VPC} in the Amazon DocumentDB Developer Guide.\n\
        \  \n\
        \   Valid Values: [IPV4] | [DUAL] \n\
        \   "]
}
[@@ocaml.doc "Represents the input to [RestoreDBClusterFromSnapshot].\n"]

type nonrec invalid_db_parameter_group_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The parameter group is in use, or it is in a state that is not valid. If you are trying to \
   delete the parameter group, you can't delete it when the parameter group is in this state.\n"]

type nonrec db_parameter_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc " [DBParameterGroupName] doesn't refer to an existing parameter group. \n"]

type nonrec db_cluster_parameter_group_name_message = {
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of a cluster parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be from 1 to 255 letters or numbers.\n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    This value is stored as a lowercase string.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc "Contains the name of a cluster parameter group.\n"]

type nonrec apply_method = Immediate [@ocaml.doc ""] | Pending_reboot [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec parameter = {
  parameter_name : string_ option; [@ocaml.doc "Specifies the name of the parameter.\n"]
  parameter_value : string_ option;
      [@ocaml.doc
        "Specifies the value of the parameter. Must be one or more of the cluster parameter's \
         [AllowedValues] in CSV format:\n\n\
        \ Valid values are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [enabled]: The cluster accepts secure connections using TLS version 1.0 \
         through 1.3. \n\
        \            \n\
        \             }\n\
        \        {-   [disabled]: The cluster does not accept secure connections using TLS. \n\
        \            \n\
        \             }\n\
        \        {-   [fips-140-3]: The cluster only accepts secure connections per the \
         requirements of the Federal Information Processing Standards (FIPS) publication 140-3. \
         Only supported starting with Amazon DocumentDB 5.0 (engine version 3.0.3727) clusters in \
         these regions: ca-central-1, us-west-2, us-east-1, us-east-2, us-gov-east-1, \
         us-gov-west-1.\n\
        \            \n\
        \             }\n\
        \        {-   [tls1.2+]: The cluster accepts secure connections using TLS version 1.2 and \
         above. Only supported starting with Amazon DocumentDB 4.0 (engine version 2.0.10980) and \
         Amazon DocumentDB 5.0 (engine version 3.0.11051).\n\
        \            \n\
        \             }\n\
        \        {-   [tls1.3+]: The cluster accepts secure connections using TLS version 1.3 and \
         above. Only supported starting with Amazon DocumentDB 4.0 (engine version 2.0.10980) and \
         Amazon DocumentDB 5.0 (engine version 3.0.11051).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  description : string_ option; [@ocaml.doc "Provides a description of the parameter.\n"]
  source : string_ option; [@ocaml.doc "Indicates the source of the parameter value.\n"]
  apply_type : string_ option; [@ocaml.doc "Specifies the engine-specific parameters type.\n"]
  data_type : string_ option; [@ocaml.doc "Specifies the valid data type for the parameter.\n"]
  allowed_values : string_ option;
      [@ocaml.doc "Specifies the valid range of values for the parameter.\n"]
  is_modifiable : boolean_ option;
      [@ocaml.doc
        " Indicates whether ([true]) or not ([false]) the parameter can be modified. Some \
         parameters have security or operational implications that prevent them from being \
         changed. \n"]
  minimum_engine_version : string_ option;
      [@ocaml.doc "The earliest engine version to which the parameter can apply.\n"]
  apply_method : apply_method option; [@ocaml.doc "Indicates when to apply parameter updates.\n"]
}
[@@ocaml.doc "Detailed information about an individual parameter.\n"]

type nonrec parameters_list = parameter list [@@ocaml.doc ""]

type nonrec reset_db_cluster_parameter_group_message = {
  db_cluster_parameter_group_name : string_;
      [@ocaml.doc "The name of the cluster parameter group to reset.\n"]
  reset_all_parameters : boolean_ option;
      [@ocaml.doc
        "A value that is set to [true] to reset all parameters in the cluster parameter group to \
         their default values, and [false] otherwise. You can't use this parameter if there is a \
         list of parameter names specified for the [Parameters] parameter.\n"]
  parameters : parameters_list option;
      [@ocaml.doc
        "A list of parameter names in the cluster parameter group to reset to the default values. \
         You can't use this parameter if the [ResetAllParameters] parameter is set to [true].\n"]
}
[@@ocaml.doc "Represents the input to [ResetDBClusterParameterGroup].\n"]

type nonrec key_list = string_ list [@@ocaml.doc ""]

type nonrec remove_tags_from_resource_message = {
  resource_name : string_;
      [@ocaml.doc
        "The Amazon DocumentDB resource that the tags are removed from. This value is an Amazon \
         Resource Name (ARN).\n"]
  tag_keys : key_list; [@ocaml.doc "The tag key (name) of the tag to be removed.\n"]
}
[@@ocaml.doc "Represents the input to [RemoveTagsFromResource].\n"]

type nonrec remove_source_identifier_from_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec remove_source_identifier_from_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc
        "The name of the Amazon DocumentDB event notification subscription that you want to remove \
         a source identifier from.\n"]
  source_identifier : string_;
      [@ocaml.doc
        " The source identifier to be removed from the subscription, such as the instance \
         identifier for an instance, or the name of a security group. \n"]
}
[@@ocaml.doc "Represents the input to [RemoveSourceIdentifierFromSubscription].\n"]

type nonrec remove_from_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec remove_from_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc "The cluster identifier to detach from the Amazon DocumentDB global cluster. \n"]
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) identifying the cluster that was detached from the Amazon \
         DocumentDB global cluster. \n"]
}
[@@ocaml.doc "Represents the input to [RemoveFromGlobalCluster].\n"]

type nonrec certificate_details = {
  ca_identifier : string_ option;
      [@ocaml.doc
        "The CA identifier of the CA certificate used for the DB instance's server certificate.\n"]
  valid_till : t_stamp option;
      [@ocaml.doc "The expiration date of the DB instance\226\128\153s server certificate.\n"]
}
[@@ocaml.doc
  "Returns the details of the DB instance\226\128\153s server certificate.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/ca_cert_rotation.html}Updating \
   Your Amazon DocumentDB TLS Certificates} and \
   {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/security.encryption.ssl.html} \
   Encrypting Data in Transit} in the {i Amazon DocumentDB Developer Guide}.\n\
  \ "]

type nonrec db_instance_status_info = {
  status_type : string_ option; [@ocaml.doc "This value is currently \"[read replication].\"\n"]
  normal : boolean_ option;
      [@ocaml.doc
        "A Boolean value that is [true] if the instance is operating normally, or [false] if the \
         instance is in an error state.\n"]
  status : string_ option;
      [@ocaml.doc
        "Status of the instance. For a [StatusType] of read replica, the values can be \
         [replicating], error, [stopped], or [terminated].\n"]
  message : string_ option;
      [@ocaml.doc
        "Details of the error if there is an error for the instance. If the instance is not in an \
         error state, this value is blank.\n"]
}
[@@ocaml.doc "Provides a list of status information for an instance.\n"]

type nonrec db_instance_status_info_list = db_instance_status_info list [@@ocaml.doc ""]

type nonrec pending_cloudwatch_logs_exports = {
  log_types_to_enable : log_type_list option;
      [@ocaml.doc
        "Log types that are in the process of being deactivated. After they are deactivated, these \
         log types aren't exported to CloudWatch Logs.\n"]
  log_types_to_disable : log_type_list option;
      [@ocaml.doc
        "Log types that are in the process of being enabled. After they are enabled, these log \
         types are exported to Amazon CloudWatch Logs.\n"]
}
[@@ocaml.doc
  "A list of the log types whose configuration is still pending. These log types are in the \
   process of being activated or deactivated.\n"]

type nonrec pending_modified_values = {
  db_instance_class : string_ option;
      [@ocaml.doc
        " Contains the new [DBInstanceClass] for the instance that will be applied or is currently \
         being applied. \n"]
  allocated_storage : integer_optional option;
      [@ocaml.doc
        " Contains the new [AllocatedStorage] size for then instance that will be applied or is \
         currently being applied. \n"]
  master_user_password : string_ option;
      [@ocaml.doc
        "Contains the pending or currently in-progress change of the master credentials for the \
         instance.\n"]
  port : integer_optional option; [@ocaml.doc "Specifies the pending port for the instance.\n"]
  backup_retention_period : integer_optional option;
      [@ocaml.doc
        "Specifies the pending number of days for which automated backups are retained.\n"]
  multi_a_z : boolean_optional option;
      [@ocaml.doc "Indicates that the Single-AZ instance is to change to a Multi-AZ deployment.\n"]
  engine_version : string_ option; [@ocaml.doc "Indicates the database engine version.\n"]
  license_model : string_ option;
      [@ocaml.doc
        "The license model for the instance.\n\n\
        \ Valid values: [license-included], [bring-your-own-license], [general-public-license] \n\
        \ "]
  iops : integer_optional option;
      [@ocaml.doc
        "Specifies the new Provisioned IOPS value for the instance that will be applied or is \
         currently being applied.\n"]
  db_instance_identifier : string_ option;
      [@ocaml.doc
        " Contains the new [DBInstanceIdentifier] for the instance that will be applied or is \
         currently being applied. \n"]
  storage_type : string_ option;
      [@ocaml.doc "Specifies the storage type to be associated with the instance.\n"]
  ca_certificate_identifier : string_ option;
      [@ocaml.doc
        "Specifies the identifier of the certificate authority (CA) certificate for the DB instance.\n"]
  db_subnet_group_name : string_ option; [@ocaml.doc "The new subnet group for the instance. \n"]
  pending_cloudwatch_logs_exports : pending_cloudwatch_logs_exports option;
      [@ocaml.doc
        "A list of the log types whose configuration is still pending. These log types are in the \
         process of being activated or deactivated.\n"]
}
[@@ocaml.doc
  " One or more modified settings for an instance. These modified settings have been requested, \
   but haven't been applied yet.\n"]

type nonrec network_type_list = string_ list [@@ocaml.doc ""]

type nonrec availability_zone = {
  name : string_ option; [@ocaml.doc "The name of the Availability Zone.\n"]
}
[@@ocaml.doc "Information about an Availability Zone.\n"]

type nonrec subnet = {
  subnet_identifier : string_ option; [@ocaml.doc "Specifies the identifier of the subnet.\n"]
  subnet_availability_zone : availability_zone option;
      [@ocaml.doc "Specifies the Availability Zone for the subnet.\n"]
  subnet_status : string_ option; [@ocaml.doc "Specifies the status of the subnet.\n"]
}
[@@ocaml.doc " Detailed information about a subnet. \n"]

type nonrec subnet_list = subnet list [@@ocaml.doc ""]

type nonrec db_subnet_group = {
  db_subnet_group_name : string_ option; [@ocaml.doc "The name of the subnet group.\n"]
  db_subnet_group_description : string_ option;
      [@ocaml.doc "Provides the description of the subnet group.\n"]
  vpc_id : string_ option;
      [@ocaml.doc "Provides the virtual private cloud (VPC) ID of the subnet group.\n"]
  subnet_group_status : string_ option; [@ocaml.doc "Provides the status of the subnet group.\n"]
  subnets : subnet_list option;
      [@ocaml.doc "Detailed information about one or more subnets within a subnet group.\n"]
  db_subnet_group_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the DB subnet group.\n"]
  supported_network_types : network_type_list option;
      [@ocaml.doc
        "The network type of the DB subnet group.\n\n\
        \ Valid Values: [IPV4] | [DUAL] \n\
        \ \n\
        \  A [DBSubnetGroup] can support only the IPv4 protocol or the IPv4 and the IPv6 protocols \
         (DUAL).\n\
        \  "]
}
[@@ocaml.doc "Detailed information about a subnet group. \n"]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec endpoint = {
  address : string_ option; [@ocaml.doc "Specifies the DNS address of the instance.\n"]
  port : integer option;
      [@ocaml.doc "Specifies the port that the database engine is listening on.\n"]
  hosted_zone_id : string_ option;
      [@ocaml.doc "Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.\n"]
}
[@@ocaml.doc
  "Network information for accessing a cluster or instance. Client programs must specify a valid \
   endpoint to access these Amazon DocumentDB resources.\n"]

type nonrec db_instance = {
  db_instance_identifier : string_ option;
      [@ocaml.doc
        "Contains a user-provided database identifier. This identifier is the unique key that \
         identifies an instance.\n"]
  db_instance_class : string_ option;
      [@ocaml.doc "Contains the name of the compute and memory capacity class of the instance.\n"]
  engine : string_ option;
      [@ocaml.doc "Provides the name of the database engine to be used for this instance.\n"]
  db_instance_status : string_ option;
      [@ocaml.doc "Specifies the current state of this database.\n"]
  endpoint : endpoint option; [@ocaml.doc "Specifies the connection endpoint.\n"]
  instance_create_time : t_stamp option;
      [@ocaml.doc "Provides the date and time that the instance was created.\n"]
  preferred_backup_window : string_ option;
      [@ocaml.doc
        " Specifies the daily time range during which automated backups are created if automated \
         backups are enabled, as determined by the [BackupRetentionPeriod]. \n"]
  backup_retention_period : integer option;
      [@ocaml.doc "Specifies the number of days for which automatic snapshots are retained.\n"]
  vpc_security_groups : vpc_security_group_membership_list option;
      [@ocaml.doc "Provides a list of VPC security group elements that the instance belongs to.\n"]
  availability_zone : string_ option;
      [@ocaml.doc "Specifies the name of the Availability Zone that the instance is located in.\n"]
  db_subnet_group : db_subnet_group option;
      [@ocaml.doc
        "Specifies information on the subnet group that is associated with the instance, including \
         the name, description, and subnets in the subnet group.\n"]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "Specifies the weekly time range during which system maintenance can occur, in Universal \
         Coordinated Time (UTC).\n"]
  pending_modified_values : pending_modified_values option;
      [@ocaml.doc
        "Specifies that changes to the instance are pending. This element is included only when \
         changes are pending. Specific changes are identified by subelements.\n"]
  latest_restorable_time : t_stamp option;
      [@ocaml.doc
        "Specifies the latest time to which a database can be restored with point-in-time restore.\n"]
  engine_version : string_ option; [@ocaml.doc "Indicates the database engine version.\n"]
  auto_minor_version_upgrade : boolean_ option;
      [@ocaml.doc
        "Does not apply. This parameter does not apply to Amazon DocumentDB. Amazon DocumentDB \
         does not perform minor version upgrades regardless of the value set.\n"]
  publicly_accessible : boolean_ option;
      [@ocaml.doc
        "Not supported. Amazon DocumentDB does not currently support public endpoints. The value \
         of [PubliclyAccessible] is always [false].\n"]
  status_infos : db_instance_status_info_list option;
      [@ocaml.doc
        "The status of a read replica. If the instance is not a read replica, this is blank.\n"]
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "Contains the name of the cluster that the instance is a member of if the instance is a \
         member of a cluster.\n"]
  storage_encrypted : boolean_ option;
      [@ocaml.doc "Specifies whether or not the instance is encrypted.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        " If [StorageEncrypted] is [true], the KMS key identifier for the encrypted instance. \n"]
  dbi_resource_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services Region-unique, immutable identifier for the instance. This \
         identifier is found in CloudTrail log entries whenever the KMS key for the instance is \
         accessed.\n"]
  ca_certificate_identifier : string_ option;
      [@ocaml.doc "The identifier of the CA certificate for this DB instance.\n"]
  copy_tags_to_snapshot : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether to copy tags from the DB instance to snapshots of the DB \
         instance. By default, tags are not copied.\n"]
  promotion_tier : integer_optional option;
      [@ocaml.doc
        "A value that specifies the order in which an Amazon DocumentDB replica is promoted to the \
         primary instance after a failure of the existing primary instance.\n"]
  db_instance_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the instance.\n"]
  enabled_cloudwatch_logs_exports : log_type_list option;
      [@ocaml.doc
        "A list of log types that this instance is configured to export to CloudWatch Logs.\n"]
  certificate_details : certificate_details option;
      [@ocaml.doc "The details of the DB instance's server certificate.\n"]
  performance_insights_enabled : boolean_optional option;
      [@ocaml.doc
        "Set to [true] if Amazon RDS Performance Insights is enabled for the DB instance, and \
         otherwise [false].\n"]
  performance_insights_kms_key_id : string_ option;
      [@ocaml.doc
        "The KMS key identifier for encryption of Performance Insights data. The KMS key ID is the \
         Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS \
         encryption key.\n"]
}
[@@ocaml.doc "Detailed information about an instance. \n"]

type nonrec reboot_db_instance_result = { db_instance : db_instance option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec reboot_db_instance_message = {
  db_instance_identifier : string_;
      [@ocaml.doc
        "The instance identifier. This parameter is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing [DBInstance].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  force_failover : boolean_optional option;
      [@ocaml.doc
        " When [true], the reboot is conducted through a Multi-AZ failover. \n\n\
        \ Constraint: You can't specify [true] if the instance is not configured for Multi-AZ.\n\
        \ "]
}
[@@ocaml.doc "Represents the input to [RebootDBInstance].\n"]

type nonrec modify_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec modify_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc
        "The identifier for the global cluster being modified. This parameter isn't \
         case-sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing global cluster.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  new_global_cluster_identifier : global_cluster_identifier option;
      [@ocaml.doc
        "The new identifier for a global cluster when you modify a global cluster. This value is \
         stored as a lowercase string.\n\n\
        \ {ul\n\
        \       {-  Must contain from 1 to 63 letters, numbers, or hyphens\n\
        \           \n\
        \            The first character must be a letter\n\
        \            \n\
        \             Can't end with a hyphen or contain two consecutive hyphens\n\
        \             \n\
        \              }\n\
        \       }\n\
        \   Example: [my-cluster2] \n\
        \   "]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "Indicates if the global cluster has deletion protection enabled. The global cluster can't \
         be deleted when deletion protection is enabled. \n"]
}
[@@ocaml.doc "Represents the input to [ModifyGlobalCluster].\n"]

type nonrec subscription_category_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The provided category does not exist. \n"]

type nonrec sns_topic_arn_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The SNS topic Amazon Resource Name (ARN) does not exist. \n"]

type nonrec sns_no_authorization_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "You do not have permission to publish to the SNS topic Amazon Resource Name (ARN). \n"]

type nonrec sns_invalid_topic_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "Amazon SNS has responded that there is a problem with the specified topic. \n"]

type nonrec event_subscription_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You have reached the maximum number of event subscriptions. \n"]

type nonrec modify_event_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec modify_event_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc "The name of the Amazon DocumentDB event notification subscription.\n"]
  sns_topic_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the SNS topic created for event notification. The ARN \
         is created by Amazon SNS when you create a topic and subscribe to it.\n"]
  source_type : string_ option;
      [@ocaml.doc
        "The type of source that is generating the events. For example, if you want to be notified \
         of events generated by an instance, set this parameter to [db-instance]. If this value is \
         not specified, all events are returned.\n\n\
        \ Valid values: [db-instance], [db-parameter-group], [db-security-group] \n\
        \ "]
  event_categories : event_categories_list option;
      [@ocaml.doc " A list of event categories for a [SourceType] that you want to subscribe to.\n"]
  enabled : boolean_optional option;
      [@ocaml.doc " A Boolean value; set to [true] to activate the subscription. \n"]
}
[@@ocaml.doc "Represents the input to [ModifyEventSubscription].\n"]

type nonrec subnet_already_in_use = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The subnet is already in use in the Availability Zone.\n"]

type nonrec db_subnet_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request would cause you to exceed the allowed number of subnets in a subnet group.\n"]

type nonrec db_subnet_group_does_not_cover_enough_a_zs = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Subnets in the subnet group should cover at least two Availability Zones unless there is only \
   one Availability Zone.\n"]

type nonrec modify_db_subnet_group_result = {
  db_subnet_group : db_subnet_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec subnet_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec modify_db_subnet_group_message = {
  db_subnet_group_name : string_;
      [@ocaml.doc
        "The name for the subnet group. This value is stored as a lowercase string. You can't \
         modify the default subnet group. \n\n\
        \ Constraints: Must match the name of an existing [DBSubnetGroup]. Must not be default.\n\
        \ \n\
        \  Example: [mySubnetgroup] \n\
        \  "]
  db_subnet_group_description : string_ option;
      [@ocaml.doc "The description for the subnet group.\n"]
  subnet_ids : subnet_identifier_list;
      [@ocaml.doc "The Amazon EC2 subnet IDs for the subnet group.\n"]
}
[@@ocaml.doc "Represents the input to [ModifyDBSubnetGroup].\n"]

type nonrec storage_type_not_supported_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Storage of the specified [StorageType] can't be associated with the DB instance. \n"]

type nonrec invalid_db_security_group_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The state of the security group doesn't allow deletion.\n"]

type nonrec insufficient_db_instance_capacity_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified instance class isn't available in the specified Availability Zone.\n"]

type nonrec db_upgrade_dependency_failure_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The upgrade failed because a resource that the depends on can't be modified.\n"]

type nonrec db_security_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc " [DBSecurityGroupName] doesn't refer to an existing security group. \n"]

type nonrec db_instance_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You already have a instance with the given identifier.\n"]

type nonrec certificate_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc " [CertificateIdentifier] doesn't refer to an existing certificate. \n"]

type nonrec authorization_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified CIDR IP or Amazon EC2 security group isn't authorized for the specified security \
   group.\n\n\
  \ Amazon DocumentDB also might not be authorized to perform necessary actions on your behalf \
   using IAM.\n\
  \ "]

type nonrec modify_db_instance_result = { db_instance : db_instance option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec modify_db_instance_message = {
  db_instance_identifier : string_;
      [@ocaml.doc
        "The instance identifier. This value is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing [DBInstance].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  db_instance_class : string_ option;
      [@ocaml.doc
        "The new compute and memory capacity of the instance; for example, [db.r5.large]. Not all \
         instance classes are available in all Amazon Web Services Regions. \n\n\
        \ If you modify the instance class, an outage occurs during the change. The change is \
         applied during the next maintenance window, unless [ApplyImmediately] is specified as \
         [true] for this request. \n\
        \ \n\
        \  Default: Uses existing setting.\n\
        \  "]
  apply_immediately : boolean_ option;
      [@ocaml.doc
        "Specifies whether the modifications in this request and any pending modifications are \
         asynchronously applied as soon as possible, regardless of the \
         [PreferredMaintenanceWindow] setting for the instance. \n\n\
        \  If this parameter is set to [false], changes to the instance are applied during the \
         next maintenance window. Some parameter changes can cause an outage and are applied on \
         the next reboot.\n\
        \ \n\
        \  Default: [false] \n\
        \  "]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The weekly time range (in UTC) during which system maintenance can occur, which might \
         result in an outage. Changing this parameter doesn't result in an outage except in the \
         following situation, and the change is asynchronously applied as soon as possible. If \
         there are pending actions that cause a reboot, and the maintenance window is changed to \
         include the current time, changing this parameter causes a reboot of the instance. If you \
         are moving this window to the current time, there must be at least 30 minutes between the \
         current time and end of the window to ensure that pending changes are applied.\n\n\
        \ Default: Uses existing setting.\n\
        \ \n\
        \  Format: [ddd:hh24:mi-ddd:hh24:mi] \n\
        \  \n\
        \   Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun\n\
        \   \n\
        \    Constraints: Must be at least 30 minutes.\n\
        \    "]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "This parameter does not apply to Amazon DocumentDB. Amazon DocumentDB does not perform \
         minor version upgrades regardless of the value set.\n"]
  new_db_instance_identifier : string_ option;
      [@ocaml.doc
        " The new instance identifier for the instance when renaming an instance. When you change \
         the instance identifier, an instance reboot occurs immediately if you set [Apply \
         Immediately] to [true]. It occurs during the next maintenance window if you set [Apply \
         Immediately] to [false]. This value is stored as a lowercase string. \n\n\
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
  ca_certificate_identifier : string_ option;
      [@ocaml.doc "Indicates the certificate that needs to be associated with the instance.\n"]
  copy_tags_to_snapshot : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether to copy all tags from the DB instance to snapshots of the \
         DB instance. By default, tags are not copied.\n"]
  promotion_tier : integer_optional option;
      [@ocaml.doc
        "A value that specifies the order in which an Amazon DocumentDB replica is promoted to the \
         primary instance after a failure of the existing primary instance.\n\n\
        \ Default: 1\n\
        \ \n\
        \  Valid values: 0-15\n\
        \  "]
  enable_performance_insights : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether to enable Performance Insights for the DB Instance. For \
         more information, see \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/performance-insights.html}Using \
         Amazon Performance Insights}.\n"]
  performance_insights_kms_key_id : string_ option;
      [@ocaml.doc
        "The KMS key identifier for encryption of Performance Insights data.\n\n\
        \ The KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key.\n\
        \ \n\
        \  If you do not specify a value for PerformanceInsightsKMSKeyId, then Amazon DocumentDB \
         uses your default KMS key. There is a default KMS key for your Amazon Web Services \
         account. Your Amazon Web Services account has a different default KMS key for each Amazon \
         Web Services region.\n\
        \  "]
  certificate_rotation_restart : boolean_optional option;
      [@ocaml.doc
        "Specifies whether the DB instance is restarted when you rotate your SSL/TLS certificate.\n\n\
        \ By default, the DB instance is restarted when you rotate your SSL/TLS certificate. The \
         certificate is not updated until the DB instance is restarted.\n\
        \ \n\
        \   Set this parameter only if you are {i not} using SSL/TLS to connect to the DB instance.\n\
        \   \n\
        \     If you are using SSL/TLS to connect to the DB instance, see \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/ca_cert_rotation.html}Updating \
         Your Amazon DocumentDB TLS Certificates} and \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/security.encryption.ssl.html} \
         Encrypting Data in Transit} in the {i Amazon DocumentDB Developer Guide}.\n\
        \     "]
}
[@@ocaml.doc "Represents the input to [ModifyDBInstance].\n"]

type nonrec shared_snapshot_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You have exceeded the maximum number of accounts that you can share a manual DB snapshot with. \n"]

type nonrec attribute_value_list = string_ list [@@ocaml.doc ""]

type nonrec db_cluster_snapshot_attribute = {
  attribute_name : string_ option;
      [@ocaml.doc
        "The name of the manual cluster snapshot attribute.\n\n\
        \ The attribute named [restore] refers to the list of Amazon Web Services accounts that \
         have permission to copy or restore the manual cluster snapshot.\n\
        \ "]
  attribute_values : attribute_value_list option;
      [@ocaml.doc
        "The values for the manual cluster snapshot attribute.\n\n\
        \ If the [AttributeName] field is set to [restore], then this element returns a list of \
         IDs of the Amazon Web Services accounts that are authorized to copy or restore the manual \
         cluster snapshot. If a value of [all] is in the list, then the manual cluster snapshot is \
         public and available for any Amazon Web Services account to copy or restore.\n\
        \ "]
}
[@@ocaml.doc
  "Contains the name and values of a manual cluster snapshot attribute.\n\n\
  \ Manual cluster snapshot attributes are used to authorize other Amazon Web Services accounts to \
   restore a manual cluster snapshot.\n\
  \ "]

type nonrec db_cluster_snapshot_attribute_list = db_cluster_snapshot_attribute list [@@ocaml.doc ""]

type nonrec db_cluster_snapshot_attributes_result = {
  db_cluster_snapshot_identifier : string_ option;
      [@ocaml.doc "The identifier of the cluster snapshot that the attributes apply to.\n"]
  db_cluster_snapshot_attributes : db_cluster_snapshot_attribute_list option;
      [@ocaml.doc "The list of attributes and values for the cluster snapshot.\n"]
}
[@@ocaml.doc
  "Detailed information about the attributes that are associated with a cluster snapshot.\n"]

type nonrec modify_db_cluster_snapshot_attribute_result = {
  db_cluster_snapshot_attributes_result : db_cluster_snapshot_attributes_result option;
      [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec modify_db_cluster_snapshot_attribute_message = {
  db_cluster_snapshot_identifier : string_;
      [@ocaml.doc "The identifier for the cluster snapshot to modify the attributes for.\n"]
  attribute_name : string_;
      [@ocaml.doc
        "The name of the cluster snapshot attribute to modify.\n\n\
        \ To manage authorization for other Amazon Web Services accounts to copy or restore a \
         manual cluster snapshot, set this value to [restore].\n\
        \ "]
  values_to_add : attribute_value_list option;
      [@ocaml.doc
        "A list of cluster snapshot attributes to add to the attribute specified by \
         [AttributeName].\n\n\
        \ To authorize other Amazon Web Services accounts to copy or restore a manual cluster \
         snapshot, set this list to include one or more Amazon Web Services account IDs. To make \
         the manual cluster snapshot restorable by any Amazon Web Services account, set it to \
         [all]. Do not add the [all] value for any manual cluster snapshots that contain private \
         information that you don't want to be available to all Amazon Web Services accounts.\n\
        \ "]
  values_to_remove : attribute_value_list option;
      [@ocaml.doc
        "A list of cluster snapshot attributes to remove from the attribute specified by \
         [AttributeName].\n\n\
        \ To remove authorization for other Amazon Web Services accounts to copy or restore a \
         manual cluster snapshot, set this list to include one or more Amazon Web Services account \
         identifiers. To remove authorization for any Amazon Web Services account to copy or \
         restore the cluster snapshot, set it to [all] . If you specify [all], an Amazon Web \
         Services account whose account ID is explicitly added to the [restore] attribute can \
         still copy or restore a manual cluster snapshot.\n\
        \ "]
}
[@@ocaml.doc "Represents the input to [ModifyDBClusterSnapshotAttribute].\n"]

type nonrec modify_db_cluster_parameter_group_message = {
  db_cluster_parameter_group_name : string_;
      [@ocaml.doc "The name of the cluster parameter group to modify.\n"]
  parameters : parameters_list;
      [@ocaml.doc "A list of parameters in the cluster parameter group to modify.\n"]
}
[@@ocaml.doc "Represents the input to [ModifyDBClusterParameterGroup].\n"]

type nonrec invalid_db_subnet_group_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The subnet group can't be deleted because it's in use.\n"]

type nonrec db_cluster_parameter_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " [DBClusterParameterGroupName] doesn't refer to an existing cluster parameter group. \n"]

type nonrec modify_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec cloudwatch_logs_export_configuration = {
  enable_log_types : log_type_list option; [@ocaml.doc "The list of log types to enable.\n"]
  disable_log_types : log_type_list option; [@ocaml.doc "The list of log types to disable.\n"]
}
[@@ocaml.doc
  "The configuration setting for the log types to be enabled for export to Amazon CloudWatch Logs \
   for a specific instance or cluster.\n\n\
  \ The [EnableLogTypes] and [DisableLogTypes] arrays determine which logs are exported (or not \
   exported) to CloudWatch Logs. The values within these arrays depend on the engine that is being \
   used.\n\
  \ "]

type nonrec modify_db_cluster_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The cluster identifier for the cluster that is being modified. This parameter is not case \
         sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing [DBCluster].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  new_db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The new cluster identifier for the cluster when renaming a cluster. This value is stored \
         as a lowercase string.\n\n\
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
        \   Example: [my-cluster2] \n\
        \   "]
  apply_immediately : boolean_ option;
      [@ocaml.doc
        "A value that specifies whether the changes in this request and any pending changes are \
         asynchronously applied as soon as possible, regardless of the \
         [PreferredMaintenanceWindow] setting for the cluster. If this parameter is set to \
         [false], changes to the cluster are applied during the next maintenance window.\n\n\
        \ The [ApplyImmediately] parameter affects only the [NewDBClusterIdentifier] and \
         [MasterUserPassword] values. If you set this parameter value to [false], the changes to \
         the [NewDBClusterIdentifier] and [MasterUserPassword] values are applied during the next \
         maintenance window. All other changes are applied immediately, regardless of the value of \
         the [ApplyImmediately] parameter.\n\
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
        \         {-  Must be a value from 1 to 35.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc "The name of the cluster parameter group to use for the cluster.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        "A list of virtual private cloud (VPC) security groups that the cluster will belong to.\n"]
  port : integer_optional option;
      [@ocaml.doc
        "The port number on which the cluster accepts connections.\n\n\
        \ Constraints: Must be a value from [1150] to [65535]. \n\
        \ \n\
        \  Default: The same port as the original cluster.\n\
        \  "]
  master_user_password : string_ option;
      [@ocaml.doc
        "The password for the master database user. This password can contain any printable ASCII \
         character except forward slash (/), double quote (\"), or the \"at\" symbol (\\@).\n\n\
        \ Constraints: Must contain from 8 to 100 characters.\n\
        \ "]
  preferred_backup_window : string_ option;
      [@ocaml.doc
        "The daily time range during which automated backups are created if automated backups are \
         enabled, using the [BackupRetentionPeriod] parameter. \n\n\
        \ The default is a 30-minute window selected at random from an 8-hour block of time for \
         each Amazon Web Services Region. \n\
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
         each Amazon Web Services Region, occurring on a random day of the week. \n\
        \  \n\
        \   Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun\n\
        \   \n\
        \    Constraints: Minimum 30-minute window.\n\
        \    "]
  cloudwatch_logs_export_configuration : cloudwatch_logs_export_configuration option;
      [@ocaml.doc
        "The configuration setting for the log types to be enabled for export to Amazon CloudWatch \
         Logs for a specific instance or cluster. The [EnableLogTypes] and [DisableLogTypes] \
         arrays determine which logs are exported (or not exported) to CloudWatch Logs.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The version number of the database engine to which you want to upgrade. Changing this \
         parameter results in an outage. The change is applied during the next maintenance window \
         unless [ApplyImmediately] is enabled.\n\n\
        \ To list all of the available engine versions for Amazon DocumentDB use the following \
         command:\n\
        \ \n\
        \   [aws docdb describe-db-engine-versions --engine docdb --query \
         \"DBEngineVersions\\[\\].EngineVersion\"] \n\
        \  "]
  allow_major_version_upgrade : boolean_ option;
      [@ocaml.doc
        "A value that indicates whether major version upgrades are allowed.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  You must allow major version upgrades when specifying a value for the \
         [EngineVersion] parameter that is a different major version than the cluster's current \
         version.\n\
        \            \n\
        \             }\n\
        \        {-  Since some parameters are version specific, changing them requires executing \
         a new [ModifyDBCluster] API call after the in-place MVU completes.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    Performing an MVU directly impacts the following parameters:\n\
        \    \n\
        \     {ul\n\
        \           {-   [MasterUserPassword] \n\
        \               \n\
        \                }\n\
        \           {-   [NewDBClusterIdentifier] \n\
        \               \n\
        \                }\n\
        \           {-   [VpcSecurityGroupIds] \n\
        \               \n\
        \                }\n\
        \           {-   [Port] \n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "Specifies whether this cluster can be deleted. If [DeletionProtection] is enabled, the \
         cluster cannot be deleted unless it is modified and [DeletionProtection] is disabled. \
         [DeletionProtection] protects clusters from being accidentally deleted.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "The storage type to associate with the DB cluster.\n\n\
        \ For information on storage types for Amazon DocumentDB clusters, see Cluster storage \
         configurations in the {i Amazon DocumentDB Developer Guide}.\n\
        \ \n\
        \  Valid values for storage type - [standard | iopt1] \n\
        \  \n\
        \   Default value is [standard ] \n\
        \   "]
  serverless_v2_scaling_configuration : serverless_v2_scaling_configuration option;
      [@ocaml.doc
        "Contains the scaling configuration of an Amazon DocumentDB Serverless cluster.\n"]
  manage_master_user_password : boolean_optional option;
      [@ocaml.doc
        "Specifies whether to manage the master user password with Amazon Web Services Secrets \
         Manager. If the cluster doesn't manage the master user password with Amazon Web Services \
         Secrets Manager, you can turn on this management. In this case, you can't specify \
         [MasterUserPassword]. If the cluster already manages the master user password with Amazon \
         Web Services Secrets Manager, and you specify that the master user password is not \
         managed with Amazon Web Services Secrets Manager, then you must specify \
         [MasterUserPassword]. In this case, Amazon DocumentDB deletes the secret and uses the new \
         password for the master user specified by [MasterUserPassword].\n"]
  master_user_secret_kms_key_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services KMS key identifier to encrypt a secret that is automatically \
         generated and managed in Amazon Web Services Secrets Manager.\n\n\
        \ This setting is valid only if both of the following conditions are met:\n\
        \ \n\
        \  {ul\n\
        \        {-  The cluster doesn't manage the master user password in Amazon Web Services \
         Secrets Manager. If the cluster already manages the master user password in Amazon Web \
         Services Secrets Manager, you can't change the KMS key that is used to encrypt the secret.\n\
        \            \n\
        \             }\n\
        \        {-  You are enabling [ManageMasterUserPassword] to manage the master user \
         password in Amazon Web Services Secrets Manager. If you are turning on \
         [ManageMasterUserPassword] and don't specify [MasterUserSecretKmsKeyId], then the \
         [aws/secretsmanager] KMS key is used to encrypt the secret. If the secret is in a \
         different Amazon Web Services account, then you can't use the [aws/secretsmanager] KMS \
         key to encrypt the secret, and you must use a customer managed KMS key.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The Amazon Web Services KMS key identifier is the key ARN, key ID, alias ARN, or alias \
         name for the KMS key. To use a KMS key in a different Amazon Web Services account, \
         specify the key ARN or alias ARN.\n\
        \   \n\
        \    There is a default KMS key for your Amazon Web Services account. Your Amazon Web \
         Services account has a different default KMS key for each Amazon Web Services Region.\n\
        \    "]
  rotate_master_user_password : boolean_optional option;
      [@ocaml.doc
        "Specifies whether to rotate the secret managed by Amazon Web Services Secrets Manager for \
         the master user password.\n\n\
        \ This setting is valid only if the master user password is managed by Amazon DocumentDB \
         in Amazon Web Services Secrets Manager for the cluster. The secret value contains the \
         updated password.\n\
        \ \n\
        \  Constraint: You must apply the change immediately when rotating the master user password.\n\
        \  "]
  network_type : string_ option;
      [@ocaml.doc
        "The network type of the cluster.\n\n\
        \ The network type is determined by the [DBSubnetGroup] specified for the cluster. A \
         [DBSubnetGroup] can support only the IPv4 protocol or the IPv4 and the IPv6 protocols \
         ([DUAL]).\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/vpc-clusters.html}DocumentDB \
         clusters in a VPC} in the Amazon DocumentDB Developer Guide.\n\
        \  \n\
        \   Valid Values: [IPV4] | [DUAL] \n\
        \   "]
}
[@@ocaml.doc "Represents the input to [ModifyDBCluster].\n"]

type nonrec tag_list_message = {
  tag_list : tag_list option; [@ocaml.doc "A list of one or more tags.\n"]
}
[@@ocaml.doc "Represents the output of [ListTagsForResource].\n"]

type nonrec filter_value_list = string_ list [@@ocaml.doc ""]

type nonrec filter = {
  name : string_; [@ocaml.doc "The name of the filter. Filter names are case sensitive.\n"]
  values : filter_value_list;
      [@ocaml.doc "One or more filter values. Filter values are case sensitive.\n"]
}
[@@ocaml.doc
  "A named set of filter values, used to return a more specific list of results. You can use a \
   filter to match a set of resources by specific criteria, such as IDs.\n\n\
  \ Wildcards are not supported in filters.\n\
  \ "]

type nonrec filter_list = filter list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_message = {
  resource_name : string_;
      [@ocaml.doc
        "The Amazon DocumentDB resource with tags to be listed. This value is an Amazon Resource \
         Name (ARN).\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
}
[@@ocaml.doc "Represents the input to [ListTagsForResource].\n"]

type nonrec failover_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec failover_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc
        "The identifier of the Amazon DocumentDB global cluster to apply this operation. The \
         identifier is the unique key assigned by the user when the cluster is created. In other \
         words, it's the name of the global cluster.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing global cluster.\n\
        \            \n\
        \             }\n\
        \        {-  Minimum length of 1. Maximum length of 255.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Pattern: [\\[A-Za-z\\]\\[0-9A-Za-z-:._\\]*] \n\
        \   "]
  target_db_cluster_identifier : db_cluster_identifier;
      [@ocaml.doc
        "The identifier of the secondary Amazon DocumentDB cluster that you want to promote to the \
         primary for the global cluster. Use the Amazon Resource Name (ARN) for the identifier so \
         that Amazon DocumentDB can locate the cluster in its Amazon Web Services region.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing secondary cluster.\n\
        \            \n\
        \             }\n\
        \        {-  Minimum length of 1. Maximum length of 255.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Pattern: [\\[A-Za-z\\]\\[0-9A-Za-z-:._\\]*] \n\
        \   "]
  allow_data_loss : boolean_optional option;
      [@ocaml.doc
        "Specifies whether to allow data loss for this global cluster operation. Allowing data \
         loss triggers a global failover operation.\n\n\
        \ If you don't specify [AllowDataLoss], the global cluster operation defaults to a \
         switchover.\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Can't be specified together with the [Switchover] parameter.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  switchover : boolean_optional option;
      [@ocaml.doc
        "Specifies whether to switch over this global database cluster.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Can't be specified together with the [AllowDataLoss] parameter.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec failover_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec failover_db_cluster_message = {
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "A cluster identifier to force a failover for. This parameter is not case sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing [DBCluster].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  target_db_instance_identifier : string_ option;
      [@ocaml.doc
        "The name of the instance to promote to the primary instance.\n\n\
        \ You must specify the instance identifier for an Amazon DocumentDB replica in the \
         cluster. For example, [mydbcluster-replica1].\n\
        \ "]
}
[@@ocaml.doc "Represents the input to [FailoverDBCluster].\n"]

type nonrec resource_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
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
        "The effective date when the pending maintenance action is applied to the resource.\n"]
  description : string_ option;
      [@ocaml.doc "A description providing more detail about the maintenance action.\n"]
}
[@@ocaml.doc "Provides information about a pending maintenance action for a resource.\n"]

type nonrec pending_maintenance_action_details = pending_maintenance_action list [@@ocaml.doc ""]

type nonrec resource_pending_maintenance_actions = {
  resource_identifier : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that has pending maintenance actions.\n"]
  pending_maintenance_action_details : pending_maintenance_action_details option;
      [@ocaml.doc
        "A list that provides details about the pending maintenance actions for the resource.\n"]
}
[@@ocaml.doc "Represents the output of [ApplyPendingMaintenanceAction]. \n"]

type nonrec pending_maintenance_actions = resource_pending_maintenance_actions list [@@ocaml.doc ""]

type nonrec pending_maintenance_actions_message = {
  pending_maintenance_actions : pending_maintenance_actions option;
      [@ocaml.doc "The maintenance actions to be applied.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the output of [DescribePendingMaintenanceActions].\n"]

type nonrec describe_pending_maintenance_actions_message = {
  resource_identifier : string_ option;
      [@ocaml.doc "The ARN of a resource to return pending maintenance actions for.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "A filter that specifies one or more resources to return pending maintenance actions for.\n\n\
        \ Supported filters:\n\
        \ \n\
        \  {ul\n\
        \        {-   [db-cluster-id] - Accepts cluster identifiers and cluster Amazon Resource \
         Names (ARNs). The results list includes only pending maintenance actions for the clusters \
         identified by these ARNs.\n\
        \            \n\
        \             }\n\
        \        {-   [db-instance-id] - Accepts instance identifiers and instance ARNs. The \
         results list includes only pending maintenance actions for the DB instances identified by \
         these ARNs.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
}
[@@ocaml.doc "Represents the input to [DescribePendingMaintenanceActions].\n"]

type nonrec availability_zone_list = availability_zone list [@@ocaml.doc ""]

type nonrec orderable_db_instance_option = {
  engine : string_ option; [@ocaml.doc "The engine type of an instance.\n"]
  engine_version : string_ option; [@ocaml.doc "The engine version of an instance.\n"]
  db_instance_class : string_ option; [@ocaml.doc "The instance class for an instance.\n"]
  license_model : string_ option; [@ocaml.doc "The license model for an instance.\n"]
  availability_zones : availability_zone_list option;
      [@ocaml.doc "A list of Availability Zones for an instance.\n"]
  vpc : boolean_ option;
      [@ocaml.doc "Indicates whether an instance is in a virtual private cloud (VPC).\n"]
  storage_type : string_ option; [@ocaml.doc "The storage type to associate with the DB cluster\n"]
}
[@@ocaml.doc "The options that are available for an instance.\n"]

type nonrec orderable_db_instance_options_list = orderable_db_instance_option list [@@ocaml.doc ""]

type nonrec orderable_db_instance_options_message = {
  orderable_db_instance_options : orderable_db_instance_options_list option;
      [@ocaml.doc "The options that are available for a particular orderable instance.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the output of [DescribeOrderableDBInstanceOptions].\n"]

type nonrec describe_orderable_db_instance_options_message = {
  engine : string_; [@ocaml.doc "The name of the engine to retrieve instance options for.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The engine version filter value. Specify this parameter to show only the available \
         offerings that match the specified engine version.\n"]
  db_instance_class : string_ option;
      [@ocaml.doc
        "The instance class filter value. Specify this parameter to show only the available \
         offerings that match the specified instance class.\n"]
  license_model : string_ option;
      [@ocaml.doc
        "The license model filter value. Specify this parameter to show only the available \
         offerings that match the specified license model.\n"]
  vpc : boolean_optional option;
      [@ocaml.doc
        "The virtual private cloud (VPC) filter value. Specify this parameter to show only the \
         available VPC or non-VPC offerings.\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input to [DescribeOrderableDBInstanceOptions].\n"]

type nonrec global_cluster_list = global_cluster list [@@ocaml.doc ""]

type nonrec global_clusters_message = {
  marker : string_ option; [@ocaml.doc "\n"]
  global_clusters : global_cluster_list option; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec describe_global_clusters_message = {
  global_cluster_identifier : global_cluster_identifier option;
      [@ocaml.doc
        "The user-supplied cluster identifier. If this parameter is specified, information from \
         only the specific cluster is returned. This parameter isn't case-sensitive.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "A filter that specifies one or more global DB clusters to describe.\n\n\
        \ Supported filters: [db-cluster-id] accepts cluster identifiers and cluster Amazon \
         Resource Names (ARNs). The results list will only include information about the clusters \
         identified by these ARNs.\n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that you can retrieve the remaining results. \n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeGlobalClusters] request. If \
         this parameter is specified, the response includes only records beyond the marker, up to \
         the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec event_subscriptions_list = event_subscription list [@@ocaml.doc ""]

type nonrec event_subscriptions_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  event_subscriptions_list : event_subscriptions_list option;
      [@ocaml.doc "A list of event subscriptions.\n"]
}
[@@ocaml.doc "Represents the output of [DescribeEventSubscriptions].\n"]

type nonrec describe_event_subscriptions_message = {
  subscription_name : string_ option;
      [@ocaml.doc
        "The name of the Amazon DocumentDB event notification subscription that you want to \
         describe.\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input to [DescribeEventSubscriptions].\n"]

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
[@@ocaml.doc "Detailed information about an event.\n"]

type nonrec event_list = event list [@@ocaml.doc ""]

type nonrec events_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  events : event_list option; [@ocaml.doc "Detailed information about one or more events. \n"]
}
[@@ocaml.doc "Represents the output of [DescribeEvents].\n"]

type nonrec describe_events_message = {
  source_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the event source for which events are returned. If not specified, then \
         all sources are included in the response.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If [SourceIdentifier] is provided, [SourceType] must also be provided.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is [DBInstance], a [DBInstanceIdentifier] must be provided.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is [DBSecurityGroup], a [DBSecurityGroupName] must be \
         provided.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is [DBParameterGroup], a [DBParameterGroupName] must be \
         provided.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is [DBSnapshot], a [DBSnapshotIdentifier] must be provided.\n\
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
         \n\n\
        \ Example: 2009-07-08T18:00Z\n\
        \ "]
  end_time : t_stamp option;
      [@ocaml.doc
        " The end of the time interval for which to retrieve events, specified in ISO 8601 format. \
         \n\n\
        \ Example: 2009-07-08T18:00Z\n\
        \ "]
  duration : integer_optional option;
      [@ocaml.doc "The number of minutes to retrieve events for.\n\n Default: 60\n "]
  event_categories : event_categories_list option;
      [@ocaml.doc
        "A list of event categories that trigger notifications for an event notification \
         subscription.\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input to [DescribeEvents].\n"]

type nonrec event_categories_map = {
  source_type : string_ option;
      [@ocaml.doc "The source type that the returned categories belong to.\n"]
  event_categories : event_categories_list option;
      [@ocaml.doc "The event categories for the specified source type.\n"]
}
[@@ocaml.doc "An event source type, accompanied by one or more event category names.\n"]

type nonrec event_categories_map_list = event_categories_map list [@@ocaml.doc ""]

type nonrec event_categories_message = {
  event_categories_map_list : event_categories_map_list option;
      [@ocaml.doc "A list of event category maps.\n"]
}
[@@ocaml.doc "Represents the output of [DescribeEventCategories].\n"]

type nonrec describe_event_categories_message = {
  source_type : string_ option;
      [@ocaml.doc
        "The type of source that is generating the events.\n\n\
        \ Valid values: [db-instance], [db-parameter-group], [db-security-group] \n\
        \ "]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
}
[@@ocaml.doc "Represents the input to [DescribeEventCategories].\n"]

type nonrec engine_defaults = {
  db_parameter_group_family : string_ option;
      [@ocaml.doc
        "The name of the cluster parameter group family to return the engine parameter information \
         for.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  parameters : parameters_list option;
      [@ocaml.doc "The parameters of a particular cluster parameter group family.\n"]
}
[@@ocaml.doc
  "Contains the result of a successful invocation of the [DescribeEngineDefaultClusterParameters] \
   operation. \n"]

type nonrec describe_engine_default_cluster_parameters_result = {
  engine_defaults : engine_defaults option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_engine_default_cluster_parameters_message = {
  db_parameter_group_family : string_;
      [@ocaml.doc
        "The name of the cluster parameter group family to return the engine parameter information \
         for.\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input to [DescribeEngineDefaultClusterParameters].\n"]

type nonrec db_subnet_groups = db_subnet_group list [@@ocaml.doc ""]

type nonrec db_subnet_group_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  db_subnet_groups : db_subnet_groups option;
      [@ocaml.doc "Detailed information about one or more subnet groups.\n"]
}
[@@ocaml.doc "Represents the output of [DescribeDBSubnetGroups].\n"]

type nonrec describe_db_subnet_groups_message = {
  db_subnet_group_name : string_ option;
      [@ocaml.doc "The name of the subnet group to return details for.\n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input to [DescribeDBSubnetGroups].\n"]

type nonrec db_instance_list = db_instance list [@@ocaml.doc ""]

type nonrec db_instance_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  db_instances : db_instance_list option;
      [@ocaml.doc "Detailed information about one or more instances. \n"]
}
[@@ocaml.doc "Represents the output of [DescribeDBInstances].\n"]

type nonrec describe_db_instances_message = {
  db_instance_identifier : string_ option;
      [@ocaml.doc
        "The user-provided instance identifier. If this parameter is specified, information from \
         only the specific instance is returned. This parameter isn't case sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If provided, must match the identifier of an existing [DBInstance].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "A filter that specifies one or more instances to describe.\n\n\
        \ Supported filters:\n\
        \ \n\
        \  {ul\n\
        \        {-   [db-cluster-id] - Accepts cluster identifiers and cluster Amazon Resource \
         Names (ARNs). The results list includes only the information about the instances that are \
         associated with the clusters that are identified by these ARNs.\n\
        \            \n\
        \             }\n\
        \        {-   [db-instance-id] - Accepts instance identifiers and instance ARNs. The \
         results list includes only the information about the instances that are identified by \
         these ARNs.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input to [DescribeDBInstances].\n"]

type nonrec serverless_v2_features_support = {
  min_capacity : double_optional option;
      [@ocaml.doc
        "The minimum number of Amazon DocumentDB capacity units (DCUs) for an instance in an \
         Amazon DocumentDB Serverless cluster. You can specify DCU values in half-step increments, \
         such as 8, 8.5, 9, and so on.\n"]
  max_capacity : double_optional option;
      [@ocaml.doc
        "The maximum number of Amazon DocumentDB capacity units (DCUs) for an instance in an \
         Amazon DocumentDB Serverless cluster. You can specify DCU values in half-step increments, \
         such as 32, 32.5, 33, and so on.\n"]
}
[@@ocaml.doc
  "Specifies any Amazon DocumentDB Serverless properties or limits that differ between Amazon \
   DocumentDB engine versions. You can test the values of this attribute when deciding which \
   Amazon DocumentDB version to use in a new or upgraded cluster. You can also retrieve the \
   version of an existing cluster and check whether that version supports certain Amazon \
   DocumentDB Serverless features before you attempt to use those features.\n"]

type nonrec ca_certificate_identifiers_list = string_ list [@@ocaml.doc ""]

type nonrec upgrade_target = {
  engine : string_ option; [@ocaml.doc "The name of the upgrade target database engine.\n"]
  engine_version : string_ option;
      [@ocaml.doc "The version number of the upgrade target database engine.\n"]
  description : string_ option;
      [@ocaml.doc "The version of the database engine that an instance can be upgraded to.\n"]
  auto_upgrade : boolean_ option;
      [@ocaml.doc
        "A value that indicates whether the target version is applied to any source DB instances \
         that have [AutoMinorVersionUpgrade] set to [true].\n"]
  is_major_version_upgrade : boolean_ option;
      [@ocaml.doc
        "A value that indicates whether a database engine is upgraded to a major version.\n"]
}
[@@ocaml.doc "The version of the database engine that an instance can be upgraded to.\n"]

type nonrec valid_upgrade_target_list = upgrade_target list [@@ocaml.doc ""]

type nonrec db_engine_version = {
  engine : string_ option; [@ocaml.doc "The name of the database engine.\n"]
  engine_version : string_ option; [@ocaml.doc "The version number of the database engine.\n"]
  db_parameter_group_family : string_ option;
      [@ocaml.doc "The name of the parameter group family for the database engine.\n"]
  db_engine_description : string_ option; [@ocaml.doc "The description of the database engine.\n"]
  db_engine_version_description : string_ option;
      [@ocaml.doc "The description of the database engine version.\n"]
  valid_upgrade_target : valid_upgrade_target_list option;
      [@ocaml.doc
        "A list of engine versions that this database engine version can be upgraded to.\n"]
  exportable_log_types : log_type_list option;
      [@ocaml.doc
        "The types of logs that the database engine has available for export to Amazon CloudWatch \
         Logs.\n"]
  supports_log_exports_to_cloudwatch_logs : boolean_ option;
      [@ocaml.doc
        "A value that indicates whether the engine version supports exporting the log types \
         specified by [ExportableLogTypes] to CloudWatch Logs.\n"]
  supported_ca_certificate_identifiers : ca_certificate_identifiers_list option;
      [@ocaml.doc
        "A list of the supported CA certificate identifiers.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/ca_cert_rotation.html}Updating \
         Your Amazon DocumentDB TLS Certificates} and \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/security.encryption.ssl.html} \
         Encrypting Data in Transit} in the {i Amazon DocumentDB Developer Guide}.\n\
        \ "]
  supports_certificate_rotation_without_restart : boolean_optional option;
      [@ocaml.doc
        "Indicates whether the engine version supports rotating the server certificate without \
         rebooting the DB instance.\n"]
  serverless_v2_features_support : serverless_v2_features_support option;
      [@ocaml.doc
        "Specifies any Amazon DocumentDB Serverless properties or limits that differ between \
         Amazon DocumentDB engine versions. You can test the values of this attribute when \
         deciding which Amazon DocumentDB version to use in a new or upgraded cluster. You can \
         also retrieve the version of an existing cluster and check whether that version supports \
         certain Amazon DocumentDB Serverless features before you attempt to use those features.\n"]
}
[@@ocaml.doc " Detailed information about an engine version. \n"]

type nonrec db_engine_version_list = db_engine_version list [@@ocaml.doc ""]

type nonrec db_engine_version_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  db_engine_versions : db_engine_version_list option;
      [@ocaml.doc "Detailed information about one or more engine versions.\n"]
}
[@@ocaml.doc "Represents the output of [DescribeDBEngineVersions].\n"]

type nonrec describe_db_engine_versions_message = {
  engine : string_ option; [@ocaml.doc "The database engine to return.\n"]
  engine_version : string_ option;
      [@ocaml.doc "The database engine version to return.\n\n Example: [3.6.0] \n "]
  db_parameter_group_family : string_ option;
      [@ocaml.doc
        "The name of a specific parameter group family to return details for.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If provided, must match an existing [DBParameterGroupFamily].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
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
         sets for each engine version. \n"]
  list_supported_timezones : boolean_optional option;
      [@ocaml.doc
        "If this parameter is specified and the requested engine supports the [TimeZone] parameter \
         for [CreateDBInstance], the response includes a list of supported time zones for each \
         engine version. \n"]
}
[@@ocaml.doc "Represents the input to [DescribeDBEngineVersions].\n"]

type nonrec db_cluster_snapshot = {
  availability_zones : availability_zones option;
      [@ocaml.doc
        "Provides the list of Amazon EC2 Availability Zones that instances in the cluster snapshot \
         can be restored in.\n"]
  db_cluster_snapshot_identifier : string_ option;
      [@ocaml.doc "Specifies the identifier for the cluster snapshot.\n"]
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "Specifies the cluster identifier of the cluster that this cluster snapshot was created \
         from.\n"]
  snapshot_create_time : t_stamp option;
      [@ocaml.doc "Provides the time when the snapshot was taken, in UTC.\n"]
  engine : string_ option; [@ocaml.doc "Specifies the name of the database engine.\n"]
  status : string_ option; [@ocaml.doc "Specifies the status of this cluster snapshot.\n"]
  port : integer option;
      [@ocaml.doc
        "Specifies the port that the cluster was listening on at the time of the snapshot.\n"]
  vpc_id : string_ option;
      [@ocaml.doc
        "Provides the virtual private cloud (VPC) ID that is associated with the cluster snapshot.\n"]
  cluster_create_time : t_stamp option;
      [@ocaml.doc
        "Specifies the time when the cluster was created, in Universal Coordinated Time (UTC).\n"]
  master_username : string_ option;
      [@ocaml.doc "Provides the master user name for the cluster snapshot.\n"]
  engine_version : string_ option;
      [@ocaml.doc "Provides the version of the database engine for this cluster snapshot.\n"]
  snapshot_type : string_ option; [@ocaml.doc "Provides the type of the cluster snapshot.\n"]
  percent_progress : integer option;
      [@ocaml.doc "Specifies the percentage of the estimated data that has been transferred.\n"]
  storage_encrypted : boolean_ option;
      [@ocaml.doc "Specifies whether the cluster snapshot is encrypted.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "If [StorageEncrypted] is [true], the KMS key identifier for the encrypted cluster snapshot.\n"]
  db_cluster_snapshot_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the cluster snapshot.\n"]
  source_db_cluster_snapshot_arn : string_ option;
      [@ocaml.doc
        "If the cluster snapshot was copied from a source cluster snapshot, the ARN for the source \
         cluster snapshot; otherwise, a null value.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "Storage type associated with your cluster snapshot\n\n\
        \ For information on storage types for Amazon DocumentDB clusters, see Cluster storage \
         configurations in the {i Amazon DocumentDB Developer Guide}.\n\
        \ \n\
        \  Valid values for storage type - [standard | iopt1] \n\
        \  \n\
        \   Default value is [standard ] \n\
        \   "]
}
[@@ocaml.doc "Detailed information about a cluster snapshot. \n"]

type nonrec db_cluster_snapshot_list = db_cluster_snapshot list [@@ocaml.doc ""]

type nonrec db_cluster_snapshot_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  db_cluster_snapshots : db_cluster_snapshot_list option;
      [@ocaml.doc "Provides a list of cluster snapshots.\n"]
}
[@@ocaml.doc "Represents the output of [DescribeDBClusterSnapshots].\n"]

type nonrec describe_db_cluster_snapshots_message = {
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The ID of the cluster to retrieve the list of cluster snapshots for. This parameter can't \
         be used with the [DBClusterSnapshotIdentifier] parameter. This parameter is not case \
         sensitive. \n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If provided, must match the identifier of an existing [DBCluster].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  db_cluster_snapshot_identifier : string_ option;
      [@ocaml.doc
        "A specific cluster snapshot identifier to describe. This parameter can't be used with the \
         [DBClusterIdentifier] parameter. This value is stored as a lowercase string. \n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If provided, must match the identifier of an existing [DBClusterSnapshot].\n\
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
        "The type of cluster snapshots to be returned. You can specify one of the following \
         values:\n\n\
        \ {ul\n\
        \       {-   [automated] - Return all cluster snapshots that Amazon DocumentDB has \
         automatically created for your Amazon Web Services account.\n\
        \           \n\
        \            }\n\
        \       {-   [manual] - Return all cluster snapshots that you have manually created for \
         your Amazon Web Services account.\n\
        \           \n\
        \            }\n\
        \       {-   [shared] - Return all manual cluster snapshots that have been shared to your \
         Amazon Web Services account.\n\
        \           \n\
        \            }\n\
        \       {-   [public] - Return all cluster snapshots that have been marked as public.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If you don't specify a [SnapshotType] value, then both automated and manual cluster \
         snapshots are returned. You can include shared cluster snapshots with these results by \
         setting the [IncludeShared] parameter to [true]. You can include public cluster snapshots \
         with these results by setting the[IncludePublic] parameter to [true].\n\
        \   \n\
        \    The [IncludeShared] and [IncludePublic] parameters don't apply for [SnapshotType] \
         values of [manual] or [automated]. The [IncludePublic] parameter doesn't apply when \
         [SnapshotType] is set to [shared]. The [IncludeShared] parameter doesn't apply when \
         [SnapshotType] is set to [public].\n\
        \    "]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  include_shared : boolean_ option;
      [@ocaml.doc
        "Set to [true] to include shared manual cluster snapshots from other Amazon Web Services \
         accounts that this Amazon Web Services account has been given permission to copy or \
         restore, and otherwise [false]. The default is [false].\n"]
  include_public : boolean_ option;
      [@ocaml.doc
        "Set to [true] to include manual cluster snapshots that are public and can be copied or \
         restored by any Amazon Web Services account, and otherwise [false]. The default is \
         [false].\n"]
}
[@@ocaml.doc "Represents the input to [DescribeDBClusterSnapshots].\n"]

type nonrec describe_db_cluster_snapshot_attributes_result = {
  db_cluster_snapshot_attributes_result : db_cluster_snapshot_attributes_result option;
      [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_db_cluster_snapshot_attributes_message = {
  db_cluster_snapshot_identifier : string_;
      [@ocaml.doc "The identifier for the cluster snapshot to describe the attributes for.\n"]
}
[@@ocaml.doc "Represents the input to [DescribeDBClusterSnapshotAttributes].\n"]

type nonrec db_cluster_list = db_cluster list [@@ocaml.doc ""]

type nonrec db_cluster_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  db_clusters : db_cluster_list option; [@ocaml.doc "A list of clusters.\n"]
}
[@@ocaml.doc "Represents the output of [DescribeDBClusters].\n"]

type nonrec describe_db_clusters_message = {
  db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The user-provided cluster identifier. If this parameter is specified, information from \
         only the specific cluster is returned. This parameter isn't case sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If provided, must match an existing [DBClusterIdentifier].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "A filter that specifies one or more clusters to describe.\n\n\
        \ Supported filters:\n\
        \ \n\
        \  {ul\n\
        \        {-   [db-cluster-id] - Accepts cluster identifiers and cluster Amazon Resource \
         Names (ARNs). The results list only includes information about the clusters identified by \
         these ARNs.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input to [DescribeDBClusters].\n"]

type nonrec db_cluster_parameter_group_details = {
  parameters : parameters_list option;
      [@ocaml.doc "Provides a list of parameters for the cluster parameter group.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the output of [DBClusterParameterGroup].\n"]

type nonrec describe_db_cluster_parameters_message = {
  db_cluster_parameter_group_name : string_;
      [@ocaml.doc
        "The name of a specific cluster parameter group to return parameter details for.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If provided, must match the name of an existing [DBClusterParameterGroup].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  source : string_ option;
      [@ocaml.doc
        " A value that indicates to return only parameters for a specific source. Parameter \
         sources can be [engine], [service], or [customer]. \n"]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input to [DescribeDBClusterParameters].\n"]

type nonrec db_cluster_parameter_group = {
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc "Provides the name of the cluster parameter group.\n"]
  db_parameter_group_family : string_ option;
      [@ocaml.doc
        "Provides the name of the parameter group family that this cluster parameter group is \
         compatible with.\n"]
  description : string_ option;
      [@ocaml.doc "Provides the customer-specified description for this cluster parameter group.\n"]
  db_cluster_parameter_group_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the cluster parameter group.\n"]
}
[@@ocaml.doc "Detailed information about a cluster parameter group. \n"]

type nonrec db_cluster_parameter_group_list = db_cluster_parameter_group list [@@ocaml.doc ""]

type nonrec db_cluster_parameter_groups_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  db_cluster_parameter_groups : db_cluster_parameter_group_list option;
      [@ocaml.doc "A list of cluster parameter groups.\n"]
}
[@@ocaml.doc "Represents the output of [DBClusterParameterGroups].\n"]

type nonrec describe_db_cluster_parameter_groups_message = {
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of a specific cluster parameter group to return details for.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If provided, must match the name of an existing [DBClusterParameterGroup].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  filters : filter_list option; [@ocaml.doc "This parameter is not currently supported.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token (marker) is included in the response so \
         that the remaining results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input to [DescribeDBClusterParameterGroups].\n"]

type nonrec certificate = {
  certificate_identifier : string_ option;
      [@ocaml.doc "The unique key that identifies a certificate.\n\n Example: [rds-ca-2019] \n "]
  certificate_type : string_ option;
      [@ocaml.doc "The type of the certificate.\n\n Example: [CA] \n "]
  thumbprint : string_ option; [@ocaml.doc "The thumbprint of the certificate.\n"]
  valid_from : t_stamp option;
      [@ocaml.doc
        "The starting date-time from which the certificate is valid.\n\n\
        \ Example: [2019-07-31T17:57:09Z] \n\
        \ "]
  valid_till : t_stamp option;
      [@ocaml.doc
        "The date-time after which the certificate is no longer valid.\n\n\
        \ Example: [2024-07-31T17:57:09Z] \n\
        \ "]
  certificate_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the certificate.\n\n\
        \ Example: [arn:aws:rds:us-east-1::cert:rds-ca-2019] \n\
        \ "]
}
[@@ocaml.doc "A certificate authority (CA) certificate for an Amazon Web Services account.\n"]

type nonrec certificate_list = certificate list [@@ocaml.doc ""]

type nonrec certificate_message = {
  certificates : certificate_list option;
      [@ocaml.doc "A list of certificates for this Amazon Web Services account.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided if the number of records retrieved is greater than \
         [MaxRecords]. If this parameter is specified, the marker specifies the next record in the \
         list. Including the value of [Marker] in the next call to [DescribeCertificates] results \
         in the next page of certificates.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_certificates_message = {
  certificate_identifier : string_ option;
      [@ocaml.doc
        "The user-supplied certificate identifier. If this parameter is specified, information for \
         only the specified certificate is returned. If this parameter is omitted, a list of up to \
         [MaxRecords] certificates is returned. This parameter is not case sensitive.\n\n\
        \ Constraints\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match an existing [CertificateIdentifier].\n\
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
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Minimum: 20\n\
        \             \n\
        \              }\n\
        \         {-  Maximum: 100\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeCertificates] request. If \
         this parameter is specified, the response includes only records beyond the marker, up to \
         the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc "The cluster identifier of the global cluster being deleted.\n"]
}
[@@ocaml.doc "Represents the input to [DeleteGlobalCluster].\n"]

type nonrec invalid_event_subscription_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Someone else might be modifying a subscription. Wait a few seconds, and try again.\n"]

type nonrec delete_event_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_event_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc
        "The name of the Amazon DocumentDB event notification subscription that you want to delete.\n"]
}
[@@ocaml.doc "Represents the input to [DeleteEventSubscription].\n"]

type nonrec invalid_db_subnet_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc " The subnet isn't in the {i available} state. \n"]

type nonrec delete_db_subnet_group_message = {
  db_subnet_group_name : string_;
      [@ocaml.doc
        "The name of the database subnet group to delete.\n\n\
        \  You can't delete the default subnet group.\n\
        \  \n\
        \    Constraints:\n\
        \    \n\
        \     Must match the name of an existing [DBSubnetGroup]. Must not be default.\n\
        \     \n\
        \      Example: [mySubnetgroup] \n\
        \      "]
}
[@@ocaml.doc "Represents the input to [DeleteDBSubnetGroup].\n"]

type nonrec snapshot_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request would cause you to exceed the allowed number of snapshots.\n"]

type nonrec db_snapshot_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc " [DBSnapshotIdentifier] is already being used by an existing snapshot. \n"]

type nonrec delete_db_instance_result = { db_instance : db_instance option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec delete_db_instance_message = {
  db_instance_identifier : string_;
      [@ocaml.doc
        "The instance identifier for the instance to be deleted. This parameter isn't case \
         sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the name of an existing instance.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "Represents the input to [DeleteDBInstance].\n"]

type nonrec delete_db_cluster_snapshot_result = {
  db_cluster_snapshot : db_cluster_snapshot option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_db_cluster_snapshot_message = {
  db_cluster_snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier of the cluster snapshot to delete.\n\n\
        \ Constraints: Must be the name of an existing cluster snapshot in the [available] state.\n\
        \ "]
}
[@@ocaml.doc "Represents the input to [DeleteDBClusterSnapshot].\n"]

type nonrec delete_db_cluster_parameter_group_message = {
  db_cluster_parameter_group_name : string_;
      [@ocaml.doc
        "The name of the cluster parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be the name of an existing cluster parameter group.\n\
        \            \n\
        \             }\n\
        \        {-  You can't delete a default cluster parameter group.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot be associated with any clusters.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "Represents the input to [DeleteDBClusterParameterGroup].\n"]

type nonrec db_cluster_snapshot_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You already have a cluster snapshot with the given identifier.\n"]

type nonrec delete_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec delete_db_cluster_message = {
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The cluster identifier for the cluster to be deleted. This parameter isn't case \
         sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match an existing [DBClusterIdentifier].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  skip_final_snapshot : boolean_ option;
      [@ocaml.doc
        " Determines whether a final cluster snapshot is created before the cluster is deleted. If \
         [true] is specified, no cluster snapshot is created. If [false] is specified, a cluster \
         snapshot is created before the DB cluster is deleted. \n\n\
        \  If [SkipFinalSnapshot] is [false], you must specify a [FinalDBSnapshotIdentifier] \
         parameter.\n\
        \  \n\
        \    Default: [false] \n\
        \    "]
  final_db_snapshot_identifier : string_ option;
      [@ocaml.doc
        " The cluster snapshot identifier of the new cluster snapshot created when \
         [SkipFinalSnapshot] is set to [false]. \n\n\
        \   Specifying this parameter and also setting the [SkipFinalShapshot] parameter to [true] \
         results in an error. \n\
        \  \n\
        \    Constraints:\n\
        \    \n\
        \     {ul\n\
        \           {-  Must be from 1 to 255 letters, numbers, or hyphens.\n\
        \               \n\
        \                }\n\
        \           {-  The first character must be a letter.\n\
        \               \n\
        \                }\n\
        \           {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
}
[@@ocaml.doc "Represents the input to [DeleteDBCluster].\n"]

type nonrec global_cluster_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The number of global clusters for this account is already at the maximum allowed.\n"]

type nonrec global_cluster_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The [GlobalClusterIdentifier] already exists. Choose a new global cluster identifier (unique \
   name) to create a new global cluster. \n"]

type nonrec create_global_cluster_result = {
  global_cluster : global_cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_global_cluster_message = {
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc "The cluster identifier of the new global cluster.\n"]
  source_db_cluster_identifier : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) to use as the primary cluster of the global cluster. This \
         parameter is optional.\n"]
  engine : string_ option;
      [@ocaml.doc "The name of the database engine to be used for this cluster.\n"]
  engine_version : string_ option; [@ocaml.doc "The engine version of the global cluster.\n"]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "The deletion protection setting for the new global cluster. The global cluster can't be \
         deleted when deletion protection is enabled. \n"]
  database_name : string_ option;
      [@ocaml.doc
        "The name for your database of up to 64 alpha-numeric characters. If you do not provide a \
         name, Amazon DocumentDB will not create a database in the global cluster you are creating.\n"]
  storage_encrypted : boolean_optional option;
      [@ocaml.doc "The storage encryption setting for the new global cluster. \n"]
}
[@@ocaml.doc "Represents the input to [CreateGlobalCluster].\n"]

type nonrec subscription_already_exist_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The provided subscription name already exists. \n"]

type nonrec create_event_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_event_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc
        "The name of the subscription.\n\n\
        \ Constraints: The name must be fewer than 255 characters.\n\
        \ "]
  sns_topic_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the SNS topic created for event notification. Amazon \
         SNS creates the ARN when you create a topic and subscribe to it.\n"]
  source_type : string_ option;
      [@ocaml.doc
        "The type of source that is generating the events. For example, if you want to be notified \
         of events generated by an instance, you would set this parameter to [db-instance]. If \
         this value is not specified, all events are returned.\n\n\
        \ Valid values: [db-instance], [db-cluster], [db-parameter-group], [db-security-group], \
         [db-cluster-snapshot] \n\
        \ "]
  event_categories : event_categories_list option;
      [@ocaml.doc
        " A list of event categories for a [SourceType] that you want to subscribe to. \n"]
  source_ids : source_ids_list option;
      [@ocaml.doc
        "The list of identifiers of the event sources for which events are returned. If not \
         specified, then all sources are included in the response. An identifier must begin with a \
         letter and must contain only ASCII letters, digits, and hyphens; it can't end with a \
         hyphen or contain two consecutive hyphens.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  If [SourceIds] are provided, [SourceType] must also be provided.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is an instance, a [DBInstanceIdentifier] must be provided.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is a security group, a [DBSecurityGroupName] must be \
         provided.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is a parameter group, a [DBParameterGroupName] must be \
         provided.\n\
        \            \n\
        \             }\n\
        \        {-  If the source type is a snapshot, a [DBSnapshotIdentifier] must be provided.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  enabled : boolean_optional option;
      [@ocaml.doc
        " A Boolean value; set to [true] to activate the subscription, set to [false] to create \
         the subscription but not active it. \n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the event subscription.\n"]
}
[@@ocaml.doc "Represents the input to [CreateEventSubscription].\n"]

type nonrec db_subnet_group_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request would cause you to exceed the allowed number of subnet groups.\n"]

type nonrec db_subnet_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc " [DBSubnetGroupName] is already being used by an existing subnet group. \n"]

type nonrec create_db_subnet_group_result = {
  db_subnet_group : db_subnet_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_db_subnet_group_message = {
  db_subnet_group_name : string_;
      [@ocaml.doc
        "The name for the subnet group. This value is stored as a lowercase string.\n\n\
        \ Constraints: Must contain no more than 255 letters, numbers, periods, underscores, \
         spaces, or hyphens. Must not be default.\n\
        \ \n\
        \  Example: [mySubnetgroup] \n\
        \  "]
  db_subnet_group_description : string_; [@ocaml.doc "The description for the subnet group.\n"]
  subnet_ids : subnet_identifier_list;
      [@ocaml.doc "The Amazon EC2 subnet IDs for the subnet group.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the subnet group.\n"]
}
[@@ocaml.doc "Represents the input to [CreateDBSubnetGroup].\n"]

type nonrec instance_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request would cause you to exceed the allowed number of instances.\n"]

type nonrec create_db_instance_result = { db_instance : db_instance option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec create_db_instance_message = {
  db_instance_identifier : string_;
      [@ocaml.doc
        "The instance identifier. This parameter is stored as a lowercase string.\n\n\
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
  db_instance_class : string_;
      [@ocaml.doc "The compute and memory capacity of the instance; for example, [db.r5.large]. \n"]
  engine : string_;
      [@ocaml.doc
        "The name of the database engine to be used for this instance.\n\n Valid value: [docdb] \n "]
  availability_zone : string_ option;
      [@ocaml.doc
        "The Amazon EC2 Availability Zone that the instance is created in. \n\n\
        \ Default: A random, system-chosen Availability Zone in the endpoint's Amazon Web Services \
         Region.\n\
        \ \n\
        \  Example: [us-east-1d] \n\
        \  "]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The time range each week during which system maintenance can occur, in Universal \
         Coordinated Time (UTC).\n\n\
        \  Format: [ddd:hh24:mi-ddd:hh24:mi] \n\
        \ \n\
        \  The default is a 30-minute window selected at random from an 8-hour block of time for \
         each Amazon Web Services Region, occurring on a random day of the week. \n\
        \  \n\
        \   Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun\n\
        \   \n\
        \    Constraints: Minimum 30-minute window.\n\
        \    "]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "This parameter does not apply to Amazon DocumentDB. Amazon DocumentDB does not perform \
         minor version upgrades regardless of the value set.\n\n\
        \ Default: [false] \n\
        \ "]
  tags : tag_list option;
      [@ocaml.doc
        "The tags to be assigned to the instance. You can assign up to 10 tags to an instance.\n"]
  db_cluster_identifier : string_;
      [@ocaml.doc "The identifier of the cluster that the instance will belong to.\n"]
  copy_tags_to_snapshot : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether to copy tags from the DB instance to snapshots of the DB \
         instance. By default, tags are not copied.\n"]
  promotion_tier : integer_optional option;
      [@ocaml.doc
        "A value that specifies the order in which an Amazon DocumentDB replica is promoted to the \
         primary instance after a failure of the existing primary instance.\n\n\
        \ Default: 1\n\
        \ \n\
        \  Valid values: 0-15\n\
        \  "]
  enable_performance_insights : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether to enable Performance Insights for the DB Instance. For \
         more information, see \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/performance-insights.html}Using \
         Amazon Performance Insights}.\n"]
  performance_insights_kms_key_id : string_ option;
      [@ocaml.doc
        "The KMS key identifier for encryption of Performance Insights data.\n\n\
        \ The KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key.\n\
        \ \n\
        \  If you do not specify a value for PerformanceInsightsKMSKeyId, then Amazon DocumentDB \
         uses your default KMS key. There is a default KMS key for your Amazon Web Services \
         account. Your Amazon Web Services account has a different default KMS key for each Amazon \
         Web Services region.\n\
        \  "]
  ca_certificate_identifier : string_ option;
      [@ocaml.doc
        "The CA certificate identifier to use for the DB instance's server certificate.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/ca_cert_rotation.html}Updating \
         Your Amazon DocumentDB TLS Certificates} and \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/security.encryption.ssl.html} \
         Encrypting Data in Transit} in the {i Amazon DocumentDB Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc "Represents the input to [CreateDBInstance].\n"]

type nonrec create_db_cluster_snapshot_result = {
  db_cluster_snapshot : db_cluster_snapshot option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_db_cluster_snapshot_message = {
  db_cluster_snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier of the cluster snapshot. This parameter is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster-snapshot1] \n\
        \   "]
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The identifier of the cluster to create a snapshot for. This parameter is not case \
         sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must match the identifier of an existing [DBCluster].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster] \n\
        \   "]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the cluster snapshot.\n"]
}
[@@ocaml.doc "Represents the input of [CreateDBClusterSnapshot].\n"]

type nonrec db_parameter_group_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "This request would cause you to exceed the allowed number of parameter groups.\n"]

type nonrec db_parameter_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A parameter group with the same name already exists.\n"]

type nonrec create_db_cluster_parameter_group_result = {
  db_cluster_parameter_group : db_cluster_parameter_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_db_cluster_parameter_group_message = {
  db_cluster_parameter_group_name : string_;
      [@ocaml.doc
        "The name of the cluster parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must not match the name of an existing [DBClusterParameterGroup].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    This value is stored as a lowercase string.\n\
        \    \n\
        \     "]
  db_parameter_group_family : string_; [@ocaml.doc "The cluster parameter group family name.\n"]
  description : string_; [@ocaml.doc "The description for the cluster parameter group.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the cluster parameter group.\n"]
}
[@@ocaml.doc "Represents the input of [CreateDBClusterParameterGroup].\n"]

type nonrec create_db_cluster_result = { db_cluster : db_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec create_db_cluster_message = {
  availability_zones : availability_zones option;
      [@ocaml.doc
        "A list of Amazon EC2 Availability Zones that instances in the cluster can be created in.\n"]
  backup_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days for which automated backups are retained. You must specify a minimum \
         value of 1.\n\n\
        \ Default: 1\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be a value from 1 to 35.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  db_cluster_identifier : string_;
      [@ocaml.doc
        "The cluster identifier. This parameter is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens. \n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster] \n\
        \   "]
  db_cluster_parameter_group_name : string_ option;
      [@ocaml.doc "The name of the cluster parameter group to associate with this cluster.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of EC2 VPC security groups to associate with this cluster. \n"]
  db_subnet_group_name : string_ option;
      [@ocaml.doc
        "A subnet group to associate with this cluster.\n\n\
        \ Constraints: Must match the name of an existing [DBSubnetGroup]. Must not be default.\n\
        \ \n\
        \  Example: [mySubnetgroup] \n\
        \  "]
  engine : string_;
      [@ocaml.doc
        "The name of the database engine to be used for this cluster.\n\n Valid values: [docdb] \n "]
  engine_version : string_ option;
      [@ocaml.doc
        "The version number of the database engine to use. The [--engine-version] will default to \
         the latest major engine version. For production workloads, we recommend explicitly \
         declaring this parameter with the intended major engine version.\n"]
  port : integer_optional option;
      [@ocaml.doc "The port number on which the instances in the cluster accept connections.\n"]
  master_username : string_ option;
      [@ocaml.doc
        "The name of the master user for the cluster.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be from 1 to 63 letters or numbers.\n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot be a reserved word for the chosen database engine. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  master_user_password : string_ option;
      [@ocaml.doc
        "The password for the master database user. This password can contain any printable ASCII \
         character except forward slash (/), double quote (\"), or the \"at\" symbol (\\@).\n\n\
        \ Constraints: Must contain from 8 to 100 characters.\n\
        \ "]
  preferred_backup_window : string_ option;
      [@ocaml.doc
        "The daily time range during which automated backups are created if automated backups are \
         enabled using the [BackupRetentionPeriod] parameter. \n\n\
        \ The default is a 30-minute window selected at random from an 8-hour block of time for \
         each Amazon Web Services Region. \n\
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
        \         {-  Must not conflict with the preferred maintenance window. \n\
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
         each Amazon Web Services Region, occurring on a random day of the week.\n\
        \  \n\
        \   Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun\n\
        \   \n\
        \    Constraints: Minimum 30-minute window.\n\
        \    "]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the cluster.\n"]
  storage_encrypted : boolean_optional option;
      [@ocaml.doc "Specifies whether the cluster is encrypted.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The KMS key identifier for an encrypted cluster.\n\n\
        \ The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If \
         you are creating a cluster using the same Amazon Web Services account that owns the KMS \
         encryption key that is used to encrypt the new cluster, you can use the KMS key alias \
         instead of the ARN for the KMS encryption key.\n\
        \ \n\
        \  If an encryption key is not specified in [KmsKeyId]: \n\
        \  \n\
        \   {ul\n\
        \         {-  If the [StorageEncrypted] parameter is [true], Amazon DocumentDB uses your \
         default encryption key. \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   KMS creates the default encryption key for your Amazon Web Services account. Your \
         Amazon Web Services account has a different default encryption key for each Amazon Web \
         Services Regions.\n\
        \   "]
  pre_signed_url : string_ option; [@ocaml.doc "Not currently supported. \n"]
  enable_cloudwatch_logs_exports : log_type_list option;
      [@ocaml.doc
        "A list of log types that need to be enabled for exporting to Amazon CloudWatch Logs. You \
         can enable audit logs or profiler logs. For more information, see \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/event-auditing.html} \
         Auditing Amazon DocumentDB Events} and \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/profiling.html} Profiling \
         Amazon DocumentDB Operations}. \n"]
  deletion_protection : boolean_optional option;
      [@ocaml.doc
        "Specifies whether this cluster can be deleted. If [DeletionProtection] is enabled, the \
         cluster cannot be deleted unless it is modified and [DeletionProtection] is disabled. \
         [DeletionProtection] protects clusters from being accidentally deleted.\n"]
  global_cluster_identifier : global_cluster_identifier option;
      [@ocaml.doc "The cluster identifier of the new global cluster.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "The storage type to associate with the DB cluster.\n\n\
        \ For information on storage types for Amazon DocumentDB clusters, see Cluster storage \
         configurations in the {i Amazon DocumentDB Developer Guide}.\n\
        \ \n\
        \  Valid values for storage type - [standard | iopt1] \n\
        \  \n\
        \   Default value is [standard ] \n\
        \   \n\
        \     When you create an Amazon DocumentDB cluster with the storage type set to [iopt1], \
         the storage type is returned in the response. The storage type isn't returned when you \
         set it to [standard].\n\
        \     \n\
        \      "]
  serverless_v2_scaling_configuration : serverless_v2_scaling_configuration option;
      [@ocaml.doc
        "Contains the scaling configuration of an Amazon DocumentDB Serverless cluster.\n"]
  manage_master_user_password : boolean_optional option;
      [@ocaml.doc
        "Specifies whether to manage the master user password with Amazon Web Services Secrets \
         Manager.\n\n\
        \ Constraint: You can't manage the master user password with Amazon Web Services Secrets \
         Manager if [MasterUserPassword] is specified.\n\
        \ "]
  master_user_secret_kms_key_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services KMS key identifier to encrypt a secret that is automatically \
         generated and managed in Amazon Web Services Secrets Manager. This setting is valid only \
         if the master user password is managed by Amazon DocumentDB in Amazon Web Services \
         Secrets Manager for the DB cluster.\n\n\
        \ The Amazon Web Services KMS key identifier is the key ARN, key ID, alias ARN, or alias \
         name for the KMS key. To use a KMS key in a different Amazon Web Services account, \
         specify the key ARN or alias ARN.\n\
        \ \n\
        \  If you don't specify [MasterUserSecretKmsKeyId], then the [aws/secretsmanager] KMS key \
         is used to encrypt the secret. If the secret is in a different Amazon Web Services \
         account, then you can't use the [aws/secretsmanager] KMS key to encrypt the secret, and \
         you must use a customer managed KMS key.\n\
        \  \n\
        \   There is a default KMS key for your Amazon Web Services account. Your Amazon Web \
         Services account has a different default KMS key for each Amazon Web Services Region.\n\
        \   "]
  network_type : string_ option;
      [@ocaml.doc
        "The network type of the cluster.\n\n\
        \ The network type is determined by the [DBSubnetGroup] specified for the cluster. A \
         [DBSubnetGroup] can support only the IPv4 protocol or the IPv4 and the IPv6 protocols \
         ([DUAL]).\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/vpc-clusters.html}DocumentDB \
         clusters in a VPC} in the Amazon DocumentDB Developer Guide.\n\
        \  \n\
        \   Valid Values: [IPV4] | [DUAL] \n\
        \   "]
}
[@@ocaml.doc "Represents the input to [CreateDBCluster]. \n"]

type nonrec copy_db_cluster_snapshot_result = {
  db_cluster_snapshot : db_cluster_snapshot option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec copy_db_cluster_snapshot_message = {
  source_db_cluster_snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier of the cluster snapshot to copy. This parameter is not case sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must specify a valid cluster snapshot in the {i available} state.\n\
        \            \n\
        \             }\n\
        \        {-  If the source cluster snapshot is in the same Amazon Web Services Region as \
         the copy, specify a valid snapshot identifier.\n\
        \            \n\
        \             }\n\
        \        {-  If the source cluster snapshot is in a different Amazon Web Services Region \
         or owned by another Amazon Web Services account, specify the snapshot ARN.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster-snapshot1] \n\
        \   "]
  target_db_cluster_snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier of the new cluster snapshot to create from the source cluster snapshot. \
         This parameter is not case sensitive.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 letters, numbers, or hyphens. \n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster-snapshot2] \n\
        \   "]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The KMS key ID for an encrypted cluster snapshot. The KMS key ID is the Amazon Resource \
         Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key. \n\n\
        \ If you copy an encrypted cluster snapshot from your Amazon Web Services account, you can \
         specify a value for [KmsKeyId] to encrypt the copy with a new KMS encryption key. If you \
         don't specify a value for [KmsKeyId], then the copy of the cluster snapshot is encrypted \
         with the same KMS key as the source cluster snapshot.\n\
        \ \n\
        \  If you copy an encrypted cluster snapshot that is shared from another Amazon Web \
         Services account, then you must specify a value for [KmsKeyId].\n\
        \  \n\
        \   To copy an encrypted cluster snapshot to another Amazon Web Services Region, set \
         [KmsKeyId] to the KMS key ID that you want to use to encrypt the copy of the cluster \
         snapshot in the destination Region. KMS encryption keys are specific to the Amazon Web \
         Services Region that they are created in, and you can't use encryption keys from one \
         Amazon Web Services Region in another Amazon Web Services Region.\n\
        \   \n\
        \    If you copy an unencrypted cluster snapshot and specify a value for the [KmsKeyId] \
         parameter, an error is returned.\n\
        \    "]
  pre_signed_url : string_ option;
      [@ocaml.doc
        "The URL that contains a Signature Version 4 signed request for the[CopyDBClusterSnapshot] \
         API action in the Amazon Web Services Region that contains the source cluster snapshot to \
         copy. You must use the [PreSignedUrl] parameter when copying a cluster snapshot from \
         another Amazon Web Services Region.\n\n\
        \ If you are using an Amazon Web Services SDK tool or the CLI, you can specify \
         [SourceRegion] (or [--source-region] for the CLI) instead of specifying [PreSignedUrl] \
         manually. Specifying [SourceRegion] autogenerates a pre-signed URL that is a valid \
         request for the operation that can be executed in the source Amazon Web Services Region.\n\
        \ \n\
        \  The presigned URL must be a valid request for the [CopyDBClusterSnapshot] API action \
         that can be executed in the source Amazon Web Services Region that contains the cluster \
         snapshot to be copied. The presigned URL request must contain the following parameter \
         values:\n\
        \  \n\
        \   {ul\n\
        \         {-   [SourceRegion] - The ID of the region that contains the snapshot to be \
         copied.\n\
        \             \n\
        \              }\n\
        \         {-   [SourceDBClusterSnapshotIdentifier] - The identifier for the the encrypted \
         cluster snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) \
         format for the source Amazon Web Services Region. For example, if you are copying an \
         encrypted cluster snapshot from the us-east-1 Amazon Web Services Region, then your \
         [SourceDBClusterSnapshotIdentifier] looks something like the following: \
         [arn:aws:rds:us-east-1:12345678012:sample-cluster:sample-cluster-snapshot].\n\
        \             \n\
        \              }\n\
        \         {-   [TargetDBClusterSnapshotIdentifier] - The identifier for the new cluster \
         snapshot to be created. This parameter isn't case sensitive.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  copy_tags : boolean_optional option;
      [@ocaml.doc
        "Set to [true] to copy all tags from the source cluster snapshot to the target cluster \
         snapshot, and otherwise [false]. The default is [false].\n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the cluster snapshot.\n"]
}
[@@ocaml.doc "Represents the input to [CopyDBClusterSnapshot]. \n"]

type nonrec copy_db_cluster_parameter_group_result = {
  db_cluster_parameter_group : db_cluster_parameter_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec copy_db_cluster_parameter_group_message = {
  source_db_cluster_parameter_group_identifier : string_;
      [@ocaml.doc
        "The identifier or Amazon Resource Name (ARN) for the source cluster parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must specify a valid cluster parameter group.\n\
        \            \n\
        \             }\n\
        \        {-  If the source cluster parameter group is in the same Amazon Web Services \
         Region as the copy, specify a valid parameter group identifier; for example, \
         [my-db-cluster-param-group], or a valid ARN.\n\
        \            \n\
        \             }\n\
        \        {-  If the source parameter group is in a different Amazon Web Services Region \
         than the copy, specify a valid cluster parameter group ARN; for example, \
         [arn:aws:rds:us-east-1:123456789012:sample-cluster:sample-parameter-group].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  target_db_cluster_parameter_group_identifier : string_;
      [@ocaml.doc
        "The identifier for the copied cluster parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Cannot be null, empty, or blank.\n\
        \            \n\
        \             }\n\
        \        {-  Must contain from 1 to 255 letters, numbers, or hyphens. \n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-cluster-param-group1] \n\
        \   "]
  target_db_cluster_parameter_group_description : string_;
      [@ocaml.doc "A description for the copied cluster parameter group.\n"]
  tags : tag_list option; [@ocaml.doc "The tags that are to be assigned to the parameter group.\n"]
}
[@@ocaml.doc "Represents the input to [CopyDBClusterParameterGroup]. \n"]

type nonrec apply_pending_maintenance_action_result = {
  resource_pending_maintenance_actions : resource_pending_maintenance_actions option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec apply_pending_maintenance_action_message = {
  resource_identifier : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that the pending maintenance action \
         applies to.\n"]
  apply_action : string_;
      [@ocaml.doc
        "The pending maintenance action to apply to this resource.\n\n\
        \ Valid values: [system-update], [db-upgrade] \n\
        \ "]
  opt_in_type : string_;
      [@ocaml.doc
        "A value that specifies the type of opt-in request or undoes an opt-in request. An opt-in \
         request of type [immediate] can't be undone.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [immediate] - Apply the maintenance action immediately.\n\
        \            \n\
        \             }\n\
        \        {-   [next-maintenance] - Apply the maintenance action during the next \
         maintenance window for the resource. \n\
        \            \n\
        \             }\n\
        \        {-   [undo-opt-in] - Cancel any existing [next-maintenance] opt-in requests.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "Represents the input to [ApplyPendingMaintenanceAction]. \n"]
