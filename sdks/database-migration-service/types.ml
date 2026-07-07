type nonrec string_ = string [@@ocaml.doc ""]

type nonrec vpc_security_group_membership = {
  status : string_ option; [@ocaml.doc "The status of the VPC security group.\n"]
  vpc_security_group_id : string_ option; [@ocaml.doc "The VPC security group ID.\n"]
}
[@@ocaml.doc
  "Describes the status of a security group associated with the virtual private cloud (VPC) \
   hosting your replication and DB instances.\n"]

type nonrec vpc_security_group_membership_list = vpc_security_group_membership list [@@ocaml.doc ""]

type nonrec vpc_security_group_id_list = string_ list [@@ocaml.doc ""]

type nonrec version_status =
  | UNSUPPORTED [@ocaml.doc ""]
  | OUTDATED [@ocaml.doc ""]
  | UP_TO_DATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec upgrade_dependency_failure_fault = {
  message : exception_message option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "An upgrade dependency is preventing the database migration.\n"]

type nonrec update_subscriptions_to_event_bridge_response = {
  result_ : string_ option;
      [@ocaml.doc
        "A string that indicates how many event subscriptions were migrated and how many remain to \
         be migrated.\n"]
}
[@@ocaml.doc "\n"]

type nonrec boolean_optional = bool [@@ocaml.doc ""]

type nonrec update_subscriptions_to_event_bridge_message = {
  force_move : boolean_optional option;
      [@ocaml.doc
        "When set to true, this operation migrates DMS subscriptions for Amazon SNS notifications \
         no matter what your replication instance version is. If not set or set to false, this \
         operation runs only when all your replication instances are from DMS version 3.4.5 or \
         higher. \n"]
}
[@@ocaml.doc "\n"]

type nonrec invalid_resource_state_fault = { message : exception_message option [@ocaml.doc "\n"] }
[@@ocaml.doc
  "The resource is in a state that prevents it from being used for database migration.\n"]

type nonrec access_denied_fault = { message : exception_message option [@ocaml.doc "\n"] }
[@@ocaml.doc
  "DMS was denied access to the endpoint. Check that the role is correctly configured.\n"]

type nonrec tlog_access_mode =
  | TlogOnly [@ocaml.doc ""]
  | PreferTlog [@ocaml.doc ""]
  | PreferBackup [@ocaml.doc ""]
  | BackupOnly [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integer_optional = int [@@ocaml.doc ""]

type nonrec timestream_settings = {
  enable_magnetic_store_writes : boolean_optional option;
      [@ocaml.doc
        "Set this attribute to [true] to enable memory store writes. When this value is [false], \
         DMS does not write records that are older in days than the value specified in \
         [MagneticDuration], because Amazon Timestream does not allow memory writes by default. \
         For more information, see \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/storage.html}Storage} in \
         the {{:https://docs.aws.amazon.com/timestream/latest/developerguide/}Amazon Timestream \
         Developer Guide}.\n"]
  cdc_inserts_and_updates : boolean_optional option;
      [@ocaml.doc
        "Set this attribute to [true] to specify that DMS only applies inserts and updates, and \
         not deletes. Amazon Timestream does not allow deleting records, so if this value is \
         [false], DMS nulls out the corresponding record in the Timestream database rather than \
         deleting it.\n"]
  magnetic_duration : integer_optional;
      [@ocaml.doc
        "Set this attribute to specify the default magnetic duration applied to the Amazon \
         Timestream tables in days. This is the number of days that records remain in magnetic \
         store before being discarded. For more information, see \
         {{:https://docs.aws.amazon.com/timestream/latest/developerguide/storage.html}Storage} in \
         the {{:https://docs.aws.amazon.com/timestream/latest/developerguide/}Amazon Timestream \
         Developer Guide}.\n"]
  memory_duration : integer_optional;
      [@ocaml.doc
        "Set this attribute to specify the length of time to store all of the tables in memory \
         that are migrated into Amazon Timestream from the source database. Time is measured in \
         units of hours. When Timestream data comes in, it first resides in memory for the \
         specified duration, which allows quick access to it.\n"]
  database_name : string_; [@ocaml.doc "Database name for the endpoint.\n"]
}
[@@ocaml.doc "Provides information that defines an Amazon Timestream endpoint.\n"]

type nonrec connection = {
  replication_instance_identifier : string_ option;
      [@ocaml.doc
        "The replication instance identifier. This parameter is stored as a lowercase string.\n"]
  endpoint_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the endpoint. Identifiers must begin with a letter and must contain \
         only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two \
         consecutive hyphens.\n"]
  last_failure_message : string_ option;
      [@ocaml.doc "The error message when the connection last failed.\n"]
  status : string_ option;
      [@ocaml.doc
        "The connection status. This parameter can return one of the following values:\n\n\
        \ {ul\n\
        \       {-   [\"successful\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"testing\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"failed\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"deleting\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  endpoint_arn : string_ option;
      [@ocaml.doc "The ARN string that uniquely identifies the endpoint.\n"]
  replication_instance_arn : string_ option; [@ocaml.doc "The ARN of the replication instance.\n"]
}
[@@ocaml.doc
  "Status of the connection between an endpoint and a replication instance, including Amazon \
   Resource Names (ARNs) and the last error message issued.\n"]

type nonrec test_connection_response = {
  connection : connection option; [@ocaml.doc "The connection tested.\n"]
}
[@@ocaml.doc "\n"]

type nonrec test_connection_message = {
  endpoint_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.\n"]
  replication_instance_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication instance.\n"]
}
[@@ocaml.doc "\n"]

type nonrec resource_quota_exceeded_fault = { message : exception_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "The quota for this resource quota has been exceeded.\n"]

type nonrec resource_not_found_fault = { message : exception_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "The resource could not be found.\n"]

type nonrec kms_key_not_accessible_fault = { message : exception_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "DMS cannot access the KMS key.\n"]

type nonrec target_db_type =
  | MULTIPLE_DATABASES [@ocaml.doc ""]
  | SPECIFIC_DATABASE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec table_preparation_mode =
  | DROP_TABLES_ON_TARGET [@ocaml.doc ""]
  | TRUNCATE [@ocaml.doc ""]
  | DO_NOTHING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_data_setting = {
  table_preparation_mode : table_preparation_mode option;
      [@ocaml.doc
        "This setting determines how DMS handles the target tables before starting a data \
         migration, either by leaving them untouched, dropping and recreating them, or truncating \
         the existing data in the target tables.\n"]
}
[@@ocaml.doc "Defines settings for a target data provider for a data migration.\n"]

type nonrec target_data_settings = target_data_setting list [@@ocaml.doc ""]

type nonrec tag = {
  resource_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) string that uniquely identifies the resource for which the \
         tag is created.\n"]
  value : string_ option;
      [@ocaml.doc
        "A value is the optional value of the tag. The string value can be 1-256 Unicode \
         characters in length and can't be prefixed with \"aws:\" or \"dms:\". The string can only \
         contain only the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', \
         '-' (Java regular expressions: \
         \"^(\\[\\\\p\\{L\\}\\\\p\\{Z\\}\\\\p\\{N\\}_.:/=+\\\\-\\]*)$\").\n"]
  key : string_ option;
      [@ocaml.doc
        "A key is the required name of the tag. The string value can be 1-128 Unicode characters \
         in length and can't be prefixed with \"aws:\" or \"dms:\". The string can only contain \
         only the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java \
         regular expressions: \"^(\\[\\\\p\\{L\\}\\\\p\\{Z\\}\\\\p\\{N\\}_.:/=+\\\\-\\]*)$\").\n"]
}
[@@ocaml.doc
  "A user-defined key-value pair that describes metadata added to an DMS resource and that is used \
   by operations such as the following:\n\n\
  \ {ul\n\
  \       {-   [AddTagsToResource] \n\
  \           \n\
  \            }\n\
  \       {-   [ListTagsForResource] \n\
  \           \n\
  \            }\n\
  \       {-   [RemoveTagsFromResource] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec table_to_reload = {
  table_name : string_; [@ocaml.doc "The table name of the table to be reloaded.\n"]
  schema_name : string_; [@ocaml.doc "The schema name of the table to be reloaded.\n"]
}
[@@ocaml.doc "Provides the name of the schema and table to be reloaded.\n"]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec long_optional = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec t_stamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec double_optional = float [@@ocaml.doc ""]

type nonrec table_statistics = {
  resync_progress : double_optional option;
      [@ocaml.doc
        "Calculates the percentage of failed validations that were successfully resynced to the \
         system.\n"]
  resync_rows_failed : long_optional option;
      [@ocaml.doc
        "Records the total number of mismatched data rows where fix attempts failed in the target \
         database.\n"]
  resync_rows_succeeded : long_optional option;
      [@ocaml.doc
        "Records the total number of mismatched data rows where fixes were successfully applied in \
         the target database.\n"]
  resync_rows_attempted : long_optional option;
      [@ocaml.doc
        "Records the total number of mismatched data rows where the system attempted to apply \
         fixes in the target database.\n"]
  resync_state : string_ option;
      [@ocaml.doc
        "Records the current state of table resynchronization in the migration task.\n\n\
        \ This parameter can have the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  Not enabled \226\128\147 Resync is not enabled for the table in the migration \
         task.\n\
        \            \n\
        \             }\n\
        \        {-  Pending \226\128\147 The tables are waiting for resync.\n\
        \            \n\
        \             }\n\
        \        {-  In progress \226\128\147 Resync in progress for some records in the table.\n\
        \            \n\
        \             }\n\
        \        {-  No primary key \226\128\147 The table could not be resynced because it has no \
         primary key.\n\
        \            \n\
        \             }\n\
        \        {-  Last resync at: [date/time] \226\128\147 Resync session is finished at time. \
         Time provided in UTC format.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  validation_state_details : string_ option;
      [@ocaml.doc "Additional details about the state of validation.\n"]
  validation_state : string_ option;
      [@ocaml.doc
        "The validation state of the table.\n\n\
        \ This parameter can have the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  Not enabled \226\128\147 Validation isn't enabled for the table in the \
         migration task.\n\
        \            \n\
        \             }\n\
        \        {-  Pending records \226\128\147 Some records in the table are waiting for \
         validation.\n\
        \            \n\
        \             }\n\
        \        {-  Mismatched records \226\128\147 Some records in the table don't match between \
         the source and target.\n\
        \            \n\
        \             }\n\
        \        {-  Suspended records \226\128\147 Some records in the table couldn't be validated.\n\
        \            \n\
        \             }\n\
        \        {-  No primary key \226\128\147The table couldn't be validated because it has no \
         primary key.\n\
        \            \n\
        \             }\n\
        \        {-  Table error \226\128\147 The table wasn't validated because it's in an error \
         state and some data wasn't migrated.\n\
        \            \n\
        \             }\n\
        \        {-  Validated \226\128\147 All rows in the table are validated. If the table is \
         updated, the status can change from Validated.\n\
        \            \n\
        \             }\n\
        \        {-  Error \226\128\147 The table couldn't be validated because of an unexpected \
         error.\n\
        \            \n\
        \             }\n\
        \        {-  Pending validation \226\128\147 The table is waiting validation.\n\
        \            \n\
        \             }\n\
        \        {-  Preparing table \226\128\147 Preparing the table enabled in the migration \
         task for validation.\n\
        \            \n\
        \             }\n\
        \        {-  Pending revalidation \226\128\147 All rows in the table are pending \
         validation after the table was updated.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  validation_suspended_records : long option;
      [@ocaml.doc "The number of records that couldn't be validated.\n"]
  validation_failed_records : long option;
      [@ocaml.doc "The number of records that failed validation.\n"]
  validation_pending_records : long option;
      [@ocaml.doc "The number of records that have yet to be validated.\n"]
  table_state : string_ option;
      [@ocaml.doc
        "The state of the tables described.\n\n\
        \ Valid states: Table does not exist | Before load | Full load | Table completed | Table \
         cancelled | Table error | Table is being reloaded\n\
        \ "]
  last_update_time : t_stamp option; [@ocaml.doc "The last time a table was updated.\n"]
  full_load_reloaded : boolean_optional option;
      [@ocaml.doc
        "A value that indicates if the table was reloaded ([true]) or loaded as part of a new full \
         load operation ([false]).\n"]
  full_load_end_time : t_stamp option;
      [@ocaml.doc "The time when the full load operation completed.\n"]
  full_load_start_time : t_stamp option;
      [@ocaml.doc "The time when the full load operation started.\n"]
  full_load_error_rows : long option;
      [@ocaml.doc
        "The number of rows that failed to load during the full load operation (valid only for \
         migrations where DynamoDB is the target).\n"]
  full_load_condtnl_chk_failed_rows : long option;
      [@ocaml.doc
        "The number of rows that failed conditional checks during the full load operation (valid \
         only for migrations where DynamoDB is the target).\n"]
  full_load_rows : long option;
      [@ocaml.doc "The number of rows added during the full load operation.\n"]
  applied_ddls : long_optional option;
      [@ocaml.doc
        "The number of data definition language (DDL) statements used to build and modify the \
         structure of your tables applied on the target.\n"]
  applied_updates : long_optional option;
      [@ocaml.doc "The number of update actions applied on a target table.\n"]
  applied_deletes : long_optional option;
      [@ocaml.doc "The number of delete actions applied on a target table.\n"]
  applied_inserts : long_optional option;
      [@ocaml.doc "The number of insert actions applied on a target table.\n"]
  ddls : long option;
      [@ocaml.doc
        "The data definition language (DDL) used to build and modify the structure of your tables.\n"]
  updates : long option; [@ocaml.doc "The number of update actions performed on a table.\n"]
  deletes : long option; [@ocaml.doc "The number of delete actions performed on a table.\n"]
  inserts : long option; [@ocaml.doc "The number of insert actions performed on a table.\n"]
  table_name : string_ option; [@ocaml.doc "The name of the table.\n"]
  schema_name : string_ option; [@ocaml.doc "The schema name.\n"]
}
[@@ocaml.doc
  "Provides a collection of table statistics in response to a request by the \
   [DescribeTableStatistics] operation.\n"]

type nonrec table_statistics_list = table_statistics list [@@ocaml.doc ""]

type nonrec table_list_to_reload = table_to_reload list [@@ocaml.doc ""]

type nonrec secret_string = string [@@ocaml.doc ""]

type nonrec sybase_settings = {
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The full ARN, partial ARN, or friendly name of the [SecretsManagerSecret] that contains \
         the SAP SAE endpoint connection details.\n"]
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted \
         entity and grants the required permissions to access the value in [SecretsManagerSecret]. \
         The role must allow the [iam:PassRole] action. [SecretsManagerSecret] has the value of \
         the Amazon Web Services Secrets Manager secret that allows access to the SAP ASE \
         endpoint.\n\n\
        \  You can specify one of two sets of values for these permissions. You can specify the \
         values for this setting and [SecretsManagerSecretId]. Or you can specify clear-text \
         values for [UserName], [Password], [ServerName], and [Port]. You can't specify both. For \
         more information on creating this [SecretsManagerSecret] and the \
         [SecretsManagerAccessRoleArn] and [SecretsManagerSecretId] required to access it, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager}Using \
         secrets to access Database Migration Service resources} in the {i Database Migration \
         Service User Guide}.\n\
        \  \n\
        \   "]
  username : string_ option; [@ocaml.doc "Endpoint connection user name.\n"]
  server_name : string_ option; [@ocaml.doc "Fully qualified domain name of the endpoint.\n"]
  port : integer_optional option; [@ocaml.doc "Endpoint TCP port. The default is 5000.\n"]
  password : secret_string option; [@ocaml.doc "Endpoint connection password.\n"]
  database_name : string_ option; [@ocaml.doc "Database name for the endpoint.\n"]
}
[@@ocaml.doc "Provides information that defines a SAP ASE endpoint.\n"]

type nonrec dms_ssl_mode_value =
  | VERIFY_FULL [@ocaml.doc ""]
  | VERIFY_CA [@ocaml.doc ""]
  | REQUIRE [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sybase_ase_data_provider_settings = {
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate used for SSL connection.\n"]
  encrypt_password : boolean_optional option;
      [@ocaml.doc
        "Specifies whether to encrypt the password when connecting to the Sybase ASE database. \
         When set to true, the connection password is encrypted during transmission. Default is \
         true.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc
        "The SSL mode used to connect to the SAP ASE data provider. The default value is [none].\n"]
  database_name : string_ option; [@ocaml.doc "The database name on the SAP ASE data provider.\n"]
  port : integer_optional option; [@ocaml.doc "The port value for the SAP ASE data provider.\n"]
  server_name : string_ option; [@ocaml.doc "The name of the SAP ASE server.\n"]
}
[@@ocaml.doc "Provides information that defines an SAP ASE data provider.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec replication_endpoint_type_value = TARGET [@ocaml.doc ""] | SOURCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec supported_endpoint_type = {
  engine_display_name : string_ option;
      [@ocaml.doc
        "The expanded name for the engine name. For example, if the [EngineName] parameter is \
         \"aurora\", this value would be \"Amazon Aurora MySQL\".\n"]
  replication_instance_engine_minimum_version : string_ option;
      [@ocaml.doc
        "The earliest DMS engine version that supports this endpoint engine. Note that endpoint \
         engines released with DMS versions earlier than 3.1.1 do not return a value for this \
         parameter.\n"]
  endpoint_type : replication_endpoint_type_value option;
      [@ocaml.doc "The type of endpoint. Valid values are [source] and [target].\n"]
  supports_cd_c : boolean_ option;
      [@ocaml.doc "Indicates if change data capture (CDC) is supported.\n"]
  engine_name : string_ option;
      [@ocaml.doc
        "The database engine name. Valid values, depending on the EndpointType, include \
         [\"mysql\"], [\"oracle\"], [\"postgres\"], [\"mariadb\"], [\"aurora\"], \
         [\"aurora-postgresql\"], [\"redshift\"], [\"s3\"], [\"db2\"], [\"db2-zos\"], \
         [\"azuredb\"], [\"sybase\"], [\"dynamodb\"], [\"mongodb\"], [\"kinesis\"], [\"kafka\"], \
         [\"elasticsearch\"], [\"documentdb\"], [\"sqlserver\"], [\"neptune\"], and \
         [\"babelfish\"].\n"]
}
[@@ocaml.doc
  "Provides information about types of supported endpoints in response to a request by the \
   [DescribeEndpointTypes] operation. This information includes the type of endpoint, the database \
   engine name, and whether change data capture (CDC) is supported.\n"]

type nonrec supported_endpoint_type_list = supported_endpoint_type list [@@ocaml.doc ""]

type nonrec availability_zone = {
  name : string_ option; [@ocaml.doc "The name of the Availability Zone.\n"]
}
[@@ocaml.doc
  "The name of an Availability Zone for use during database migration. [AvailabilityZone] is an \
   optional parameter to the \
   {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_CreateReplicationInstance.html} \
   [CreateReplicationInstance] } operation, and it\226\128\153s value relates to the Amazon Web \
   Services Region of an endpoint. For example, the availability zone of an endpoint in the \
   us-east-1 region might be us-east-1a, us-east-1b, us-east-1c, or us-east-1d.\n"]

type nonrec subnet = {
  subnet_status : string_ option; [@ocaml.doc "The status of the subnet.\n"]
  subnet_availability_zone : availability_zone option;
      [@ocaml.doc "The Availability Zone of the subnet.\n"]
  subnet_identifier : string_ option; [@ocaml.doc "The subnet identifier.\n"]
}
[@@ocaml.doc
  "In response to a request by the [DescribeReplicationSubnetGroups] operation, this object \
   identifies a subnet by its given Availability Zone, subnet identifier, and status.\n"]

type nonrec subnet_list = subnet list [@@ocaml.doc ""]

type nonrec subnet_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec subnet_already_in_use = { message : exception_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "The specified subnet is already in use.\n"]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec storage_quota_exceeded_fault = { message : exception_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "The storage quota has been exceeded.\n"]

type nonrec migration_type_value =
  | FULL_LOAD_AND_CDC [@ocaml.doc ""]
  | CDC [@ocaml.doc ""]
  | FULL_LOAD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec replication_task_stats = {
  full_load_finish_date : t_stamp option;
      [@ocaml.doc "The date the replication task full load was completed.\n"]
  full_load_start_date : t_stamp option;
      [@ocaml.doc "The date the replication task full load was started.\n"]
  stop_date : t_stamp option; [@ocaml.doc "The date the replication task was stopped.\n"]
  start_date : t_stamp option;
      [@ocaml.doc
        "The date the replication task was started either with a fresh start or a resume. For more \
         information, see \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html#DMS-StartReplicationTask-request-StartReplicationTaskType}StartReplicationTaskType}.\n"]
  fresh_start_date : t_stamp option;
      [@ocaml.doc
        "The date the replication task was started either with a fresh start or a target reload.\n"]
  tables_errored : integer option;
      [@ocaml.doc "The number of errors that have occurred during this task.\n"]
  tables_queued : integer option; [@ocaml.doc "The number of tables queued for this task.\n"]
  tables_loading : integer option;
      [@ocaml.doc "The number of tables currently loading for this task.\n"]
  tables_loaded : integer option; [@ocaml.doc "The number of tables loaded for this task.\n"]
  elapsed_time_millis : long option; [@ocaml.doc "The elapsed time of the task, in milliseconds.\n"]
  full_load_progress_percent : integer option;
      [@ocaml.doc "The percent complete for the full load migration task.\n"]
}
[@@ocaml.doc
  "In response to a request by the [DescribeReplicationTasks] operation, this object provides a \
   collection of statistics about a replication task.\n"]

type nonrec replication_task = {
  target_replication_instance_arn : string_ option;
      [@ocaml.doc
        "The ARN of the replication instance to which this task is moved in response to running \
         the {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_MoveReplicationTask.html} \
         [MoveReplicationTask] } operation. Otherwise, this response parameter isn't a member of \
         the [ReplicationTask] object.\n"]
  task_data : string_ option;
      [@ocaml.doc
        "Supplemental information that the task requires to migrate the data for certain source \
         and target endpoints. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.TaskData.html}Specifying \
         Supplemental Data for Task Settings} in the {i Database Migration Service User Guide.} \n"]
  replication_task_stats : replication_task_stats option;
      [@ocaml.doc
        "The statistics for the task, including elapsed time, tables loaded, and table errors.\n"]
  replication_task_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication task.\n"]
  recovery_checkpoint : string_ option;
      [@ocaml.doc
        "Indicates the last checkpoint that occurred during a change data capture (CDC) operation. \
         You can provide this value to the [CdcStartPosition] parameter to start a CDC operation \
         that begins at that checkpoint.\n"]
  cdc_stop_position : string_ option;
      [@ocaml.doc
        "Indicates when you want a change data capture (CDC) operation to stop. The value can be \
         either server time or commit time.\n\n\
        \ Server time example: --cdc-stop-position \
         \226\128\156server_time:2018-02-09T12:12:12\226\128\157\n\
        \ \n\
        \  Commit time example: --cdc-stop-position \
         \226\128\156commit_time:2018-02-09T12:12:12\226\128\156\n\
        \  "]
  cdc_start_position : string_ option;
      [@ocaml.doc
        "Indicates when you want a change data capture (CDC) operation to start. Use either \
         [CdcStartPosition] or [CdcStartTime] to specify when you want the CDC operation to start. \
         Specifying both values results in an error.\n\n\
        \ The value can be in date, checkpoint, or LSN/SCN format.\n\
        \ \n\
        \  Date Example: --cdc-start-position \226\128\1562018-03-08T12:12:12\226\128\157\n\
        \  \n\
        \   Checkpoint Example: --cdc-start-position \
         \"checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93\"\n\
        \   \n\
        \    LSN Example: --cdc-start-position \
         \226\128\156mysql-bin-changelog.000024:373\226\128\157\n\
        \    "]
  replication_task_start_date : t_stamp option;
      [@ocaml.doc "The date the replication task is scheduled to start.\n"]
  replication_task_creation_date : t_stamp option;
      [@ocaml.doc "The date the replication task was created.\n"]
  stop_reason : string_ option;
      [@ocaml.doc
        "The reason the replication task was stopped. This response parameter can return one of \
         the following values:\n\n\
        \ {ul\n\
        \       {-   [\"Stop Reason NORMAL\"] \226\128\147 The task completed successfully with no \
         additional information returned.\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason RECOVERABLE_ERROR\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason FATAL_ERROR\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason FULL_LOAD_ONLY_FINISHED\"] \226\128\147 The task completed the \
         full load phase. DMS applied cached changes if you set [StopTaskCachedChangesApplied] to \
         [true].\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_AFTER_FULL_LOAD\"] \226\128\147 Full load completed, \
         with cached changes not applied\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_AFTER_CACHED_EVENTS\"] \226\128\147 Full load \
         completed, with cached changes applied\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason EXPRESS_LICENSE_LIMITS_REACHED\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_AFTER_DDL_APPLY\"] \226\128\147 User-defined stop task \
         after DDL applied\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_DUE_TO_LOW_MEMORY\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_DUE_TO_LOW_DISK\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_AT_SERVER_TIME\"] \226\128\147 User-defined server \
         time for stopping task\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_AT_COMMIT_TIME\"] \226\128\147 User-defined commit \
         time for stopping task\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason RECONFIGURATION_RESTART\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason RECYCLE_TASK\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  last_failure_message : string_ option;
      [@ocaml.doc "The last error (failure) message generated for the replication task.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the replication task. This response parameter can return one of the \
         following values:\n\n\
        \ {ul\n\
        \       {-   [\"moving\"] \226\128\147 The task is being moved in response to running the \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_MoveReplicationTask.html} \
         [MoveReplicationTask] } operation.\n\
        \           \n\
        \            }\n\
        \       {-   [\"creating\"] \226\128\147 The task is being created in response to running \
         the \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_CreateReplicationTask.html} \
         [CreateReplicationTask] } operation.\n\
        \           \n\
        \            }\n\
        \       {-   [\"deleting\"] \226\128\147 The task is being deleted in response to running \
         the \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_DeleteReplicationTask.html} \
         [DeleteReplicationTask] } operation.\n\
        \           \n\
        \            }\n\
        \       {-   [\"failed\"] \226\128\147 The task failed to successfully complete the \
         database migration in response to running the \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html} \
         [StartReplicationTask] } operation.\n\
        \           \n\
        \            }\n\
        \       {-   [\"failed-move\"] \226\128\147 The task failed to move in response to running \
         the {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_MoveReplicationTask.html} \
         [MoveReplicationTask] } operation.\n\
        \           \n\
        \            }\n\
        \       {-   [\"modifying\"] \226\128\147 The task definition is being modified in \
         response to running the \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_ModifyReplicationTask.html} \
         [ModifyReplicationTask] } operation.\n\
        \           \n\
        \            }\n\
        \       {-   [\"ready\"] \226\128\147 The task is in a [ready] state where it can respond \
         to other task operations, such as \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html} \
         [StartReplicationTask] } or \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_DeleteReplicationTask.html} \
         [DeleteReplicationTask] }. \n\
        \           \n\
        \            }\n\
        \       {-   [\"running\"] \226\128\147 The task is performing a database migration in \
         response to running the \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html} \
         [StartReplicationTask] } operation.\n\
        \           \n\
        \            }\n\
        \       {-   [\"starting\"] \226\128\147 The task is preparing to perform a database \
         migration in response to running the \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html} \
         [StartReplicationTask] } operation.\n\
        \           \n\
        \            }\n\
        \       {-   [\"stopped\"] \226\128\147 The task has stopped in response to running the \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StopReplicationTask.html} \
         [StopReplicationTask] } operation.\n\
        \           \n\
        \            }\n\
        \       {-   [\"stopping\"] \226\128\147 The task is preparing to stop in response to \
         running the \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StopReplicationTask.html} \
         [StopReplicationTask] } operation.\n\
        \           \n\
        \            }\n\
        \       {-   [\"testing\"] \226\128\147 The database migration specified for this task is \
         being tested in response to running either the \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTaskAssessmentRun.html} \
         [StartReplicationTaskAssessmentRun] } or the \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTaskAssessment.html} \
         [StartReplicationTaskAssessment] } operation.\n\
        \           \n\
        \              \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTaskAssessmentRun.html} \
         [StartReplicationTaskAssessmentRun] } is an improved premigration task assessment \
         operation. The \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTaskAssessment.html} \
         [StartReplicationTaskAssessment] } operation assesses data type compatibility only \
         between the source and target database of a given migration task. In contrast, \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTaskAssessmentRun.html} \
         [StartReplicationTaskAssessmentRun] } enables you to specify a variety of premigration \
         task assessments in addition to data type compatibility. These assessments include ones \
         for the validity of primary key definitions and likely issues with database migration \
         performance, among others.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
  replication_task_settings : string_ option;
      [@ocaml.doc "The settings for the replication task.\n"]
  table_mappings : string_ option; [@ocaml.doc "Table mappings specified in the task.\n"]
  migration_type : migration_type_value option; [@ocaml.doc "The type of migration.\n"]
  replication_instance_arn : string_ option; [@ocaml.doc "The ARN of the replication instance.\n"]
  target_endpoint_arn : string_ option;
      [@ocaml.doc "The ARN that uniquely identifies the endpoint.\n"]
  source_endpoint_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that uniquely identifies the endpoint.\n"]
  replication_task_identifier : string_ option;
      [@ocaml.doc
        "The user-assigned replication task identifier or name.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain 1-255 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Provides information that describes a replication task created by the [CreateReplicationTask] \
   operation.\n"]

type nonrec stop_replication_task_response = {
  replication_task : replication_task option; [@ocaml.doc "The replication task stopped.\n"]
}
[@@ocaml.doc "\n"]

type nonrec stop_replication_task_message = {
  replication_task_arn : string_;
      [@ocaml.doc "The Amazon Resource Name(ARN) of the replication task to be stopped.\n"]
}
[@@ocaml.doc "\n"]

type nonrec provision_data = {
  reason_for_new_provisioning_data : string_ option;
      [@ocaml.doc
        "A message describing the reason that DMS provisioned new resources for the serverless \
         replication.\n"]
  date_new_provisioning_data_available : t_stamp option;
      [@ocaml.doc "The timestamp when provisioning became available.\n"]
  is_new_provisioning_available : boolean_ option;
      [@ocaml.doc "Whether the new provisioning is available to the replication.\n"]
  date_provisioned : t_stamp option;
      [@ocaml.doc "The timestamp when DMS provisioned replication resources.\n"]
  provisioned_capacity_units : integer option;
      [@ocaml.doc "The number of capacity units the replication is using.\n"]
  provision_state : string_ option; [@ocaml.doc "The current provisioning state \n"]
}
[@@ocaml.doc "Information about provisioning resources for an DMS serverless replication.\n"]

type nonrec replication_task_assessment_run_progress = {
  individual_assessment_completed_count : integer option;
      [@ocaml.doc
        "The number of individual assessments that have completed, successfully or not.\n"]
  individual_assessment_count : integer option;
      [@ocaml.doc "The number of individual assessments that are specified to run.\n"]
}
[@@ocaml.doc "The progress values reported by the [AssessmentProgress] response element.\n"]

type nonrec replication_task_assessment_run_result_statistic = {
  skipped : integer option;
      [@ocaml.doc
        "The number of individual assessments that were skipped during the assessment run.\n"]
  cancelled : integer option;
      [@ocaml.doc
        " The number of individual assessments that were cancelled during the assessment run. \n"]
  warning : integer option;
      [@ocaml.doc "Indicates that the recent completed AssessmentRun triggered a warning.\n"]
  error : integer option;
      [@ocaml.doc
        "The number of individual assessments that encountered a critical error and could not \
         complete properly.\n"]
  failed : integer option;
      [@ocaml.doc
        "The number of individual assessments that failed to meet the criteria defined in the \
         assessment run.\n"]
  passed : integer option;
      [@ocaml.doc
        "The number of individual assessments that successfully passed all checks in the \
         assessment run.\n"]
}
[@@ocaml.doc "The object containing the result statistics for a completed assessment run.\n"]

type nonrec premigration_assessment_status = {
  result_statistic : replication_task_assessment_run_result_statistic option; [@ocaml.doc ""]
  result_kms_key_arn : string_ option;
      [@ocaml.doc
        "The ARN of a custom KMS encryption key that you specify when you set \
         [ResultEncryptionMode] to [SSE_KMS].\n"]
  result_encryption_mode : string_ option;
      [@ocaml.doc
        "The supported values are [SSE_KMS] and [SSE_S3]. If these values are not provided, then \
         the files are not encrypted at rest. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.KMSKeys}Creating \
         Amazon Web Services KMS keys to encrypt Amazon S3 target objects}.\n"]
  result_location_folder : string_ option;
      [@ocaml.doc
        "The folder within an Amazon S3 bucket where you want Database Migration Service to store \
         the results of this assessment run.\n"]
  result_location_bucket : string_ option;
      [@ocaml.doc
        "The Amazon S3 bucket that Database Migration Service Serverless created to store the \
         results of this assessment run.\n"]
  last_failure_message : string_ option;
      [@ocaml.doc "The last message generated by an individual assessment failure.\n"]
  assessment_progress : replication_task_assessment_run_progress option; [@ocaml.doc ""]
  premigration_assessment_run_creation_date : t_stamp option;
      [@ocaml.doc "The date which the assessment run was created.\n"]
  status : string_ option;
      [@ocaml.doc
        "This describes the assessment run status. The status can be one of the following values:\n\n\
        \ {ul\n\
        \       {-   [cancelling]: The assessment run was canceled.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: The assessment run was deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [failed]: At least one individual assessment completed with a failed status. \n\
        \           \n\
        \            }\n\
        \       {-   [error-provisioning]: An internal error occurred while resources were \
         provisioned (during the [provisioning] status).\n\
        \           \n\
        \            }\n\
        \       {-   [error-executing] An internal error occurred while individual assessments ran \
         (during the [running] status).\n\
        \           \n\
        \            }\n\
        \       {-   [invalid state]: The assessment run is in an unknown state. \n\
        \           \n\
        \            }\n\
        \       {-   [passed]: All individual assessments have completed and none have a failed \
         status.\n\
        \           \n\
        \            }\n\
        \       {-   [provisioning]: The resources required to run individual assessments are \
         being provisioned. \n\
        \           \n\
        \            }\n\
        \       {-   [running]: Individual assessments are being run. \n\
        \           \n\
        \            }\n\
        \       {-   [starting]: The assessment run is starting, but resources are not yet being \
         provisioned for individual assessments. \n\
        \           \n\
        \            }\n\
        \       {-   [warning]: At least one individual assessment completed with a warning status. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  fail_on_assessment_failure : boolean_ option;
      [@ocaml.doc
        "A configurable setting you can set to [true] (the defualt setting) or [false]. Use this \
         setting to to stop the replication from starting automatically if the assessment fails. \
         This can help you evaluate the issue that is preventing the replication from running \
         successfully.\n"]
  premigration_assessment_run_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of this assessment run.\n"]
}
[@@ocaml.doc
  "The results returned in [describe-replications] to display the results of the premigration \
   assessment from the replication configuration.\n"]

type nonrec premigration_assessment_status_list = premigration_assessment_status list
[@@ocaml.doc ""]

type nonrec replication_stats = {
  full_load_finish_date : t_stamp option;
      [@ocaml.doc "The date the replication full load was finished.\n"]
  full_load_start_date : t_stamp option;
      [@ocaml.doc "The date the replication full load was started.\n"]
  stop_date : t_stamp option; [@ocaml.doc "The date the replication was stopped.\n"]
  start_date : t_stamp option; [@ocaml.doc "The date the replication is scheduled to start.\n"]
  fresh_start_date : t_stamp option;
      [@ocaml.doc
        "The date the replication was started either with a fresh start or a target reload.\n"]
  tables_errored : integer option;
      [@ocaml.doc "The number of errors that have occured for this replication.\n"]
  tables_queued : integer option; [@ocaml.doc "The number of tables queued for this replication.\n"]
  tables_loading : integer option;
      [@ocaml.doc "The number of tables currently loading for this replication.\n"]
  tables_loaded : integer option; [@ocaml.doc "The number of tables loaded for this replication.\n"]
  elapsed_time_millis : long option;
      [@ocaml.doc "The elapsed time of the replication, in milliseconds.\n"]
  full_load_progress_percent : integer option;
      [@ocaml.doc "The percent complete for the full load serverless replication.\n"]
}
[@@ocaml.doc "This object provides a collection of statistics about a serverless replication.\n"]

type nonrec replication = {
  is_read_only : boolean_optional option;
      [@ocaml.doc
        "Indicates whether the serverless replication is read-only. When set to [true], this \
         replication is managed by DMS as part of a zero-ETL integration and cannot be modified or \
         deleted directly. You can only modify or delete read-only replications through their \
         associated zero-ETL integration.\n"]
  replication_deprovision_time : t_stamp option;
      [@ocaml.doc "The timestamp when DMS will deprovision the replication.\n"]
  replication_last_stop_time : t_stamp option;
      [@ocaml.doc "The timestamp when replication was last stopped.\n"]
  replication_update_time : t_stamp option;
      [@ocaml.doc "The time the serverless replication was updated.\n"]
  replication_create_time : t_stamp option;
      [@ocaml.doc "The time the serverless replication was created.\n"]
  recovery_checkpoint : string_ option;
      [@ocaml.doc
        "Indicates the last checkpoint that occurred during a change data capture (CDC) operation. \
         You can provide this value to the [CdcStartPosition] parameter to start a CDC operation \
         that begins at that checkpoint.\n"]
  cdc_stop_position : string_ option;
      [@ocaml.doc
        "Indicates when you want a change data capture (CDC) operation to stop. The value can be \
         either server time or commit time.\n"]
  cdc_start_position : string_ option;
      [@ocaml.doc
        "Indicates the start time for a change data capture (CDC) operation. Use either \
         [CdcStartTime] or [CdcStartPosition] to specify when you want a CDC operation to start. \
         Specifying both values results in an error.\n"]
  cdc_start_time : t_stamp option;
      [@ocaml.doc
        "Indicates the start time for a change data capture (CDC) operation. Use either \
         [CdcStartTime] or [CdcStartPosition] to specify when you want a CDC operation to start. \
         Specifying both values results in an error.\n"]
  start_replication_type : string_ option; [@ocaml.doc "The type of replication to start.\n"]
  replication_stats : replication_stats option;
      [@ocaml.doc
        "This object provides a collection of statistics about a serverless replication.\n"]
  failure_messages : string_list option;
      [@ocaml.doc "Error and other information about why a serverless replication failed.\n"]
  stop_reason : string_ option;
      [@ocaml.doc
        "The reason the replication task was stopped. This response parameter can return one of \
         the following values:\n\n\
        \ {ul\n\
        \       {-   [\"Stop Reason NORMAL\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason RECOVERABLE_ERROR\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason FATAL_ERROR\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason FULL_LOAD_ONLY_FINISHED\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_AFTER_FULL_LOAD\"] \226\128\147 Full load completed, \
         with cached changes not applied\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_AFTER_CACHED_EVENTS\"] \226\128\147 Full load \
         completed, with cached changes applied\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason EXPRESS_LICENSE_LIMITS_REACHED\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_AFTER_DDL_APPLY\"] \226\128\147 User-defined stop task \
         after DDL applied\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_DUE_TO_LOW_MEMORY\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_DUE_TO_LOW_DISK\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_AT_SERVER_TIME\"] \226\128\147 User-defined server \
         time for stopping task\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason STOPPED_AT_COMMIT_TIME\"] \226\128\147 User-defined commit \
         time for stopping task\n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason RECONFIGURATION_RESTART\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"Stop Reason RECYCLE_TASK\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  premigration_assessment_statuses : premigration_assessment_status_list option;
      [@ocaml.doc "The status output of premigration assessment in describe-replications.\n"]
  provision_data : provision_data option;
      [@ocaml.doc "Information about provisioning resources for an DMS serverless replication.\n"]
  status : string_ option; [@ocaml.doc "The current status of the serverless replication.\n"]
  replication_type : migration_type_value option;
      [@ocaml.doc "The type of the serverless replication.\n"]
  target_endpoint_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name for an existing [Endpoint] the serverless replication uses for \
         its data target.\n"]
  source_endpoint_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name for an existing [Endpoint] the serverless replication uses for \
         its data source.\n"]
  replication_config_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name for the [ReplicationConfig] associated with the replication.\n"]
  replication_config_identifier : string_ option;
      [@ocaml.doc "The identifier for the [ReplicationConfig] associated with the replication.\n"]
}
[@@ocaml.doc
  "Provides information that describes a serverless replication created by the [CreateReplication] \
   operation.\n"]

type nonrec stop_replication_response = {
  replication : replication option; [@ocaml.doc "The replication that DMS stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_replication_message = {
  replication_config_arn : string_;
      [@ocaml.doc "The Amazon Resource Name of the replication to stop.\n"]
}
[@@ocaml.doc "\n"]

type nonrec iso8601_date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec data_migration_settings = {
  selection_rules : secret_string option;
      [@ocaml.doc
        "A JSON-formatted string that defines what objects to include and exclude from the \
         migration.\n"]
  cloudwatch_logs_enabled : boolean_optional option;
      [@ocaml.doc "Whether to enable CloudWatch logging for the data migration.\n"]
  number_of_jobs : integer_optional option;
      [@ocaml.doc
        "The number of parallel jobs that trigger parallel threads to unload the tables from the \
         source, and then load them to the target.\n"]
}
[@@ocaml.doc
  "Options for configuring a data migration, including whether to enable CloudWatch logs, and the \
   selection rules to use to include or exclude database objects from the migration.\n"]

type nonrec source_data_setting = {
  slot_name : string_ option;
      [@ocaml.doc
        "The name of the replication slot on the source data provider. This attribute is only \
         valid for a PostgreSQL or Aurora PostgreSQL source.\n"]
  cdc_stop_time : iso8601_date_time option;
      [@ocaml.doc "The change data capture (CDC) stop time for the source data provider.\n"]
  cdc_start_time : iso8601_date_time option;
      [@ocaml.doc "The change data capture (CDC) start time for the source data provider.\n"]
  cdc_start_position : string_ option;
      [@ocaml.doc "The change data capture (CDC) start position for the source data provider.\n"]
}
[@@ocaml.doc "Defines settings for a source data provider for a data migration.\n"]

type nonrec source_data_settings = source_data_setting list [@@ocaml.doc ""]

type nonrec data_migration_statistics = {
  stop_time : iso8601_date_time option;
      [@ocaml.doc "The time when the migration stopped or failed.\n"]
  start_time : iso8601_date_time option; [@ocaml.doc "The time when the migration started.\n"]
  tables_errored : integer option; [@ocaml.doc "The number of tables that DMS failed to process.\n"]
  tables_queued : integer option;
      [@ocaml.doc "The number of tables that are waiting for processing.\n"]
  cdc_latency : integer option;
      [@ocaml.doc "The current latency of the change data capture (CDC) operation.\n"]
  full_load_percentage : integer option;
      [@ocaml.doc "The data migration's progress in the full-load migration phase.\n"]
  tables_loading : integer option; [@ocaml.doc "The data migration's table loading progress.\n"]
  elapsed_time_millis : long option;
      [@ocaml.doc "The elapsed duration of the data migration run.\n"]
  tables_loaded : integer option;
      [@ocaml.doc "The number of tables loaded in the current data migration run.\n"]
}
[@@ocaml.doc
  "Information about the data migration run, including start and stop time, latency, and migration \
   progress.\n"]

type nonrec public_ip_address_list = string_ list [@@ocaml.doc ""]

type nonrec data_migration_cidr_block = string_ list [@@ocaml.doc ""]

type nonrec data_migration = {
  stop_reason : string_ option; [@ocaml.doc "The reason the data migration last stopped.\n"]
  last_failure_message : string_ option;
      [@ocaml.doc "Information about the data migration's most recent error or failure.\n"]
  data_migration_cidr_blocks : data_migration_cidr_block option;
      [@ocaml.doc "The CIDR blocks of the endpoints for the data migration.\n"]
  public_ip_addresses : public_ip_address_list option;
      [@ocaml.doc "The IP addresses of the endpoints for the data migration.\n"]
  data_migration_status : string_ option;
      [@ocaml.doc "The current status of the data migration. \n"]
  data_migration_statistics : data_migration_statistics option;
      [@ocaml.doc
        "Provides information about the data migration's run, including start and stop time, \
         latency, and data migration progress.\n"]
  target_data_settings : target_data_settings option;
      [@ocaml.doc "Specifies information about the data migration's target data provider.\n"]
  source_data_settings : source_data_settings option;
      [@ocaml.doc "Specifies information about the data migration's source data provider.\n"]
  data_migration_settings : data_migration_settings option;
      [@ocaml.doc "Specifies CloudWatch settings and selection rules for the data migration.\n"]
  data_migration_type : migration_type_value option;
      [@ocaml.doc
        "Specifies whether the data migration is full-load only, change data capture (CDC) only, \
         or full-load and CDC.\n"]
  migration_project_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the data migration's associated migration project.\n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        "The IAM role that the data migration uses to access Amazon Web Services resources.\n"]
  data_migration_end_time : iso8601_date_time option;
      [@ocaml.doc "The UTC time when data migration ended.\n"]
  data_migration_start_time : iso8601_date_time option;
      [@ocaml.doc "The UTC time when DMS started the data migration.\n"]
  data_migration_create_time : iso8601_date_time option;
      [@ocaml.doc "The UTC time when DMS created the data migration.\n"]
  data_migration_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies this replication.\n"]
  data_migration_name : string_ option;
      [@ocaml.doc "The user-friendly name for the data migration.\n"]
}
[@@ocaml.doc "This object provides information about a DMS data migration.\n"]

type nonrec stop_data_migration_response = {
  data_migration : data_migration option; [@ocaml.doc "The data migration that DMS stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_data_migration_message = {
  data_migration_identifier : string_;
      [@ocaml.doc "The identifier (name or ARN) of the data migration to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec failed_dependency_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A dependency threw an exception.\n"]

type nonrec statement_properties = {
  definition : string_; [@ocaml.doc "The SQL text of the statement.\n"]
}
[@@ocaml.doc "The properties of the statement for metadata model creation.\n"]

type nonrec start_replication_task_type_value =
  | RELOAD_TARGET [@ocaml.doc ""]
  | RESUME_PROCESSING [@ocaml.doc ""]
  | START_REPLICATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec start_replication_task_response = {
  replication_task : replication_task option; [@ocaml.doc "The replication task started.\n"]
}
[@@ocaml.doc "\n"]

type nonrec start_replication_task_message = {
  cdc_stop_position : string_ option;
      [@ocaml.doc
        "Indicates when you want a change data capture (CDC) operation to stop. The value can be \
         either server time or commit time.\n\n\
        \ Server time example: --cdc-stop-position \
         \226\128\156server_time:2018-02-09T12:12:12\226\128\157\n\
        \ \n\
        \  Commit time example: --cdc-stop-position \
         \226\128\156commit_time:2018-02-09T12:12:12\226\128\156\n\
        \  "]
  cdc_start_position : string_ option;
      [@ocaml.doc
        "Indicates when you want a change data capture (CDC) operation to start. Use either \
         CdcStartPosition or CdcStartTime to specify when you want a CDC operation to start. \
         Specifying both values results in an error.\n\n\
        \  The value can be in date, checkpoint, or LSN/SCN format.\n\
        \ \n\
        \  Date Example: --cdc-start-position \226\128\1562018-03-08T12:12:12\226\128\157\n\
        \  \n\
        \   Checkpoint Example: --cdc-start-position \
         \"checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93\"\n\
        \   \n\
        \    LSN Example: --cdc-start-position \
         \226\128\156mysql-bin-changelog.000024:373\226\128\157\n\
        \    \n\
        \      When you use this task setting with a source PostgreSQL database, a logical \
         replication slot should already be created and associated with the source endpoint. You \
         can verify this by setting the [slotName] extra connection attribute to the name of this \
         logical replication slot. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html#CHAP_Source.PostgreSQL.ConnectionAttrib}Extra \
         Connection Attributes When Using PostgreSQL as a Source for DMS}.\n\
        \      \n\
        \       "]
  cdc_start_time : t_stamp option;
      [@ocaml.doc
        "Indicates the start time for a change data capture (CDC) operation. Use either \
         CdcStartTime or CdcStartPosition to specify when you want a CDC operation to start. \
         Specifying both values results in an error.\n\n\
        \ Timestamp Example: --cdc-start-time \226\128\1562018-03-08T12:12:12\226\128\157\n\
        \ "]
  start_replication_task_type : start_replication_task_type_value;
      [@ocaml.doc
        "The type of replication task to start.\n\n\
        \  [start-replication] is the only valid action that can be used for the first time a task \
         with the migration type of [full-load]full-load, [full-load-and-cdc] or [cdc] is run. Any \
         other action used for the first time on a given task, such as [resume-processing] and \
         reload-target will result in data errors.\n\
        \ \n\
        \  You can also use [ReloadTables] to reload specific tables that failed during migration \
         instead of restarting the task.\n\
        \  \n\
        \   For a [full-load] task, the resume-processing option will reload any tables that were \
         partially loaded or not yet loaded during the full load phase.\n\
        \   \n\
        \    For a [full-load-and-cdc] task, DMS migrates table data, and then applies data \
         changes that occur on the source. To load all the tables again, and start capturing \
         source changes, use [reload-target]. Otherwise use [resume-processing], to replicate the \
         changes from the last stop position.\n\
        \    \n\
        \     For a [cdc] only task, to start from a specific position, you must use \
         start-replication and also specify the start position. Check the source endpoint DMS \
         documentation for any limitations. For example, not all sources support starting from a \
         time.\n\
        \     \n\
        \        [resume-processing] is only available for previously executed tasks.\n\
        \       \n\
        \        "]
  replication_task_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication task to be started.\n"]
}
[@@ocaml.doc "\n"]

type nonrec replication_task_assessment_run = {
  result_statistic : replication_task_assessment_run_result_statistic option;
      [@ocaml.doc
        " Result statistics for a completed assessment run, showing aggregated statistics of \
         IndividualAssessments for how many assessments were passed, failed, or encountered issues \
         such as errors or warnings. \n"]
  is_latest_task_assessment_run : boolean_ option;
      [@ocaml.doc
        "Indicates that the following PreflightAssessmentRun is the latest for the \
         ReplicationTask. The status is either true or false.\n"]
  assessment_run_name : string_ option; [@ocaml.doc "Unique name of the assessment run.\n"]
  result_kms_key_arn : string_ option;
      [@ocaml.doc "ARN of the KMS encryption key used to encrypt the assessment run results.\n"]
  result_encryption_mode : string_ option;
      [@ocaml.doc "Encryption mode used to encrypt the assessment run results.\n"]
  result_location_folder : string_ option;
      [@ocaml.doc
        "Folder in an Amazon S3 bucket where DMS stores the results of this assessment run.\n"]
  result_location_bucket : string_ option;
      [@ocaml.doc "Amazon S3 bucket where DMS stores the results of this assessment run.\n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        "ARN of the service role used to start the assessment run using the \
         [StartReplicationTaskAssessmentRun] operation. The role must allow the [iam:PassRole] \
         action.\n"]
  last_failure_message : string_ option;
      [@ocaml.doc "Last message generated by an individual assessment failure.\n"]
  assessment_progress : replication_task_assessment_run_progress option;
      [@ocaml.doc
        "Indication of the completion progress for the individual assessments specified to run.\n"]
  replication_task_assessment_run_creation_date : t_stamp option;
      [@ocaml.doc
        "Date on which the assessment run was created using the \
         [StartReplicationTaskAssessmentRun] operation.\n"]
  status : string_ option;
      [@ocaml.doc
        "Assessment run status. \n\n\
        \ This status can have one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [\"cancelling\"] \226\128\147 The assessment run was canceled by the \
         [CancelReplicationTaskAssessmentRun] operation.\n\
        \            \n\
        \             }\n\
        \        {-   [\"deleting\"] \226\128\147 The assessment run was deleted by the \
         [DeleteReplicationTaskAssessmentRun] operation.\n\
        \            \n\
        \             }\n\
        \        {-   [\"failed\"] \226\128\147 At least one individual assessment completed with \
         a [failed] status.\n\
        \            \n\
        \             }\n\
        \        {-   [\"error-provisioning\"] \226\128\147 An internal error occurred while \
         resources were provisioned (during [provisioning] status).\n\
        \            \n\
        \             }\n\
        \        {-   [\"error-executing\"] \226\128\147 An internal error occurred while \
         individual assessments ran (during [running] status).\n\
        \            \n\
        \             }\n\
        \        {-   [\"invalid state\"] \226\128\147 The assessment run is in an unknown state.\n\
        \            \n\
        \             }\n\
        \        {-   [\"passed\"] \226\128\147 All individual assessments have completed, and \
         none has a [failed] status.\n\
        \            \n\
        \             }\n\
        \        {-   [\"provisioning\"] \226\128\147 Resources required to run individual \
         assessments are being provisioned.\n\
        \            \n\
        \             }\n\
        \        {-   [\"running\"] \226\128\147 Individual assessments are being run.\n\
        \            \n\
        \             }\n\
        \        {-   [\"starting\"] \226\128\147 The assessment run is starting, but resources \
         are not yet being provisioned for individual assessments.\n\
        \            \n\
        \             }\n\
        \        {-   [\"warning\"] \226\128\147 At least one individual assessment completed with \
         a [warning] status or all individual assessments were skipped (completed with a [skipped] \
         status).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  replication_task_arn : string_ option;
      [@ocaml.doc "ARN of the migration task associated with this premigration assessment run.\n"]
  replication_task_assessment_run_arn : string_ option;
      [@ocaml.doc "Amazon Resource Name (ARN) of this assessment run.\n"]
}
[@@ocaml.doc
  "Provides information that describes a premigration assessment run that you have started using \
   the [StartReplicationTaskAssessmentRun] operation.\n\n\
  \ Some of the information appears based on other operations that can return the \
   [ReplicationTaskAssessmentRun] object.\n\
  \ "]

type nonrec start_replication_task_assessment_run_response = {
  replication_task_assessment_run : replication_task_assessment_run option;
      [@ocaml.doc "The premigration assessment run that was started.\n"]
}
[@@ocaml.doc "\n"]

type nonrec include_test_list = string_ list [@@ocaml.doc ""]

type nonrec exclude_test_list = string_ list [@@ocaml.doc ""]

type nonrec start_replication_task_assessment_run_message = {
  tags : tag_list option;
      [@ocaml.doc
        "One or more tags to be assigned to the premigration assessment run that you want to start.\n"]
  exclude : exclude_test_list option;
      [@ocaml.doc
        "Space-separated list of names for specific individual assessments that you want to \
         exclude. These names come from the default list of individual assessments that DMS \
         supports for the associated migration task. This task is specified by \
         [ReplicationTaskArn].\n\n\
        \  You can't set a value for [Exclude] if you also set a value for [IncludeOnly] in the \
         API operation.\n\
        \  \n\
        \   To identify the names of the default individual assessments that DMS supports for the \
         associated migration task, run the [DescribeApplicableIndividualAssessments] operation \
         using its own [ReplicationTaskArn] request parameter.\n\
        \   \n\
        \    "]
  include_only : include_test_list option;
      [@ocaml.doc
        "Space-separated list of names for specific individual assessments that you want to \
         include. These names come from the default list of individual assessments that DMS \
         supports for the associated migration task. This task is specified by \
         [ReplicationTaskArn].\n\n\
        \  You can't set a value for [IncludeOnly] if you also set a value for [Exclude] in the \
         API operation. \n\
        \  \n\
        \   To identify the names of the default individual assessments that DMS supports for the \
         associated migration task, run the [DescribeApplicableIndividualAssessments] operation \
         using its own [ReplicationTaskArn] request parameter.\n\
        \   \n\
        \    "]
  assessment_run_name : string_; [@ocaml.doc "Unique name to identify the assessment run.\n"]
  result_kms_key_arn : string_ option;
      [@ocaml.doc
        "ARN of a custom KMS encryption key that you specify when you set [ResultEncryptionMode] \
         to [\"SSE_KMS]\".\n"]
  result_encryption_mode : string_ option;
      [@ocaml.doc
        "Encryption mode that you can specify to encrypt the results of this assessment run. If \
         you don't specify this request parameter, DMS stores the assessment run results without \
         encryption. You can specify one of the options following:\n\n\
        \ {ul\n\
        \       {-   [\"SSE_S3\"] \226\128\147 The server-side encryption provided as a default by \
         Amazon S3.\n\
        \           \n\
        \            }\n\
        \       {-   [\"SSE_KMS\"] \226\128\147 Key Management Service (KMS) encryption. This \
         encryption can use either a custom KMS encryption key that you specify or the default KMS \
         encryption key that DMS provides.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  result_location_folder : string_ option;
      [@ocaml.doc
        "Folder within an Amazon S3 bucket where you want DMS to store the results of this \
         assessment run.\n"]
  result_location_bucket : string_;
      [@ocaml.doc
        "Amazon S3 bucket where you want DMS to store the results of this assessment run.\n"]
  service_access_role_arn : string_;
      [@ocaml.doc
        "ARN of the service role needed to start the assessment run. The role must allow the \
         [iam:PassRole] action.\n"]
  replication_task_arn : string_;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the migration task associated with the premigration \
         assessment run that you want to start.\n"]
}
[@@ocaml.doc "\n"]

type nonrec s3_resource_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A specified Amazon S3 bucket, bucket folder, or other object can't be found.\n"]

type nonrec s3_access_denied_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "Insufficient privileges are preventing access to an Amazon S3 object.\n"]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec resource_already_exists_fault = {
  resource_arn : resource_arn option; [@ocaml.doc "\n"]
  message : exception_message option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "The resource you are attempting to create already exists.\n"]

type nonrec kms_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified KMS entity or resource can't be found.\n"]

type nonrec kms_invalid_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The state of the specified KMS resource isn't valid for this request.\n"]

type nonrec kms_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "An Key Management Service (KMS) error is preventing access to KMS.\n"]

type nonrec kms_disabled_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified KMS key isn't enabled.\n"]

type nonrec kms_access_denied_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The ciphertext references a key that doesn't exist or that the DMS account doesn't have access \
   to.\n"]

type nonrec start_replication_task_assessment_response = {
  replication_task : replication_task option; [@ocaml.doc " The assessed replication task. \n"]
}
[@@ocaml.doc "\n"]

type nonrec start_replication_task_assessment_message = {
  replication_task_arn : string_;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the replication task. \n"]
}
[@@ocaml.doc "\n"]

type nonrec start_replication_response = {
  replication : replication option; [@ocaml.doc "The replication that DMS started.\n"]
}
[@@ocaml.doc "\n"]

type nonrec start_replication_migration_type_value =
  | START_REPLICATION [@ocaml.doc ""]
  | RESUME_PROCESSING [@ocaml.doc ""]
  | RELOAD_TARGET [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec start_replication_message = {
  cdc_stop_position : string_ option;
      [@ocaml.doc
        "Indicates when you want a change data capture (CDC) operation to stop. The value can be \
         either server time or commit time.\n"]
  cdc_start_position : string_ option;
      [@ocaml.doc
        "Indicates when you want a change data capture (CDC) operation to start. Use either \
         [CdcStartPosition] or [CdcStartTime] to specify when you want a CDC operation to start. \
         Specifying both values results in an error.\n\n\
        \ The value can be in date, checkpoint, or LSN/SCN format.\n\
        \ "]
  cdc_start_time : t_stamp option;
      [@ocaml.doc
        "Indicates the start time for a change data capture (CDC) operation. Use either \
         [CdcStartTime] or [CdcStartPosition] to specify when you want a CDC operation to start. \
         Specifying both values results in an error.\n"]
  premigration_assessment_settings : string_ option;
      [@ocaml.doc
        "User-defined settings for the premigration assessment. The possible values are:\n\n\
        \ {ul\n\
        \       {-   [ResultLocationFolder]: The folder within an Amazon S3 bucket where you want \
         DMS to store the results of this assessment run.\n\
        \           \n\
        \            }\n\
        \       {-   [ResultEncryptionMode]: The supported values are [SSE_KMS] and [SSE_S3]. If \
         these values are not provided, then the files are not encrypted at rest. For more \
         information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.KMSKeys}Creating \
         Amazon Web Services KMS keys to encrypt Amazon S3 target objects}.\n\
        \           \n\
        \            }\n\
        \       {-   [ResultKmsKeyArn]: The ARN of a customer KMS encryption key that you specify \
         when you set [ResultEncryptionMode] to [SSE_KMS].\n\
        \           \n\
        \            }\n\
        \       {-   [IncludeOnly]: A space-separated list of names for specific individual \
         assessments that you want to include. These names come from the default list of \
         individual assessments that Database Migration Service supports for the associated \
         migration.\n\
        \           \n\
        \            }\n\
        \       {-   [Exclude]: A space-separated list of names for specific individual \
         assessments that you want to exclude. These names come from the default list of \
         individual assessments that Database Migration Service supports for the associated \
         migration.\n\
        \           \n\
        \            }\n\
        \       {-   [FailOnAssessmentFailure]: A configurable setting you can set to [true] (the \
         default setting) or [false]. Use this setting to to stop the replication from starting \
         automatically if the assessment fails. This can help you evaluate the issue that is \
         preventing the replication from running successfully.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  start_replication_type : string_;
      [@ocaml.doc
        "The replication type.\n\n\
        \ When the replication type is [full-load] or [full-load-and-cdc], the only valid value \
         for the first run of the replication is [start-replication]. This option will start the \
         replication.\n\
        \ \n\
        \  You can also use [ReloadTables] to reload specific tables that failed during \
         replication instead of restarting the replication.\n\
        \  \n\
        \   The [resume-processing] option isn't applicable for a full-load replication, because \
         you can't resume partially loaded tables during the full load phase.\n\
        \   \n\
        \    For a [full-load-and-cdc] replication, DMS migrates table data, and then applies data \
         changes that occur on the source. To load all the tables again, and start capturing \
         source changes, use [reload-target]. Otherwise use [resume-processing], to replicate the \
         changes from the last stop position.\n\
        \    "]
  replication_config_arn : string_;
      [@ocaml.doc "The Amazon Resource Name of the replication for which to start replication.\n"]
}
[@@ocaml.doc "\n"]

type nonrec recommendation_settings = {
  workload_type : string_;
      [@ocaml.doc
        "The deployment option for your target engine. For production databases, Fleet Advisor \
         chooses Multi-AZ deployment. For development or test databases, Fleet Advisor chooses \
         Single-AZ deployment. Valid values include [\"development\"] and [\"production\"].\n"]
  instance_sizing_type : string_;
      [@ocaml.doc
        "The size of your target instance. Fleet Advisor calculates this value based on your data \
         collection type, such as total capacity and resource utilization. Valid values include \
         [\"total-capacity\"] and [\"utilization\"].\n"]
}
[@@ocaml.doc "Provides information about the required target engine settings.\n"]

type nonrec start_recommendations_request_entry = {
  settings : recommendation_settings; [@ocaml.doc "The required target engine settings.\n"]
  database_id : string_; [@ocaml.doc "The identifier of the source database.\n"]
}
[@@ocaml.doc
  "Provides information about the source database to analyze and provide target recommendations \
   according to the specified requirements.\n"]

type nonrec start_recommendations_request_entry_list = start_recommendations_request_entry list
[@@ocaml.doc ""]

type nonrec start_recommendations_request = {
  settings : recommendation_settings;
      [@ocaml.doc
        "The settings in JSON format that Fleet Advisor uses to determine target engine \
         recommendations. These parameters include target instance sizing and availability and \
         durability settings. For target instance sizing, Fleet Advisor supports the following two \
         options: total capacity and resource utilization. For availability and durability, Fleet \
         Advisor supports the following two options: production (Multi-AZ deployments) and \
         Dev/Test (Single-AZ deployments).\n"]
  database_id : string_;
      [@ocaml.doc
        "The identifier of the source database to analyze and provide recommendations for.\n"]
}
[@@ocaml.doc ""]

type nonrec start_metadata_model_import_response = {
  request_identifier : string_ option; [@ocaml.doc "The identifier for the import operation.\n"]
}
[@@ocaml.doc ""]

type nonrec migration_project_identifier = string [@@ocaml.doc ""]

type nonrec origin_type_value = TARGET [@ocaml.doc ""] | SOURCE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec start_metadata_model_import_message = {
  refresh : boolean_ option;
      [@ocaml.doc
        "If [true], DMS loads metadata for the specified objects from the source database.\n"]
  origin : origin_type_value;
      [@ocaml.doc "Whether to load metadata to the source or target database.\n"]
  selection_rules : string_; [@ocaml.doc "A value that specifies the database objects to import.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec start_metadata_model_export_to_target_response = {
  request_identifier : string_ option; [@ocaml.doc "The identifier for the export operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_metadata_model_export_to_target_message = {
  overwrite_extension_pack : boolean_optional option;
      [@ocaml.doc
        "Whether to overwrite the migration project extension pack. An extension pack is an add-on \
         module that emulates functions present in a source database that are required when \
         converting objects to the target database.\n"]
  selection_rules : string_; [@ocaml.doc "A value that specifies the database objects to export.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec start_metadata_model_export_as_script_response = {
  request_identifier : string_ option; [@ocaml.doc "The identifier for the export operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_metadata_model_export_as_script_message = {
  file_name : string_ option;
      [@ocaml.doc "The name of the model file to create in the Amazon S3 bucket.\n"]
  origin : origin_type_value;
      [@ocaml.doc "Whether to export the metadata model from the source or the target.\n"]
  selection_rules : string_; [@ocaml.doc "A value that specifies the database objects to export.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec start_metadata_model_creation_response = {
  request_identifier : string_ option;
      [@ocaml.doc "The identifier for the metadata model creation operation.\n"]
}
[@@ocaml.doc ""]

type nonrec metadata_model_properties =
  | StatementProperties of statement_properties [@ocaml.doc "The properties of the statement.\n"]
[@@ocaml.doc
  "The properties of metadata model in JSON format. This object is a Union. Only one member of \
   this object can be specified or returned.\n"]

type nonrec start_metadata_model_creation_message = {
  properties : metadata_model_properties;
      [@ocaml.doc
        "The properties of metadata model in JSON format. This object is a Union. Only one member \
         of this object can be specified or returned.\n"]
  metadata_model_name : string_; [@ocaml.doc "The name of the metadata model.\n"]
  selection_rules : string_;
      [@ocaml.doc
        "The JSON string that specifies the location where the metadata model will be created. \
         Selection rules must specify a single schema. For more information, see Selection Rules \
         in the DMS User Guide.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec start_metadata_model_conversion_response = {
  request_identifier : string_ option; [@ocaml.doc "The identifier for the conversion operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_metadata_model_conversion_message = {
  selection_rules : string_;
      [@ocaml.doc "A value that specifies the database objects to convert.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec start_metadata_model_assessment_response = {
  request_identifier : string_ option; [@ocaml.doc "The identifier for the assessment operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_metadata_model_assessment_message = {
  selection_rules : string_; [@ocaml.doc "A value that specifies the database objects to assess.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec start_extension_pack_association_response = {
  request_identifier : string_ option; [@ocaml.doc "The identifier for the request operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_extension_pack_association_message = {
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec start_data_migration_response = {
  data_migration : data_migration option; [@ocaml.doc "The data migration that DMS started.\n"]
}
[@@ocaml.doc ""]

type nonrec start_data_migration_message = {
  start_type : start_replication_migration_type_value;
      [@ocaml.doc
        "Specifies the start type for the data migration. Valid values include \
         [start-replication], [reload-target], and [resume-processing].\n"]
  data_migration_identifier : string_;
      [@ocaml.doc "The identifier (name or ARN) of the data migration to start.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_operation_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The action or operation requested isn't valid.\n"]

type nonrec ssl_security_protocol_value =
  | SSL_ENCRYPTION [@ocaml.doc ""]
  | PLAINTEXT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sql_server_authentication_method = Kerberos [@ocaml.doc ""] | Password [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec source_type = Replication_instance [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec source_ids_list = string_ list [@@ocaml.doc ""]

type nonrec server_short_info_response = {
  server_name : string_ option;
      [@ocaml.doc "The name address of a server in a Fleet Advisor collector inventory.\n"]
  ip_address : string_ option;
      [@ocaml.doc "The IP address of a server in a Fleet Advisor collector inventory.\n"]
  server_id : string_ option;
      [@ocaml.doc "The ID of a server in a Fleet Advisor collector inventory.\n"]
}
[@@ocaml.doc "Describes a server in a Fleet Advisor collector inventory.\n"]

type nonrec schema_short_info_response = {
  database_ip_address : string_ option;
      [@ocaml.doc "The IP address of a database in a Fleet Advisor collector inventory.\n"]
  database_name : string_ option;
      [@ocaml.doc "The name of a database in a Fleet Advisor collector inventory.\n"]
  database_id : string_ option;
      [@ocaml.doc "The ID of a database in a Fleet Advisor collector inventory.\n"]
  schema_name : string_ option;
      [@ocaml.doc "The name of a schema in a Fleet Advisor collector inventory.\n"]
  schema_id : string_ option;
      [@ocaml.doc "The ID of a schema in a Fleet Advisor collector inventory.\n"]
}
[@@ocaml.doc "Describes a schema in a Fleet Advisor collector inventory.\n"]

type nonrec database_short_info_response = {
  database_engine : string_ option;
      [@ocaml.doc
        "The database engine of a database in a Fleet Advisor collector inventory, for example \
         [PostgreSQL].\n"]
  database_ip_address : string_ option;
      [@ocaml.doc "The IP address of a database in a Fleet Advisor collector inventory.\n"]
  database_name : string_ option;
      [@ocaml.doc "The name of a database in a Fleet Advisor collector inventory.\n"]
  database_id : string_ option;
      [@ocaml.doc "The ID of a database in a Fleet Advisor collector inventory.\n"]
}
[@@ocaml.doc "Describes a database in a Fleet Advisor collector inventory.\n"]

type nonrec schema_response = {
  similarity : double_optional option;
      [@ocaml.doc
        "The similarity value for a schema in a Fleet Advisor collector inventory. A higher \
         similarity value indicates that a schema is likely to be a duplicate.\n"]
  original_schema : schema_short_info_response option; [@ocaml.doc ""]
  schema_name : string_ option;
      [@ocaml.doc "The name of a schema in a Fleet Advisor collector inventory.\n"]
  schema_id : string_ option;
      [@ocaml.doc "The ID of a schema in a Fleet Advisor collector inventory.\n"]
  database_instance : database_short_info_response option;
      [@ocaml.doc "The database for a schema in a Fleet Advisor collector inventory.\n"]
  server : server_short_info_response option;
      [@ocaml.doc "The database server for a schema in a Fleet Advisor collector inventory.\n"]
  complexity : string_ option;
      [@ocaml.doc
        "The complexity level of the code in a schema in a Fleet Advisor collector inventory.\n"]
  code_size : long_optional option;
      [@ocaml.doc
        "The size level of the code in a schema in a Fleet Advisor collector inventory.\n"]
  code_line_count : long_optional option;
      [@ocaml.doc
        "The number of lines of code in a schema in a Fleet Advisor collector inventory.\n"]
}
[@@ocaml.doc "Describes a schema in a Fleet Advisor collector inventory.\n"]

type nonrec schema_list = string_ list [@@ocaml.doc ""]

type nonrec default_error_details = { message : string_ option [@ocaml.doc "The error message.\n"] }
[@@ocaml.doc "Provides error information about a schema conversion operation.\n"]

type nonrec error_details =
  | DefaultErrorDetails of default_error_details [@ocaml.doc "Error information about a project.\n"]
[@@ocaml.doc "Provides error information about a project.\n"]

type nonrec export_sql_details = {
  object_ur_l : string_ option;
      [@ocaml.doc "The URL for the object containing the exported metadata model assessment.\n"]
  s3_object_key : string_ option;
      [@ocaml.doc
        "The Amazon S3 object key for the object containing the exported metadata model assessment.\n"]
}
[@@ocaml.doc "Provides information about a metadata model assessment exported to SQL.\n"]

type nonrec processed_object = {
  endpoint_type : string_ option;
      [@ocaml.doc
        "The type of the data provider. This parameter can store one of the following values: \
         [\"SOURCE\"] or [\"TARGET\"].\n"]
  type_ : string_ option;
      [@ocaml.doc
        "The type of the database object. For example, a table, view, procedure, and so on.\n"]
  name : string_ option; [@ocaml.doc "The name of the database object.\n"]
}
[@@ocaml.doc "The database object that the schema conversion operation currently uses.\n"]

type nonrec progress = {
  processed_object : processed_object option;
      [@ocaml.doc
        "The name of the database object that the schema conversion operation currently uses.\n"]
  progress_step : string_ option;
      [@ocaml.doc
        "The step of the schema conversion operation. This parameter can store one of the \
         following values:\n\n\
        \ {ul\n\
        \       {-   [IN_PROGRESS] \226\128\147 The operation is running.\n\
        \           \n\
        \            }\n\
        \       {-   [LOADING_METADATA] \226\128\147 Loads metadata from the source database.\n\
        \           \n\
        \            }\n\
        \       {-   [COUNTING_OBJECTS] \226\128\147 Determines the number of objects involved in \
         the operation.\n\
        \           \n\
        \            }\n\
        \       {-   [ANALYZING] \226\128\147 Analyzes the source database objects.\n\
        \           \n\
        \            }\n\
        \       {-   [CONVERTING] \226\128\147 Converts the source database objects to a format \
         compatible with the target database.\n\
        \           \n\
        \            }\n\
        \       {-   [APPLYING] \226\128\147 Applies the converted code to the target database.\n\
        \           \n\
        \            }\n\
        \       {-   [FINISHED] \226\128\147 The operation completed successfully.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  total_objects : long option;
      [@ocaml.doc "The number of objects in this schema conversion operation.\n"]
  progress_percent : double_optional option;
      [@ocaml.doc "The percent complete for the current step of the schema conversion operation.\n"]
}
[@@ocaml.doc "Provides information about the progress of the schema conversion operation.\n"]

type nonrec schema_conversion_request = {
  progress : progress option; [@ocaml.doc ""]
  export_sql_details : export_sql_details option; [@ocaml.doc ""]
  error : error_details option; [@ocaml.doc ""]
  migration_project_arn : string_ option; [@ocaml.doc "The migration project ARN.\n"]
  request_identifier : string_ option;
      [@ocaml.doc "The identifier for the schema conversion action.\n"]
  status : string_ option; [@ocaml.doc "The schema conversion action status.\n"]
}
[@@ocaml.doc "Provides information about a schema conversion action.\n"]

type nonrec schema_conversion_request_list = schema_conversion_request list [@@ocaml.doc ""]

type nonrec safeguard_policy =
  | SHARED_AUTOMATIC_TRUNCATION [@ocaml.doc ""]
  | EXCLUSIVE_AUTOMATIC_TRUNCATION [@ocaml.doc ""]
  | RELY_ON_SQL_SERVER_REPLICATION_AGENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sns_no_authorization_fault = { message : exception_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "You are not authorized for the SNS subscription.\n"]

type nonrec sns_invalid_topic_fault = { message : exception_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "The SNS topic is invalid.\n"]

type nonrec sc_application_attributes = {
  s3_bucket_role_arn : string_ option;
      [@ocaml.doc "The ARN for the role the application uses to access its Amazon S3 bucket.\n"]
  s3_bucket_path : string_ option;
      [@ocaml.doc
        "The path for the Amazon S3 bucket that the application uses for exporting assessment \
         reports.\n"]
}
[@@ocaml.doc "Provides information that defines a schema conversion application.\n"]

type nonrec compression_type_value = GZIP [@ocaml.doc ""] | NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec encryption_mode_value = SSE_KMS [@ocaml.doc ""] | SSE_S3 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_format_value = PARQUET [@ocaml.doc ""] | CSV [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec encoding_type_value =
  | RLE_DICTIONARY [@ocaml.doc ""]
  | PLAIN_DICTIONARY [@ocaml.doc ""]
  | PLAIN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec parquet_version_value = PARQUET_2_0 [@ocaml.doc ""] | PARQUET_1_0 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec date_partition_sequence_value =
  | DDMMYYYY [@ocaml.doc ""]
  | MMYYYYDD [@ocaml.doc ""]
  | YYYYMM [@ocaml.doc ""]
  | YYYYMMDDHH [@ocaml.doc ""]
  | YYYYMMDD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec date_partition_delimiter_value =
  | NONE [@ocaml.doc ""]
  | DASH [@ocaml.doc ""]
  | UNDERSCORE [@ocaml.doc ""]
  | SLASH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec canned_acl_for_objects_value =
  | BUCKET_OWNER_FULL_CONTROL [@ocaml.doc ""]
  | BUCKET_OWNER_READ [@ocaml.doc ""]
  | AWS_EXEC_READ [@ocaml.doc ""]
  | AUTHENTICATED_READ [@ocaml.doc ""]
  | PUBLIC_READ_WRITE [@ocaml.doc ""]
  | PUBLIC_READ [@ocaml.doc ""]
  | PRIVATE [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_settings = {
  glue_catalog_generation : boolean_optional option;
      [@ocaml.doc
        "When true, allows Glue to catalog your S3 bucket. Creating an Glue catalog lets you use \
         Athena to query your data.\n"]
  expected_bucket_owner : string_ option;
      [@ocaml.doc
        "To specify a bucket owner and prevent sniping, you can use the [ExpectedBucketOwner] \
         endpoint setting. \n\n\
        \ Example: \n\
        \ {[\n\
        \ --s3-settings='\\{\"ExpectedBucketOwner\": \"{i AWS_Account_ID}\"\\}'\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  When you make a request to test a connection or perform a migration, S3 checks the \
         account ID of the bucket owner against the specified parameter.\n\
        \  "]
  add_trailing_padding_character : boolean_optional option;
      [@ocaml.doc
        "Use the S3 target endpoint setting [AddTrailingPaddingCharacter] to add padding on string \
         data. The default value is [false].\n"]
  date_partition_timezone : string_ option;
      [@ocaml.doc
        "When creating an S3 target endpoint, set [DatePartitionTimezone] to convert the current \
         UTC time into a specified time zone. The conversion occurs when a date partition folder \
         is created and a CDC filename is generated. The time zone format is Area/Location. Use \
         this parameter when [DatePartitionedEnabled] is set to true, as shown in the following \
         example:\n\n\
        \  [s3-settings='{\"DatePartitionEnabled\": true, \"DatePartitionSequence\": \
         \"YYYYMMDDHH\", \"DatePartitionDelimiter\": \"SLASH\", \
         \"DatePartitionTimezone\":\"Asia/Seoul\", \"BucketName\": \"dms-nattarat-test\"}'] \n\
        \ "]
  rfc4180 : boolean_optional option;
      [@ocaml.doc
        "For an S3 source, when this value is set to [true] or [y], each leading double quotation \
         mark has to be followed by an ending double quotation mark. This formatting complies with \
         RFC 4180. When this value is set to [false] or [n], string literals are copied to the \
         target as is. In this case, a delimiter (row or column) signals the end of the field. \
         Thus, you can't use a delimiter as part of the string, because it signals the end of the \
         value.\n\n\
        \ For an S3 target, an optional parameter used to set behavior to comply with RFC 4180 for \
         data migrated to Amazon S3 using .csv file format only. When this value is set to [true] \
         or [y] using Amazon S3 as a target, if the data has quotation marks or newline characters \
         in it, DMS encloses the entire column with an additional pair of double quotation marks \
         (\"). Every quotation mark within the data is repeated twice.\n\
        \ \n\
        \  The default value is [true]. Valid values include [true], [false], [y], and [n].\n\
        \  "]
  max_file_size : integer_optional option;
      [@ocaml.doc
        "A value that specifies the maximum size (in KB) of any .csv file to be created while \
         migrating to an S3 target during full load.\n\n\
        \ The default value is 1,048,576 KB (1 GB). Valid values include 1 to 1,048,576.\n\
        \ "]
  ignore_header_rows : integer_optional option;
      [@ocaml.doc
        "When this value is set to 1, DMS ignores the first row header in a .csv file. A value of \
         1 turns on the feature; a value of 0 turns off the feature.\n\n\
        \ The default is 0.\n\
        \ "]
  csv_null_value : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies how DMS treats null values. While handling the null \
         value, you can use this parameter to pass a user-defined string as null when writing to \
         the target. For example, when target columns are nullable, you can use this option to \
         differentiate between the empty string value and the null value. So, if you set this \
         parameter value to the empty string (\"\" or ''), DMS treats the empty string as the null \
         value instead of [NULL].\n\n\
        \ The default value is [NULL]. Valid values include any valid string.\n\
        \ "]
  cdc_min_file_size : integer_optional option;
      [@ocaml.doc
        "Minimum file size, defined in kilobytes, to reach for a file output to Amazon S3.\n\n\
        \ When [CdcMinFileSize] and [CdcMaxBatchInterval] are both specified, the file write is \
         triggered by whichever parameter condition is met first within an DMS CloudFormation \
         template.\n\
        \ \n\
        \  The default value is 32 MB.\n\
        \  "]
  cdc_max_batch_interval : integer_optional option;
      [@ocaml.doc
        "Maximum length of the interval, defined in seconds, after which to output a file to \
         Amazon S3.\n\n\
        \ When [CdcMaxBatchInterval] and [CdcMinFileSize] are both specified, the file write is \
         triggered by whichever parameter condition is met first within an DMS CloudFormation \
         template.\n\
        \ \n\
        \  The default value is 60 seconds.\n\
        \  "]
  add_column_name : boolean_optional option;
      [@ocaml.doc
        "An optional parameter that, when set to [true] or [y], you can use to add column name \
         information to the .csv output file.\n\n\
        \ The default value is [false]. Valid values are [true], [false], [y], and [n].\n\
        \ "]
  canned_acl_for_objects : canned_acl_for_objects_value option;
      [@ocaml.doc
        "A value that enables DMS to specify a predefined (canned) access control list for objects \
         created in an Amazon S3 bucket as .csv or .parquet files. For more information about \
         Amazon S3 canned ACLs, see \
         {{:http://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl}Canned \
         ACL} in the {i Amazon S3 Developer Guide.} \n\n\
        \ The default value is NONE. Valid values include NONE, PRIVATE, PUBLIC_READ, \
         PUBLIC_READ_WRITE, AUTHENTICATED_READ, AWS_EXEC_READ, BUCKET_OWNER_READ, and \
         BUCKET_OWNER_FULL_CONTROL.\n\
        \ "]
  use_task_start_time_for_full_load_timestamp : boolean_optional option;
      [@ocaml.doc
        "When set to true, this parameter uses the task start time as the timestamp column value \
         instead of the time data is written to target. For full load, when \
         [useTaskStartTimeForFullLoadTimestamp] is set to [true], each row of the timestamp column \
         contains the task start time. For CDC loads, each row of the timestamp column contains \
         the transaction commit time.\n\n\
        \ When [useTaskStartTimeForFullLoadTimestamp] is set to [false], the full load timestamp \
         in the timestamp column increments with the time data arrives at the target. \n\
        \ "]
  cdc_path : string_ option;
      [@ocaml.doc
        "Specifies the folder path of CDC files. For an S3 source, this setting is required if a \
         task captures change data; otherwise, it's optional. If [CdcPath] is set, DMS reads CDC \
         files from this path and replicates the data changes to the target endpoint. For an S3 \
         target if you set \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-PreserveTransactions} \
         [PreserveTransactions] } to [true], DMS verifies that you have set this parameter to a \
         folder path on your S3 target where DMS can save the transaction order for the CDC load. \
         DMS creates this CDC folder path in either your S3 target working directory or the S3 \
         target location specified by \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-BucketFolder} \
         [BucketFolder] } and \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-BucketName} \
         [BucketName] }.\n\n\
        \ For example, if you specify [CdcPath] as [MyChangedData], and you specify [BucketName] \
         as [MyTargetBucket] but do not specify [BucketFolder], DMS creates the CDC folder path \
         following: [MyTargetBucket/MyChangedData].\n\
        \ \n\
        \  If you specify the same [CdcPath], and you specify [BucketName] as [MyTargetBucket] and \
         [BucketFolder] as [MyTargetData], DMS creates the CDC folder path following: \
         [MyTargetBucket/MyTargetData/MyChangedData].\n\
        \  \n\
        \   For more information on CDC including transaction order on an S3 target, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.EndpointSettings.CdcPath}Capturing \
         data changes (CDC) including transaction order on the S3 target}.\n\
        \   \n\
        \     This setting is supported in DMS versions 3.4.2 and later.\n\
        \     \n\
        \      "]
  preserve_transactions : boolean_optional option;
      [@ocaml.doc
        "If set to [true], DMS saves the transaction order for a change data capture (CDC) load on \
         the Amazon S3 target specified by \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-CdcPath} \
         [CdcPath] }. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.EndpointSettings.CdcPath}Capturing \
         data changes (CDC) including transaction order on the S3 target}.\n\n\
        \  This setting is supported in DMS versions 3.4.2 and later.\n\
        \  \n\
        \   "]
  csv_no_sup_value : string_ option;
      [@ocaml.doc
        "This setting only applies if your Amazon S3 output files during a change data capture \
         (CDC) load are written in .csv format. If \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-UseCsvNoSupValue} \
         [UseCsvNoSupValue] } is set to true, specify a string value that you want DMS to use for \
         all columns not included in the supplemental log. If you do not specify a string value, \
         DMS uses the null value for these columns regardless of the [UseCsvNoSupValue] setting.\n\n\
        \  This setting is supported in DMS versions 3.4.1 and later.\n\
        \  \n\
        \   "]
  use_csv_no_sup_value : boolean_optional option;
      [@ocaml.doc
        "This setting applies if the S3 output files during a change data capture (CDC) load are \
         written in .csv format. If set to [true] for columns not included in the supplemental \
         log, DMS uses the value specified by \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_S3Settings.html#DMS-Type-S3Settings-CsvNoSupValue} \
         [CsvNoSupValue] }. If not set or set to [false], DMS uses the null value for these \
         columns.\n\n\
        \  This setting is supported in DMS versions 3.4.1 and later.\n\
        \  \n\
        \   "]
  date_partition_delimiter : date_partition_delimiter_value option;
      [@ocaml.doc
        "Specifies a date separating delimiter to use during folder partitioning. The default \
         value is [SLASH]. Use this parameter when [DatePartitionedEnabled] is set to [true].\n"]
  date_partition_sequence : date_partition_sequence_value option;
      [@ocaml.doc
        "Identifies the sequence of the date format to use during folder partitioning. The default \
         value is [YYYYMMDD]. Use this parameter when [DatePartitionedEnabled] is set to [true].\n"]
  date_partition_enabled : boolean_optional option;
      [@ocaml.doc
        "When set to [true], this parameter partitions S3 bucket folders based on transaction \
         commit dates. The default value is [false]. For more information about date-based folder \
         partitioning, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.DatePartitioning}Using \
         date-based folder partitioning}.\n"]
  cdc_inserts_and_updates : boolean_optional option;
      [@ocaml.doc
        "A value that enables a change data capture (CDC) load to write INSERT and UPDATE \
         operations to .csv or .parquet (columnar storage) output files. The default setting is \
         [false], but when [CdcInsertsAndUpdates] is set to [true] or [y], only INSERTs and \
         UPDATEs from the source database are migrated to the .csv or .parquet file.\n\n\
        \  DMS supports the use of the .parquet files in versions 3.4.7 and later.\n\
        \  \n\
        \    How these INSERTs and UPDATEs are recorded depends on the value of the \
         [IncludeOpForFullLoad] parameter. If [IncludeOpForFullLoad] is set to [true], the first \
         field of every CDC record is set to either [I] or [U] to indicate INSERT and UPDATE \
         operations at the source. But if [IncludeOpForFullLoad] is set to [false], CDC records \
         are written without an indication of INSERT or UPDATE operations at the source. For more \
         information about how these settings work together, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring.InsertOps}Indicating \
         Source DB Operations in Migrated S3 Data} in the {i Database Migration Service User \
         Guide.}.\n\
        \    \n\
        \      DMS supports the use of the [CdcInsertsAndUpdates] parameter in versions 3.3.1 and \
         later.\n\
        \      \n\
        \        [CdcInsertsOnly] and [CdcInsertsAndUpdates] can't both be set to [true] for the \
         same endpoint. Set either [CdcInsertsOnly] or [CdcInsertsAndUpdates] to [true] for the \
         same endpoint, but not both.\n\
        \       \n\
        \        "]
  parquet_timestamp_in_millisecond : boolean_optional option;
      [@ocaml.doc
        "A value that specifies the precision of any [TIMESTAMP] column values that are written to \
         an Amazon S3 object file in .parquet format.\n\n\
        \  DMS supports the [ParquetTimestampInMillisecond] parameter in versions 3.1.4 and later.\n\
        \  \n\
        \    When [ParquetTimestampInMillisecond] is set to [true] or [y], DMS writes all \
         [TIMESTAMP] columns in a .parquet formatted file with millisecond precision. Otherwise, \
         DMS writes them with microsecond precision.\n\
        \    \n\
        \     Currently, Amazon Athena and Glue can handle only millisecond precision for \
         [TIMESTAMP] values. Set this parameter to [true] for S3 endpoint object files that are \
         .parquet formatted only if you plan to query or process the data with Athena or Glue.\n\
        \     \n\
        \       DMS writes any [TIMESTAMP] column values written to an S3 file in .csv format with \
         microsecond precision.\n\
        \       \n\
        \        Setting [ParquetTimestampInMillisecond] has no effect on the string format of the \
         timestamp column value that is inserted by setting the [TimestampColumnName] parameter.\n\
        \        \n\
        \         "]
  timestamp_column_name : string_ option;
      [@ocaml.doc
        "A value that when nonblank causes DMS to add a column with timestamp information to the \
         endpoint data for an Amazon S3 target.\n\n\
        \  DMS supports the [TimestampColumnName] parameter in versions 3.1.4 and later.\n\
        \  \n\
        \    DMS includes an additional [STRING] column in the .csv or .parquet object files of \
         your migrated data when you set [TimestampColumnName] to a nonblank value.\n\
        \    \n\
        \     For a full load, each row of this timestamp column contains a timestamp for when the \
         data was transferred from the source to the target by DMS. \n\
        \     \n\
        \      For a change data capture (CDC) load, each row of the timestamp column contains the \
         timestamp for the commit of that row in the source database.\n\
        \      \n\
        \       The string format for this timestamp column value is [yyyy-MM-dd\n\
        \            HH:mm:ss.SSSSSS]. By default, the precision of this value is in microseconds. \
         For a CDC load, the rounding of the precision depends on the commit timestamp supported \
         by DMS for the source database.\n\
        \       \n\
        \        When the [AddColumnName] parameter is set to [true], DMS also includes a name for \
         the timestamp column that you set with [TimestampColumnName].\n\
        \        "]
  cdc_inserts_only : boolean_optional option;
      [@ocaml.doc
        "A value that enables a change data capture (CDC) load to write only INSERT operations to \
         .csv or columnar storage (.parquet) output files. By default (the [false] setting), the \
         first field in a .csv or .parquet record contains the letter I (INSERT), U (UPDATE), or D \
         (DELETE). These values indicate whether the row was inserted, updated, or deleted at the \
         source database for a CDC load to the target.\n\n\
        \ If [CdcInsertsOnly] is set to [true] or [y], only INSERTs from the source database are \
         migrated to the .csv or .parquet file. For .csv format only, how these INSERTs are \
         recorded depends on the value of [IncludeOpForFullLoad]. If [IncludeOpForFullLoad] is set \
         to [true], the first field of every CDC record is set to I to indicate the INSERT \
         operation at the source. If [IncludeOpForFullLoad] is set to [false], every CDC record is \
         written without a first field to indicate the INSERT operation at the source. For more \
         information about how these settings work together, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring.InsertOps}Indicating \
         Source DB Operations in Migrated S3 Data} in the {i Database Migration Service User \
         Guide.}.\n\
        \ \n\
        \   DMS supports the interaction described preceding between the [CdcInsertsOnly] and \
         [IncludeOpForFullLoad] parameters in versions 3.1.4 and later. \n\
        \   \n\
        \     [CdcInsertsOnly] and [CdcInsertsAndUpdates] can't both be set to [true] for the same \
         endpoint. Set either [CdcInsertsOnly] or [CdcInsertsAndUpdates] to [true] for the same \
         endpoint, but not both.\n\
        \    \n\
        \     "]
  include_op_for_full_load : boolean_optional option;
      [@ocaml.doc
        "A value that enables a full load to write INSERT operations to the comma-separated value \
         (.csv) or .parquet output files only to indicate how the rows were added to the source \
         database.\n\n\
        \  DMS supports the [IncludeOpForFullLoad] parameter in versions 3.1.4 and later.\n\
        \  \n\
        \   DMS supports the use of the .parquet files with the [IncludeOpForFullLoad] parameter \
         in versions 3.4.7 and later.\n\
        \   \n\
        \     For full load, records can only be inserted. By default (the [false] setting), no \
         information is recorded in these output files for a full load to indicate that the rows \
         were inserted at the source database. If [IncludeOpForFullLoad] is set to [true] or [y], \
         the INSERT is recorded as an I annotation in the first field of the .csv file. This \
         allows the format of your target records from a full load to be consistent with the \
         target records from a CDC load.\n\
        \     \n\
        \       This setting works together with the [CdcInsertsOnly] and the \
         [CdcInsertsAndUpdates] parameters for output to .csv files only. For more information \
         about how these settings work together, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring.InsertOps}Indicating \
         Source DB Operations in Migrated S3 Data} in the {i Database Migration Service User \
         Guide.}.\n\
        \       \n\
        \        "]
  enable_statistics : boolean_optional option;
      [@ocaml.doc
        "A value that enables statistics for Parquet pages and row groups. Choose [true] to enable \
         statistics, [false] to disable. Statistics include [NULL], [DISTINCT], [MAX], and [MIN] \
         values. This parameter defaults to [true]. This value is used for .parquet file format \
         only.\n"]
  parquet_version : parquet_version_value option;
      [@ocaml.doc
        "The version of the Apache Parquet format that you want to use: [parquet_1_0] (the \
         default) or [parquet_2_0].\n"]
  data_page_size : integer_optional option;
      [@ocaml.doc
        "The size of one data page in bytes. This parameter defaults to 1024 * 1024 bytes (1 MiB). \
         This number is used for .parquet file format only. \n"]
  row_group_length : integer_optional option;
      [@ocaml.doc
        "The number of rows in a row group. A smaller row group size provides faster reads. But as \
         the number of row groups grows, the slower writes become. This parameter defaults to \
         10,000 rows. This number is used for .parquet file format only. \n\n\
        \ If you choose a value larger than the maximum, [RowGroupLength] is set to the max row \
         group length in bytes (64 * 1024 * 1024). \n\
        \ "]
  dict_page_size_limit : integer_optional option;
      [@ocaml.doc
        "The maximum size of an encoded dictionary page of a column. If the dictionary page \
         exceeds this, this column is stored using an encoding type of [PLAIN]. This parameter \
         defaults to 1024 * 1024 bytes (1 MiB), the maximum size of a dictionary page before it \
         reverts to [PLAIN] encoding. This size is used for .parquet file format only. \n"]
  encoding_type : encoding_type_value option;
      [@ocaml.doc
        "The type of encoding you are using: \n\n\
        \ {ul\n\
        \       {-   [RLE_DICTIONARY] uses a combination of bit-packing and run-length encoding to \
         store repeated values more efficiently. This is the default.\n\
        \           \n\
        \            }\n\
        \       {-   [PLAIN] doesn't use encoding at all. Values are stored as they are.\n\
        \           \n\
        \            }\n\
        \       {-   [PLAIN_DICTIONARY] builds a dictionary of the values encountered in a given \
         column. The dictionary is stored in a dictionary page for each column chunk.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  data_format : data_format_value option;
      [@ocaml.doc
        "The format of the data that you want to use for output. You can choose one of the \
         following: \n\n\
        \ {ul\n\
        \       {-   [csv] : This is a row-based file format with comma-separated values (.csv). \n\
        \           \n\
        \            }\n\
        \       {-   [parquet] : Apache Parquet (.parquet) is a columnar storage file format that \
         features efficient compression and provides faster query response. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  server_side_encryption_kms_key_id : string_ option;
      [@ocaml.doc
        "If you are using [SSE_KMS] for the [EncryptionMode], provide the KMS key ID. The key that \
         you use needs an attached policy that enables Identity and Access Management (IAM) user \
         permissions and allows use of the key.\n\n\
        \ Here is a CLI example: \n\
        \ {[\n\
        \ aws dms create-endpoint --endpoint-identifier {i value} --endpoint-type target \
         --engine-name s3 --s3-settings ServiceAccessRoleArn={i value},BucketFolder={i \
         value},BucketName={i value},EncryptionMode=SSE_KMS,ServerSideEncryptionKmsKeyId={i value} \n\
        \ ]}\n\
        \  \n\
        \ "]
  encryption_mode : encryption_mode_value option;
      [@ocaml.doc
        "The type of server-side encryption that you want to use for your data. This encryption \
         type is part of the endpoint settings or the extra connections attributes for Amazon S3. \
         You can choose either [SSE_S3] (the default) or [SSE_KMS]. \n\n\
        \  For the [ModifyEndpoint] operation, you can change the existing value of the \
         [EncryptionMode] parameter from [SSE_KMS] to [SSE_S3]. But you can\226\128\153t change \
         the existing value from [SSE_S3] to [SSE_KMS].\n\
        \  \n\
        \    To use [SSE_S3], you need an Identity and Access Management (IAM) role with \
         permission to allow [\"arn:aws:s3:::dms-*\"] to use the following actions:\n\
        \    \n\
        \     {ul\n\
        \           {-   [s3:CreateBucket] \n\
        \               \n\
        \                }\n\
        \           {-   [s3:ListBucket] \n\
        \               \n\
        \                }\n\
        \           {-   [s3:DeleteBucket] \n\
        \               \n\
        \                }\n\
        \           {-   [s3:GetBucketLocation] \n\
        \               \n\
        \                }\n\
        \           {-   [s3:GetObject] \n\
        \               \n\
        \                }\n\
        \           {-   [s3:PutObject] \n\
        \               \n\
        \                }\n\
        \           {-   [s3:DeleteObject] \n\
        \               \n\
        \                }\n\
        \           {-   [s3:GetObjectVersion] \n\
        \               \n\
        \                }\n\
        \           {-   [s3:GetBucketPolicy] \n\
        \               \n\
        \                }\n\
        \           {-   [s3:PutBucketPolicy] \n\
        \               \n\
        \                }\n\
        \           {-   [s3:DeleteBucketPolicy] \n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
  compression_type : compression_type_value option;
      [@ocaml.doc
        "An optional parameter to use GZIP to compress the target files. Set to GZIP to compress \
         the target files. Either set this parameter to NONE (the default) or don't use it to \
         leave the files uncompressed. This parameter applies to both .csv and .parquet file \
         formats. \n"]
  bucket_name : string_ option; [@ocaml.doc " The name of the S3 bucket. \n"]
  bucket_folder : string_ option;
      [@ocaml.doc
        " An optional parameter to set a folder name in the S3 bucket. If provided, tables are \
         created in the path \n\
         {[\n\
        \ {i bucketFolder}/{i schema_name}/{i table_name}/\n\
         ]}\n\
         . If this parameter isn't specified, then the path used is \n\
         {[\n\
        \ {i schema_name}/{i table_name}/\n\
         ]}\n\
         . \n"]
  csv_delimiter : string_ option;
      [@ocaml.doc
        " The delimiter used to separate columns in the .csv file for both source and target. The \
         default is a comma. \n"]
  csv_row_delimiter : string_ option;
      [@ocaml.doc
        " The delimiter used to separate rows in the .csv file for both source and target. The \
         default is a carriage return ([\\n]). \n"]
  external_table_definition : string_ option;
      [@ocaml.doc " Specifies how tables are defined in the S3 source files only. \n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) used by the service to access the IAM role. The role must \
         allow the [iam:PassRole] action. It is a required parameter that enables DMS to write and \
         read objects from an S3 bucket.\n"]
}
[@@ocaml.doc "Settings for exporting data to Amazon S3. \n"]

type nonrec run_fleet_advisor_lsa_analysis_response = {
  status : string_ option; [@ocaml.doc "The status of the LSA analysis, for example [COMPLETED].\n"]
  lsa_analysis_id : string_ option; [@ocaml.doc "The ID of the LSA analysis run.\n"]
}
[@@ocaml.doc ""]

type nonrec pending_maintenance_action = {
  description : string_ option;
      [@ocaml.doc "A description providing more detail about the maintenance action.\n"]
  current_apply_date : t_stamp option;
      [@ocaml.doc
        "The effective date when the pending maintenance action will be applied to the resource. \
         This date takes into account opt-in requests received from the \
         [ApplyPendingMaintenanceAction] API operation, and also the [AutoAppliedAfterDate] and \
         [ForcedApplyDate] parameter values. This value is blank if an opt-in request has not been \
         received and nothing has been specified for [AutoAppliedAfterDate] or [ForcedApplyDate].\n"]
  opt_in_status : string_ option;
      [@ocaml.doc "The type of opt-in request that has been received for the resource.\n"]
  forced_apply_date : t_stamp option;
      [@ocaml.doc
        "The date when the maintenance action will be automatically applied. The maintenance \
         action is applied to the resource on this date regardless of the maintenance window for \
         the resource. If this date is specified, any [immediate] opt-in requests are ignored.\n"]
  auto_applied_after_date : t_stamp option;
      [@ocaml.doc
        "The date of the maintenance window when the action is to be applied. The maintenance \
         action is applied to the resource during its first maintenance window after this date. If \
         this date is specified, any [next-maintenance] opt-in requests are ignored.\n"]
  action : string_ option;
      [@ocaml.doc "The type of pending maintenance action that is available for the resource.\n"]
}
[@@ocaml.doc
  "Describes a maintenance action pending for an DMS resource, including when and how it will be \
   applied. This data type is a response element to the [DescribePendingMaintenanceActions] \
   operation.\n"]

type nonrec pending_maintenance_action_details = pending_maintenance_action list [@@ocaml.doc ""]

type nonrec resource_pending_maintenance_actions = {
  pending_maintenance_action_details : pending_maintenance_action_details option;
      [@ocaml.doc "Detailed information about the pending maintenance action.\n"]
  resource_identifier : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the DMS resource that the pending maintenance action \
         applies to. For information about creating an ARN, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.AWS.ARN.html} \
         Constructing an Amazon Resource Name (ARN) for DMS} in the DMS documentation.\n"]
}
[@@ocaml.doc "Identifies an DMS resource and any pending actions for it.\n"]

type nonrec replication_task_list = replication_task list [@@ocaml.doc ""]

type nonrec replication_task_individual_assessment = {
  replication_task_individual_assessment_start_date : t_stamp option;
      [@ocaml.doc
        "Date when this individual assessment was started as part of running the \
         [StartReplicationTaskAssessmentRun] operation.\n"]
  status : string_ option;
      [@ocaml.doc
        "Individual assessment status.\n\n\
        \ This status can have one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [\"cancelled\"] \n\
        \            \n\
        \             }\n\
        \        {-   [\"error\"] \n\
        \            \n\
        \             }\n\
        \        {-   [\"failed\"] \n\
        \            \n\
        \             }\n\
        \        {-   [\"passed\"] \n\
        \            \n\
        \             }\n\
        \        {-   [\"pending\"] \n\
        \            \n\
        \             }\n\
        \        {-   [\"skipped\"] \n\
        \            \n\
        \             }\n\
        \        {-   [\"running\"] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  individual_assessment_name : string_ option; [@ocaml.doc "Name of this individual assessment.\n"]
  replication_task_assessment_run_arn : string_ option;
      [@ocaml.doc
        "ARN of the premigration assessment run that is created to run this individual assessment.\n"]
  replication_task_individual_assessment_arn : string_ option;
      [@ocaml.doc "Amazon Resource Name (ARN) of this individual assessment.\n"]
}
[@@ocaml.doc
  "Provides information that describes an individual assessment from a premigration assessment run.\n"]

type nonrec replication_task_individual_assessment_list =
  replication_task_individual_assessment list
[@@ocaml.doc ""]

type nonrec replication_task_assessment_run_list = replication_task_assessment_run list
[@@ocaml.doc ""]

type nonrec replication_task_assessment_result = {
  s3_object_url : secret_string option;
      [@ocaml.doc
        " The URL of the S3 object containing the task assessment results. \n\n\
        \ The response object only contains this field if you provide \
         [DescribeReplicationTaskAssessmentResultsMessage$ReplicationTaskArn] in the request.\n\
        \ "]
  assessment_results : string_ option;
      [@ocaml.doc
        " The task assessment results in JSON format. \n\n\
        \ The response object only contains this field if you provide \
         [DescribeReplicationTaskAssessmentResultsMessage$ReplicationTaskArn] in the request.\n\
        \ "]
  assessment_results_file : string_ option;
      [@ocaml.doc " The file containing the results of the task assessment. \n"]
  assessment_status : string_ option; [@ocaml.doc " The status of the task assessment. \n"]
  replication_task_last_assessment_date : t_stamp option;
      [@ocaml.doc "The date the task assessment was completed. \n"]
  replication_task_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication task. \n"]
  replication_task_identifier : string_ option;
      [@ocaml.doc
        " The replication task identifier of the task on which the task assessment was run. \n"]
}
[@@ocaml.doc " The task assessment report in JSON format. \n"]

type nonrec replication_task_assessment_result_list = replication_task_assessment_result list
[@@ocaml.doc ""]

type nonrec replication_table_statistics_list = table_statistics list [@@ocaml.doc ""]

type nonrec replication_subnet_group = {
  is_read_only : boolean_optional option;
      [@ocaml.doc
        "Indicates whether the replication subnet group is read-only. When set to [true], this \
         subnet group is managed by DMS as part of a zero-ETL integration and cannot be modified \
         or deleted directly. You can only modify or delete read-only subnet groups through their \
         associated zero-ETL integration.\n"]
  supported_network_types : string_list option;
      [@ocaml.doc
        "The IP addressing protocol supported by the subnet group. This is used by a replication \
         instance with values such as IPv4 only or Dual-stack that supports both IPv4 and IPv6 \
         addressing. IPv6 only is not yet supported.\n"]
  subnets : subnet_list option; [@ocaml.doc "The subnets that are in the subnet group.\n"]
  subnet_group_status : string_ option; [@ocaml.doc "The status of the subnet group.\n"]
  vpc_id : string_ option; [@ocaml.doc "The ID of the VPC.\n"]
  replication_subnet_group_description : string_ option;
      [@ocaml.doc "A description for the replication subnet group.\n"]
  replication_subnet_group_identifier : string_ option;
      [@ocaml.doc "The identifier of the replication instance subnet group.\n"]
}
[@@ocaml.doc
  "Describes a subnet group in response to a request by the [DescribeReplicationSubnetGroups] \
   operation.\n"]

type nonrec replication_subnet_groups = replication_subnet_group list [@@ocaml.doc ""]

type nonrec replication_subnet_group_does_not_cover_enough_a_zs = {
  message : exception_message option; [@ocaml.doc "\n"]
}
[@@ocaml.doc
  "The replication subnet group does not cover enough Availability Zones (AZs). Edit the \
   replication subnet group and add more AZs.\n"]

type nonrec replication_instance_class = string [@@ocaml.doc ""]

type nonrec replication_pending_modified_values = {
  network_type : string_ option;
      [@ocaml.doc
        "The type of IP address protocol used by a replication instance, such as IPv4 only or \
         Dual-stack that supports both IPv4 and IPv6 addressing. IPv6 only is not yet supported.\n"]
  engine_version : string_ option;
      [@ocaml.doc "The engine version number of the replication instance.\n"]
  multi_a_z : boolean_optional option;
      [@ocaml.doc
        " Specifies whether the replication instance is a Multi-AZ deployment. You can't set the \
         [AvailabilityZone] parameter if the Multi-AZ parameter is set to [true]. \n"]
  allocated_storage : integer_optional option;
      [@ocaml.doc
        "The amount of storage (in gigabytes) that is allocated for the replication instance.\n"]
  replication_instance_class : replication_instance_class option;
      [@ocaml.doc
        "The compute and memory capacity of the replication instance as defined for the specified \
         replication instance class.\n\n\
        \ For more information on the settings and capacities for the available replication \
         instance classes, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth} \
         Selecting the right DMS replication instance for your migration}. \n\
        \ "]
}
[@@ocaml.doc
  "Provides information about the values of pending modifications to a replication instance. This \
   data type is an object of the \
   {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_ReplicationInstance.html} \
   [ReplicationInstance] } user-defined data type. \n"]

type nonrec replication_list = replication list [@@ocaml.doc ""]

type nonrec replication_instance_task_log = {
  replication_instance_task_log_size : long option;
      [@ocaml.doc "The size, in bytes, of the replication task log.\n"]
  replication_task_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication task.\n"]
  replication_task_name : string_ option; [@ocaml.doc "The name of the replication task.\n"]
}
[@@ocaml.doc "Contains metadata for a replication instance task log.\n"]

type nonrec replication_instance_task_logs_list = replication_instance_task_log list
[@@ocaml.doc ""]

type nonrec replication_instance_public_ip_address_list = string_ list [@@ocaml.doc ""]

type nonrec replication_instance_private_ip_address_list = string_ list [@@ocaml.doc ""]

type nonrec replication_instance_ipv6_address_list = string_ list [@@ocaml.doc ""]

type nonrec kerberos_authentication_settings = {
  krb5_file_contents : string_ option;
      [@ocaml.doc
        "Specifies the contents of krb5 configuration file required for kerberos authentication.\n"]
  key_cache_secret_iam_arn : string_ option;
      [@ocaml.doc
        "Specifies the Amazon Resource Name (ARN) of the IAM role that grants Amazon Web Services \
         DMS access to the secret containing key cache file for the kerberos authentication.\n"]
  key_cache_secret_id : string_ option;
      [@ocaml.doc
        "Specifies the ID of the secret that stores the key cache file required for kerberos \
         authentication.\n"]
}
[@@ocaml.doc
  "Specifies the settings required for kerberos authentication when creating the replication \
   instance.\n"]

type nonrec replication_instance = {
  kerberos_authentication_settings : kerberos_authentication_settings option;
      [@ocaml.doc
        "Specifies the settings required for kerberos authentication when replicating an instance.\n"]
  network_type : string_ option;
      [@ocaml.doc
        "The type of IP address protocol used by a replication instance, such as IPv4 only or \
         Dual-stack that supports both IPv4 and IPv6 addressing. IPv6 only is not yet supported.\n"]
  dns_name_servers : string_ option;
      [@ocaml.doc
        "The DNS name servers supported for the replication instance to access your on-premise \
         source or target database.\n"]
  free_until : t_stamp option;
      [@ocaml.doc
        " The expiration date of the free replication instance that is part of the Free DMS \
         program. \n"]
  secondary_availability_zone : string_ option;
      [@ocaml.doc
        "The Availability Zone of the standby replication instance in a Multi-AZ deployment.\n"]
  publicly_accessible : boolean_ option;
      [@ocaml.doc
        " Specifies the accessibility options for the replication instance. A value of [true] \
         represents an instance with a public IP address. A value of [false] represents an \
         instance with a private IP address. The default value is [true]. \n"]
  replication_instance_ipv6_addresses : replication_instance_ipv6_address_list option;
      [@ocaml.doc "One or more IPv6 addresses for the replication instance.\n"]
  replication_instance_private_ip_addresses : replication_instance_private_ip_address_list option;
      [@ocaml.doc "One or more private IP addresses for the replication instance.\n"]
  replication_instance_public_ip_addresses : replication_instance_public_ip_address_list option;
      [@ocaml.doc "One or more public IP addresses for the replication instance.\n"]
  replication_instance_private_ip_address : string_ option;
      [@ocaml.doc "The private IP address of the replication instance.\n"]
  replication_instance_public_ip_address : string_ option;
      [@ocaml.doc "The public IP address of the replication instance.\n"]
  replication_instance_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication instance.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "An KMS key identifier that is used to encrypt the data on the replication instance.\n\n\
        \ If you don't specify a value for the [KmsKeyId] parameter, then DMS uses your default \
         encryption key.\n\
        \ \n\
        \  KMS creates the default encryption key for your Amazon Web Services account. Your \
         Amazon Web Services account has a different default encryption key for each Amazon Web \
         Services Region.\n\
        \  "]
  auto_minor_version_upgrade : boolean_ option;
      [@ocaml.doc
        "Boolean value indicating if minor version upgrades will be automatically applied to the \
         instance.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The engine version number of the replication instance.\n\n\
        \ If an engine version number is not specified when a replication instance is created, the \
         default is the latest engine version available.\n\
        \ \n\
        \  When modifying a major engine version of an instance, also set \
         [AllowMajorVersionUpgrade] to [true].\n\
        \  "]
  multi_a_z : boolean_ option;
      [@ocaml.doc
        " Specifies whether the replication instance is a Multi-AZ deployment. You can't set the \
         [AvailabilityZone] parameter if the Multi-AZ parameter is set to [true]. \n"]
  pending_modified_values : replication_pending_modified_values option;
      [@ocaml.doc "The pending modification values.\n"]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The maintenance window times for the replication instance. Any pending upgrades to the \
         replication instance are performed during this time.\n"]
  replication_subnet_group : replication_subnet_group option;
      [@ocaml.doc "The subnet group for the replication instance.\n"]
  availability_zone : string_ option; [@ocaml.doc "The Availability Zone for the instance.\n"]
  vpc_security_groups : vpc_security_group_membership_list option;
      [@ocaml.doc "The VPC security group for the instance.\n"]
  instance_create_time : t_stamp option;
      [@ocaml.doc "The time the replication instance was created.\n"]
  allocated_storage : integer option;
      [@ocaml.doc
        "The amount of storage (in gigabytes) that is allocated for the replication instance.\n"]
  replication_instance_status : string_ option;
      [@ocaml.doc
        "The status of the replication instance. The possible return values include:\n\n\
        \ {ul\n\
        \       {-   [\"available\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"creating\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"deleted\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"deleting\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"failed\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"modifying\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"upgrading\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"rebooting\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"resetting-master-credentials\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"storage-full\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"incompatible-credentials\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"incompatible-network\"] \n\
        \           \n\
        \            }\n\
        \       {-   [\"maintenance\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  replication_instance_class : replication_instance_class option;
      [@ocaml.doc
        "The compute and memory capacity of the replication instance as defined for the specified \
         replication instance class. It is a required parameter, although a default value is \
         pre-selected in the DMS console.\n\n\
        \ For more information on the settings and capacities for the available replication \
         instance classes, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth} \
         Selecting the right DMS replication instance for your migration}. \n\
        \ "]
  replication_instance_identifier : string_ option;
      [@ocaml.doc
        "The replication instance identifier is a required parameter. This parameter is stored as \
         a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain 1-63 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [myrepinstance] \n\
        \   "]
}
[@@ocaml.doc "Provides information that defines a replication instance.\n"]

type nonrec replication_instance_list = replication_instance list [@@ocaml.doc ""]

type nonrec compute_config = {
  vpc_security_group_ids : string_list option;
      [@ocaml.doc
        "Specifies the virtual private cloud (VPC) security group to use with the DMS Serverless \
         replication. The VPC security group must work with the VPC containing the replication.\n"]
  replication_subnet_group_id : string_ option;
      [@ocaml.doc
        "Specifies a subnet group identifier to associate with the DMS Serverless replication.\n"]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The weekly time range during which system maintenance can occur for the DMS Serverless \
         replication, in Universal Coordinated Time (UTC). The format is \
         [ddd:hh24:mi-ddd:hh24:mi].\n\n\
        \ The default is a 30-minute window selected at random from an 8-hour block of time per \
         Amazon Web Services Region. This maintenance occurs on a random day of the week. Valid \
         values for days of the week include [Mon], [Tue], [Wed], [Thu], [Fri], [Sat], and [Sun].\n\
        \ \n\
        \  Constraints include a minimum 30-minute window.\n\
        \  "]
  multi_a_z : boolean_optional option;
      [@ocaml.doc
        "Specifies whether the DMS Serverless replication is a Multi-AZ deployment. You can't set \
         the [AvailabilityZone] parameter if the [MultiAZ] parameter is set to [true].\n"]
  min_capacity_units : integer_optional option;
      [@ocaml.doc
        "Specifies the minimum value of the DMS capacity units (DCUs) for which a given DMS \
         Serverless replication can be provisioned. A single DCU is 2GB of RAM, with 1 DCU as the \
         minimum value allowed. The list of valid DCU values includes 1, 2, 4, 8, 16, 32, 64, 128, \
         192, 256, and 384. So, the minimum DCU value that you can specify for DMS Serverless is \
         1. If you don't set this value, DMS sets this parameter to the minimum DCU value allowed, \
         1. If there is no current source activity, DMS scales down your replication until it \
         reaches the value specified in [MinCapacityUnits].\n"]
  max_capacity_units : integer_optional option;
      [@ocaml.doc
        "Specifies the maximum value of the DMS capacity units (DCUs) for which a given DMS \
         Serverless replication can be provisioned. A single DCU is 2GB of RAM, with 1 DCU as the \
         minimum value allowed. The list of valid DCU values includes 1, 2, 4, 8, 16, 32, 64, 128, \
         192, 256, and 384. So, the maximum value that you can specify for DMS Serverless is 384. \
         The [MaxCapacityUnits] parameter is the only DCU parameter you are required to specify.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "An Key Management Service (KMS) key Amazon Resource Name (ARN) that is used to encrypt \
         the data during DMS Serverless replication.\n\n\
        \ If you don't specify a value for the [KmsKeyId] parameter, DMS uses your default \
         encryption key.\n\
        \ \n\
        \  KMS creates the default encryption key for your Amazon Web Services account. Your \
         Amazon Web Services account has a different default encryption key for each Amazon Web \
         Services Region.\n\
        \  "]
  dns_name_servers : string_ option;
      [@ocaml.doc
        "A list of custom DNS name servers supported for the DMS Serverless replication to access \
         your source or target database. This list overrides the default name servers supported by \
         the DMS Serverless replication. You can specify a comma-separated list of internet \
         addresses for up to four DNS name servers. For example: \
         [\"1.1.1.1,2.2.2.2,3.3.3.3,4.4.4.4\"] \n"]
  availability_zone : string_ option;
      [@ocaml.doc
        "The Availability Zone where the DMS Serverless replication using this configuration will \
         run. The default value is a random, system-chosen Availability Zone in the \
         configuration's Amazon Web Services Region, for example, [\"us-west-2\"]. You can't set \
         this parameter if the [MultiAZ] parameter is set to [true].\n"]
}
[@@ocaml.doc "Configuration parameters for provisioning an DMS Serverless replication.\n"]

type nonrec replication_config = {
  is_read_only : boolean_optional option;
      [@ocaml.doc
        "Indicates whether the replication configuration is read-only. When set to [true], this \
         replication configuration is managed by DMS as part of a zero-ETL integration and cannot \
         be modified or deleted directly. You can only modify or delete read-only replication \
         configurations through their associated zero-ETL integration.\n"]
  replication_config_update_time : t_stamp option;
      [@ocaml.doc "The time the serverless replication config was updated.\n"]
  replication_config_create_time : t_stamp option;
      [@ocaml.doc "The time the serverless replication config was created.\n"]
  table_mappings : string_ option; [@ocaml.doc "Table mappings specified in the replication.\n"]
  supplemental_settings : string_ option;
      [@ocaml.doc "Additional parameters for an DMS serverless replication.\n"]
  replication_settings : string_ option;
      [@ocaml.doc "Configuration parameters for an DMS serverless replication.\n"]
  compute_config : compute_config option;
      [@ocaml.doc "Configuration parameters for provisioning an DMS serverless replication.\n"]
  replication_type : migration_type_value option; [@ocaml.doc "The type of the replication.\n"]
  target_endpoint_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target endpoint for this DMS serverless replication \
         configuration.\n"]
  source_endpoint_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source endpoint for this DMS serverless replication \
         configuration.\n"]
  replication_config_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of this DMS Serverless replication configuration.\n"]
  replication_config_identifier : string_ option;
      [@ocaml.doc "The identifier for the [ReplicationConfig] associated with the replication.\n"]
}
[@@ocaml.doc "This object provides configuration information about a serverless replication.\n"]

type nonrec replication_config_list = replication_config list [@@ocaml.doc ""]

type nonrec remove_tags_from_resource_response = unit [@@ocaml.doc ""]

type nonrec key_list = string_ list [@@ocaml.doc ""]

type nonrec remove_tags_from_resource_message = {
  tag_keys : key_list; [@ocaml.doc "The tag key (name) of the tag to be removed.\n"]
  resource_arn : string_;
      [@ocaml.doc
        "An DMS resource from which you want to remove tag(s). The value for this parameter is an \
         Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc "Removes one or more tags from an DMS resource.\n"]

type nonrec reload_tables_response = {
  replication_task_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication task. \n"]
}
[@@ocaml.doc ""]

type nonrec reload_option_value = VALIDATE_ONLY [@ocaml.doc ""] | DATA_RELOAD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reload_tables_message = {
  reload_option : reload_option_value option;
      [@ocaml.doc
        "Options for reload. Specify [data-reload] to reload the data and re-validate it if \
         validation is enabled. Specify [validate-only] to re-validate the table. This option \
         applies only when validation is enabled for the task. \n\n\
        \ Valid values: data-reload, validate-only\n\
        \ \n\
        \  Default value is data-reload.\n\
        \  "]
  tables_to_reload : table_list_to_reload;
      [@ocaml.doc "The name and schema of the table to be reloaded. \n"]
  replication_task_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication task. \n"]
}
[@@ocaml.doc ""]

type nonrec reload_replication_tables_response = {
  replication_config_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name of the replication config for which to reload tables.\n"]
}
[@@ocaml.doc "\n"]

type nonrec reload_replication_tables_message = {
  reload_option : reload_option_value option;
      [@ocaml.doc
        "Options for reload. Specify [data-reload] to reload the data and re-validate it if \
         validation is enabled. Specify [validate-only] to re-validate the table. This option \
         applies only when validation is enabled for the replication. \n"]
  tables_to_reload : table_list_to_reload; [@ocaml.doc "The list of tables to reload.\n"]
  replication_config_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name of the replication config for which to reload tables.\n"]
}
[@@ocaml.doc "\n"]

type nonrec release_status_values = PROD [@ocaml.doc ""] | BETA [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec refresh_schemas_status_type_value =
  | REFRESHING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCESSFUL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec refresh_schemas_status = {
  last_failure_message : string_ option; [@ocaml.doc "The last failure message for the schema.\n"]
  last_refresh_date : t_stamp option; [@ocaml.doc "The date the schema was last refreshed.\n"]
  status : refresh_schemas_status_type_value option; [@ocaml.doc "The status of the schema.\n"]
  replication_instance_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication instance.\n"]
  endpoint_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.\n"]
}
[@@ocaml.doc
  "Provides information that describes status of a schema at an endpoint specified by the \
   [DescribeRefreshSchemaStatus] operation.\n"]

type nonrec refresh_schemas_response = {
  refresh_schemas_status : refresh_schemas_status option;
      [@ocaml.doc "The status of the refreshed schema.\n"]
}
[@@ocaml.doc "\n"]

type nonrec refresh_schemas_message = {
  replication_instance_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication instance.\n"]
  endpoint_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.\n"]
}
[@@ocaml.doc "\n"]

type nonrec redshift_settings = {
  map_boolean_as_boolean : boolean_optional option;
      [@ocaml.doc
        "When true, lets Redshift migrate the boolean type as boolean. By default, Redshift \
         migrates booleans as [varchar(1)]. You must set this setting on both the source and \
         target endpoints for it to take effect.\n"]
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The full ARN, partial ARN, or friendly name of the [SecretsManagerSecret] that contains \
         the Amazon Redshift endpoint connection details.\n"]
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted \
         entity and grants the required permissions to access the value in [SecretsManagerSecret]. \
         The role must allow the [iam:PassRole] action. [SecretsManagerSecret] has the value of \
         the Amazon Web Services Secrets Manager secret that allows access to the Amazon Redshift \
         endpoint.\n\n\
        \  You can specify one of two sets of values for these permissions. You can specify the \
         values for this setting and [SecretsManagerSecretId]. Or you can specify clear-text \
         values for [UserName], [Password], [ServerName], and [Port]. You can't specify both. For \
         more information on creating this [SecretsManagerSecret] and the \
         [SecretsManagerAccessRoleArn] and [SecretsManagerSecretId] required to access it, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager}Using \
         secrets to access Database Migration Service resources} in the {i Database Migration \
         Service User Guide}.\n\
        \  \n\
        \   "]
  write_buffer_size : integer_optional option;
      [@ocaml.doc
        "The size (in KB) of the in-memory file write buffer used when generating .csv files on \
         the local disk at the DMS replication instance. The default value is 1000 (buffer size is \
         1000KB).\n"]
  username : string_ option; [@ocaml.doc "An Amazon Redshift user name for a registered user.\n"]
  truncate_columns : boolean_optional option;
      [@ocaml.doc
        "A value that specifies to truncate data in columns to the appropriate number of \
         characters, so that the data fits in the column. This parameter applies only to columns \
         with a VARCHAR or CHAR data type, and rows with a size of 4 MB or less. Choose [true] to \
         truncate data. The default is [false].\n"]
  trim_blanks : boolean_optional option;
      [@ocaml.doc
        "A value that specifies to remove the trailing white space characters from a VARCHAR \
         string. This parameter applies only to columns with a VARCHAR data type. Choose [true] to \
         remove unneeded white space. The default is [false].\n"]
  time_format : string_ option;
      [@ocaml.doc
        "The time format that you want to use. Valid values are [auto] (case-sensitive), \
         ['timeformat_string'], ['epochsecs'], or ['epochmillisecs']. It defaults to 10. Using \
         [auto] recognizes most strings, even some that aren't supported when you use a time \
         format string. \n\n\
        \ If your date and time values use formats different from each other, set this parameter \
         to [auto]. \n\
        \ "]
  server_side_encryption_kms_key_id : string_ option;
      [@ocaml.doc
        "The KMS key ID. If you are using [SSE_KMS] for the [EncryptionMode], provide this key ID. \
         The key that you use needs an attached policy that enables IAM user permissions and \
         allows use of the key.\n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that has access to the Amazon Redshift \
         service. The role must allow the [iam:PassRole] action.\n"]
  server_name : string_ option;
      [@ocaml.doc "The name of the Amazon Redshift cluster you are using.\n"]
  replace_chars : string_ option;
      [@ocaml.doc
        "A value that specifies to replaces the invalid characters specified in \
         [ReplaceInvalidChars], substituting the specified characters instead. The default is \
         [\"?\"].\n"]
  replace_invalid_chars : string_ option;
      [@ocaml.doc "A list of characters that you want to replace. Use with [ReplaceChars].\n"]
  remove_quotes : boolean_optional option;
      [@ocaml.doc
        "A value that specifies to remove surrounding quotation marks from strings in the incoming \
         data. All characters within the quotation marks, including delimiters, are retained. \
         Choose [true] to remove quotation marks. The default is [false].\n"]
  port : integer_optional option;
      [@ocaml.doc "The port number for Amazon Redshift. The default value is 5439.\n"]
  password : secret_string option;
      [@ocaml.doc "The password for the user named in the [username] property.\n"]
  max_file_size : integer_optional option;
      [@ocaml.doc
        "The maximum size (in KB) of any .csv file used to load data on an S3 bucket and transfer \
         data to Amazon Redshift. It defaults to 1048576KB (1 GB).\n"]
  load_timeout : integer_optional option;
      [@ocaml.doc
        "The amount of time to wait (in seconds) before timing out of operations performed by DMS \
         on a Redshift cluster, such as Redshift COPY, INSERT, DELETE, and UPDATE.\n"]
  file_transfer_upload_streams : integer_optional option;
      [@ocaml.doc
        "The number of threads used to upload a single file. This parameter accepts a value from 1 \
         through 64. It defaults to 10.\n\n\
        \ The number of parallel streams used to upload a single .csv file to an S3 bucket using \
         S3 Multipart Upload. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html}Multipart upload \
         overview}. \n\
        \ \n\
        \   [FileTransferUploadStreams] accepts a value from 1 through 64. It defaults to 10.\n\
        \  "]
  explicit_ids : boolean_optional option;
      [@ocaml.doc
        "This setting is only valid for a full-load migration task. Set [ExplicitIds] to [true] to \
         have tables with [IDENTITY] columns override their auto-generated values with explicit \
         values loaded from the source data files used to populate the tables. The default is \
         [false].\n"]
  encryption_mode : encryption_mode_value option;
      [@ocaml.doc
        "The type of server-side encryption that you want to use for your data. This encryption \
         type is part of the endpoint settings or the extra connections attributes for Amazon S3. \
         You can choose either [SSE_S3] (the default) or [SSE_KMS]. \n\n\
        \  For the [ModifyEndpoint] operation, you can change the existing value of the \
         [EncryptionMode] parameter from [SSE_KMS] to [SSE_S3]. But you can\226\128\153t change \
         the existing value from [SSE_S3] to [SSE_KMS].\n\
        \  \n\
        \    To use [SSE_S3], create an Identity and Access Management (IAM) role with a policy \
         that allows [\"arn:aws:s3:::*\"] to use the following actions: [\"s3:PutObject\",\n\
        \            \"s3:ListBucket\"] \n\
        \    "]
  empty_as_null : boolean_optional option;
      [@ocaml.doc
        "A value that specifies whether DMS should migrate empty CHAR and VARCHAR fields as NULL. \
         A value of [true] sets empty CHAR and VARCHAR fields to null. The default is [false].\n"]
  date_format : string_ option;
      [@ocaml.doc
        "The date format that you are using. Valid values are [auto] (case-sensitive), your date \
         format string enclosed in quotes, or NULL. If this parameter is left unset (NULL), it \
         defaults to a format of 'YYYY-MM-DD'. Using [auto] recognizes most strings, even some \
         that aren't supported when you use a date format string. \n\n\
        \ If your date and time values use formats different from each other, set this to [auto]. \n\
        \ "]
  database_name : string_ option;
      [@ocaml.doc
        "The name of the Amazon Redshift data warehouse (service) that you are working with.\n"]
  connection_timeout : integer_optional option;
      [@ocaml.doc
        "A value that sets the amount of time to wait (in milliseconds) before timing out, \
         beginning from when you initially establish a connection.\n"]
  comp_update : boolean_optional option;
      [@ocaml.doc
        "If you set [CompUpdate] to [true] Amazon Redshift applies automatic compression if the \
         table is empty. This applies even if the table columns already have encodings other than \
         [RAW]. If you set [CompUpdate] to [false], automatic compression is disabled and existing \
         column encodings aren't changed. The default is [true].\n"]
  case_sensitive_names : boolean_optional option;
      [@ocaml.doc
        "If Amazon Redshift is configured to support case sensitive schema names, set \
         [CaseSensitiveNames] to [true]. The default is [false].\n"]
  bucket_name : string_ option;
      [@ocaml.doc
        "The name of the intermediate S3 bucket used to store .csv files before uploading data to \
         Redshift.\n"]
  bucket_folder : string_ option;
      [@ocaml.doc
        "An S3 folder where the comma-separated-value (.csv) files are stored before being \
         uploaded to the target Redshift cluster. \n\n\
        \ For full load mode, DMS converts source records into .csv files and loads them to the {i \
         BucketFolder/TableID} path. DMS uses the Redshift [COPY] command to upload the .csv files \
         to the target table. The files are deleted once the [COPY] operation has finished. For \
         more information, see {{:https://docs.aws.amazon.com/redshift/latest/dg/r_COPY.html}COPY} \
         in the {i Amazon Redshift Database Developer Guide}.\n\
        \ \n\
        \  For change-data-capture (CDC) mode, DMS creates a {i NetChanges} table, and loads the \
         .csv files to this {i BucketFolder/NetChangesTableID} path.\n\
        \  "]
  after_connect_script : string_ option;
      [@ocaml.doc
        "Code to run after connecting. This parameter should contain the code itself, not the name \
         of a file containing the code.\n"]
  accept_any_date : boolean_optional option;
      [@ocaml.doc
        "A value that indicates to allow any date format, including invalid formats such as \
         00/00/00 00:00:00, to be loaded without generating an error. You can choose [true] or \
         [false] (the default).\n\n\
        \ This parameter applies only to TIMESTAMP and DATE columns. Always use ACCEPTANYDATE with \
         the DATEFORMAT parameter. If the date format for the data doesn't match the DATEFORMAT \
         specification, Amazon Redshift inserts a NULL value into that field. \n\
        \ "]
}
[@@ocaml.doc "Provides information that defines an Amazon Redshift endpoint.\n"]

type nonrec redshift_data_provider_settings = {
  s3_access_role_arn : string_ option;
      [@ocaml.doc "The ARN for the role the application uses to access its Amazon S3 bucket.\n"]
  s3_path : string_ option;
      [@ocaml.doc
        "The path for the Amazon S3 bucket that the application uses for accessing the \
         user-defined schema.\n"]
  database_name : string_ option;
      [@ocaml.doc "The database name on the Amazon Redshift data provider.\n"]
  port : integer_optional option;
      [@ocaml.doc "The port value for the Amazon Redshift data provider.\n"]
  server_name : string_ option; [@ocaml.doc "The name of the Amazon Redshift server.\n"]
}
[@@ocaml.doc "Provides information that defines an Amazon Redshift data provider.\n"]

type nonrec redis_auth_type_value =
  | AUTH_TOKEN [@ocaml.doc ""]
  | AUTH_ROLE [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec redis_settings = {
  ssl_ca_certificate_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the certificate authority (CA) that DMS uses to \
         connect to your Redis target endpoint.\n"]
  auth_password : secret_string option;
      [@ocaml.doc
        "The password provided with the [auth-role] and [auth-token] options of the [AuthType] \
         setting for a Redis target endpoint.\n"]
  auth_user_name : string_ option;
      [@ocaml.doc
        "The user name provided with the [auth-role] option of the [AuthType] setting for a Redis \
         target endpoint.\n"]
  auth_type : redis_auth_type_value option;
      [@ocaml.doc
        "The type of authentication to perform when connecting to a Redis target. Options include \
         [none], [auth-token], and [auth-role]. The [auth-token] option requires an [AuthPassword] \
         value to be provided. The [auth-role] option requires [AuthUserName] and [AuthPassword] \
         values to be provided.\n"]
  ssl_security_protocol : ssl_security_protocol_value option;
      [@ocaml.doc
        "The connection to a Redis target endpoint using Transport Layer Security (TLS). Valid \
         values include [plaintext] and [ssl-encryption]. The default is [ssl-encryption]. The \
         [ssl-encryption] option makes an encrypted connection. Optionally, you can identify an \
         Amazon Resource Name (ARN) for an SSL certificate authority (CA) using the \
         [SslCaCertificateArn ]setting. If an ARN isn't given for a CA, DMS uses the Amazon root \
         CA.\n\n\
        \ The [plaintext] option doesn't provide Transport Layer Security (TLS) encryption for \
         traffic between endpoint and database.\n\
        \ "]
  port : integer; [@ocaml.doc "Transmission Control Protocol (TCP) port for the endpoint.\n"]
  server_name : string_; [@ocaml.doc "Fully qualified domain name of the endpoint.\n"]
}
[@@ocaml.doc "Provides information that defines a Redis target endpoint.\n"]

type nonrec rds_requirements = {
  engine_version : string_ option; [@ocaml.doc "The required target Amazon RDS engine version.\n"]
  deployment_option : string_ option;
      [@ocaml.doc
        "The required deployment option for the Amazon RDS DB instance. Valid values include \
         [\"MULTI_AZ\"] for Multi-AZ deployments and [\"SINGLE_AZ\"] for Single-AZ deployments.\n"]
  storage_iops : integer_optional option;
      [@ocaml.doc
        "The required number of I/O operations completed each second (IOPS) on your Amazon RDS DB \
         instance.\n"]
  storage_size : integer_optional option;
      [@ocaml.doc "The required Amazon RDS DB instance storage size.\n"]
  instance_memory : double_optional option;
      [@ocaml.doc "The required memory on the Amazon RDS DB instance.\n"]
  instance_vcpu : double_optional option;
      [@ocaml.doc "The required number of virtual CPUs (vCPU) on the Amazon RDS DB instance.\n"]
  engine_edition : string_ option; [@ocaml.doc "The required target Amazon RDS engine edition.\n"]
}
[@@ocaml.doc
  "Provides information that describes the requirements to the target engine on Amazon RDS.\n"]

type nonrec rds_configuration = {
  engine_version : string_ option;
      [@ocaml.doc "Describes the recommended target Amazon RDS engine version.\n"]
  deployment_option : string_ option;
      [@ocaml.doc
        "Describes the deployment option for the recommended Amazon RDS DB instance. The \
         deployment options include Multi-AZ and Single-AZ deployments. Valid values include \
         [\"MULTI_AZ\"] and [\"SINGLE_AZ\"].\n"]
  storage_iops : integer_optional option;
      [@ocaml.doc
        "Describes the number of I/O operations completed each second (IOPS) on the recommended \
         Amazon RDS DB instance that meets your requirements.\n"]
  storage_size : integer_optional option;
      [@ocaml.doc
        "Describes the storage size of the recommended Amazon RDS DB instance that meets your \
         requirements.\n"]
  storage_type : string_ option;
      [@ocaml.doc
        "Describes the storage type of the recommended Amazon RDS DB instance that meets your \
         requirements.\n\n\
        \ Amazon RDS provides three storage types: General Purpose SSD (also known as gp2 and \
         gp3), Provisioned IOPS SSD (also known as io1), and magnetic (also known as standard).\n\
        \ "]
  instance_memory : double_optional option;
      [@ocaml.doc
        "Describes the memory on the recommended Amazon RDS DB instance that meets your \
         requirements.\n"]
  instance_vcpu : double_optional option;
      [@ocaml.doc
        "Describes the number of virtual CPUs (vCPU) on the recommended Amazon RDS DB instance \
         that meets your requirements.\n"]
  instance_type : string_ option;
      [@ocaml.doc "Describes the recommended target Amazon RDS instance type.\n"]
  engine_edition : string_ option;
      [@ocaml.doc "Describes the recommended target Amazon RDS engine edition.\n"]
}
[@@ocaml.doc
  "Provides information that describes the configuration of the recommended target engine on \
   Amazon RDS.\n"]

type nonrec rds_recommendation = {
  target_configuration : rds_configuration option;
      [@ocaml.doc
        "Supplemental information about the configuration of the recommended target database on \
         Amazon RDS.\n"]
  requirements_to_target : rds_requirements option;
      [@ocaml.doc
        "Supplemental information about the requirements to the recommended target database on \
         Amazon RDS.\n"]
}
[@@ocaml.doc
  "Provides information that describes a recommendation of a target engine on Amazon RDS.\n"]

type nonrec recommendation_data = {
  rds_engine : rds_recommendation option;
      [@ocaml.doc "The recommendation of a target Amazon RDS database engine.\n"]
}
[@@ocaml.doc "Provides information about the target engine for the specified source database.\n"]

type nonrec recommendation = {
  data : recommendation_data option;
      [@ocaml.doc "The recommendation of a target engine for the specified source database.\n"]
  settings : recommendation_settings option;
      [@ocaml.doc
        "The settings in JSON format for the preferred target engine parameters. These parameters \
         include capacity, resource utilization, and the usage type (production, development, or \
         testing).\n"]
  preferred : boolean_optional option;
      [@ocaml.doc "Indicates that this target is the rightsized migration destination.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the target engine recommendation. Valid values include [\"alternate\"], \
         [\"in-progress\"], [\"not-viable\"], and [\"recommended\"].\n"]
  created_date : string_ option;
      [@ocaml.doc "The date when Fleet Advisor created the target engine recommendation.\n"]
  engine_name : string_ option;
      [@ocaml.doc
        "The name of the target engine. Valid values include [\"rds-aurora-mysql\"], \
         [\"rds-aurora-postgresql\"], [\"rds-mysql\"], [\"rds-oracle\"], [\"rds-sql-server\"], and \
         [\"rds-postgresql\"].\n"]
  database_id : string_ option;
      [@ocaml.doc
        "The identifier of the source database for which Fleet Advisor provided this recommendation.\n"]
}
[@@ocaml.doc
  "Provides information that describes a recommendation of a target engine.\n\n\
  \ A {i recommendation} is a set of possible Amazon Web Services target engines that you can \
   choose to migrate your source on-premises database. In this set, Fleet Advisor suggests a \
   single target engine as the right sized migration destination. To determine this rightsized \
   migration destination, Fleet Advisor uses the inventory metadata and metrics from data \
   collector. You can use recommendations before the start of migration to save costs and reduce \
   risks.\n\
  \ \n\
  \  With recommendations, you can explore different target options and compare metrics, so you \
   can make an informed decision when you choose the migration target.\n\
  \  "]

type nonrec recommendation_list = recommendation list [@@ocaml.doc ""]

type nonrec reboot_replication_instance_response = {
  replication_instance : replication_instance option;
      [@ocaml.doc "The replication instance that is being rebooted. \n"]
}
[@@ocaml.doc ""]

type nonrec reboot_replication_instance_message = {
  force_planned_failover : boolean_optional option;
      [@ocaml.doc
        "If this parameter is [true], the reboot is conducted through a planned Multi-AZ failover \
         where resources are released and cleaned up prior to conducting the failover. If the \
         instance isn''t configured for Multi-AZ, then you can't specify [true]. ( \
         [--force-planned-failover] and [--force-failover] can't both be set to [true].)\n"]
  force_failover : boolean_optional option;
      [@ocaml.doc
        "If this parameter is [true], the reboot is conducted through a Multi-AZ failover. If the \
         instance isn't configured for Multi-AZ, then you can't specify [true]. ( \
         [--force-planned-failover] and [--force-failover] can't both be set to [true].)\n"]
  replication_instance_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication instance.\n"]
}
[@@ocaml.doc ""]

type nonrec postgre_sql_data_provider_settings = {
  s3_access_role_arn : string_ option;
      [@ocaml.doc "The ARN for the role the application uses to access its Amazon S3 bucket.\n"]
  s3_path : string_ option;
      [@ocaml.doc
        "The path for the Amazon S3 bucket that the application uses for accessing the \
         user-defined schema.\n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate used for SSL connection.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc
        "The SSL mode used to connect to the PostgreSQL data provider. The default value is [none].\n"]
  database_name : string_ option;
      [@ocaml.doc "The database name on the PostgreSQL data provider.\n"]
  port : integer_optional option; [@ocaml.doc "The port value for the PostgreSQL data provider.\n"]
  server_name : string_ option; [@ocaml.doc "The name of the PostgreSQL server.\n"]
}
[@@ocaml.doc "Provides information that defines a PostgreSQL data provider.\n"]

type nonrec plugin_name_value =
  | PGLOGICAL [@ocaml.doc ""]
  | TEST_DECODING [@ocaml.doc ""]
  | NO_PREFERENCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec long_varchar_mapping_type =
  | NCLOB [@ocaml.doc ""]
  | CLOB [@ocaml.doc ""]
  | WSTRING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec database_mode = BABELFISH [@ocaml.doc ""] | DEFAULT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec postgre_sql_authentication_method = IAM [@ocaml.doc ""] | Password [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec postgre_sql_settings = {
  authentication_method : postgre_sql_authentication_method option;
      [@ocaml.doc
        "This attribute allows you to specify the authentication method as \"iam auth\".\n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        "The IAM role arn you can use to authenticate the connection to your endpoint. Ensure to \
         include [iam:PassRole] and [rds-db:connect] actions in permission policy.\n"]
  disable_unicode_source_filter : boolean_optional option;
      [@ocaml.doc
        "Disables the Unicode source filter with PostgreSQL, for values passed into the Selection \
         rule filter on Source Endpoint column values. By default DMS performs source filter \
         comparisons using a Unicode string which can cause look ups to ignore the indexes in the \
         text columns and slow down migrations.\n\n\
        \ Unicode support should only be disabled when using a selection rule filter is on a text \
         column in the Source database that is indexed.\n\
        \ "]
  babelfish_database_name : string_ option;
      [@ocaml.doc "The Babelfish for Aurora PostgreSQL database name for the endpoint.\n"]
  database_mode : database_mode option;
      [@ocaml.doc
        "Specifies the default behavior of the replication's handling of PostgreSQL- compatible \
         endpoints that require some additional configuration, such as Babelfish endpoints.\n"]
  map_long_varchar_as : long_varchar_mapping_type option;
      [@ocaml.doc
        "Sets what datatype to map LONG values as.\n\n The default value is [wstring].\n "]
  map_jsonb_as_clob : boolean_optional option;
      [@ocaml.doc
        "When true, DMS migrates JSONB values as CLOB.\n\n The default value is [false].\n "]
  map_boolean_as_boolean : boolean_optional option;
      [@ocaml.doc
        "When true, lets PostgreSQL migrate the boolean type as boolean. By default, PostgreSQL \
         migrates booleans as [varchar(5)]. You must set this setting on both the source and \
         target endpoints for it to take effect.\n\n\
        \ The default value is [false].\n\
        \ "]
  trim_space_in_char : boolean_optional option;
      [@ocaml.doc
        "Use the [TrimSpaceInChar] source endpoint setting to trim data on CHAR and NCHAR data \
         types during migration. The default value is [true].\n"]
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The full ARN, partial ARN, or friendly name of the [SecretsManagerSecret] that contains \
         the PostgreSQL endpoint connection details.\n"]
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted \
         entity and grants the required permissions to access the value in [SecretsManagerSecret]. \
         The role must allow the [iam:PassRole] action. [SecretsManagerSecret] has the value of \
         the Amazon Web Services Secrets Manager secret that allows access to the PostgreSQL \
         endpoint.\n\n\
        \  You can specify one of two sets of values for these permissions. You can specify the \
         values for this setting and [SecretsManagerSecretId]. Or you can specify clear-text \
         values for [UserName], [Password], [ServerName], and [Port]. You can't specify both. For \
         more information on creating this [SecretsManagerSecret] and the \
         [SecretsManagerAccessRoleArn] and [SecretsManagerSecretId] required to access it, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager}Using \
         secrets to access Database Migration Service resources} in the {i Database Migration \
         Service User Guide}.\n\
        \  \n\
        \   "]
  plugin_name : plugin_name_value option;
      [@ocaml.doc
        "Specifies the plugin to use to create a replication slot.\n\n\
        \ The default value is [pglogical].\n\
        \ "]
  slot_name : string_ option;
      [@ocaml.doc
        "Sets the name of a previously created logical replication slot for a change data capture \
         (CDC) load of the PostgreSQL source instance. \n\n\
        \ When used with the [CdcStartPosition] request parameter for the DMS API , this attribute \
         also makes it possible to use native CDC start points. DMS verifies that the specified \
         logical replication slot exists before starting the CDC load task. It also verifies that \
         the task was created with a valid setting of [CdcStartPosition]. If the specified slot \
         doesn't exist or the task doesn't have a valid [CdcStartPosition] setting, DMS raises an \
         error.\n\
        \ \n\
        \  For more information about setting the [CdcStartPosition] request parameter, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Task.CDC.html#CHAP_Task.CDC.StartPoint.Native}Determining \
         a CDC native start point} in the {i Database Migration Service User Guide}. For more \
         information about using [CdcStartPosition], see \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_CreateReplicationTask.html}CreateReplicationTask}, \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html}StartReplicationTask}, \
         and \
         {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_ModifyReplicationTask.html}ModifyReplicationTask}.\n\
        \  "]
  username : string_ option; [@ocaml.doc "Endpoint connection user name.\n"]
  server_name : string_ option;
      [@ocaml.doc
        "The host name of the endpoint database. \n\n\
        \ For an Amazon RDS PostgreSQL instance, this is the output of \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DescribeDBInstances.html}DescribeDBInstances}, \
         in the \n\
        \ {[\n\
        \  \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Endpoint.html}Endpoint}.Address\n\
        \ ]}\n\
        \  field.\n\
        \ \n\
        \  For an Aurora PostgreSQL instance, this is the output of \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DescribeDBClusters.html}DescribeDBClusters}, \
         in the [Endpoint] field.\n\
        \  "]
  port : integer_optional option; [@ocaml.doc "Endpoint TCP port. The default is 5432.\n"]
  password : secret_string option; [@ocaml.doc "Endpoint connection password.\n"]
  heartbeat_frequency : integer_optional option;
      [@ocaml.doc
        "Sets the WAL heartbeat frequency (in minutes).\n\n The default value is 5 minutes.\n "]
  heartbeat_schema : string_ option;
      [@ocaml.doc
        "Sets the schema in which the heartbeat artifacts are created.\n\n\
        \ The default value is [public].\n\
        \ "]
  heartbeat_enable : boolean_optional option;
      [@ocaml.doc
        "The write-ahead log (WAL) heartbeat feature mimics a dummy transaction. By doing this, it \
         prevents idle logical replication slots from holding onto old WAL logs, which can result \
         in storage full situations on the source. This heartbeat keeps [restart_lsn] moving and \
         prevents storage full scenarios.\n\n\
        \ The default value is [false].\n\
        \ "]
  fail_tasks_on_lob_truncation : boolean_optional option;
      [@ocaml.doc
        "When set to [true], this value causes a task to fail if the actual size of a LOB column \
         is greater than the specified [LobMaxSize].\n\n\
        \ The default value is [false].\n\
        \ \n\
        \  If task is set to Limited LOB mode and this option is set to true, the task fails \
         instead of truncating the LOB data.\n\
        \  "]
  execute_timeout : integer_optional option;
      [@ocaml.doc
        "Sets the client statement timeout for the PostgreSQL instance, in seconds. The default \
         value is 60 seconds.\n\n\
        \ Example: [executeTimeout=100;] \n\
        \ "]
  ddl_artifacts_schema : string_ option;
      [@ocaml.doc
        "The schema in which the operational DDL database artifacts are created.\n\n\
        \ The default value is [public].\n\
        \ \n\
        \  Example: [ddlArtifactsSchema=xyzddlschema;] \n\
        \  "]
  database_name : string_ option; [@ocaml.doc "Database name for the endpoint.\n"]
  max_file_size : integer_optional option;
      [@ocaml.doc
        "Specifies the maximum size (in KB) of any .csv file used to transfer data to PostgreSQL.\n\n\
        \ The default value is 32,768 KB (32 MB).\n\
        \ \n\
        \  Example: [maxFileSize=512] \n\
        \  "]
  capture_ddls : boolean_optional option;
      [@ocaml.doc
        "To capture DDL events, DMS creates various artifacts in the PostgreSQL database when the \
         task starts. You can later remove these artifacts.\n\n\
        \ The default value is [true].\n\
        \ \n\
        \  If this value is set to [N], you don't have to create tables or triggers on the source \
         database.\n\
        \  "]
  after_connect_script : string_ option;
      [@ocaml.doc
        "For use with change data capture (CDC) only, this attribute has DMS bypass foreign keys \
         and user triggers to reduce the time it takes to bulk load data.\n\n\
        \ Example: [afterConnectScript=SET session_replication_role='replica'] \n\
        \ "]
}
[@@ocaml.doc "Provides information that defines a PostgreSQL endpoint.\n"]

type nonrec pending_maintenance_actions = resource_pending_maintenance_actions list [@@ocaml.doc ""]

type nonrec availability_zones_list = string_ list [@@ocaml.doc ""]

type nonrec orderable_replication_instance = {
  release_status : release_status_values option;
      [@ocaml.doc
        "The value returned when the specified [EngineVersion] of the replication instance is in \
         Beta or test mode. This indicates some features might not work as expected.\n\n\
        \  DMS supports the [ReleaseStatus] parameter in versions 3.1.4 and later.\n\
        \  \n\
        \   "]
  availability_zones : availability_zones_list option;
      [@ocaml.doc "List of Availability Zones for this replication instance.\n"]
  included_allocated_storage : integer option;
      [@ocaml.doc
        "The amount of storage (in gigabytes) that is allocated for the replication instance.\n"]
  default_allocated_storage : integer option;
      [@ocaml.doc
        "The default amount of storage (in gigabytes) that is allocated for the replication \
         instance.\n"]
  max_allocated_storage : integer option;
      [@ocaml.doc
        "The minimum amount of storage (in gigabytes) that can be allocated for the replication \
         instance.\n"]
  min_allocated_storage : integer option;
      [@ocaml.doc
        "The minimum amount of storage (in gigabytes) that can be allocated for the replication \
         instance.\n"]
  storage_type : string_ option;
      [@ocaml.doc "The type of storage used by the replication instance.\n"]
  replication_instance_class : replication_instance_class option;
      [@ocaml.doc
        "The compute and memory capacity of the replication instance as defined for the specified \
         replication instance class. For example to specify the instance class dms.c4.large, set \
         this parameter to [\"dms.c4.large\"].\n\n\
        \ For more information on the settings and capacities for the available replication \
         instance classes, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth} \
         Selecting the right DMS replication instance for your migration}. \n\
        \ "]
  engine_version : string_ option; [@ocaml.doc "The version of the replication engine.\n"]
}
[@@ocaml.doc
  "In response to the [DescribeOrderableReplicationInstances] operation, this object describes an \
   available replication instance. This description includes the replication instance's type, \
   engine version, and allocated storage.\n"]

type nonrec orderable_replication_instance_list = orderable_replication_instance list
[@@ocaml.doc ""]

type nonrec integer_list = integer list [@@ocaml.doc ""]

type nonrec char_length_semantics =
  | BYTE [@ocaml.doc ""]
  | CHAR [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec oracle_authentication_method = Kerberos [@ocaml.doc ""] | Password [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec oracle_settings = {
  authentication_method : oracle_authentication_method option;
      [@ocaml.doc "Specifies the authentication method to be used with Oracle.\n"]
  open_transaction_window : integer_optional option;
      [@ocaml.doc
        "The timeframe in minutes to check for open transactions for a CDC-only task.\n\n\
        \ You can specify an integer value between 0 (the default) and 240 (the maximum). \n\
        \ \n\
        \   This parameter is only valid in DMS version 3.5.0 and later.\n\
        \   \n\
        \    "]
  convert_timestamp_with_zone_to_ut_c : boolean_optional option;
      [@ocaml.doc
        "When true, converts timestamps with the [timezone] datatype to their UTC value.\n"]
  trim_space_in_char : boolean_optional option;
      [@ocaml.doc
        "Use the [TrimSpaceInChar] source endpoint setting to trim data on CHAR and NCHAR data \
         types during migration. The default value is [true].\n"]
  secrets_manager_oracle_asm_secret_id : string_ option;
      [@ocaml.doc
        "Required only if your Oracle endpoint uses Automatic Storage Management (ASM). The full \
         ARN, partial ARN, or friendly name of the [SecretsManagerOracleAsmSecret] that contains \
         the Oracle ASM connection details for the Oracle endpoint.\n"]
  secrets_manager_oracle_asm_access_role_arn : string_ option;
      [@ocaml.doc
        "Required only if your Oracle endpoint uses Automatic Storage Management (ASM). The full \
         ARN of the IAM role that specifies DMS as the trusted entity and grants the required \
         permissions to access the [SecretsManagerOracleAsmSecret]. This \
         [SecretsManagerOracleAsmSecret] has the secret value that allows access to the Oracle ASM \
         of the endpoint.\n\n\
        \  You can specify one of two sets of values for these permissions. You can specify the \
         values for this setting and [SecretsManagerOracleAsmSecretId]. Or you can specify \
         clear-text values for [AsmUser], [AsmPassword], and [AsmServerName]. You can't specify \
         both. For more information on creating this [SecretsManagerOracleAsmSecret] and the \
         [SecretsManagerOracleAsmAccessRoleArn] and [SecretsManagerOracleAsmSecretId] required to \
         access it, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager}Using \
         secrets to access Database Migration Service resources} in the {i Database Migration \
         Service User Guide}.\n\
        \  \n\
        \   "]
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The full ARN, partial ARN, or friendly name of the [SecretsManagerSecret] that contains \
         the Oracle endpoint connection details.\n"]
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted \
         entity and grants the required permissions to access the value in [SecretsManagerSecret]. \
         The role must allow the [iam:PassRole] action. [SecretsManagerSecret] has the value of \
         the Amazon Web Services Secrets Manager secret that allows access to the Oracle \
         endpoint.\n\n\
        \  You can specify one of two sets of values for these permissions. You can specify the \
         values for this setting and [SecretsManagerSecretId]. Or you can specify clear-text \
         values for [UserName], [Password], [ServerName], and [Port]. You can't specify both. For \
         more information on creating this [SecretsManagerSecret] and the \
         [SecretsManagerAccessRoleArn] and [SecretsManagerSecretId] required to access it, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager}Using \
         secrets to access Database Migration Service resources} in the {i Database Migration \
         Service User Guide}.\n\
        \  \n\
        \   "]
  use_logminer_reader : boolean_optional option;
      [@ocaml.doc
        "Set this attribute to True to capture change data using the Oracle LogMiner utility (the \
         default). Set this attribute to False if you want to access the redo logs as a binary \
         file. When you set [UseLogminerReader] to False, also set [UseBfile] to True. For more \
         information on this setting and using Oracle ASM, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.CDC} \
         Using Oracle LogMiner or DMS Binary Reader for CDC} in the {i DMS User Guide}.\n"]
  use_direct_path_full_load : boolean_optional option;
      [@ocaml.doc
        "Set this attribute to True to have DMS use a direct path full load. Specify this value to \
         use the direct path protocol in the Oracle Call Interface (OCI). By using this OCI \
         protocol, you can bulk-load Oracle target tables during a full load.\n"]
  use_b_file : boolean_optional option;
      [@ocaml.doc
        "Set this attribute to True to capture change data using the Binary Reader utility. Set \
         [UseLogminerReader] to False to set this attribute to True. To use Binary Reader with \
         Amazon RDS for Oracle as the source, you set additional attributes. For more information \
         about using this setting with Oracle Automatic Storage Management (ASM), see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.CDC} \
         Using Oracle LogMiner or DMS Binary Reader for CDC}.\n"]
  username : string_ option; [@ocaml.doc "Endpoint connection user name.\n"]
  standby_delay_time : integer_optional option;
      [@ocaml.doc
        "Use this attribute to specify a time in minutes for the delay in standby sync. If the \
         source is an Oracle Active Data Guard standby database, use this attribute to specify the \
         time lag between primary and standby databases.\n\n\
        \ In DMS, you can create an Oracle CDC task that uses an Active Data Guard standby \
         instance as a source for replicating ongoing changes. Doing this eliminates the need to \
         connect to an active database that might be in production.\n\
        \ "]
  spatial_data_option_to_geo_json_function_name : string_ option;
      [@ocaml.doc
        "Use this attribute to convert [SDO_GEOMETRY] to [GEOJSON] format. By default, DMS calls \
         the [SDO2GEOJSON] custom function if present and accessible. Or you can create your own \
         custom function that mimics the operation of [SDOGEOJSON] and set \
         [SpatialDataOptionToGeoJsonFunctionName] to call it instead. \n"]
  server_name : string_ option;
      [@ocaml.doc
        "Fully qualified domain name of the endpoint.\n\n\
        \ For an Amazon RDS Oracle instance, this is the output of \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DescribeDBInstances.html}DescribeDBInstances}, \
         in the \n\
        \ {[\n\
        \  \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Endpoint.html}Endpoint}.Address\n\
        \ ]}\n\
        \  field.\n\
        \ "]
  security_db_encryption_name : string_ option;
      [@ocaml.doc
        "For an Oracle source endpoint, the name of a key used for the transparent data encryption \
         (TDE) of the columns and tablespaces in an Oracle source database that is encrypted using \
         TDE. The key value is the value of the [SecurityDbEncryption] setting. For more \
         information on setting the key name value of [SecurityDbEncryptionName], see the \
         information and example for setting the [securityDbEncryptionName] extra connection \
         attribute in \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.Encryption} \
         Supported encryption methods for using Oracle as a source for DMS } in the {i Database \
         Migration Service User Guide}.\n"]
  security_db_encryption : secret_string option;
      [@ocaml.doc
        "For an Oracle source endpoint, the transparent data encryption (TDE) password required by \
         AWM DMS to access Oracle redo logs encrypted by TDE using Binary Reader. It is also the \n\
         {[\n\
        \ {i TDE_Password} \n\
         ]}\n\
        \ part of the comma-separated value you set to the [Password] request parameter when you \
         create the endpoint. The [SecurityDbEncryptian] setting is related to this \
         [SecurityDbEncryptionName] setting. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.Encryption} \
         Supported encryption methods for using Oracle as a source for DMS } in the {i Database \
         Migration Service User Guide}. \n"]
  retry_interval : integer_optional option;
      [@ocaml.doc
        "Specifies the number of seconds that the system waits before resending a query.\n\n\
        \ Example: [retryInterval=6;] \n\
        \ "]
  read_table_space_name : boolean_optional option;
      [@ocaml.doc "When set to [true], this attribute supports tablespace replication.\n"]
  port : integer_optional option; [@ocaml.doc "Endpoint TCP port.\n"]
  password : secret_string option; [@ocaml.doc "Endpoint connection password.\n"]
  number_datatype_scale : integer_optional option;
      [@ocaml.doc
        "Specifies the number scale. You can select a scale up to 38, or you can select FLOAT. By \
         default, the NUMBER data type is converted to precision 38, scale 10.\n\n\
        \ Example: [numberDataTypeScale=12] \n\
        \ "]
  fail_tasks_on_lob_truncation : boolean_optional option;
      [@ocaml.doc
        "When set to [true], this attribute causes a task to fail if the actual size of an LOB \
         column is greater than the specified [LobMaxSize].\n\n\
        \ If a task is set to limited LOB mode and this option is set to [true], the task fails \
         instead of truncating the LOB data.\n\
        \ "]
  direct_path_parallel_load : boolean_optional option;
      [@ocaml.doc
        "When set to [true], this attribute specifies a parallel load when [useDirectPathFullLoad] \
         is set to [Y]. This attribute also only applies when you use the DMS parallel load \
         feature. Note that the target table cannot have any constraints or indexes.\n"]
  database_name : string_ option; [@ocaml.doc "Database name for the endpoint.\n"]
  char_length_semantics : char_length_semantics option;
      [@ocaml.doc
        "Specifies whether the length of a character column is in bytes or in characters. To \
         indicate that the character column length is in characters, set this attribute to [CHAR]. \
         Otherwise, the character column length is in bytes.\n\n\
        \ Example: [charLengthSemantics=CHAR;] \n\
        \ "]
  asm_user : string_ option;
      [@ocaml.doc
        "For an Oracle source endpoint, your ASM user name. You can set this value from the \
         [asm_user] value. You set [asm_user] as part of the extra connection attribute string to \
         access an Oracle server with Binary Reader that uses ASM. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.CDC.Configuration}Configuration \
         for change data capture (CDC) on an Oracle source database}.\n"]
  asm_server : string_ option;
      [@ocaml.doc
        "For an Oracle source endpoint, your ASM server address. You can set this value from the \
         [asm_server] value. You set [asm_server] as part of the extra connection attribute string \
         to access an Oracle server with Binary Reader that uses ASM. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.CDC.Configuration}Configuration \
         for change data capture (CDC) on an Oracle source database}.\n"]
  asm_password : secret_string option;
      [@ocaml.doc
        "For an Oracle source endpoint, your Oracle Automatic Storage Management (ASM) password. \
         You can set this value from the \n\
         {[\n\
        \ {i asm_user_password} \n\
         ]}\n\
        \ value. You set this value as part of the comma-separated value that you set to the \
         [Password] request parameter when you create the endpoint to access transaction logs \
         using Binary Reader. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.CDC.Configuration}Configuration \
         for change data capture (CDC) on an Oracle source database}.\n"]
  archived_logs_only : boolean_optional option;
      [@ocaml.doc
        "When this field is set to [True], DMS only accesses the archived redo logs. If the \
         archived redo logs are stored on Automatic Storage Management (ASM) only, the DMS user \
         account needs to be granted ASM privileges.\n"]
  direct_path_no_log : boolean_optional option;
      [@ocaml.doc
        "When set to [true], this attribute helps to increase the commit rate on the Oracle target \
         database by writing directly to tables and not writing a trail to database logs.\n"]
  enable_homogenous_tablespace : boolean_optional option;
      [@ocaml.doc
        "Set this attribute to enable homogenous tablespace replication and create existing tables \
         or indexes under the same tablespace on the target.\n"]
  replace_path_prefix : boolean_optional option;
      [@ocaml.doc
        "Set this attribute to true in order to use the Binary Reader to capture change data for \
         an Amazon RDS for Oracle as the source. This setting tells DMS instance to replace the \
         default Oracle root with the specified [usePathPrefix] setting to access the redo logs.\n"]
  use_path_prefix : string_ option;
      [@ocaml.doc
        "Set this string attribute to the required value in order to use the Binary Reader to \
         capture change data for an Amazon RDS for Oracle as the source. This value specifies the \
         path prefix used to replace the default Oracle root to access the redo logs.\n"]
  oracle_path_prefix : string_ option;
      [@ocaml.doc
        "Set this string attribute to the required value in order to use the Binary Reader to \
         capture change data for an Amazon RDS for Oracle as the source. This value specifies the \
         default Oracle root used to access the redo logs.\n"]
  use_alternate_folder_for_online : boolean_optional option;
      [@ocaml.doc
        "Set this attribute to [true] in order to use the Binary Reader to capture change data for \
         an Amazon RDS for Oracle as the source. This tells the DMS instance to use any specified \
         prefix replacement to access all online redo logs.\n"]
  access_alternate_directly : boolean_optional option;
      [@ocaml.doc
        "Set this attribute to [false] in order to use the Binary Reader to capture change data \
         for an Amazon RDS for Oracle as the source. This tells the DMS instance to not access \
         redo logs through any specified path prefix replacement using direct file access.\n"]
  read_ahead_blocks : integer_optional option;
      [@ocaml.doc
        "Set this attribute to change the number of read-ahead blocks that DMS configures to \
         perform a change data capture (CDC) load using Oracle Automatic Storage Management (ASM). \
         You can specify an integer value between 1000 (the default) and 200,000 (the maximum).\n"]
  parallel_asm_read_threads : integer_optional option;
      [@ocaml.doc
        "Set this attribute to change the number of threads that DMS configures to perform a \
         change data capture (CDC) load using Oracle Automatic Storage Management (ASM). You can \
         specify an integer value between 2 (the default) and 8 (the maximum). Use this attribute \
         together with the [readAheadBlocks] attribute.\n"]
  allow_select_nested_tables : boolean_optional option;
      [@ocaml.doc
        "Set this attribute to [true] to enable replication of Oracle tables containing columns \
         that are nested tables or defined types.\n"]
  extra_archived_log_dest_ids : integer_list option;
      [@ocaml.doc
        "Specifies the IDs of one more destinations for one or more archived redo logs. These IDs \
         are the values of the [dest_id] column in the [v$archived_log] view. Use this setting \
         with the [archivedLogDestId] extra connection attribute in a primary-to-single setup or a \
         primary-to-multiple-standby setup. \n\n\
        \ This setting is useful in a switchover when you use an Oracle Data Guard database as a \
         source. In this case, DMS needs information about what destination to get archive redo \
         logs from to read changes. DMS needs this because after the switchover the previous \
         primary is a standby instance. For example, in a primary-to-single standby setup you \
         might apply the following settings. \n\
        \ \n\
        \   [archivedLogDestId=1; ExtraArchivedLogDestIds=\\[2\\]] \n\
        \  \n\
        \   In a primary-to-multiple-standby setup, you might apply the following settings.\n\
        \   \n\
        \     [archivedLogDestId=1; ExtraArchivedLogDestIds=\\[2,3,4\\]] \n\
        \    \n\
        \     Although DMS supports the use of the Oracle [RESETLOGS] option to open the database, \
         never use [RESETLOGS] unless it's necessary. For more information about [RESETLOGS], see \
         {{:https://docs.oracle.com/en/database/oracle/oracle-database/19/bradv/rman-data-repair-concepts.html#GUID-1805CCF7-4AF2-482D-B65A-998192F89C2B} \
         RMAN Data Repair Concepts} in the {i Oracle Database Backup and Recovery User's Guide}.\n\
        \     "]
  additional_archived_log_dest_id : integer_optional option;
      [@ocaml.doc
        "Set this attribute with [ArchivedLogDestId] in a primary/ standby setup. This attribute \
         is useful in the case of a switchover. In this case, DMS needs to know which destination \
         to get archive redo logs from to read changes. This need arises because the previous \
         primary instance is now a standby instance after switchover.\n\n\
        \ Although DMS supports the use of the Oracle [RESETLOGS] option to open the database, \
         never use [RESETLOGS] unless necessary. For additional information about [RESETLOGS], see \
         {{:https://docs.oracle.com/en/database/oracle/oracle-database/19/bradv/rman-data-repair-concepts.html#GUID-1805CCF7-4AF2-482D-B65A-998192F89C2B}RMAN \
         Data Repair Concepts} in the {i Oracle Database Backup and Recovery User's Guide}.\n\
        \ "]
  archived_log_dest_id : integer_optional option;
      [@ocaml.doc
        "Specifies the ID of the destination for the archived redo logs. This value should be the \
         same as a number in the dest_id column of the v$archived_log view. If you work with an \
         additional redo log destination, use the [AdditionalArchivedLogDestId] option to specify \
         the additional destination ID. Doing this improves performance by ensuring that the \
         correct logs are accessed from the outset.\n"]
  add_supplemental_logging : boolean_optional option;
      [@ocaml.doc
        "Set this attribute to set up table-level supplemental logging for the Oracle database. \
         This attribute enables PRIMARY KEY supplemental logging on all tables selected for a \
         migration task.\n\n\
        \ If you use this option, you still need to enable database-level supplemental logging.\n\
        \ "]
}
[@@ocaml.doc "Provides information that defines an Oracle endpoint.\n"]

type nonrec oracle_data_provider_settings = {
  s3_access_role_arn : string_ option;
      [@ocaml.doc "The ARN for the role the application uses to access its Amazon S3 bucket.\n"]
  s3_path : string_ option;
      [@ocaml.doc
        "The path for the Amazon S3 bucket that the application uses for accessing the \
         user-defined schema.\n"]
  secrets_manager_security_db_encryption_access_role_arn : string_ option;
      [@ocaml.doc
        "The ARN of the IAM role that provides access to the secret in Secrets Manager that \
         contains the TDE password.\n"]
  secrets_manager_security_db_encryption_secret_id : string_ option;
      [@ocaml.doc
        "The identifier of the secret in Secrets Manager that contains the transparent data \
         encryption (TDE) password. DMS requires this password to access Oracle redo logs \
         encrypted by TDE using Binary Reader.\n"]
  secrets_manager_oracle_asm_access_role_arn : string_ option;
      [@ocaml.doc
        "The ARN of the IAM role that provides access to the secret in Secrets Manager that \
         contains the Oracle ASM connection details.\n"]
  secrets_manager_oracle_asm_secret_id : string_ option;
      [@ocaml.doc
        "The identifier of the secret in Secrets Manager that contains the Oracle ASM connection \
         details.\n\n\
        \ Required only if your data provider uses the Oracle ASM server.\n\
        \ "]
  asm_server : string_ option;
      [@ocaml.doc
        "The address of your Oracle Automatic Storage Management (ASM) server. You can set this \
         value from the [asm_server] value. You set [asm_server] as part of the extra connection \
         attribute string to access an Oracle server with Binary Reader that uses ASM. For more \
         information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.CDC.Configuration}Configuration \
         for change data capture (CDC) on an Oracle source database}.\n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate used for SSL connection.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc
        "The SSL mode used to connect to the Oracle data provider. The default value is [none].\n"]
  database_name : string_ option; [@ocaml.doc "The database name on the Oracle data provider.\n"]
  port : integer_optional option; [@ocaml.doc "The port value for the Oracle data provider.\n"]
  server_name : string_ option; [@ocaml.doc "The name of the Oracle server.\n"]
}
[@@ocaml.doc "Provides information that defines an Oracle data provider.\n"]

type nonrec nesting_level_value = ONE [@ocaml.doc ""] | NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec neptune_settings = {
  iam_auth_enabled : boolean_optional option;
      [@ocaml.doc
        "If you want Identity and Access Management (IAM) authorization enabled for this endpoint, \
         set this parameter to [true]. Then attach the appropriate IAM policy document to your \
         service role specified by [ServiceAccessRoleArn]. The default is [false].\n"]
  max_retry_count : integer_optional option;
      [@ocaml.doc
        "The number of times for DMS to retry a bulk load of migrated graph data to the Neptune \
         target database before raising an error. The default is 5.\n"]
  max_file_size : integer_optional option;
      [@ocaml.doc
        "The maximum size in kilobytes of migrated graph data stored in a .csv file before DMS \
         bulk-loads the data to the Neptune target database. The default is 1,048,576 KB. If the \
         bulk load is successful, DMS clears the bucket, ready to store the next batch of migrated \
         graph data.\n"]
  error_retry_duration : integer_optional option;
      [@ocaml.doc
        "The number of milliseconds for DMS to wait to retry a bulk-load of migrated graph data to \
         the Neptune target database before raising an error. The default is 250.\n"]
  s3_bucket_folder : string_;
      [@ocaml.doc
        "A folder path where you want DMS to store migrated graph data in the S3 bucket specified \
         by [S3BucketName] \n"]
  s3_bucket_name : string_;
      [@ocaml.doc
        "The name of the Amazon S3 bucket where DMS can temporarily store migrated graph data in \
         .csv files before bulk-loading it to the Neptune target database. DMS maps the SQL source \
         data to graph data before storing it in these .csv files.\n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the service role that you created for the Neptune \
         target endpoint. The role must allow the [iam:PassRole] action. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Neptune.html#CHAP_Target.Neptune.ServiceRole}Creating \
         an IAM Service Role for Accessing Amazon Neptune as a Target} in the {i Database \
         Migration Service User Guide. } \n"]
}
[@@ocaml.doc "Provides information that defines an Amazon Neptune endpoint.\n"]

type nonrec my_sql_data_provider_settings = {
  s3_access_role_arn : string_ option;
      [@ocaml.doc "The ARN for the role the application uses to access its Amazon S3 bucket.\n"]
  s3_path : string_ option;
      [@ocaml.doc
        "The path for the Amazon S3 bucket that the application uses for accessing the \
         user-defined schema.\n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate used for SSL connection.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc
        "The SSL mode used to connect to the MySQL data provider. The default value is [none].\n"]
  port : integer_optional option; [@ocaml.doc "The port value for the MySQL data provider.\n"]
  server_name : string_ option; [@ocaml.doc "The name of the MySQL server.\n"]
}
[@@ocaml.doc "Provides information that defines a MySQL data provider.\n"]

type nonrec my_sql_authentication_method = IAM [@ocaml.doc ""] | Password [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec my_sql_settings = {
  authentication_method : my_sql_authentication_method option;
      [@ocaml.doc
        "This attribute allows you to specify the authentication method as \"iam auth\".\n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        "The IAM role you can use to authenticate when connecting to your endpoint. Ensure to \
         include [iam:PassRole] and [rds-db:connect] actions in permission policy.\n"]
  execute_timeout : integer_optional option;
      [@ocaml.doc "Sets the client statement timeout (in seconds) for a MySQL source endpoint.\n"]
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The full ARN, partial ARN, or friendly name of the [SecretsManagerSecret] that contains \
         the MySQL endpoint connection details.\n"]
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted \
         entity and grants the required permissions to access the value in [SecretsManagerSecret]. \
         The role must allow the [iam:PassRole] action. [SecretsManagerSecret] has the value of \
         the Amazon Web Services Secrets Manager secret that allows access to the MySQL endpoint.\n\n\
        \  You can specify one of two sets of values for these permissions. You can specify the \
         values for this setting and [SecretsManagerSecretId]. Or you can specify clear-text \
         values for [UserName], [Password], [ServerName], and [Port]. You can't specify both. For \
         more information on creating this [SecretsManagerSecret] and the \
         [SecretsManagerAccessRoleArn] and [SecretsManagerSecretId] required to access it, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager}Using \
         secrets to access Database Migration Service resources} in the {i Database Migration \
         Service User Guide}.\n\
        \  \n\
        \   "]
  username : string_ option; [@ocaml.doc "Endpoint connection user name.\n"]
  server_timezone : string_ option;
      [@ocaml.doc
        "Specifies the time zone for the source MySQL database.\n\n\
        \ Example: [serverTimezone=US/Pacific;] \n\
        \ \n\
        \  Note: Do not enclose time zones in single quotes.\n\
        \  "]
  server_name : string_ option;
      [@ocaml.doc
        "The host name of the endpoint database. \n\n\
        \ For an Amazon RDS MySQL instance, this is the output of \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DescribeDBInstances.html}DescribeDBInstances}, \
         in the \n\
        \ {[\n\
        \  \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Endpoint.html}Endpoint}.Address\n\
        \ ]}\n\
        \  field.\n\
        \ \n\
        \  For an Aurora MySQL instance, this is the output of \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DescribeDBClusters.html}DescribeDBClusters}, \
         in the [Endpoint] field.\n\
        \  "]
  port : integer_optional option; [@ocaml.doc "Endpoint TCP port.\n"]
  password : secret_string option; [@ocaml.doc "Endpoint connection password.\n"]
  parallel_load_threads : integer_optional option;
      [@ocaml.doc
        "Improves performance when loading data into the MySQL-compatible target database. \
         Specifies how many threads to use to load the data into the MySQL-compatible target \
         database. Setting a large number of threads can have an adverse effect on database \
         performance, because a separate connection is required for each thread. The default is \
         one.\n\n\
        \ Example: [parallelLoadThreads=1] \n\
        \ "]
  max_file_size : integer_optional option;
      [@ocaml.doc
        "Specifies the maximum size (in KB) of any .csv file used to transfer data to a \
         MySQL-compatible database.\n\n\
        \ Example: [maxFileSize=512] \n\
        \ "]
  target_db_type : target_db_type option;
      [@ocaml.doc
        "Specifies where to migrate source tables on the target, either to a single database or \
         multiple databases. If you specify [SPECIFIC_DATABASE], specify the database name using \
         the [DatabaseName] parameter of the [Endpoint] object.\n\n\
        \ Example: [targetDbType=MULTIPLE_DATABASES] \n\
        \ "]
  events_poll_interval : integer_optional option;
      [@ocaml.doc
        "Specifies how often to check the binary log for new changes/events when the database is \
         idle. The default is five seconds.\n\n\
        \ Example: [eventsPollInterval=5;] \n\
        \ \n\
        \  In the example, DMS checks for changes in the binary logs every five seconds.\n\
        \  "]
  database_name : string_ option;
      [@ocaml.doc
        "Database name for the endpoint. For a MySQL source or target endpoint, don't explicitly \
         specify the database using the [DatabaseName] request parameter on either the \
         [CreateEndpoint] or [ModifyEndpoint] API call. Specifying [DatabaseName] when you create \
         or modify a MySQL endpoint replicates all the task tables to this single database. For \
         MySQL endpoints, you specify the database only when you specify the schema in the \
         table-mapping rules of the DMS task.\n"]
  clean_source_metadata_on_mismatch : boolean_optional option;
      [@ocaml.doc
        "Cleans and recreates table metadata information on the replication instance when a \
         mismatch occurs. For example, in a situation where running an alter DDL on the table \
         could result in different information about the table cached in the replication instance. \n"]
  after_connect_script : string_ option;
      [@ocaml.doc
        "Specifies a script to run immediately after DMS connects to the endpoint. The migration \
         task continues running regardless if the SQL statement succeeds or fails.\n\n\
        \ For this parameter, provide the code of the script itself, not the name of a file \
         containing the script.\n\
        \ "]
}
[@@ocaml.doc "Provides information that defines a MySQL endpoint.\n"]

type nonrec move_replication_task_response = {
  replication_task : replication_task option; [@ocaml.doc "The replication task that was moved.\n"]
}
[@@ocaml.doc "\n"]

type nonrec move_replication_task_message = {
  target_replication_instance_arn : string_;
      [@ocaml.doc "The ARN of the replication instance where you want to move the task to.\n"]
  replication_task_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the task that you want to move.\n"]
}
[@@ocaml.doc "\n"]

type nonrec auth_type_value = PASSWORD [@ocaml.doc ""] | NO [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec auth_mechanism_value =
  | SCRAM_SHA_1 [@ocaml.doc ""]
  | MONGODB_CR [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mongo_db_settings = {
  replicate_shard_collections : boolean_optional option;
      [@ocaml.doc
        "If [true], DMS replicates data to shard collections. DMS only uses this setting if the \
         target endpoint is a DocumentDB elastic cluster.\n\n\
        \ When this setting is [true], note the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  You must set [TargetTablePrepMode] to [nothing].\n\
        \            \n\
        \             }\n\
        \        {-  DMS automatically sets [useUpdateLookup] to [false].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  use_update_look_up : boolean_optional option;
      [@ocaml.doc
        "If [true], DMS retrieves the entire document from the MongoDB source during migration. \
         This may cause a migration failure if the server response exceeds bandwidth limits. To \
         fetch only updates and deletes during migration, set this parameter to [false].\n"]
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The full ARN, partial ARN, or friendly name of the [SecretsManagerSecret] that contains \
         the MongoDB endpoint connection details.\n"]
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted \
         entity and grants the required permissions to access the value in [SecretsManagerSecret]. \
         The role must allow the [iam:PassRole] action. [SecretsManagerSecret] has the value of \
         the Amazon Web Services Secrets Manager secret that allows access to the MongoDB \
         endpoint.\n\n\
        \  You can specify one of two sets of values for these permissions. You can specify the \
         values for this setting and [SecretsManagerSecretId]. Or you can specify clear-text \
         values for [UserName], [Password], [ServerName], and [Port]. You can't specify both. For \
         more information on creating this [SecretsManagerSecret] and the \
         [SecretsManagerAccessRoleArn] and [SecretsManagerSecretId] required to access it, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager}Using \
         secrets to access Database Migration Service resources} in the {i Database Migration \
         Service User Guide}.\n\
        \  \n\
        \   "]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The KMS key identifier that is used to encrypt the content on the replication instance. \
         If you don't specify a value for the [KmsKeyId] parameter, then DMS uses your default \
         encryption key. KMS creates the default encryption key for your Amazon Web Services \
         account. Your Amazon Web Services account has a different default encryption key for each \
         Amazon Web Services Region.\n"]
  auth_source : string_ option;
      [@ocaml.doc
        " The MongoDB database name. This setting isn't used when [AuthType] is set to [\"no\"]. \n\n\
        \ The default is [\"admin\"].\n\
        \ "]
  docs_to_investigate : string_ option;
      [@ocaml.doc
        " Indicates the number of documents to preview to determine the document organization. Use \
         this setting when [NestingLevel] is set to [\"one\"]. \n\n\
        \ Must be a positive value greater than [0]. Default value is [1000].\n\
        \ "]
  extract_doc_id : string_ option;
      [@ocaml.doc
        " Specifies the document ID. Use this setting when [NestingLevel] is set to [\"none\"]. \n\n\
        \ Default value is [\"false\"]. \n\
        \ "]
  nesting_level : nesting_level_value option;
      [@ocaml.doc
        " Specifies either document or table mode. \n\n\
        \ Default value is [\"none\"]. Specify [\"none\"] to use document mode. Specify [\"one\"] \
         to use table mode.\n\
        \ "]
  auth_mechanism : auth_mechanism_value option;
      [@ocaml.doc
        " The authentication mechanism you use to access the MongoDB source endpoint.\n\n\
        \ For the default value, in MongoDB version 2.x, [\"default\"] is [\"mongodb_cr\"]. For \
         MongoDB version 3.x or later, [\"default\"] is [\"scram_sha_1\"]. This setting isn't used \
         when [AuthType] is set to [\"no\"].\n\
        \ "]
  auth_type : auth_type_value option;
      [@ocaml.doc
        " The authentication type you use to access the MongoDB source endpoint.\n\n\
        \ When when set to [\"no\"], user name and password parameters are not used and can be \
         empty. \n\
        \ "]
  database_name : string_ option;
      [@ocaml.doc " The database name on the MongoDB source endpoint. \n"]
  port : integer_optional option; [@ocaml.doc " The port value for the MongoDB source endpoint. \n"]
  server_name : string_ option;
      [@ocaml.doc
        " The name of the server on the MongoDB source endpoint. For MongoDB Atlas, provide the \
         server name for any of the servers in the replication set.\n"]
  password : secret_string option;
      [@ocaml.doc
        " The password for the user account you use to access the MongoDB source endpoint. \n"]
  username : string_ option;
      [@ocaml.doc "The user name you use to access the MongoDB source endpoint. \n"]
}
[@@ocaml.doc "Provides information that defines a MongoDB endpoint.\n"]

type nonrec mongo_db_data_provider_settings = {
  auth_mechanism : auth_mechanism_value option;
      [@ocaml.doc
        "The authentication method for connecting to the data provider. Valid values are DEFAULT, \
         MONGODB_CR, or SCRAM_SHA_1.\n"]
  auth_source : string_ option;
      [@ocaml.doc
        " The MongoDB database name. This setting isn't used when [AuthType] is set to [\"no\"]. \n\n\
        \ The default is [\"admin\"].\n\
        \ "]
  auth_type : auth_type_value option;
      [@ocaml.doc
        "The authentication type for the database connection. Valid values are PASSWORD or NO.\n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate used for SSL connection.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc
        "The SSL mode used to connect to the MongoDB data provider. The default value is [none].\n"]
  database_name : string_ option; [@ocaml.doc "The database name on the MongoDB data provider.\n"]
  port : integer_optional option; [@ocaml.doc "The port value for the MongoDB data provider.\n"]
  server_name : string_ option; [@ocaml.doc "The name of the MongoDB server.\n"]
}
[@@ocaml.doc "Provides information that defines a MongoDB data provider.\n"]

type nonrec modify_replication_task_response = {
  replication_task : replication_task option;
      [@ocaml.doc "The replication task that was modified.\n"]
}
[@@ocaml.doc "\n"]

type nonrec modify_replication_task_message = {
  task_data : string_ option;
      [@ocaml.doc
        "Supplemental information that the task requires to migrate the data for certain source \
         and target endpoints. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.TaskData.html}Specifying \
         Supplemental Data for Task Settings} in the {i Database Migration Service User Guide.} \n"]
  cdc_stop_position : string_ option;
      [@ocaml.doc
        "Indicates when you want a change data capture (CDC) operation to stop. The value can be \
         either server time or commit time.\n\n\
        \ Server time example: --cdc-stop-position \
         \226\128\156server_time:2018-02-09T12:12:12\226\128\157\n\
        \ \n\
        \  Commit time example: --cdc-stop-position \
         \226\128\156commit_time:2018-02-09T12:12:12\226\128\156\n\
        \  "]
  cdc_start_position : string_ option;
      [@ocaml.doc
        "Indicates when you want a change data capture (CDC) operation to start. Use either \
         CdcStartPosition or CdcStartTime to specify when you want a CDC operation to start. \
         Specifying both values results in an error.\n\n\
        \  The value can be in date, checkpoint, or LSN/SCN format.\n\
        \ \n\
        \  Date Example: --cdc-start-position \226\128\1562018-03-08T12:12:12\226\128\157\n\
        \  \n\
        \   Checkpoint Example: --cdc-start-position \
         \"checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93\"\n\
        \   \n\
        \    LSN Example: --cdc-start-position \
         \226\128\156mysql-bin-changelog.000024:373\226\128\157\n\
        \    \n\
        \      When you use this task setting with a source PostgreSQL database, a logical \
         replication slot should already be created and associated with the source endpoint. You \
         can verify this by setting the [slotName] extra connection attribute to the name of this \
         logical replication slot. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html#CHAP_Source.PostgreSQL.ConnectionAttrib}Extra \
         Connection Attributes When Using PostgreSQL as a Source for DMS}.\n\
        \      \n\
        \       "]
  cdc_start_time : t_stamp option;
      [@ocaml.doc
        "Indicates the start time for a change data capture (CDC) operation. Use either \
         CdcStartTime or CdcStartPosition to specify when you want a CDC operation to start. \
         Specifying both values results in an error.\n\n\
        \ Timestamp Example: --cdc-start-time \226\128\1562018-03-08T12:12:12\226\128\157\n\
        \ "]
  replication_task_settings : string_ option;
      [@ocaml.doc
        "JSON file that contains settings for the task, such as task metadata settings.\n"]
  table_mappings : string_ option;
      [@ocaml.doc
        "When using the CLI or boto3, provide the path of the JSON file that contains the table \
         mappings. Precede the path with [file://]. For example, [--table-mappings\n\
        \            file://mappingfile.json]. When working with the DMS API, provide the JSON as \
         the parameter value. \n"]
  migration_type : migration_type_value option;
      [@ocaml.doc "The migration type. Valid values: [full-load] | [cdc] | [full-load-and-cdc] \n"]
  replication_task_identifier : string_ option;
      [@ocaml.doc
        "The replication task identifier.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain 1-255 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  replication_task_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication task.\n"]
}
[@@ocaml.doc "\n"]

type nonrec modify_replication_subnet_group_response = {
  replication_subnet_group : replication_subnet_group option;
      [@ocaml.doc "The modified replication subnet group.\n"]
}
[@@ocaml.doc "\n"]

type nonrec modify_replication_subnet_group_message = {
  subnet_ids : subnet_identifier_list; [@ocaml.doc "A list of subnet IDs.\n"]
  replication_subnet_group_description : string_ option;
      [@ocaml.doc "A description for the replication instance subnet group.\n"]
  replication_subnet_group_identifier : string_;
      [@ocaml.doc "The name of the replication instance subnet group.\n"]
}
[@@ocaml.doc "\n"]

type nonrec invalid_subnet = { message : exception_message option [@ocaml.doc "\n"] }
[@@ocaml.doc "The subnet provided isn't valid.\n"]

type nonrec modify_replication_instance_response = {
  replication_instance : replication_instance option;
      [@ocaml.doc "The modified replication instance.\n"]
}
[@@ocaml.doc "\n"]

type nonrec modify_replication_instance_message = {
  kerberos_authentication_settings : kerberos_authentication_settings option;
      [@ocaml.doc
        "Specifies the settings required for kerberos authentication when modifying a replication \
         instance.\n"]
  network_type : string_ option;
      [@ocaml.doc
        "The type of IP address protocol used by a replication instance, such as IPv4 only or \
         Dual-stack that supports both IPv4 and IPv6 addressing. IPv6 only is not yet supported.\n"]
  replication_instance_identifier : string_ option;
      [@ocaml.doc
        "The replication instance identifier. This parameter is stored as a lowercase string.\n"]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "A value that indicates that minor version upgrades are applied automatically to the \
         replication instance during the maintenance window. Changing this parameter doesn't \
         result in an outage, except in the case described following. The change is asynchronously \
         applied as soon as possible. \n\n\
        \ An outage does result if these factors apply: \n\
        \ \n\
        \  {ul\n\
        \        {-  This parameter is set to [true] during the maintenance window.\n\
        \            \n\
        \             }\n\
        \        {-  A newer minor version is available. \n\
        \            \n\
        \             }\n\
        \        {-  DMS has enabled automatic patching for the given engine version. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  allow_major_version_upgrade : boolean_ option;
      [@ocaml.doc
        "Indicates that major version upgrades are allowed. Changing this parameter does not \
         result in an outage, and the change is asynchronously applied as soon as possible.\n\n\
        \ This parameter must be set to [true] when specifying a value for the [EngineVersion] \
         parameter that is a different major version than the replication instance's current \
         version.\n\
        \ "]
  engine_version : string_ option;
      [@ocaml.doc
        "The engine version number of the replication instance.\n\n\
        \ When modifying a major engine version of an instance, also set \
         [AllowMajorVersionUpgrade] to [true].\n\
        \ "]
  multi_a_z : boolean_optional option;
      [@ocaml.doc
        " Specifies whether the replication instance is a Multi-AZ deployment. You can't set the \
         [AvailabilityZone] parameter if the Multi-AZ parameter is set to [true]. \n"]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The weekly time range (in UTC) during which system maintenance can occur, which might \
         result in an outage. Changing this parameter does not result in an outage, except in the \
         following situation, and the change is asynchronously applied as soon as possible. If \
         moving this window to the current time, there must be at least 30 minutes between the \
         current time and end of the window to ensure pending changes are applied.\n\n\
        \ Default: Uses existing setting\n\
        \ \n\
        \  Format: ddd:hh24:mi-ddd:hh24:mi\n\
        \  \n\
        \   Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun\n\
        \   \n\
        \    Constraints: Must be at least 30 minutes\n\
        \    "]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        " Specifies the VPC security group to be used with the replication instance. The VPC \
         security group must work with the VPC containing the replication instance. \n"]
  replication_instance_class : replication_instance_class option;
      [@ocaml.doc
        "The compute and memory capacity of the replication instance as defined for the specified \
         replication instance class. For example to specify the instance class dms.c4.large, set \
         this parameter to [\"dms.c4.large\"].\n\n\
        \ For more information on the settings and capacities for the available replication \
         instance classes, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth} \
         Selecting the right DMS replication instance for your migration}. \n\
        \ "]
  apply_immediately : boolean_ option;
      [@ocaml.doc
        "Indicates whether the changes should be applied immediately or during the next \
         maintenance window.\n"]
  allocated_storage : integer_optional option;
      [@ocaml.doc
        "The amount of storage (in gigabytes) to be allocated for the replication instance.\n"]
  replication_instance_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication instance.\n"]
}
[@@ocaml.doc "\n"]

type nonrec insufficient_resource_capacity_fault = {
  message : exception_message option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "There are not enough resources allocated to the database migration.\n"]

type nonrec modify_replication_config_response = {
  replication_config : replication_config option;
      [@ocaml.doc "Information about the serverless replication config that was modified.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_replication_config_message = {
  target_endpoint_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target endpoint for this DMS serverless replication \
         configuration.\n"]
  source_endpoint_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source endpoint for this DMS serverless replication \
         configuration.\n"]
  compute_config : compute_config option;
      [@ocaml.doc "Configuration parameters for provisioning an DMS Serverless replication.\n"]
  supplemental_settings : string_ option; [@ocaml.doc "Additional settings for the replication.\n"]
  replication_settings : string_ option; [@ocaml.doc "The settings for the replication.\n"]
  table_mappings : string_ option; [@ocaml.doc "Table mappings specified in the replication.\n"]
  replication_type : migration_type_value option; [@ocaml.doc "The type of replication.\n"]
  replication_config_identifier : string_ option;
      [@ocaml.doc "The new replication config to apply to the replication.\n"]
  replication_config_arn : string_;
      [@ocaml.doc "The Amazon Resource Name of the replication to modify.\n"]
}
[@@ocaml.doc "\n"]

type nonrec data_provider_descriptor = {
  data_provider_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the data provider.\n"]
  data_provider_name : string_ option; [@ocaml.doc "The user-friendly name of the data provider.\n"]
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc "The ARN of the role used to access Amazon Web Services Secrets Manager.\n"]
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The identifier of the Amazon Web Services Secrets Manager Secret used to store access \
         credentials for the data provider.\n"]
}
[@@ocaml.doc "Information about a data provider.\n"]

type nonrec data_provider_descriptor_list = data_provider_descriptor list [@@ocaml.doc ""]

type nonrec migration_project = {
  schema_conversion_application_attributes : sc_application_attributes option;
      [@ocaml.doc
        "The schema conversion application attributes, including the Amazon S3 bucket name and \
         Amazon S3 role ARN.\n"]
  description : string_ option;
      [@ocaml.doc "A user-friendly description of the migration project.\n"]
  transformation_rules : string_ option;
      [@ocaml.doc
        "The settings in JSON format for migration rules. Migration rules make it possible for you \
         to change the object names according to the rules that you specify. For example, you can \
         change an object name to lowercase or uppercase, add or remove a prefix or suffix, or \
         rename objects.\n"]
  instance_profile_name : string_ option;
      [@ocaml.doc "The name of the associated instance profile.\n"]
  instance_profile_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the instance profile for your migration project.\n"]
  target_data_provider_descriptors : data_provider_descriptor_list option;
      [@ocaml.doc
        "Information about the target data provider, including the name or ARN, and Secrets \
         Manager parameters.\n"]
  source_data_provider_descriptors : data_provider_descriptor_list option;
      [@ocaml.doc
        "Information about the source data provider, including the name or ARN, and Secrets \
         Manager parameters.\n"]
  migration_project_creation_time : iso8601_date_time option;
      [@ocaml.doc "The time when the migration project was created.\n"]
  migration_project_arn : string_ option;
      [@ocaml.doc "The ARN string that uniquely identifies the migration project.\n"]
  migration_project_name : string_ option; [@ocaml.doc "The name of the migration project.\n"]
}
[@@ocaml.doc "Provides information that defines a migration project.\n"]

type nonrec modify_migration_project_response = {
  migration_project : migration_project option;
      [@ocaml.doc "The migration project that was modified.\n"]
}
[@@ocaml.doc ""]

type nonrec data_provider_descriptor_definition = {
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc "The ARN of the role used to access Amazon Web Services Secrets Manager.\n"]
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The identifier of the Amazon Web Services Secrets Manager Secret used to store access \
         credentials for the data provider.\n"]
  data_provider_identifier : string_;
      [@ocaml.doc "The name or Amazon Resource Name (ARN) of the data provider.\n"]
}
[@@ocaml.doc "Information about a data provider.\n"]

type nonrec data_provider_descriptor_definition_list = data_provider_descriptor_definition list
[@@ocaml.doc ""]

type nonrec modify_migration_project_message = {
  schema_conversion_application_attributes : sc_application_attributes option;
      [@ocaml.doc
        "The schema conversion application attributes, including the Amazon S3 bucket name and \
         Amazon S3 role ARN.\n"]
  description : string_ option;
      [@ocaml.doc "A user-friendly description of the migration project.\n"]
  transformation_rules : string_ option;
      [@ocaml.doc
        "The settings in JSON format for migration rules. Migration rules make it possible for you \
         to change the object names according to the rules that you specify. For example, you can \
         change an object name to lowercase or uppercase, add or remove a prefix or suffix, or \
         rename objects.\n"]
  instance_profile_identifier : string_ option;
      [@ocaml.doc "The name or Amazon Resource Name (ARN) for the instance profile.\n"]
  target_data_provider_descriptors : data_provider_descriptor_definition_list option;
      [@ocaml.doc
        "Information about the target data provider, including the name, ARN, and Amazon Web \
         Services Secrets Manager parameters.\n"]
  source_data_provider_descriptors : data_provider_descriptor_definition_list option;
      [@ocaml.doc
        "Information about the source data provider, including the name, ARN, and Amazon Web \
         Services Secrets Manager parameters.\n"]
  migration_project_name : string_ option;
      [@ocaml.doc "A user-friendly name for the migration project.\n"]
  migration_project_identifier : string_;
      [@ocaml.doc
        "The identifier of the migration project. Identifiers must begin with a letter and must \
         contain only ASCII letters, digits, and hyphens. They can't end with a hyphen, or contain \
         two consecutive hyphens.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_profile = {
  vpc_security_groups : string_list option;
      [@ocaml.doc
        "The VPC security groups that are used with the instance profile. The VPC security group \
         must work with the VPC containing the instance profile.\n"]
  subnet_group_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the subnet group that is associated with the instance profile.\n"]
  instance_profile_creation_time : iso8601_date_time option;
      [@ocaml.doc "The time the instance profile was created.\n"]
  description : string_ option;
      [@ocaml.doc
        "A description of the instance profile. Descriptions can have up to 31 characters. A \
         description can contain only ASCII letters, digits, and hyphens ('-'). Also, it can't end \
         with a hyphen or contain two consecutive hyphens, and can only begin with a letter.\n"]
  instance_profile_name : string_ option;
      [@ocaml.doc "The user-friendly name for the instance profile.\n"]
  network_type : string_ option;
      [@ocaml.doc
        "Specifies the network type for the instance profile. A value of [IPV4] represents an \
         instance profile with IPv4 network type and only supports IPv4 addressing. A value of \
         [IPV6] represents an instance profile with IPv6 network type and only supports IPv6 \
         addressing. A value of [DUAL] represents an instance profile with dual network type that \
         supports IPv4 and IPv6 addressing.\n"]
  publicly_accessible : boolean_optional option;
      [@ocaml.doc
        "Specifies the accessibility options for the instance profile. A value of [true] \
         represents an instance profile with a public IP address. A value of [false] represents an \
         instance profile with a private IP address. The default value is [true].\n"]
  kms_key_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key that is used to encrypt the connection \
         parameters for the instance profile.\n\n\
        \ If you don't specify a value for the [KmsKeyArn] parameter, then DMS uses an Amazon Web \
         Services owned encryption key to encrypt your resources.\n\
        \ "]
  availability_zone : string_ option;
      [@ocaml.doc "The Availability Zone where the instance profile runs.\n"]
  instance_profile_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) string that uniquely identifies the instance profile.\n"]
}
[@@ocaml.doc "Provides information that defines an instance profile.\n"]

type nonrec modify_instance_profile_response = {
  instance_profile : instance_profile option;
      [@ocaml.doc "The instance profile that was modified.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_instance_profile_message = {
  vpc_security_groups : string_list option;
      [@ocaml.doc
        "Specifies the VPC security groups to be used with the instance profile. The VPC security \
         group must work with the VPC containing the instance profile.\n"]
  subnet_group_identifier : string_ option;
      [@ocaml.doc "A subnet group to associate with the instance profile.\n"]
  description : string_ option;
      [@ocaml.doc "A user-friendly description for the instance profile.\n"]
  instance_profile_name : string_ option;
      [@ocaml.doc "A user-friendly name for the instance profile.\n"]
  network_type : string_ option;
      [@ocaml.doc
        "Specifies the network type for the instance profile. A value of [IPV4] represents an \
         instance profile with IPv4 network type and only supports IPv4 addressing. A value of \
         [IPV6] represents an instance profile with IPv6 network type and only supports IPv6 \
         addressing. A value of [DUAL] represents an instance profile with dual network type that \
         supports IPv4 and IPv6 addressing.\n"]
  publicly_accessible : boolean_optional option;
      [@ocaml.doc
        "Specifies the accessibility options for the instance profile. A value of [true] \
         represents an instance profile with a public IP address. A value of [false] represents an \
         instance profile with a private IP address. The default value is [true].\n"]
  kms_key_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key that is used to encrypt the connection \
         parameters for the instance profile.\n\n\
        \ If you don't specify a value for the [KmsKeyArn] parameter, then DMS uses an Amazon Web \
         Services owned encryption key to encrypt your resources.\n\
        \ "]
  availability_zone : string_ option;
      [@ocaml.doc "The Availability Zone where the instance profile runs.\n"]
  instance_profile_identifier : string_;
      [@ocaml.doc
        "The identifier of the instance profile. Identifiers must begin with a letter and must \
         contain only ASCII letters, digits, and hyphens. They can't end with a hyphen, or contain \
         two consecutive hyphens.\n"]
}
[@@ocaml.doc ""]

type nonrec event_categories_list = string_ list [@@ocaml.doc ""]

type nonrec event_subscription = {
  enabled : boolean_ option;
      [@ocaml.doc "Boolean value that indicates if the event subscription is enabled.\n"]
  event_categories_list : event_categories_list option;
      [@ocaml.doc "A lists of event categories.\n"]
  source_ids_list : source_ids_list option;
      [@ocaml.doc "A list of source Ids for the event subscription.\n"]
  source_type : string_ option;
      [@ocaml.doc
        " The type of DMS resource that generates events. \n\n\
        \ Valid values: replication-instance | replication-server | security-group | \
         replication-task\n\
        \ "]
  subscription_creation_time : string_ option;
      [@ocaml.doc "The time the DMS event notification subscription was created.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the DMS event notification subscription.\n\n\
        \ Constraints:\n\
        \ \n\
        \  Can be one of the following: creating | modifying | deleting | active | no-permission | \
         topic-not-exist\n\
        \  \n\
        \   The status \"no-permission\" indicates that DMS no longer has permission to post to \
         the SNS topic. The status \"topic-not-exist\" indicates that the topic was deleted after \
         the subscription was created.\n\
        \   "]
  sns_topic_arn : string_ option;
      [@ocaml.doc "The topic ARN of the DMS event notification subscription.\n"]
  cust_subscription_id : string_ option;
      [@ocaml.doc "The DMS event notification subscription Id.\n"]
  customer_aws_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services customer account associated with the DMS event notification \
         subscription.\n"]
}
[@@ocaml.doc
  "Describes an event notification subscription created by the [CreateEventSubscription] operation.\n"]

type nonrec modify_event_subscription_response = {
  event_subscription : event_subscription option; [@ocaml.doc "The modified event subscription.\n"]
}
[@@ocaml.doc "\n"]

type nonrec modify_event_subscription_message = {
  enabled : boolean_optional option;
      [@ocaml.doc " A Boolean value; set to {b true} to activate the subscription. \n"]
  event_categories : event_categories_list option;
      [@ocaml.doc
        " A list of event categories for a source type that you want to subscribe to. Use the \
         [DescribeEventCategories] action to see a list of event categories. \n"]
  source_type : string_ option;
      [@ocaml.doc
        " The type of DMS resource that generates the events you want to subscribe to. \n\n\
        \ Valid values: replication-instance | replication-task\n\
        \ "]
  sns_topic_arn : string_ option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the Amazon SNS topic created for event notification. \
         The ARN is created by Amazon SNS when you create a topic and subscribe to it.\n"]
  subscription_name : string_;
      [@ocaml.doc "The name of the DMS event notification subscription to be modified.\n"]
}
[@@ocaml.doc "\n"]

type nonrec kms_throttling_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "This request triggered KMS request throttling.\n"]

type nonrec dynamo_db_settings = {
  service_access_role_arn : string_;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) used by the service to access the IAM role. The role must \
         allow the [iam:PassRole] action.\n"]
}
[@@ocaml.doc
  "Provides the Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role used \
   to define an Amazon DynamoDB target endpoint.\n"]

type nonrec dms_transfer_settings = {
  bucket_name : string_ option; [@ocaml.doc " The name of the S3 bucket to use. \n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) used by the service access IAM role. The role must allow \
         the [iam:PassRole] action.\n"]
}
[@@ocaml.doc " The settings in JSON format for the DMS Transfer type source endpoint. \n"]

type nonrec message_format_value = JSON_UNFORMATTED [@ocaml.doc ""] | JSON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec kinesis_settings = {
  use_large_integer_value : boolean_optional option;
      [@ocaml.doc "Specifies using the large integer value with Kinesis.\n"]
  no_hex_prefix : boolean_optional option;
      [@ocaml.doc
        "Set this optional parameter to [true] to avoid adding a '0x' prefix to raw data in \
         hexadecimal format. For example, by default, DMS adds a '0x' prefix to the LOB column \
         type in hexadecimal format moving from an Oracle source to an Amazon Kinesis target. Use \
         the [NoHexPrefix] endpoint setting to enable migration of RAW data type columns without \
         adding the '0x' prefix.\n"]
  include_null_and_empty : boolean_optional option;
      [@ocaml.doc
        "Include NULL and empty columns for records migrated to the endpoint. The default is \
         [false].\n"]
  include_control_details : boolean_optional option;
      [@ocaml.doc
        "Shows detailed control information for table definition, column definition, and table and \
         column changes in the Kinesis message output. The default is [false].\n"]
  include_table_alter_operations : boolean_optional option;
      [@ocaml.doc
        "Includes any data definition language (DDL) operations that change the table in the \
         control data, such as [rename-table], [drop-table], [add-column], [drop-column], and \
         [rename-column]. The default is [false].\n"]
  partition_include_schema_table : boolean_optional option;
      [@ocaml.doc
        "Prefixes schema and table names to partition values, when the partition type is \
         [primary-key-type]. Doing this increases data distribution among Kinesis shards. For \
         example, suppose that a SysBench schema has thousands of tables and each table has only \
         limited range for a primary key. In this case, the same primary key is sent from \
         thousands of tables to the same shard, which causes throttling. The default is [false].\n"]
  include_partition_value : boolean_optional option;
      [@ocaml.doc
        "Shows the partition value within the Kinesis message output, unless the partition type is \
         [schema-table-type]. The default is [false].\n"]
  include_transaction_details : boolean_optional option;
      [@ocaml.doc
        "Provides detailed transaction information from the source database. This information \
         includes a commit timestamp, a log position, and values for [transaction_id], previous \
         [transaction_id], and [transaction_record_id] (the record offset within a transaction). \
         The default is [false].\n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the IAM role that DMS uses to write to the Kinesis \
         data stream. The role must allow the [iam:PassRole] action.\n"]
  message_format : message_format_value option;
      [@ocaml.doc
        "The output format for the records created on the endpoint. The message format is [JSON] \
         (default) or [JSON_UNFORMATTED] (a single line with no tab).\n"]
  stream_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the Amazon Kinesis Data Streams endpoint.\n"]
}
[@@ocaml.doc
  "Provides information that describes an Amazon Kinesis Data Stream endpoint. This information \
   includes the output format of records applied to the endpoint and details of transaction and \
   control table data information.\n"]

type nonrec kafka_security_protocol =
  | SASL_SSL [@ocaml.doc ""]
  | SSL_ENCRYPTION [@ocaml.doc ""]
  | SSL_AUTHENTICATION [@ocaml.doc ""]
  | PLAINTEXT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec kafka_sasl_mechanism = PLAIN [@ocaml.doc ""] | SCRAM_SHA_512 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec kafka_ssl_endpoint_identification_algorithm =
  | HTTPS [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec kafka_settings = {
  use_large_integer_value : boolean_optional option;
      [@ocaml.doc "Specifies using the large integer value with Kafka.\n"]
  ssl_endpoint_identification_algorithm : kafka_ssl_endpoint_identification_algorithm option;
      [@ocaml.doc
        "Sets hostname verification for the certificate. This setting is supported in DMS version \
         3.5.1 and later. \n"]
  sasl_mechanism : kafka_sasl_mechanism option;
      [@ocaml.doc
        "For SASL/SSL authentication, DMS supports the [SCRAM-SHA-512] mechanism by default. DMS \
         versions 3.5.0 and later also support the [PLAIN] mechanism. To use the [PLAIN] \
         mechanism, set this parameter to [PLAIN.] \n"]
  no_hex_prefix : boolean_optional option;
      [@ocaml.doc
        "Set this optional parameter to [true] to avoid adding a '0x' prefix to raw data in \
         hexadecimal format. For example, by default, DMS adds a '0x' prefix to the LOB column \
         type in hexadecimal format moving from an Oracle source to a Kafka target. Use the \
         [NoHexPrefix] endpoint setting to enable migration of RAW data type columns without \
         adding the '0x' prefix.\n"]
  sasl_password : secret_string option;
      [@ocaml.doc
        "The secure password you created when you first set up your MSK cluster to validate a \
         client identity and make an encrypted connection between server and client using SASL-SSL \
         authentication.\n"]
  sasl_username : string_ option;
      [@ocaml.doc
        " The secure user name you created when you first set up your MSK cluster to validate a \
         client identity and make an encrypted connection between server and client using SASL-SSL \
         authentication.\n"]
  ssl_ca_certificate_arn : string_ option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) for the private certificate authority (CA) cert that DMS \
         uses to securely connect to your Kafka target endpoint.\n"]
  ssl_client_key_password : secret_string option;
      [@ocaml.doc
        " The password for the client private key used to securely connect to a Kafka target \
         endpoint.\n"]
  ssl_client_key_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the client private key used to securely connect to a \
         Kafka target endpoint.\n"]
  ssl_client_certificate_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the client certificate used to securely connect to a \
         Kafka target endpoint.\n"]
  security_protocol : kafka_security_protocol option;
      [@ocaml.doc
        "Set secure connection to a Kafka target endpoint using Transport Layer Security (TLS). \
         Options include [ssl-encryption], [ssl-authentication], and [sasl-ssl]. [sasl-ssl] \
         requires [SaslUsername] and [SaslPassword].\n"]
  include_null_and_empty : boolean_optional option;
      [@ocaml.doc
        "Include NULL and empty columns for records migrated to the endpoint. The default is \
         [false].\n"]
  message_max_bytes : integer_optional option;
      [@ocaml.doc
        "The maximum size in bytes for records created on the endpoint The default is 1,000,000.\n"]
  include_control_details : boolean_optional option;
      [@ocaml.doc
        "Shows detailed control information for table definition, column definition, and table and \
         column changes in the Kafka message output. The default is [false].\n"]
  include_table_alter_operations : boolean_optional option;
      [@ocaml.doc
        "Includes any data definition language (DDL) operations that change the table in the \
         control data, such as [rename-table], [drop-table], [add-column], [drop-column], and \
         [rename-column]. The default is [false].\n"]
  partition_include_schema_table : boolean_optional option;
      [@ocaml.doc
        "Prefixes schema and table names to partition values, when the partition type is \
         [primary-key-type]. Doing this increases data distribution among Kafka partitions. For \
         example, suppose that a SysBench schema has thousands of tables and each table has only \
         limited range for a primary key. In this case, the same primary key is sent from \
         thousands of tables to the same partition, which causes throttling. The default is \
         [false].\n"]
  include_partition_value : boolean_optional option;
      [@ocaml.doc
        "Shows the partition value within the Kafka message output unless the partition type is \
         [schema-table-type]. The default is [false].\n"]
  include_transaction_details : boolean_optional option;
      [@ocaml.doc
        "Provides detailed transaction information from the source database. This information \
         includes a commit timestamp, a log position, and values for [transaction_id], previous \
         [transaction_id], and [transaction_record_id] (the record offset within a transaction). \
         The default is [false].\n"]
  message_format : message_format_value option;
      [@ocaml.doc
        "The output format for the records created on the endpoint. The message format is [JSON] \
         (default) or [JSON_UNFORMATTED] (a single line with no tab).\n"]
  topic : string_ option;
      [@ocaml.doc
        "The topic to which you migrate the data. If you don't specify a topic, DMS specifies \
         [\"kafka-default-topic\"] as the migration topic.\n"]
  broker : string_ option;
      [@ocaml.doc
        "A comma-separated list of one or more broker locations in your Kafka cluster that host \
         your Kafka instance. Specify each broker location in the form \n\
         {[\n\
        \ {i broker-hostname-or-ip}:{i port} \n\
         ]}\n\
         . For example, [\"ec2-12-345-678-901.compute-1.amazonaws.com:2345\"]. For more \
         information and examples of specifying a list of broker locations, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kafka.html}Using Apache \
         Kafka as a target for Database Migration Service} in the {i Database Migration Service \
         User Guide}. \n"]
}
[@@ocaml.doc
  "Provides information that describes an Apache Kafka endpoint. This information includes the \
   output format of records applied to the endpoint and details of transaction and control table \
   data information.\n"]

type nonrec elasticsearch_settings = {
  use_new_mapping_type : boolean_optional option;
      [@ocaml.doc
        "Set this option to [true] for DMS to migrate documentation using the documentation type \
         [_doc]. OpenSearch and an Elasticsearch cluster only support the _doc documentation type \
         in versions 7. x and later. The default value is [false].\n"]
  error_retry_duration : integer_optional option;
      [@ocaml.doc
        "The maximum number of seconds for which DMS retries failed API requests to the OpenSearch \
         cluster.\n"]
  full_load_error_percentage : integer_optional option;
      [@ocaml.doc
        "The maximum percentage of records that can fail to be written before a full load \
         operation stops.\n\n\
        \ To avoid early failure, this counter is only effective after 1000 records are \
         transferred. OpenSearch also has the concept of error monitoring during the last 10 \
         minutes of an Observation Window. If transfer of all records fail in the last 10 minutes, \
         the full load operation stops. \n\
        \ "]
  endpoint_uri : string_;
      [@ocaml.doc
        "The endpoint for the OpenSearch cluster. DMS uses HTTPS if a transport protocol \
         (http/https) is not specified.\n"]
  service_access_role_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) used by the service to access the IAM role. The role must \
         allow the [iam:PassRole] action.\n"]
}
[@@ocaml.doc "Provides information that defines an OpenSearch endpoint.\n"]

type nonrec microsoft_sql_server_settings = {
  authentication_method : sql_server_authentication_method option;
      [@ocaml.doc "Specifies the authentication method to be used with Microsoft SQL Server.\n"]
  force_lob_lookup : boolean_optional option; [@ocaml.doc "Forces LOB lookup on inline LOB.\n"]
  tlog_access_mode : tlog_access_mode option;
      [@ocaml.doc "Indicates the mode used to fetch CDC data.\n"]
  trim_space_in_char : boolean_optional option;
      [@ocaml.doc
        "Use the [TrimSpaceInChar] source endpoint setting to right-trim data on CHAR and NCHAR \
         data types during migration. Setting [TrimSpaceInChar] does not left-trim data. The \
         default value is [true].\n"]
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The full ARN, partial ARN, or friendly name of the [SecretsManagerSecret] that contains \
         the SQL Server endpoint connection details.\n"]
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted \
         entity and grants the required permissions to access the value in [SecretsManagerSecret]. \
         The role must allow the [iam:PassRole] action. [SecretsManagerSecret] has the value of \
         the Amazon Web Services Secrets Manager secret that allows access to the SQL Server \
         endpoint.\n\n\
        \  You can specify one of two sets of values for these permissions. You can specify the \
         values for this setting and [SecretsManagerSecretId]. Or you can specify clear-text \
         values for [UserName], [Password], [ServerName], and [Port]. You can't specify both. For \
         more information on creating this [SecretsManagerSecret] and the \
         [SecretsManagerAccessRoleArn] and [SecretsManagerSecretId] required to access it, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager}Using \
         secrets to access Database Migration Service resources} in the {i Database Migration \
         Service User Guide}.\n\
        \  \n\
        \   "]
  use_third_party_backup_device : boolean_optional option;
      [@ocaml.doc
        "When this attribute is set to [Y], DMS processes third-party transaction log backups if \
         they are created in native format.\n"]
  use_bcp_full_load : boolean_optional option;
      [@ocaml.doc
        "Use this to attribute to transfer data for full-load operations using BCP. When the \
         target table contains an identity column that does not exist in the source table, you \
         must disable the use BCP for loading table option.\n"]
  username : string_ option; [@ocaml.doc "Endpoint connection user name.\n"]
  server_name : string_ option;
      [@ocaml.doc
        "Fully qualified domain name of the endpoint. For an Amazon RDS SQL Server instance, this \
         is the output of \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DescribeDBInstances.html}DescribeDBInstances}, \
         in the \n\
         {[\n\
        \ \
         {{:https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Endpoint.html}Endpoint}.Address\n\
         ]}\n\
        \ field.\n"]
  safeguard_policy : safeguard_policy option;
      [@ocaml.doc
        "Use this attribute to minimize the need to access the backup log and enable DMS to \
         prevent truncation using one of the following two methods.\n\n\
        \  {i Start transactions in the database:} This is the default method. When this method is \
         used, DMS prevents TLOG truncation by mimicking a transaction in the database. As long as \
         such a transaction is open, changes that appear after the transaction started aren't \
         truncated. If you need Microsoft Replication to be enabled in your database, then you \
         must choose this method.\n\
        \ \n\
        \   {i Exclusively use sp_repldone within a single task}: When this method is used, DMS \
         reads the changes and then uses sp_repldone to mark the TLOG transactions as ready for \
         truncation. Although this method doesn't involve any transactional activities, it can \
         only be used when Microsoft Replication isn't running. Also, when using this method, only \
         one DMS task can access the database at any given time. Therefore, if you need to run \
         parallel DMS tasks against the same database, use the default method.\n\
        \  "]
  read_backup_only : boolean_optional option;
      [@ocaml.doc
        "When this attribute is set to [Y], DMS only reads changes from transaction log backups \
         and doesn't read from the active transaction log file during ongoing replication. Setting \
         this parameter to [Y] enables you to control active transaction log file growth during \
         full load and ongoing replication tasks. However, it can add some source latency to \
         ongoing replication.\n"]
  query_single_always_on_node : boolean_optional option;
      [@ocaml.doc
        "Cleans and recreates table metadata information on the replication instance when a \
         mismatch occurs. An example is a situation where running an alter DDL statement on a \
         table might result in different information about the table cached in the replication \
         instance.\n"]
  password : secret_string option; [@ocaml.doc "Endpoint connection password.\n"]
  control_tables_file_group : string_ option;
      [@ocaml.doc
        "Specifies a file group for the DMS internal tables. When the replication task starts, all \
         the internal DMS control tables (awsdms_ apply_exception, awsdms_apply, awsdms_changes) \
         are created for the specified file group.\n"]
  database_name : string_ option; [@ocaml.doc "Database name for the endpoint.\n"]
  bcp_packet_size : integer_optional option;
      [@ocaml.doc "The maximum size of the packets (in bytes) used to transfer data using BCP.\n"]
  port : integer_optional option; [@ocaml.doc "Endpoint TCP port.\n"]
}
[@@ocaml.doc "Provides information that defines a Microsoft SQL Server endpoint.\n"]

type nonrec ibm_db2_settings = {
  keep_csv_files : boolean_optional option;
      [@ocaml.doc
        "If true, DMS saves any .csv files to the Db2 LUW target that were used to replicate data. \
         DMS uses these files for analysis and troubleshooting.\n\n\
        \ The default value is false. \n\
        \ "]
  max_file_size : integer_optional option;
      [@ocaml.doc
        "Specifies the maximum size (in KB) of .csv files used to transfer data to Db2 LUW.\n"]
  write_buffer_size : integer_optional option;
      [@ocaml.doc
        "The size (in KB) of the in-memory file write buffer used when generating .csv files on \
         the local disk on the DMS replication instance. The default value is 1024 (1 MB).\n"]
  load_timeout : integer_optional option;
      [@ocaml.doc
        "The amount of time (in milliseconds) before DMS times out operations performed by DMS on \
         the Db2 target. The default value is 1200 (20 minutes).\n"]
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The full ARN, partial ARN, or friendly name of the [SecretsManagerSecret] that contains \
         the Db2 LUW endpoint connection details.\n"]
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted \
         entity and grants the required permissions to access the value in [SecretsManagerSecret]. \
         The role must allow the [iam:PassRole] action. [SecretsManagerSecret] has the value of \
         the Amazon Web Services Secrets Manager secret that allows access to the Db2 LUW \
         endpoint. \n\n\
        \  You can specify one of two sets of values for these permissions. You can specify the \
         values for this setting and [SecretsManagerSecretId]. Or you can specify clear-text \
         values for [UserName], [Password], [ServerName], and [Port]. You can't specify both. For \
         more information on creating this [SecretsManagerSecret] and the \
         [SecretsManagerAccessRoleArn] and [SecretsManagerSecretId] required to access it, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager}Using \
         secrets to access Database Migration Service resources} in the {i Database Migration \
         Service User Guide}.\n\
        \  \n\
        \   "]
  username : string_ option; [@ocaml.doc "Endpoint connection user name.\n"]
  max_k_bytes_per_read : integer_optional option;
      [@ocaml.doc "Maximum number of bytes per read, as a NUMBER value. The default is 64 KB.\n"]
  current_lsn : string_ option;
      [@ocaml.doc
        "For ongoing replication (CDC), use CurrentLSN to specify a log sequence number (LSN) \
         where you want the replication to start.\n"]
  set_data_capture_changes : boolean_optional option;
      [@ocaml.doc "Enables ongoing replication (CDC) as a BOOLEAN value. The default is true.\n"]
  server_name : string_ option; [@ocaml.doc "Fully qualified domain name of the endpoint.\n"]
  port : integer_optional option; [@ocaml.doc "Endpoint TCP port. The default value is 50000.\n"]
  password : secret_string option; [@ocaml.doc "Endpoint connection password.\n"]
  database_name : string_ option; [@ocaml.doc "Database name for the endpoint.\n"]
}
[@@ocaml.doc "Provides information that defines an IBM Db2 LUW endpoint.\n"]

type nonrec doc_db_settings = {
  replicate_shard_collections : boolean_optional option;
      [@ocaml.doc
        "If [true], DMS replicates data to shard collections. DMS only uses this setting if the \
         target endpoint is a DocumentDB elastic cluster.\n\n\
        \ When this setting is [true], note the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  You must set [TargetTablePrepMode] to [nothing].\n\
        \            \n\
        \             }\n\
        \        {-  DMS automatically sets [useUpdateLookup] to [false].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  use_update_look_up : boolean_optional option;
      [@ocaml.doc
        "If [true], DMS retrieves the entire document from the DocumentDB source during migration. \
         This may cause a migration failure if the server response exceeds bandwidth limits. To \
         fetch only updates and deletes during migration, set this parameter to [false].\n"]
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The full ARN, partial ARN, or friendly name of the [SecretsManagerSecret] that contains \
         the DocumentDB endpoint connection details.\n"]
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted \
         entity and grants the required permissions to access the value in [SecretsManagerSecret]. \
         The role must allow the [iam:PassRole] action. [SecretsManagerSecret] has the value of \
         the Amazon Web Services Secrets Manager secret that allows access to the DocumentDB \
         endpoint.\n\n\
        \  You can specify one of two sets of values for these permissions. You can specify the \
         values for this setting and [SecretsManagerSecretId]. Or you can specify clear-text \
         values for [UserName], [Password], [ServerName], and [Port]. You can't specify both. For \
         more information on creating this [SecretsManagerSecret] and the \
         [SecretsManagerAccessRoleArn] and [SecretsManagerSecretId] required to access it, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager}Using \
         secrets to access Database Migration Service resources} in the {i Database Migration \
         Service User Guide}.\n\
        \  \n\
        \   "]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The KMS key identifier that is used to encrypt the content on the replication instance. \
         If you don't specify a value for the [KmsKeyId] parameter, then DMS uses your default \
         encryption key. KMS creates the default encryption key for your Amazon Web Services \
         account. Your Amazon Web Services account has a different default encryption key for each \
         Amazon Web Services Region.\n"]
  docs_to_investigate : integer_optional option;
      [@ocaml.doc
        " Indicates the number of documents to preview to determine the document organization. Use \
         this setting when [NestingLevel] is set to [\"one\"]. \n\n\
        \ Must be a positive value greater than [0]. Default value is [1000].\n\
        \ "]
  extract_doc_id : boolean_optional option;
      [@ocaml.doc
        " Specifies the document ID. Use this setting when [NestingLevel] is set to [\"none\"]. \n\n\
        \ Default value is [\"false\"]. \n\
        \ "]
  nesting_level : nesting_level_value option;
      [@ocaml.doc
        " Specifies either document or table mode. \n\n\
        \ Default value is [\"none\"]. Specify [\"none\"] to use document mode. Specify [\"one\"] \
         to use table mode.\n\
        \ "]
  database_name : string_ option;
      [@ocaml.doc " The database name on the DocumentDB source endpoint. \n"]
  port : integer_optional option;
      [@ocaml.doc " The port value for the DocumentDB source endpoint. \n"]
  server_name : string_ option;
      [@ocaml.doc " The name of the server on the DocumentDB source endpoint. \n"]
  password : secret_string option;
      [@ocaml.doc
        " The password for the user account you use to access the DocumentDB source endpoint. \n"]
  username : string_ option;
      [@ocaml.doc "The user name you use to access the DocumentDB source endpoint. \n"]
}
[@@ocaml.doc "Provides information that defines a DocumentDB endpoint.\n"]

type nonrec gcp_my_sql_settings = {
  secrets_manager_secret_id : string_ option;
      [@ocaml.doc
        "The full ARN, partial ARN, or friendly name of the [SecretsManagerSecret] that contains \
         the MySQL endpoint connection details. \n"]
  secrets_manager_access_role_arn : string_ option;
      [@ocaml.doc
        "The full Amazon Resource Name (ARN) of the IAM role that specifies DMS as the trusted \
         entity and grants the required permissions to access the value in [SecretsManagerSecret.] \
         The role must allow the [iam:PassRole] action. [SecretsManagerSecret] has the value of \
         the Amazon Web Services Secrets Manager secret that allows access to the MySQL endpoint.\n\n\
        \  You can specify one of two sets of values for these permissions. You can specify the \
         values for this setting and [SecretsManagerSecretId]. Or you can specify clear-text \
         values for [UserName], [Password], [ServerName], and [Port]. You can't specify both. For \
         more information on creating this [SecretsManagerSecret] and the \
         [SecretsManagerAccessRoleArn] and [SecretsManagerSecretId] required to access it, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#security-iam-secretsmanager}Using \
         secrets to access Database Migration Service resources} in the Database Migration Service \
         User Guide. \n\
        \  \n\
        \   "]
  username : string_ option; [@ocaml.doc "Endpoint connection user name.\n"]
  server_timezone : string_ option;
      [@ocaml.doc
        "Specifies the time zone for the source MySQL database.\n\n\
        \ Example: [serverTimezone=US/Pacific;] \n\
        \ \n\
        \  Note: Do not enclose time zones in single quotes.\n\
        \  "]
  server_name : string_ option; [@ocaml.doc "The MySQL host name.\n"]
  port : integer_optional option; [@ocaml.doc "Endpoint TCP port.\n"]
  password : secret_string option; [@ocaml.doc "Endpoint connection password.\n"]
  parallel_load_threads : integer_optional option;
      [@ocaml.doc
        "Improves performance when loading data into the MySQL-compatible target database. \
         Specifies how many threads to use to load the data into the MySQL-compatible target \
         database. Setting a large number of threads can have an adverse effect on database \
         performance, because a separate connection is required for each thread. The default is \
         one.\n\n\
        \ Example: [parallelLoadThreads=1] \n\
        \ "]
  max_file_size : integer_optional option;
      [@ocaml.doc
        "Specifies the maximum size (in KB) of any .csv file used to transfer data to a \
         MySQL-compatible database.\n\n\
        \ Example: [maxFileSize=512] \n\
        \ "]
  target_db_type : target_db_type option;
      [@ocaml.doc
        "Specifies where to migrate source tables on the target, either to a single database or \
         multiple databases.\n\n\
        \ Example: [targetDbType=MULTIPLE_DATABASES] \n\
        \ "]
  events_poll_interval : integer_optional option;
      [@ocaml.doc
        "Specifies how often to check the binary log for new changes/events when the database is \
         idle. The default is five seconds.\n\n\
        \ Example: [eventsPollInterval=5;] \n\
        \ \n\
        \  In the example, DMS checks for changes in the binary logs every five seconds. \n\
        \  "]
  database_name : string_ option;
      [@ocaml.doc
        "Database name for the endpoint. For a MySQL source or target endpoint, don't explicitly \
         specify the database using the [DatabaseName] request parameter on either the \
         [CreateEndpoint] or [ModifyEndpoint] API call. Specifying [DatabaseName] when you create \
         or modify a MySQL endpoint replicates all the task tables to this single database. For \
         MySQL endpoints, you specify the database only when you specify the schema in the \
         table-mapping rules of the DMS task. \n"]
  clean_source_metadata_on_mismatch : boolean_optional option;
      [@ocaml.doc
        "Cleans and recreates table metadata information on the replication instance when a \
         mismatch occurs. For example, in a situation where running an alter DDL on the table \
         could result in different information about the table cached in the replication instance. \n"]
  after_connect_script : string_ option;
      [@ocaml.doc
        "Specifies a script to run immediately after DMS connects to the endpoint. The migration \
         task continues running regardless if the SQL statement succeeds or fails.\n\n\
        \ For this parameter, provide the code of the script itself, not the name of a file \
         containing the script. \n\
        \ "]
}
[@@ocaml.doc "Settings in JSON format for the source GCP MySQL endpoint.\n"]

type nonrec lakehouse_settings = {
  arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Lakehouse resource that serves as the target for \
         this endpoint.\n"]
}
[@@ocaml.doc
  "Provides information that defines a Lakehouse endpoint. This endpoint type is used for zero-ETL \
   integrations with Lakehouse data warehouses.\n"]

type nonrec endpoint = {
  lakehouse_settings : lakehouse_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target Lakehouse endpoint. This parameter applies to \
         endpoints that are automatically created by DMS for a Lakehouse data warehouse as part of \
         a zero-ETL integration.\n"]
  timestream_settings : timestream_settings option;
      [@ocaml.doc
        "The settings for the Amazon Timestream target endpoint. For more information, see the \
         [TimestreamSettings] structure.\n"]
  gcp_my_sql_settings : gcp_my_sql_settings option;
      [@ocaml.doc "Settings in JSON format for the source GCP MySQL endpoint.\n"]
  redis_settings : redis_settings option;
      [@ocaml.doc
        "The settings for the Redis target endpoint. For more information, see the [RedisSettings] \
         structure.\n"]
  doc_db_settings : doc_db_settings option; [@ocaml.doc ""]
  ibm_db2_settings : ibm_db2_settings option;
      [@ocaml.doc
        "The settings for the IBM Db2 LUW source endpoint. For more information, see the \
         [IBMDb2Settings] structure. \n"]
  microsoft_sql_server_settings : microsoft_sql_server_settings option;
      [@ocaml.doc
        "The settings for the Microsoft SQL Server source and target endpoint. For more \
         information, see the [MicrosoftSQLServerSettings] structure.\n"]
  sybase_settings : sybase_settings option;
      [@ocaml.doc
        "The settings for the SAP ASE source and target endpoint. For more information, see the \
         [SybaseSettings] structure.\n"]
  oracle_settings : oracle_settings option;
      [@ocaml.doc
        "The settings for the Oracle source and target endpoint. For more information, see the \
         [OracleSettings] structure.\n"]
  my_sql_settings : my_sql_settings option;
      [@ocaml.doc
        "The settings for the MySQL source and target endpoint. For more information, see the \
         [MySQLSettings] structure.\n"]
  postgre_sql_settings : postgre_sql_settings option;
      [@ocaml.doc
        "The settings for the PostgreSQL source and target endpoint. For more information, see the \
         [PostgreSQLSettings] structure.\n"]
  redshift_settings : redshift_settings option;
      [@ocaml.doc "Settings for the Amazon Redshift endpoint.\n"]
  neptune_settings : neptune_settings option;
      [@ocaml.doc
        "The settings for the Amazon Neptune target endpoint. For more information, see the \
         [NeptuneSettings] structure.\n"]
  elasticsearch_settings : elasticsearch_settings option;
      [@ocaml.doc
        "The settings for the OpenSearch source endpoint. For more information, see the \
         [ElasticsearchSettings] structure.\n"]
  kafka_settings : kafka_settings option;
      [@ocaml.doc
        "The settings for the Apache Kafka target endpoint. For more information, see the \
         [KafkaSettings] structure.\n"]
  kinesis_settings : kinesis_settings option;
      [@ocaml.doc
        "The settings for the Amazon Kinesis target endpoint. For more information, see the \
         [KinesisSettings] structure.\n"]
  mongo_db_settings : mongo_db_settings option;
      [@ocaml.doc
        "The settings for the MongoDB source endpoint. For more information, see the \
         [MongoDbSettings] structure.\n"]
  dms_transfer_settings : dms_transfer_settings option;
      [@ocaml.doc
        "The settings for the DMS Transfer type source. For more information, see the \
         DmsTransferSettings structure. \n"]
  s3_settings : s3_settings option;
      [@ocaml.doc
        "The settings for the S3 target endpoint. For more information, see the [S3Settings] \
         structure.\n"]
  dynamo_db_settings : dynamo_db_settings option;
      [@ocaml.doc
        "The settings for the DynamoDB target endpoint. For more information, see the \
         [DynamoDBSettings] structure.\n"]
  is_read_only : boolean_optional option;
      [@ocaml.doc
        "Indicates whether the endpoint is read-only. When set to [true], this endpoint is managed \
         by DMS as part of a zero-ETL integration and cannot be modified or deleted directly. You \
         can only modify or delete read-only endpoints through their associated zero-ETL \
         integration.\n"]
  external_id : string_ option;
      [@ocaml.doc
        " Value returned by a call to CreateEndpoint that can be used for cross-account \
         validation. Use it on a subsequent call to CreateEndpoint to create the endpoint with a \
         cross-account. \n"]
  external_table_definition : string_ option; [@ocaml.doc "The external table definition.\n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) used by the service to access the IAM role. The role must \
         allow the [iam:PassRole] action.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc "The SSL mode used to connect to the endpoint. The default value is [none].\n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) used for SSL connection to the endpoint.\n"]
  endpoint_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "An KMS key identifier that is used to encrypt the connection parameters for the endpoint.\n\n\
        \ If you don't specify a value for the [KmsKeyId] parameter, then DMS uses your default \
         encryption key.\n\
        \ \n\
        \  KMS creates the default encryption key for your Amazon Web Services account. Your \
         Amazon Web Services account has a different default encryption key for each Amazon Web \
         Services Region.\n\
        \  "]
  status : string_ option; [@ocaml.doc "The status of the endpoint.\n"]
  extra_connection_attributes : string_ option;
      [@ocaml.doc "Additional connection attributes used to connect to the endpoint.\n"]
  database_name : string_ option; [@ocaml.doc "The name of the database at the endpoint.\n"]
  port : integer_optional option; [@ocaml.doc "The port value used to access the endpoint.\n"]
  server_name : string_ option; [@ocaml.doc "The name of the server at the endpoint.\n"]
  username : string_ option; [@ocaml.doc "The user name used to connect to the endpoint.\n"]
  engine_display_name : string_ option;
      [@ocaml.doc
        "The expanded name for the engine name. For example, if the [EngineName] parameter is \
         \"aurora\", this value would be \"Amazon Aurora MySQL\".\n"]
  engine_name : string_ option;
      [@ocaml.doc
        "The database engine name. Valid values, depending on the EndpointType, include \
         [\"mysql\"], [\"oracle\"], [\"postgres\"], [\"mariadb\"], [\"aurora\"], \
         [\"aurora-postgresql\"], [\"redshift\"], [\"redshift-serverless\"], [\"s3\"], [\"db2\"], \
         [\"db2-zos\"], [\"azuredb\"], [\"sybase\"], [\"dynamodb\"], [\"mongodb\"], [\"kinesis\"], \
         [\"kafka\"], [\"elasticsearch\"], [\"documentdb\"], [\"sqlserver\"], [\"neptune\"], and \
         [\"babelfish\"].\n"]
  endpoint_type : replication_endpoint_type_value option;
      [@ocaml.doc "The type of endpoint. Valid values are [source] and [target].\n"]
  endpoint_identifier : string_ option;
      [@ocaml.doc
        "The database endpoint identifier. Identifiers must begin with a letter and must contain \
         only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two \
         consecutive hyphens.\n"]
}
[@@ocaml.doc
  "Describes an endpoint of a database instance in response to operations such as the following:\n\n\
  \ {ul\n\
  \       {-   [CreateEndpoint] \n\
  \           \n\
  \            }\n\
  \       {-   [DescribeEndpoint] \n\
  \           \n\
  \            }\n\
  \       {-   [ModifyEndpoint] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec modify_endpoint_response = {
  endpoint : endpoint option; [@ocaml.doc "The modified endpoint.\n"]
}
[@@ocaml.doc "\n"]

type nonrec modify_endpoint_message = {
  timestream_settings : timestream_settings option;
      [@ocaml.doc "Settings in JSON format for the target Amazon Timestream endpoint.\n"]
  gcp_my_sql_settings : gcp_my_sql_settings option;
      [@ocaml.doc "Settings in JSON format for the source GCP MySQL endpoint.\n"]
  exact_settings : boolean_optional option;
      [@ocaml.doc
        "If this attribute is Y, the current call to [ModifyEndpoint] replaces all existing \
         endpoint settings with the exact settings that you specify in this call. If this \
         attribute is N, the current call to [ModifyEndpoint] does two things: \n\n\
        \ {ul\n\
        \       {-  It replaces any endpoint settings that already exist with new values, for \
         settings with the same names.\n\
        \           \n\
        \            }\n\
        \       {-  It creates new endpoint settings that you specify in the call, for settings \
         with different names. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For example, if you call [create-endpoint ... --endpoint-settings '{\"a\":1}'\n\
        \            ...], the endpoint has the following endpoint settings: ['{\"a\":1}']. If you \
         then call [modify-endpoint ... --endpoint-settings '{\"b\":2}' ...] for the same \
         endpoint, the endpoint has the following settings: ['{\"a\":1,\"b\":2}']. \n\
        \   \n\
        \    However, suppose that you follow this with a call to [modify-endpoint ...\n\
        \            --endpoint-settings '{\"b\":2}' --exact-settings ...] for that same endpoint \
         again. Then the endpoint has the following settings: ['{\"b\":2}']. All existing settings \
         are replaced with the exact settings that you specify. \n\
        \    "]
  redis_settings : redis_settings option;
      [@ocaml.doc "Settings in JSON format for the Redis target endpoint.\n"]
  doc_db_settings : doc_db_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source DocumentDB endpoint. For more information about \
         the available settings, see the configuration properties section in \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.DocumentDB.html} Using \
         DocumentDB as a Target for Database Migration Service } in the {i Database Migration \
         Service User Guide.} \n"]
  ibm_db2_settings : ibm_db2_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source IBM Db2 LUW endpoint. For information about other \
         available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.DB2.html#CHAP_Source.DB2.ConnectionAttrib}Extra \
         connection attributes when using Db2 LUW as a source for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  microsoft_sql_server_settings : microsoft_sql_server_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source and target Microsoft SQL Server endpoint. For \
         information about other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.SQLServer.html#CHAP_Source.SQLServer.ConnectionAttrib}Extra \
         connection attributes when using SQL Server as a source for DMS} and \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.SQLServer.html#CHAP_Target.SQLServer.ConnectionAttrib} \
         Extra connection attributes when using SQL Server as a target for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  sybase_settings : sybase_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source and target SAP ASE endpoint. For information about \
         other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.SAP.html#CHAP_Source.SAP.ConnectionAttrib}Extra \
         connection attributes when using SAP ASE as a source for DMS} and \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.SAP.html#CHAP_Target.SAP.ConnectionAttrib}Extra \
         connection attributes when using SAP ASE as a target for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  oracle_settings : oracle_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source and target Oracle endpoint. For information about \
         other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.ConnectionAttrib}Extra \
         connection attributes when using Oracle as a source for DMS} and \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Oracle.html#CHAP_Target.Oracle.ConnectionAttrib} \
         Extra connection attributes when using Oracle as a target for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  my_sql_settings : my_sql_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source and target MySQL endpoint. For information about \
         other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MySQL.html#CHAP_Source.MySQL.ConnectionAttrib}Extra \
         connection attributes when using MySQL as a source for DMS} and \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.MySQL.html#CHAP_Target.MySQL.ConnectionAttrib}Extra \
         connection attributes when using a MySQL-compatible database as a target for DMS} in the \
         {i Database Migration Service User Guide.} \n"]
  postgre_sql_settings : postgre_sql_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source and target PostgreSQL endpoint. For information \
         about other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html#CHAP_Source.PostgreSQL.ConnectionAttrib}Extra \
         connection attributes when using PostgreSQL as a source for DMS} and \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.PostgreSQL.html#CHAP_Target.PostgreSQL.ConnectionAttrib} \
         Extra connection attributes when using PostgreSQL as a target for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  redshift_settings : redshift_settings option; [@ocaml.doc ""]
  neptune_settings : neptune_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target Amazon Neptune endpoint. For more information \
         about the available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Neptune.html#CHAP_Target.Neptune.EndpointSettings}Specifying \
         graph-mapping rules using Gremlin and R2RML for Amazon Neptune as a target} in the {i \
         Database Migration Service User Guide.} \n"]
  elasticsearch_settings : elasticsearch_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target OpenSearch endpoint. For more information about \
         the available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Elasticsearch.html#CHAP_Target.Elasticsearch.Configuration}Extra \
         Connection Attributes When Using OpenSearch as a Target for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  kafka_settings : kafka_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target Apache Kafka endpoint. For more information about \
         the available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kafka.html#CHAP_Target.Kafka.ObjectMapping}Using \
         object mapping to migrate data to a Kafka topic} in the {i Database Migration Service \
         User Guide.} \n"]
  kinesis_settings : kinesis_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target endpoint for Amazon Kinesis Data Streams. For more \
         information about the available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html#CHAP_Target.Kinesis.ObjectMapping}Using \
         object mapping to migrate data to a Kinesis data stream} in the {i Database Migration \
         Service User Guide.} \n"]
  mongo_db_settings : mongo_db_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source MongoDB endpoint. For more information about the \
         available settings, see the configuration properties section in \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html#CHAP_Source.MongoDB.Configuration}Endpoint \
         configuration settings when using MongoDB as a source for Database Migration Service} in \
         the {i Database Migration Service User Guide.} \n"]
  dms_transfer_settings : dms_transfer_settings option;
      [@ocaml.doc
        "The settings in JSON format for the DMS transfer type of source endpoint. \n\n\
        \ Attributes include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  serviceAccessRoleArn - The Amazon Resource Name (ARN) used by the service \
         access IAM role. The role must allow the [iam:PassRole] action.\n\
        \            \n\
        \             }\n\
        \        {-  BucketName - The name of the S3 bucket to use.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Shorthand syntax for these settings is as follows: [ServiceAccessRoleArn=string\n\
        \            ,BucketName=string] \n\
        \   \n\
        \    JSON syntax for these settings is as follows: [{ \"ServiceAccessRoleArn\": \"string\",\n\
        \            \"BucketName\": \"string\"} ] \n\
        \    "]
  s3_settings : s3_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target Amazon S3 endpoint. For more information about the \
         available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring}Extra \
         Connection Attributes When Using Amazon S3 as a Target for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  dynamo_db_settings : dynamo_db_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target Amazon DynamoDB endpoint. For information about \
         other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.DynamoDB.html#CHAP_Target.DynamoDB.ObjectMapping}Using \
         Object Mapping to Migrate Data to DynamoDB} in the {i Database Migration Service User \
         Guide.} \n"]
  external_table_definition : string_ option; [@ocaml.doc "The external table definition.\n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) for the IAM role you want to use to modify the endpoint. \
         The role must allow the [iam:PassRole] action.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc "The SSL mode used to connect to the endpoint. The default value is [none].\n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate used for SSL connection.\n"]
  extra_connection_attributes : string_ option;
      [@ocaml.doc
        "Additional attributes associated with the connection. To reset this parameter, pass the \
         empty string (\"\") as an argument.\n"]
  database_name : string_ option;
      [@ocaml.doc
        "The name of the endpoint database. For a MySQL source or target endpoint, do not specify \
         DatabaseName.\n"]
  port : integer_optional option; [@ocaml.doc "The port used by the endpoint database.\n"]
  server_name : string_ option;
      [@ocaml.doc "The name of the server where the endpoint database resides.\n"]
  password : secret_string option;
      [@ocaml.doc "The password to be used to login to the endpoint database.\n"]
  username : string_ option;
      [@ocaml.doc "The user name to be used to login to the endpoint database.\n"]
  engine_name : string_ option;
      [@ocaml.doc
        "The database engine name. Valid values, depending on the EndpointType, include \
         [\"mysql\"], [\"oracle\"], [\"postgres\"], [\"mariadb\"], [\"aurora\"], \
         [\"aurora-postgresql\"], [\"redshift\"], [\"s3\"], [\"db2\"], [\"db2-zos\"], \
         [\"azuredb\"], [\"sybase\"], [\"dynamodb\"], [\"mongodb\"], [\"kinesis\"], [\"kafka\"], \
         [\"elasticsearch\"], [\"documentdb\"], [\"sqlserver\"], [\"neptune\"], and \
         [\"babelfish\"].\n"]
  endpoint_type : replication_endpoint_type_value option;
      [@ocaml.doc "The type of endpoint. Valid values are [source] and [target].\n"]
  endpoint_identifier : string_ option;
      [@ocaml.doc
        "The database endpoint identifier. Identifiers must begin with a letter and must contain \
         only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two \
         consecutive hyphens.\n"]
  endpoint_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.\n"]
}
[@@ocaml.doc "\n"]

type nonrec microsoft_sql_server_data_provider_settings = {
  s3_access_role_arn : string_ option;
      [@ocaml.doc "The ARN for the role the application uses to access its Amazon S3 bucket.\n"]
  s3_path : string_ option;
      [@ocaml.doc
        "The path for the Amazon S3 bucket that the application uses for accessing the \
         user-defined schema.\n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate used for SSL connection.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc
        "The SSL mode used to connect to the Microsoft SQL Server data provider. The default value \
         is [none].\n"]
  database_name : string_ option;
      [@ocaml.doc "The database name on the Microsoft SQL Server data provider.\n"]
  port : integer_optional option;
      [@ocaml.doc "The port value for the Microsoft SQL Server data provider.\n"]
  server_name : string_ option; [@ocaml.doc "The name of the Microsoft SQL Server server.\n"]
}
[@@ocaml.doc "Provides information that defines a Microsoft SQL Server data provider.\n"]

type nonrec doc_db_data_provider_settings = {
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate used for SSL connection.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc
        "The SSL mode used to connect to the DocumentDB data provider. The default value is [none].\n"]
  database_name : string_ option;
      [@ocaml.doc "The database name on the DocumentDB data provider.\n"]
  port : integer_optional option; [@ocaml.doc "The port value for the DocumentDB data provider.\n"]
  server_name : string_ option; [@ocaml.doc "The name of the source DocumentDB server.\n"]
}
[@@ocaml.doc "Provides information that defines a DocumentDB data provider.\n"]

type nonrec maria_db_data_provider_settings = {
  s3_access_role_arn : string_ option;
      [@ocaml.doc "The ARN for the role the application uses to access its Amazon S3 bucket.\n"]
  s3_path : string_ option;
      [@ocaml.doc
        "The path for the Amazon S3 bucket that the application uses for accessing the \
         user-defined schema.\n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate used for SSL connection.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc
        "The SSL mode used to connect to the MariaDB data provider. The default value is [none].\n"]
  port : integer_optional option; [@ocaml.doc "The port value for the MariaDB data provider\n"]
  server_name : string_ option; [@ocaml.doc "The name of the MariaDB server.\n"]
}
[@@ocaml.doc "Provides information that defines a MariaDB data provider.\n"]

type nonrec ibm_db2_luw_data_provider_settings = {
  s3_access_role_arn : string_ option;
      [@ocaml.doc "The ARN for the role the application uses to access its Amazon S3 bucket.\n"]
  s3_path : string_ option;
      [@ocaml.doc
        "The path for the Amazon S3 bucket that the application uses for accessing the \
         user-defined schema.\n"]
  security_mechanism : integer_optional option;
      [@ocaml.doc
        " The security mechanism used for authenticating the connection to the IBM DB2 LUW \
         database server. You can provide an integer value corresponding to a specific security \
         mechanism, or leave this parameter empty to use the default behavior. \n"]
  encryption_algorithm : integer_optional option;
      [@ocaml.doc
        " The encryption algorithm used for securing the connection to the IBM DB2 LUW database \
         server. You can provide an integer value corresponding to a specific encryption \
         algorithm, or leave this parameter empty to use the default behavior. \n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate used for SSL connection.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc
        "The SSL mode used to connect to the DB2 LUW data provider. The default value is [none]. \
         Valid Values: [none] and [verify-ca].\n"]
  database_name : string_ option; [@ocaml.doc "The database name on the DB2 LUW data provider.\n"]
  port : integer_optional option; [@ocaml.doc "The port value for the DB2 LUW data provider.\n"]
  server_name : string_ option; [@ocaml.doc "The name of the DB2 LUW server.\n"]
}
[@@ocaml.doc "Provides information about an IBM DB2 LUW data provider.\n"]

type nonrec ibm_db2z_os_data_provider_settings = {
  s3_access_role_arn : string_ option;
      [@ocaml.doc "The ARN for the role the application uses to access its Amazon S3 bucket.\n"]
  s3_path : string_ option;
      [@ocaml.doc
        "The path for the Amazon S3 bucket that the application uses for accessing the \
         user-defined schema.\n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate used for SSL connection.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc
        "The SSL mode used to connect to the DB2 for z/OS data provider. The default value is \
         [none]. Valid Values: [none] and [verify-ca].\n"]
  database_name : string_ option;
      [@ocaml.doc "The database name on the DB2 for z/OS data provider.\n"]
  port : integer_optional option;
      [@ocaml.doc "The port value for the DB2 for z/OS data provider.\n"]
  server_name : string_ option; [@ocaml.doc "The name of the DB2 for z/OS server.\n"]
}
[@@ocaml.doc "Provides information about an IBM DB2 for z/OS data provider.\n"]

type nonrec data_provider_settings =
  | MongoDbSettings of mongo_db_data_provider_settings
      [@ocaml.doc "Provides information that defines a MongoDB data provider.\n"]
  | IbmDb2zOsSettings of ibm_db2z_os_data_provider_settings
      [@ocaml.doc "Provides information that defines an IBM DB2 for z/OS data provider.\n"]
  | IbmDb2LuwSettings of ibm_db2_luw_data_provider_settings
      [@ocaml.doc "Provides information that defines an IBM DB2 LUW data provider.\n"]
  | MariaDbSettings of maria_db_data_provider_settings
      [@ocaml.doc "Provides information that defines a MariaDB data provider.\n"]
  | DocDbSettings of doc_db_data_provider_settings [@ocaml.doc ""]
  | MicrosoftSqlServerSettings of microsoft_sql_server_data_provider_settings [@ocaml.doc ""]
  | SybaseAseSettings of sybase_ase_data_provider_settings [@ocaml.doc ""]
  | OracleSettings of oracle_data_provider_settings [@ocaml.doc ""]
  | MySqlSettings of my_sql_data_provider_settings [@ocaml.doc ""]
  | PostgreSqlSettings of postgre_sql_data_provider_settings [@ocaml.doc ""]
  | RedshiftSettings of redshift_data_provider_settings [@ocaml.doc ""]
[@@ocaml.doc "Provides information that defines a data provider.\n"]

type nonrec data_provider = {
  settings : data_provider_settings option;
      [@ocaml.doc "The settings in JSON format for a data provider.\n"]
  \#virtual : boolean_optional option;
      [@ocaml.doc "Indicates whether the data provider is virtual.\n"]
  engine : string_ option;
      [@ocaml.doc
        "The type of database engine for the data provider. Valid values include [\"aurora\"], \
         [\"aurora-postgresql\"], [\"mysql\"], [\"oracle\"], [\"postgres\"], [\"sqlserver\"], \
         [redshift], [mariadb], [mongodb], [db2], [db2-zos], [docdb], and [sybase]. A value of \
         [\"aurora\"] represents Amazon Aurora MySQL-Compatible Edition.\n"]
  description : string_ option;
      [@ocaml.doc
        "A description of the data provider. Descriptions can have up to 31 characters. A \
         description can contain only ASCII letters, digits, and hyphens ('-'). Also, it can't end \
         with a hyphen or contain two consecutive hyphens, and can only begin with a letter.\n"]
  data_provider_creation_time : iso8601_date_time option;
      [@ocaml.doc "The time the data provider was created.\n"]
  data_provider_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) string that uniquely identifies the data provider.\n"]
  data_provider_name : string_ option; [@ocaml.doc "The name of the data provider.\n"]
}
[@@ocaml.doc "Provides information that defines a data provider.\n"]

type nonrec modify_data_provider_response = {
  data_provider : data_provider option; [@ocaml.doc "The data provider that was modified.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_data_provider_message = {
  settings : data_provider_settings option;
      [@ocaml.doc "The settings in JSON format for a data provider.\n"]
  exact_settings : boolean_optional option;
      [@ocaml.doc
        "If this attribute is Y, the current call to [ModifyDataProvider] replaces all existing \
         data provider settings with the exact settings that you specify in this call. If this \
         attribute is N, the current call to [ModifyDataProvider] does two things: \n\n\
        \ {ul\n\
        \       {-  It replaces any data provider settings that already exist with new values, for \
         settings with the same names.\n\
        \           \n\
        \            }\n\
        \       {-  It creates new data provider settings that you specify in the call, for \
         settings with different names. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  \#virtual : boolean_optional option;
      [@ocaml.doc "Indicates whether the data provider is virtual.\n"]
  engine : string_ option;
      [@ocaml.doc
        "The type of database engine for the data provider. Valid values include [\"aurora\"], \
         [\"aurora-postgresql\"], [\"mysql\"], [\"oracle\"], [\"postgres\"], [\"sqlserver\"], \
         [redshift], [mariadb], [mongodb], [db2], [db2-zos], [docdb], and [sybase]. A value of \
         [\"aurora\"] represents Amazon Aurora MySQL-Compatible Edition.\n"]
  description : string_ option; [@ocaml.doc "A user-friendly description of the data provider.\n"]
  data_provider_name : string_ option; [@ocaml.doc "The name of the data provider.\n"]
  data_provider_identifier : string_;
      [@ocaml.doc
        "The identifier of the data provider. Identifiers must begin with a letter and must \
         contain only ASCII letters, digits, and hyphens. They can't end with a hyphen, or contain \
         two consecutive hyphens.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_data_migration_response = {
  data_migration : data_migration option;
      [@ocaml.doc "Information about the modified data migration.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_data_migration_message = {
  selection_rules : secret_string option;
      [@ocaml.doc
        "A JSON-formatted string that defines what objects to include and exclude from the \
         migration.\n"]
  number_of_jobs : integer_optional option;
      [@ocaml.doc
        "The number of parallel jobs that trigger parallel threads to unload the tables from the \
         source, and then load them to the target.\n"]
  target_data_settings : target_data_settings option;
      [@ocaml.doc "The new information about the target data provider for the data migration.\n"]
  source_data_settings : source_data_settings option;
      [@ocaml.doc "The new information about the source data provider for the data migration.\n"]
  data_migration_type : migration_type_value option;
      [@ocaml.doc "The new migration type for the data migration.\n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc "The new service access role ARN for the data migration.\n"]
  enable_cloudwatch_logs : boolean_optional option;
      [@ocaml.doc "Whether to enable Cloudwatch logs for the data migration.\n"]
  data_migration_name : string_ option; [@ocaml.doc "The new name for the data migration.\n"]
  data_migration_identifier : string_;
      [@ocaml.doc "The identifier (name or ARN) of the data migration to modify.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_conversion_configuration_response = {
  migration_project_identifier : string_ option;
      [@ocaml.doc "The name or Amazon Resource Name (ARN) of the modified configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_conversion_configuration_message = {
  conversion_configuration : string_; [@ocaml.doc "The new conversion configuration.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec migration_project_list = migration_project list [@@ocaml.doc ""]

type nonrec metadata_model_reference = {
  selection_rules : string_ option;
      [@ocaml.doc "The JSON string representing metadata model location.\n"]
  metadata_model_name : string_ option; [@ocaml.doc "The name of the metadata model.\n"]
}
[@@ocaml.doc
  "A reference to a metadata model, including its name and selection rules for location \
   identification.\n"]

type nonrec metadata_model_reference_list = metadata_model_reference list [@@ocaml.doc ""]

type nonrec marker = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tag_list : tag_list option; [@ocaml.doc "A list of tags for the resource.\n"]
}
[@@ocaml.doc "\n"]

type nonrec arn_list = string_ list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_message = {
  resource_arn_list : arn_list option;
      [@ocaml.doc
        "List of ARNs that identify multiple DMS resources that you want to list tags for. This \
         returns a list of keys (tag names) and their associated tag values. It also returns each \
         tag's associated [ResourceArn] value, which is the ARN of the resource for which each \
         listed tag is created. \n"]
  resource_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) string that uniquely identifies the DMS resource to list \
         tags for. This returns a list of keys (names of tags) created for the resource and their \
         associated tag values.\n"]
}
[@@ocaml.doc "\n"]

type nonrec limitation = {
  type_ : string_ option;
      [@ocaml.doc
        "The type of the limitation, such as action required, upgrade required, and limited feature.\n"]
  impact : string_ option;
      [@ocaml.doc
        "The impact of the limitation. You can use this parameter to prioritize limitations that \
         you want to address. Valid values include [\"Blocker\"], [\"High\"], [\"Medium\"], and \
         [\"Low\"].\n"]
  description : string_ option;
      [@ocaml.doc
        "A description of the limitation. Provides additional information about the limitation, \
         and includes recommended actions that you can take to address or avoid this limitation.\n"]
  name : string_ option;
      [@ocaml.doc
        "The name of the limitation. Describes unsupported database features, migration action \
         items, and other limitations.\n"]
  engine_name : string_ option;
      [@ocaml.doc
        "The name of the target engine that Fleet Advisor should use in the target engine \
         recommendation. Valid values include [\"rds-aurora-mysql\"], [\"rds-aurora-postgresql\"], \
         [\"rds-mysql\"], [\"rds-oracle\"], [\"rds-sql-server\"], and [\"rds-postgresql\"].\n"]
  database_id : string_ option; [@ocaml.doc "The identifier of the source database.\n"]
}
[@@ocaml.doc
  "Provides information about the limitations of target Amazon Web Services engines.\n\n\
  \ Your source database might include features that the target Amazon Web Services engine doesn't \
   support. Fleet Advisor lists these features as limitations. You should consider these \
   limitations during database migration. For each limitation, Fleet Advisor recommends an action \
   that you can take to address or avoid this limitation.\n\
  \ "]

type nonrec limitation_list = limitation list [@@ocaml.doc ""]

type nonrec inventory_data = {
  number_of_schemas : integer_optional option;
      [@ocaml.doc "The number of schemas in the Fleet Advisor collector inventory.\n"]
  number_of_databases : integer_optional option;
      [@ocaml.doc "The number of databases in the Fleet Advisor collector inventory.\n"]
}
[@@ocaml.doc "Describes a Fleet Advisor collector inventory.\n"]

type nonrec invalid_certificate_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The certificate was not valid.\n"]

type nonrec instance_profile_list = instance_profile list [@@ocaml.doc ""]

type nonrec individual_assessment_name_list = string_ list [@@ocaml.doc ""]

type nonrec certificate_wallet = bytes [@@ocaml.doc ""]

type nonrec certificate = {
  kms_key_id : string_ option;
      [@ocaml.doc
        "An KMS key identifier that is used to encrypt the certificate.\n\n\
        \ If you don't specify a value for the [KmsKeyId] parameter, then DMS uses your default \
         encryption key.\n\
        \ \n\
        \  KMS creates the default encryption key for your Amazon Web Services account. Your \
         Amazon Web Services account has a different default encryption key for each Amazon Web \
         Services Region.\n\
        \  "]
  key_length : integer_optional option;
      [@ocaml.doc "The key length of the cryptographic algorithm being used.\n"]
  signing_algorithm : string_ option; [@ocaml.doc "The signing algorithm for the certificate.\n"]
  valid_to_date : t_stamp option; [@ocaml.doc "The final date that the certificate is valid.\n"]
  valid_from_date : t_stamp option;
      [@ocaml.doc "The beginning date that the certificate is valid.\n"]
  certificate_owner : string_ option; [@ocaml.doc "The owner of the certificate.\n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the certificate.\n"]
  certificate_wallet : certificate_wallet option;
      [@ocaml.doc
        "The location of an imported Oracle Wallet certificate for use with SSL. Example: \
         [filebase64(\"${path.root}/rds-ca-2019-root.sso\")] \n"]
  certificate_pem : string_ option;
      [@ocaml.doc "The contents of a [.pem] file, which contains an X.509 certificate.\n"]
  certificate_creation_date : t_stamp option;
      [@ocaml.doc "The date that the certificate was created.\n"]
  certificate_identifier : string_ option;
      [@ocaml.doc
        "A customer-assigned name for the certificate. Identifiers must begin with a letter and \
         must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen or \
         contain two consecutive hyphens.\n"]
}
[@@ocaml.doc
  "The SSL certificate that can be used to encrypt connections between the endpoints and the \
   replication instance.\n"]

type nonrec import_certificate_response = {
  certificate : certificate option; [@ocaml.doc "The certificate to be uploaded.\n"]
}
[@@ocaml.doc ""]

type nonrec import_certificate_message = {
  kms_key_id : string_ option;
      [@ocaml.doc
        "An KMS key identifier that is used to encrypt the certificate.\n\n\
        \ If you don't specify a value for the [KmsKeyId] parameter, then DMS uses your default \
         encryption key.\n\
        \ \n\
        \  KMS creates the default encryption key for your Amazon Web Services account. Your \
         Amazon Web Services account has a different default encryption key for each Amazon Web \
         Services Region.\n\
        \  "]
  tags : tag_list option; [@ocaml.doc "The tags associated with the certificate.\n"]
  certificate_wallet : certificate_wallet option;
      [@ocaml.doc
        "The location of an imported Oracle Wallet certificate for use with SSL. Provide the name \
         of a [.sso] file using the [fileb://] prefix. You can't provide the certificate inline.\n\n\
        \ Example: [filebase64(\"${path.root}/rds-ca-2019-root.sso\")] \n\
        \ "]
  certificate_pem : secret_string option;
      [@ocaml.doc "The contents of a [.pem] file, which contains an X.509 certificate.\n"]
  certificate_identifier : string_;
      [@ocaml.doc
        "A customer-assigned name for the certificate. Identifiers must begin with a letter and \
         must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen or \
         contain two consecutive hyphens.\n"]
}
[@@ocaml.doc ""]

type nonrec get_target_selection_rules_response = {
  target_selection_rules : string_ option;
      [@ocaml.doc "The JSON string representing the counterpart selection rules in the target.\n"]
}
[@@ocaml.doc ""]

type nonrec get_target_selection_rules_message = {
  selection_rules : string_;
      [@ocaml.doc
        "The JSON string representing the source selection rules for conversion. Selection rules \
         must contain only supported metadata model types. For more information, see Selection \
         Rules in the DMS User Guide.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_advisor_schema_object_response = {
  code_size : long_optional option;
      [@ocaml.doc
        "The size level of the code in a schema object in a Fleet Advisor collector inventory.\n"]
  code_line_count : long_optional option;
      [@ocaml.doc
        "The number of lines of code in a schema object in a Fleet Advisor collector inventory.\n"]
  number_of_objects : long_optional option;
      [@ocaml.doc
        "The number of objects in a schema object in a Fleet Advisor collector inventory.\n"]
  object_type : string_ option;
      [@ocaml.doc
        "The type of the schema object, as reported by the database engine. Examples include the \
         following:\n\n\
        \ {ul\n\
        \       {-   [function] \n\
        \           \n\
        \            }\n\
        \       {-   [trigger] \n\
        \           \n\
        \            }\n\
        \       {-   [SYSTEM_TABLE] \n\
        \           \n\
        \            }\n\
        \       {-   [QUEUE] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  schema_id : string_ option;
      [@ocaml.doc "The ID of a schema object in a Fleet Advisor collector inventory.\n"]
}
[@@ocaml.doc "Describes a schema object in a Fleet Advisor collector inventory.\n"]

type nonrec fleet_advisor_schema_object_list = fleet_advisor_schema_object_response list
[@@ocaml.doc ""]

type nonrec fleet_advisor_schema_list = schema_response list [@@ocaml.doc ""]

type nonrec fleet_advisor_lsa_analysis_response = {
  status : string_ option;
      [@ocaml.doc "The status of an LSA analysis run by a Fleet Advisor collector.\n"]
  lsa_analysis_id : string_ option;
      [@ocaml.doc "The ID of an LSA analysis run by a Fleet Advisor collector.\n"]
}
[@@ocaml.doc
  "Describes a large-scale assessment (LSA) analysis run by a Fleet Advisor collector.\n"]

type nonrec fleet_advisor_lsa_analysis_response_list = fleet_advisor_lsa_analysis_response list
[@@ocaml.doc ""]

type nonrec filter_value_list = string_ list [@@ocaml.doc ""]

type nonrec filter = {
  values : filter_value_list;
      [@ocaml.doc
        "The filter value, which can specify one or more values used to narrow the returned results.\n"]
  name : string_;
      [@ocaml.doc "The name of the filter as specified for a [Describe*] or similar operation.\n"]
}
[@@ocaml.doc
  "Identifies the name and value of a filter object. This filter is used to limit the number and \
   type of DMS objects that are returned for a particular [Describe*] call or similar operation. \
   Filters are used as an optional parameter for certain API operations. \n"]

type nonrec filter_list = filter list [@@ocaml.doc ""]

type nonrec export_metadata_model_assessment_result_entry = {
  object_ur_l : string_ option;
      [@ocaml.doc "The URL for the object containing the exported metadata model assessment.\n"]
  s3_object_key : string_ option;
      [@ocaml.doc
        "The object key for the object containing the exported metadata model assessment.\n"]
}
[@@ocaml.doc "Provides information about an exported metadata model assessment.\n"]

type nonrec export_metadata_model_assessment_response = {
  csv_report : export_metadata_model_assessment_result_entry option;
      [@ocaml.doc "The Amazon S3 details for an assessment exported in CSV format.\n"]
  pdf_report : export_metadata_model_assessment_result_entry option;
      [@ocaml.doc "The Amazon S3 details for an assessment exported in PDF format.\n"]
}
[@@ocaml.doc ""]

type nonrec assessment_report_type = CSV [@ocaml.doc ""] | PDF [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec assessment_report_types_list = assessment_report_type list [@@ocaml.doc ""]

type nonrec export_metadata_model_assessment_message = {
  assessment_report_types : assessment_report_types_list option;
      [@ocaml.doc "The file format of the assessment file.\n"]
  file_name : string_ option;
      [@ocaml.doc "The name of the assessment file to create in your Amazon S3 bucket.\n"]
  selection_rules : string_; [@ocaml.doc "A value that specifies the database objects to assess.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec event_subscriptions_list = event_subscription list [@@ocaml.doc ""]

type nonrec event = {
  date : t_stamp option; [@ocaml.doc "The date of the event.\n"]
  event_categories : event_categories_list option;
      [@ocaml.doc "The event categories available for the specified source type.\n"]
  message : string_ option; [@ocaml.doc "The event message.\n"]
  source_type : source_type option;
      [@ocaml.doc
        " The type of DMS resource that generates events. \n\n\
        \ Valid values: replication-instance | endpoint | replication-task\n\
        \ "]
  source_identifier : string_ option; [@ocaml.doc " The identifier of an event source.\n"]
}
[@@ocaml.doc
  "Describes an identifiable significant activity that affects a replication instance or task. \
   This object can provide the message, the available event categories, the date and source of the \
   event, and the DMS resource type.\n"]

type nonrec event_list = event list [@@ocaml.doc ""]

type nonrec event_category_group = {
  event_categories : event_categories_list option;
      [@ocaml.doc " A list of event categories from a source type that you've chosen.\n"]
  source_type : string_ option;
      [@ocaml.doc
        " The type of DMS resource that generates events. \n\n\
        \ Valid values: replication-instance | replication-server | security-group | \
         replication-task\n\
        \ "]
}
[@@ocaml.doc
  "Lists categories of events subscribed to, and generated by, the applicable DMS resource type. \
   This data type appears in response to the \
   {{:https://docs.aws.amazon.com/dms/latest/APIReference/API_EventCategoryGroup.html} \
   [DescribeEventCategories] } action.\n"]

type nonrec event_category_group_list = event_category_group list [@@ocaml.doc ""]

type nonrec available_upgrades_list = string_ list [@@ocaml.doc ""]

type nonrec engine_version = {
  available_upgrades : available_upgrades_list option;
      [@ocaml.doc "The list of valid replication instance versions that you can upgrade to.\n"]
  force_upgrade_date : t_stamp option;
      [@ocaml.doc "The date when the replication instance will have a version upgrade forced.\n"]
  deprecation_date : t_stamp option;
      [@ocaml.doc
        "The date when the replication instance version will be deprecated and can no longer be \
         requested.\n"]
  auto_upgrade_date : t_stamp option;
      [@ocaml.doc
        "The date when the replication instance will be automatically upgraded. This setting only \
         applies if the [auto-minor-version] setting is enabled.\n"]
  launch_date : t_stamp option;
      [@ocaml.doc "The date when the replication instance version became publicly available.\n"]
  release_status : release_status_values option;
      [@ocaml.doc "The release status of the replication instance version.\n"]
  lifecycle : string_ option;
      [@ocaml.doc
        "The lifecycle status of the replication instance version. Valid values are [DEPRECATED], \
         [DEFAULT_VERSION], and [ACTIVE].\n"]
  version : string_ option; [@ocaml.doc "The version number of the replication instance.\n"]
}
[@@ocaml.doc "Provides information about a replication instance version.\n"]

type nonrec engine_version_list = engine_version list [@@ocaml.doc ""]

type nonrec endpoint_setting_type_value =
  | ENUM [@ocaml.doc ""]
  | INTEGER [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | STRING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec endpoint_setting_enum_values = string_ list [@@ocaml.doc ""]

type nonrec endpoint_setting = {
  default_value : string_ option;
      [@ocaml.doc
        "The default value of the endpoint setting if no value is specified using [CreateEndpoint] \
         or [ModifyEndpoint].\n"]
  int_value_max : integer_optional option;
      [@ocaml.doc "The maximum value of an endpoint setting that is of type [int].\n"]
  int_value_min : integer_optional option;
      [@ocaml.doc "The minimum value of an endpoint setting that is of type [int].\n"]
  applicability : string_ option;
      [@ocaml.doc
        "The relevance or validity of an endpoint setting for an engine name and its endpoint type.\n"]
  units : string_ option; [@ocaml.doc "The unit of measure for this endpoint setting.\n"]
  sensitive : boolean_optional option;
      [@ocaml.doc "A value that marks this endpoint setting as sensitive.\n"]
  enum_values : endpoint_setting_enum_values option;
      [@ocaml.doc "Enumerated values to use for this endpoint.\n"]
  type_ : endpoint_setting_type_value option;
      [@ocaml.doc "The type of endpoint. Valid values are [source] and [target].\n"]
  name : string_ option; [@ocaml.doc "The name that you want to give the endpoint settings.\n"]
}
[@@ocaml.doc "Endpoint settings.\n"]

type nonrec endpoint_settings_list = endpoint_setting list [@@ocaml.doc ""]

type nonrec endpoint_list = endpoint list [@@ocaml.doc ""]

type nonrec describe_table_statistics_response = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  table_statistics : table_statistics_list option; [@ocaml.doc "The table statistics.\n"]
  replication_task_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication task.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_table_statistics_message = {
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to table statistics.\n\n\
        \ Valid filter names: schema-name | table-name | table-state\n\
        \ \n\
        \  A combination of filters creates an AND condition where each record matches all \
         specified filters.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 500.\n\
        \  "]
  replication_task_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication task.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_schemas_response = {
  schemas : schema_list option; [@ocaml.doc "The described schema.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_schemas_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  endpoint_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replications_response = {
  replications : replication_list option; [@ocaml.doc "The replication descriptions.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replications_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the replications.\n\n\
        \  Valid filter names: [replication-config-arn] | [replication-config-id] \n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_tasks_response = {
  replication_tasks : replication_task_list option;
      [@ocaml.doc "A description of the replication tasks.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_tasks_message = {
  without_settings : boolean_optional option;
      [@ocaml.doc
        "An option to set to avoid returning information about settings. Use this to reduce \
         overhead when setting information is too large. To use this option, choose [true]; \
         otherwise, choose [false] (the default).\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to replication tasks.\n\n\
        \ Valid filter names: replication-task-arn | replication-task-id | migration-type | \
         endpoint-arn | replication-instance-arn\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_task_individual_assessments_response = {
  replication_task_individual_assessments : replication_task_individual_assessment_list option;
      [@ocaml.doc "One or more individual assessments as specified by [Filters].\n"]
  marker : string_ option;
      [@ocaml.doc
        "A pagination token returned for you to pass to a subsequent request. If you pass this \
         token as the [Marker] value in a subsequent request, the response includes only records \
         beyond the marker, up to the value specified in the request by [MaxRecords].\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_task_individual_assessments_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the individual assessments described in the form of key-value pairs.\n\n\
        \ Valid filter names: [replication-task-assessment-run-arn], [replication-task-arn], \
         [status] \n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_task_assessment_runs_response = {
  replication_task_assessment_runs : replication_task_assessment_run_list option;
      [@ocaml.doc "One or more premigration assessment runs as specified by [Filters].\n"]
  marker : string_ option;
      [@ocaml.doc
        "A pagination token returned for you to pass to a subsequent request. If you pass this \
         token as the [Marker] value in a subsequent request, the response includes only records \
         beyond the marker, up to the value specified in the request by [MaxRecords].\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_task_assessment_runs_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the premigration assessment runs described in the form of key-value \
         pairs.\n\n\
        \ Valid filter names: [replication-task-assessment-run-arn], [replication-task-arn], \
         [replication-instance-arn], [status] \n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_task_assessment_results_response = {
  replication_task_assessment_results : replication_task_assessment_result_list option;
      [@ocaml.doc " The task assessment report. \n"]
  bucket_name : string_ option;
      [@ocaml.doc "- The Amazon S3 bucket where the task assessment report is located. \n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_task_assessment_results_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  replication_task_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) string that uniquely identifies the task. When this input \
         parameter is specified, the API returns only one result and ignore the values of the \
         [MaxRecords] and [Marker] parameters. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_table_statistics_response = {
  replication_table_statistics : replication_table_statistics_list option;
      [@ocaml.doc
        "Returns table statistics on the replication, including table name, rows inserted, rows \
         updated, and rows deleted.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  replication_config_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name of the replication config.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_table_statistics_message = {
  filters : filter_list option;
      [@ocaml.doc "Filters applied to the replication table statistics.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n"]
  replication_config_arn : string_; [@ocaml.doc "The replication config to describe.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_subnet_groups_response = {
  replication_subnet_groups : replication_subnet_groups option;
      [@ocaml.doc "A description of the replication subnet groups.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_subnet_groups_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to replication subnet groups.\n\n\
        \ Valid filter names: replication-subnet-group-id\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_instances_response = {
  replication_instances : replication_instance_list option;
      [@ocaml.doc "The replication instances described.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_instances_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to replication instances.\n\n\
        \ Valid filter names: replication-instance-arn | replication-instance-id | \
         replication-instance-class | engine-version\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_instance_task_logs_response = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  replication_instance_task_logs : replication_instance_task_logs_list option;
      [@ocaml.doc
        "An array of replication task log metadata. Each member of the array contains the \
         replication task name, ARN, and task log size (in bytes). \n"]
  replication_instance_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication instance.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_replication_instance_task_logs_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  replication_instance_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication instance.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_replication_configs_response = {
  replication_configs : replication_config_list option;
      [@ocaml.doc
        "Returned configuration parameters that describe each provisioned DMS Serverless \
         replication.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_replication_configs_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n"]
  filters : filter_list option; [@ocaml.doc "Filters applied to the replication configs.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_refresh_schemas_status_response = {
  refresh_schemas_status : refresh_schemas_status option; [@ocaml.doc "The status of the schema.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_refresh_schemas_status_message = {
  endpoint_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_recommendations_response = {
  recommendations : recommendation_list option;
      [@ocaml.doc
        "The list of recommendations of target engines that Fleet Advisor created for the source \
         database.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The unique pagination token returned for you to pass to a subsequent request. Fleet \
         Advisor returns this token when the number of records in the response is greater than the \
         [MaxRecords] value. To retrieve the next page, make the call again using the returned \
         token and keeping all other arguments unchanged.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_recommendations_request = {
  next_token : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [NextToken] is returned by a previous response, there are more results available. The \
         value of [NextToken] is a unique pagination token for each page. Make the call again \
         using the returned token to retrieve the next page. Keep all other arguments unchanged.\n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, Fleet Advisor includes a pagination token in the response \
         so that you can retrieve the remaining results.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the target engine recommendations described in the form of key-value \
         pairs.\n\n\
        \ Valid filter names: [database-id] | [engine-name] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_recommendation_limitations_response = {
  limitations : limitation_list option;
      [@ocaml.doc
        "The list of limitations for recommendations of target Amazon Web Services engines.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The unique pagination token returned for you to pass to a subsequent request. Fleet \
         Advisor returns this token when the number of records in the response is greater than the \
         [MaxRecords] value. To retrieve the next page, make the call again using the returned \
         token and keeping all other arguments unchanged.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_recommendation_limitations_request = {
  next_token : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [NextToken] is returned by a previous response, there are more results available. The \
         value of [NextToken] is a unique pagination token for each page. Make the call again \
         using the returned token to retrieve the next page. Keep all other arguments unchanged.\n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, Fleet Advisor includes a pagination token in the response \
         so that you can retrieve the remaining results.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the limitations described in the form of key-value pairs.\n\n\
        \ Valid filter names: [database-id] | [engine-name] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_pending_maintenance_actions_response = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  pending_maintenance_actions : pending_maintenance_actions option;
      [@ocaml.doc "The pending maintenance action.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_pending_maintenance_actions_message = {
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  filters : filter_list option; [@ocaml.doc "\n"]
  replication_instance_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication instance.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_orderable_replication_instances_response = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  orderable_replication_instances : orderable_replication_instance_list option;
      [@ocaml.doc "The order-able replication instances available.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_orderable_replication_instances_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
}
[@@ocaml.doc "\n"]

type nonrec describe_migration_projects_response = {
  migration_projects : migration_project_list option;
      [@ocaml.doc "A description of migration projects.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_migration_projects_message = {
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, DMS includes a pagination token in the response so that you \
         can retrieve the remaining results.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the migration projects described in the form of key-value pairs.\n\n\
        \ Valid filter names and values:\n\
        \ \n\
        \  {ul\n\
        \        {-  instance-profile-identifier, instance profile arn or name\n\
        \            \n\
        \             }\n\
        \        {-  data-provider-identifier, data provider arn or name\n\
        \            \n\
        \             }\n\
        \        {-  migration-project-identifier, migration project arn or name\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_response = {
  definition : string_ option;
      [@ocaml.doc
        "The SQL text of the metadata model. This field might not be populated for some metadata \
         models.\n"]
  target_metadata_models : metadata_model_reference_list option;
      [@ocaml.doc
        "A list of counterpart metadata models in the target. This field is populated only when \
         Origin is SOURCE and after the object has been converted by DMS Schema Conversion.\n"]
  metadata_model_type : string_ option; [@ocaml.doc "The type of the metadata model.\n"]
  metadata_model_name : string_ option; [@ocaml.doc "The name of the metadata model.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_message = {
  origin : origin_type_value;
      [@ocaml.doc
        "Specifies whether to retrieve metadata from the source or target tree. Valid values: \
         SOURCE | TARGET\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
  selection_rules : string_;
      [@ocaml.doc
        "The JSON string that specifies which metadata model to retrieve. Only one selection rule \
         with \"rule-action\": \"explicit\" can be provided. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.SelectionTransformation.Selections.html}Selection \
         Rules} in the DMS User Guide.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_imports_response = {
  requests : schema_conversion_request_list option;
      [@ocaml.doc "A paginated list of metadata model imports.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_imports_message = {
  max_records : integer_optional option;
      [@ocaml.doc "A paginated list of metadata model imports.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the metadata model imports described in the form of key-value pairs.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_exports_to_target_response = {
  requests : schema_conversion_request_list option;
      [@ocaml.doc "A paginated list of metadata model exports.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_exports_to_target_message = {
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, DMS includes a pagination token in the response so that you \
         can retrieve the remaining results.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the metadata model exports described in the form of key-value pairs.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_exports_as_script_response = {
  requests : schema_conversion_request_list option;
      [@ocaml.doc "A paginated list of metadata model exports.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_exports_as_script_message = {
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, DMS includes a pagination token in the response so that you \
         can retrieve the remaining results.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the metadata model exports described in the form of key-value pairs.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_creations_response = {
  requests : schema_conversion_request_list option;
      [@ocaml.doc
        "A list of metadata model creation requests. The ExportSqlDetails field will never be \
         populated for the DescribeMetadataModelCreations operation.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         metadata model creation requests. If Marker is returned, there are more metadata model \
         creation requests available.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_creations_message = {
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of metadata model creation requests to include in the response. If \
         more requests exist than the specified MaxRecords value, a pagination token is provided \
         in the response so that you can retrieve the remaining results.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         metadata model creation requests. If Marker is returned by a previous response, there are \
         more metadata model creation requests available.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the metadata model creation requests described in the form of \
         key-value pairs. The supported filters are request-id and status.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_conversions_response = {
  requests : schema_conversion_request_list option;
      [@ocaml.doc "A paginated list of metadata model conversions.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_conversions_message = {
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, DMS includes a pagination token in the response so that you \
         can retrieve the remaining results.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the metadata model conversions described in the form of key-value pairs.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_children_response = {
  metadata_model_children : metadata_model_reference_list option;
      [@ocaml.doc "A list of child metadata models.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         metadata model children. If a marker is returned, there are more metadata model children \
         available.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_children_message = {
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of metadata model children to include in the response. If more items \
         exist than the specified MaxRecords value, a marker is included in the response so that \
         the remaining results can be retrieved.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that indicates where the next page should start. If \
         this parameter is specified, the response includes only records beyond the marker, up to \
         the value specified by MaxRecords.\n"]
  origin : origin_type_value;
      [@ocaml.doc
        "Specifies whether to retrieve metadata from the source or target tree. Valid values: \
         SOURCE | TARGET\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
  selection_rules : string_;
      [@ocaml.doc
        "The JSON string that specifies which metadata model's children to retrieve. Only one \
         selection rule with \"rule-action\": \"explicit\" can be provided. For more information, \
         see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.SelectionTransformation.Selections.html}Selection \
         Rules} in the DMS User Guide.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_assessments_response = {
  requests : schema_conversion_request_list option;
      [@ocaml.doc
        "A paginated list of metadata model assessments for the specified migration project.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_metadata_model_assessments_message = {
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, DMS includes a pagination token in the response so that you \
         can retrieve the remaining results.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the metadata model assessments described in the form of key-value pairs.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The name or Amazon Resource Name (ARN) of the migration project.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_instance_profiles_response = {
  instance_profiles : instance_profile_list option;
      [@ocaml.doc "A description of instance profiles.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_instance_profiles_message = {
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, DMS includes a pagination token in the response so that you \
         can retrieve the remaining results.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the instance profiles described in the form of key-value pairs.\n\n\
        \ Valid filter names and values: instance-profile-identifier, instance profile arn or name\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_advisor_schemas_response = {
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. \n"]
  fleet_advisor_schemas : fleet_advisor_schema_list option;
      [@ocaml.doc "A collection of [SchemaResponse] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_advisor_schemas_request = {
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned by a previous response, there are more results available. The \
         value of [NextToken] is a unique pagination token for each page. Make the call again \
         using the returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_records : integer_optional option;
      [@ocaml.doc "Sets the maximum number of records returned in the response.\n"]
  filters : filter_list option;
      [@ocaml.doc
        " If you specify any of the following filters, the output includes information for only \
         those schemas that meet the filter criteria:\n\n\
        \ {ul\n\
        \       {-   [complexity] \226\128\147 The schema's complexity, for example [Simple].\n\
        \           \n\
        \            }\n\
        \       {-   [database-id] \226\128\147 The ID of the schema's database.\n\
        \           \n\
        \            }\n\
        \       {-   [database-ip-address] \226\128\147 The IP address of the schema's database.\n\
        \           \n\
        \            }\n\
        \       {-   [database-name] \226\128\147 The name of the schema's database.\n\
        \           \n\
        \            }\n\
        \       {-   [database-engine] \226\128\147 The name of the schema database's engine.\n\
        \           \n\
        \            }\n\
        \       {-   [original-schema-name] \226\128\147 The name of the schema's database's main \
         schema.\n\
        \           \n\
        \            }\n\
        \       {-   [schema-id] \226\128\147 The ID of the schema, for example [15].\n\
        \           \n\
        \            }\n\
        \       {-   [schema-name] \226\128\147 The name of the schema.\n\
        \           \n\
        \            }\n\
        \       {-   [server-ip-address] \226\128\147 The IP address of the schema database's \
         server.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   An example is: [describe-fleet-advisor-schemas --filter\n\
        \                Name=\"schema-id\",Values=\"50\"] \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_advisor_schema_object_summary_response = {
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. \n"]
  fleet_advisor_schema_objects : fleet_advisor_schema_object_list option;
      [@ocaml.doc "A collection of [FleetAdvisorSchemaObjectResponse] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_advisor_schema_object_summary_request = {
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned by a previous response, there are more results available. The \
         value of [NextToken] is a unique pagination token for each page. Make the call again \
         using the returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "  End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon \
         Web Services DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access \
         the Amazon Web Services DMS Fleet Advisor; console or Amazon Web Services DMS Fleet \
         Advisor; resources. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/dms_fleet.advisor-end-of-support.html}Amazon \
         Web Services DMS Fleet Advisor end of support}. \n\
        \ \n\
        \   Sets the maximum number of records returned in the response.\n\
        \   "]
  filters : filter_list option;
      [@ocaml.doc
        " If you specify any of the following filters, the output includes information for only \
         those schema objects that meet the filter criteria:\n\n\
        \ {ul\n\
        \       {-   [schema-id] \226\128\147 The ID of the schema, for example \
         [d4610ac5-e323-4ad9-bc50-eaf7249dfe9d].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Example: [describe-fleet-advisor-schema-object-summary --filter\n\
        \                Name=\"schema-id\",Values=\"50\"] \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_advisor_lsa_analysis_response = {
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. \n"]
  analysis : fleet_advisor_lsa_analysis_response_list option;
      [@ocaml.doc "A list of [FleetAdvisorLsaAnalysisResponse] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_advisor_lsa_analysis_request = {
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned by a previous response, there are more results available. The \
         value of [NextToken] is a unique pagination token for each page. Make the call again \
         using the returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_records : integer_optional option;
      [@ocaml.doc "Sets the maximum number of records returned in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec database_instance_software_details_response = {
  tooltip : string_ option;
      [@ocaml.doc
        "Information about the database engine software, for example [Mainstream support\n\
        \                ends on November 14th, 2024].\n"]
  os_architecture : integer_optional option;
      [@ocaml.doc "The operating system architecture of the database.\n"]
  support_level : string_ option;
      [@ocaml.doc "The support level of the database, for example [Mainstream support].\n"]
  service_pack : string_ option; [@ocaml.doc "The service pack level of the database.\n"]
  engine_edition : string_ option;
      [@ocaml.doc
        "The database engine edition of a database in a Fleet Advisor collector inventory, for \
         example [Express].\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The database engine version of a database in a Fleet Advisor collector inventory, for \
         example [2019].\n"]
  engine : string_ option;
      [@ocaml.doc
        "The database engine of a database in a Fleet Advisor collector inventory, for example \
         [Microsoft\n\
        \                SQL Server].\n"]
}
[@@ocaml.doc "Describes an inventory database instance for a Fleet Advisor collector.\n"]

type nonrec collector_short_info_response = {
  collector_name : string_ option; [@ocaml.doc "The name of the Fleet Advisor collector.\n"]
  collector_referenced_id : string_ option;
      [@ocaml.doc "The reference ID of the Fleet Advisor collector.\n"]
}
[@@ocaml.doc "Briefly describes a Fleet Advisor collector.\n"]

type nonrec collectors_list = collector_short_info_response list [@@ocaml.doc ""]

type nonrec database_response = {
  collectors : collectors_list option;
      [@ocaml.doc "A list of collectors associated with the database.\n"]
  software_details : database_instance_software_details_response option;
      [@ocaml.doc
        "The software details of a database in a Fleet Advisor collector inventory, such as \
         database engine and version.\n"]
  server : server_short_info_response option;
      [@ocaml.doc "The server name of a database in a Fleet Advisor collector inventory. \n"]
  number_of_schemas : long_optional option;
      [@ocaml.doc "The number of schemas in a Fleet Advisor collector inventory database. \n"]
  ip_address : string_ option;
      [@ocaml.doc "The IP address of a database in a Fleet Advisor collector inventory. \n"]
  database_name : string_ option;
      [@ocaml.doc "The name of a database in a Fleet Advisor collector inventory. \n"]
  database_id : string_ option;
      [@ocaml.doc "The ID of a database in a Fleet Advisor collector inventory.\n"]
}
[@@ocaml.doc "Describes a database in a Fleet Advisor collector inventory.\n"]

type nonrec database_list = database_response list [@@ocaml.doc ""]

type nonrec describe_fleet_advisor_databases_response = {
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. \n"]
  databases : database_list option;
      [@ocaml.doc
        "Provides descriptions of the Fleet Advisor collector databases, including the database's \
         collector, ID, and name.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_advisor_databases_request = {
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned by a previous response, there are more results available. The \
         value of [NextToken] is a unique pagination token for each page. Make the call again \
         using the returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_records : integer_optional option;
      [@ocaml.doc "Sets the maximum number of records returned in the response.\n"]
  filters : filter_list option;
      [@ocaml.doc
        " If you specify any of the following filters, the output includes information for only \
         those databases that meet the filter criteria: \n\n\
        \ {ul\n\
        \       {-   [database-id] \226\128\147 The ID of the database.\n\
        \           \n\
        \            }\n\
        \       {-   [database-name] \226\128\147 The name of the database.\n\
        \           \n\
        \            }\n\
        \       {-   [database-engine] \226\128\147 The name of the database engine.\n\
        \           \n\
        \            }\n\
        \       {-   [server-ip-address] \226\128\147 The IP address of the database server.\n\
        \           \n\
        \            }\n\
        \       {-   [database-ip-address] \226\128\147 The IP address of the database.\n\
        \           \n\
        \            }\n\
        \       {-   [collector-name] \226\128\147 The name of the associated Fleet Advisor \
         collector.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   An example is: [describe-fleet-advisor-databases --filter\n\
        \                Name=\"database-id\",Values=\"45\"] \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec collector_status = ACTIVE [@ocaml.doc ""] | UNREGISTERED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec collector_health_check = {
  web_collector_granted_role_based_access : boolean_optional option;
      [@ocaml.doc
        "Whether the role that you provided when creating the Fleet Advisor collector has \
         sufficient permissions to access the Fleet Advisor web collector.\n"]
  web_collector_s3_access : boolean_optional option;
      [@ocaml.doc "Whether the web collector can access its Amazon S3 bucket.\n"]
  local_collector_s3_access : boolean_optional option;
      [@ocaml.doc "Whether the local collector can access its Amazon S3 bucket.\n"]
  collector_status : collector_status option;
      [@ocaml.doc "The status of the Fleet Advisor collector.\n"]
}
[@@ocaml.doc "Describes the last Fleet Advisor collector health check.\n"]

type nonrec collector_response = {
  inventory_data : inventory_data option; [@ocaml.doc ""]
  modified_date : string_ option;
      [@ocaml.doc
        "The timestamp when DMS last modified the collector, in the following format: \
         [2022-01-24T19:04:02.596113Z] \n"]
  created_date : string_ option;
      [@ocaml.doc
        "The timestamp when you created the collector, in the following format: \
         [2022-01-24T19:04:02.596113Z] \n"]
  registered_date : string_ option;
      [@ocaml.doc
        "The timestamp when DMS registered the collector, in the following format: \
         [2022-01-24T19:04:02.596113Z] \n"]
  last_data_received : string_ option;
      [@ocaml.doc
        "The timestamp of the last time the collector received data, in the following format: \
         [2022-01-24T19:04:02.596113Z] \n"]
  collector_health_check : collector_health_check option; [@ocaml.doc ""]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        "The IAM role that grants permissions to access the specified Amazon S3 bucket.\n"]
  s3_bucket_name : string_ option;
      [@ocaml.doc
        "The Amazon S3 bucket that the Fleet Advisor collector uses to store inventory metadata.\n"]
  description : string_ option;
      [@ocaml.doc "A summary description of the Fleet Advisor collector.\n"]
  version_status : version_status option;
      [@ocaml.doc "Whether the collector version is up to date.\n"]
  collector_version : string_ option;
      [@ocaml.doc
        "The version of your Fleet Advisor collector, in semantic versioning format, for example \
         [1.0.2] \n"]
  collector_name : string_ option; [@ocaml.doc "The name of the Fleet Advisor collector .\n"]
  collector_referenced_id : string_ option;
      [@ocaml.doc "The reference ID of the Fleet Advisor collector.\n"]
}
[@@ocaml.doc "Describes a Fleet Advisor collector.\n"]

type nonrec collector_responses = collector_response list [@@ocaml.doc ""]

type nonrec describe_fleet_advisor_collectors_response = {
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned, there are more results available. The value of [NextToken] is \
         a unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. \n"]
  collectors : collector_responses option;
      [@ocaml.doc
        "Provides descriptions of the Fleet Advisor collectors, including the collectors' name and \
         ID, and the latest inventory data. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_advisor_collectors_request = {
  next_token : string_ option;
      [@ocaml.doc
        "If [NextToken] is returned by a previous response, there are more results available. The \
         value of [NextToken] is a unique pagination token for each page. Make the call again \
         using the returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_records : integer_optional option;
      [@ocaml.doc "Sets the maximum number of records returned in the response.\n"]
  filters : filter_list option;
      [@ocaml.doc
        " If you specify any of the following filters, the output includes information for only \
         those collectors that meet the filter criteria:\n\n\
        \ {ul\n\
        \       {-   [collector-referenced-id] \226\128\147 The ID of the collector agent, for \
         example [d4610ac5-e323-4ad9-bc50-eaf7249dfe9d].\n\
        \           \n\
        \            }\n\
        \       {-   [collector-name] \226\128\147 The name of the collector agent.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   An example is: [describe-fleet-advisor-collectors --filter\n\
        \                \
         Name=\"collector-referenced-id\",Values=\"d4610ac5-e323-4ad9-bc50-eaf7249dfe9d\"] \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec describe_extension_pack_associations_response = {
  requests : schema_conversion_request_list option;
      [@ocaml.doc
        "A paginated list of extension pack associations for the specified migration project.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_extension_pack_associations_message = {
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, DMS includes a pagination token in the response so that you \
         can retrieve the remaining results.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the extension pack associations described in the form of key-value \
         pairs.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The name or Amazon Resource Name (ARN) for the migration project.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_events_response = {
  events : event_list option; [@ocaml.doc "The events described.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_events_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to events. The only valid filter is [replication-instance-id].\n"]
  event_categories : event_categories_list option;
      [@ocaml.doc "A list of event categories for the source type that you've chosen.\n"]
  duration : integer_optional option; [@ocaml.doc "The duration of the events to be listed.\n"]
  end_time : t_stamp option; [@ocaml.doc "The end time for the events to be listed.\n"]
  start_time : t_stamp option; [@ocaml.doc "The start time for the events to be listed.\n"]
  source_type : source_type option;
      [@ocaml.doc
        "The type of DMS resource that generates events.\n\n\
        \ Valid values: replication-instance | replication-task\n\
        \ "]
  source_identifier : string_ option; [@ocaml.doc " The identifier of an event source.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_event_subscriptions_response = {
  event_subscriptions_list : event_subscriptions_list option;
      [@ocaml.doc "A list of event subscriptions.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_event_subscriptions_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to event subscriptions.\n\n\
        \ Valid filter names: [event-subscription-arn] | [event-subscription-id] \n\
        \ "]
  subscription_name : string_ option;
      [@ocaml.doc "The name of the DMS event subscription to be described.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_event_categories_response = {
  event_category_group_list : event_category_group_list option;
      [@ocaml.doc "A list of event categories.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_event_categories_message = {
  filters : filter_list option; [@ocaml.doc "Filters applied to the event categories.\n"]
  source_type : string_ option;
      [@ocaml.doc
        " The type of DMS resource that generates events. \n\n\
        \ Valid values: replication-instance | replication-task\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec describe_engine_versions_response = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  engine_versions : engine_version_list option;
      [@ocaml.doc
        "Returned [EngineVersion] objects that describe the replication instance engine versions \
         used in the project.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_engine_versions_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_endpoints_response = {
  endpoints : endpoint_list option; [@ocaml.doc "Endpoint description.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_endpoints_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the endpoints.\n\n\
        \ Valid filter names: endpoint-arn | endpoint-type | endpoint-id | engine-name\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec describe_endpoint_types_response = {
  supported_endpoint_types : supported_endpoint_type_list option;
      [@ocaml.doc "The types of endpoints that are supported.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_endpoint_types_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the endpoint types.\n\n\
        \ Valid filter names: engine-name | endpoint-type\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec describe_endpoint_settings_response = {
  endpoint_settings : endpoint_settings_list option;
      [@ocaml.doc
        "Descriptions of the endpoint settings available for your source or target database engine.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_endpoint_settings_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords].\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n"]
  engine_name : string_;
      [@ocaml.doc "The database engine used for your source or target endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec data_provider_list = data_provider list [@@ocaml.doc ""]

type nonrec describe_data_providers_response = {
  data_providers : data_provider_list option; [@ocaml.doc "A description of data providers.\n"]
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_data_providers_message = {
  marker : string_ option;
      [@ocaml.doc
        "Specifies the unique pagination token that makes it possible to display the next page of \
         results. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by [MaxRecords].\n\n\
        \ If [Marker] is returned by a previous response, there are more results available. The \
         value of [Marker] is a unique pagination token for each page. To retrieve the next page, \
         make the call again using the returned token and keeping all other arguments unchanged.\n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, DMS includes a pagination token in the response so that you \
         can retrieve the remaining results.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the data providers described in the form of key-value pairs.\n\n\
        \ Valid filter names and values: data-provider-identifier, data provider arn or name\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec data_migrations = data_migration list [@@ocaml.doc ""]

type nonrec describe_data_migrations_response = {
  marker : marker option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  data_migrations : data_migrations option;
      [@ocaml.doc "Returns information about the data migrations used in the project.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_data_migrations_message = {
  without_statistics : boolean_optional option;
      [@ocaml.doc
        "An option to set to avoid returning information about statistics. Use this to reduce \
         overhead when statistics information is too large. To use this option, choose [true]; \
         otherwise, choose [false] (the default).\n"]
  without_settings : boolean_optional option;
      [@ocaml.doc
        "An option to set to avoid returning information about settings. Use this to reduce \
         overhead when setting information is too large. To use this option, choose [true]; \
         otherwise, choose [false] (the default).\n"]
  marker : marker option;
      [@ocaml.doc
        "An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n"]
  filters : filter_list option; [@ocaml.doc "Filters applied to the data migrations.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_conversion_configuration_response = {
  conversion_configuration : string_ option;
      [@ocaml.doc "The configuration parameters for the schema conversion project.\n"]
  migration_project_identifier : string_ option;
      [@ocaml.doc "The name or Amazon Resource Name (ARN) for the schema conversion project.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_conversion_configuration_message = {
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc
        "The name or Amazon Resource Name (ARN) for the schema conversion project to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_list = connection list [@@ocaml.doc ""]

type nonrec describe_connections_response = {
  connections : connection_list option; [@ocaml.doc "A description of the connections.\n"]
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_connections_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: Minimum 20, maximum 100.\n\
        \  "]
  filters : filter_list option;
      [@ocaml.doc
        "The filters applied to the connection.\n\n\
        \ Valid filter names: endpoint-arn | replication-instance-arn\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec certificate_list = certificate list [@@ocaml.doc ""]

type nonrec describe_certificates_response = {
  certificates : certificate_list option;
      [@ocaml.doc
        "The Secure Sockets Layer (SSL) certificates associated with the replication instance.\n"]
  marker : string_ option; [@ocaml.doc "The pagination token.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_certificates_message = {
  marker : string_ option;
      [@ocaml.doc
        " An optional pagination token provided by a previous request. If this parameter is \
         specified, the response includes only records beyond the marker, up to the value \
         specified by [MaxRecords]. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        " The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved. \n\n\
        \ Default: 10\n\
        \ "]
  filters : filter_list option;
      [@ocaml.doc
        "Filters applied to the certificates described in the form of key-value pairs. Valid \
         values are [certificate-arn] and [certificate-id].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_applicable_individual_assessments_response = {
  marker : string_ option;
      [@ocaml.doc
        "Pagination token returned for you to pass to a subsequent request. If you pass this token \
         as the [Marker] value in a subsequent request, the response includes only records beyond \
         the marker, up to the value specified in the request by [MaxRecords].\n"]
  individual_assessment_names : individual_assessment_name_list option;
      [@ocaml.doc
        "List of names for the individual assessments supported by the premigration assessment run \
         that you start based on the specified request parameters. For more information on the \
         available individual assessments, including compatibility with different migration task \
         configurations, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.AssessmentReport.html}Working \
         with premigration assessment runs} in the {i Database Migration Service User Guide.} \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_applicable_individual_assessments_message = {
  marker : string_ option;
      [@ocaml.doc
        "Optional pagination token provided by a previous request. If this parameter is specified, \
         the response includes only records beyond the marker, up to the value specified by \
         [MaxRecords].\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "Maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n"]
  migration_type : migration_type_value option;
      [@ocaml.doc
        "Name of the migration type that each provided individual assessment must support.\n"]
  target_engine_name : string_ option;
      [@ocaml.doc
        "Name of a database engine that the specified replication instance supports as a target.\n"]
  source_engine_name : string_ option;
      [@ocaml.doc
        "Name of a database engine that the specified replication instance supports as a source.\n"]
  replication_config_arn : string_ option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of a serverless replication on which you want to base the \
         default list of individual assessments.\n"]
  replication_instance_arn : string_ option;
      [@ocaml.doc
        "ARN of a replication instance on which you want to base the default list of individual \
         assessments.\n"]
  replication_task_arn : string_ option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of a migration task on which you want to base the default list \
         of individual assessments.\n"]
}
[@@ocaml.doc "\n"]

type nonrec account_quota = {
  max : long option; [@ocaml.doc "The maximum allowed value for the quota.\n"]
  used : long option; [@ocaml.doc "The amount currently used toward the quota maximum.\n"]
  account_quota_name : string_ option;
      [@ocaml.doc "The name of the DMS quota for this Amazon Web Services account.\n"]
}
[@@ocaml.doc
  "Describes a quota for an Amazon Web Services account, for example the number of replication \
   instances allowed.\n"]

type nonrec account_quota_list = account_quota list [@@ocaml.doc ""]

type nonrec describe_account_attributes_response = {
  unique_account_identifier : string_ option;
      [@ocaml.doc
        "A unique DMS identifier for an account in a particular Amazon Web Services Region. The \
         value of this identifier has the following format: [c99999999999]. DMS uses this \
         identifier to name artifacts. For example, DMS uses this identifier to name the default \
         Amazon S3 bucket for storing task assessment reports in a given Amazon Web Services \
         Region. The format of this S3 bucket name is the following: \n\
         {[\n\
         dms-{i AccountNumber}-{i UniqueAccountIdentifier}.\n\
         ]}\n\
        \ Here is an example name for this default S3 bucket: [dms-111122223333-c44445555666].\n\n\
        \  DMS supports the [UniqueAccountIdentifier] parameter in versions 3.1.4 and later.\n\
        \  \n\
        \   "]
  account_quotas : account_quota_list option; [@ocaml.doc "Account quota information.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_account_attributes_message = unit [@@ocaml.doc ""]

type nonrec delete_replication_task_response = {
  replication_task : replication_task option; [@ocaml.doc "The deleted replication task.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_replication_task_message = {
  replication_task_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication task to be deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_replication_task_assessment_run_response = {
  replication_task_assessment_run : replication_task_assessment_run option;
      [@ocaml.doc "The [ReplicationTaskAssessmentRun] object for the deleted assessment run.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_replication_task_assessment_run_message = {
  replication_task_assessment_run_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the premigration assessment run to be deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_replication_subnet_group_response = unit [@@ocaml.doc ""]

type nonrec delete_replication_subnet_group_message = {
  replication_subnet_group_identifier : string_;
      [@ocaml.doc "The subnet group name of the replication instance.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_replication_instance_response = {
  replication_instance : replication_instance option;
      [@ocaml.doc "The replication instance that was deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_replication_instance_message = {
  replication_instance_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication instance to be deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_replication_config_response = {
  replication_config : replication_config option;
      [@ocaml.doc
        "Configuration parameters returned for the DMS Serverless replication after it is deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_replication_config_message = {
  replication_config_arn : string_; [@ocaml.doc "The replication config to delete.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_migration_project_response = {
  migration_project : migration_project option;
      [@ocaml.doc "The migration project that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_migration_project_message = {
  migration_project_identifier : string_;
      [@ocaml.doc "The name or Amazon Resource Name (ARN) of the migration project to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_instance_profile_response = {
  instance_profile : instance_profile option; [@ocaml.doc "The instance profile that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_instance_profile_message = {
  instance_profile_identifier : string_;
      [@ocaml.doc "The identifier of the instance profile to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_fleet_advisor_databases_response = {
  database_ids : string_list option;
      [@ocaml.doc "The IDs of the databases that the operation deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_fleet_advisor_databases_request = {
  database_ids : string_list;
      [@ocaml.doc "The IDs of the Fleet Advisor collector databases to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec collector_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified collector doesn't exist.\n"]

type nonrec delete_collector_request = {
  collector_referenced_id : string_;
      [@ocaml.doc "The reference ID of the Fleet Advisor collector to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_event_subscription_response = {
  event_subscription : event_subscription option;
      [@ocaml.doc "The event subscription that was deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_event_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc "The name of the DMS event notification subscription to be deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_endpoint_response = {
  endpoint : endpoint option; [@ocaml.doc "The endpoint that was deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_endpoint_message = {
  endpoint_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_data_provider_response = {
  data_provider : data_provider option; [@ocaml.doc "The data provider that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_data_provider_message = {
  data_provider_identifier : string_; [@ocaml.doc "The identifier of the data provider to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_data_migration_response = {
  data_migration : data_migration option; [@ocaml.doc "The deleted data migration.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_data_migration_message = {
  data_migration_identifier : string_;
      [@ocaml.doc "The identifier (name or ARN) of the data migration to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connection_response = {
  connection : connection option; [@ocaml.doc "The connection that is being deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_connection_message = {
  replication_instance_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replication instance.\n"]
  endpoint_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_certificate_response = {
  certificate : certificate option; [@ocaml.doc "The Secure Sockets Layer (SSL) certificate.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_certificate_message = {
  certificate_arn : string_; [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate.\n"]
}
[@@ocaml.doc ""]

type nonrec create_replication_task_response = {
  replication_task : replication_task option; [@ocaml.doc "The replication task that was created.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_replication_task_message = {
  resource_identifier : string_ option;
      [@ocaml.doc
        "A friendly name for the resource identifier at the end of the [EndpointArn] response \
         parameter that is returned in the created [Endpoint] object. The value for this parameter \
         can have up to 31 characters. It can contain only ASCII letters, digits, and hyphen \
         ('-'). Also, it can't end with a hyphen or contain two consecutive hyphens, and can only \
         begin with a letter, such as [Example-App-ARN1]. For example, this value might result in \
         the [EndpointArn] value [arn:aws:dms:eu-west-1:012345678901:rep:Example-App-ARN1]. If you \
         don't specify a [ResourceIdentifier] value, DMS generates a default identifier value for \
         the end of [EndpointArn].\n"]
  task_data : string_ option;
      [@ocaml.doc
        "Supplemental information that the task requires to migrate the data for certain source \
         and target endpoints. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.TaskData.html}Specifying \
         Supplemental Data for Task Settings} in the {i Database Migration Service User Guide.} \n"]
  tags : tag_list option; [@ocaml.doc "One or more tags to be assigned to the replication task.\n"]
  cdc_stop_position : string_ option;
      [@ocaml.doc
        "Indicates when you want a change data capture (CDC) operation to stop. The value can be \
         either server time or commit time.\n\n\
        \ Server time example: --cdc-stop-position \
         \226\128\156server_time:2018-02-09T12:12:12\226\128\157\n\
        \ \n\
        \  Commit time example: --cdc-stop-position \
         \226\128\156commit_time:2018-02-09T12:12:12\226\128\156\n\
        \  "]
  cdc_start_position : string_ option;
      [@ocaml.doc
        "Indicates when you want a change data capture (CDC) operation to start. Use either \
         CdcStartPosition or CdcStartTime to specify when you want a CDC operation to start. \
         Specifying both values results in an error.\n\n\
        \  The value can be in date, checkpoint, or LSN/SCN format.\n\
        \ \n\
        \  Date Example: --cdc-start-position \226\128\1562018-03-08T12:12:12\226\128\157\n\
        \  \n\
        \   Checkpoint Example: --cdc-start-position \
         \"checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93\"\n\
        \   \n\
        \    LSN Example: --cdc-start-position \
         \226\128\156mysql-bin-changelog.000024:373\226\128\157\n\
        \    \n\
        \      When you use this task setting with a source PostgreSQL database, a logical \
         replication slot should already be created and associated with the source endpoint. You \
         can verify this by setting the [slotName] extra connection attribute to the name of this \
         logical replication slot. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html#CHAP_Source.PostgreSQL.ConnectionAttrib}Extra \
         Connection Attributes When Using PostgreSQL as a Source for DMS}.\n\
        \      \n\
        \       "]
  cdc_start_time : t_stamp option;
      [@ocaml.doc
        "Indicates the start time for a change data capture (CDC) operation. Use either \
         CdcStartTime or CdcStartPosition to specify when you want a CDC operation to start. \
         Specifying both values results in an error.\n\n\
        \ Timestamp Example: --cdc-start-time \226\128\1562018-03-08T12:12:12\226\128\157\n\
        \ "]
  replication_task_settings : string_ option;
      [@ocaml.doc
        "Overall settings for the task, in JSON format. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TaskSettings.html}Specifying \
         Task Settings for Database Migration Service Tasks} in the {i Database Migration Service \
         User Guide.} \n"]
  table_mappings : string_;
      [@ocaml.doc
        "The table mappings for the task, in JSON format. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.html}Using \
         Table Mapping to Specify Task Settings} in the {i Database Migration Service User Guide.} \n"]
  migration_type : migration_type_value;
      [@ocaml.doc "The migration type. Valid values: [full-load] | [cdc] | [full-load-and-cdc] \n"]
  replication_instance_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a replication instance.\n"]
  target_endpoint_arn : string_;
      [@ocaml.doc "An Amazon Resource Name (ARN) that uniquely identifies the target endpoint.\n"]
  source_endpoint_arn : string_;
      [@ocaml.doc "An Amazon Resource Name (ARN) that uniquely identifies the source endpoint.\n"]
  replication_task_identifier : string_;
      [@ocaml.doc
        "An identifier for the replication task.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain 1-255 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "\n"]

type nonrec create_replication_subnet_group_response = {
  replication_subnet_group : replication_subnet_group option;
      [@ocaml.doc "The replication subnet group that was created.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_replication_subnet_group_message = {
  tags : tag_list option; [@ocaml.doc "One or more tags to be assigned to the subnet group.\n"]
  subnet_ids : subnet_identifier_list;
      [@ocaml.doc "Two or more subnet IDs to be assigned to the subnet group.\n"]
  replication_subnet_group_description : string_;
      [@ocaml.doc
        "The description for the subnet group. \n\n\
        \ Constraints: This parameter Must not contain non-printable control characters.\n\
        \ "]
  replication_subnet_group_identifier : string_;
      [@ocaml.doc
        "The name for the replication subnet group. This value is stored as a lowercase string.\n\n\
        \ Constraints: Must contain no more than 255 alphanumeric characters, periods, \
         underscores, or hyphens. Must not be \"default\".\n\
        \ \n\
        \  Example: [mySubnetgroup] \n\
        \  "]
}
[@@ocaml.doc "\n"]

type nonrec create_replication_instance_response = {
  replication_instance : replication_instance option;
      [@ocaml.doc "The replication instance that was created.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_replication_instance_message = {
  kerberos_authentication_settings : kerberos_authentication_settings option;
      [@ocaml.doc
        "Specifies the settings required for kerberos authentication when creating the replication \
         instance.\n"]
  network_type : string_ option;
      [@ocaml.doc
        "The type of IP address protocol used by a replication instance, such as IPv4 only or \
         Dual-stack that supports both IPv4 and IPv6 addressing. IPv6 only is not yet supported.\n"]
  resource_identifier : string_ option;
      [@ocaml.doc
        "A friendly name for the resource identifier at the end of the [EndpointArn] response \
         parameter that is returned in the created [Endpoint] object. The value for this parameter \
         can have up to 31 characters. It can contain only ASCII letters, digits, and hyphen \
         ('-'). Also, it can't end with a hyphen or contain two consecutive hyphens, and can only \
         begin with a letter, such as [Example-App-ARN1]. For example, this value might result in \
         the [EndpointArn] value [arn:aws:dms:eu-west-1:012345678901:rep:Example-App-ARN1]. If you \
         don't specify a [ResourceIdentifier] value, DMS generates a default identifier value for \
         the end of [EndpointArn].\n"]
  dns_name_servers : string_ option;
      [@ocaml.doc
        "A list of custom DNS name servers supported for the replication instance to access your \
         on-premise source or target database. This list overrides the default name servers \
         supported by the replication instance. You can specify a comma-separated list of internet \
         addresses for up to four on-premise DNS name servers. For example: \
         [\"1.1.1.1,2.2.2.2,3.3.3.3,4.4.4.4\"] \n"]
  publicly_accessible : boolean_optional option;
      [@ocaml.doc
        " Specifies the accessibility options for the replication instance. A value of [true] \
         represents an instance with a public IP address. A value of [false] represents an \
         instance with a private IP address. The default value is [true]. \n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "An KMS key identifier that is used to encrypt the data on the replication instance.\n\n\
        \ If you don't specify a value for the [KmsKeyId] parameter, then DMS uses your default \
         encryption key.\n\
        \ \n\
        \  KMS creates the default encryption key for your Amazon Web Services account. Your \
         Amazon Web Services account has a different default encryption key for each Amazon Web \
         Services Region.\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc "One or more tags to be assigned to the replication instance.\n"]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether minor engine upgrades are applied automatically to the \
         replication instance during the maintenance window. This parameter defaults to [true].\n\n\
        \ Default: [true] \n\
        \ "]
  engine_version : string_ option;
      [@ocaml.doc
        "The engine version number of the replication instance.\n\n\
        \ If an engine version number is not specified when a replication instance is created, the \
         default is the latest engine version available.\n\
        \ "]
  multi_a_z : boolean_optional option;
      [@ocaml.doc
        " Specifies whether the replication instance is a Multi-AZ deployment. You can't set the \
         [AvailabilityZone] parameter if the Multi-AZ parameter is set to [true]. \n"]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The weekly time range during which system maintenance can occur, in Universal Coordinated \
         Time (UTC).\n\n\
        \  Format: [ddd:hh24:mi-ddd:hh24:mi] \n\
        \ \n\
        \  Default: A 30-minute window selected at random from an 8-hour block of time per Amazon \
         Web Services Region, occurring on a random day of the week.\n\
        \  \n\
        \   Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun\n\
        \   \n\
        \    Constraints: Minimum 30-minute window.\n\
        \    "]
  replication_subnet_group_identifier : string_ option;
      [@ocaml.doc "A subnet group to associate with the replication instance.\n"]
  availability_zone : string_ option;
      [@ocaml.doc
        "The Availability Zone where the replication instance will be created. The default value \
         is a random, system-chosen Availability Zone in the endpoint's Amazon Web Services \
         Region, for example: [us-east-1d].\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        " Specifies the VPC security group to be used with the replication instance. The VPC \
         security group must work with the VPC containing the replication instance. \n"]
  replication_instance_class : replication_instance_class;
      [@ocaml.doc
        "The compute and memory capacity of the replication instance as defined for the specified \
         replication instance class. For example to specify the instance class dms.c4.large, set \
         this parameter to [\"dms.c4.large\"].\n\n\
        \ For more information on the settings and capacities for the available replication \
         instance classes, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.Types.html } \
         Choosing the right DMS replication instance}; and, \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_BestPractices.SizingReplicationInstance.html}Selecting \
         the best size for a replication instance}. \n\
        \ "]
  allocated_storage : integer_optional option;
      [@ocaml.doc
        "The amount of storage (in gigabytes) to be initially allocated for the replication \
         instance.\n"]
  replication_instance_identifier : string_;
      [@ocaml.doc
        "The replication instance identifier. This parameter is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain 1-63 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Can't end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [myrepinstance] \n\
        \   "]
}
[@@ocaml.doc "\n"]

type nonrec create_replication_config_response = {
  replication_config : replication_config option;
      [@ocaml.doc
        "Configuration parameters returned from the DMS Serverless replication after it is created.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_replication_config_message = {
  tags : tag_list option;
      [@ocaml.doc
        "One or more optional tags associated with resources used by the DMS Serverless \
         replication. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tagging.html} Tagging resources \
         in Database Migration Service}.\n"]
  resource_identifier : string_ option;
      [@ocaml.doc
        "Optional unique value or name that you set for a given resource that can be used to \
         construct an Amazon Resource Name (ARN) for that resource. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#CHAP_Security.FineGrainedAccess} \
         Fine-grained access control using resource names and tags}.\n"]
  supplemental_settings : string_ option;
      [@ocaml.doc
        "Optional JSON settings for specifying supplemental data. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.TaskData.html} Specifying \
         supplemental data for task settings}.\n"]
  replication_settings : string_ option;
      [@ocaml.doc
        "Optional JSON settings for DMS Serverless replications that are provisioned using this \
         replication configuration. For example, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TaskSettings.ChangeProcessingTuning.html} \
         Change processing tuning settings}.\n"]
  table_mappings : string_;
      [@ocaml.doc
        "JSON table mappings for DMS Serverless replications that are provisioned using this \
         replication configuration. For more information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.SelectionTransformation.html} \
         Specifying table selection and transformations rules using JSON}.\n"]
  replication_type : migration_type_value;
      [@ocaml.doc
        "The type of DMS Serverless replication to provision using this replication configuration.\n\n\
        \ Possible values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [\"full-load\"] \n\
        \            \n\
        \             }\n\
        \        {-   [\"cdc\"] \n\
        \            \n\
        \             }\n\
        \        {-   [\"full-load-and-cdc\"] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  compute_config : compute_config;
      [@ocaml.doc "Configuration parameters for provisioning an DMS Serverless replication.\n"]
  target_endpoint_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target endpoint for this DMS serverless replication \
         configuration.\n"]
  source_endpoint_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source endpoint for this DMS Serverless replication \
         configuration.\n"]
  replication_config_identifier : string_;
      [@ocaml.doc
        "A unique identifier that you want to use to create a [ReplicationConfigArn] that is \
         returned as part of the output from this action. You can then pass this output \
         [ReplicationConfigArn] as the value of the [ReplicationConfigArn] option for other \
         actions to identify both DMS Serverless replications and replication configurations that \
         you want those actions to operate on. For some actions, you can also use either this \
         unique identifier or a corresponding ARN in action filters to identify the specific \
         replication and replication configuration to operate on.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_migration_project_response = {
  migration_project : migration_project option;
      [@ocaml.doc "The migration project that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_migration_project_message = {
  schema_conversion_application_attributes : sc_application_attributes option;
      [@ocaml.doc
        "The schema conversion application attributes, including the Amazon S3 bucket name and \
         Amazon S3 role ARN.\n"]
  tags : tag_list option; [@ocaml.doc "One or more tags to be assigned to the migration project.\n"]
  description : string_ option;
      [@ocaml.doc "A user-friendly description of the migration project.\n"]
  transformation_rules : string_ option;
      [@ocaml.doc
        "The settings in JSON format for migration rules. Migration rules make it possible for you \
         to change the object names according to the rules that you specify. For example, you can \
         change an object name to lowercase or uppercase, add or remove a prefix or suffix, or \
         rename objects.\n"]
  instance_profile_identifier : string_;
      [@ocaml.doc
        "The identifier of the associated instance profile. Identifiers must begin with a letter \
         and must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen, \
         or contain two consecutive hyphens.\n"]
  target_data_provider_descriptors : data_provider_descriptor_definition_list;
      [@ocaml.doc
        "Information about the target data provider, including the name, ARN, and Amazon Web \
         Services Secrets Manager parameters.\n"]
  source_data_provider_descriptors : data_provider_descriptor_definition_list;
      [@ocaml.doc
        "Information about the source data provider, including the name, ARN, and Secrets Manager \
         parameters.\n"]
  migration_project_name : string_ option;
      [@ocaml.doc "A user-friendly name for the migration project.\n"]
}
[@@ocaml.doc ""]

type nonrec create_instance_profile_response = {
  instance_profile : instance_profile option; [@ocaml.doc "The instance profile that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_instance_profile_message = {
  vpc_security_groups : string_list option;
      [@ocaml.doc
        "Specifies the VPC security group names to be used with the instance profile. The VPC \
         security group must work with the VPC containing the instance profile.\n"]
  subnet_group_identifier : string_ option;
      [@ocaml.doc "A subnet group to associate with the instance profile.\n"]
  description : string_ option;
      [@ocaml.doc "A user-friendly description of the instance profile.\n"]
  instance_profile_name : string_ option;
      [@ocaml.doc "A user-friendly name for the instance profile.\n"]
  network_type : string_ option;
      [@ocaml.doc
        "Specifies the network type for the instance profile. A value of [IPV4] represents an \
         instance profile with IPv4 network type and only supports IPv4 addressing. A value of \
         [IPV6] represents an instance profile with IPv6 network type and only supports IPv6 \
         addressing. A value of [DUAL] represents an instance profile with dual network type that \
         supports IPv4 and IPv6 addressing.\n"]
  tags : tag_list option; [@ocaml.doc "One or more tags to be assigned to the instance profile.\n"]
  publicly_accessible : boolean_optional option;
      [@ocaml.doc
        "Specifies the accessibility options for the instance profile. A value of [true] \
         represents an instance profile with a public IP address. A value of [false] represents an \
         instance profile with a private IP address. The default value is [true].\n"]
  kms_key_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key that is used to encrypt the connection \
         parameters for the instance profile.\n\n\
        \ If you don't specify a value for the [KmsKeyArn] parameter, then DMS uses an Amazon Web \
         Services owned encryption key to encrypt your resources.\n\
        \ "]
  availability_zone : string_ option;
      [@ocaml.doc
        "The Availability Zone where the instance profile will be created. The default value is a \
         random, system-chosen Availability Zone in the Amazon Web Services Region where your data \
         provider is created, for examplem [us-east-1d].\n"]
}
[@@ocaml.doc ""]

type nonrec create_fleet_advisor_collector_response = {
  s3_bucket_name : string_ option;
      [@ocaml.doc "The Amazon S3 bucket that the collector uses to store inventory metadata.\n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        "The IAM role that grants permissions to access the specified Amazon S3 bucket.\n"]
  description : string_ option;
      [@ocaml.doc "A summary description of the Fleet Advisor collector.\n"]
  collector_name : string_ option; [@ocaml.doc "The name of the new Fleet Advisor collector.\n"]
  collector_referenced_id : string_ option;
      [@ocaml.doc
        "The unique ID of the new Fleet Advisor collector, for example: \
         [22fda70c-40d5-4acf-b233-a495bd8eb7f5] \n"]
}
[@@ocaml.doc ""]

type nonrec create_fleet_advisor_collector_request = {
  s3_bucket_name : string_;
      [@ocaml.doc
        "The Amazon S3 bucket that the Fleet Advisor collector uses to store inventory metadata.\n"]
  service_access_role_arn : string_;
      [@ocaml.doc
        "The IAM role that grants permissions to access the specified Amazon S3 bucket.\n"]
  description : string_ option;
      [@ocaml.doc "A summary description of your Fleet Advisor collector.\n"]
  collector_name : string_;
      [@ocaml.doc "The name of your Fleet Advisor collector (for example, [sample-collector]).\n"]
}
[@@ocaml.doc ""]

type nonrec create_event_subscription_response = {
  event_subscription : event_subscription option;
      [@ocaml.doc "The event subscription that was created.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_event_subscription_message = {
  tags : tag_list option;
      [@ocaml.doc "One or more tags to be assigned to the event subscription.\n"]
  enabled : boolean_optional option;
      [@ocaml.doc
        " A Boolean value; set to [true] to activate the subscription, or set to [false] to create \
         the subscription but not activate it. \n"]
  source_ids : source_ids_list option;
      [@ocaml.doc
        "A list of identifiers for which DMS provides notification events.\n\n\
        \ If you don't specify a value, notifications are provided for all sources.\n\
        \ \n\
        \  If you specify multiple values, they must be of the same type. For example, if you \
         specify a database instance ID, then all of the other values must be database instance \
         IDs.\n\
        \  "]
  event_categories : event_categories_list option;
      [@ocaml.doc
        "A list of event categories for a source type that you want to subscribe to. For more \
         information, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html}Working with Events \
         and Notifications} in the {i Database Migration Service User Guide.} \n"]
  source_type : string_ option;
      [@ocaml.doc
        " The type of DMS resource that generates the events. For example, if you want to be \
         notified of events generated by a replication instance, you set this parameter to \
         [replication-instance]. If this value isn't specified, all events are returned. \n\n\
        \ Valid values: [replication-instance] | [replication-task] \n\
        \ "]
  sns_topic_arn : string_;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the Amazon SNS topic created for event notification. \
         The ARN is created by Amazon SNS when you create a topic and subscribe to it. \n"]
  subscription_name : string_;
      [@ocaml.doc
        "The name of the DMS event notification subscription. This name must be less than 255 \
         characters.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_endpoint_response = {
  endpoint : endpoint option; [@ocaml.doc "The endpoint that was created.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_endpoint_message = {
  timestream_settings : timestream_settings option;
      [@ocaml.doc "Settings in JSON format for the target Amazon Timestream endpoint.\n"]
  gcp_my_sql_settings : gcp_my_sql_settings option;
      [@ocaml.doc "Settings in JSON format for the source GCP MySQL endpoint.\n"]
  redis_settings : redis_settings option;
      [@ocaml.doc "Settings in JSON format for the target Redis endpoint.\n"]
  doc_db_settings : doc_db_settings option; [@ocaml.doc ""]
  resource_identifier : string_ option;
      [@ocaml.doc
        "A friendly name for the resource identifier at the end of the [EndpointArn] response \
         parameter that is returned in the created [Endpoint] object. The value for this parameter \
         can have up to 31 characters. It can contain only ASCII letters, digits, and hyphen \
         ('-'). Also, it can't end with a hyphen or contain two consecutive hyphens, and can only \
         begin with a letter, such as [Example-App-ARN1]. For example, this value might result in \
         the [EndpointArn] value [arn:aws:dms:eu-west-1:012345678901:rep:Example-App-ARN1]. If you \
         don't specify a [ResourceIdentifier] value, DMS generates a default identifier value for \
         the end of [EndpointArn].\n"]
  ibm_db2_settings : ibm_db2_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source IBM Db2 LUW endpoint. For information about other \
         available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.DB2.html#CHAP_Source.DB2.ConnectionAttrib}Extra \
         connection attributes when using Db2 LUW as a source for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  microsoft_sql_server_settings : microsoft_sql_server_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source and target Microsoft SQL Server endpoint. For \
         information about other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.SQLServer.html#CHAP_Source.SQLServer.ConnectionAttrib}Extra \
         connection attributes when using SQL Server as a source for DMS} and \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.SQLServer.html#CHAP_Target.SQLServer.ConnectionAttrib} \
         Extra connection attributes when using SQL Server as a target for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  sybase_settings : sybase_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source and target SAP ASE endpoint. For information about \
         other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.SAP.html#CHAP_Source.SAP.ConnectionAttrib}Extra \
         connection attributes when using SAP ASE as a source for DMS} and \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.SAP.html#CHAP_Target.SAP.ConnectionAttrib}Extra \
         connection attributes when using SAP ASE as a target for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  oracle_settings : oracle_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source and target Oracle endpoint. For information about \
         other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.Oracle.html#CHAP_Source.Oracle.ConnectionAttrib}Extra \
         connection attributes when using Oracle as a source for DMS} and \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Oracle.html#CHAP_Target.Oracle.ConnectionAttrib} \
         Extra connection attributes when using Oracle as a target for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  my_sql_settings : my_sql_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source and target MySQL endpoint. For information about \
         other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MySQL.html#CHAP_Source.MySQL.ConnectionAttrib}Extra \
         connection attributes when using MySQL as a source for DMS} and \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.MySQL.html#CHAP_Target.MySQL.ConnectionAttrib}Extra \
         connection attributes when using a MySQL-compatible database as a target for DMS} in the \
         {i Database Migration Service User Guide.} \n"]
  postgre_sql_settings : postgre_sql_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source and target PostgreSQL endpoint. For information \
         about other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html#CHAP_Source.PostgreSQL.ConnectionAttrib}Extra \
         connection attributes when using PostgreSQL as a source for DMS} and \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.PostgreSQL.html#CHAP_Target.PostgreSQL.ConnectionAttrib} \
         Extra connection attributes when using PostgreSQL as a target for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  redshift_settings : redshift_settings option; [@ocaml.doc ""]
  neptune_settings : neptune_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target Amazon Neptune endpoint. For more information \
         about the available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Neptune.html#CHAP_Target.Neptune.EndpointSettings}Specifying \
         graph-mapping rules using Gremlin and R2RML for Amazon Neptune as a target} in the {i \
         Database Migration Service User Guide.} \n"]
  elasticsearch_settings : elasticsearch_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target OpenSearch endpoint. For more information about \
         the available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Elasticsearch.html#CHAP_Target.Elasticsearch.Configuration}Extra \
         Connection Attributes When Using OpenSearch as a Target for DMS} in the {i Database \
         Migration Service User Guide}.\n"]
  kafka_settings : kafka_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target Apache Kafka endpoint. For more information about \
         the available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kafka.html#CHAP_Target.Kafka.ObjectMapping}Using \
         object mapping to migrate data to a Kafka topic} in the {i Database Migration Service \
         User Guide.} \n"]
  kinesis_settings : kinesis_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target endpoint for Amazon Kinesis Data Streams. For more \
         information about the available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html#CHAP_Target.Kinesis.ObjectMapping}Using \
         object mapping to migrate data to a Kinesis data stream} in the {i Database Migration \
         Service User Guide.} \n"]
  mongo_db_settings : mongo_db_settings option;
      [@ocaml.doc
        "Settings in JSON format for the source MongoDB endpoint. For more information about the \
         available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html#CHAP_Source.MongoDB.Configuration}Endpoint \
         configuration settings when using MongoDB as a source for Database Migration Service} in \
         the {i Database Migration Service User Guide.} \n"]
  dms_transfer_settings : dms_transfer_settings option;
      [@ocaml.doc
        "The settings in JSON format for the DMS transfer type of source endpoint. \n\n\
        \ Possible settings include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ServiceAccessRoleArn] - The Amazon Resource Name (ARN) used by the service \
         access IAM role. The role must allow the [iam:PassRole] action.\n\
        \            \n\
        \             }\n\
        \        {-   [BucketName] - The name of the S3 bucket to use.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Shorthand syntax for these settings is as follows: \
         [ServiceAccessRoleArn=string,BucketName=string] \n\
        \   \n\
        \    JSON syntax for these settings is as follows: [{ \"ServiceAccessRoleArn\": \"string\",\n\
        \            \"BucketName\": \"string\", } ] \n\
        \    "]
  s3_settings : s3_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target Amazon S3 endpoint. For more information about the \
         available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring}Extra \
         Connection Attributes When Using Amazon S3 as a Target for DMS} in the {i Database \
         Migration Service User Guide.} \n"]
  dynamo_db_settings : dynamo_db_settings option;
      [@ocaml.doc
        "Settings in JSON format for the target Amazon DynamoDB endpoint. For information about \
         other available settings, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.DynamoDB.html#CHAP_Target.DynamoDB.ObjectMapping}Using \
         Object Mapping to Migrate Data to DynamoDB} in the {i Database Migration Service User \
         Guide.} \n"]
  external_table_definition : string_ option; [@ocaml.doc "The external table definition. \n"]
  service_access_role_arn : string_ option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) for the service access role that you want to use to \
         create the endpoint. The role must allow the [iam:PassRole] action.\n"]
  ssl_mode : dms_ssl_mode_value option;
      [@ocaml.doc
        "The Secure Sockets Layer (SSL) mode to use for the SSL connection. The default is [none] \n"]
  certificate_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the certificate.\n"]
  tags : tag_list option; [@ocaml.doc "One or more tags to be assigned to the endpoint.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "An KMS key identifier that is used to encrypt the connection parameters for the endpoint.\n\n\
        \ If you don't specify a value for the [KmsKeyId] parameter, then DMS uses your default \
         encryption key.\n\
        \ \n\
        \  KMS creates the default encryption key for your Amazon Web Services account. Your \
         Amazon Web Services account has a different default encryption key for each Amazon Web \
         Services Region.\n\
        \  "]
  extra_connection_attributes : string_ option;
      [@ocaml.doc
        "Additional attributes associated with the connection. Each attribute is specified as a \
         name-value pair associated by an equal sign (=). Multiple attributes are separated by a \
         semicolon (;) with no additional white space. For information on the attributes available \
         for connecting your source or target endpoint, see \
         {{:https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Endpoints.html}Working with DMS \
         Endpoints} in the {i Database Migration Service User Guide.} \n"]
  database_name : string_ option;
      [@ocaml.doc
        "The name of the endpoint database. For a MySQL source or target endpoint, do not specify \
         DatabaseName. To migrate to a specific database, use this setting and [targetDbType].\n"]
  port : integer_optional option; [@ocaml.doc "The port used by the endpoint database.\n"]
  server_name : string_ option;
      [@ocaml.doc "The name of the server where the endpoint database resides.\n"]
  password : secret_string option;
      [@ocaml.doc "The password to be used to log in to the endpoint database.\n"]
  username : string_ option;
      [@ocaml.doc "The user name to be used to log in to the endpoint database.\n"]
  engine_name : string_;
      [@ocaml.doc
        "The type of engine for the endpoint. Valid values, depending on the [EndpointType] value, \
         include [\"mysql\"], [\"oracle\"], [\"postgres\"], [\"mariadb\"], [\"aurora\"], \
         [\"aurora-postgresql\"], [\"opensearch\"], [\"redshift\"], [\"s3\"], [\"db2\"], \
         [\"db2-zos\"], [\"azuredb\"], [\"sybase\"], [\"dynamodb\"], [\"mongodb\"], [\"kinesis\"], \
         [\"kafka\"], [\"elasticsearch\"], [\"docdb\"], [\"sqlserver\"], [\"neptune\"], \
         [\"babelfish\"], [redshift-serverless], [aurora-serverless], \
         [aurora-postgresql-serverless], [gcp-mysql], [azure-sql-managed-instance], [redis], \
         [dms-transfer].\n"]
  endpoint_type : replication_endpoint_type_value;
      [@ocaml.doc "The type of endpoint. Valid values are [source] and [target].\n"]
  endpoint_identifier : string_;
      [@ocaml.doc
        "The database endpoint identifier. Identifiers must begin with a letter and must contain \
         only ASCII letters, digits, and hyphens. They can't end with a hyphen, or contain two \
         consecutive hyphens.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_data_provider_response = {
  data_provider : data_provider option; [@ocaml.doc "The data provider that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_provider_message = {
  tags : tag_list option; [@ocaml.doc "One or more tags to be assigned to the data provider.\n"]
  settings : data_provider_settings;
      [@ocaml.doc "The settings in JSON format for a data provider.\n"]
  \#virtual : boolean_optional option;
      [@ocaml.doc "Indicates whether the data provider is virtual.\n"]
  engine : string_;
      [@ocaml.doc
        "The type of database engine for the data provider. Valid values include [\"aurora\"], \
         [\"aurora-postgresql\"], [\"mysql\"], [\"oracle\"], [\"postgres\"], [\"sqlserver\"], \
         [redshift], [mariadb], [mongodb], [db2], [db2-zos], [docdb], and [sybase]. A value of \
         [\"aurora\"] represents Amazon Aurora MySQL-Compatible Edition.\n"]
  description : string_ option; [@ocaml.doc "A user-friendly description of the data provider.\n"]
  data_provider_name : string_ option; [@ocaml.doc "A user-friendly name for the data provider.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_migration_response = {
  data_migration : data_migration option;
      [@ocaml.doc "Information about the created data migration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_migration_message = {
  selection_rules : secret_string option;
      [@ocaml.doc
        "An optional JSON string specifying what tables, views, and schemas to include or exclude \
         from the migration.\n"]
  tags : tag_list option; [@ocaml.doc "One or more tags to be assigned to the data migration.\n"]
  number_of_jobs : integer_optional option;
      [@ocaml.doc
        "The number of parallel jobs that trigger parallel threads to unload the tables from the \
         source, and then load them to the target.\n"]
  target_data_settings : target_data_settings option;
      [@ocaml.doc "Specifies information about the target data provider.\n"]
  source_data_settings : source_data_settings option;
      [@ocaml.doc "Specifies information about the source data provider.\n"]
  enable_cloudwatch_logs : boolean_optional option;
      [@ocaml.doc "Specifies whether to enable CloudWatch logs for the data migration.\n"]
  service_access_role_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the service access role that you want to use to create \
         the data migration.\n"]
  data_migration_type : migration_type_value;
      [@ocaml.doc
        "Specifies if the data migration is full-load only, change data capture (CDC) only, or \
         full-load and CDC.\n"]
  migration_project_identifier : string_; [@ocaml.doc "An identifier for the migration project.\n"]
  data_migration_name : string_ option;
      [@ocaml.doc
        "A user-friendly name for the data migration. Data migration names have the following \
         constraints:\n\n\
        \ {ul\n\
        \       {-  Must begin with a letter, and can only contain ASCII letters, digits, and \
         hyphens. \n\
        \           \n\
        \            }\n\
        \       {-  Can't end with a hyphen or contain two consecutive hyphens.\n\
        \           \n\
        \            }\n\
        \       {-  Length must be from 1 to 255 characters.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec cancel_replication_task_assessment_run_response = {
  replication_task_assessment_run : replication_task_assessment_run option;
      [@ocaml.doc "The [ReplicationTaskAssessmentRun] object for the canceled assessment run.\n"]
}
[@@ocaml.doc "\n"]

type nonrec cancel_replication_task_assessment_run_message = {
  replication_task_assessment_run_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the premigration assessment run to be canceled.\n"]
}
[@@ocaml.doc "\n"]

type nonrec cancel_metadata_model_creation_response = {
  request : schema_conversion_request option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec cancel_metadata_model_creation_message = {
  request_identifier : string_;
      [@ocaml.doc
        "The identifier for the metadata model creation operation to cancel. This operation was \
         initiated by [StartMetadataModelCreation].\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_metadata_model_conversion_response = {
  request : schema_conversion_request option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec cancel_metadata_model_conversion_message = {
  request_identifier : string_;
      [@ocaml.doc
        "The identifier for the metadata model conversion operation to cancel. This operation was \
         initiated by StartMetadataModelConversion.\n"]
  migration_project_identifier : migration_project_identifier;
      [@ocaml.doc "The migration project name or Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec batch_start_recommendations_error_entry = {
  code : string_ option;
      [@ocaml.doc
        "The code of an error that occurred during the analysis of the source database.\n"]
  message : string_ option; [@ocaml.doc "The information about the error.\n"]
  database_id : string_ option; [@ocaml.doc "The identifier of the source database.\n"]
}
[@@ocaml.doc
  "Provides information about the errors that occurred during the analysis of the source database.\n"]

type nonrec batch_start_recommendations_error_entry_list =
  batch_start_recommendations_error_entry list
[@@ocaml.doc ""]

type nonrec batch_start_recommendations_response = {
  error_entries : batch_start_recommendations_error_entry_list option;
      [@ocaml.doc "A list with error details about the analysis of each source database.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_start_recommendations_request = {
  data : start_recommendations_request_entry_list option;
      [@ocaml.doc
        "Provides information about source databases to analyze. After this analysis, Fleet \
         Advisor recommends target engines for each source database.\n"]
}
[@@ocaml.doc ""]

type nonrec apply_pending_maintenance_action_response = {
  resource_pending_maintenance_actions : resource_pending_maintenance_actions option;
      [@ocaml.doc "The DMS resource that the pending maintenance action will be applied to.\n"]
}
[@@ocaml.doc "\n"]

type nonrec apply_pending_maintenance_action_message = {
  opt_in_type : string_;
      [@ocaml.doc
        "A value that specifies the type of opt-in request, or undoes an opt-in request. You can't \
         undo an opt-in request of type [immediate].\n\n\
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
  apply_action : string_;
      [@ocaml.doc
        "The pending maintenance action to apply to this resource.\n\n\
        \ Valid values: [os-upgrade], [system-update], [db-upgrade], [os-patch] \n\
        \ "]
  replication_instance_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the DMS resource that the pending maintenance action \
         applies to.\n"]
}
[@@ocaml.doc "\n"]

type nonrec add_tags_to_resource_response = unit [@@ocaml.doc ""]

type nonrec add_tags_to_resource_message = {
  tags : tag_list; [@ocaml.doc "One or more tags to be assigned to the resource.\n"]
  resource_arn : string_;
      [@ocaml.doc
        "Identifies the DMS resource to which tags should be added. The value for this parameter \
         is an Amazon Resource Name (ARN).\n\n\
        \ For DMS, you can tag a replication instance, an endpoint, or a replication task.\n\
        \ "]
}
[@@ocaml.doc "Associates a set of tags with an DMS resource.\n"]
