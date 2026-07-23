type nonrec s3_acl_option = BUCKET_OWNER_FULL_CONTROL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec acl_configuration = {
  s3_acl_option : s3_acl_option;
      [@ocaml.doc
        "The Amazon S3 canned ACL that Athena should specify when storing query results, including \
         data files inserted by Athena as the result of statements like CTAS or INSERT INTO. \
         Currently the only supported canned ACL is [BUCKET_OWNER_FULL_CONTROL]. If a query runs \
         in a workgroup and the workgroup overrides client-side settings, then the Amazon S3 \
         canned ACL specified in the workgroup's settings is used for all queries that run in the \
         workgroup. For more information about Amazon S3 canned ACLs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html#canned-acl}Canned \
         ACL} in the {i Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc
  "Indicates that an Amazon S3 canned ACL should be set to control ownership of stored query \
   results, including data files inserted by Athena as the result of statements like CTAS or \
   INSERT INTO. When Athena stores query results in Amazon S3, the canned ACL is set with the \
   [x-amz-acl] request header. For more information about S3 Object Ownership, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html#object-ownership-overview}Object \
   Ownership settings} in the {i Amazon S3 User Guide}.\n"]

type nonrec age = int [@@ocaml.doc ""]

type nonrec allocated_dpus_integer = int [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec invalid_request_exception = {
  athena_error_code : error_code option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that something is wrong with the input to the request. For example, a required \
   parameter may be missing or out of range.\n"]

type nonrec internal_server_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Indicates a platform issue, which may be due to a transient condition or outage.\n"]

type nonrec update_work_group_output = unit [@@ocaml.doc ""]

type nonrec work_group_state = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec parameters_map_value = string [@@ocaml.doc ""]

type nonrec key_string = string [@@ocaml.doc ""]

type nonrec parameters_map = (key_string * parameters_map_value) list [@@ocaml.doc ""]

type nonrec name_string = string [@@ocaml.doc ""]

type nonrec classification = {
  name : name_string option; [@ocaml.doc "The name of the configuration classification.\n"]
  properties : parameters_map option;
      [@ocaml.doc "A set of properties specified within a configuration classification.\n"]
}
[@@ocaml.doc "A classification refers to a set of specific configurations.\n"]

type nonrec classification_list = classification list [@@ocaml.doc ""]

type nonrec default_executor_dpu_size = int [@@ocaml.doc ""]

type nonrec max_concurrent_dpus = int [@@ocaml.doc ""]

type nonrec coordinator_dpu_size = int [@@ocaml.doc ""]

type nonrec engine_configuration = {
  coordinator_dpu_size : coordinator_dpu_size option;
      [@ocaml.doc
        "The number of DPUs to use for the coordinator. A coordinator is a special executor that \
         orchestrates processing work and manages other executors in a notebook session. The \
         default is 1.\n"]
  max_concurrent_dpus : max_concurrent_dpus option;
      [@ocaml.doc "The maximum number of DPUs that can run concurrently.\n"]
  default_executor_dpu_size : default_executor_dpu_size option;
      [@ocaml.doc
        "The default number of DPUs to use for executors. An executor is the smallest unit of \
         compute that a notebook session can request from Athena. The default is 1.\n"]
  additional_configs : parameters_map option;
      [@ocaml.doc
        "Contains additional notebook engine \n\
         {[\n\
         MAP\n\
         ]}\n\
        \ parameter mappings in the form of key-value pairs. To specify an Athena notebook that \
         the Jupyter server will download and serve, specify a value for the \
         [StartSessionRequest$NotebookVersion] field, and then add a key named [NotebookId] to \
         [AdditionalConfigs] that has the value of the Athena notebook ID.\n"]
  spark_properties : parameters_map option;
      [@ocaml.doc
        "Specifies custom jar files and Spark properties for use cases like cluster encryption, \
         table formats, and general Spark tuning.\n"]
  classifications : classification_list option;
      [@ocaml.doc "The configuration classifications that can be specified for the engine.\n"]
}
[@@ocaml.doc
  "The engine configuration for the workgroup, which includes the minimum/maximum number of Data \
   Processing Units (DPU) that queries should use when running in provisioned capacity. If not \
   specified, Athena uses default values (Default value for min is 4 and for max is Minimum of 124 \
   and allocated DPUs).\n\n\
  \ To specify DPU values for PC queries the WG containing EngineConfiguration should have the \
   following values: The name of the Classifications should be [athena-query-engine-properties], \
   with the only allowed properties as [max-dpu-count] and [min-dpu-count].\n\
  \ "]

type nonrec s3_output_location = string [@@ocaml.doc ""]

type nonrec kms_key = string [@@ocaml.doc ""]

type nonrec boxed_boolean = bool [@@ocaml.doc ""]

type nonrec s3_logging_configuration = {
  enabled : boxed_boolean; [@ocaml.doc "Enables S3 log delivery.\n"]
  kms_key : kms_key option;
      [@ocaml.doc
        "The KMS key ARN to encrypt the logs published to the given Amazon S3 destination.\n"]
  log_location : s3_output_location option;
      [@ocaml.doc "The Amazon S3 destination URI for log publishing.\n"]
}
[@@ocaml.doc "Configuration settings for delivering logs to Amazon S3 buckets.\n"]

type nonrec managed_logging_configuration = {
  enabled : boxed_boolean; [@ocaml.doc "Enables mamanged log persistence.\n"]
  kms_key : kms_key option;
      [@ocaml.doc "The KMS key ARN to encrypt the logs stored in managed log persistence.\n"]
}
[@@ocaml.doc "Configuration settings for delivering logs to Amazon S3 buckets.\n"]

type nonrec log_type_value = string [@@ocaml.doc ""]

type nonrec log_type_values_list = log_type_value list [@@ocaml.doc ""]

type nonrec log_type_key = string [@@ocaml.doc ""]

type nonrec log_types_map = (log_type_key * log_type_values_list) list [@@ocaml.doc ""]

type nonrec log_stream_name_prefix = string [@@ocaml.doc ""]

type nonrec log_group_name = string [@@ocaml.doc ""]

type nonrec cloud_watch_logging_configuration = {
  enabled : boxed_boolean; [@ocaml.doc "Enables CloudWatch logging.\n"]
  log_group : log_group_name option;
      [@ocaml.doc
        "The name of the log group in Amazon CloudWatch Logs where you want to publish your logs.\n"]
  log_stream_name_prefix : log_stream_name_prefix option;
      [@ocaml.doc "Prefix for the CloudWatch log stream name.\n"]
  log_types : log_types_map option;
      [@ocaml.doc "The types of logs that you want to publish to CloudWatch.\n"]
}
[@@ocaml.doc "Configuration settings for delivering logs to Amazon CloudWatch log groups.\n"]

type nonrec monitoring_configuration = {
  cloud_watch_logging_configuration : cloud_watch_logging_configuration option;
      [@ocaml.doc "Configuration settings for delivering logs to Amazon CloudWatch log groups. \n"]
  managed_logging_configuration : managed_logging_configuration option;
      [@ocaml.doc "Configuration settings for managed log persistence. \n"]
  s3_logging_configuration : s3_logging_configuration option;
      [@ocaml.doc "Configuration settings for delivering logs to Amazon S3 buckets. \n"]
}
[@@ocaml.doc
  "Contains the configuration settings for managed log persistence, delivering logs to Amazon S3 \
   buckets, Amazon CloudWatch log groups etc.\n"]

type nonrec authentication_type = DIRECTORY_IDENTITY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec query_results_s3_access_grants_configuration = {
  enable_s3_access_grants : boxed_boolean;
      [@ocaml.doc "Specifies whether Amazon S3 access grants are enabled for query results.\n"]
  create_user_level_prefix : boxed_boolean option;
      [@ocaml.doc
        "When enabled, appends the user ID as an Amazon S3 path prefix to the query result output \
         location.\n"]
  authentication_type : authentication_type;
      [@ocaml.doc
        "The authentication type used for Amazon S3 access grants. Currently, only \
         [DIRECTORY_IDENTITY] is supported.\n"]
}
[@@ocaml.doc "Specifies whether Amazon S3 access grants are enabled for query results.\n"]

type nonrec customer_content_encryption_configuration = {
  kms_key : kms_key;
      [@ocaml.doc
        "The customer managed KMS key that is used to encrypt the user's data stores in Athena.\n"]
}
[@@ocaml.doc
  "Specifies the customer managed KMS key that is used to encrypt the user's data stores in \
   Athena. When an Amazon Web Services managed key is used, this value is null. This setting does \
   not apply to Athena SQL workgroups.\n"]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec engine_version = {
  selected_engine_version : name_string option;
      [@ocaml.doc
        "The engine version requested by the user. Possible values are determined by the output of \
         [ListEngineVersions], including AUTO. The default is AUTO.\n"]
  effective_engine_version : name_string option;
      [@ocaml.doc
        "Read only. The engine version on which the query runs. If the user requests a valid \
         engine version other than Auto, the effective engine version is the same as the engine \
         version that the user requested. If the user requests Auto, the effective engine version \
         is chosen by Athena. When a request to update the engine version is made by a \
         [CreateWorkGroup] or [UpdateWorkGroup] operation, the [EffectiveEngineVersion] field is \
         ignored.\n"]
}
[@@ocaml.doc
  "The Athena engine version for running queries, or the PySpark engine version for running \
   sessions.\n"]

type nonrec bytes_scanned_cutoff_value = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec managed_query_results_encryption_configuration = {
  kms_key : kms_key; [@ocaml.doc "The ARN of an KMS key for encrypting managed query results.\n"]
}
[@@ocaml.doc
  "If you encrypt query and calculation results in Athena owned storage, this field indicates the \
   encryption option (for example, SSE_KMS or CSE_KMS) and key information.\n"]

type nonrec managed_query_results_configuration_updates = {
  enabled : boxed_boolean option;
      [@ocaml.doc
        "If set to true, specifies that Athena manages query results in Athena owned storage.\n"]
  encryption_configuration : managed_query_results_encryption_configuration option;
      [@ocaml.doc
        "If you encrypt query and calculation results in Athena owned storage, this field \
         indicates the encryption option (for example, SSE_KMS or CSE_KMS) and key information.\n"]
  remove_encryption_configuration : boxed_boolean option;
      [@ocaml.doc
        "If set to true, it removes workgroup from Athena owned storage. The existing query \
         results are cleaned up after 24hrs. You must provide query results in location specified \
         under [ResultConfiguration$OutputLocation].\n"]
}
[@@ocaml.doc "Updates the configuration for managed query results.\n"]

type nonrec aws_account_id = string [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec encryption_option =
  | SSE_S3 [@ocaml.doc ""]
  | SSE_KMS [@ocaml.doc ""]
  | CSE_KMS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec encryption_configuration = {
  encryption_option : encryption_option;
      [@ocaml.doc
        "Indicates whether Amazon S3 server-side encryption with Amazon S3-managed keys \
         ([SSE_S3]), server-side encryption with KMS-managed keys ([SSE_KMS]), or client-side \
         encryption with KMS-managed keys ([CSE_KMS]) is used.\n\n\
        \ If a query runs in a workgroup and the workgroup overrides client-side settings, then \
         the workgroup's setting for encryption is used. It specifies whether query results must \
         be encrypted, for all queries that run in this workgroup. \n\
        \ "]
  kms_key : string_ option;
      [@ocaml.doc "For [SSE_KMS] and [CSE_KMS], this is the KMS key ARN or ID.\n"]
}
[@@ocaml.doc
  "If query and calculation results are encrypted in Amazon S3, indicates the encryption option \
   used (for example, [SSE_KMS] or [CSE_KMS]) and key information.\n"]

type nonrec result_output_location = string [@@ocaml.doc ""]

type nonrec result_configuration_updates = {
  output_location : result_output_location option;
      [@ocaml.doc
        "The location in Amazon S3 where your query and calculation results are stored, such as \
         [s3://path/to/query/bucket/]. If workgroup settings override client-side settings, then \
         the query uses the location for the query results and the encryption configuration that \
         are specified for the workgroup. The \"workgroup settings override\" is specified in \
         [EnforceWorkGroupConfiguration] (true/false) in the [WorkGroupConfiguration]. See \
         [WorkGroupConfiguration$EnforceWorkGroupConfiguration].\n"]
  remove_output_location : boxed_boolean option;
      [@ocaml.doc
        "If set to \"true\", indicates that the previously-specified query results location (also \
         known as a client-side setting) for queries in this workgroup should be ignored and set \
         to null. If set to \"false\" or not set, and a value is present in the [OutputLocation] \
         in [ResultConfigurationUpdates] (the client-side setting), the [OutputLocation] in the \
         workgroup's [ResultConfiguration] will be updated with the new value. For more \
         information, see \
         {{:https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html}Workgroup \
         Settings Override Client-Side Settings}.\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc "The encryption configuration for query and calculation results.\n"]
  remove_encryption_configuration : boxed_boolean option;
      [@ocaml.doc
        "If set to \"true\", indicates that the previously-specified encryption configuration \
         (also known as the client-side setting) for queries in this workgroup should be ignored \
         and set to null. If set to \"false\" or not set, and a value is present in the \
         [EncryptionConfiguration] in [ResultConfigurationUpdates] (the client-side setting), the \
         [EncryptionConfiguration] in the workgroup's [ResultConfiguration] will be updated with \
         the new value. For more information, see \
         {{:https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html}Workgroup \
         Settings Override Client-Side Settings}.\n"]
  expected_bucket_owner : aws_account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that you expect to be the owner of the Amazon S3 \
         bucket specified by [ResultConfiguration$OutputLocation]. If set, Athena uses the value \
         for [ExpectedBucketOwner] when it makes Amazon S3 calls to your specified output \
         location. If the [ExpectedBucketOwner] Amazon Web Services account ID does not match the \
         actual owner of the Amazon S3 bucket, the call fails with a permissions error.\n\n\
        \ If workgroup settings override client-side settings, then the query uses the \
         [ExpectedBucketOwner] setting that is specified for the workgroup, and also uses the \
         location for storing query results specified in the workgroup. See \
         [WorkGroupConfiguration$EnforceWorkGroupConfiguration] and \
         {{:https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html}Workgroup \
         Settings Override Client-Side Settings}.\n\
        \ "]
  remove_expected_bucket_owner : boxed_boolean option;
      [@ocaml.doc
        "If set to \"true\", removes the Amazon Web Services account ID previously specified for \
         [ResultConfiguration$ExpectedBucketOwner]. If set to \"false\" or not set, and a value is \
         present in the [ExpectedBucketOwner] in [ResultConfigurationUpdates] (the client-side \
         setting), the [ExpectedBucketOwner] in the workgroup's [ResultConfiguration] is updated \
         with the new value. For more information, see \
         {{:https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html}Workgroup \
         Settings Override Client-Side Settings}.\n"]
  acl_configuration : acl_configuration option;
      [@ocaml.doc "The ACL configuration for the query results.\n"]
  remove_acl_configuration : boxed_boolean option;
      [@ocaml.doc
        "If set to [true], indicates that the previously-specified ACL configuration for queries \
         in this workgroup should be ignored and set to null. If set to [false] or not set, and a \
         value is present in the [AclConfiguration] of [ResultConfigurationUpdates], the \
         [AclConfiguration] in the workgroup's [ResultConfiguration] is updated with the new \
         value. For more information, see \
         {{:https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html}Workgroup \
         Settings Override Client-Side Settings}.\n"]
}
[@@ocaml.doc
  "The information about the updates in the query results, such as output location and encryption \
   configuration for the query results.\n"]

type nonrec work_group_configuration_updates = {
  enforce_work_group_configuration : boxed_boolean option;
      [@ocaml.doc
        "If set to \"true\", the settings for the workgroup override client-side settings. If set \
         to \"false\" client-side settings are used. For more information, see \
         {{:https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html}Workgroup \
         Settings Override Client-Side Settings}.\n"]
  result_configuration_updates : result_configuration_updates option;
      [@ocaml.doc
        "The result configuration information about the queries in this workgroup that will be \
         updated. Includes the updated results location and an updated option for encrypting query \
         results.\n"]
  managed_query_results_configuration_updates : managed_query_results_configuration_updates option;
      [@ocaml.doc "Updates configuration information for managed query results in the workgroup.\n"]
  publish_cloud_watch_metrics_enabled : boxed_boolean option;
      [@ocaml.doc
        "Indicates whether this workgroup enables publishing metrics to Amazon CloudWatch.\n"]
  bytes_scanned_cutoff_per_query : bytes_scanned_cutoff_value option;
      [@ocaml.doc
        "The upper limit (cutoff) for the amount of bytes a single query in a workgroup is allowed \
         to scan.\n"]
  remove_bytes_scanned_cutoff_per_query : boxed_boolean option;
      [@ocaml.doc
        "Indicates that the data usage control limit per query is removed. \
         [WorkGroupConfiguration$BytesScannedCutoffPerQuery] \n"]
  requester_pays_enabled : boxed_boolean option;
      [@ocaml.doc
        "If set to [true], allows members assigned to a workgroup to specify Amazon S3 Requester \
         Pays buckets in queries. If set to [false], workgroup members cannot query data from \
         Requester Pays buckets, and queries that retrieve data from Requester Pays buckets cause \
         an error. The default is [false]. For more information about Requester Pays buckets, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html}Requester \
         Pays Buckets} in the {i Amazon Simple Storage Service Developer Guide}.\n"]
  engine_version : engine_version option;
      [@ocaml.doc
        "The engine version requested when a workgroup is updated. After the update, all queries \
         on the workgroup run on the requested engine version. If no value was previously set, the \
         default is Auto. Queries on the [AmazonAthenaPreviewFunctionality] workgroup run on the \
         preview engine regardless of this setting.\n"]
  remove_customer_content_encryption_configuration : boxed_boolean option;
      [@ocaml.doc
        "Removes content encryption configuration from an Apache Spark-enabled Athena workgroup.\n"]
  additional_configuration : name_string option;
      [@ocaml.doc "Contains a user defined string in JSON format for a Spark-enabled workgroup.\n"]
  execution_role : role_arn option;
      [@ocaml.doc
        "The ARN of the execution role used to access user resources for Spark sessions and \
         Identity Center enabled workgroups. This property applies only to Spark enabled \
         workgroups and Identity Center enabled workgroups.\n"]
  customer_content_encryption_configuration : customer_content_encryption_configuration option;
      [@ocaml.doc ""]
  enable_minimum_encryption_configuration : boxed_boolean option;
      [@ocaml.doc
        "Enforces a minimal level of encryption for the workgroup for query and calculation \
         results that are written to Amazon S3. When enabled, workgroup users can set encryption \
         only to the minimum level set by the administrator or higher when they submit queries. \
         This setting does not apply to Spark-enabled workgroups.\n\n\
        \ The [EnforceWorkGroupConfiguration] setting takes precedence over the \
         [EnableMinimumEncryptionConfiguration] flag. This means that if \
         [EnforceWorkGroupConfiguration] is true, the [EnableMinimumEncryptionConfiguration] flag \
         is ignored, and the workgroup configuration for encryption is used.\n\
        \ "]
  query_results_s3_access_grants_configuration :
    query_results_s3_access_grants_configuration option;
      [@ocaml.doc "Specifies whether Amazon S3 access grants are enabled for query results.\n"]
  monitoring_configuration : monitoring_configuration option;
      [@ocaml.doc
        "Contains the configuration settings for managed log persistence, delivering logs to \
         Amazon S3 buckets, Amazon CloudWatch log groups etc.\n"]
  engine_configuration : engine_configuration option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The configuration information that will be updated for this workgroup, which includes the \
   location in Amazon S3 where query and calculation results are stored, the encryption option, if \
   any, used for query results, whether the Amazon CloudWatch Metrics are enabled for the \
   workgroup, whether the workgroup settings override the client-side settings, and the data usage \
   limit for the amount of bytes scanned per query, if it is specified.\n"]

type nonrec work_group_description_string = string [@@ocaml.doc ""]

type nonrec work_group_name = string [@@ocaml.doc ""]

type nonrec update_work_group_input = {
  work_group : work_group_name; [@ocaml.doc "The specified workgroup that will be updated.\n"]
  description : work_group_description_string option; [@ocaml.doc "The workgroup description.\n"]
  configuration_updates : work_group_configuration_updates option;
      [@ocaml.doc "Contains configuration updates for an Athena SQL workgroup.\n"]
  state : work_group_state option;
      [@ocaml.doc "The workgroup state that will be updated for the given workgroup.\n"]
}
[@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : error_message option; [@ocaml.doc ""]
  resource_name : amazon_resource_name option; [@ocaml.doc "The name of the Amazon resource.\n"]
}
[@@ocaml.doc "A resource, such as a workgroup, was not found.\n"]

type nonrec update_prepared_statement_output = unit [@@ocaml.doc ""]

type nonrec description_string = string [@@ocaml.doc ""]

type nonrec query_string = string [@@ocaml.doc ""]

type nonrec statement_name = string [@@ocaml.doc ""]

type nonrec update_prepared_statement_input = {
  statement_name : statement_name; [@ocaml.doc "The name of the prepared statement.\n"]
  work_group : work_group_name; [@ocaml.doc "The workgroup for the prepared statement.\n"]
  query_statement : query_string; [@ocaml.doc "The query string for the prepared statement.\n"]
  description : description_string option;
      [@ocaml.doc "The description of the prepared statement.\n"]
}
[@@ocaml.doc ""]

type nonrec throttle_reason = CONCURRENT_QUERY_LIMIT_EXCEEDED [@ocaml.doc ""]
[@@ocaml.doc
  "The reason for the query throttling, for example, when it exceeds the concurrent query limit.\n"]

type nonrec too_many_requests_exception = {
  message : error_message option; [@ocaml.doc ""]
  reason : throttle_reason option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that the request was throttled.\n"]

type nonrec update_notebook_metadata_output = unit [@@ocaml.doc ""]

type nonrec notebook_name = string [@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec notebook_id = string [@@ocaml.doc ""]

type nonrec update_notebook_metadata_input = {
  notebook_id : notebook_id; [@ocaml.doc "The ID of the notebook to update the metadata for.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique case-sensitive string used to ensure the request to create the notebook is \
         idempotent (executes only once).\n\n\
        \  This token is listed as not required because Amazon Web Services SDKs (for example the \
         Amazon Web Services SDK for Java) auto-generate the token for you. If you are not using \
         the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token \
         or the action will fail.\n\
        \  \n\
        \   "]
  name : notebook_name; [@ocaml.doc "The name to update the notebook to.\n"]
}
[@@ocaml.doc ""]

type nonrec update_notebook_output = unit [@@ocaml.doc ""]

type nonrec session_id = string [@@ocaml.doc ""]

type nonrec notebook_type = IPYNB [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec payload = string [@@ocaml.doc ""]

type nonrec update_notebook_input = {
  notebook_id : notebook_id; [@ocaml.doc "The ID of the notebook to update.\n"]
  payload : payload; [@ocaml.doc "The updated content for the notebook.\n"]
  type_ : notebook_type;
      [@ocaml.doc "The notebook content type. Currently, the only valid type is [IPYNB].\n"]
  session_id : session_id option;
      [@ocaml.doc
        "The active notebook session ID. Required if the notebook has an active session.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique case-sensitive string used to ensure the request to create the notebook is \
         idempotent (executes only once).\n\n\
        \  This token is listed as not required because Amazon Web Services SDKs (for example the \
         Amazon Web Services SDK for Java) auto-generate the token for you. If you are not using \
         the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token \
         or the action will fail.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec update_named_query_output = unit [@@ocaml.doc ""]

type nonrec named_query_description_string = string [@@ocaml.doc ""]

type nonrec named_query_id = string [@@ocaml.doc ""]

type nonrec update_named_query_input = {
  named_query_id : named_query_id; [@ocaml.doc "The unique identifier (UUID) of the query.\n"]
  name : name_string; [@ocaml.doc "The name of the query.\n"]
  description : named_query_description_string option; [@ocaml.doc "The query description.\n"]
  query_string : query_string; [@ocaml.doc "The contents of the query with all query statements.\n"]
}
[@@ocaml.doc ""]

type nonrec update_data_catalog_output = unit [@@ocaml.doc ""]

type nonrec data_catalog_type =
  | LAMBDA [@ocaml.doc ""]
  | GLUE [@ocaml.doc ""]
  | HIVE [@ocaml.doc ""]
  | FEDERATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec catalog_name_string = string [@@ocaml.doc ""]

type nonrec update_data_catalog_input = {
  name : catalog_name_string;
      [@ocaml.doc
        "The name of the data catalog to update. The catalog name must be unique for the Amazon \
         Web Services account and can use a maximum of 127 alphanumeric, underscore, at sign, or \
         hyphen characters. The remainder of the length constraint of 256 is reserved for use by \
         Athena.\n"]
  type_ : data_catalog_type;
      [@ocaml.doc
        "Specifies the type of data catalog to update. Specify [LAMBDA] for a federated catalog, \
         [HIVE] for an external hive metastore, or [GLUE] for an Glue Data Catalog.\n"]
  description : description_string option;
      [@ocaml.doc "New or modified text that describes the data catalog.\n"]
  parameters : parameters_map option;
      [@ocaml.doc
        "Specifies the Lambda function or functions to use for updating the data catalog. This is \
         a mapping whose values depend on the catalog type. \n\n\
        \ {ul\n\
        \       {-  For the [HIVE] data catalog type, use the following syntax. The \
         [metadata-function] parameter is required. [The\n\
        \                        sdk-version] parameter is optional and defaults to the currently \
         supported version.\n\
        \           \n\
        \             \n\
        \            {[\n\
        \            metadata-function={i lambda_arn}, sdk-version={i version_number} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \       {-  For the [LAMBDA] data catalog type, use one of the following sets of required \
         parameters, but not both.\n\
        \           \n\
        \            {ul\n\
        \                  {-  If you have one Lambda function that processes metadata and another \
         for reading the actual data, use the following syntax. Both parameters are required.\n\
        \                      \n\
        \                        \n\
        \                       {[\n\
        \                       metadata-function={i lambda_arn}, record-function={i lambda_arn} \n\
        \                       ]}\n\
        \                        \n\
        \                       \n\
        \                        }\n\
        \                  {-   If you have a composite Lambda function that processes both \
         metadata and data, use the following syntax to specify your Lambda function.\n\
        \                      \n\
        \                        \n\
        \                       {[\n\
        \                       function={i lambda_arn} \n\
        \                       ]}\n\
        \                        \n\
        \                       \n\
        \                        }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_capacity_reservation_output = unit [@@ocaml.doc ""]

type nonrec capacity_reservation_name = string [@@ocaml.doc ""]

type nonrec target_dpus_integer = int [@@ocaml.doc ""]

type nonrec update_capacity_reservation_input = {
  target_dpus : target_dpus_integer;
      [@ocaml.doc "The new number of requested data processing units.\n"]
  name : capacity_reservation_name; [@ocaml.doc "The name of the capacity reservation.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_output = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_input = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc "Specifies the ARN of the resource from which tags are to be removed.\n"]
  tag_keys : tag_key_list;
      [@ocaml.doc
        "A comma-separated list of one or more tag keys whose tags are to be removed from the \
         specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec session_state =
  | CREATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | IDLE [@ocaml.doc ""]
  | BUSY [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | DEGRADED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec terminate_session_response = {
  state : session_state option;
      [@ocaml.doc
        "The state of the session. A description of each state follows.\n\n\
        \  [CREATING] - The session is being started, including acquiring resources.\n\
        \ \n\
        \   [CREATED] - The session has been started.\n\
        \  \n\
        \    [IDLE] - The session is able to accept a calculation.\n\
        \   \n\
        \     [BUSY] - The session is processing another task and is unable to accept a calculation.\n\
        \    \n\
        \      [TERMINATING] - The session is in the process of shutting down.\n\
        \     \n\
        \       [TERMINATED] - The session and its resources are no longer running.\n\
        \      \n\
        \        [DEGRADED] - The session has no healthy coordinators.\n\
        \       \n\
        \         [FAILED] - Due to a failure, the session and its resources are no longer running.\n\
        \        "]
}
[@@ocaml.doc ""]

type nonrec terminate_session_request = { session_id : session_id [@ocaml.doc "The session ID.\n"] }
[@@ocaml.doc ""]

type nonrec tag_resource_output = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key option;
      [@ocaml.doc
        "A tag key. The tag key length is from 1 to 128 Unicode characters in UTF-8. You can use \
         letters and numbers representable in UTF-8, and the following characters: + - = . _ : / \
         \\@. Tag keys are case-sensitive and must be unique per resource. \n"]
  value : tag_value option;
      [@ocaml.doc
        "A tag value. The tag value length is from 0 to 256 Unicode characters in UTF-8. You can \
         use letters and numbers representable in UTF-8, and the following characters: + - = . _ : \
         / \\@. Tag values are case-sensitive. \n"]
}
[@@ocaml.doc
  "A label that you assign to a resource. Athena resources include workgroups, data catalogs, and \
   capacity reservations. Each tag consists of a key and an optional value, both of which you \
   define. For example, you can use tags to categorize Athena resources by purpose, owner, or \
   environment. Use a consistent set of tag keys to make it easier to search and filter the \
   resources in your account. For best practices, see \
   {{:https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html}Tagging \
   Best Practices}. Tag keys can be from 1 to 128 UTF-8 Unicode characters, and tag values can be \
   from 0 to 256 UTF-8 Unicode characters. Tags can use letters and numbers representable in \
   UTF-8, and the following characters: + - = . _ : / \\@. Tag keys and values are case-sensitive. \
   Tag keys must be unique per resource. If you specify more than one tag, separate them by \
   commas. \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_input = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc "Specifies the ARN of the Athena resource to which tags are to be added.\n"]
  tags : tag_list;
      [@ocaml.doc
        "A collection of one or more tags, separated by commas, to be added to an Athena resource.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_query_execution_output = unit [@@ocaml.doc ""]

type nonrec query_execution_id = string [@@ocaml.doc ""]

type nonrec stop_query_execution_input = {
  query_execution_id : query_execution_id;
      [@ocaml.doc "The unique ID of the query execution to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec calculation_execution_state =
  | CREATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | CANCELING [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stop_calculation_execution_response = {
  state : calculation_execution_state option;
      [@ocaml.doc
        " [CREATING] - The calculation is in the process of being created.\n\n\
        \  [CREATED] - The calculation has been created and is ready to run.\n\
        \ \n\
        \   [QUEUED] - The calculation has been queued for processing.\n\
        \  \n\
        \    [RUNNING] - The calculation is running.\n\
        \   \n\
        \     [CANCELING] - A request to cancel the calculation has been received and the system \
         is working to stop it.\n\
        \    \n\
        \      [CANCELED] - The calculation is no longer running as the result of a cancel request.\n\
        \     \n\
        \       [COMPLETED] - The calculation has completed without error.\n\
        \      \n\
        \        [FAILED] - The calculation failed and is no longer running.\n\
        \       "]
}
[@@ocaml.doc ""]

type nonrec calculation_execution_id = string [@@ocaml.doc ""]

type nonrec stop_calculation_execution_request = {
  calculation_execution_id : calculation_execution_id;
      [@ocaml.doc "The calculation execution UUID.\n"]
}
[@@ocaml.doc ""]

type nonrec session_already_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified session already exists.\n"]

type nonrec start_session_response = {
  session_id : session_id option; [@ocaml.doc "The session ID.\n"]
  state : session_state option;
      [@ocaml.doc
        "The state of the session. A description of each state follows.\n\n\
        \  [CREATING] - The session is being started, including acquiring resources.\n\
        \ \n\
        \   [CREATED] - The session has been started.\n\
        \  \n\
        \    [IDLE] - The session is able to accept a calculation.\n\
        \   \n\
        \     [BUSY] - The session is processing another task and is unable to accept a calculation.\n\
        \    \n\
        \      [TERMINATING] - The session is in the process of shutting down.\n\
        \     \n\
        \       [TERMINATED] - The session and its resources are no longer running.\n\
        \      \n\
        \        [DEGRADED] - The session has no healthy coordinators.\n\
        \       \n\
        \         [FAILED] - Due to a failure, the session and its resources are no longer running.\n\
        \        "]
}
[@@ocaml.doc ""]

type nonrec idempotency_token = string [@@ocaml.doc ""]

type nonrec session_idle_timeout_in_minutes = int [@@ocaml.doc ""]

type nonrec start_session_request = {
  description : description_string option; [@ocaml.doc "The session description.\n"]
  work_group : work_group_name; [@ocaml.doc "The workgroup to which the session belongs.\n"]
  engine_configuration : engine_configuration;
      [@ocaml.doc
        "Contains engine data processing unit (DPU) configuration settings and parameter mappings.\n"]
  execution_role : role_arn option;
      [@ocaml.doc
        "The ARN of the execution role used to access user resources for Spark sessions and \
         Identity Center enabled workgroups. This property applies only to Spark enabled \
         workgroups and Identity Center enabled workgroups.\n"]
  monitoring_configuration : monitoring_configuration option;
      [@ocaml.doc
        "Contains the configuration settings for managed log persistence, delivering logs to \
         Amazon S3 buckets, Amazon CloudWatch log groups etc.\n"]
  notebook_version : name_string option;
      [@ocaml.doc
        "The notebook version. This value is supplied automatically for notebook sessions in the \
         Athena console and is not required for programmatic session access. The only valid \
         notebook version is [Athena notebook version 1]. If you specify a value for \
         [NotebookVersion], you must also specify a value for [NotebookId]. See \
         [EngineConfiguration$AdditionalConfigs].\n"]
  session_idle_timeout_in_minutes : session_idle_timeout_in_minutes option;
      [@ocaml.doc "The idle timeout in minutes for the session.\n"]
  client_request_token : idempotency_token option;
      [@ocaml.doc
        "A unique case-sensitive string used to ensure the request to create the session is \
         idempotent (executes only once). If another [StartSessionRequest] is received, the same \
         response is returned and another session is not created. If a parameter has changed, an \
         error is returned.\n\n\
        \  This token is listed as not required because Amazon Web Services SDKs (for example the \
         Amazon Web Services SDK for Java) auto-generate the token for users. If you are not using \
         the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token \
         or the action will fail.\n\
        \  \n\
        \   "]
  tags : tag_list option;
      [@ocaml.doc "A list of comma separated tags to add to the session that is created.\n"]
  copy_work_group_tags : boxed_boolean option;
      [@ocaml.doc "Copies the tags from the Workgroup to the Session when.\n"]
}
[@@ocaml.doc ""]

type nonrec start_query_execution_output = {
  query_execution_id : query_execution_id option;
      [@ocaml.doc "The unique ID of the query that ran as a result of this request.\n"]
}
[@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec result_reuse_by_age_configuration = {
  enabled : boolean_;
      [@ocaml.doc
        "True if previous query results can be reused when the query is run; otherwise, false. The \
         default is false.\n"]
  max_age_in_minutes : age option;
      [@ocaml.doc
        "Specifies, in minutes, the maximum age of a previous query result that Athena should \
         consider for reuse. The default is 60.\n"]
}
[@@ocaml.doc "Specifies whether previous query results are reused, and if so, their maximum age.\n"]

type nonrec result_reuse_configuration = {
  result_reuse_by_age_configuration : result_reuse_by_age_configuration option;
      [@ocaml.doc
        "Specifies whether previous query results are reused, and if so, their maximum age.\n"]
}
[@@ocaml.doc "Specifies the query result reuse behavior for the query.\n"]

type nonrec execution_parameter = string [@@ocaml.doc ""]

type nonrec execution_parameters = execution_parameter list [@@ocaml.doc ""]

type nonrec result_configuration = {
  output_location : result_output_location option;
      [@ocaml.doc
        "The location in Amazon S3 where your query and calculation results are stored, such as \
         [s3://path/to/query/bucket/]. To run the query, you must specify the query results \
         location using one of the ways: either for individual queries using either this setting \
         (client-side), or in the workgroup, using [WorkGroupConfiguration]. If none of them is \
         set, Athena issues an error that no output location is provided. If workgroup settings \
         override client-side settings, then the query uses the settings specified for the \
         workgroup. See [WorkGroupConfiguration$EnforceWorkGroupConfiguration].\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "If query and calculation results are encrypted in Amazon S3, indicates the encryption \
         option used (for example, [SSE_KMS] or [CSE_KMS]) and key information. This is a \
         client-side setting. If workgroup settings override client-side settings, then the query \
         uses the encryption configuration that is specified for the workgroup, and also uses the \
         location for storing query results specified in the workgroup. See \
         [WorkGroupConfiguration$EnforceWorkGroupConfiguration] and \
         {{:https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html}Workgroup \
         Settings Override Client-Side Settings}.\n"]
  expected_bucket_owner : aws_account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that you expect to be the owner of the Amazon S3 \
         bucket specified by [ResultConfiguration$OutputLocation]. If set, Athena uses the value \
         for [ExpectedBucketOwner] when it makes Amazon S3 calls to your specified output \
         location. If the [ExpectedBucketOwner] Amazon Web Services account ID does not match the \
         actual owner of the Amazon S3 bucket, the call fails with a permissions error.\n\n\
        \ This is a client-side setting. If workgroup settings override client-side settings, then \
         the query uses the [ExpectedBucketOwner] setting that is specified for the workgroup, and \
         also uses the location for storing query results specified in the workgroup. See \
         [WorkGroupConfiguration$EnforceWorkGroupConfiguration] and \
         {{:https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html}Workgroup \
         Settings Override Client-Side Settings}.\n\
        \ "]
  acl_configuration : acl_configuration option;
      [@ocaml.doc
        "Indicates that an Amazon S3 canned ACL should be set to control ownership of stored query \
         results. Currently the only supported canned ACL is [BUCKET_OWNER_FULL_CONTROL]. This is \
         a client-side setting. If workgroup settings override client-side settings, then the \
         query uses the ACL configuration that is specified for the workgroup, and also uses the \
         location for storing query results specified in the workgroup. For more information, see \
         [WorkGroupConfiguration$EnforceWorkGroupConfiguration] and \
         {{:https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html}Workgroup \
         Settings Override Client-Side Settings}.\n"]
}
[@@ocaml.doc
  "The location in Amazon S3 where query and calculation results are stored and the encryption \
   option, if any, used for query and calculation results. These are known as \"client-side \
   settings\". If workgroup settings override client-side settings, then the query uses the \
   workgroup settings.\n"]

type nonrec database_string = string [@@ocaml.doc ""]

type nonrec query_execution_context = {
  database : database_string option;
      [@ocaml.doc
        "The name of the database used in the query execution. The database must exist in the \
         catalog.\n"]
  catalog : catalog_name_string option;
      [@ocaml.doc "The name of the data catalog used in the query execution.\n"]
}
[@@ocaml.doc "The database and data catalog context in which the query execution occurs.\n"]

type nonrec start_query_execution_input = {
  query_string : query_string; [@ocaml.doc "The SQL query statements to be executed.\n"]
  client_request_token : idempotency_token option;
      [@ocaml.doc
        "A unique case-sensitive string used to ensure the request to create the query is \
         idempotent (executes only once). If another [StartQueryExecution] request is received, \
         the same response is returned and another query is not created. An error is returned if a \
         parameter, such as [QueryString], has changed. A call to [StartQueryExecution] that uses \
         a previous client request token returns the same [QueryExecutionId] even if the requester \
         doesn't have permission on the tables specified in [QueryString].\n\n\
        \  This token is listed as not required because Amazon Web Services SDKs (for example the \
         Amazon Web Services SDK for Java) auto-generate the token for users. If you are not using \
         the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token \
         or the action will fail.\n\
        \  \n\
        \   "]
  query_execution_context : query_execution_context option;
      [@ocaml.doc "The database within which the query executes.\n"]
  result_configuration : result_configuration option;
      [@ocaml.doc
        "Specifies information about where and how to save the results of the query execution. If \
         the query runs in a workgroup, then workgroup's settings may override query settings. \
         This affects the query results location. The workgroup settings override is specified in \
         EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration. See \
         [WorkGroupConfiguration$EnforceWorkGroupConfiguration].\n"]
  work_group : work_group_name option;
      [@ocaml.doc "The name of the workgroup in which the query is being started.\n"]
  execution_parameters : execution_parameters option;
      [@ocaml.doc
        "A list of values for the parameters in a query. The values are applied sequentially to \
         the parameters in the query in the order in which the parameters occur.\n"]
  result_reuse_configuration : result_reuse_configuration option;
      [@ocaml.doc "Specifies the query result reuse behavior for the query.\n"]
  engine_configuration : engine_configuration option;
      [@ocaml.doc
        "The engine configuration for the workgroup, which includes the minimum/maximum number of \
         Data Processing Units (DPU) that queries should use when running in provisioned capacity. \
         If not specified, Athena uses default values (Default value for min is 4 and for max is \
         Minimum of 124 and allocated DPUs).\n\n\
        \ To specify minimum and maximum DPU values for Capacity Reservations queries, the \
         workgroup containing [EngineConfiguration] should have the following values: The name of \
         the [Classifications] should be [athena-query-engine-properties], with the only allowed \
         properties as [max-dpu-count] and [min-dpu-count].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec start_calculation_execution_response = {
  calculation_execution_id : calculation_execution_id option;
      [@ocaml.doc "The calculation execution UUID.\n"]
  state : calculation_execution_state option;
      [@ocaml.doc
        " [CREATING] - The calculation is in the process of being created.\n\n\
        \  [CREATED] - The calculation has been created and is ready to run.\n\
        \ \n\
        \   [QUEUED] - The calculation has been queued for processing.\n\
        \  \n\
        \    [RUNNING] - The calculation is running.\n\
        \   \n\
        \     [CANCELING] - A request to cancel the calculation has been received and the system \
         is working to stop it.\n\
        \    \n\
        \      [CANCELED] - The calculation is no longer running as the result of a cancel request.\n\
        \     \n\
        \       [COMPLETED] - The calculation has completed without error.\n\
        \      \n\
        \        [FAILED] - The calculation failed and is no longer running.\n\
        \       "]
}
[@@ocaml.doc ""]

type nonrec code_block = string [@@ocaml.doc ""]

type nonrec calculation_configuration = {
  code_block : code_block option;
      [@ocaml.doc "A string that contains the code for the calculation.\n"]
}
[@@ocaml.doc "Contains configuration information for the calculation.\n"]

type nonrec start_calculation_execution_request = {
  session_id : session_id; [@ocaml.doc "The session ID.\n"]
  description : description_string option; [@ocaml.doc "A description of the calculation.\n"]
  calculation_configuration : calculation_configuration option;
      [@ocaml.doc "Contains configuration information for the calculation.\n"]
  code_block : code_block option;
      [@ocaml.doc
        "A string that contains the code of the calculation. Use this parameter instead of \
         [CalculationConfiguration$CodeBlock], which is deprecated.\n"]
  client_request_token : idempotency_token option;
      [@ocaml.doc
        "A unique case-sensitive string used to ensure the request to create the calculation is \
         idempotent (executes only once). If another [StartCalculationExecutionRequest] is \
         received, the same response is returned and another calculation is not created. If a \
         parameter has changed, an error is returned.\n\n\
        \  This token is listed as not required because Amazon Web Services SDKs (for example the \
         Amazon Web Services SDK for Java) auto-generate the token for users. If you are not using \
         the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token \
         or the action will fail.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec put_capacity_assignment_configuration_output = unit [@@ocaml.doc ""]

type nonrec work_group_names_list = work_group_name list [@@ocaml.doc ""]

type nonrec capacity_assignment = {
  work_group_names : work_group_names_list option;
      [@ocaml.doc "The list of workgroup names for the capacity assignment.\n"]
}
[@@ocaml.doc "A mapping between one or more workgroups and a capacity reservation.\n"]

type nonrec capacity_assignments_list = capacity_assignment list [@@ocaml.doc ""]

type nonrec put_capacity_assignment_configuration_input = {
  capacity_reservation_name : capacity_reservation_name;
      [@ocaml.doc
        "The name of the capacity reservation to put a capacity assignment configuration for.\n"]
  capacity_assignments : capacity_assignments_list;
      [@ocaml.doc "The list of assignments for the capacity assignment configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec token = string [@@ocaml.doc ""]

type nonrec identity_center_application_arn = string [@@ocaml.doc ""]

type nonrec date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec work_group_summary = {
  name : work_group_name option; [@ocaml.doc "The name of the workgroup.\n"]
  state : work_group_state option; [@ocaml.doc "The state of the workgroup.\n"]
  description : work_group_description_string option; [@ocaml.doc "The workgroup description.\n"]
  creation_time : date option; [@ocaml.doc "The workgroup creation date and time.\n"]
  engine_version : engine_version option;
      [@ocaml.doc
        "The engine version setting for all queries on the workgroup. Queries on the \
         [AmazonAthenaPreviewFunctionality] workgroup run on the preview engine regardless of this \
         setting.\n"]
  identity_center_application_arn : identity_center_application_arn option;
      [@ocaml.doc
        "The ARN of the IAM Identity Center enabled application associated with the workgroup.\n"]
}
[@@ocaml.doc
  "The summary information for the workgroup, which includes its name, state, description, and the \
   date and time it was created.\n"]

type nonrec work_groups_list = work_group_summary list [@@ocaml.doc ""]

type nonrec list_work_groups_output = {
  work_groups : work_groups_list option;
      [@ocaml.doc
        "A list of [WorkGroupSummary] objects that include the names, descriptions, creation \
         times, and states for each workgroup.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec max_work_groups_count = int [@@ocaml.doc ""]

type nonrec list_work_groups_input = {
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
  max_results : max_work_groups_count option;
      [@ocaml.doc "The maximum number of workgroups to return in this request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_output = {
  tags : tag_list option; [@ocaml.doc "The list of tags associated with the specified resource.\n"]
  next_token : token option;
      [@ocaml.doc "A token to be used by the next request if this request is truncated.\n"]
}
[@@ocaml.doc ""]

type nonrec max_tags_count = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_input = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc "Lists the tags for the resource with the specified ARN.\n"]
  next_token : token option;
      [@ocaml.doc
        "The token for the next set of results, or null if there are no additional results for \
         this request, where the request lists the tags for the resource with the specified ARN.\n"]
  max_results : max_tags_count option;
      [@ocaml.doc
        "The maximum number of results to be returned per request that lists the tags for the \
         resource.\n"]
}
[@@ocaml.doc ""]

type nonrec metadata_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An exception that Athena received when it called a custom metastore. Occurs if the error is not \
   caused by user input ([InvalidRequestException]) or from the Athena platform \
   ([InternalServerException]). For example, if a user-created Lambda function is missing \
   permissions, the Lambda [4XX] exception is returned in a [MetadataException].\n"]

type nonrec comment_string = string [@@ocaml.doc ""]

type nonrec type_string = string [@@ocaml.doc ""]

type nonrec column = {
  name : name_string; [@ocaml.doc "The name of the column.\n"]
  type_ : type_string option; [@ocaml.doc "The data type of the column.\n"]
  comment : comment_string option; [@ocaml.doc "Optional information about the column.\n"]
}
[@@ocaml.doc "Contains metadata for a column in a table.\n"]

type nonrec column_list = column list [@@ocaml.doc ""]

type nonrec table_type_string = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec table_metadata = {
  name : name_string; [@ocaml.doc "The name of the table.\n"]
  create_time : timestamp option; [@ocaml.doc "The time that the table was created.\n"]
  last_access_time : timestamp option; [@ocaml.doc "The last time the table was accessed.\n"]
  table_type : table_type_string option;
      [@ocaml.doc "The type of table. In Athena, only [EXTERNAL_TABLE] is supported.\n"]
  columns : column_list option; [@ocaml.doc "A list of the columns in the table.\n"]
  partition_keys : column_list option; [@ocaml.doc "A list of the partition keys in the table.\n"]
  parameters : parameters_map option;
      [@ocaml.doc "A set of custom key/value pairs for table properties.\n"]
}
[@@ocaml.doc "Contains metadata for a table.\n"]

type nonrec table_metadata_list = table_metadata list [@@ocaml.doc ""]

type nonrec list_table_metadata_output = {
  table_metadata_list : table_metadata_list option; [@ocaml.doc "A list of table metadata.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the NextToken \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec max_table_metadata_count = int [@@ocaml.doc ""]

type nonrec expression_string = string [@@ocaml.doc ""]

type nonrec list_table_metadata_input = {
  catalog_name : catalog_name_string;
      [@ocaml.doc "The name of the data catalog for which table metadata should be returned.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the database for which table metadata should be returned.\n"]
  expression : expression_string option;
      [@ocaml.doc
        "A regex filter that pattern-matches table names. If no expression is supplied, metadata \
         for all tables are listed.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the NextToken \
         from the response object of the previous page call.\n"]
  max_results : max_table_metadata_count option;
      [@ocaml.doc "Specifies the maximum number of results to return.\n"]
  work_group : work_group_name option;
      [@ocaml.doc
        "The name of the workgroup for which the metadata is being fetched. Required if requesting \
         an IAM Identity Center enabled Glue Data Catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec session_status = {
  start_date_time : date option; [@ocaml.doc "The date and time that the session started.\n"]
  last_modified_date_time : date option;
      [@ocaml.doc "The most recent date and time that the session was modified.\n"]
  end_date_time : date option; [@ocaml.doc "The date and time that the session ended.\n"]
  idle_since_date_time : date option;
      [@ocaml.doc
        "The date and time starting at which the session became idle. Can be empty if the session \
         is not currently idle.\n"]
  state : session_state option;
      [@ocaml.doc
        "The state of the session. A description of each state follows.\n\n\
        \  [CREATING] - The session is being started, including acquiring resources.\n\
        \ \n\
        \   [CREATED] - The session has been started.\n\
        \  \n\
        \    [IDLE] - The session is able to accept a calculation.\n\
        \   \n\
        \     [BUSY] - The session is processing another task and is unable to accept a calculation.\n\
        \    \n\
        \      [TERMINATING] - The session is in the process of shutting down.\n\
        \     \n\
        \       [TERMINATED] - The session and its resources are no longer running.\n\
        \      \n\
        \        [DEGRADED] - The session has no healthy coordinators.\n\
        \       \n\
        \         [FAILED] - Due to a failure, the session and its resources are no longer running.\n\
        \        "]
  state_change_reason : description_string option;
      [@ocaml.doc
        "The reason for the session state change (for example, canceled because the session was \
         terminated).\n"]
}
[@@ocaml.doc "Contains information about the status of a session.\n"]

type nonrec session_summary = {
  session_id : session_id option; [@ocaml.doc "The session ID.\n"]
  description : description_string option; [@ocaml.doc "The session description.\n"]
  engine_version : engine_version option;
      [@ocaml.doc
        "The engine version used by the session (for example, [PySpark engine version\n\
        \                3]).\n"]
  notebook_version : name_string option; [@ocaml.doc "The notebook version.\n"]
  status : session_status option; [@ocaml.doc "Contains information about the session status.\n"]
}
[@@ocaml.doc "Contains summary information about a session.\n"]

type nonrec sessions_list = session_summary list [@@ocaml.doc ""]

type nonrec session_manager_token = string [@@ocaml.doc ""]

type nonrec list_sessions_response = {
  next_token : session_manager_token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
  sessions : sessions_list option; [@ocaml.doc "A list of sessions.\n"]
}
[@@ocaml.doc ""]

type nonrec max_sessions_count = int [@@ocaml.doc ""]

type nonrec list_sessions_request = {
  work_group : work_group_name; [@ocaml.doc "The workgroup to which the session belongs.\n"]
  state_filter : session_state option;
      [@ocaml.doc
        "A filter for a specific session state. A description of each state follows.\n\n\
        \  [CREATING] - The session is being started, including acquiring resources.\n\
        \ \n\
        \   [CREATED] - The session has been started.\n\
        \  \n\
        \    [IDLE] - The session is able to accept a calculation.\n\
        \   \n\
        \     [BUSY] - The session is processing another task and is unable to accept a calculation.\n\
        \    \n\
        \      [TERMINATING] - The session is in the process of shutting down.\n\
        \     \n\
        \       [TERMINATED] - The session and its resources are no longer running.\n\
        \      \n\
        \        [DEGRADED] - The session has no healthy coordinators.\n\
        \       \n\
        \         [FAILED] - Due to a failure, the session and its resources are no longer running.\n\
        \        "]
  max_results : max_sessions_count option;
      [@ocaml.doc "The maximum number of sessions to return.\n"]
  next_token : session_manager_token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec query_execution_id_list = query_execution_id list [@@ocaml.doc ""]

type nonrec list_query_executions_output = {
  query_execution_ids : query_execution_id_list option;
      [@ocaml.doc "The unique IDs of each query execution as an array of strings.\n"]
  next_token : token option;
      [@ocaml.doc "A token to be used by the next request if this request is truncated.\n"]
}
[@@ocaml.doc ""]

type nonrec max_query_executions_count = int [@@ocaml.doc ""]

type nonrec list_query_executions_input = {
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
  max_results : max_query_executions_count option;
      [@ocaml.doc "The maximum number of query executions to return in this request.\n"]
  work_group : work_group_name option;
      [@ocaml.doc
        "The name of the workgroup from which queries are being returned. If a workgroup is not \
         specified, a list of available query execution IDs for the queries in the primary \
         workgroup is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec prepared_statement_summary = {
  statement_name : statement_name option; [@ocaml.doc "The name of the prepared statement.\n"]
  last_modified_time : date option;
      [@ocaml.doc "The last modified time of the prepared statement.\n"]
}
[@@ocaml.doc "The name and last modified time of the prepared statement.\n"]

type nonrec prepared_statements_list = prepared_statement_summary list [@@ocaml.doc ""]

type nonrec list_prepared_statements_output = {
  prepared_statements : prepared_statements_list option;
      [@ocaml.doc "The list of prepared statements for the workgroup.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec max_prepared_statements_count = int [@@ocaml.doc ""]

type nonrec list_prepared_statements_input = {
  work_group : work_group_name; [@ocaml.doc "The workgroup to list the prepared statements for.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
  max_results : max_prepared_statements_count option;
      [@ocaml.doc "The maximum number of results to return in this request.\n"]
}
[@@ocaml.doc ""]

type nonrec notebook_session_summary = {
  session_id : session_id option; [@ocaml.doc "The notebook session ID.\n"]
  creation_time : date option; [@ocaml.doc "The time when the notebook session was created.\n"]
}
[@@ocaml.doc "Contains the notebook session ID and notebook session creation time.\n"]

type nonrec notebook_sessions_list = notebook_session_summary list [@@ocaml.doc ""]

type nonrec list_notebook_sessions_response = {
  notebook_sessions_list : notebook_sessions_list;
      [@ocaml.doc "A list of the sessions belonging to the notebook.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_notebook_sessions_request = {
  notebook_id : notebook_id; [@ocaml.doc "The ID of the notebook to list sessions for.\n"]
  max_results : max_sessions_count option;
      [@ocaml.doc "The maximum number of notebook sessions to return.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec notebook_metadata = {
  notebook_id : notebook_id option; [@ocaml.doc "The notebook ID.\n"]
  name : notebook_name option; [@ocaml.doc "The name of the notebook.\n"]
  work_group : work_group_name option;
      [@ocaml.doc "The name of the Spark enabled workgroup to which the notebook belongs.\n"]
  creation_time : date option; [@ocaml.doc "The time when the notebook was created.\n"]
  type_ : notebook_type option;
      [@ocaml.doc "The type of notebook. Currently, the only valid type is [IPYNB].\n"]
  last_modified_time : date option; [@ocaml.doc "The time when the notebook was last modified.\n"]
}
[@@ocaml.doc
  "Contains metadata for notebook, including the notebook name, ID, workgroup, and time created.\n"]

type nonrec notebook_metadata_array = notebook_metadata list [@@ocaml.doc ""]

type nonrec list_notebook_metadata_output = {
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
  notebook_metadata_list : notebook_metadata_array option;
      [@ocaml.doc "The list of notebook metadata for the specified workgroup.\n"]
}
[@@ocaml.doc ""]

type nonrec max_notebooks_count = int [@@ocaml.doc ""]

type nonrec filter_definition = {
  name : notebook_name option; [@ocaml.doc "The name of the notebook to search for.\n"]
}
[@@ocaml.doc "A string for searching notebook names.\n"]

type nonrec list_notebook_metadata_input = {
  filters : filter_definition option; [@ocaml.doc "Search filter string.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated.\n"]
  max_results : max_notebooks_count option;
      [@ocaml.doc "Specifies the maximum number of results to return.\n"]
  work_group : work_group_name;
      [@ocaml.doc "The name of the Spark enabled workgroup to retrieve notebook metadata for.\n"]
}
[@@ocaml.doc ""]

type nonrec named_query_id_list = named_query_id list [@@ocaml.doc ""]

type nonrec list_named_queries_output = {
  named_query_ids : named_query_id_list option; [@ocaml.doc "The list of unique query IDs.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec max_named_queries_count = int [@@ocaml.doc ""]

type nonrec list_named_queries_input = {
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
  max_results : max_named_queries_count option;
      [@ocaml.doc "The maximum number of queries to return in this request.\n"]
  work_group : work_group_name option;
      [@ocaml.doc
        "The name of the workgroup from which the named queries are being returned. If a workgroup \
         is not specified, the saved queries for the primary workgroup are returned.\n"]
}
[@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec executor_state =
  | CREATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | REGISTERED [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec executor_type =
  | COORDINATOR [@ocaml.doc ""]
  | GATEWAY [@ocaml.doc ""]
  | WORKER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec executor_id = string [@@ocaml.doc ""]

type nonrec executors_summary = {
  executor_id : executor_id; [@ocaml.doc "The UUID of the executor.\n"]
  executor_type : executor_type option;
      [@ocaml.doc
        "The type of executor used for the application ([COORDINATOR], [GATEWAY], or [WORKER]).\n"]
  start_date_time : long option; [@ocaml.doc "The date and time that the executor started.\n"]
  termination_date_time : long option;
      [@ocaml.doc "The date and time that the executor was terminated.\n"]
  executor_state : executor_state option;
      [@ocaml.doc
        "The processing state of the executor. A description of each state follows.\n\n\
        \  [CREATING] - The executor is being started, including acquiring resources.\n\
        \ \n\
        \   [CREATED] - The executor has been started.\n\
        \  \n\
        \    [REGISTERED] - The executor has been registered.\n\
        \   \n\
        \     [TERMINATING] - The executor is in the process of shutting down.\n\
        \    \n\
        \      [TERMINATED] - The executor is no longer running.\n\
        \     \n\
        \       [FAILED] - Due to a failure, the executor is no longer running.\n\
        \      "]
  executor_size : long option;
      [@ocaml.doc
        "The smallest unit of compute that a session can request from Athena. Size is measured in \
         data processing unit (DPU) values, a relative measure of processing power.\n"]
}
[@@ocaml.doc "Contains summary information about an executor.\n"]

type nonrec executors_summary_list = executors_summary list [@@ocaml.doc ""]

type nonrec list_executors_response = {
  session_id : session_id; [@ocaml.doc "The session ID.\n"]
  next_token : session_manager_token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
  executors_summary : executors_summary_list option;
      [@ocaml.doc "Contains summary information about the executor.\n"]
}
[@@ocaml.doc ""]

type nonrec max_list_executors_count = int [@@ocaml.doc ""]

type nonrec list_executors_request = {
  session_id : session_id; [@ocaml.doc "The session ID.\n"]
  executor_state_filter : executor_state option;
      [@ocaml.doc
        "A filter for a specific executor state. A description of each state follows.\n\n\
        \  [CREATING] - The executor is being started, including acquiring resources.\n\
        \ \n\
        \   [CREATED] - The executor has been started.\n\
        \  \n\
        \    [REGISTERED] - The executor has been registered.\n\
        \   \n\
        \     [TERMINATING] - The executor is in the process of shutting down.\n\
        \    \n\
        \      [TERMINATED] - The executor is no longer running.\n\
        \     \n\
        \       [FAILED] - Due to a failure, the executor is no longer running.\n\
        \      "]
  max_results : max_list_executors_count option;
      [@ocaml.doc "The maximum number of executors to return.\n"]
  next_token : session_manager_token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec engine_versions_list = engine_version list [@@ocaml.doc ""]

type nonrec list_engine_versions_output = {
  engine_versions : engine_versions_list option;
      [@ocaml.doc "A list of engine versions that are available to choose from.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec max_engine_versions_count = int [@@ocaml.doc ""]

type nonrec list_engine_versions_input = {
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
  max_results : max_engine_versions_count option;
      [@ocaml.doc "The maximum number of engine versions to return in this request.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_type =
  | DYNAMODB [@ocaml.doc ""]
  | MYSQL [@ocaml.doc ""]
  | POSTGRESQL [@ocaml.doc ""]
  | REDSHIFT [@ocaml.doc ""]
  | ORACLE [@ocaml.doc ""]
  | SYNAPSE [@ocaml.doc ""]
  | SQLSERVER [@ocaml.doc ""]
  | DB2 [@ocaml.doc ""]
  | OPENSEARCH [@ocaml.doc ""]
  | BIGQUERY [@ocaml.doc ""]
  | GOOGLECLOUDSTORAGE [@ocaml.doc ""]
  | HBASE [@ocaml.doc ""]
  | DOCUMENTDB [@ocaml.doc ""]
  | CMDB [@ocaml.doc ""]
  | TPCDS [@ocaml.doc ""]
  | TIMESTREAM [@ocaml.doc ""]
  | SAPHANA [@ocaml.doc ""]
  | SNOWFLAKE [@ocaml.doc ""]
  | DATALAKEGEN2 [@ocaml.doc ""]
  | DB2AS400 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_catalog_status =
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_COMPLETE [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_FAILED_CLEANUP_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_FAILED_CLEANUP_COMPLETE [@ocaml.doc ""]
  | CREATE_FAILED_CLEANUP_FAILED [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_COMPLETE [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_catalog_summary = {
  catalog_name : catalog_name_string option;
      [@ocaml.doc
        "The name of the data catalog. The catalog name is unique for the Amazon Web Services \
         account and can use a maximum of 127 alphanumeric, underscore, at sign, or hyphen \
         characters. The remainder of the length constraint of 256 is reserved for use by Athena.\n"]
  type_ : data_catalog_type option; [@ocaml.doc "The data catalog type.\n"]
  status : data_catalog_status option;
      [@ocaml.doc
        "The status of the creation or deletion of the data catalog.\n\n\
        \ {ul\n\
        \       {-  The [LAMBDA], [GLUE], and [HIVE] data catalog types are created synchronously. \
         Their status is either [CREATE_COMPLETE] or [CREATE_FAILED].\n\
        \           \n\
        \            }\n\
        \       {-  The [FEDERATED] data catalog type is created asynchronously.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Data catalog creation status:\n\
        \   \n\
        \    {ul\n\
        \          {-   [CREATE_IN_PROGRESS]: Federated data catalog creation in progress.\n\
        \              \n\
        \               }\n\
        \          {-   [CREATE_COMPLETE]: Data catalog creation complete.\n\
        \              \n\
        \               }\n\
        \          {-   [CREATE_FAILED]: Data catalog could not be created.\n\
        \              \n\
        \               }\n\
        \          {-   [CREATE_FAILED_CLEANUP_IN_PROGRESS]: Federated data catalog creation \
         failed and is being removed.\n\
        \              \n\
        \               }\n\
        \          {-   [CREATE_FAILED_CLEANUP_COMPLETE]: Federated data catalog creation failed \
         and was removed.\n\
        \              \n\
        \               }\n\
        \          {-   [CREATE_FAILED_CLEANUP_FAILED]: Federated data catalog creation failed but \
         could not be removed.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   Data catalog deletion status:\n\
        \   \n\
        \    {ul\n\
        \          {-   [DELETE_IN_PROGRESS]: Federated data catalog deletion in progress.\n\
        \              \n\
        \               }\n\
        \          {-   [DELETE_COMPLETE]: Federated data catalog deleted.\n\
        \              \n\
        \               }\n\
        \          {-   [DELETE_FAILED]: Federated data catalog could not be deleted.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  connection_type : connection_type option;
      [@ocaml.doc
        "The type of connection for a [FEDERATED] data catalog (for example, [REDSHIFT], [MYSQL], \
         or [SQLSERVER]). For information about individual connectors, see \
         {{:https://docs.aws.amazon.com/athena/latest/ug/connectors-available.html}Available data \
         source connectors}.\n"]
  error : error_message option;
      [@ocaml.doc "Text of the error that occurred during data catalog creation or deletion.\n"]
}
[@@ocaml.doc "The summary information for the data catalog, which includes its name and type.\n"]

type nonrec data_catalog_summary_list = data_catalog_summary list [@@ocaml.doc ""]

type nonrec list_data_catalogs_output = {
  data_catalogs_summary : data_catalog_summary_list option;
      [@ocaml.doc "A summary list of data catalogs.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the NextToken \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec max_data_catalogs_count = int [@@ocaml.doc ""]

type nonrec list_data_catalogs_input = {
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the NextToken \
         from the response object of the previous page call.\n"]
  max_results : max_data_catalogs_count option;
      [@ocaml.doc "Specifies the maximum number of data catalogs to return.\n"]
  work_group : work_group_name option;
      [@ocaml.doc "The name of the workgroup. Required if making an IAM Identity Center request.\n"]
}
[@@ocaml.doc ""]

type nonrec database = {
  name : name_string; [@ocaml.doc "The name of the database.\n"]
  description : description_string option; [@ocaml.doc "An optional description of the database.\n"]
  parameters : parameters_map option; [@ocaml.doc "A set of custom key/value pairs.\n"]
}
[@@ocaml.doc "Contains metadata information for a database in a data catalog.\n"]

type nonrec database_list = database list [@@ocaml.doc ""]

type nonrec list_databases_output = {
  database_list : database_list option; [@ocaml.doc "A list of databases from a data catalog.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the NextToken \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec max_databases_count = int [@@ocaml.doc ""]

type nonrec list_databases_input = {
  catalog_name : catalog_name_string;
      [@ocaml.doc "The name of the data catalog that contains the databases to return.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
  max_results : max_databases_count option;
      [@ocaml.doc "Specifies the maximum number of results to return.\n"]
  work_group : work_group_name option;
      [@ocaml.doc
        "The name of the workgroup for which the metadata is being fetched. Required if requesting \
         an IAM Identity Center enabled Glue Data Catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec capacity_allocation_status =
  | PENDING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec capacity_allocation = {
  status : capacity_allocation_status; [@ocaml.doc "The status of the capacity allocation.\n"]
  status_message : string_ option; [@ocaml.doc "The status message of the capacity allocation.\n"]
  request_time : timestamp; [@ocaml.doc "The time when the capacity allocation was requested.\n"]
  request_completion_time : timestamp option;
      [@ocaml.doc "The time when the capacity allocation request was completed.\n"]
}
[@@ocaml.doc
  "Contains the submission time of a single allocation request for a capacity reservation and the \
   most recent status of the attempted allocation.\n"]

type nonrec capacity_reservation_status =
  | PENDING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CANCELLING [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | UPDATE_PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec capacity_reservation = {
  name : capacity_reservation_name; [@ocaml.doc "The name of the capacity reservation.\n"]
  status : capacity_reservation_status; [@ocaml.doc "The status of the capacity reservation.\n"]
  target_dpus : target_dpus_integer; [@ocaml.doc "The number of data processing units requested.\n"]
  allocated_dpus : allocated_dpus_integer;
      [@ocaml.doc "The number of data processing units currently allocated.\n"]
  last_allocation : capacity_allocation option; [@ocaml.doc ""]
  last_successful_allocation_time : timestamp option;
      [@ocaml.doc "The time of the most recent capacity allocation that succeeded.\n"]
  creation_time : timestamp;
      [@ocaml.doc "The time in UTC epoch millis when the capacity reservation was created.\n"]
}
[@@ocaml.doc
  "A reservation for a specified number of data processing units (DPUs). When a reservation is \
   initially created, it has no DPUs. Athena allocates DPUs until the allocated amount equals the \
   requested amount.\n"]

type nonrec capacity_reservations_list = capacity_reservation list [@@ocaml.doc ""]

type nonrec list_capacity_reservations_output = {
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the NextToken \
         from the response object of the previous page call.\n"]
  capacity_reservations : capacity_reservations_list;
      [@ocaml.doc "The capacity reservations for the current account.\n"]
}
[@@ocaml.doc ""]

type nonrec max_capacity_reservations_count = int [@@ocaml.doc ""]

type nonrec list_capacity_reservations_input = {
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated.\n"]
  max_results : max_capacity_reservations_count option;
      [@ocaml.doc "Specifies the maximum number of results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec calculation_status = {
  submission_date_time : date option;
      [@ocaml.doc "The date and time the calculation was submitted for processing.\n"]
  completion_date_time : date option;
      [@ocaml.doc "The date and time the calculation completed processing.\n"]
  state : calculation_execution_state option;
      [@ocaml.doc
        "The state of the calculation execution. A description of each state follows.\n\n\
        \  [CREATING] - The calculation is in the process of being created.\n\
        \ \n\
        \   [CREATED] - The calculation has been created and is ready to run.\n\
        \  \n\
        \    [QUEUED] - The calculation has been queued for processing.\n\
        \   \n\
        \     [RUNNING] - The calculation is running.\n\
        \    \n\
        \      [CANCELING] - A request to cancel the calculation has been received and the system \
         is working to stop it.\n\
        \     \n\
        \       [CANCELED] - The calculation is no longer running as the result of a cancel request.\n\
        \      \n\
        \        [COMPLETED] - The calculation has completed without error.\n\
        \       \n\
        \         [FAILED] - The calculation failed and is no longer running.\n\
        \        "]
  state_change_reason : description_string option;
      [@ocaml.doc
        "The reason for the calculation state change (for example, the calculation was canceled \
         because the session was terminated).\n"]
}
[@@ocaml.doc "Contains information about the status of a notebook calculation.\n"]

type nonrec calculation_summary = {
  calculation_execution_id : calculation_execution_id option;
      [@ocaml.doc "The calculation execution UUID.\n"]
  description : description_string option; [@ocaml.doc "A description of the calculation.\n"]
  status : calculation_status option;
      [@ocaml.doc "Contains information about the status of the calculation.\n"]
}
[@@ocaml.doc "Summary information for a notebook calculation.\n"]

type nonrec calculations_list = calculation_summary list [@@ocaml.doc ""]

type nonrec list_calculation_executions_response = {
  next_token : session_manager_token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
  calculations : calculations_list option; [@ocaml.doc "A list of [CalculationSummary] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec max_calculations_count = int [@@ocaml.doc ""]

type nonrec list_calculation_executions_request = {
  session_id : session_id; [@ocaml.doc "The session ID.\n"]
  state_filter : calculation_execution_state option;
      [@ocaml.doc
        "A filter for a specific calculation execution state. A description of each state follows.\n\n\
        \  [CREATING] - The calculation is in the process of being created.\n\
        \ \n\
        \   [CREATED] - The calculation has been created and is ready to run.\n\
        \  \n\
        \    [QUEUED] - The calculation has been queued for processing.\n\
        \   \n\
        \     [RUNNING] - The calculation is running.\n\
        \    \n\
        \      [CANCELING] - A request to cancel the calculation has been received and the system \
         is working to stop it.\n\
        \     \n\
        \       [CANCELED] - The calculation is no longer running as the result of a cancel request.\n\
        \      \n\
        \        [COMPLETED] - The calculation has completed without error.\n\
        \       \n\
        \         [FAILED] - The calculation failed and is no longer running.\n\
        \        "]
  max_results : max_calculations_count option;
      [@ocaml.doc "The maximum number of calculation executions to return.\n"]
  next_token : session_manager_token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec supported_dpu_size_list = integer list [@@ocaml.doc ""]

type nonrec application_dpu_sizes = {
  application_runtime_id : name_string option;
      [@ocaml.doc
        "The name of the supported application runtime (for example, [Athena notebook\n\
        \                version 1]).\n"]
  supported_dpu_sizes : supported_dpu_size_list option;
      [@ocaml.doc "A list of the supported DPU sizes that the application runtime supports.\n"]
}
[@@ocaml.doc "Contains the application runtime IDs and their supported DPU sizes.\n"]

type nonrec application_dpu_sizes_list = application_dpu_sizes list [@@ocaml.doc ""]

type nonrec list_application_dpu_sizes_output = {
  application_dpu_sizes : application_dpu_sizes_list option;
      [@ocaml.doc "A list of the supported DPU sizes that the application runtime supports.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec max_application_dpu_sizes_count = int [@@ocaml.doc ""]

type nonrec list_application_dpu_sizes_input = {
  max_results : max_application_dpu_sizes_count option;
      [@ocaml.doc "Specifies the maximum number of results to return.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated.\n"]
}
[@@ocaml.doc ""]

type nonrec import_notebook_output = {
  notebook_id : notebook_id option; [@ocaml.doc "The ID assigned to the imported notebook.\n"]
}
[@@ocaml.doc ""]

type nonrec s3_uri = string [@@ocaml.doc ""]

type nonrec import_notebook_input = {
  work_group : work_group_name;
      [@ocaml.doc "The name of the Spark enabled workgroup to import the notebook to.\n"]
  name : notebook_name; [@ocaml.doc "The name of the notebook to import.\n"]
  payload : payload option;
      [@ocaml.doc "The notebook content to be imported. The payload must be in [ipynb] format.\n"]
  type_ : notebook_type;
      [@ocaml.doc "The notebook content type. Currently, the only valid type is [IPYNB].\n"]
  notebook_s3_location_uri : s3_uri option;
      [@ocaml.doc
        "A URI that specifies the Amazon S3 location of a notebook file in [ipynb] format.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique case-sensitive string used to ensure the request to import the notebook is \
         idempotent (executes only once).\n\n\
        \  This token is listed as not required because Amazon Web Services SDKs (for example the \
         Amazon Web Services SDK for Java) auto-generate the token for you. If you are not using \
         the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token \
         or the action will fail.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec identity_center_instance_arn = string [@@ocaml.doc ""]

type nonrec identity_center_configuration = {
  enable_identity_center : boxed_boolean option;
      [@ocaml.doc "Specifies whether the workgroup is IAM Identity Center supported.\n"]
  identity_center_instance_arn : identity_center_instance_arn option;
      [@ocaml.doc "The IAM Identity Center instance ARN that the workgroup associates to.\n"]
}
[@@ocaml.doc "Specifies whether the workgroup is IAM Identity Center supported.\n"]

type nonrec managed_query_results_configuration = {
  enabled : boolean_;
      [@ocaml.doc
        "If set to true, allows you to store query results in Athena owned storage. If set to \
         false, workgroup member stores query results in location specified under \
         [ResultConfiguration$OutputLocation]. The default is false. A workgroup cannot have the \
         [ResultConfiguration$OutputLocation] parameter when you set this field to true. \n"]
  encryption_configuration : managed_query_results_encryption_configuration option;
      [@ocaml.doc
        "If you encrypt query and calculation results in Athena owned storage, this field \
         indicates the encryption option (for example, SSE_KMS or CSE_KMS) and key information.\n"]
}
[@@ocaml.doc
  " The configuration for storing results in Athena owned storage, which includes whether this \
   feature is enabled; whether encryption configuration, if any, is used for encrypting query \
   results. \n"]

type nonrec work_group_configuration = {
  result_configuration : result_configuration option;
      [@ocaml.doc
        "The configuration for the workgroup, which includes the location in Amazon S3 where query \
         and calculation results are stored and the encryption option, if any, used for query and \
         calculation results. To run the query, you must specify the query results location using \
         one of the ways: either in the workgroup using this setting, or for individual queries \
         (client-side), using [ResultConfiguration$OutputLocation]. If none of them is set, Athena \
         issues an error that no output location is provided.\n"]
  managed_query_results_configuration : managed_query_results_configuration option;
      [@ocaml.doc
        " The configuration for storing results in Athena owned storage, which includes whether \
         this feature is enabled; whether encryption configuration, if any, is used for encrypting \
         query results. \n"]
  enforce_work_group_configuration : boxed_boolean option;
      [@ocaml.doc
        "If set to \"true\", the settings for the workgroup override client-side settings. If set \
         to \"false\", client-side settings are used. This property is not required for Apache \
         Spark enabled workgroups. For more information, see \
         {{:https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html}Workgroup \
         Settings Override Client-Side Settings}.\n"]
  publish_cloud_watch_metrics_enabled : boxed_boolean option;
      [@ocaml.doc "Indicates that the Amazon CloudWatch metrics are enabled for the workgroup.\n"]
  bytes_scanned_cutoff_per_query : bytes_scanned_cutoff_value option;
      [@ocaml.doc
        "The upper data usage limit (cutoff) for the amount of bytes a single query in a workgroup \
         is allowed to scan.\n"]
  requester_pays_enabled : boxed_boolean option;
      [@ocaml.doc
        "If set to [true], allows members assigned to a workgroup to reference Amazon S3 Requester \
         Pays buckets in queries. If set to [false], workgroup members cannot query data from \
         Requester Pays buckets, and queries that retrieve data from Requester Pays buckets cause \
         an error. The default is [false]. For more information about Requester Pays buckets, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html}Requester \
         Pays Buckets} in the {i Amazon Simple Storage Service Developer Guide}.\n"]
  engine_version : engine_version option;
      [@ocaml.doc
        "The engine version that all queries running on the workgroup use. Queries on the \
         [AmazonAthenaPreviewFunctionality] workgroup run on the preview engine regardless of this \
         setting.\n"]
  additional_configuration : name_string option;
      [@ocaml.doc "Specifies a user defined JSON string that is passed to the notebook engine.\n"]
  execution_role : role_arn option;
      [@ocaml.doc
        "The ARN of the execution role used to access user resources for Spark sessions and IAM \
         Identity Center enabled workgroups. This property applies only to Spark enabled \
         workgroups and IAM Identity Center enabled workgroups. The property is required for IAM \
         Identity Center enabled workgroups.\n"]
  monitoring_configuration : monitoring_configuration option;
      [@ocaml.doc
        "Contains the configuration settings for managed log persistence, delivering logs to \
         Amazon S3 buckets, Amazon CloudWatch log groups etc.\n"]
  engine_configuration : engine_configuration option; [@ocaml.doc ""]
  customer_content_encryption_configuration : customer_content_encryption_configuration option;
      [@ocaml.doc
        "Specifies the KMS key that is used to encrypt the user's data stores in Athena. This \
         setting does not apply to Athena SQL workgroups.\n"]
  enable_minimum_encryption_configuration : boxed_boolean option;
      [@ocaml.doc
        "Enforces a minimal level of encryption for the workgroup for query and calculation \
         results that are written to Amazon S3. When enabled, workgroup users can set encryption \
         only to the minimum level set by the administrator or higher when they submit queries.\n\n\
        \ The [EnforceWorkGroupConfiguration] setting takes precedence over the \
         [EnableMinimumEncryptionConfiguration] flag. This means that if \
         [EnforceWorkGroupConfiguration] is true, the [EnableMinimumEncryptionConfiguration] flag \
         is ignored, and the workgroup configuration for encryption is used.\n\
        \ "]
  identity_center_configuration : identity_center_configuration option;
      [@ocaml.doc "Specifies whether the workgroup is IAM Identity Center supported.\n"]
  query_results_s3_access_grants_configuration : query_results_s3_access_grants_configuration option;
      [@ocaml.doc "Specifies whether Amazon S3 access grants are enabled for query results.\n"]
}
[@@ocaml.doc
  "The configuration of the workgroup, which includes the location in Amazon S3 where query and \
   calculation results are stored, the encryption option, if any, used for query and calculation \
   results, whether the Amazon CloudWatch Metrics are enabled for the workgroup and whether \
   workgroup settings override query settings, and the data usage limits for the amount of data \
   scanned per query or per workgroup. The workgroup settings override is specified in \
   [EnforceWorkGroupConfiguration] (true/false) in the [WorkGroupConfiguration]. See \
   [WorkGroupConfiguration$EnforceWorkGroupConfiguration]. \n"]

type nonrec work_group = {
  name : work_group_name; [@ocaml.doc "The workgroup name.\n"]
  state : work_group_state option; [@ocaml.doc "The state of the workgroup: ENABLED or DISABLED.\n"]
  configuration : work_group_configuration option;
      [@ocaml.doc
        "The configuration of the workgroup, which includes the location in Amazon S3 where query \
         and calculation results are stored, the encryption configuration, if any, used for query \
         and calculation results; whether the Amazon CloudWatch Metrics are enabled for the \
         workgroup; whether workgroup settings override client-side settings; and the data usage \
         limits for the amount of data scanned per query or per workgroup. The workgroup settings \
         override is specified in [EnforceWorkGroupConfiguration] (true/false) in the \
         [WorkGroupConfiguration]. See [WorkGroupConfiguration$EnforceWorkGroupConfiguration].\n"]
  description : work_group_description_string option; [@ocaml.doc "The workgroup description.\n"]
  creation_time : date option; [@ocaml.doc "The date and time the workgroup was created.\n"]
  identity_center_application_arn : identity_center_application_arn option;
      [@ocaml.doc
        "The ARN of the IAM Identity Center enabled application associated with the workgroup.\n"]
}
[@@ocaml.doc
  "A workgroup, which contains a name, description, creation time, state, and other configuration, \
   listed under [WorkGroup$Configuration]. Each workgroup enables you to isolate queries for you \
   or your group of users from other queries in the same account, to configure the query results \
   location and the encryption configuration (known as workgroup settings), to enable sending \
   query metrics to Amazon CloudWatch, and to establish per-query data usage control limits for \
   all queries in a workgroup. The workgroup settings override is specified in \
   [EnforceWorkGroupConfiguration] (true/false) in the [WorkGroupConfiguration]. See \
   [WorkGroupConfiguration$EnforceWorkGroupConfiguration].\n"]

type nonrec get_work_group_output = {
  work_group : work_group option; [@ocaml.doc "Information about the workgroup.\n"]
}
[@@ocaml.doc ""]

type nonrec get_work_group_input = {
  work_group : work_group_name; [@ocaml.doc "The name of the workgroup.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_metadata_output = {
  table_metadata : table_metadata option; [@ocaml.doc "An object that contains table metadata.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_metadata_input = {
  catalog_name : catalog_name_string;
      [@ocaml.doc
        "The name of the data catalog that contains the database and table metadata to return.\n"]
  database_name : name_string;
      [@ocaml.doc "The name of the database that contains the table metadata to return.\n"]
  table_name : name_string; [@ocaml.doc "The name of the table for which metadata is returned.\n"]
  work_group : work_group_name option;
      [@ocaml.doc
        "The name of the workgroup for which the metadata is being fetched. Required if requesting \
         an IAM Identity Center enabled Glue Data Catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec get_session_status_response = {
  session_id : session_id option; [@ocaml.doc "The session ID.\n"]
  status : session_status option;
      [@ocaml.doc "Contains information about the status of the session.\n"]
}
[@@ocaml.doc ""]

type nonrec get_session_status_request = {
  session_id : session_id; [@ocaml.doc "The session ID.\n"]
}
[@@ocaml.doc ""]

type nonrec get_session_endpoint_response = {
  endpoint_url : string_; [@ocaml.doc "The endpoint for connecting to the session.\n"]
  auth_token : string_; [@ocaml.doc "Authentication token for the connection\n"]
  auth_token_expiration_time : timestamp; [@ocaml.doc "Expiration time of the auth token.\n"]
}
[@@ocaml.doc ""]

type nonrec get_session_endpoint_request = {
  session_id : session_id; [@ocaml.doc "The session ID.\n"]
}
[@@ocaml.doc ""]

type nonrec session_statistics = {
  dpu_execution_in_millis : long option;
      [@ocaml.doc "The data processing unit execution time for a session in milliseconds.\n"]
}
[@@ocaml.doc "Contains statistics for a session.\n"]

type nonrec session_configuration = {
  execution_role : role_arn option;
      [@ocaml.doc
        "The ARN of the execution role used to access user resources for Spark sessions and \
         Identity Center enabled workgroups. This property applies only to Spark enabled \
         workgroups and Identity Center enabled workgroups.\n"]
  working_directory : result_output_location option;
      [@ocaml.doc "The Amazon S3 location that stores information for the notebook.\n"]
  idle_timeout_seconds : long option; [@ocaml.doc "The idle timeout in seconds for the session.\n"]
  session_idle_timeout_in_minutes : session_idle_timeout_in_minutes option;
      [@ocaml.doc "The idle timeout in seconds for the session.\n"]
  encryption_configuration : encryption_configuration option; [@ocaml.doc ""]
}
[@@ocaml.doc "Contains session configuration information.\n"]

type nonrec get_session_response = {
  session_id : session_id option; [@ocaml.doc "The session ID.\n"]
  description : description_string option; [@ocaml.doc "The session description.\n"]
  work_group : work_group_name option; [@ocaml.doc "The workgroup to which the session belongs.\n"]
  engine_version : name_string option;
      [@ocaml.doc
        "The engine version used by the session (for example, [PySpark engine version\n\
        \                3]). You can get a list of engine versions by calling [ListEngineVersions].\n"]
  engine_configuration : engine_configuration option;
      [@ocaml.doc "Contains engine configuration information like DPU usage.\n"]
  notebook_version : name_string option; [@ocaml.doc "The notebook version.\n"]
  monitoring_configuration : monitoring_configuration option; [@ocaml.doc ""]
  session_configuration : session_configuration option;
      [@ocaml.doc "Contains the workgroup configuration information used by the session.\n"]
  status : session_status option;
      [@ocaml.doc "Contains information about the status of the session.\n"]
  statistics : session_statistics option; [@ocaml.doc "Contains the DPU execution time.\n"]
}
[@@ocaml.doc ""]

type nonrec get_session_request = { session_id : session_id [@ocaml.doc "The session ID.\n"] }
[@@ocaml.doc ""]

type nonrec get_resource_dashboard_response = {
  url : string_; [@ocaml.doc "The Live UI/Persistence UI url for a session.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_dashboard_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc "The The Amazon Resource Name (ARN) for a session.\n"]
}
[@@ocaml.doc ""]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type query_stage_plan_nodes = query_stage_plan_node list [@@ocaml.doc ""]

and query_stage_plan_node = {
  name : string_ option;
      [@ocaml.doc
        "Name of the query stage plan that describes the operation this stage is performing as \
         part of query execution.\n"]
  identifier : string_ option;
      [@ocaml.doc "Information about the operation this query stage plan node is performing.\n"]
  children : query_stage_plan_nodes option;
      [@ocaml.doc
        "Stage plan information such as name, identifier, sub plans, and remote sources of child \
         plan nodes/\n"]
  remote_sources : string_list option; [@ocaml.doc "Source plan node IDs.\n"]
}
[@@ocaml.doc "Stage plan information such as name, identifier, sub plans, and remote sources.\n"]

type query_stages = query_stage list [@@ocaml.doc ""]

and query_stage = {
  stage_id : long option; [@ocaml.doc "The identifier for a stage.\n"]
  state : string_ option; [@ocaml.doc "State of the stage after query execution.\n"]
  output_bytes : long option;
      [@ocaml.doc "The number of bytes output from the stage after execution.\n"]
  output_rows : long option;
      [@ocaml.doc "The number of rows output from the stage after execution.\n"]
  input_bytes : long option;
      [@ocaml.doc "The number of bytes input into the stage for execution.\n"]
  input_rows : long option; [@ocaml.doc "The number of rows input into the stage for execution.\n"]
  execution_time : long option; [@ocaml.doc "Time taken to execute this stage.\n"]
  query_stage_plan : query_stage_plan_node option;
      [@ocaml.doc
        "Stage plan information such as name, identifier, sub plans, and source stages.\n"]
  sub_stages : query_stages option;
      [@ocaml.doc "List of sub query stages that form this stage execution plan.\n"]
}
[@@ocaml.doc
  "Stage statistics such as input and output rows and bytes, execution time and stage state. This \
   information also includes substages and the query stage plan.\n"]

type nonrec query_runtime_statistics_rows = {
  input_rows : long option; [@ocaml.doc "The number of rows read to execute the query.\n"]
  input_bytes : long option; [@ocaml.doc "The number of bytes read to execute the query.\n"]
  output_bytes : long option; [@ocaml.doc "The number of bytes returned by the query.\n"]
  output_rows : long option; [@ocaml.doc "The number of rows returned by the query.\n"]
}
[@@ocaml.doc
  "Statistics such as input rows and bytes read by the query, rows and bytes output by the query, \
   and the number of rows written by the query.\n"]

type nonrec query_runtime_statistics_timeline = {
  query_queue_time_in_millis : long option;
      [@ocaml.doc
        "The number of milliseconds that the query was in your query queue waiting for resources. \
         Note that if transient errors occur, Athena might automatically add the query back to the \
         queue.\n"]
  service_pre_processing_time_in_millis : long option;
      [@ocaml.doc
        " The number of milliseconds that Athena spends on preprocessing before it submits the \
         query to the engine. \n"]
  query_planning_time_in_millis : long option;
      [@ocaml.doc
        "The number of milliseconds that Athena took to plan the query processing flow. This \
         includes the time spent retrieving table partitions from the data source. Note that \
         because the query engine performs the query planning, query planning time is a subset of \
         engine processing time.\n"]
  engine_execution_time_in_millis : long option;
      [@ocaml.doc "The number of milliseconds that the query took to execute.\n"]
  service_processing_time_in_millis : long option;
      [@ocaml.doc
        "The number of milliseconds that Athena took to finalize and publish the query results \
         after the query engine finished running the query.\n"]
  total_execution_time_in_millis : long option;
      [@ocaml.doc "The number of milliseconds that Athena took to run the query.\n"]
}
[@@ocaml.doc
  "Timeline statistics such as query queue time, planning time, execution time, service processing \
   time, and total execution time.\n"]

type nonrec query_runtime_statistics = {
  timeline : query_runtime_statistics_timeline option; [@ocaml.doc ""]
  rows : query_runtime_statistics_rows option; [@ocaml.doc ""]
  output_stage : query_stage option;
      [@ocaml.doc
        "Stage statistics such as input and output rows and bytes, execution time, and stage \
         state. This information also includes substages and the query stage plan.\n"]
}
[@@ocaml.doc
  "The query execution timeline, statistics on input and output rows and bytes, and the different \
   query stages that form the query execution plan.\n"]

type nonrec get_query_runtime_statistics_output = {
  query_runtime_statistics : query_runtime_statistics option;
      [@ocaml.doc "Runtime statistics about the query execution.\n"]
}
[@@ocaml.doc ""]

type nonrec get_query_runtime_statistics_input = {
  query_execution_id : query_execution_id; [@ocaml.doc "The unique ID of the query execution.\n"]
}
[@@ocaml.doc ""]

type nonrec column_nullable =
  | NOT_NULL [@ocaml.doc ""]
  | NULLABLE [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec column_info = {
  catalog_name : string_ option; [@ocaml.doc "The catalog to which the query results belong.\n"]
  schema_name : string_ option;
      [@ocaml.doc "The schema name (database name) to which the query results belong.\n"]
  table_name : string_ option; [@ocaml.doc "The table name for the query results.\n"]
  name : string_; [@ocaml.doc "The name of the column.\n"]
  label : string_ option; [@ocaml.doc "A column label.\n"]
  type_ : string_; [@ocaml.doc "The data type of the column.\n"]
  precision : integer option;
      [@ocaml.doc
        "For [DECIMAL] data types, specifies the total number of digits, up to 38. For performance \
         reasons, we recommend up to 18 digits.\n"]
  scale : integer option;
      [@ocaml.doc
        "For [DECIMAL] data types, specifies the total number of digits in the fractional part of \
         the value. Defaults to 0.\n"]
  nullable : column_nullable option;
      [@ocaml.doc "Unsupported constraint. This value always shows as [UNKNOWN].\n"]
  case_sensitive : boolean_ option;
      [@ocaml.doc "Indicates whether values in the column are case-sensitive.\n"]
}
[@@ocaml.doc "Information about the columns in a query execution result.\n"]

type nonrec column_info_list = column_info list [@@ocaml.doc ""]

type nonrec result_set_metadata = {
  column_info : column_info_list option;
      [@ocaml.doc "Information about the columns returned in a query result metadata.\n"]
}
[@@ocaml.doc
  "The metadata that describes the column structure and data types of a table of query results. To \
   return a [ResultSetMetadata] object, use [GetQueryResults].\n"]

type nonrec datum_string = string [@@ocaml.doc ""]

type nonrec datum = {
  var_char_value : datum_string option; [@ocaml.doc "The value of the datum.\n"]
}
[@@ocaml.doc "A piece of data (a field in the table).\n"]

type nonrec datum_list = datum list [@@ocaml.doc ""]

type nonrec row = {
  data : datum_list option; [@ocaml.doc "The data that populates a row in a query result table.\n"]
}
[@@ocaml.doc "The rows that make up a query result table.\n"]

type nonrec row_list = row list [@@ocaml.doc ""]

type nonrec result_set = {
  rows : row_list option; [@ocaml.doc "The rows in the table.\n"]
  result_set_metadata : result_set_metadata option;
      [@ocaml.doc
        "The metadata that describes the column structure and data types of a table of query \
         results.\n"]
}
[@@ocaml.doc
  "The metadata and rows that make up a query result set. The metadata describes the column \
   structure and data types. To return a [ResultSet] object, use [GetQueryResults].\n"]

type nonrec get_query_results_output = {
  update_count : long option;
      [@ocaml.doc
        "The number of rows inserted with a [CREATE TABLE AS SELECT], [INSERT\n\
        \                INTO], or [UPDATE] statement. \n"]
  result_set : result_set option; [@ocaml.doc "The results of the query execution.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
}
[@@ocaml.doc ""]

type nonrec query_result_type = DATA_MANIFEST [@ocaml.doc ""] | DATA_ROWS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec max_query_results = int [@@ocaml.doc ""]

type nonrec get_query_results_input = {
  query_execution_id : query_execution_id; [@ocaml.doc "The unique ID of the query execution.\n"]
  next_token : token option;
      [@ocaml.doc
        "A token generated by the Athena service that specifies where to continue pagination if a \
         previous request was truncated. To obtain the next set of pages, pass in the [NextToken] \
         from the response object of the previous page call.\n"]
  max_results : max_query_results option;
      [@ocaml.doc "The maximum number of results (rows) to return in this request.\n"]
  query_result_type : query_result_type option;
      [@ocaml.doc
        " When you set this to [DATA_ROWS] or empty, [GetQueryResults] returns the query results \
         in rows. If set to [DATA_MANIFEST], it returns the manifest file in rows. Only the query \
         types [CREATE TABLE AS SELECT], [UNLOAD], and [INSERT] can generate a manifest file. If \
         you use [DATA_MANIFEST] for other query types, the query will fail. \n"]
}
[@@ocaml.doc ""]

type nonrec dpu_count = float [@@ocaml.doc ""]

type nonrec result_reuse_information = {
  reused_previous_result : boolean_;
      [@ocaml.doc
        "True if a previous query result was reused; false if the result was generated from a new \
         run of the query.\n"]
}
[@@ocaml.doc "Contains information about whether the result of a previous query was reused.\n"]

type nonrec query_execution_statistics = {
  engine_execution_time_in_millis : long option;
      [@ocaml.doc "The number of milliseconds that the query took to execute.\n"]
  data_scanned_in_bytes : long option;
      [@ocaml.doc "The number of bytes in the data that was queried.\n"]
  data_manifest_location : string_ option;
      [@ocaml.doc
        "The location and file name of a data manifest file. The manifest file is saved to the \
         Athena query results location in Amazon S3. The manifest file tracks files that the query \
         wrote to Amazon S3. If the query fails, the manifest file also tracks files that the \
         query intended to write. The manifest is useful for identifying orphaned files resulting \
         from a failed query. For more information, see \
         {{:https://docs.aws.amazon.com/athena/latest/ug/querying.html}Working with Query Results, \
         Output Files, and Query History} in the {i Amazon Athena User Guide}.\n"]
  total_execution_time_in_millis : long option;
      [@ocaml.doc "The number of milliseconds that Athena took to run the query.\n"]
  query_queue_time_in_millis : long option;
      [@ocaml.doc
        "The number of milliseconds that the query was in your query queue waiting for resources. \
         Note that if transient errors occur, Athena might automatically add the query back to the \
         queue.\n"]
  service_pre_processing_time_in_millis : long option;
      [@ocaml.doc
        "The number of milliseconds that Athena took to preprocess the query before submitting the \
         query to the query engine.\n"]
  query_planning_time_in_millis : long option;
      [@ocaml.doc
        "The number of milliseconds that Athena took to plan the query processing flow. This \
         includes the time spent retrieving table partitions from the data source. Note that \
         because the query engine performs the query planning, query planning time is a subset of \
         engine processing time.\n"]
  service_processing_time_in_millis : long option;
      [@ocaml.doc
        "The number of milliseconds that Athena took to finalize and publish the query results \
         after the query engine finished running the query.\n"]
  result_reuse_information : result_reuse_information option;
      [@ocaml.doc
        "Contains information about whether previous query results were reused for the query.\n"]
  dpu_count : dpu_count option;
      [@ocaml.doc "The number of Data Processing Units (DPUs) that Athena used to run the query.\n"]
}
[@@ocaml.doc
  "The amount of data scanned during the query execution and the amount of time that it took to \
   execute, and the type of statement that was run.\n"]

type nonrec error_type = int [@@ocaml.doc ""]

type nonrec error_category = int [@@ocaml.doc ""]

type nonrec athena_error = {
  error_category : error_category option;
      [@ocaml.doc
        "An integer value that specifies the category of a query failure error. The following list \
         shows the category for each integer value.\n\n\
        \  {b 1} - System\n\
        \ \n\
        \   {b 2} - User\n\
        \  \n\
        \    {b 3} - Other\n\
        \   "]
  error_type : error_type option;
      [@ocaml.doc
        "An integer value that provides specific information about an Athena query error. For the \
         meaning of specific values, see the \
         {{:https://docs.aws.amazon.com/athena/latest/ug/error-reference.html#error-reference-error-type-reference}Error \
         Type Reference} in the {i Amazon Athena User Guide}.\n"]
  retryable : boolean_ option; [@ocaml.doc "True if the query might succeed if resubmitted.\n"]
  error_message : string_ option;
      [@ocaml.doc "Contains a short description of the error that occurred.\n"]
}
[@@ocaml.doc
  "Provides information about an Athena query error. The [AthenaError] feature provides \
   standardized error information to help you understand failed queries and take steps after a \
   query failure occurs. [AthenaError] includes an [ErrorCategory] field that specifies whether \
   the cause of the failed query is due to system error, user error, or other error.\n"]

type nonrec query_execution_state =
  | QUEUED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec query_execution_status = {
  state : query_execution_state option;
      [@ocaml.doc
        "The state of query execution. [QUEUED] indicates that the query has been submitted to the \
         service, and Athena will execute the query as soon as resources are available. [RUNNING] \
         indicates that the query is in execution phase. [SUCCEEDED] indicates that the query \
         completed without errors. [FAILED] indicates that the query experienced an error and did \
         not complete processing. [CANCELLED] indicates that a user input interrupted query \
         execution.\n\n\
        \  For queries that experience certain transient errors, the state transitions from \
         [RUNNING] back to [QUEUED]. The [FAILED] state is always terminal with no automatic \
         retry. \n\
        \  \n\
        \   "]
  state_change_reason : string_ option;
      [@ocaml.doc "Further detail about the status of the query.\n"]
  submission_date_time : date option;
      [@ocaml.doc "The date and time that the query was submitted.\n"]
  completion_date_time : date option; [@ocaml.doc "The date and time that the query completed.\n"]
  athena_error : athena_error option;
      [@ocaml.doc "Provides information about an Athena query error.\n"]
}
[@@ocaml.doc
  "The completion date, current state, submission time, and state change reason (if applicable) \
   for the query execution.\n"]

type nonrec statement_type = DDL [@ocaml.doc ""] | DML [@ocaml.doc ""] | UTILITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec query_execution = {
  query_execution_id : query_execution_id option;
      [@ocaml.doc "The unique identifier for each query execution.\n"]
  query : query_string option;
      [@ocaml.doc "The SQL query statements which the query execution ran.\n"]
  statement_type : statement_type option;
      [@ocaml.doc
        "The type of query statement that was run. [DDL] indicates DDL query statements. [DML] \
         indicates DML (Data Manipulation Language) query statements, such as [CREATE TABLE AS \
         SELECT]. [UTILITY] indicates query statements other than DDL and DML, such as [SHOW \
         CREATE TABLE], [EXPLAIN], [DESCRIBE], or [SHOW TABLES].\n"]
  managed_query_results_configuration : managed_query_results_configuration option;
      [@ocaml.doc
        " The configuration for storing results in Athena owned storage, which includes whether \
         this feature is enabled; whether encryption configuration, if any, is used for encrypting \
         query results. \n"]
  result_configuration : result_configuration option;
      [@ocaml.doc
        "The location in Amazon S3 where query and calculation results are stored and the \
         encryption option, if any, used for query results. These are known as \"client-side \
         settings\". If workgroup settings override client-side settings, then the query uses the \
         location for the query results and the encryption configuration that are specified for \
         the workgroup.\n"]
  result_reuse_configuration : result_reuse_configuration option;
      [@ocaml.doc "Specifies the query result reuse behavior that was used for the query.\n"]
  query_execution_context : query_execution_context option;
      [@ocaml.doc "The database in which the query execution occurred.\n"]
  status : query_execution_status option;
      [@ocaml.doc
        "The completion date, current state, submission time, and state change reason (if \
         applicable) for the query execution.\n"]
  statistics : query_execution_statistics option;
      [@ocaml.doc
        "Query execution statistics, such as the amount of data scanned, the amount of time that \
         the query took to process, and the type of statement that was run.\n"]
  work_group : work_group_name option;
      [@ocaml.doc "The name of the workgroup in which the query ran.\n"]
  engine_version : engine_version option;
      [@ocaml.doc "The engine version that executed the query.\n"]
  execution_parameters : execution_parameters option;
      [@ocaml.doc
        "A list of values for the parameters in a query. The values are applied sequentially to \
         the parameters in the query in the order in which the parameters occur. The list of \
         parameters is not returned in the response.\n"]
  substatement_type : string_ option; [@ocaml.doc "The kind of query statement that was run.\n"]
  query_results_s3_access_grants_configuration : query_results_s3_access_grants_configuration option;
      [@ocaml.doc "Specifies whether Amazon S3 access grants are enabled for query results.\n"]
}
[@@ocaml.doc "Information about a single instance of a query execution.\n"]

type nonrec get_query_execution_output = {
  query_execution : query_execution option; [@ocaml.doc "Information about the query execution.\n"]
}
[@@ocaml.doc ""]

type nonrec get_query_execution_input = {
  query_execution_id : query_execution_id; [@ocaml.doc "The unique ID of the query execution.\n"]
}
[@@ocaml.doc ""]

type nonrec prepared_statement = {
  statement_name : statement_name option; [@ocaml.doc "The name of the prepared statement.\n"]
  query_statement : query_string option;
      [@ocaml.doc "The query string for the prepared statement.\n"]
  work_group_name : work_group_name option;
      [@ocaml.doc "The name of the workgroup to which the prepared statement belongs.\n"]
  description : description_string option;
      [@ocaml.doc "The description of the prepared statement.\n"]
  last_modified_time : date option;
      [@ocaml.doc "The last modified time of the prepared statement.\n"]
}
[@@ocaml.doc "A prepared SQL statement for use with Athena.\n"]

type nonrec get_prepared_statement_output = {
  prepared_statement : prepared_statement option;
      [@ocaml.doc "The name of the prepared statement that was retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec get_prepared_statement_input = {
  statement_name : statement_name; [@ocaml.doc "The name of the prepared statement to retrieve.\n"]
  work_group : work_group_name;
      [@ocaml.doc "The workgroup to which the statement to be retrieved belongs.\n"]
}
[@@ocaml.doc ""]

type nonrec get_notebook_metadata_output = {
  notebook_metadata : notebook_metadata option;
      [@ocaml.doc "The metadata that is returned for the specified notebook ID.\n"]
}
[@@ocaml.doc ""]

type nonrec get_notebook_metadata_input = {
  notebook_id : notebook_id;
      [@ocaml.doc "The ID of the notebook whose metadata is to be retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec named_query = {
  name : name_string; [@ocaml.doc "The query name.\n"]
  description : description_string option; [@ocaml.doc "The query description.\n"]
  database : database_string; [@ocaml.doc "The database to which the query belongs.\n"]
  query_string : query_string; [@ocaml.doc "The SQL statements that make up the query.\n"]
  named_query_id : named_query_id option; [@ocaml.doc "The unique identifier of the query.\n"]
  work_group : work_group_name option;
      [@ocaml.doc "The name of the workgroup that contains the named query.\n"]
}
[@@ocaml.doc "A query, where [QueryString] contains the SQL statements that make up the query.\n"]

type nonrec get_named_query_output = {
  named_query : named_query option; [@ocaml.doc "Information about the query.\n"]
}
[@@ocaml.doc ""]

type nonrec get_named_query_input = {
  named_query_id : named_query_id;
      [@ocaml.doc "The unique ID of the query. Use [ListNamedQueries] to get query IDs.\n"]
}
[@@ocaml.doc ""]

type nonrec data_catalog = {
  name : catalog_name_string;
      [@ocaml.doc
        "The name of the data catalog. The catalog name must be unique for the Amazon Web Services \
         account and can use a maximum of 127 alphanumeric, underscore, at sign, or hyphen \
         characters. The remainder of the length constraint of 256 is reserved for use by Athena.\n"]
  description : description_string option;
      [@ocaml.doc "An optional description of the data catalog.\n"]
  type_ : data_catalog_type;
      [@ocaml.doc
        "The type of data catalog to create: [LAMBDA] for a federated catalog, [GLUE] for an Glue \
         Data Catalog, and [HIVE] for an external Apache Hive metastore. [FEDERATED] is a \
         federated catalog for which Athena creates the connection and the Lambda function for you \
         based on the parameters that you pass.\n"]
  parameters : parameters_map option;
      [@ocaml.doc
        "Specifies the Lambda function or functions to use for the data catalog. This is a mapping \
         whose values depend on the catalog type. \n\n\
        \ {ul\n\
        \       {-  For the [HIVE] data catalog type, use the following syntax. The \
         [metadata-function] parameter is required. [The\n\
        \                        sdk-version] parameter is optional and defaults to the currently \
         supported version.\n\
        \           \n\
        \             \n\
        \            {[\n\
        \            metadata-function={i lambda_arn}, sdk-version={i version_number} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \       {-  For the [LAMBDA] data catalog type, use one of the following sets of required \
         parameters, but not both.\n\
        \           \n\
        \            {ul\n\
        \                  {-  If you have one Lambda function that processes metadata and another \
         for reading the actual data, use the following syntax. Both parameters are required.\n\
        \                      \n\
        \                        \n\
        \                       {[\n\
        \                       metadata-function={i lambda_arn}, record-function={i lambda_arn} \n\
        \                       ]}\n\
        \                        \n\
        \                       \n\
        \                        }\n\
        \                  {-   If you have a composite Lambda function that processes both \
         metadata and data, use the following syntax to specify your Lambda function.\n\
        \                      \n\
        \                        \n\
        \                       {[\n\
        \                       function={i lambda_arn} \n\
        \                       ]}\n\
        \                        \n\
        \                       \n\
        \                        }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  The [GLUE] type takes a catalog ID parameter and is required. The \n\
        \           {[\n\
        \            {i catalog_id} \n\
        \           ]}\n\
        \            is the account ID of the Amazon Web Services account to which the Glue \
         catalog belongs.\n\
        \           \n\
        \             \n\
        \            {[\n\
        \            catalog-id={i catalog_id} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             {ul\n\
        \                   {-  The [GLUE] data catalog type also applies to the default \
         [AwsDataCatalog] that already exists in your account, of which you can have only one and \
         cannot modify.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \        }\n\
        \         }\n\
        \       {-  The [FEDERATED] data catalog type uses one of the following parameters, but \
         not both. Use [connection-arn] for an existing Glue connection. Use [connection-type] and \
         [connection-properties] to specify the configuration setting for a new connection.\n\
        \           \n\
        \            {ul\n\
        \                  {-   \n\
        \                      {[\n\
        \                      connection-arn:{i } \n\
        \                      ]}\n\
        \                       \n\
        \                      \n\
        \                       }\n\
        \                  {-   \n\
        \                      {[\n\
        \                      connection-type:MYSQL|REDSHIFT|...., connection-properties:\"{i }\"\n\
        \                      ]}\n\
        \                       \n\
        \                      \n\
        \                       For {i  \n\
        \                       {[\n\
        \                       \n\
        \                       ]}\n\
        \                        }, use escaped JSON text, as in the following example.\n\
        \                       \n\
        \                         \
         [\"{\\\"spill_bucket\\\":\\\"my_spill\\\",\\\"spill_prefix\\\":\\\"athena-spill\\\",\\\"host\\\":\\\"abc12345.snowflakecomputing.com\\\",\\\"port\\\":\\\"1234\\\",\\\"warehouse\\\":\\\"DEV_WH\\\",\\\"database\\\":\\\"TEST\\\",\\\"schema\\\":\\\"PUBLIC\\\",\\\"SecretArn\\\":\\\"arn:aws:secretsmanager:ap-south-1:111122223333:secret:snowflake-XHb67j\\\"}\"] \n\
        \                        \n\
        \                         }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \  "]
  status : data_catalog_status option;
      [@ocaml.doc
        "The status of the creation or deletion of the data catalog.\n\n\
        \ {ul\n\
        \       {-  The [LAMBDA], [GLUE], and [HIVE] data catalog types are created synchronously. \
         Their status is either [CREATE_COMPLETE] or [CREATE_FAILED].\n\
        \           \n\
        \            }\n\
        \       {-  The [FEDERATED] data catalog type is created asynchronously.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Data catalog creation status:\n\
        \   \n\
        \    {ul\n\
        \          {-   [CREATE_IN_PROGRESS]: Federated data catalog creation in progress.\n\
        \              \n\
        \               }\n\
        \          {-   [CREATE_COMPLETE]: Data catalog creation complete.\n\
        \              \n\
        \               }\n\
        \          {-   [CREATE_FAILED]: Data catalog could not be created.\n\
        \              \n\
        \               }\n\
        \          {-   [CREATE_FAILED_CLEANUP_IN_PROGRESS]: Federated data catalog creation \
         failed and is being removed.\n\
        \              \n\
        \               }\n\
        \          {-   [CREATE_FAILED_CLEANUP_COMPLETE]: Federated data catalog creation failed \
         and was removed.\n\
        \              \n\
        \               }\n\
        \          {-   [CREATE_FAILED_CLEANUP_FAILED]: Federated data catalog creation failed but \
         could not be removed.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   Data catalog deletion status:\n\
        \   \n\
        \    {ul\n\
        \          {-   [DELETE_IN_PROGRESS]: Federated data catalog deletion in progress.\n\
        \              \n\
        \               }\n\
        \          {-   [DELETE_COMPLETE]: Federated data catalog deleted.\n\
        \              \n\
        \               }\n\
        \          {-   [DELETE_FAILED]: Federated data catalog could not be deleted.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  connection_type : connection_type option;
      [@ocaml.doc
        "The type of connection for a [FEDERATED] data catalog (for example, [REDSHIFT], [MYSQL], \
         or [SQLSERVER]). For information about individual connectors, see \
         {{:https://docs.aws.amazon.com/athena/latest/ug/connectors-available.html}Available data \
         source connectors}.\n"]
  error : error_message option;
      [@ocaml.doc "Text of the error that occurred during data catalog creation or deletion.\n"]
}
[@@ocaml.doc
  "Contains information about a data catalog in an Amazon Web Services account.\n\n\
  \  In the Athena console, data catalogs are listed as \"data sources\" on the {b Data sources} \
   page under the {b Data source name} column.\n\
  \  \n\
  \   "]

type nonrec get_data_catalog_output = {
  data_catalog : data_catalog option; [@ocaml.doc "The data catalog returned.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_catalog_input = {
  name : catalog_name_string; [@ocaml.doc "The name of the data catalog to return.\n"]
  work_group : work_group_name option;
      [@ocaml.doc "The name of the workgroup. Required if making an IAM Identity Center request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_database_output = {
  database : database option; [@ocaml.doc "The database returned.\n"]
}
[@@ocaml.doc ""]

type nonrec get_database_input = {
  catalog_name : catalog_name_string;
      [@ocaml.doc "The name of the data catalog that contains the database to return.\n"]
  database_name : name_string; [@ocaml.doc "The name of the database to return.\n"]
  work_group : work_group_name option;
      [@ocaml.doc
        "The name of the workgroup for which the metadata is being fetched. Required if requesting \
         an IAM Identity Center enabled Glue Data Catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec get_capacity_reservation_output = {
  capacity_reservation : capacity_reservation;
      [@ocaml.doc "The requested capacity reservation structure.\n"]
}
[@@ocaml.doc ""]

type nonrec get_capacity_reservation_input = {
  name : capacity_reservation_name; [@ocaml.doc "The name of the capacity reservation.\n"]
}
[@@ocaml.doc ""]

type nonrec capacity_assignment_configuration = {
  capacity_reservation_name : capacity_reservation_name option;
      [@ocaml.doc
        "The name of the reservation that the capacity assignment configuration is for.\n"]
  capacity_assignments : capacity_assignments_list option;
      [@ocaml.doc "The list of assignments that make up the capacity assignment configuration.\n"]
}
[@@ocaml.doc
  "Assigns Athena workgroups (and hence their queries) to capacity reservations. A capacity \
   reservation can have only one capacity assignment configuration, but the capacity assignment \
   configuration can be made up of multiple individual assignments. Each assignment specifies how \
   Athena queries can consume capacity from the capacity reservation that their workgroup is \
   mapped to.\n"]

type nonrec get_capacity_assignment_configuration_output = {
  capacity_assignment_configuration : capacity_assignment_configuration;
      [@ocaml.doc
        "The requested capacity assignment configuration for the specified capacity reservation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_capacity_assignment_configuration_input = {
  capacity_reservation_name : capacity_reservation_name;
      [@ocaml.doc
        "The name of the capacity reservation to retrieve the capacity assignment configuration for.\n"]
}
[@@ocaml.doc ""]

type nonrec calculation_statistics = {
  dpu_execution_in_millis : long option;
      [@ocaml.doc "The data processing unit execution time in milliseconds for the calculation.\n"]
  progress : description_string option; [@ocaml.doc "The progress of the calculation.\n"]
}
[@@ocaml.doc "Contains statistics for a notebook calculation.\n"]

type nonrec get_calculation_execution_status_response = {
  status : calculation_status option;
      [@ocaml.doc "Contains information about the calculation execution status.\n"]
  statistics : calculation_statistics option;
      [@ocaml.doc "Contains information about the DPU execution time and progress.\n"]
}
[@@ocaml.doc ""]

type nonrec get_calculation_execution_status_request = {
  calculation_execution_id : calculation_execution_id;
      [@ocaml.doc "The calculation execution UUID.\n"]
}
[@@ocaml.doc ""]

type nonrec get_calculation_execution_code_response = {
  code_block : code_block option;
      [@ocaml.doc "The unencrypted code that was executed for the calculation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_calculation_execution_code_request = {
  calculation_execution_id : calculation_execution_id;
      [@ocaml.doc "The calculation execution UUID.\n"]
}
[@@ocaml.doc ""]

type nonrec calculation_result_type = string [@@ocaml.doc ""]

type nonrec calculation_result = {
  std_out_s3_uri : s3_uri option;
      [@ocaml.doc "The Amazon S3 location of the [stdout] file for the calculation.\n"]
  std_error_s3_uri : s3_uri option;
      [@ocaml.doc
        "The Amazon S3 location of the [stderr] error messages file for the calculation.\n"]
  result_s3_uri : s3_uri option;
      [@ocaml.doc "The Amazon S3 location of the folder for the calculation results.\n"]
  result_type : calculation_result_type option;
      [@ocaml.doc "The data format of the calculation result.\n"]
}
[@@ocaml.doc "Contains information about an application-specific calculation result.\n"]

type nonrec get_calculation_execution_response = {
  calculation_execution_id : calculation_execution_id option;
      [@ocaml.doc "The calculation execution UUID.\n"]
  session_id : session_id option; [@ocaml.doc "The session ID that the calculation ran in.\n"]
  description : description_string option;
      [@ocaml.doc "The description of the calculation execution.\n"]
  working_directory : s3_uri option;
      [@ocaml.doc "The Amazon S3 location in which calculation results are stored.\n"]
  status : calculation_status option;
      [@ocaml.doc "Contains information about the status of the calculation.\n"]
  statistics : calculation_statistics option;
      [@ocaml.doc
        "Contains information about the data processing unit (DPU) execution time and progress. \
         This field is populated only when statistics are available.\n"]
  result_ : calculation_result option;
      [@ocaml.doc
        "Contains result information. This field is populated only if the calculation is completed.\n"]
}
[@@ocaml.doc ""]

type nonrec get_calculation_execution_request = {
  calculation_execution_id : calculation_execution_id;
      [@ocaml.doc "The calculation execution UUID.\n"]
}
[@@ocaml.doc ""]

type nonrec export_notebook_output = {
  notebook_metadata : notebook_metadata option;
      [@ocaml.doc
        "The notebook metadata, including notebook ID, notebook name, and workgroup name.\n"]
  payload : payload option; [@ocaml.doc "The content of the exported notebook.\n"]
}
[@@ocaml.doc ""]

type nonrec export_notebook_input = {
  notebook_id : notebook_id; [@ocaml.doc "The ID of the notebook to export.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_work_group_output = unit [@@ocaml.doc ""]

type nonrec delete_work_group_input = {
  work_group : work_group_name; [@ocaml.doc "The unique name of the workgroup to delete.\n"]
  recursive_delete_option : boxed_boolean option;
      [@ocaml.doc
        "The option to delete the workgroup and its contents even if the workgroup contains any \
         named queries, query executions, or notebooks.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_prepared_statement_output = unit [@@ocaml.doc ""]

type nonrec delete_prepared_statement_input = {
  statement_name : statement_name; [@ocaml.doc "The name of the prepared statement to delete.\n"]
  work_group : work_group_name;
      [@ocaml.doc "The workgroup to which the statement to be deleted belongs.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_notebook_output = unit [@@ocaml.doc ""]

type nonrec delete_notebook_input = {
  notebook_id : notebook_id; [@ocaml.doc "The ID of the notebook to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_named_query_output = unit [@@ocaml.doc ""]

type nonrec delete_named_query_input = {
  named_query_id : named_query_id; [@ocaml.doc "The unique ID of the query to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_data_catalog_output = { data_catalog : data_catalog option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec delete_data_catalog_input = {
  name : catalog_name_string; [@ocaml.doc "The name of the data catalog to delete.\n"]
  delete_catalog_only : boolean_ option;
      [@ocaml.doc
        "Deletes the Athena Data Catalog. You can only use this with the [FEDERATED] catalogs. You \
         usually perform this before registering the connector with Glue Data Catalog. After \
         deletion, you will have to manage the Glue Connection and Lambda function. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_capacity_reservation_output = unit [@@ocaml.doc ""]

type nonrec delete_capacity_reservation_input = {
  name : capacity_reservation_name; [@ocaml.doc "The name of the capacity reservation to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_work_group_output = unit [@@ocaml.doc ""]

type nonrec create_work_group_input = {
  name : work_group_name; [@ocaml.doc "The workgroup name.\n"]
  configuration : work_group_configuration option;
      [@ocaml.doc
        "Contains configuration information for creating an Athena SQL workgroup or Spark enabled \
         Athena workgroup. Athena SQL workgroup configuration includes the location in Amazon S3 \
         where query and calculation results are stored, the encryption configuration, if any, \
         used for encrypting query results, whether the Amazon CloudWatch Metrics are enabled for \
         the workgroup, the limit for the amount of bytes scanned (cutoff) per query, if it is \
         specified, and whether workgroup's settings (specified with \
         [EnforceWorkGroupConfiguration]) in the [WorkGroupConfiguration] override client-side \
         settings. See [WorkGroupConfiguration$EnforceWorkGroupConfiguration].\n"]
  description : work_group_description_string option; [@ocaml.doc "The workgroup description.\n"]
  tags : tag_list option;
      [@ocaml.doc "A list of comma separated tags to add to the workgroup that is created.\n"]
}
[@@ocaml.doc ""]

type nonrec auth_token = string [@@ocaml.doc ""]

type nonrec create_presigned_notebook_url_response = {
  notebook_url : string_;
      [@ocaml.doc
        "The URL of the notebook. The URL includes the authentication token and notebook file name \
         and points directly to the opened notebook.\n"]
  auth_token : auth_token; [@ocaml.doc "The authentication token for the notebook.\n"]
  auth_token_expiration_time : long;
      [@ocaml.doc "The UTC epoch time when the authentication token expires.\n"]
}
[@@ocaml.doc ""]

type nonrec create_presigned_notebook_url_request = {
  session_id : session_id; [@ocaml.doc "The session ID.\n"]
}
[@@ocaml.doc ""]

type nonrec create_prepared_statement_output = unit [@@ocaml.doc ""]

type nonrec create_prepared_statement_input = {
  statement_name : statement_name; [@ocaml.doc "The name of the prepared statement.\n"]
  work_group : work_group_name;
      [@ocaml.doc "The name of the workgroup to which the prepared statement belongs.\n"]
  query_statement : query_string; [@ocaml.doc "The query string for the prepared statement.\n"]
  description : description_string option;
      [@ocaml.doc "The description of the prepared statement.\n"]
}
[@@ocaml.doc ""]

type nonrec create_notebook_output = {
  notebook_id : notebook_id option; [@ocaml.doc "A unique identifier for the notebook.\n"]
}
[@@ocaml.doc ""]

type nonrec create_notebook_input = {
  work_group : work_group_name;
      [@ocaml.doc
        "The name of the Spark enabled workgroup in which the notebook will be created.\n"]
  name : notebook_name;
      [@ocaml.doc
        "The name of the [ipynb] file to be created in the Spark workgroup, without the [.ipynb] \
         extension.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique case-sensitive string used to ensure the request to create the notebook is \
         idempotent (executes only once).\n\n\
        \  This token is listed as not required because Amazon Web Services SDKs (for example the \
         Amazon Web Services SDK for Java) auto-generate the token for you. If you are not using \
         the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token \
         or the action will fail.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_named_query_output = {
  named_query_id : named_query_id option; [@ocaml.doc "The unique ID of the query.\n"]
}
[@@ocaml.doc ""]

type nonrec create_named_query_input = {
  name : name_string; [@ocaml.doc "The query name.\n"]
  description : description_string option; [@ocaml.doc "The query description.\n"]
  database : database_string; [@ocaml.doc "The database to which the query belongs.\n"]
  query_string : query_string; [@ocaml.doc "The contents of the query with all query statements.\n"]
  client_request_token : idempotency_token option;
      [@ocaml.doc
        "A unique case-sensitive string used to ensure the request to create the query is \
         idempotent (executes only once). If another [CreateNamedQuery] request is received, the \
         same response is returned and another query is not created. If a parameter has changed, \
         for example, the [QueryString], an error is returned.\n\n\
        \  This token is listed as not required because Amazon Web Services SDKs (for example the \
         Amazon Web Services SDK for Java) auto-generate the token for users. If you are not using \
         the Amazon Web Services SDK or the Amazon Web Services CLI, you must provide this token \
         or the action will fail.\n\
        \  \n\
        \   "]
  work_group : work_group_name option;
      [@ocaml.doc "The name of the workgroup in which the named query is being created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_catalog_output = { data_catalog : data_catalog option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec create_data_catalog_input = {
  name : catalog_name_string;
      [@ocaml.doc
        "The name of the data catalog to create. The catalog name must be unique for the Amazon \
         Web Services account and can use a maximum of 127 alphanumeric, underscore, at sign, or \
         hyphen characters. The remainder of the length constraint of 256 is reserved for use by \
         Athena.\n\n\
        \ For [FEDERATED] type the catalog name has following considerations and limits:\n\
        \ \n\
        \  {ul\n\
        \        {-  The catalog name allows special characters such as [_ , @ , \\ , -\n\
        \                    ]. These characters are replaced with a hyphen (-) when creating the \
         CFN Stack Name and with an underscore (_) when creating the Lambda Function and Glue \
         Connection Name.\n\
        \            \n\
        \             }\n\
        \        {-  The catalog name has a theoretical limit of 128 characters. However, since we \
         use it to create other resources that allow less characters and we prepend a prefix to \
         it, the actual catalog name limit for [FEDERATED] catalog is 64 - 23 = 41 characters.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  type_ : data_catalog_type;
      [@ocaml.doc
        "The type of data catalog to create: [LAMBDA] for a federated catalog, [GLUE] for an Glue \
         Data Catalog, and [HIVE] for an external Apache Hive metastore. [FEDERATED] is a \
         federated catalog for which Athena creates the connection and the Lambda function for you \
         based on the parameters that you pass.\n\n\
        \ For [FEDERATED] type, we do not support IAM identity center.\n\
        \ "]
  description : description_string option;
      [@ocaml.doc "A description of the data catalog to be created.\n"]
  parameters : parameters_map option;
      [@ocaml.doc
        "Specifies the Lambda function or functions to use for creating the data catalog. This is \
         a mapping whose values depend on the catalog type. \n\n\
        \ {ul\n\
        \       {-  For the [HIVE] data catalog type, use the following syntax. The \
         [metadata-function] parameter is required. [The\n\
        \                        sdk-version] parameter is optional and defaults to the currently \
         supported version.\n\
        \           \n\
        \             \n\
        \            {[\n\
        \            metadata-function={i lambda_arn}, sdk-version={i version_number} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \       {-  For the [LAMBDA] data catalog type, use one of the following sets of required \
         parameters, but not both.\n\
        \           \n\
        \            {ul\n\
        \                  {-  If you have one Lambda function that processes metadata and another \
         for reading the actual data, use the following syntax. Both parameters are required.\n\
        \                      \n\
        \                        \n\
        \                       {[\n\
        \                       metadata-function={i lambda_arn}, record-function={i lambda_arn} \n\
        \                       ]}\n\
        \                        \n\
        \                       \n\
        \                        }\n\
        \                  {-   If you have a composite Lambda function that processes both \
         metadata and data, use the following syntax to specify your Lambda function.\n\
        \                      \n\
        \                        \n\
        \                       {[\n\
        \                       function={i lambda_arn} \n\
        \                       ]}\n\
        \                        \n\
        \                       \n\
        \                        }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  The [GLUE] type takes a catalog ID parameter and is required. The \n\
        \           {[\n\
        \            {i catalog_id} \n\
        \           ]}\n\
        \            is the account ID of the Amazon Web Services account to which the Glue Data \
         Catalog belongs.\n\
        \           \n\
        \             \n\
        \            {[\n\
        \            catalog-id={i catalog_id} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             {ul\n\
        \                   {-  The [GLUE] data catalog type also applies to the default \
         [AwsDataCatalog] that already exists in your account, of which you can have only one and \
         cannot modify.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \        }\n\
        \         }\n\
        \       {-  The [FEDERATED] data catalog type uses one of the following parameters, but \
         not both. Use [connection-arn] for an existing Glue connection. Use [connection-type] and \
         [connection-properties] to specify the configuration setting for a new connection.\n\
        \           \n\
        \            {ul\n\
        \                  {-   \n\
        \                      {[\n\
        \                      connection-arn:{i } \n\
        \                      ]}\n\
        \                       \n\
        \                      \n\
        \                       }\n\
        \                  {-   [lambda-role-arn] (optional): The execution role to use for the \
         Lambda function. If not provided, one is created.\n\
        \                      \n\
        \                       }\n\
        \                  {-   \n\
        \                      {[\n\
        \                      connection-type:MYSQL|REDSHIFT|...., connection-properties:\"{i }\"\n\
        \                      ]}\n\
        \                       \n\
        \                      \n\
        \                       For {i  \n\
        \                       {[\n\
        \                       \n\
        \                       ]}\n\
        \                        }, use escaped JSON text, as in the following example.\n\
        \                       \n\
        \                         \
         [\"{\\\"spill_bucket\\\":\\\"my_spill\\\",\\\"spill_prefix\\\":\\\"athena-spill\\\",\\\"host\\\":\\\"abc12345.snowflakecomputing.com\\\",\\\"port\\\":\\\"1234\\\",\\\"warehouse\\\":\\\"DEV_WH\\\",\\\"database\\\":\\\"TEST\\\",\\\"schema\\\":\\\"PUBLIC\\\",\\\"SecretArn\\\":\\\"arn:aws:secretsmanager:ap-south-1:111122223333:secret:snowflake-XHb67j\\\"}\"] \n\
        \                        \n\
        \                         }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of comma separated tags to add to the data catalog that is created. All the \
         resources that are created by the [CreateDataCatalog] API operation with [FEDERATED] type \
         will have the tag [federated_athena_datacatalog=\"true\"]. This includes the CFN Stack, \
         Glue Connection, Athena DataCatalog, and all the resources created as part of the CFN \
         Stack (Lambda Function, IAM policies/roles).\n"]
}
[@@ocaml.doc ""]

type nonrec create_capacity_reservation_output = unit [@@ocaml.doc ""]

type nonrec create_capacity_reservation_input = {
  target_dpus : target_dpus_integer; [@ocaml.doc "The number of requested data processing units.\n"]
  name : capacity_reservation_name; [@ocaml.doc "The name of the capacity reservation to create.\n"]
  tags : tag_list option; [@ocaml.doc "The tags for the capacity reservation.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_capacity_reservation_output = unit [@@ocaml.doc ""]

type nonrec cancel_capacity_reservation_input = {
  name : capacity_reservation_name; [@ocaml.doc "The name of the capacity reservation to cancel.\n"]
}
[@@ocaml.doc ""]

type nonrec unprocessed_query_execution_id = {
  query_execution_id : query_execution_id option;
      [@ocaml.doc "The unique identifier of the query execution.\n"]
  error_code : error_code option;
      [@ocaml.doc
        "The error code returned when the query execution failed to process, if applicable.\n"]
  error_message : error_message option;
      [@ocaml.doc
        "The error message returned when the query execution failed to process, if applicable.\n"]
}
[@@ocaml.doc "Describes a query execution that failed to process.\n"]

type nonrec unprocessed_query_execution_id_list = unprocessed_query_execution_id list
[@@ocaml.doc ""]

type nonrec query_execution_list = query_execution list [@@ocaml.doc ""]

type nonrec batch_get_query_execution_output = {
  query_executions : query_execution_list option;
      [@ocaml.doc "Information about a query execution.\n"]
  unprocessed_query_execution_ids : unprocessed_query_execution_id_list option;
      [@ocaml.doc "Information about the query executions that failed to run.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_query_execution_input = {
  query_execution_ids : query_execution_id_list; [@ocaml.doc "An array of query execution IDs.\n"]
}
[@@ocaml.doc "Contains an array of query execution IDs.\n"]

type nonrec unprocessed_prepared_statement_name = {
  statement_name : statement_name option;
      [@ocaml.doc "The name of a prepared statement that could not be returned due to an error.\n"]
  error_code : error_code option;
      [@ocaml.doc "The error code returned when the request for the prepared statement failed.\n"]
  error_message : error_message option;
      [@ocaml.doc
        "The error message containing the reason why the prepared statement could not be returned. \
         The following error messages are possible:\n\n\
        \ {ul\n\
        \       {-   [INVALID_INPUT] - The name of the prepared statement that was provided is not \
         valid (for example, the name is too long).\n\
        \           \n\
        \            }\n\
        \       {-   [STATEMENT_NOT_FOUND] - A prepared statement with the name provided could not \
         be found.\n\
        \           \n\
        \            }\n\
        \       {-   [UNAUTHORIZED] - The requester does not have permission to access the \
         workgroup that contains the prepared statement.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The name of a prepared statement that could not be returned.\n"]

type nonrec unprocessed_prepared_statement_name_list = unprocessed_prepared_statement_name list
[@@ocaml.doc ""]

type nonrec prepared_statement_details_list = prepared_statement list [@@ocaml.doc ""]

type nonrec batch_get_prepared_statement_output = {
  prepared_statements : prepared_statement_details_list option;
      [@ocaml.doc "The list of prepared statements returned.\n"]
  unprocessed_prepared_statement_names : unprocessed_prepared_statement_name_list option;
      [@ocaml.doc
        "A list of one or more prepared statements that were requested but could not be returned.\n"]
}
[@@ocaml.doc ""]

type nonrec prepared_statement_name_list = statement_name list [@@ocaml.doc ""]

type nonrec batch_get_prepared_statement_input = {
  prepared_statement_names : prepared_statement_name_list;
      [@ocaml.doc "A list of prepared statement names to return.\n"]
  work_group : work_group_name;
      [@ocaml.doc "The name of the workgroup to which the prepared statements belong.\n"]
}
[@@ocaml.doc ""]

type nonrec unprocessed_named_query_id = {
  named_query_id : named_query_id option; [@ocaml.doc "The unique identifier of the named query.\n"]
  error_code : error_code option;
      [@ocaml.doc
        "The error code returned when the processing request for the named query failed, if \
         applicable.\n"]
  error_message : error_message option;
      [@ocaml.doc
        "The error message returned when the processing request for the named query failed, if \
         applicable.\n"]
}
[@@ocaml.doc "Information about a named query ID that could not be processed.\n"]

type nonrec unprocessed_named_query_id_list = unprocessed_named_query_id list [@@ocaml.doc ""]

type nonrec named_query_list = named_query list [@@ocaml.doc ""]

type nonrec batch_get_named_query_output = {
  named_queries : named_query_list option;
      [@ocaml.doc "Information about the named query IDs submitted.\n"]
  unprocessed_named_query_ids : unprocessed_named_query_id_list option;
      [@ocaml.doc "Information about provided query IDs.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_named_query_input = {
  named_query_ids : named_query_id_list; [@ocaml.doc "An array of query IDs.\n"]
}
[@@ocaml.doc "Contains an array of named query IDs.\n"]
