type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "You do not have sufficient access to perform this action.\n"]

type nonrec allocated_storage = int [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The identifier for the Timestream for InfluxDB resource associated with the request.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The type of Timestream for InfluxDB resource associated with the request.\n"]
}
[@@ocaml.doc "The requested resource was not found or does not exist.\n"]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the tagged resource.\n"]
  tag_keys : tag_keys; [@ocaml.doc "The keys used to identify the tags.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The request exceeds the service quota.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec request_tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the tagged resource.\n"]
  tags : request_tag_map; [@ocaml.doc "A list of tags used to categorize and track resources.\n"]
}
[@@ocaml.doc ""]

type nonrec response_tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : response_tag_map option;
      [@ocaml.doc "A list of tags used to categorize and track resources.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the tagged resource.\n"]
}
[@@ocaml.doc ""]

type nonrec bucket = string [@@ocaml.doc ""]

type nonrec cluster_configuration = {
  ingest_query_instances : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of instances in the DbCluster which can both ingest and query.\n"]
  query_only_instances : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of instances in the DbCluster which can only query.\n"]
  dedicated_compactor : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates if the compactor instance is a standalone instance or not.\n"]
}
[@@ocaml.doc "Configuration for node modes in the DbCluster.\n"]

type nonrec cluster_deployment_type = MULTI_NODE_READ_REPLICAS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec cluster_status =
  | CREATING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | MAINTENANCE [@ocaml.doc ""]
  | UPDATING_INSTANCE_TYPE [@ocaml.doc ""]
  | REBOOTING [@ocaml.doc ""]
  | REBOOT_FAILED [@ocaml.doc ""]
  | PARTIALLY_AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec conflict_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The identifier for the Timestream for InfluxDB resource associated with the request.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The type of Timestream for InfluxDB resource associated with the request.\n"]
}
[@@ocaml.doc "The request conflicts with an existing resource in Timestream for InfluxDB.\n"]

type nonrec validation_exception_reason =
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  reason : validation_exception_reason; [@ocaml.doc "The reason that validation failed.\n"]
}
[@@ocaml.doc "The input fails to satisfy the constraints specified by Timestream for InfluxDB.\n"]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of seconds the caller should wait before retrying.\n"]
}
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request processing has failed because of an unknown error, exception or failure.\n"]

type nonrec db_cluster_id = string [@@ocaml.doc ""]

type nonrec create_db_cluster_output = {
  db_cluster_id : db_cluster_id option; [@ocaml.doc "A service-generated unique identifier.\n"]
  db_cluster_status : cluster_status option; [@ocaml.doc "The status of the DB cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec maintenance_window = string [@@ocaml.doc ""]

type nonrec iana_timezone = string [@@ocaml.doc ""]

type nonrec maintenance_schedule = {
  timezone : iana_timezone;
      [@ocaml.doc
        "The IANA timezone identifier for the maintenance window. Format: Region/City or UTC. For \
         example, America/New_York or UTC.\n"]
  preferred_maintenance_window : maintenance_window;
      [@ocaml.doc
        "The preferred maintenance window in the format ddd:HH:MM-ddd:HH:MM (UTC). Day must be one \
         of: Mon, Tue, Wed, Thu, Fri, Sat, Sun. For example, Sun:02:00-Sun:06:00. Provide an empty \
         string to let the system choose a window.\n"]
}
[@@ocaml.doc
  "Specifies the maintenance schedule for a DB instance or cluster, defining when maintenance \
   operations such as patching can be performed.\n"]

type nonrec s3_configuration = {
  bucket_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the S3 bucket to deliver logs to.\n"]
  enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc "Indicates whether log delivery to the S3 bucket is enabled.\n"]
}
[@@ocaml.doc "Configuration for S3 bucket log delivery.\n"]

type nonrec log_delivery_configuration = {
  s3_configuration : s3_configuration; [@ocaml.doc "Configuration for S3 bucket log delivery.\n"]
}
[@@ocaml.doc "Configuration for sending InfluxDB engine logs to send to specified S3 bucket.\n"]

type nonrec failover_mode = AUTOMATIC [@ocaml.doc ""] | NO_FAILOVER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec vpc_security_group_id = string [@@ocaml.doc ""]

type nonrec vpc_security_group_id_list = vpc_security_group_id list [@@ocaml.doc ""]

type nonrec vpc_subnet_id = string [@@ocaml.doc ""]

type nonrec vpc_subnet_id_list = vpc_subnet_id list [@@ocaml.doc ""]

type nonrec network_type = IPV4 [@ocaml.doc ""] | DUAL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec db_storage_type =
  | INFLUX_IO_INCLUDED_T1 [@ocaml.doc ""]
  | INFLUX_IO_INCLUDED_T2 [@ocaml.doc ""]
  | INFLUX_IO_INCLUDED_T3 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec db_instance_type =
  | DB_INFLUX_MEDIUM [@ocaml.doc ""]
  | DB_INFLUX_LARGE [@ocaml.doc ""]
  | DB_INFLUX_XLARGE [@ocaml.doc ""]
  | DB_INFLUX_2XLARGE [@ocaml.doc ""]
  | DB_INFLUX_4XLARGE [@ocaml.doc ""]
  | DB_INFLUX_8XLARGE [@ocaml.doc ""]
  | DB_INFLUX_12XLARGE [@ocaml.doc ""]
  | DB_INFLUX_16XLARGE [@ocaml.doc ""]
  | DB_INFLUX_24XLARGE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec db_parameter_group_identifier = string [@@ocaml.doc ""]

type nonrec port = int [@@ocaml.doc ""]

type nonrec organization = string [@@ocaml.doc ""]

type nonrec password = string [@@ocaml.doc ""]

type nonrec username = string [@@ocaml.doc ""]

type nonrec db_cluster_name = string [@@ocaml.doc ""]

type nonrec create_db_cluster_input = {
  name : db_cluster_name;
      [@ocaml.doc
        "The name that uniquely identifies the DB cluster when interacting with the Amazon \
         Timestream for InfluxDB API and CLI commands. This name will also be a prefix included in \
         the endpoint. DB cluster names must be unique per customer and per region.\n"]
  username : username option;
      [@ocaml.doc
        "The username of the initial admin user created in InfluxDB. Must start with a letter and \
         can't end with a hyphen or contain two consecutive hyphens. For example, my-user1. This \
         username will allow you to access the InfluxDB UI to perform various administrative tasks \
         and also use the InfluxDB CLI to create an operator token. These attributes will be \
         stored in a secret created in Secrets Manager in your account.\n"]
  password : password option;
      [@ocaml.doc
        "The password of the initial admin user created in InfluxDB. This password will allow you \
         to access the InfluxDB UI to perform various administrative tasks and also use the \
         InfluxDB CLI to create an operator token. These attributes will be stored in a secret \
         created in Secrets Manager in your account.\n"]
  organization : organization option;
      [@ocaml.doc
        "The name of the initial organization for the initial admin user in InfluxDB. An InfluxDB \
         organization is a workspace for a group of users.\n"]
  bucket : bucket option;
      [@ocaml.doc
        "The name of the initial InfluxDB bucket. All InfluxDB data is stored in a bucket. A \
         bucket combines the concept of a database and a retention period (the duration of time \
         that each data point persists). A bucket belongs to an organization.\n"]
  port : port option;
      [@ocaml.doc
        "The port number on which InfluxDB accepts connections.\n\n\
        \ Valid Values: 1024-65535\n\
        \ \n\
        \  Default: 8086 for InfluxDB v2, 8181 for InfluxDB v3\n\
        \  \n\
        \   Constraints: The value can't be 2375-2376, 7788-7799, 8090, or 51678-51680\n\
        \   "]
  db_parameter_group_identifier : db_parameter_group_identifier option;
      [@ocaml.doc
        "The ID of the DB parameter group to assign to your DB cluster. DB parameter groups \
         specify how the database is configured. For example, DB parameter groups can specify the \
         limit for query concurrency.\n"]
  db_instance_type : db_instance_type;
      [@ocaml.doc "The Timestream for InfluxDB DB instance type to run InfluxDB on.\n"]
  db_storage_type : db_storage_type option;
      [@ocaml.doc
        "The Timestream for InfluxDB DB storage type to read and write InfluxDB data.\n\n\
        \ You can choose between three different types of provisioned Influx IOPS Included storage \
         according to your workload requirements:\n\
        \ \n\
        \  {ul\n\
        \        {-  Influx I/O Included 3000 IOPS\n\
        \            \n\
        \             }\n\
        \        {-  Influx I/O Included 12000 IOPS\n\
        \            \n\
        \             }\n\
        \        {-  Influx I/O Included 16000 IOPS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  allocated_storage : allocated_storage option;
      [@ocaml.doc
        "The amount of storage to allocate for your DB storage type in GiB (gibibytes).\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies whether the network type of the Timestream for InfluxDB cluster is IPv4, which \
         can communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 \
         and IPv6 protocols.\n"]
  publicly_accessible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Configures the Timestream for InfluxDB cluster with a public IP to facilitate access from \
         outside the VPC.\n"]
  vpc_subnet_ids : vpc_subnet_id_list;
      [@ocaml.doc
        "A list of VPC subnet IDs to associate with the DB cluster. Provide at least two VPC \
         subnet IDs in different Availability Zones when deploying with a Multi-AZ standby.\n"]
  vpc_security_group_ids : vpc_security_group_id_list;
      [@ocaml.doc
        "A list of VPC security group IDs to associate with the Timestream for InfluxDB cluster.\n"]
  deployment_type : cluster_deployment_type option;
      [@ocaml.doc "Specifies the type of cluster to create.\n"]
  failover_mode : failover_mode option;
      [@ocaml.doc
        "Specifies the behavior of failure recovery when the primary node of the cluster fails.\n"]
  log_delivery_configuration : log_delivery_configuration option;
      [@ocaml.doc "Configuration for sending InfluxDB engine logs to a specified S3 bucket.\n"]
  maintenance_schedule : maintenance_schedule option;
      [@ocaml.doc
        "Specifies the maintenance schedule for the DB cluster, including the preferred \
         maintenance window and timezone.\n"]
  tags : request_tag_map option;
      [@ocaml.doc "A list of key-value pairs to associate with the DB instance.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_mode =
  | PRIMARY [@ocaml.doc ""]
  | STANDBY [@ocaml.doc ""]
  | REPLICA [@ocaml.doc ""]
  | INGEST [@ocaml.doc ""]
  | QUERY [@ocaml.doc ""]
  | COMPACT [@ocaml.doc ""]
  | PROCESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_mode_list = instance_mode list [@@ocaml.doc ""]

type nonrec deployment_type = SINGLE_AZ [@ocaml.doc ""] | WITH_MULTIAZ_STANDBY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec status =
  | CREATING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | MODIFYING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | UPDATING_DEPLOYMENT_TYPE [@ocaml.doc ""]
  | UPDATING_INSTANCE_TYPE [@ocaml.doc ""]
  | MAINTENANCE [@ocaml.doc ""]
  | REBOOTING [@ocaml.doc ""]
  | REBOOT_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec db_instance_name = string [@@ocaml.doc ""]

type nonrec db_instance_id = string [@@ocaml.doc ""]

type nonrec create_db_instance_output = {
  id : db_instance_id; [@ocaml.doc "A service-generated unique identifier.\n"]
  name : db_instance_name;
      [@ocaml.doc
        "The customer-supplied name that uniquely identifies the DB instance when interacting with \
         the Amazon Timestream for InfluxDB API and CLI commands.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB instance.\n"]
  status : status option; [@ocaml.doc "The status of the DB instance.\n"]
  endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.\n"]
  port : port option;
      [@ocaml.doc
        "The port number on which InfluxDB accepts connections. The default value is 8086.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which \
         can communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 \
         and IPv6 protocols.\n"]
  db_instance_type : db_instance_type option;
      [@ocaml.doc "The Timestream for InfluxDB instance type that InfluxDB runs on.\n"]
  db_storage_type : db_storage_type option;
      [@ocaml.doc "The Timestream for InfluxDB DB storage type that InfluxDB stores data on.\n"]
  allocated_storage : allocated_storage option;
      [@ocaml.doc "The amount of storage allocated for your DB storage type (in gibibytes).\n"]
  deployment_type : deployment_type option;
      [@ocaml.doc
        "Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or with a MultiAZ \
         Standby for High availability.\n"]
  vpc_subnet_ids : vpc_subnet_id_list;
      [@ocaml.doc "A list of VPC subnet IDs associated with the DB instance.\n"]
  publicly_accessible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates if the DB instance has a public IP to facilitate access.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of VPC security group IDs associated with the DB instance.\n"]
  db_parameter_group_identifier : db_parameter_group_identifier option;
      [@ocaml.doc "The id of the DB parameter group assigned to your DB instance.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Availability Zone in which the DB instance resides.\n"]
  secondary_availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Availability Zone in which the standby instance is located when deploying with a \
         MultiAZ standby instance.\n"]
  log_delivery_configuration : log_delivery_configuration option;
      [@ocaml.doc
        "Configuration for sending InfluxDB engine logs to send to specified S3 bucket.\n"]
  influx_auth_parameters_secret_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial \
         InfluxDB authorization parameters. The secret value is a JSON formatted key-value pair \
         holding InfluxDB authorization values: organization, bucket, username, and password.\n"]
  db_cluster_id : db_cluster_id option;
      [@ocaml.doc "Specifies the DbCluster to which this DbInstance belongs to.\n"]
  instance_mode : instance_mode option;
      [@ocaml.doc "Specifies the DbInstance's role in the cluster.\n"]
  instance_modes : instance_mode_list option;
      [@ocaml.doc "Specifies the DbInstance's roles in the cluster.\n"]
  maintenance_schedule : maintenance_schedule option;
      [@ocaml.doc "The maintenance schedule for the DB instance.\n"]
  last_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the last completed maintenance operation on the DB instance.\n"]
  next_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the next scheduled maintenance operation on the DB instance.\n"]
}
[@@ocaml.doc ""]

type nonrec create_db_instance_input = {
  name : db_instance_name;
      [@ocaml.doc
        "The name that uniquely identifies the DB instance when interacting with the Amazon \
         Timestream for InfluxDB API and CLI commands. This name will also be a prefix included in \
         the endpoint. DB instance names must be unique per customer and per region.\n"]
  username : username option;
      [@ocaml.doc
        "The username of the initial admin user created in InfluxDB. Must start with a letter and \
         can't end with a hyphen or contain two consecutive hyphens. For example, my-user1. This \
         username will allow you to access the InfluxDB UI to perform various administrative tasks \
         and also use the InfluxDB CLI to create an operator token. These attributes will be \
         stored in a Secret created in Amazon Secrets Manager in your account.\n"]
  password : password;
      [@ocaml.doc
        "The password of the initial admin user created in InfluxDB v2. This password will allow \
         you to access the InfluxDB UI to perform various administrative tasks and also use the \
         InfluxDB CLI to create an operator token. These attributes will be stored in a Secret \
         created in Secrets Manager in your account.\n"]
  organization : organization option;
      [@ocaml.doc
        "The name of the initial organization for the initial admin user in InfluxDB. An InfluxDB \
         organization is a workspace for a group of users.\n"]
  bucket : bucket option;
      [@ocaml.doc
        "The name of the initial InfluxDB bucket. All InfluxDB data is stored in a bucket. A \
         bucket combines the concept of a database and a retention period (the duration of time \
         that each data point persists). A bucket belongs to an organization.\n"]
  db_instance_type : db_instance_type;
      [@ocaml.doc "The Timestream for InfluxDB DB instance type to run InfluxDB on.\n"]
  vpc_subnet_ids : vpc_subnet_id_list;
      [@ocaml.doc
        "A list of VPC subnet IDs to associate with the DB instance. Provide at least two VPC \
         subnet IDs in different availability zones when deploying with a Multi-AZ standby.\n"]
  vpc_security_group_ids : vpc_security_group_id_list;
      [@ocaml.doc "A list of VPC security group IDs to associate with the DB instance.\n"]
  publicly_accessible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Configures the DB instance with a public IP to facilitate access.\n"]
  db_storage_type : db_storage_type option;
      [@ocaml.doc
        "The Timestream for InfluxDB DB storage type to read and write InfluxDB data.\n\n\
        \ You can choose between 3 different types of provisioned Influx IOPS included storage \
         according to your workloads requirements:\n\
        \ \n\
        \  {ul\n\
        \        {-  Influx IO Included 3000 IOPS\n\
        \            \n\
        \             }\n\
        \        {-  Influx IO Included 12000 IOPS\n\
        \            \n\
        \             }\n\
        \        {-  Influx IO Included 16000 IOPS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  allocated_storage : allocated_storage;
      [@ocaml.doc
        "The amount of storage to allocate for your DB storage type in GiB (gibibytes).\n"]
  db_parameter_group_identifier : db_parameter_group_identifier option;
      [@ocaml.doc
        "The id of the DB parameter group to assign to your DB instance. DB parameter groups \
         specify how the database is configured. For example, DB parameter groups can specify the \
         limit for query concurrency.\n"]
  deployment_type : deployment_type option;
      [@ocaml.doc
        "Specifies whether the DB instance will be deployed as a standalone instance or with a \
         Multi-AZ standby for high availability.\n"]
  log_delivery_configuration : log_delivery_configuration option;
      [@ocaml.doc "Configuration for sending InfluxDB engine logs to a specified S3 bucket.\n"]
  maintenance_schedule : maintenance_schedule option;
      [@ocaml.doc
        "Specifies the maintenance schedule for the DB instance, including the preferred \
         maintenance window and timezone.\n"]
  tags : request_tag_map option;
      [@ocaml.doc "A list of key-value pairs to associate with the DB instance.\n"]
  port : port option;
      [@ocaml.doc
        "The port number on which InfluxDB accepts connections.\n\n\
        \ Valid Values: 1024-65535\n\
        \ \n\
        \  Default: 8086\n\
        \  \n\
        \   Constraints: The value can't be 2375-2376, 7788-7799, 8090, or 51678-51680\n\
        \   "]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which \
         can communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 \
         and IPv6 protocols.\n"]
}
[@@ocaml.doc ""]

type nonrec duration_type =
  | HOURS [@ocaml.doc ""]
  | MINUTES [@ocaml.doc ""]
  | SECONDS [@ocaml.doc ""]
  | MILLISECONDS [@ocaml.doc ""]
  | DAYS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec duration = {
  duration_type : duration_type; [@ocaml.doc "The type of duration for InfluxDB parameters.\n"]
  value : Smaws_Lib.Smithy_api.Types.long;
      [@ocaml.doc "The value of duration for InfluxDB parameters.\n"]
}
[@@ocaml.doc "Duration for InfluxDB parameters in Timestream for InfluxDB.\n"]

type nonrec percent_or_absolute_long =
  | Percent of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc "Percent for InfluxDB parameters.\n"]
  | Absolute of Smaws_Lib.Smithy_api.Types.long
      [@ocaml.doc "Absolute long for InfluxDB parameters.\n"]
[@@ocaml.doc "Percent or Absolute Long for InfluxDB parameters\n"]

type nonrec data_fusion_runtime_type =
  | MULTI_THREAD [@ocaml.doc ""]
  | MULTI_THREAD_ALT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_formats = FULL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec influx_d_bv3_enterprise_parameters = {
  query_file_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Limits the number of Parquet files a query can access. If a query attempts to read more \
         than this limit, InfluxDB 3 returns an error.\n\n\
        \ Default: 432\n\
        \ "]
  query_log_size : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Defines the size of the query log. Up to this many queries remain in the log before older \
         queries are evicted to make room for new ones.\n\n\
        \ Default: 1000\n\
        \ "]
  log_filter : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Sets the filter directive for logs.\n"]
  log_format : log_formats option;
      [@ocaml.doc "Defines the message format for logs.\n\n Default: full\n "]
  data_fusion_num_threads : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "Sets the maximum number of DataFusion runtime threads to use.\n"]
  data_fusion_runtime_type : data_fusion_runtime_type option;
      [@ocaml.doc "Specifies the DataFusion tokio runtime type.\n\n Default: multi-thread\n "]
  data_fusion_runtime_disable_lifo_slot : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Disables the LIFO slot of the DataFusion runtime.\n"]
  data_fusion_runtime_event_interval : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Sets the number of scheduler ticks after which the scheduler of the DataFusion tokio \
         runtime polls for external events\226\128\147for example: timers, I/O.\n"]
  data_fusion_runtime_global_queue_interval : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Sets the number of scheduler ticks after which the scheduler of the DataFusion runtime \
         polls the global task queue.\n"]
  data_fusion_runtime_max_blocking_threads : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "Specifies the limit for additional threads spawned by the DataFusion runtime.\n"]
  data_fusion_runtime_max_io_events_per_tick : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Configures the maximum number of events processed per tick by the tokio DataFusion runtime.\n"]
  data_fusion_runtime_thread_keep_alive : duration option;
      [@ocaml.doc
        "Sets a custom timeout for a thread in the blocking pool of the tokio DataFusion runtime.\n"]
  data_fusion_runtime_thread_priority : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Sets the thread priority for tokio DataFusion runtime workers.\n\n Default: 10\n "]
  data_fusion_max_parquet_fanout : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "When multiple parquet files are required in a sorted way (deduplication for example), \
         specifies the maximum fanout.\n\n\
        \ Default: 1000\n\
        \ "]
  data_fusion_use_cached_parquet_loader : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Uses a cached parquet loader when reading parquet files from the object store.\n"]
  data_fusion_config : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Provides custom configuration to DataFusion as a comma-separated list of key:value pairs.\n"]
  max_http_request_size : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "Specifies the maximum size of HTTP requests.\n\n Default: 10485760\n "]
  force_snapshot_mem_threshold : percent_or_absolute_long option;
      [@ocaml.doc
        "Specifies the threshold for the internal memory buffer. Supports either a percentage \
         (portion of available memory) or absolute value in MB\226\128\147for example: 70% or 100\n\n\
        \ Default: 70%\n\
        \ "]
  wal_snapshot_size : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Defines the number of WAL files to attempt to remove in a snapshot. This, multiplied by \
         the interval, determines how often snapshots are taken.\n\n\
        \ Default: 600\n\
        \ "]
  wal_max_write_buffer_size : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Specifies the maximum number of write requests that can be buffered before a flush must \
         be executed and succeed.\n\n\
        \ Default: 100000\n\
        \ "]
  snapshotted_wal_files_to_keep : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Specifies the number of snapshotted WAL files to retain in the object store. Flushing the \
         WAL files does not clear the WAL files immediately; they are deleted when the number of \
         snapshotted WAL files exceeds this number.\n\n\
        \ Default: 300\n\
        \ "]
  preemptive_cache_age : duration option;
      [@ocaml.doc
        "Specifies the interval to prefetch into the Parquet cache during compaction.\n\n\
        \ Default: 3d\n\
        \ "]
  parquet_mem_cache_prune_percentage : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "Specifies the percentage of entries to prune during a prune operation on the in-memory \
         Parquet cache.\n\n\
        \ Default: 0.1\n\
        \ "]
  parquet_mem_cache_prune_interval : duration option;
      [@ocaml.doc
        "Sets the interval to check if the in-memory Parquet cache needs to be pruned.\n\n\
        \ Default: 1s\n\
        \ "]
  disable_parquet_mem_cache : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Disables the in-memory Parquet cache. By default, the cache is enabled.\n"]
  parquet_mem_cache_query_path_duration : duration option;
      [@ocaml.doc
        "Specifies the time window for caching recent Parquet files in memory.\n\n Default: 5h\n "]
  last_cache_eviction_interval : duration option;
      [@ocaml.doc
        "Specifies the interval to evict expired entries from the Last-N-Value cache, expressed as \
         a human-readable duration\226\128\147for example: 20s, 1m, 1h.\n\n\
        \ Default: 10s\n\
        \ "]
  distinct_cache_eviction_interval : duration option;
      [@ocaml.doc
        "Specifies the interval to evict expired entries from the distinct value cache, expressed \
         as a human-readable duration\226\128\147for example: 20s, 1m, 1h.\n\n\
        \ Default: 10s\n\
        \ "]
  gen1_duration : duration option;
      [@ocaml.doc
        "Specifies the duration that Parquet files are arranged into. Data timestamps land each \
         row into a file of this duration. Supported durations are 1m, 5m, and 10m. These files \
         are known as \226\128\156generation 1\226\128\157 files, which the compactor can merge \
         into larger generations.\n\n\
        \ Default: 10m\n\
        \ "]
  exec_mem_pool_bytes : percent_or_absolute_long option;
      [@ocaml.doc
        "Specifies the size of memory pool used during query execution. Can be given as absolute \
         value in bytes or as a percentage of the total available memory\226\128\147for example: \
         8000000000 or 10%.\n\n\
        \ Default: 20%\n\
        \ "]
  parquet_mem_cache_size : percent_or_absolute_long option;
      [@ocaml.doc
        "Specifies the size of the in-memory Parquet cache in megabytes or percentage of total \
         available memory.\n\n\
        \ Default: 20%\n\
        \ "]
  wal_replay_fail_on_error : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Determines whether WAL replay should fail when encountering errors.\n\n Default: false\n "]
  wal_replay_concurrency_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Concurrency limit during WAL replay. Setting this number too high can lead to OOM. The \
         default is dynamically determined.\n\n\
        \ Default: max(num_cpus, 10)\n\
        \ "]
  table_index_cache_max_entries : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Specifies the maximum number of entries in the table index cache.\n\n Default: 1000\n "]
  table_index_cache_concurrency_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Limits the concurrency level for table index cache operations.\n\n Default: 8\n "]
  gen1_lookback_duration : duration option;
      [@ocaml.doc
        "Specifies how far back to look when creating generation 1 Parquet files.\n\n\
        \ Default: 24h\n\
        \ "]
  retention_check_interval : duration option;
      [@ocaml.doc
        "The interval at which retention policies are checked and enforced. Enter as a \
         human-readable time\226\128\147for example: 30m or 1h.\n\n\
        \ Default: 30m\n\
        \ "]
  delete_grace_period : duration option;
      [@ocaml.doc
        "Specifies the grace period before permanently deleting data.\n\n Default: 24h\n "]
  hard_delete_default_duration : duration option;
      [@ocaml.doc "Sets the default duration for hard deletion of data.\n\n Default: 90d\n "]
  ingest_query_instances : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc
        "Specifies number of instances in the DbCluster which can both ingest and query.\n"]
  query_only_instances : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "Specifies number of instances in the DbCluster which can only query.\n"]
  dedicated_compactor : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc "Specifies if the compactor instance should be a standalone instance or not.\n"]
  compaction_row_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Specifies the soft limit for the number of rows per file that the compactor writes. The \
         compactor may write more rows than this limit.\n\n\
        \ Default: 1000000\n\
        \ "]
  compaction_max_num_files_per_plan : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Sets the maximum number of files included in any compaction plan.\n\n Default: 500\n "]
  compaction_gen2_duration : duration option;
      [@ocaml.doc
        "Specifies the duration of the first level of compaction (gen2). Later levels of \
         compaction are multiples of this duration. This value should be equal to or greater than \
         the gen1 duration.\n\n\
        \ Default: 20m\n\
        \ "]
  compaction_multipliers : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies a comma-separated list of multiples defining the duration of each level of \
         compaction. The number of elements in the list determines the number of compaction \
         levels. The first element specifies the duration of the first level (gen3); subsequent \
         levels are multiples of the previous level.\n\n\
        \ Default: 3,4,6,5\n\
        \ "]
  compaction_cleanup_wait : duration option;
      [@ocaml.doc
        "Specifies the amount of time that the compactor waits after finishing a compaction run to \
         delete files marked as needing deletion during that compaction run.\n\n\
        \ Default: 10m\n\
        \ "]
  compaction_check_interval : duration option;
      [@ocaml.doc
        "Specifies how often the compactor checks for new compaction work to perform.\n\n\
        \ Default: 10s\n\
        \ "]
  last_value_cache_disable_from_history : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Disables populating the last-N-value cache from historical data. If disabled, the cache \
         is still populated with data from the write-ahead log (WAL).\n"]
  distinct_value_cache_disable_from_history : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Disables populating the distinct value cache from historical data. If disabled, the cache \
         is still populated with data from the write-ahead log (WAL).\n"]
  replication_interval : duration option;
      [@ocaml.doc
        "Specifies the interval at which data replication occurs between cluster nodes.\n\n\
        \ Default: 250ms\n\
        \ "]
  catalog_sync_interval : duration option;
      [@ocaml.doc
        "Defines how often the catalog synchronizes across cluster nodes.\n\n Default: 10s\n "]
}
[@@ocaml.doc
  "All the customer-modifiable InfluxDB v3 Enterprise parameters in Timestream for InfluxDB.\n"]

type nonrec influx_d_bv3_core_parameters = {
  query_file_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Limits the number of Parquet files a query can access. If a query attempts to read more \
         than this limit, InfluxDB 3 returns an error.\n\n\
        \ Default: 432\n\
        \ "]
  query_log_size : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Defines the size of the query log. Up to this many queries remain in the log before older \
         queries are evicted to make room for new ones.\n\n\
        \ Default: 1000\n\
        \ "]
  log_filter : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Sets the filter directive for logs.\n"]
  log_format : log_formats option;
      [@ocaml.doc "Defines the message format for logs.\n\n Default: full\n "]
  data_fusion_num_threads : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "Sets the maximum number of DataFusion runtime threads to use.\n"]
  data_fusion_runtime_type : data_fusion_runtime_type option;
      [@ocaml.doc "Specifies the DataFusion tokio runtime type.\n\n Default: multi-thread\n "]
  data_fusion_runtime_disable_lifo_slot : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Disables the LIFO slot of the DataFusion runtime.\n"]
  data_fusion_runtime_event_interval : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Sets the number of scheduler ticks after which the scheduler of the DataFusion tokio \
         runtime polls for external events\226\128\147for example: timers, I/O.\n"]
  data_fusion_runtime_global_queue_interval : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Sets the number of scheduler ticks after which the scheduler of the DataFusion runtime \
         polls the global task queue.\n"]
  data_fusion_runtime_max_blocking_threads : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "Specifies the limit for additional threads spawned by the DataFusion runtime.\n"]
  data_fusion_runtime_max_io_events_per_tick : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Configures the maximum number of events processed per tick by the tokio DataFusion runtime.\n"]
  data_fusion_runtime_thread_keep_alive : duration option;
      [@ocaml.doc
        "Sets a custom timeout for a thread in the blocking pool of the tokio DataFusion runtime.\n"]
  data_fusion_runtime_thread_priority : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Sets the thread priority for tokio DataFusion runtime workers.\n\n Default: 10\n "]
  data_fusion_max_parquet_fanout : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "When multiple parquet files are required in a sorted way (deduplication for example), \
         specifies the maximum fanout.\n\n\
        \ Default: 1000\n\
        \ "]
  data_fusion_use_cached_parquet_loader : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Uses a cached parquet loader when reading parquet files from the object store.\n"]
  data_fusion_config : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Provides custom configuration to DataFusion as a comma-separated list of key:value pairs.\n"]
  max_http_request_size : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "Specifies the maximum size of HTTP requests.\n\n Default: 10485760\n "]
  force_snapshot_mem_threshold : percent_or_absolute_long option;
      [@ocaml.doc
        "Specifies the threshold for the internal memory buffer. Supports either a percentage \
         (portion of available memory) or absolute value in MB\226\128\147for example: 70% or 100\n\n\
        \ Default: 70%\n\
        \ "]
  wal_snapshot_size : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Defines the number of WAL files to attempt to remove in a snapshot. This, multiplied by \
         the interval, determines how often snapshots are taken.\n\n\
        \ Default: 600\n\
        \ "]
  wal_max_write_buffer_size : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Specifies the maximum number of write requests that can be buffered before a flush must \
         be executed and succeed.\n\n\
        \ Default: 100000\n\
        \ "]
  snapshotted_wal_files_to_keep : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Specifies the number of snapshotted WAL files to retain in the object store. Flushing the \
         WAL files does not clear the WAL files immediately; they are deleted when the number of \
         snapshotted WAL files exceeds this number.\n\n\
        \ Default: 300\n\
        \ "]
  preemptive_cache_age : duration option;
      [@ocaml.doc
        "Specifies the interval to prefetch into the Parquet cache during compaction.\n\n\
        \ Default: 3d\n\
        \ "]
  parquet_mem_cache_prune_percentage : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "Specifies the percentage of entries to prune during a prune operation on the in-memory \
         Parquet cache.\n\n\
        \ Default: 0.1\n\
        \ "]
  parquet_mem_cache_prune_interval : duration option;
      [@ocaml.doc
        "Sets the interval to check if the in-memory Parquet cache needs to be pruned.\n\n\
        \ Default: 1s\n\
        \ "]
  disable_parquet_mem_cache : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Disables the in-memory Parquet cache. By default, the cache is enabled.\n"]
  parquet_mem_cache_query_path_duration : duration option;
      [@ocaml.doc
        "Specifies the time window for caching recent Parquet files in memory.\n\n Default: 5h\n "]
  last_cache_eviction_interval : duration option;
      [@ocaml.doc
        "Specifies the interval to evict expired entries from the Last-N-Value cache, expressed as \
         a human-readable duration\226\128\147for example: 20s, 1m, 1h.\n\n\
        \ Default: 10s\n\
        \ "]
  distinct_cache_eviction_interval : duration option;
      [@ocaml.doc
        "Specifies the interval to evict expired entries from the distinct value cache, expressed \
         as a human-readable duration\226\128\147for example: 20s, 1m, 1h.\n\n\
        \ Default: 10s\n\
        \ "]
  gen1_duration : duration option;
      [@ocaml.doc
        "Specifies the duration that Parquet files are arranged into. Data timestamps land each \
         row into a file of this duration. Supported durations are 1m, 5m, and 10m. These files \
         are known as \226\128\156generation 1\226\128\157 files that the compactor in InfluxDB 3 \
         Enterprise can merge into larger generations.\n\n\
        \ Default: 10m\n\
        \ "]
  exec_mem_pool_bytes : percent_or_absolute_long option;
      [@ocaml.doc
        "Specifies the size of memory pool used during query execution. Can be given as absolute \
         value in bytes or as a percentage of the total available memory\226\128\147for example: \
         8000000000 or 10%.\n\n\
        \ Default: 20%\n\
        \ "]
  parquet_mem_cache_size : percent_or_absolute_long option;
      [@ocaml.doc
        "Specifies the size of the in-memory Parquet cache in megabytes or percentage of total \
         available memory.\n\n\
        \ Default: 20%\n\
        \ "]
  wal_replay_fail_on_error : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Determines whether WAL replay should fail when encountering errors.\n\n Default: false\n "]
  wal_replay_concurrency_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Concurrency limit during WAL replay. Setting this number too high can lead to OOM. The \
         default is dynamically determined.\n\n\
        \ Default: max(num_cpus, 10)\n\
        \ "]
  table_index_cache_max_entries : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Specifies the maximum number of entries in the table index cache.\n\n Default: 1000\n "]
  table_index_cache_concurrency_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Limits the concurrency level for table index cache operations.\n\n Default: 8\n "]
  gen1_lookback_duration : duration option;
      [@ocaml.doc
        "Specifies how far back to look when creating generation 1 Parquet files.\n\n\
        \ Default: 24h\n\
        \ "]
  retention_check_interval : duration option;
      [@ocaml.doc
        "The interval at which retention policies are checked and enforced. Enter as a \
         human-readable time\226\128\147for example: 30m or 1h.\n\n\
        \ Default: 30m\n\
        \ "]
  delete_grace_period : duration option;
      [@ocaml.doc
        "Specifies the grace period before permanently deleting data.\n\n Default: 24h\n "]
  hard_delete_default_duration : duration option;
      [@ocaml.doc "Sets the default duration for hard deletion of data.\n\n Default: 90d\n "]
}
[@@ocaml.doc
  "All the customer-modifiable InfluxDB v3 Core parameters in Timestream for InfluxDB.\n"]

type nonrec tracing_type = LOG [@ocaml.doc ""] | JAEGER [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_level = DEBUG [@ocaml.doc ""] | INFO [@ocaml.doc ""] | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec influx_d_bv2_parameters = {
  flux_log_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Include option to show detailed logs for Flux queries.\n\n Default: false\n "]
  log_level : log_level option;
      [@ocaml.doc
        "Log output level. InfluxDB outputs log entries with severity levels greater than or equal \
         to the level specified.\n\n\
        \ Default: info\n\
        \ "]
  no_tasks : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Disable the task scheduler. If problematic tasks prevent InfluxDB from starting, use this \
         option to start InfluxDB without scheduling or executing tasks.\n\n\
        \ Default: false\n\
        \ "]
  query_concurrency : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Number of queries allowed to execute concurrently. Setting to 0 allows an unlimited \
         number of concurrent queries.\n\n\
        \ Default: 0\n\
        \ "]
  query_queue_size : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Maximum number of queries allowed in execution queue. When queue limit is reached, new \
         queries are rejected. Setting to 0 allows an unlimited number of queries in the queue.\n\n\
        \ Default: 0\n\
        \ "]
  tracing_type : tracing_type option;
      [@ocaml.doc
        "Enable tracing in InfluxDB and specifies the tracing type. Tracing is disabled by default.\n"]
  metrics_disabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Disable the HTTP /metrics endpoint which exposes \
         {{:https://docs.influxdata.com/influxdb/v2/reference/internals/metrics/}internal InfluxDB \
         metrics}.\n\n\
        \ Default: false\n\
        \ "]
  http_idle_timeout : duration option;
      [@ocaml.doc
        "Maximum duration the server should keep established connections alive while waiting for \
         new requests. Set to 0 for no timeout.\n\n\
        \ Default: 3 minutes\n\
        \ "]
  http_read_header_timeout : duration option;
      [@ocaml.doc
        "Maximum duration the server should try to read HTTP headers for new requests. Set to 0 \
         for no timeout.\n\n\
        \ Default: 10 seconds\n\
        \ "]
  http_read_timeout : duration option;
      [@ocaml.doc
        "Maximum duration the server should try to read the entirety of new requests. Set to 0 for \
         no timeout.\n\n\
        \ Default: 0\n\
        \ "]
  http_write_timeout : duration option;
      [@ocaml.doc
        "Maximum duration the server should spend processing and responding to write requests. Set \
         to 0 for no timeout.\n\n\
        \ Default: 0\n\
        \ "]
  influxql_max_select_buckets : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "Maximum number of group by time buckets a SELECT statement can create. 0 allows an \
         unlimited number of buckets.\n\n\
        \ Default: 0\n\
        \ "]
  influxql_max_select_point : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "Maximum number of points a SELECT statement can process. 0 allows an unlimited number of \
         points. InfluxDB checks the point count every second (so queries exceeding the maximum \
         aren\226\128\153t immediately aborted).\n\n\
        \ Default: 0\n\
        \ "]
  influxql_max_select_series : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "Maximum number of series a SELECT statement can return. 0 allows an unlimited number of \
         series.\n\n\
        \ Default: 0\n\
        \ "]
  pprof_disabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Disable the /debug/pprof HTTP endpoint. This endpoint provides runtime profiling data and \
         can be helpful when debugging.\n\n\
        \ Default: true\n\
        \ "]
  query_initial_memory_bytes : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "Initial bytes of memory allocated for a query.\n\n Default: 0\n "]
  query_max_memory_bytes : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "Maximum number of queries allowed in execution queue. When queue limit is reached, new \
         queries are rejected. Setting to 0 allows an unlimited number of queries in the queue.\n\n\
        \ Default: 0\n\
        \ "]
  query_memory_bytes : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "Maximum bytes of memory allowed for a single query. Must be greater or equal to \
         queryInitialMemoryBytes.\n\n\
        \ Default: 0\n\
        \ "]
  session_length : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Specifies the Time to Live (TTL) in minutes for newly created user sessions.\n\n\
        \ Default: 60\n\
        \ "]
  session_renew_disabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Disables automatically extending a user\226\128\153s session TTL on each request. By \
         default, every request sets the session\226\128\153s expiration time to five minutes from \
         now. When disabled, sessions expire after the specified \
         {{:https://docs.influxdata.com/influxdb/v2/reference/config-options/#session-length}session \
         length} and the user is redirected to the login page, even if recently active.\n\n\
        \ Default: false\n\
        \ "]
  storage_cache_max_memory_size : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "Maximum size (in bytes) a shard\226\128\153s cache can reach before it starts rejecting \
         writes. Must be greater than storageCacheSnapShotMemorySize and lower than \
         instance\226\128\153s total memory capacity. We recommend setting it to below 15% of the \
         total memory capacity.\n\n\
        \ Default: 1073741824\n\
        \ "]
  storage_cache_snapshot_memory_size : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "Size (in bytes) at which the storage engine will snapshot the cache and write it to a TSM \
         file to make more memory available. Must not be greater than storageCacheMaxMemorySize.\n\n\
        \ Default: 26214400\n\
        \ "]
  storage_cache_snapshot_write_cold_duration : duration option;
      [@ocaml.doc
        "Duration at which the storage engine will snapshot the cache and write it to a new TSM \
         file if the shard hasn\226\128\153t received writes or deletes.\n\n\
        \ Default: 10 minutes\n\
        \ "]
  storage_compact_full_write_cold_duration : duration option;
      [@ocaml.doc
        "Duration at which the storage engine will compact all TSM files in a shard if it hasn't \
         received writes or deletes.\n\n\
        \ Default: 4 hours\n\
        \ "]
  storage_compact_throughput_burst : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "Rate limit (in bytes per second) that TSM compactions can write to disk.\n\n\
        \ Default: 50331648\n\
        \ "]
  storage_max_concurrent_compactions : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Maximum number of full and level compactions that can run concurrently. A value of 0 \
         results in 50% of runtime.GOMAXPROCS(0) used at runtime. Any number greater than zero \
         limits compactions to that value. This setting does not apply to cache snapshotting.\n\n\
        \ Default: 0\n\
        \ "]
  storage_max_index_log_file_size : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "Size (in bytes) at which an index write-ahead log (WAL) file will compact into an index \
         file. Lower sizes will cause log files to be compacted more quickly and result in lower \
         heap usage at the expense of write throughput.\n\n\
        \ Default: 1048576\n\
        \ "]
  storage_no_validate_field_size : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Skip field size validation on incoming write requests.\n\n Default: false\n "]
  storage_retention_check_interval : duration option;
      [@ocaml.doc
        "Interval of retention policy enforcement checks. Must be greater than 0.\n\n\
        \ Default: 30 minutes\n\
        \ "]
  storage_series_file_max_concurrent_snapshot_compactions :
    Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Maximum number of snapshot compactions that can run concurrently across all series \
         partitions in a database.\n\n\
        \ Default: 0\n\
        \ "]
  storage_series_id_set_cache_size : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc
        "Size of the internal cache used in the TSI index to store previously calculated series \
         results. Cached results are returned quickly rather than needing to be recalculated when \
         a subsequent query with the same tag key/value predicate is executed. Setting this value \
         to 0 will disable the cache and may decrease query performance.\n\n\
        \ Default: 100\n\
        \ "]
  storage_wal_max_concurrent_writes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Maximum number writes to the WAL directory to attempt at the same time. Setting this \
         value to 0 results in number of processing units available x2.\n\n\
        \ Default: 0\n\
        \ "]
  storage_wal_max_write_delay : duration option;
      [@ocaml.doc
        "Maximum amount of time a write request to the WAL directory will wait when the \
         {{:https://docs.influxdata.com/influxdb/v2/reference/config-options/#storage-wal-max-concurrent-writes}maximum \
         number of concurrent active writes to the WAL directory has been met}. Set to 0 to \
         disable the timeout.\n\n\
        \ Default: 10 minutes\n\
        \ "]
  ui_disabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Disable the InfluxDB user interface (UI). The UI is enabled by default.\n\n\
        \ Default: false\n\
        \ "]
}
[@@ocaml.doc "All the customer-modifiable InfluxDB v2 parameters in Timestream for InfluxDB.\n"]

type nonrec parameters =
  | InfluxDBv2 of influx_d_bv2_parameters
      [@ocaml.doc
        "All the customer-modifiable InfluxDB v2 parameters in Timestream for InfluxDB.\n"]
  | InfluxDBv3Core of influx_d_bv3_core_parameters
      [@ocaml.doc
        "All the customer-modifiable InfluxDB v3 Core parameters in Timestream for InfluxDB.\n"]
  | InfluxDBv3Enterprise of influx_d_bv3_enterprise_parameters
      [@ocaml.doc
        "All the customer-modifiable InfluxDB v3 Enterprise parameters in Timestream for InfluxDB.\n"]
[@@ocaml.doc "The parameters that comprise the parameter group.\n"]

type nonrec db_parameter_group_name = string [@@ocaml.doc ""]

type nonrec db_parameter_group_id = string [@@ocaml.doc ""]

type nonrec create_db_parameter_group_output = {
  id : db_parameter_group_id; [@ocaml.doc "A service-generated unique identifier.\n"]
  name : db_parameter_group_name;
      [@ocaml.doc
        "The customer-supplied name that uniquely identifies the DB parameter group when \
         interacting with the Amazon Timestream for InfluxDB API and CLI commands.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARM) of the DB parameter group.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description of the DB parameter group.\n"]
  parameters : parameters option;
      [@ocaml.doc "A list of the parameters that comprise the DB parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_db_parameter_group_input = {
  name : db_parameter_group_name;
      [@ocaml.doc
        "The name of the DB parameter group. The name must be unique per customer and per region.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the DB parameter group.\n"]
  parameters : parameters option;
      [@ocaml.doc "A list of the parameters that comprise the DB parameter group.\n"]
  tags : request_tag_map option;
      [@ocaml.doc "A list of key-value pairs to associate with the DB parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec db_cluster_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec engine_type =
  | INFLUXDB_V2 [@ocaml.doc ""]
  | INFLUXDB_V3_CORE [@ocaml.doc ""]
  | INFLUXDB_V3_ENTERPRISE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec db_cluster_summary = {
  id : db_cluster_id;
      [@ocaml.doc "Service-generated unique identifier of the DB cluster to retrieve.\n"]
  name : db_cluster_name;
      [@ocaml.doc "Customer supplied name of the Timestream for InfluxDB cluster.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB cluster.\n"]
  status : cluster_status option; [@ocaml.doc "The status of the DB cluster.\n"]
  endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The endpoint used to connect to the Timestream for InfluxDB cluster for write and read \
         operations.\n"]
  reader_endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The endpoint used to connect to the Timestream for InfluxDB cluster for read-only \
         operations.\n"]
  port : port option; [@ocaml.doc "The port number on which InfluxDB accepts connections.\n"]
  deployment_type : cluster_deployment_type option;
      [@ocaml.doc "Deployment type of the DB cluster\n"]
  db_instance_type : db_instance_type option;
      [@ocaml.doc "The Timestream for InfluxDB DB instance type that InfluxDB runs on.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies whether the network type of the Timestream for InfluxDB Cluster is IPv4, which \
         can communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 \
         and IPv6 protocols.\n"]
  db_storage_type : db_storage_type option;
      [@ocaml.doc "The Timestream for InfluxDB DB storage type that InfluxDB stores data on.\n"]
  allocated_storage : allocated_storage option;
      [@ocaml.doc "The amount of storage allocated for your DB storage type (in gibibytes).\n"]
  engine_type : engine_type option; [@ocaml.doc "The engine type of your DB cluster.\n"]
}
[@@ocaml.doc "Describes a summary of a Timestream for InfluxDB cluster.\n"]

type nonrec db_cluster_summary_list = db_cluster_summary list [@@ocaml.doc ""]

type nonrec db_instance_for_cluster_summary = {
  id : db_instance_id; [@ocaml.doc "The service-generated unique identifier of the DB instance.\n"]
  name : db_instance_name;
      [@ocaml.doc
        "A service-generated name for the DB instance based on the customer-supplied name for the \
         DB cluster.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB instance.\n"]
  status : status option; [@ocaml.doc "The status of the DB instance.\n"]
  endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.\n"]
  port : port option; [@ocaml.doc "The port number on which InfluxDB accepts connections.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies whether the network type of the Timestream for InfluxDB instance is IPv4, which \
         can communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 \
         and IPv6 protocols.\n"]
  db_instance_type : db_instance_type option;
      [@ocaml.doc "The Timestream for InfluxDB instance type to run InfluxDB on.\n"]
  db_storage_type : db_storage_type option; [@ocaml.doc "The storage type for your DB instance.\n"]
  allocated_storage : allocated_storage option;
      [@ocaml.doc "The amount of storage allocated for your DB storage type in GiB (gibibytes).\n"]
  deployment_type : deployment_type option;
      [@ocaml.doc "Specifies the deployment type if applicable.\n"]
  instance_mode : instance_mode option;
      [@ocaml.doc "Specifies the DB instance's role in the cluster.\n"]
  instance_modes : instance_mode_list option;
      [@ocaml.doc "Specifies the DB instance's roles in the cluster.\n"]
}
[@@ocaml.doc "Contains a summary of a DB instance belonging to a DB cluster.\n"]

type nonrec db_instance_for_cluster_summary_list = db_instance_for_cluster_summary list
[@@ocaml.doc ""]

type nonrec db_instance_id_list = db_instance_id list [@@ocaml.doc ""]

type nonrec db_instance_identifier = string [@@ocaml.doc ""]

type nonrec db_instance_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec db_instance_summary = {
  id : db_instance_id; [@ocaml.doc "The service-generated unique identifier of the DB instance.\n"]
  name : db_instance_name;
      [@ocaml.doc
        "This customer-supplied name uniquely identifies the DB instance when interacting with the \
         Amazon Timestream for InfluxDB API and CLI commands.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB instance.\n"]
  status : status option; [@ocaml.doc "The status of the DB instance.\n"]
  endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.\n"]
  port : port option; [@ocaml.doc "The port number on which InfluxDB accepts connections.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which \
         can communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 \
         and IPv6 protocols.\n"]
  db_instance_type : db_instance_type option;
      [@ocaml.doc "The Timestream for InfluxDB instance type to run InfluxDB on.\n"]
  db_storage_type : db_storage_type option; [@ocaml.doc "The storage type for your DB instance.\n"]
  allocated_storage : allocated_storage option;
      [@ocaml.doc "The amount of storage to allocate for your DbStorageType in GiB (gibibytes).\n"]
  deployment_type : deployment_type option;
      [@ocaml.doc "Single-Instance or with a MultiAZ Standby for High availability.\n"]
}
[@@ocaml.doc "Contains a summary of a DB instance.\n"]

type nonrec db_instance_summary_list = db_instance_summary list [@@ocaml.doc ""]

type nonrec db_parameter_group_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec db_parameter_group_summary = {
  id : db_parameter_group_id; [@ocaml.doc "A service-generated unique identifier.\n"]
  name : db_parameter_group_name;
      [@ocaml.doc "This customer-supplied name uniquely identifies the parameter group.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB parameter group.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the DB parameter group.\n"]
}
[@@ocaml.doc "Contains a summary of a DB parameter group.\n"]

type nonrec db_parameter_group_summary_list = db_parameter_group_summary list [@@ocaml.doc ""]

type nonrec delete_db_cluster_output = {
  db_cluster_status : cluster_status option; [@ocaml.doc "The status of the DB cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_db_cluster_input = {
  db_cluster_id : db_cluster_id;
      [@ocaml.doc "Service-generated unique identifier of the DB cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_db_instance_output = {
  id : db_instance_id; [@ocaml.doc "A service-generated unique identifier.\n"]
  name : db_instance_name;
      [@ocaml.doc
        "The customer-supplied name that uniquely identifies the DB instance when interacting with \
         the Amazon Timestream for InfluxDB API and CLI commands.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB instance.\n"]
  status : status option; [@ocaml.doc "The status of the DB instance.\n"]
  endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.\n"]
  port : port option; [@ocaml.doc "The port number on which InfluxDB accepts connections.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which \
         can communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 \
         and IPv6 protocols.\n"]
  db_instance_type : db_instance_type option;
      [@ocaml.doc "The Timestream for InfluxDB instance type that InfluxDB runs on.\n"]
  db_storage_type : db_storage_type option;
      [@ocaml.doc "The Timestream for InfluxDB DB storage type that InfluxDB stores data on.\n"]
  allocated_storage : allocated_storage option;
      [@ocaml.doc "The amount of storage allocated for your DB storage type (in gibibytes).\n"]
  deployment_type : deployment_type option;
      [@ocaml.doc
        "Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or with a MultiAZ \
         Standby for High availability.\n"]
  vpc_subnet_ids : vpc_subnet_id_list;
      [@ocaml.doc "A list of VPC subnet IDs associated with the DB instance.\n"]
  publicly_accessible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates if the DB instance has a public IP to facilitate access.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of VPC security group IDs associated with the DB instance.\n"]
  db_parameter_group_identifier : db_parameter_group_identifier option;
      [@ocaml.doc "The id of the DB parameter group assigned to your DB instance.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Availability Zone in which the DB instance resides.\n"]
  secondary_availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Availability Zone in which the standby instance is located when deploying with a \
         MultiAZ standby instance.\n"]
  log_delivery_configuration : log_delivery_configuration option;
      [@ocaml.doc
        "Configuration for sending InfluxDB engine logs to send to specified S3 bucket.\n"]
  influx_auth_parameters_secret_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial \
         InfluxDB authorization parameters. The secret value is a JSON formatted key-value pair \
         holding InfluxDB authorization values: organization, bucket, username, and password.\n"]
  db_cluster_id : db_cluster_id option;
      [@ocaml.doc "Specifies the DbCluster to which this DbInstance belongs to.\n"]
  instance_mode : instance_mode option;
      [@ocaml.doc "Specifies the DbInstance's role in the cluster.\n"]
  instance_modes : instance_mode_list option;
      [@ocaml.doc "Specifies the DbInstance's roles in the cluster.\n"]
  maintenance_schedule : maintenance_schedule option;
      [@ocaml.doc "The maintenance schedule for the DB instance.\n"]
  last_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the last completed maintenance operation on the DB instance.\n"]
  next_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the next scheduled maintenance operation on the DB instance.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_db_instance_input = {
  identifier : db_instance_identifier; [@ocaml.doc "The id of the DB instance.\n"]
}
[@@ocaml.doc ""]

type nonrec get_db_cluster_output = {
  id : db_cluster_id;
      [@ocaml.doc "Service-generated unique identifier of the DB cluster to retrieve.\n"]
  name : db_cluster_name;
      [@ocaml.doc "Customer-supplied name of the Timestream for InfluxDB cluster.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB cluster.\n"]
  status : cluster_status option; [@ocaml.doc "The status of the DB cluster.\n"]
  endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The endpoint used to connect to the Timestream for InfluxDB cluster for write and read \
         operations.\n"]
  reader_endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The endpoint used to connect to the Timestream for InfluxDB cluster for read-only \
         operations.\n"]
  port : port option; [@ocaml.doc "The port number on which InfluxDB accepts connections.\n"]
  deployment_type : cluster_deployment_type option;
      [@ocaml.doc "Deployment type of the DB cluster.\n"]
  db_instance_type : db_instance_type option;
      [@ocaml.doc "The Timestream for InfluxDB instance type that InfluxDB runs on.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies whether the network type of the Timestream for InfluxDB cluster is IPv4, which \
         can communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 \
         and IPv6 protocols.\n"]
  db_storage_type : db_storage_type option;
      [@ocaml.doc "The Timestream for InfluxDB DB storage type that InfluxDB stores data on.\n"]
  allocated_storage : allocated_storage option;
      [@ocaml.doc "The amount of storage allocated for your DB storage type (in gibibytes).\n"]
  engine_type : engine_type option; [@ocaml.doc "The engine type of your DB cluster.\n"]
  publicly_accessible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates if the DB cluster has a public IP to facilitate access from outside the VPC.\n"]
  db_parameter_group_identifier : db_parameter_group_identifier option;
      [@ocaml.doc "The ID of the DB parameter group assigned to your DB cluster.\n"]
  log_delivery_configuration : log_delivery_configuration option;
      [@ocaml.doc
        "Configuration for sending InfluxDB engine logs to send to specified S3 bucket.\n"]
  maintenance_schedule : maintenance_schedule option;
      [@ocaml.doc "The maintenance schedule for the DB cluster.\n"]
  last_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the last completed maintenance operation on the DB cluster.\n"]
  next_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the next scheduled maintenance operation on the DB cluster.\n"]
  influx_auth_parameters_secret_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial \
         InfluxDB authorization parameters. The secret value is a JSON formatted key-value pair \
         holding InfluxDB authorization values: organization, bucket, username, and password.\n"]
  vpc_subnet_ids : vpc_subnet_id_list option;
      [@ocaml.doc "A list of VPC subnet IDs associated with the DB cluster.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of VPC security group IDs associated with the DB cluster.\n"]
  failover_mode : failover_mode option;
      [@ocaml.doc "The configured failover mode for the DB cluster.\n"]
  cluster_configuration : cluster_configuration option;
      [@ocaml.doc "Configuration for node modes in the DbCluster.\n"]
}
[@@ocaml.doc ""]

type nonrec get_db_cluster_input = {
  db_cluster_id : db_cluster_id;
      [@ocaml.doc "Service-generated unique identifier of the DB cluster to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_db_instance_output = {
  id : db_instance_id; [@ocaml.doc "A service-generated unique identifier.\n"]
  name : db_instance_name;
      [@ocaml.doc
        "The customer-supplied name that uniquely identifies the DB instance when interacting with \
         the Amazon Timestream for InfluxDB API and CLI commands.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB instance.\n"]
  status : status option; [@ocaml.doc "The status of the DB instance.\n"]
  endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.\n"]
  port : port option; [@ocaml.doc "The port number on which InfluxDB accepts connections.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which \
         can communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 \
         and IPv6 protocols.\n"]
  db_instance_type : db_instance_type option;
      [@ocaml.doc "The Timestream for InfluxDB instance type that InfluxDB runs on.\n"]
  db_storage_type : db_storage_type option;
      [@ocaml.doc "The Timestream for InfluxDB DB storage type that InfluxDB stores data on.\n"]
  allocated_storage : allocated_storage option;
      [@ocaml.doc "The amount of storage allocated for your DB storage type (in gibibytes).\n"]
  deployment_type : deployment_type option;
      [@ocaml.doc
        "Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or with a MultiAZ \
         Standby for High availability.\n"]
  vpc_subnet_ids : vpc_subnet_id_list;
      [@ocaml.doc "A list of VPC subnet IDs associated with the DB instance.\n"]
  publicly_accessible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates if the DB instance has a public IP to facilitate access.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of VPC security group IDs associated with the DB instance.\n"]
  db_parameter_group_identifier : db_parameter_group_identifier option;
      [@ocaml.doc "The id of the DB parameter group assigned to your DB instance.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Availability Zone in which the DB instance resides.\n"]
  secondary_availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Availability Zone in which the standby instance is located when deploying with a \
         MultiAZ standby instance.\n"]
  log_delivery_configuration : log_delivery_configuration option;
      [@ocaml.doc
        "Configuration for sending InfluxDB engine logs to send to specified S3 bucket.\n"]
  influx_auth_parameters_secret_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial \
         InfluxDB authorization parameters. The secret value is a JSON formatted key-value pair \
         holding InfluxDB authorization values: organization, bucket, username, and password.\n"]
  db_cluster_id : db_cluster_id option;
      [@ocaml.doc "Specifies the DbCluster to which this DbInstance belongs to.\n"]
  instance_mode : instance_mode option;
      [@ocaml.doc "Specifies the DbInstance's role in the cluster.\n"]
  instance_modes : instance_mode_list option;
      [@ocaml.doc "Specifies the DbInstance's roles in the cluster.\n"]
  maintenance_schedule : maintenance_schedule option;
      [@ocaml.doc "The maintenance schedule for the DB instance.\n"]
  last_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the last completed maintenance operation on the DB instance.\n"]
  next_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the next scheduled maintenance operation on the DB instance.\n"]
}
[@@ocaml.doc ""]

type nonrec get_db_instance_input = {
  identifier : db_instance_identifier; [@ocaml.doc "The id of the DB instance.\n"]
}
[@@ocaml.doc ""]

type nonrec get_db_parameter_group_output = {
  id : db_parameter_group_id; [@ocaml.doc "A service-generated unique identifier.\n"]
  name : db_parameter_group_name;
      [@ocaml.doc
        "The customer-supplied name that uniquely identifies the DB parameter group when \
         interacting with the Amazon Timestream for InfluxDB API and CLI commands.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB parameter group.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the DB parameter group.\n"]
  parameters : parameters option;
      [@ocaml.doc "The parameters that comprise the DB parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec get_db_parameter_group_input = {
  identifier : db_parameter_group_identifier; [@ocaml.doc "The id of the DB parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_db_clusters_output = {
  items : db_cluster_summary_list;
      [@ocaml.doc "A list of Timestream for InfluxDB cluster summaries.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Token from a previous call of the operation. When this value is provided, the service \
         returns results from where the previous response left off.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_db_clusters_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The pagination token. To resume pagination, provide the nextToken value as an argument of \
         a subsequent API invocation.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the output. If the total number of items \
         available is more than the value specified, a nextToken is provided in the output. To \
         resume pagination, provide the nextToken value as an argument of a subsequent API \
         invocation.\n"]
}
[@@ocaml.doc ""]

type nonrec list_db_instances_output = {
  items : db_instance_summary_list;
      [@ocaml.doc "A list of Timestream for InfluxDB DB instance summaries.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Token from a previous call of the operation. When this value is provided, the service \
         returns results from where the previous response left off.\n"]
}
[@@ocaml.doc ""]

type nonrec list_db_instances_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The pagination token. To resume pagination, provide the NextToken value as argument of a \
         subsequent API invocation.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the output. If the total number of items \
         available is more than the value specified, a NextToken is provided in the output. To \
         resume pagination, provide the NextToken value as argument of a subsequent API invocation.\n"]
}
[@@ocaml.doc ""]

type nonrec list_db_instances_for_cluster_output = {
  items : db_instance_for_cluster_summary_list;
      [@ocaml.doc
        "A list of Timestream for InfluxDB instance summaries belonging to the cluster.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Token from a previous call of the operation. When this value is provided, the service \
         returns results from where the previous response left off.\n"]
}
[@@ocaml.doc ""]

type nonrec list_db_instances_for_cluster_input = {
  db_cluster_id : db_cluster_id;
      [@ocaml.doc "Service-generated unique identifier of the DB cluster.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The pagination token. To resume pagination, provide the nextToken value as an argument of \
         a subsequent API invocation.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the output. If the total number of items \
         available is more than the value specified, a nextToken is provided in the output. To \
         resume pagination, provide the nextToken value as an argument of a subsequent API \
         invocation.\n"]
}
[@@ocaml.doc ""]

type nonrec list_db_parameter_groups_output = {
  items : db_parameter_group_summary_list;
      [@ocaml.doc "A list of Timestream for InfluxDB DB parameter group summaries.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Token from a previous call of the operation. When this value is provided, the service \
         returns results from where the previous response left off.\n"]
}
[@@ocaml.doc ""]

type nonrec list_db_parameter_groups_input = {
  next_token : next_token option;
      [@ocaml.doc
        "The pagination token. To resume pagination, provide the NextToken value as argument of a \
         subsequent API invocation.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the output. If the total number of items \
         available is more than the value specified, a NextToken is provided in the output. To \
         resume pagination, provide the NextToken value as argument of a subsequent API invocation.\n"]
}
[@@ocaml.doc ""]

type nonrec reboot_db_cluster_output = {
  db_cluster_status : cluster_status option; [@ocaml.doc "The status of the DB Cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec reboot_db_cluster_input = {
  db_cluster_id : db_cluster_id;
      [@ocaml.doc "Service-generated unique identifier of the DB cluster to reboot.\n"]
  instance_ids : db_instance_id_list option;
      [@ocaml.doc
        "A list of service-generated unique DB Instance Ids belonging to the DB Cluster to reboot.\n"]
}
[@@ocaml.doc ""]

type nonrec reboot_db_instance_output = {
  id : db_instance_id; [@ocaml.doc "A service-generated unique identifier.\n"]
  name : db_instance_name;
      [@ocaml.doc
        "The customer-supplied name that uniquely identifies the DB instance when interacting with \
         the Amazon Timestream for InfluxDB API and CLI commands.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB instance.\n"]
  status : status option; [@ocaml.doc "The status of the DB instance.\n"]
  endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.\n"]
  port : port option; [@ocaml.doc "The port number on which InfluxDB accepts connections.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which \
         can communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 \
         and IPv6 protocols.\n"]
  db_instance_type : db_instance_type option;
      [@ocaml.doc "The Timestream for InfluxDB instance type that InfluxDB runs on.\n"]
  db_storage_type : db_storage_type option;
      [@ocaml.doc "The Timestream for InfluxDB DB storage type that InfluxDB stores data on.\n"]
  allocated_storage : allocated_storage option;
      [@ocaml.doc "The amount of storage allocated for your DB storage type (in gibibytes).\n"]
  deployment_type : deployment_type option;
      [@ocaml.doc
        "Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or with a MultiAZ \
         Standby for High availability.\n"]
  vpc_subnet_ids : vpc_subnet_id_list;
      [@ocaml.doc "A list of VPC subnet IDs associated with the DB instance.\n"]
  publicly_accessible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates if the DB instance has a public IP to facilitate access.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of VPC security group IDs associated with the DB instance.\n"]
  db_parameter_group_identifier : db_parameter_group_identifier option;
      [@ocaml.doc "The id of the DB parameter group assigned to your DB instance.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Availability Zone in which the DB instance resides.\n"]
  secondary_availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Availability Zone in which the standby instance is located when deploying with a \
         MultiAZ standby instance.\n"]
  log_delivery_configuration : log_delivery_configuration option;
      [@ocaml.doc
        "Configuration for sending InfluxDB engine logs to send to specified S3 bucket.\n"]
  influx_auth_parameters_secret_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial \
         InfluxDB authorization parameters. The secret value is a JSON formatted key-value pair \
         holding InfluxDB authorization values: organization, bucket, username, and password.\n"]
  db_cluster_id : db_cluster_id option;
      [@ocaml.doc "Specifies the DbCluster to which this DbInstance belongs to.\n"]
  instance_mode : instance_mode option;
      [@ocaml.doc "Specifies the DbInstance's role in the cluster.\n"]
  instance_modes : instance_mode_list option;
      [@ocaml.doc "Specifies the DbInstance's roles in the cluster.\n"]
  maintenance_schedule : maintenance_schedule option;
      [@ocaml.doc "The maintenance schedule for the DB instance.\n"]
  last_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the last completed maintenance operation on the DB instance.\n"]
  next_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the next scheduled maintenance operation on the DB instance.\n"]
}
[@@ocaml.doc ""]

type nonrec reboot_db_instance_input = {
  identifier : db_instance_identifier; [@ocaml.doc "The id of the DB instance to reboot.\n"]
}
[@@ocaml.doc ""]

type nonrec update_db_cluster_output = {
  db_cluster_status : cluster_status option; [@ocaml.doc "The status of the DB cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec update_db_cluster_input = {
  db_cluster_id : db_cluster_id;
      [@ocaml.doc "Service-generated unique identifier of the DB cluster to update.\n"]
  log_delivery_configuration : log_delivery_configuration option;
      [@ocaml.doc "The log delivery configuration to apply to the DB cluster.\n"]
  db_parameter_group_identifier : db_parameter_group_identifier option;
      [@ocaml.doc "Update the DB cluster to use the specified DB parameter group.\n"]
  port : port option; [@ocaml.doc "Update the DB cluster to use the specified port.\n"]
  db_instance_type : db_instance_type option;
      [@ocaml.doc "Update the DB cluster to use the specified DB instance Type.\n"]
  failover_mode : failover_mode option; [@ocaml.doc "Update the DB cluster's failover behavior.\n"]
  maintenance_schedule : maintenance_schedule option;
      [@ocaml.doc
        "Specifies the maintenance schedule for the DB cluster, including the preferred \
         maintenance window and timezone.\n"]
}
[@@ocaml.doc ""]

type nonrec update_db_instance_output = {
  id : db_instance_id; [@ocaml.doc "A service-generated unique identifier.\n"]
  name : db_instance_name;
      [@ocaml.doc
        "This customer-supplied name uniquely identifies the DB instance when interacting with the \
         Amazon Timestream for InfluxDB API and CLI commands.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB instance.\n"]
  status : status option; [@ocaml.doc "The status of the DB instance.\n"]
  endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.\n"]
  port : port option; [@ocaml.doc "The port number on which InfluxDB accepts connections.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which \
         can communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 \
         and IPv6 protocols.\n"]
  db_instance_type : db_instance_type option;
      [@ocaml.doc "The Timestream for InfluxDB instance type that InfluxDB runs on.\n"]
  db_storage_type : db_storage_type option;
      [@ocaml.doc "The Timestream for InfluxDB DB storage type that InfluxDB stores data on.\n"]
  allocated_storage : allocated_storage option;
      [@ocaml.doc "The amount of storage allocated for your DB storage type (in gibibytes).\n"]
  deployment_type : deployment_type option;
      [@ocaml.doc
        "Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or with a MultiAZ \
         Standby for High availability.\n"]
  vpc_subnet_ids : vpc_subnet_id_list;
      [@ocaml.doc "A list of VPC subnet IDs associated with the DB instance.\n"]
  publicly_accessible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates if the DB instance has a public IP to facilitate access.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc "A list of VPC security group IDs associated with the DB instance.\n"]
  db_parameter_group_identifier : db_parameter_group_identifier option;
      [@ocaml.doc "The id of the DB parameter group assigned to your DB instance.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Availability Zone in which the DB instance resides.\n"]
  secondary_availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Availability Zone in which the standby instance is located when deploying with a \
         MultiAZ standby instance.\n"]
  log_delivery_configuration : log_delivery_configuration option;
      [@ocaml.doc
        "Configuration for sending InfluxDB engine logs to send to specified S3 bucket.\n"]
  influx_auth_parameters_secret_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial \
         InfluxDB authorization parameters. The secret value is a JSON formatted key-value pair \
         holding InfluxDB authorization values: organization, bucket, username, and password.\n"]
  db_cluster_id : db_cluster_id option;
      [@ocaml.doc "Specifies the DbCluster to which this DbInstance belongs to.\n"]
  instance_mode : instance_mode option;
      [@ocaml.doc "Specifies the DbInstance's role in the cluster.\n"]
  instance_modes : instance_mode_list option;
      [@ocaml.doc "Specifies the DbInstance's roles in the cluster.\n"]
  maintenance_schedule : maintenance_schedule option;
      [@ocaml.doc "The maintenance schedule for the DB instance.\n"]
  last_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the last completed maintenance operation on the DB instance.\n"]
  next_maintenance_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of the next scheduled maintenance operation on the DB instance.\n"]
}
[@@ocaml.doc ""]

type nonrec update_db_instance_input = {
  identifier : db_instance_identifier; [@ocaml.doc "The id of the DB instance.\n"]
  log_delivery_configuration : log_delivery_configuration option;
      [@ocaml.doc
        "Configuration for sending InfluxDB engine logs to send to specified S3 bucket.\n"]
  db_parameter_group_identifier : db_parameter_group_identifier option;
      [@ocaml.doc
        "The id of the DB parameter group to assign to your DB instance. DB parameter groups \
         specify how the database is configured. For example, DB parameter groups can specify the \
         limit for query concurrency.\n"]
  port : port option;
      [@ocaml.doc
        "The port number on which InfluxDB accepts connections.\n\n\
        \ If you change the Port value, your database restarts immediately.\n\
        \ \n\
        \  Valid Values: 1024-65535\n\
        \  \n\
        \   Default: 8086\n\
        \   \n\
        \    Constraints: The value can't be 2375-2376, 7788-7799, 8090, or 51678-51680\n\
        \    "]
  db_instance_type : db_instance_type option;
      [@ocaml.doc "The Timestream for InfluxDB DB instance type to run InfluxDB on.\n"]
  deployment_type : deployment_type option;
      [@ocaml.doc
        "Specifies whether the DB instance will be deployed as a standalone instance or with a \
         Multi-AZ standby for high availability.\n"]
  db_storage_type : db_storage_type option;
      [@ocaml.doc "The Timestream for InfluxDB DB storage type that InfluxDB stores data on.\n"]
  allocated_storage : allocated_storage option;
      [@ocaml.doc "The amount of storage to allocate for your DB storage type (in gibibytes).\n"]
  maintenance_schedule : maintenance_schedule option;
      [@ocaml.doc
        "Specifies the maintenance schedule for the DB instance, including the preferred \
         maintenance window and timezone.\n"]
}
[@@ocaml.doc ""]
