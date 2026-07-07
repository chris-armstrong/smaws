open Types

module AssociateKmsKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_kms_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_kms_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified KMS key with either one log group in the account, or with all stored \
   CloudWatch Logs query insights results in the account.\n\n\
  \ When you use [AssociateKmsKey], you specify either the [logGroupName] parameter or the \
   [resourceIdentifier] parameter. You can't specify both of those parameters in the same \
   operation.\n\
  \ \n\
  \  {ul\n\
  \        {-  Specify the [logGroupName] parameter to cause log events ingested into that log \
   group to be encrypted with that key. Only the log events ingested after the key is associated \
   are encrypted with that key.\n\
  \            \n\
  \             Associating a KMS key with a log group overrides any existing associations between \
   the log group and a KMS key. After a KMS key is associated with a log group, all newly ingested \
   data for the log group is encrypted using the KMS key. This association is stored as long as \
   the data encrypted with the KMS key is still within CloudWatch Logs. This enables CloudWatch \
   Logs to decrypt this data whenever it is requested.\n\
  \             \n\
  \              Associating a key with a log group does not cause the results of queries of that \
   log group to be encrypted with that key. To have query results encrypted with a KMS key, you \
   must use an [AssociateKmsKey] operation with the [resourceIdentifier] parameter that specifies \
   a [query-result] resource. \n\
  \              \n\
  \               }\n\
  \        {-  Specify the [resourceIdentifier] parameter with a [query-result] resource, to use \
   that key to encrypt the stored results of all future \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html}StartQuery} \
   operations in the account. The response from a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html}GetQueryResults} \
   operation will still return the query results in plain text.\n\
  \            \n\
  \             Even if you have not associated a key with your query results, the query results \
   are encrypted when stored, using the default CloudWatch Logs method.\n\
  \             \n\
  \              If you run a query from a monitoring account that queries logs in a source \
   account, the query results key from the monitoring account, if any, is used.\n\
  \              \n\
  \               }\n\
  \        }\n\
  \    If you delete the key that is used to encrypt log events or log group query results, then \
   all the associated stored log events or query results that were encrypted with that key will be \
   unencryptable and unusable.\n\
  \    \n\
  \       CloudWatch Logs supports only symmetric KMS keys. Do not associate an asymmetric KMS key \
   with your log group or query results. For more information, see \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Using \
   Symmetric and Asymmetric Keys}.\n\
  \       \n\
  \         It can take up to 5 minutes for this operation to take effect.\n\
  \         \n\
  \          If you attempt to associate a KMS key with a log group but the KMS key does not exist \
   or the KMS key is disabled, you receive an [InvalidParameterException] error. \n\
  \          "]

module AssociateSourceToS3TableIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_source_to_s3_table_integration_request ->
    ( associate_source_to_s3_table_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_source_to_s3_table_integration_request ->
    ( associate_source_to_s3_table_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a data source with an S3 Table Integration for query access in the 'logs' namespace. \
   This enables querying log data using analytics engines that support Iceberg such as Amazon \
   Athena, Amazon Redshift, and Apache Spark.\n"]

module CancelExportTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_export_task_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_export_task_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels the specified export task.\n\n The task must be in the [PENDING] or [RUNNING] state.\n "]

module CancelImportTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_import_task_request ->
    ( cancel_import_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_import_task_request ->
    ( cancel_import_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels an active import task and stops importing data from the CloudTrail Lake Event Data Store.\n"]

module CreateDelivery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_delivery_request ->
    ( create_delivery_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_delivery_request ->
    ( create_delivery_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a {i delivery}. A delivery is a connection between a logical {i delivery source} and a \
   logical {i delivery destination} that you have already created.\n\n\
  \ Only some Amazon Web Services services support being configured as a delivery source using \
   this operation. These services are listed as {b Supported \\[V2 Permissions\\]} in the table at \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html}Enabling \
   logging from Amazon Web Services services.} \n\
  \ \n\
  \  A delivery destination can represent a log group in CloudWatch Logs, an Amazon S3 bucket, a \
   delivery stream in Firehose, or X-Ray.\n\
  \  \n\
  \   To configure logs delivery between a supported Amazon Web Services service and a \
   destination, you must do the following:\n\
  \   \n\
  \    {ul\n\
  \          {-  Create a delivery source, which is a logical object that represents the resource \
   that is actually sending the logs. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html}PutDeliverySource}.\n\
  \              \n\
  \               }\n\
  \          {-  Create a {i delivery destination}, which is a logical object that represents the \
   actual delivery destination. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html}PutDeliveryDestination}.\n\
  \              \n\
  \               }\n\
  \          {-  If you are delivering logs cross-account, you must use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html}PutDeliveryDestinationPolicy} \
   in the destination account to assign an IAM policy to the destination. This policy allows \
   delivery to that destination. \n\
  \              \n\
  \               }\n\
  \          {-  Use [CreateDelivery] to create a {i delivery} by pairing exactly one delivery \
   source and one delivery destination. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   You can configure a single delivery source to send logs to multiple destinations by creating \
   multiple deliveries. You can also create multiple deliveries to configure multiple delivery \
   sources to send logs to the same delivery destination.\n\
  \   \n\
  \    To update an existing delivery configuration, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html}UpdateDeliveryConfiguration}.\n\
  \    "]

module CreateExportTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_export_task_request ->
    ( create_export_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_export_task_request ->
    ( create_export_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an export task so that you can efficiently export data from a log group to an Amazon S3 \
   bucket. When you perform a [CreateExportTask] operation, you must use credentials that have \
   permission to write to the S3 bucket that you specify as the destination.\n\n\
  \ Exporting log data to S3 buckets that are encrypted by KMS is supported. Exporting log data to \
   Amazon S3 buckets that have S3 Object Lock enabled with a retention period is also supported.\n\
  \ \n\
  \  Exporting to S3 buckets that are encrypted with AES-256 is supported. \n\
  \  \n\
  \   This is an asynchronous call. If all the required information is provided, this operation \
   initiates an export task and responds with the ID of the task. After the task has started, you \
   can use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeExportTasks.html}DescribeExportTasks} \
   to get the status of the export task. Each account can only have one active ([RUNNING] or \
   [PENDING]) export task at a time. To cancel an export task, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CancelExportTask.html}CancelExportTask}.\n\
  \   \n\
  \    You can export logs from multiple log groups or multiple time ranges to the same S3 bucket. \
   To separate log data for each export task, specify a prefix to be used as the Amazon S3 key \
   prefix for all exported objects.\n\
  \    \n\
  \      We recommend that you don't regularly export to Amazon S3 as a way to continuously \
   archive your logs. For that use case, we instead recommend that you use subscriptions. For more \
   information about subscriptions, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions.html}Real-time \
   processing of log data with subscriptions}.\n\
  \      \n\
  \         Time-based sorting on chunks of log data inside an exported file is not guaranteed. \
   You can sort the exported log field data by using Linux utilities.\n\
  \         \n\
  \          "]

module CreateImportTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_import_task_request ->
    ( create_import_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_import_task_request ->
    ( create_import_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an import from a data source to CloudWatch Log and creates a managed log group as the \
   destination for the imported data. Currently, \
   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-event-data-store.html}CloudTrail \
   Event Data Store} is the only supported data source. \n\n\
  \ The import task must satisfy the following constraints:\n\
  \ \n\
  \  {ul\n\
  \        {-  The specified source must be in an ACTIVE state.\n\
  \            \n\
  \             }\n\
  \        {-  The API caller must have permissions to access the data in the provided source and \
   to perform iam:PassRole on the provided import role which has the same permissions, as \
   described below.\n\
  \            \n\
  \             }\n\
  \        {-  The provided IAM role must trust the \"cloudtrail.amazonaws.com\" principal and \
   have the following permissions:\n\
  \            \n\
  \             {ul\n\
  \                   {-  cloudtrail:GetEventDataStoreData\n\
  \                       \n\
  \                        }\n\
  \                   {-  logs:CreateLogGroup\n\
  \                       \n\
  \                        }\n\
  \                   {-  logs:CreateLogStream\n\
  \                       \n\
  \                        }\n\
  \                   {-  logs:PutResourcePolicy\n\
  \                       \n\
  \                        }\n\
  \                   {-  (If source has an associated Amazon Web Services KMS Key) kms:Decrypt\n\
  \                       \n\
  \                        }\n\
  \                   {-  (If source has an associated Amazon Web Services KMS Key) \
   kms:GenerateDataKey\n\
  \                       \n\
  \                        }\n\
  \                   \n\
  \         }\n\
  \          Example IAM policy for provided import role:\n\
  \          \n\
  \            [\\[ { \"Effect\": \"Allow\", \"Action\": \"iam:PassRole\", \"Resource\": \
   \"arn:aws:iam::123456789012:role/apiCallerCredentials\", \"Condition\": { \"StringLike\": { \
   \"iam:AssociatedResourceARN\": \
   \"arn:aws:logs:us-east-1:123456789012:log-group:aws/cloudtrail/f1d45bff-d0e3-4868-b5d9-2eb678aa32fb:*\" \
   } } }, { \"Effect\": \"Allow\", \"Action\": \\[ \"cloudtrail:GetEventDataStoreData\" \\], \
   \"Resource\": \\[ \
   \"arn:aws:cloudtrail:us-east-1:123456789012:eventdatastore/f1d45bff-d0e3-4868-b5d9-2eb678aa32fb\" \
   \\] }, { \"Effect\": \"Allow\", \"Action\": \\[ \"logs:CreateImportTask\", \
   \"logs:CreateLogGroup\", \"logs:CreateLogStream\", \"logs:PutResourcePolicy\" \\], \
   \"Resource\": \\[ \"arn:aws:logs:us-east-1:123456789012:log-group:/aws/cloudtrail/*\" \\] }, { \
   \"Effect\": \"Allow\", \"Action\": \\[ \"kms:Decrypt\", \"kms:GenerateDataKey\" \\], \
   \"Resource\": \\[ \
   \"arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012\" \\] } \\]] \n\
  \           \n\
  \            }\n\
  \        {-  If the import source has a customer managed key, the \"cloudtrail.amazonaws.com\" \
   principal needs permissions to perform kms:Decrypt and kms:GenerateDataKey.\n\
  \            \n\
  \             }\n\
  \        {-  There can be no more than 3 active imports per account at a given time.\n\
  \            \n\
  \             }\n\
  \        {-  The startEventTime must be less than or equal to endEventTime.\n\
  \            \n\
  \             }\n\
  \        {-  The data being imported must be within the specified source's retention period.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module CreateLogAnomalyDetector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_log_anomaly_detector_request ->
    ( create_log_anomaly_detector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_log_anomaly_detector_request ->
    ( create_log_anomaly_detector_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an {i anomaly detector} that regularly scans one or more log groups and look for \
   patterns and anomalies in the logs.\n\n\
  \ An anomaly detector can help surface issues by automatically discovering anomalies in your log \
   event traffic. An anomaly detector uses machine learning algorithms to scan log events and find \
   {i patterns}. A pattern is a shared text structure that recurs among your log fields. Patterns \
   provide a useful tool for analyzing large sets of logs because a large number of log events can \
   often be compressed into a few patterns.\n\
  \ \n\
  \  The anomaly detector uses pattern recognition to find [anomalies], which are unusual log \
   events. It uses the [evaluationFrequency] to compare current log events and patterns with \
   trained baselines. \n\
  \  \n\
  \   Fields within a pattern are called {i tokens}. Fields that vary within a pattern, such as a \
   request ID or timestamp, are referred to as {i dynamic tokens} and represented by [<*>]. \n\
  \   \n\
  \    The following is an example of a pattern:\n\
  \    \n\
  \      [\\[INFO\\] Request time: <*> ms] \n\
  \     \n\
  \      This pattern represents log events like [\\[INFO\\] Request time: 327 ms] and other \
   similar log events that differ only by the number, in this csse 327. When the pattern is \
   displayed, the different numbers are replaced by [<*>] \n\
  \      \n\
  \        Any parts of log events that are masked as sensitive data are not scanned for \
   anomalies. For more information about masking sensitive data, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html}Help \
   protect sensitive log data with masking}. \n\
  \        \n\
  \         "]

module CreateLogGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_log_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_log_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a log group with the specified name. You can create up to 1,000,000 log groups per \
   Region per account.\n\n\
  \ You must use the following guidelines when naming a log group:\n\
  \ \n\
  \  {ul\n\
  \        {-  Log group names must be unique within a Region for an Amazon Web Services account.\n\
  \            \n\
  \             }\n\
  \        {-  Log group names can be between 1 and 512 characters long.\n\
  \            \n\
  \             }\n\
  \        {-  Log group names consist of the following characters: a-z, A-Z, 0-9, '_' \
   (underscore), '-' (hyphen), '/' (forward slash), '.' (period), and '#' (number sign)\n\
  \            \n\
  \             }\n\
  \        {-  Log group names can't start with the string [aws/] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   When you create a log group, by default the log events in the log group do not expire. To \
   set a retention policy so that events expire and are deleted after a specified time, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutRetentionPolicy.html}PutRetentionPolicy}.\n\
  \   \n\
  \    If you associate an KMS key with the log group, ingested data is encrypted using the KMS \
   key. This association is stored as long as the data encrypted with the KMS key is still within \
   CloudWatch Logs. This enables CloudWatch Logs to decrypt this data whenever it is requested.\n\
  \    \n\
  \     If you attempt to associate a KMS key with the log group but the KMS key does not exist or \
   the KMS key is disabled, you receive an [InvalidParameterException] error. \n\
  \     \n\
  \       CloudWatch Logs supports only symmetric KMS keys. Do not associate an asymmetric KMS key \
   with your log group. For more information, see \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Using \
   Symmetric and Asymmetric Keys}.\n\
  \       \n\
  \        "]

module CreateLogStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_log_stream_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_log_stream_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a log stream for the specified log group. A log stream is a sequence of log events that \
   originate from a single source, such as an application instance or a resource that is being \
   monitored.\n\n\
  \ There is no limit on the number of log streams that you can create for a log group. There is a \
   limit of 50 TPS on [CreateLogStream] operations, after which transactions are throttled.\n\
  \ \n\
  \  You must use the following guidelines when naming a log stream:\n\
  \  \n\
  \   {ul\n\
  \         {-  Log stream names must be unique within the log group.\n\
  \             \n\
  \              }\n\
  \         {-  Log stream names can be between 1 and 512 characters long.\n\
  \             \n\
  \              }\n\
  \         {-  Don't use ':' (colon) or '*' (asterisk) characters.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module CreateLookupTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_lookup_table_request ->
    ( create_lookup_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_lookup_table_request ->
    ( create_lookup_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a lookup table by uploading CSV data. You can use lookup tables to enrich log data in \
   CloudWatch Logs Insights queries with reference data such as user details, application names, \
   or error descriptions.\n\n\
  \ The table name must be unique within your account and Region. The CSV content must include a \
   header row with column names, use UTF-8 encoding, and not exceed 10 MB.\n\
  \ "]

module CreateScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_query_request ->
    ( create_scheduled_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_query_request ->
    ( create_scheduled_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a scheduled query that runs CloudWatch Logs Insights queries at regular intervals. \
   Scheduled queries enable proactive monitoring by automatically executing queries to detect \
   patterns and anomalies in your log data. Query results can be delivered to Amazon S3 for \
   analysis or further processing.\n"]

module DeleteAccountPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_account_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_account_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a CloudWatch Logs account policy. This stops the account-wide policy from applying to \
   log groups or data sources in the account. If you delete a data protection policy or \
   subscription filter policy, any log-group level policies of those types remain in effect. This \
   operation supports deletion of data source-based field index policies, including facet \
   configurations, in addition to log group-based policies.\n\n\
  \ To use this operation, you must be signed on with the correct permissions depending on the \
   type of policy that you are deleting.\n\
  \ \n\
  \  {ul\n\
  \        {-  To delete a data protection policy, you must have the \
   [logs:DeleteDataProtectionPolicy] and [logs:DeleteAccountPolicy] permissions.\n\
  \            \n\
  \             }\n\
  \        {-  To delete a subscription filter policy, you must have the \
   [logs:DeleteSubscriptionFilter] and [logs:DeleteAccountPolicy] permissions.\n\
  \            \n\
  \             }\n\
  \        {-  To delete a transformer policy, you must have the [logs:DeleteTransformer] and \
   [logs:DeleteAccountPolicy] permissions.\n\
  \            \n\
  \             }\n\
  \        {-  To delete a field index policy, you must have the [logs:DeleteIndexPolicy] and \
   [logs:DeleteAccountPolicy] permissions.\n\
  \            \n\
  \             If you delete a field index policy that included facet configurations, those \
   facets will no longer be available for interactive exploration in the CloudWatch Logs Insights \
   console. However, facet data is retained for up to 30 days.\n\
  \             \n\
  \              }\n\
  \        }\n\
  \   If you delete a field index policy, the indexing of the log events that happened before you \
   deleted the policy will still be used for up to 30 days to improve CloudWatch Logs Insights \
   queries.\n\
  \   "]

module DeleteDataProtectionPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_data_protection_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_data_protection_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the data protection policy from the specified log group. \n\n\
  \ For more information about data protection policies, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html}PutDataProtectionPolicy}.\n\
  \ "]

module DeleteDelivery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_delivery_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_delivery_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a {i delivery}. A delivery is a connection between a logical {i delivery source} and a \
   logical {i delivery destination}. Deleting a delivery only deletes the connection between the \
   delivery source and delivery destination. It does not delete the delivery destination or the \
   delivery source.\n"]

module DeleteDeliveryDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_delivery_destination_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_delivery_destination_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a {i delivery destination}. A delivery is a connection between a logical {i delivery \
   source} and a logical {i delivery destination}.\n\n\
  \ You can't delete a delivery destination if any current deliveries are associated with it. To \
   find whether any deliveries are associated with this delivery destination, use the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html}DescribeDeliveries} \
   operation and check the [deliveryDestinationArn] field in the results.\n\
  \ "]

module DeleteDeliveryDestinationPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_delivery_destination_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_delivery_destination_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a delivery destination policy. For more information about these policies, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html}PutDeliveryDestinationPolicy}.\n"]

module DeleteDeliverySource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_delivery_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_delivery_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a {i delivery source}. A delivery is a connection between a logical {i delivery source} \
   and a logical {i delivery destination}.\n\n\
  \ You can't delete a delivery source if any current deliveries are associated with it. To find \
   whether any deliveries are associated with this delivery source, use the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html}DescribeDeliveries} \
   operation and check the [deliverySourceName] field in the results.\n\
  \ "]

module DeleteDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_destination_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_destination_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified destination, and eventually disables all the subscription filters that \
   publish to it. This operation does not delete the physical resource encapsulated by the \
   destination.\n"]

module DeleteIndexPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_index_policy_request ->
    ( delete_index_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_index_policy_request ->
    ( delete_index_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a log-group level field index policy that was applied to a single log group. The \
   indexing of the log events that happened before you delete the policy will still be used for as \
   many as 30 days to improve CloudWatch Logs Insights queries.\n\n\
  \ If the deleted policy included facet configurations, those facets will no longer be available \
   for interactive exploration in the CloudWatch Logs Insights console for this log group. \
   However, facet data is retained for up to 30 days.\n\
  \ \n\
  \  You can't use this operation to delete an account-level index policy. Instead, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DeleteAccountPolicy.html}DeleteAccountPolicy}.\n\
  \  \n\
  \   If you delete a log-group level field index policy and there is an account-level field index \
   policy, in a few minutes the log group begins using that account-wide policy to index new \
   incoming log events. This operation only affects log group-level policies, including any facet \
   configurations, and preserves any data source-based account policies that may apply to the log \
   group.\n\
  \   "]

module DeleteIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_request ->
    ( delete_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_request ->
    ( delete_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the integration between CloudWatch Logs and OpenSearch Service. If your integration has \
   active vended logs dashboards, you must specify [true] for the [force] parameter, otherwise the \
   operation will fail. If you delete the integration by setting [force] to [true], all your \
   vended logs dashboards powered by OpenSearch Service will be deleted and the data that was on \
   them will no longer be accessible.\n"]

module DeleteLogAnomalyDetector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_log_anomaly_detector_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_log_anomaly_detector_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified CloudWatch Logs anomaly detector.\n"]

module DeleteLogGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_log_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_log_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified log group and permanently deletes all the archived log events associated \
   with the log group.\n"]

module DeleteLogStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_log_stream_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_log_stream_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified log stream and permanently deletes all the archived log events associated \
   with the log stream.\n"]

module DeleteLookupTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_lookup_table_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_lookup_table_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a lookup table permanently. This operation cannot be undone.\n\n\
  \ Queries that reference a deleted table will return an error. Before deleting a lookup table, \
   review any saved queries or dashboards that may reference it.\n\
  \ "]

module DeleteMetricFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_metric_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_metric_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified metric filter.\n"]

module DeleteQueryDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_query_definition_request ->
    ( delete_query_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_query_definition_request ->
    ( delete_query_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a saved CloudWatch Logs Insights query definition. A query definition contains details \
   about a saved CloudWatch Logs Insights query.\n\n\
  \ Each [DeleteQueryDefinition] operation can delete one query definition.\n\
  \ \n\
  \  You must have the [logs:DeleteQueryDefinition] permission to be able to perform this operation.\n\
  \  "]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a resource policy from this account. This revokes the access of the identities in that \
   policy to put log events to this account.\n"]

module DeleteRetentionPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_retention_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_retention_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified retention policy.\n\n\
  \ Log events do not expire if they belong to log groups without a retention policy.\n\
  \ "]

module DeleteScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_query_request ->
    ( delete_scheduled_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_query_request ->
    ( delete_scheduled_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a scheduled query and stops all future executions. This operation also removes any \
   configured actions and associated resources.\n"]

module DeleteSubscriptionFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_subscription_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_subscription_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified subscription filter.\n"]

module DeleteSyslogConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_syslog_configuration_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_syslog_configuration_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a syslog configuration for a log group. After deletion, syslog data is no longer \
   ingested through the specified VPC endpoint.\n"]

module DeleteTransformer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_transformer_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_transformer_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the log transformer for the specified log group. As soon as you do this, the \
   transformation of incoming log events according to that transformer stops. If this account has \
   an account-level transformer that applies to this log group, the log group begins using that \
   account-level transformer when this log-group level transformer is deleted.\n\n\
  \ After you delete a transformer, be sure to edit any metric filters or subscription filters \
   that relied on the transformed versions of the log events.\n\
  \ "]

module DescribeAccountPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_policies_request ->
    ( describe_account_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_policies_request ->
    ( describe_account_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all CloudWatch Logs account policies in the account.\n\n\
  \ To use this operation, you must be signed on with the correct permissions depending on the \
   type of policy that you are retrieving information for.\n\
  \ \n\
  \  {ul\n\
  \        {-  To see data protection policies, you must have the [logs:GetDataProtectionPolicy] \
   and [logs:DescribeAccountPolicies] permissions.\n\
  \            \n\
  \             }\n\
  \        {-  To see subscription filter policies, you must have the \
   [logs:DescribeSubscriptionFilters] and [logs:DescribeAccountPolicies] permissions.\n\
  \            \n\
  \             }\n\
  \        {-  To see transformer policies, you must have the [logs:GetTransformer] and \
   [logs:DescribeAccountPolicies] permissions.\n\
  \            \n\
  \             }\n\
  \        {-  To see field index policies, you must have the [logs:DescribeIndexPolicies] and \
   [logs:DescribeAccountPolicies] permissions.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeConfigurationTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_configuration_templates_request ->
    ( describe_configuration_templates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_configuration_templates_request ->
    ( describe_configuration_templates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to return the valid and default values that are used when creating delivery \
   sources, delivery destinations, and deliveries. For more information about deliveries, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery}.\n"]

module DescribeDeliveries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_deliveries_request ->
    ( describe_deliveries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_deliveries_request ->
    ( describe_deliveries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of the deliveries that have been created in the account.\n\n\
  \ A {i delivery} is a connection between a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html} \
   {i delivery source} } and a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html} \
   {i delivery destination} }.\n\
  \ \n\
  \  A delivery source represents an Amazon Web Services resource that sends logs to an logs \
   delivery destination. The destination can be CloudWatch Logs, Amazon S3, Firehose or X-Ray. \
   Only some Amazon Web Services services support being configured as a delivery source. These \
   services are listed in \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html}Enable \
   logging from Amazon Web Services services.} \n\
  \  "]

module DescribeDeliveryDestinations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_delivery_destinations_request ->
    ( describe_delivery_destinations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_delivery_destinations_request ->
    ( describe_delivery_destinations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of the delivery destinations that have been created in the account.\n"]

module DescribeDeliverySources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_delivery_sources_request ->
    ( describe_delivery_sources_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_delivery_sources_request ->
    ( describe_delivery_sources_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of the delivery sources that have been created in the account.\n"]

module DescribeDestinations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_destinations_request ->
    ( describe_destinations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_destinations_request ->
    ( describe_destinations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all your destinations. The results are ASCII-sorted by destination name.\n"]

module DescribeExportTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_export_tasks_request ->
    ( describe_export_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_export_tasks_request ->
    ( describe_export_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the specified export tasks. You can list all your export tasks or filter the results \
   based on task ID or task status.\n"]

module DescribeFieldIndexes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_field_indexes_request ->
    ( describe_field_indexes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_field_indexes_request ->
    ( describe_field_indexes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of custom and default field indexes which are discovered in log data. For more \
   information about field index policies, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html}PutIndexPolicy}.\n"]

module DescribeImportTaskBatches : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_import_task_batches_request ->
    ( describe_import_task_batches_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_import_task_batches_request ->
    ( describe_import_task_batches_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets detailed information about the individual batches within an import task, including their \
   status and any error messages. For CloudTrail Event Data Store sources, a batch refers to a \
   subset of stored events grouped by their eventTime. \n"]

module DescribeImportTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_import_tasks_request ->
    ( describe_import_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_import_tasks_request ->
    ( describe_import_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists and describes import tasks, with optional filtering by import status and source ARN.\n"]

module DescribeIndexPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_index_policies_request ->
    ( describe_index_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_index_policies_request ->
    ( describe_index_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the field index policies of the specified log group. For more information about field \
   index policies, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html}PutIndexPolicy}.\n\n\
  \ If a specified log group has a log-group level index policy, that policy is returned by this \
   operation.\n\
  \ \n\
  \  If a specified log group doesn't have a log-group level index policy, but an account-wide \
   index policy applies to it, that account-wide policy is returned by this operation.\n\
  \  \n\
  \   To find information about only account-level policies, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeAccountPolicies.html}DescribeAccountPolicies} \
   instead.\n\
  \   "]

module DescribeLogGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_log_groups_request ->
    ( describe_log_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_log_groups_request ->
    ( describe_log_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about log groups, including data sources that ingest into each log group. \
   You can return all your log groups or filter the results by prefix. The results are \
   ASCII-sorted by log group name.\n\n\
  \ CloudWatch Logs doesn't support IAM policies that control access to the [DescribeLogGroups] \
   action by using the \n\
  \ {[\n\
  \ aws:ResourceTag/{i key-name} \n\
  \ ]}\n\
  \  condition key. Other CloudWatch Logs actions do support the use of the \n\
  \ {[\n\
  \ aws:ResourceTag/{i key-name} \n\
  \ ]}\n\
  \  condition key to control access. For more information about using tags to control access, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html}Controlling access to \
   Amazon Web Services resources using tags}.\n\
  \ \n\
  \  If you are using CloudWatch cross-account observability, you can use this operation in a \
   monitoring account and view data from the linked source accounts. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html}CloudWatch \
   cross-account observability}.\n\
  \  "]

module DescribeLogStreams : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_log_streams_request ->
    ( describe_log_streams_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_log_streams_request ->
    ( describe_log_streams_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the log streams for the specified log group. You can list all the log streams or filter \
   the results by prefix. You can also control how the results are ordered.\n\n\
  \ You can specify the log group to search by using either [logGroupIdentifier] or \
   [logGroupName]. You must include one of these two parameters, but you can't include both. \n\
  \ \n\
  \  This operation has a limit of 25 transactions per second, after which transactions are \
   throttled.\n\
  \  \n\
  \   If you are using CloudWatch cross-account observability, you can use this operation in a \
   monitoring account and view data from the linked source accounts. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html}CloudWatch \
   cross-account observability}.\n\
  \   "]

module DescribeLookupTables : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_lookup_tables_request ->
    ( describe_lookup_tables_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_lookup_tables_request ->
    ( describe_lookup_tables_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves metadata about lookup tables in your account. You can optionally filter the results \
   by table name prefix. Results are sorted by table name in ascending order.\n"]

module DescribeMetricFilters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_metric_filters_request ->
    ( describe_metric_filters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_metric_filters_request ->
    ( describe_metric_filters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the specified metric filters. You can list all of the metric filters or filter the \
   results by log name, prefix, metric name, or metric namespace. The results are ASCII-sorted by \
   filter name.\n"]

module DescribeQueries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_queries_request ->
    ( describe_queries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_queries_request ->
    ( describe_queries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of CloudWatch Logs Insights queries that are scheduled, running, or have been \
   run recently in this account. You can request all queries or limit it to queries of a specific \
   log group or queries with a certain status.\n\n\
  \ This operation includes both interactive queries started directly by users and automated \
   queries executed by scheduled query configurations. Scheduled query executions appear in the \
   results alongside manually initiated queries, providing visibility into all query activity in \
   your account.\n\
  \ "]

module DescribeQueryDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_query_definitions_request ->
    ( describe_query_definitions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_query_definitions_request ->
    ( describe_query_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation returns a paginated list of your saved CloudWatch Logs Insights query \
   definitions. You can retrieve query definitions from the current account or from a source \
   account that is linked to the current account.\n\n\
  \ You can use the [queryDefinitionNamePrefix] parameter to limit the results to only the query \
   definitions that have names that start with a certain string.\n\
  \ "]

module DescribeResourcePolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_policies_request ->
    ( describe_resource_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_policies_request ->
    ( describe_resource_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the resource policies in this account.\n"]

module DescribeSubscriptionFilters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_subscription_filters_request ->
    ( describe_subscription_filters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_subscription_filters_request ->
    ( describe_subscription_filters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the subscription filters for the specified log group. You can list all the subscription \
   filters or filter the results by prefix. The results are ASCII-sorted by filter name.\n"]

module DisassociateKmsKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_kms_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_kms_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates the specified KMS key from the specified log group or from all CloudWatch Logs \
   Insights query results in the account.\n\n\
  \ When you use [DisassociateKmsKey], you specify either the [logGroupName] parameter or the \
   [resourceIdentifier] parameter. You can't specify both of those parameters in the same \
   operation.\n\
  \ \n\
  \  {ul\n\
  \        {-  Specify the [logGroupName] parameter to stop using the KMS key to encrypt future \
   log events ingested and stored in the log group. Instead, they will be encrypted with the \
   default CloudWatch Logs method. The log events that were ingested while the key was associated \
   with the log group are still encrypted with that key. Therefore, CloudWatch Logs will need \
   permissions for the key whenever that data is accessed.\n\
  \            \n\
  \             }\n\
  \        {-  Specify the [resourceIdentifier] parameter with the [query-result] resource to stop \
   using the KMS key to encrypt the results of all future \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html}StartQuery} \
   operations in the account. They will instead be encrypted with the default CloudWatch Logs \
   method. The results from queries that ran while the key was associated with the account are \
   still encrypted with that key. Therefore, CloudWatch Logs will need permissions for the key \
   whenever that data is accessed.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   It can take up to 5 minutes for this operation to take effect.\n\
  \   "]

module DisassociateSourceFromS3TableIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_source_from_s3_table_integration_request ->
    ( disassociate_source_from_s3_table_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_source_from_s3_table_integration_request ->
    ( disassociate_source_from_s3_table_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates a data source from an S3 Table Integration, removing query access and deleting \
   all associated data from the integration.\n"]

module FilterLogEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    filter_log_events_request ->
    ( filter_log_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    filter_log_events_request ->
    ( filter_log_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists log events from the specified log group. You can list all the log events or filter the \
   results using one or more of the following:\n\n\
  \ {ul\n\
  \       {-  A filter pattern\n\
  \           \n\
  \            }\n\
  \       {-  A time range\n\
  \           \n\
  \            }\n\
  \       {-  The log stream name, or a log stream name prefix that matches multiple log streams\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   You must have the [logs:FilterLogEvents] permission to perform this operation.\n\
  \   \n\
  \    You can specify the log group to search by using either [logGroupIdentifier] or \
   [logGroupName]. You must include one of these two parameters, but you can't include both. \n\
  \    \n\
  \      [FilterLogEvents] is a paginated operation. Each page returned can contain up to 1 MB of \
   log events or up to 10,000 log events. A returned page might only be partially full, or even \
   empty. For example, if the result of a query would return 15,000 log events, the first page \
   isn't guaranteed to have 10,000 log events even if they all fit into 1 MB.\n\
  \     \n\
  \      Partially full or empty pages don't necessarily mean that pagination is finished. If the \
   results include a [nextToken], there might be more log events available. You can return these \
   additional log events by providing the nextToken in a subsequent [FilterLogEvents] operation. \
   If the results don't include a [nextToken], then pagination is finished. \n\
  \      \n\
  \       Specifying the [limit] parameter only guarantees that a single page doesn't return more \
   log events than the specified limit, but it might return fewer events than the limit. This is \
   the expected API behavior.\n\
  \       \n\
  \        The returned log events are sorted by event timestamp, the timestamp when the event was \
   ingested by CloudWatch Logs, and the ID of the [PutLogEvents] request. By default, the events \
   are returned in ascending timestamp order (oldest first). To return events in descending \
   timestamp order (newest first), set the [startFromHead] parameter to [false].\n\
  \        \n\
  \         If you are using CloudWatch cross-account observability, you can use this operation in \
   a monitoring account and view data from the linked source accounts. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html}CloudWatch \
   cross-account observability}.\n\
  \         \n\
  \           If you are using \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html}log \
   transformation}, the [FilterLogEvents] operation returns only the original versions of log \
   events, before they were transformed. To view the transformed versions, you must use a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html}CloudWatch \
   Logs query.} \n\
  \           \n\
  \            "]

module GetDataProtectionPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_protection_policy_request ->
    ( get_data_protection_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_protection_policy_request ->
    ( get_data_protection_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a log group data protection policy.\n"]

module GetDelivery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_delivery_request ->
    ( get_delivery_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_delivery_request ->
    ( get_delivery_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns complete information about one logical {i delivery}. A delivery is a connection between \
   a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html} \
   {i delivery source} } and a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html} \
   {i delivery destination} }.\n\n\
  \ A delivery source represents an Amazon Web Services resource that sends logs to an logs \
   delivery destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose. Only some \
   Amazon Web Services services support being configured as a delivery source. These services are \
   listed in \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html}Enable \
   logging from Amazon Web Services services.} \n\
  \ \n\
  \  You need to specify the delivery [id] in this operation. You can find the IDs of the \
   deliveries in your account with the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html}DescribeDeliveries} \
   operation.\n\
  \  "]

module GetDeliveryDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_delivery_destination_request ->
    ( get_delivery_destination_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_delivery_destination_request ->
    ( get_delivery_destination_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves complete information about one delivery destination.\n"]

module GetDeliveryDestinationPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_delivery_destination_policy_request ->
    ( get_delivery_destination_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_delivery_destination_policy_request ->
    ( get_delivery_destination_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the delivery destination policy assigned to the delivery destination that you \
   specify. For more information about delivery destinations and their policies, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html}PutDeliveryDestinationPolicy}.\n"]

module GetDeliverySource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_delivery_source_request ->
    ( get_delivery_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_delivery_source_request ->
    ( get_delivery_source_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves complete information about one delivery source.\n"]

module GetIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_integration_request ->
    ( get_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_integration_request ->
    ( get_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about one integration between CloudWatch Logs and OpenSearch Service. \n"]

module GetLogAnomalyDetector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_log_anomaly_detector_request ->
    ( get_log_anomaly_detector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_log_anomaly_detector_request ->
    ( get_log_anomaly_detector_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the log anomaly detector that you specify. The KMS key ARN detected \
   is valid.\n"]

module GetLogEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_log_events_request ->
    ( get_log_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_log_events_request ->
    ( get_log_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists log events from the specified log stream. You can list all of the log events or filter \
   using a time range.\n\n\
  \  [GetLogEvents] is a paginated operation. Each page returned can contain up to 1 MB of log \
   events or up to 10,000 log events. A returned page might only be partially full, or even empty. \
   For example, if the result of a query would return 15,000 log events, the first page isn't \
   guaranteed to have 10,000 log events even if they all fit into 1 MB.\n\
  \ \n\
  \  Partially full or empty pages don't necessarily mean that pagination is finished. As long as \
   the [nextBackwardToken] or [nextForwardToken] returned is NOT equal to the [nextToken] that you \
   passed into the API call, there might be more log events available. The token that you use \
   depends on the direction you want to move in along the log stream. The returned tokens are \
   never null.\n\
  \  \n\
  \    If you set [startFromHead] to [true] and you don\226\128\153t include [endTime] in your \
   request, you can end up in a situation where the pagination doesn't terminate. This can happen \
   when the new log events are being added to the target log streams faster than they are being \
   read. This situation is a good use case for the CloudWatch Logs \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs_LiveTail.html}Live \
   Tail} feature.\n\
  \    \n\
  \      If you are using CloudWatch cross-account observability, you can use this operation in a \
   monitoring account and view data from the linked source accounts. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html}CloudWatch \
   cross-account observability}.\n\
  \      \n\
  \       You can specify the log group to search by using either [logGroupIdentifier] or \
   [logGroupName]. You must include one of these two parameters, but you can't include both. \n\
  \       \n\
  \         If you are using \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html}log \
   transformation}, the [GetLogEvents] operation returns only the original versions of log events, \
   before they were transformed. To view the transformed versions, you must use a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html}CloudWatch \
   Logs query.} \n\
  \         \n\
  \          "]

module GetLogFields : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_log_fields_request ->
    ( get_log_fields_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_log_fields_request ->
    ( get_log_fields_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Discovers available fields for a specific data source and type. The response includes any field \
   modifications introduced through pipelines, such as new fields or changed field types. \n"]

module GetLogGroupFields : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_log_group_fields_request ->
    ( get_log_group_fields_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_log_group_fields_request ->
    ( get_log_group_fields_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the fields that are included in log events in the specified log group. \
   Includes the percentage of log events that contain each field. The search is limited to a time \
   period that you specify.\n\n\
  \ This operation is used for discovering fields within log group events. For discovering fields \
   across data sources, use the GetLogFields operation.\n\
  \ \n\
  \  You can specify the log group to search by using either [logGroupIdentifier] or \
   [logGroupName]. You must specify one of these parameters, but you can't specify both. \n\
  \  \n\
  \   In the results, fields that start with [@] are fields generated by CloudWatch Logs. For \
   example, [@timestamp] is the timestamp of each log event. For more information about the fields \
   that are generated by CloudWatch logs, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html}Supported \
   Logs and Discovered Fields}.\n\
  \   \n\
  \    The response results are sorted by the frequency percentage, starting with the highest \
   percentage.\n\
  \    \n\
  \     If you are using CloudWatch cross-account observability, you can use this operation in a \
   monitoring account and view data from the linked source accounts. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html}CloudWatch \
   cross-account observability}.\n\
  \     "]

module GetLogObject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_log_object_request ->
    ( get_log_object_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_log_object_request ->
    ( get_log_object_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a large logging object (LLO) and streams it back. This API is used to fetch the \
   content of large portions of log events that have been ingested through the \
   PutOpenTelemetryLogs API. When log events contain fields that would cause the total event size \
   to exceed 1MB, CloudWatch Logs automatically processes up to 10 fields, starting with the \
   largest fields. Each field is truncated as needed to keep the total event size as close to 1MB \
   as possible. The excess portions are stored as Large Log Objects (LLOs) and these fields are \
   processed separately and LLO reference system fields (in the format \
   [@ptr.$\\[path.to.field\\]]) are added. The path in the reference field reflects the original \
   JSON structure where the large field was located. For example, this could be \
   [@ptr.$\\['input'\\]\\['message'\\]], [@ptr.$\\['AAA'\\]\\['BBB'\\]\\['CCC'\\]\\['DDD'\\]], \
   [@ptr.$\\['AAA'\\]], or any other path matching your log structure.\n\n\
  \  The [GetLogObject] API routes requests using SDK host prefix injection. SDK versions released \
   before April 1, 2026 route to \n\
  \  {[\n\
  \  streaming-logs.{i Region}.amazonaws.com\n\
  \  ]}\n\
  \  , which does not support VPC endpoints. SDK versions released on or after April 1, 2026 route \
   to \n\
  \  {[\n\
  \  stream-logs.{i Region}.amazonaws.com\n\
  \  ]}\n\
  \  , which supports VPC endpoints. To set up a VPC endpoint for this API, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/cloudwatch-logs-and-interface-VPC.html#create-VPC-endpoint-for-CloudWatchLogs}Creating \
   a VPC endpoint for CloudWatch Logs }.\n\
  \  \n\
  \   "]

module GetLogRecord : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_log_record_request ->
    ( get_log_record_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_log_record_request ->
    ( get_log_record_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves all of the fields and values of a single log event. All fields are retrieved, even if \
   the original query that produced the [logRecordPointer] retrieved only a subset of fields. \
   Fields are returned as field name/field value pairs.\n\n\
  \ The full unparsed log event is returned within [@message].\n\
  \ "]

module GetLookupTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_lookup_table_request ->
    ( get_lookup_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_lookup_table_request ->
    ( get_lookup_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the full content of a lookup table, including the CSV data.\n"]

module GetQueryResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_query_results_request ->
    ( get_query_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_query_results_request ->
    ( get_query_results_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the results from the specified query.\n\n\
  \ Only the fields requested in the query are returned, along with a [@ptr] field, which is the \
   identifier for the log record. You can use the value of [@ptr] in a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogRecord.html}GetLogRecord} \
   operation to get the full log record.\n\
  \ \n\
  \   [GetQueryResults] does not start running a query. To run a query, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html}StartQuery}. \
   For more information about how long results of previous queries are available, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/cloudwatch_limits_cwl.html}CloudWatch \
   Logs quotas}.\n\
  \  \n\
  \   If the value of the [Status] field in the output is [Running], this operation returns only \
   partial results. If you see a value of [Scheduled] or [Running] for the status, you can retry \
   the operation later to see the final results. \n\
  \   \n\
  \    This operation is used both for retrieving results from interactive queries and from \
   automated scheduled query executions. Scheduled queries use [GetQueryResults] internally to \
   retrieve query results for processing and delivery to configured destinations.\n\
  \    \n\
  \     You can retrieve up to 100,000 log event results from a query, if available, by using \
   pagination. Use the [nextToken] returned in the response to request additional pages of \
   results, with each page returning up to 10,000 log events. This is only supported for Logs \
   Insights QL and is currently not supported for PPL and SQL query languages.\n\
  \     \n\
  \      If you are using CloudWatch cross-account observability, you can use this operation in a \
   monitoring account to start queries in linked source accounts. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html}CloudWatch \
   cross-account observability}.\n\
  \      "]

module GetScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_scheduled_query_request ->
    ( get_scheduled_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_scheduled_query_request ->
    ( get_scheduled_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves details about a specific scheduled query, including its configuration, execution \
   status, and metadata.\n"]

module GetScheduledQueryHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_scheduled_query_history_request ->
    ( get_scheduled_query_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_scheduled_query_history_request ->
    ( get_scheduled_query_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the execution history of a scheduled query within a specified time range, including \
   query results and destination processing status.\n"]

module GetTransformer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_transformer_request ->
    ( get_transformer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_transformer_request ->
    ( get_transformer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the information about the log transformer associated with this log group.\n\n\
  \ This operation returns data only for transformers created at the log group level. To get \
   information for an account-level transformer, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeAccountPolicies.html}DescribeAccountPolicies}.\n\
  \ "]

module ListAggregateLogGroupSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_aggregate_log_group_summaries_request ->
    ( list_aggregate_log_group_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_aggregate_log_group_summaries_request ->
    ( list_aggregate_log_group_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an aggregate summary of all log groups in the Region grouped by specified data source \
   characteristics. Supports optional filtering by log group class, name patterns, and data \
   sources. If you perform this action in a monitoring account, you can also return aggregated \
   summaries of log groups from source accounts that are linked to the monitoring account. For \
   more information about using cross-account observability to set up monitoring accounts and \
   source accounts, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html}CloudWatch \
   cross-account observability}.\n\n\
  \ The operation aggregates log groups by data source name and type and optionally format, \
   providing counts of log groups that share these characteristics. The operation paginates \
   results. By default, it returns up to 50 results and includes a token to retrieve more results.\n\
  \ "]

module ListAnomalies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_anomalies_request ->
    ( list_anomalies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_anomalies_request ->
    ( list_anomalies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of anomalies that log anomaly detectors have found. For details about the \
   structure format of each anomaly object that is returned, see the example in this section.\n"]

module ListIntegrations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_integrations_request ->
    ( list_integrations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_integrations_request ->
    ( list_integrations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of integrations between CloudWatch Logs and other services in this account. \
   Currently, only one integration can be created in an account, and this integration must be with \
   OpenSearch Service.\n"]

module ListLogAnomalyDetectors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_log_anomaly_detectors_request ->
    ( list_log_anomaly_detectors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_log_anomaly_detectors_request ->
    ( list_log_anomaly_detectors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of the log anomaly detectors in the account.\n"]

module ListLogGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_log_groups_request ->
    ( list_log_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_log_groups_request ->
    ( list_log_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of log groups in the Region in your account. If you are performing this action \
   in a monitoring account, you can choose to also return log groups from source accounts that are \
   linked to the monitoring account. For more information about using cross-account observability \
   to set up monitoring accounts and source accounts, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html} \
   CloudWatch cross-account observability}.\n\n\
  \ You can optionally filter the results by log group class, log group name pattern, field \
   indexes, data sources, field index names, or log group tags. If you specify more than one \
   filter type, the results include log groups that satisfy all filters.\n\
  \ \n\
  \  This operation is paginated. By default, your first use of this operation returns 50 results, \
   and includes a token to use in a subsequent operation to return more results.\n\
  \  "]

module ListLogGroupsForQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_log_groups_for_query_request ->
    ( list_log_groups_for_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_log_groups_for_query_request ->
    ( list_log_groups_for_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the log groups that were analyzed during a single CloudWatch Logs Insights \
   query. This can be useful for queries that use log group name prefixes or the [filterIndex] \
   command, because the log groups are dynamically selected in these cases.\n\n\
  \ For more information about field indexes, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html}Create \
   field indexes to improve query performance and reduce costs}.\n\
  \ "]

module ListScheduledQueries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_queries_request ->
    ( list_scheduled_queries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_queries_request ->
    ( list_scheduled_queries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all scheduled queries in your account and region. You can filter results by state to show \
   only enabled or disabled queries.\n"]

module ListSourcesForS3TableIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_sources_for_s3_table_integration_request ->
    ( list_sources_for_s3_table_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sources_for_s3_table_integration_request ->
    ( list_sources_for_s3_table_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of data source associations for a specified S3 Table Integration, showing which \
   data sources are currently associated for query access.\n"]

module ListSyslogConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_syslog_configurations_request ->
    ( list_syslog_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_syslog_configurations_request ->
    ( list_syslog_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of syslog configurations. You can optionally filter the results by log group or \
   VPC endpoint.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays the tags associated with a CloudWatch Logs resource. Currently, log groups and \
   destinations support tagging.\n"]

module ListTagsLogGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_log_group_request ->
    ( list_tags_log_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_log_group_request ->
    ( list_tags_log_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The ListTagsLogGroup operation is on the path to deprecation. We recommend that you use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html}ListTagsForResource} \
   instead.\n\
  \ \n\
  \   Lists the tags for the specified log group.\n\
  \   "]

module PutAccountPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_account_policy_request ->
    ( put_account_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_account_policy_request ->
    ( put_account_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an account-level data protection policy, subscription filter policy, field index \
   policy, transformer policy, or metric extraction policy that applies to all log groups, a \
   subset of log groups, or a data source name and type combination in the account.\n\n\
  \   [PutAccountPolicy] is an account-wide administrative operation intended for CloudWatch Logs \
   administrators. Because it affects all log groups (or a broad subset) in the account, you \
   should grant [logs:PutAccountPolicy] permissions only to administrators who manage logging \
   configuration across the account, not to application teams or individual log group owners.\n\
  \  \n\
  \     {b Conflict resolution between account-level and log-group-level policies} \n\
  \    \n\
  \     When both an account-level policy and a log-group-level policy of the same type apply to a \
   log group, the resolution depends on the policy type:\n\
  \     \n\
  \      {ul\n\
  \            {-   {i Data protection} \226\128\148 The two policies are cumulative. Any \
   sensitive term specified in either the account-level or the log-group-level policy is masked.\n\
  \                \n\
  \                 }\n\
  \            {-   {i Subscription filters} \226\128\148 Account-level and log-group-level \
   subscription filters are additive. A log group can have up to 1 account-level and up to 2 \
   log-group-level subscription filters.\n\
  \                \n\
  \                 }\n\
  \            {-   {i Transformers} \226\128\148 A log-group-level transformer overrides the \
   account-level transformer. If a log group has its own transformer, it ignores the account-level \
   transformer policy.\n\
  \                \n\
  \                 }\n\
  \            {-   {i Field index policies} \226\128\148 If a log group has its own field index \
   policy (created with [PutIndexPolicy]), any account-level policy that uses [LogGroupNamePrefix] \
   selection criteria or has no selection criteria is ignored for that log group. However, \
   account-level policies that use [DataSourceName] and [DataSourceType] selection criteria still \
   apply alongside the log-group-level policy.\n\
  \                \n\
  \                 }\n\
  \            {-   {i Metric extraction policies} \226\128\148 Metric extraction policies are \
   account-level only and have no log-group-level equivalent, so no conflict resolution applies.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   For field index policies, you can configure indexed fields as {i facets} to enable \
   interactive exploration of your logs. Facets provide value distributions and counts for indexed \
   fields in the CloudWatch Logs Insights console without requiring query execution. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Facets.html}Use \
   facets to group and explore logs}.\n\
  \   \n\
  \    To use this operation, you must be signed on with the correct permissions depending on the \
   type of policy that you are creating.\n\
  \    \n\
  \     {ul\n\
  \           {-  To create a data protection policy, you must have the \
   [logs:PutDataProtectionPolicy] and [logs:PutAccountPolicy] permissions.\n\
  \               \n\
  \                }\n\
  \           {-  To create a subscription filter policy, you must have the \
   [logs:PutSubscriptionFilter] and [logs:PutAccountPolicy] permissions.\n\
  \               \n\
  \                }\n\
  \           {-  To create a transformer policy, you must have the [logs:PutTransformer] and \
   [logs:PutAccountPolicy] permissions.\n\
  \               \n\
  \                }\n\
  \           {-  To create a field index policy, you must have the [logs:PutIndexPolicy] and \
   [logs:PutAccountPolicy] permissions.\n\
  \               \n\
  \                }\n\
  \           {-  To configure facets for field index policies, you must have the \
   [logs:PutIndexPolicy] and [logs:PutAccountPolicy] permissions.\n\
  \               \n\
  \                }\n\
  \           {-  To create a metric extraction policy, you must have the \
   [logs:PutMetricExtractionPolicy] and [logs:PutAccountPolicy] permissions.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \    {b Data protection policy} \n\
  \   \n\
  \    A data protection policy can help safeguard sensitive data that's ingested by your log \
   groups by auditing and masking the sensitive log data. Each account can have only one \
   account-level data protection policy.\n\
  \    \n\
  \      Sensitive data is detected and masked when it is ingested into a log group. When you set \
   a data protection policy, log events ingested into the log groups before that time are not \
   masked.\n\
  \      \n\
  \        If you use [PutAccountPolicy] to create a data protection policy for your whole \
   account, it applies to both existing log groups and all log groups that are created later in \
   this account. The account-level policy is applied to existing log groups with eventual \
   consistency. It might take up to 5 minutes before sensitive data in existing log groups begins \
   to be masked.\n\
  \        \n\
  \         By default, when a user views a log event that includes masked data, the sensitive \
   data is replaced by asterisks. A user who has the [logs:Unmask] permission can use a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html}GetLogEvents} \
   or \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html}FilterLogEvents} \
   operation with the [unmask] parameter set to [true] to view the unmasked log events. Users with \
   the [logs:Unmask] can also view unmasked data in the CloudWatch Logs console by running a \
   CloudWatch Logs Insights query with the [unmask] query command.\n\
  \         \n\
  \          For more information, including a list of types of data that can be audited and \
   masked, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html}Protect \
   sensitive log data with masking}.\n\
  \          \n\
  \           To use the [PutAccountPolicy] operation for a data protection policy, you must be \
   signed on with the [logs:PutDataProtectionPolicy] and [logs:PutAccountPolicy] permissions.\n\
  \           \n\
  \            The [PutAccountPolicy] operation applies to all log groups in the account. You can \
   use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html}PutDataProtectionPolicy} \
   to create a data protection policy that applies to just one log group. If a log group has its \
   own data protection policy and the account also has an account-level data protection policy, \
   then the two policies are cumulative. Any sensitive term specified in either policy is masked.\n\
  \            \n\
  \              {b Subscription filter policy} \n\
  \             \n\
  \              A subscription filter policy sets up a real-time feed of log events from \
   CloudWatch Logs to other Amazon Web Services services. Account-level subscription filter \
   policies apply to both existing log groups and log groups that are created later in this \
   account. Supported destinations are Kinesis Data Streams, Firehose, and Lambda. When log events \
   are sent to the receiving service, they are Base64 encoded and compressed with the GZIP format.\n\
  \              \n\
  \               The following destinations are supported for subscription filters:\n\
  \               \n\
  \                {ul\n\
  \                      {-  An Kinesis Data Streams data stream in the same account as the \
   subscription policy, for same-account delivery.\n\
  \                          \n\
  \                           }\n\
  \                      {-  An Firehose data stream in the same account as the subscription \
   policy, for same-account delivery.\n\
  \                          \n\
  \                           }\n\
  \                      {-  A Lambda function in the same account as the subscription policy, for \
   same-account delivery.\n\
  \                          \n\
  \                           }\n\
  \                      {-  A logical destination in a different account created with \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html}PutDestination}, \
   for cross-account delivery. Kinesis Data Streams and Firehose are supported as logical \
   destinations.\n\
  \                          \n\
  \                           }\n\
  \                      }\n\
  \   Each account can have one account-level subscription filter policy per Region. If you are \
   updating an existing filter, you must specify the correct name in [PolicyName]. To perform a \
   [PutAccountPolicy] subscription filter operation for any destination except a Lambda function, \
   you must also have the [iam:PassRole] permission.\n\
  \   \n\
  \     {b Transformer policy} \n\
  \    \n\
  \     Creates or updates a {i log transformer policy} for your account. You use log transformers \
   to transform log events into a different format, making them easier for you to process and \
   analyze. You can also transform logs from different sources into standardized formats that \
   contain relevant, source-specific information. After you have created a transformer, CloudWatch \
   Logs performs this transformation at the time of log ingestion. You can then refer to the \
   transformed versions of the logs during operations such as querying with CloudWatch Logs \
   Insights or creating metric filters or subscription filters.\n\
  \     \n\
  \      You can also use a transformer to copy metadata from metadata keys into the log events \
   themselves. This metadata can include log group name, log stream name, account ID and Region.\n\
  \      \n\
  \       A transformer for a log group is a series of processors, where each processor applies \
   one type of transformation to the log events ingested into this log group. For more information \
   about the available processors to use in a transformer, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-Processors} \
   Processors that you can use}.\n\
  \       \n\
  \        Having log events in standardized format enables visibility across your applications \
   for your log analysis, reporting, and alarming needs. CloudWatch Logs provides transformation \
   for common log types with out-of-the-box transformation templates for major Amazon Web Services \
   log sources such as VPC flow logs, Lambda, and Amazon RDS. You can use pre-built transformation \
   templates or create custom transformation policies.\n\
  \        \n\
  \         You can create transformers only for the log groups in the Standard log class.\n\
  \         \n\
  \          You can have one account-level transformer policy that applies to all log groups in \
   the account. Or you can create as many as 20 account-level transformer policies that are each \
   scoped to a subset of log groups with the [selectionCriteria] parameter. If you have multiple \
   account-level transformer policies with selection criteria, no two of them can use the same or \
   overlapping log group name prefixes. For example, if you have one policy filtered to log groups \
   that start with [my-log], you can't have another transformer policy filtered to [my-logpprod] \
   or [my-logging].\n\
  \          \n\
  \           You can also set up a transformer at the log-group level. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html}PutTransformer}. \
   If there is both a log-group level transformer created with [PutTransformer] and an \
   account-level transformer that could apply to the same log group, the log group uses only the \
   log-group level transformer. It ignores the account-level transformer.\n\
  \           \n\
  \             {b Field index policy} \n\
  \            \n\
  \             You can use field index policies to create indexes on fields found in log events \
   for a log group or data source name and type combination. Creating field indexes can help lower \
   the scan volume for CloudWatch Logs Insights queries that reference those fields, because these \
   queries attempt to skip the processing of log events that are known to not match the indexed \
   field. Good fields to index are fields that you often need to query for and fields or values \
   that match only a small fraction of the total log events. Common examples of indexes include \
   request ID, session ID, user IDs, or instance IDs. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html}Create \
   field indexes to improve query performance and reduce costs} \n\
  \             \n\
  \              To find the fields that are in your log group events, use the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogGroupFields.html}GetLogGroupFields} \
   operation. To find the fields for a data source use the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogFields.html}GetLogFields} \
   operation.\n\
  \              \n\
  \               For example, suppose you have created a field index for [requestId]. Then, any \
   CloudWatch Logs Insights query on that log group that includes \n\
  \               {[\n\
  \               requestId = {i value} \n\
  \               ]}\n\
  \                or \n\
  \               {[\n\
  \               requestId in \\[{i value}, {i value}, ...\\]\n\
  \               ]}\n\
  \                will attempt to process only the log events where the indexed field matches the \
   specified value.\n\
  \               \n\
  \                Matches of log events to the names of indexed fields are case-sensitive. For \
   example, an indexed field of [RequestId] won't match a log event containing [requestId].\n\
  \                \n\
  \                 You can have one account-level field index policy that applies to all log \
   groups in the account. Or you can create as many as 20 account-level field index policies that \
   are each scoped to a subset of log groups using [LogGroupNamePrefix] with the \
   [selectionCriteria] parameter. You can have another 20 account-level field index policies using \
   [DataSourceName] and [DataSourceType] for the [selectionCriteria] parameter. If you have \
   multiple account-level index policies with [LogGroupNamePrefix] selection criteria, no two of \
   them can use the same or overlapping log group name prefixes. For example, if you have one \
   policy filtered to log groups that start with {i my-log}, you can't have another field index \
   policy filtered to {i my-logpprod} or {i my-logging}. Similarly, if you have multiple \
   account-level index policies with [DataSourceName] and [DataSourceType] selection criteria, no \
   two of them can use the same data source name and type combination. For example, if you have \
   one policy filtered to the data source name [amazon_vpc] and data source type [flow] you cannot \
   create another policy with this combination.\n\
  \                 \n\
  \                  If you create an account-level field index policy in a monitoring account in \
   cross-account observability, the policy is applied only to the monitoring account and not to \
   any source accounts.\n\
  \                  \n\
  \                   CloudWatch Logs provides default field indexes for all log groups in the \
   Standard log class. Default field indexes are automatically available for the following fields: \n\
  \                   \n\
  \                    {ul\n\
  \                          {-   [@logStream] \n\
  \                              \n\
  \                               }\n\
  \                          {-   [@aws.region] \n\
  \                              \n\
  \                               }\n\
  \                          {-   [@aws.account] \n\
  \                              \n\
  \                               }\n\
  \                          {-   [@source.log] \n\
  \                              \n\
  \                               }\n\
  \                          {-   [@data_source_name] \n\
  \                              \n\
  \                               }\n\
  \                          {-   [@data_source_type] \n\
  \                              \n\
  \                               }\n\
  \                          {-   [@data_format] \n\
  \                              \n\
  \                               }\n\
  \                          {-   [traceId] \n\
  \                              \n\
  \                               }\n\
  \                          {-   [severityText] \n\
  \                              \n\
  \                               }\n\
  \                          {-   [attributes.session.id] \n\
  \                              \n\
  \                               }\n\
  \                          }\n\
  \   CloudWatch Logs provides default field indexes for certain data source name and type \
   combinations as well. Default field indexes are automatically available for the following data \
   source name and type combinations as identified in the following list:\n\
  \   \n\
  \     [amazon_vpc.flow] \n\
  \    \n\
  \     {ul\n\
  \           {-   [action] \n\
  \               \n\
  \                }\n\
  \           {-   [logStatus] \n\
  \               \n\
  \                }\n\
  \           {-   [region] \n\
  \               \n\
  \                }\n\
  \           {-   [flowDirection] \n\
  \               \n\
  \                }\n\
  \           {-   [type] \n\
  \               \n\
  \                }\n\
  \           }  [amazon_route53.resolver_query] \n\
  \             \n\
  \              {ul\n\
  \                    {-   [transport] \n\
  \                        \n\
  \                         }\n\
  \                    {-   [rcode] \n\
  \                        \n\
  \                         }\n\
  \                    }  [aws_waf.access] \n\
  \                      \n\
  \                       {ul\n\
  \                             {-   [action] \n\
  \                                 \n\
  \                                  }\n\
  \                             {-   [httpRequest.country] \n\
  \                                 \n\
  \                                  }\n\
  \                             }\n\
  \    [aws_cloudtrail.data], [aws_cloudtrail.management] \n\
  \   \n\
  \    {ul\n\
  \          {-   [eventSource] \n\
  \              \n\
  \               }\n\
  \          {-   [eventName] \n\
  \              \n\
  \               }\n\
  \          {-   [awsRegion] \n\
  \              \n\
  \               }\n\
  \          {-   [userAgent] \n\
  \              \n\
  \               }\n\
  \          {-   [errorCode] \n\
  \              \n\
  \               }\n\
  \          {-   [eventType] \n\
  \              \n\
  \               }\n\
  \          {-   [managementEvent] \n\
  \              \n\
  \               }\n\
  \          {-   [readOnly] \n\
  \              \n\
  \               }\n\
  \          {-   [eventCategory] \n\
  \              \n\
  \               }\n\
  \          {-   [requestId] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   Default field indexes are in addition to any custom field indexes you define within your \
   policy. Default field indexes are not counted towards your \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing-Syntax}field \
   index quota}. \n\
  \   \n\
  \    If you want to create a field index policy for a single log group, you can use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html}PutIndexPolicy} \
   instead of [PutAccountPolicy]. If you do so, that log group will use that log-group level \
   policy and any account-level policies that match at the data source level; any account-level \
   policy that matches at the log group level (for example, no selection criteria or log group \
   name prefix selection criteria) will be ignored.\n\
  \    \n\
  \      {b Metric extraction policy} \n\
  \     \n\
  \      A metric extraction policy controls whether CloudWatch Metrics can be created through the \
   Embedded Metrics Format (EMF) for log groups in your account. By default, EMF metric creation \
   is enabled for all log groups. You can use metric extraction policies to disable EMF metric \
   creation for your entire account or specific log groups.\n\
  \      \n\
  \       When a policy disables EMF metric creation for a log group, log events in the EMF format \
   are still ingested, but no CloudWatch Metrics are created from them.\n\
  \       \n\
  \         Creating a policy disables metrics for Amazon Web Services features that use EMF to \
   create metrics, such as CloudWatch Container Insights and CloudWatch Application Signals. To \
   prevent turning off those features by accident, we recommend that you exclude the underlying \
   log-groups through a selection-criteria such as [LogGroupNamePrefix NOT IN \
   \\[\"/aws/containerinsights\",\n\
  \          \"/aws/ecs/containerinsights\", \"/aws/application-signals/data\"\\]].\n\
  \         \n\
  \           Each account can have either one account-level metric extraction policy that applies \
   to all log groups, or up to 5 policies that are each scoped to a subset of log groups with the \
   [selectionCriteria] parameter. The selection criteria supports filtering by [LogGroupName] and \
   [LogGroupNamePrefix] using the operators [IN] and [NOT IN]. You can specify up to 50 values in \
   each [IN] or [NOT IN] list.\n\
  \           \n\
  \            The selection criteria can be specified in these formats:\n\
  \            \n\
  \              [LogGroupName IN \\[\"log-group-1\", \"log-group-2\"\\]] \n\
  \             \n\
  \               [LogGroupNamePrefix NOT IN \\[\"/aws/prefix1\", \"/aws/prefix2\"\\]] \n\
  \              \n\
  \               If you have multiple account-level metric extraction policies with selection \
   criteria, no two of them can have overlapping criteria. For example, if you have one policy \
   with selection criteria [LogGroupNamePrefix IN \\[\"my-log\"\\]], you can't have another metric \
   extraction policy with selection criteria [LogGroupNamePrefix IN \\[\"/my-log-prod\"\\]] or \
   [LogGroupNamePrefix IN \\[\"/my-logging\"\\]], as the set of log groups matching these prefixes \
   would be a subset of the log groups matching the first policy's prefix, creating an overlap.\n\
  \               \n\
  \                When using [NOT IN], only one policy with this operator is allowed per account.\n\
  \                \n\
  \                 When combining policies with [IN] and [NOT IN] operators, the overlap check \
   ensures that policies don't have conflicting effects. Two policies with [IN] and [NOT IN] \
   operators do not overlap if and only if every value in the [IN ]policy is completely contained \
   within some value in the [NOT\n\
  \        IN] policy. For example:\n\
  \                 \n\
  \                  {ul\n\
  \                        {-  If you have a [NOT IN] policy for prefix [\"/aws/lambda\"], you can \
   create an [IN] policy for the exact log group name [\"/aws/lambda/function1\"] because the set \
   of log groups matching [\"/aws/lambda/function1\"] is a subset of the log groups matching \
   [\"/aws/lambda\"].\n\
  \                            \n\
  \                             }\n\
  \                        {-  If you have a [NOT IN] policy for prefix [\"/aws/lambda\"], you \
   cannot create an [IN] policy for prefix [\"/aws\"] because the set of log groups matching \
   [\"/aws\"] is not a subset of the log groups matching [\"/aws/lambda\"].\n\
  \                            \n\
  \                             }\n\
  \                        }\n\
  \  "]

module PutBearerTokenAuthentication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_bearer_token_authentication_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_bearer_token_authentication_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables or disables bearer token authentication for the specified log group. When enabled on a \
   log group, bearer token authentication is enabled on operations until it is explicitly \
   disabled.\n\n\
  \ For information about the parameters that are common to all actions, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/CommonParameters.html}Common \
   Parameters}.\n\
  \ "]

module PutDataProtectionPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_data_protection_policy_request ->
    ( put_data_protection_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_data_protection_policy_request ->
    ( put_data_protection_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a data protection policy for the specified log group. A data protection policy can help \
   safeguard sensitive data that's ingested by the log group by auditing and masking the sensitive \
   log data.\n\n\
  \  Sensitive data is detected and masked when it is ingested into the log group. When you set a \
   data protection policy, log events ingested into the log group before that time are not masked.\n\
  \  \n\
  \    By default, when a user views a log event that includes masked data, the sensitive data is \
   replaced by asterisks. A user who has the [logs:Unmask] permission can use a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html}GetLogEvents} \
   or \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html}FilterLogEvents} \
   operation with the [unmask] parameter set to [true] to view the unmasked log events. Users with \
   the [logs:Unmask] can also view unmasked data in the CloudWatch Logs console by running a \
   CloudWatch Logs Insights query with the [unmask] query command.\n\
  \    \n\
  \     For more information, including a list of types of data that can be audited and masked, \
   see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html}Protect \
   sensitive log data with masking}.\n\
  \     \n\
  \      The [PutDataProtectionPolicy] operation applies to only the specified log group. You can \
   also use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html}PutAccountPolicy} \
   to create an account-level data protection policy that applies to all log groups in the \
   account, including both existing log groups and log groups that are created level. If a log \
   group has its own data protection policy and the account also has an account-level data \
   protection policy, then the two policies are cumulative. Any sensitive term specified in either \
   policy is masked.\n\
  \      "]

module PutDeliveryDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_delivery_destination_request ->
    ( put_delivery_destination_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_delivery_destination_request ->
    ( put_delivery_destination_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a logical {i delivery destination}. A delivery destination is an Amazon Web \
   Services resource that represents an Amazon Web Services service that logs can be sent to. \
   CloudWatch Logs, Amazon S3, and Firehose are supported as logs delivery destinations and X-Ray \
   as the trace delivery destination.\n\n\
  \ To configure logs delivery between a supported Amazon Web Services service and a destination, \
   you must do the following:\n\
  \ \n\
  \  {ul\n\
  \        {-  Create a delivery source, which is a logical object that represents the resource \
   that is actually sending the logs. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html}PutDeliverySource}.\n\
  \            \n\
  \             }\n\
  \        {-  Use [PutDeliveryDestination] to create a {i delivery destination} in the same \
   account of the actual delivery destination. The delivery destination that you create is a \
   logical object that represents the actual delivery destination. \n\
  \            \n\
  \             }\n\
  \        {-  If you are delivering logs cross-account, you must use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html}PutDeliveryDestinationPolicy} \
   in the destination account to assign an IAM policy to the destination. This policy allows \
   delivery to that destination. \n\
  \            \n\
  \             }\n\
  \        {-  Use [CreateDelivery] to create a {i delivery} by pairing exactly one delivery \
   source and one delivery destination. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery}. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   You can configure a single delivery source to send logs to multiple destinations by creating \
   multiple deliveries. You can also create multiple deliveries to configure multiple delivery \
   sources to send logs to the same delivery destination.\n\
  \   \n\
  \    Only some Amazon Web Services services support being configured as a delivery source. These \
   services are listed as {b Supported \\[V2 Permissions\\]} in the table at \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html}Enabling \
   logging from Amazon Web Services services.} \n\
  \    \n\
  \     If you use this operation to update an existing delivery destination, all the current \
   delivery destination parameters are overwritten with the new parameter values that you specify.\n\
  \     "]

module PutDeliveryDestinationPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_delivery_destination_policy_request ->
    ( put_delivery_destination_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_delivery_destination_policy_request ->
    ( put_delivery_destination_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates and assigns an IAM policy that grants permissions to CloudWatch Logs to deliver logs \
   cross-account to a specified destination in this account. To configure the delivery of logs \
   from an Amazon Web Services service in another account to a logs delivery destination in the \
   current account, you must do the following:\n\n\
  \ {ul\n\
  \       {-  Create a delivery source, which is a logical object that represents the resource \
   that is actually sending the logs. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html}PutDeliverySource}.\n\
  \           \n\
  \            }\n\
  \       {-  Create a {i delivery destination}, which is a logical object that represents the \
   actual delivery destination. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html}PutDeliveryDestination}.\n\
  \           \n\
  \            }\n\
  \       {-  Use this operation in the destination account to assign an IAM policy to the \
   destination. This policy allows delivery to that destination. \n\
  \           \n\
  \            }\n\
  \       {-  Create a {i delivery} by pairing exactly one delivery source and one delivery \
   destination. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery}.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Only some Amazon Web Services services support being configured as a delivery source. These \
   services are listed as {b Supported \\[V2 Permissions\\]} in the table at \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html}Enabling \
   logging from Amazon Web Services services.} \n\
  \   \n\
  \    The contents of the policy must include two statements. One statement enables general logs \
   delivery, and the other allows delivery to the chosen destination. See the examples for the \
   needed policies.\n\
  \    "]

module PutDeliverySource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_delivery_source_request ->
    ( put_delivery_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_delivery_source_request ->
    ( put_delivery_source_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a logical {i delivery source}. A delivery source represents an Amazon Web \
   Services resource that sends logs to an logs delivery destination. The destination can be \
   CloudWatch Logs, Amazon S3, Firehose or X-Ray for sending traces.\n\n\
  \ To configure logs delivery between a delivery destination and an Amazon Web Services service \
   that is supported as a delivery source, you must do the following:\n\
  \ \n\
  \  {ul\n\
  \        {-  Use [PutDeliverySource] to create a delivery source, which is a logical object that \
   represents the resource that is actually sending the logs. \n\
  \            \n\
  \             }\n\
  \        {-  Use [PutDeliveryDestination] to create a {i delivery destination}, which is a \
   logical object that represents the actual delivery destination. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html}PutDeliveryDestination}.\n\
  \            \n\
  \             }\n\
  \        {-  If you are delivering logs cross-account, you must use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html}PutDeliveryDestinationPolicy} \
   in the destination account to assign an IAM policy to the destination. This policy allows \
   delivery to that destination. \n\
  \            \n\
  \             }\n\
  \        {-  Use [CreateDelivery] to create a {i delivery} by pairing exactly one delivery \
   source and one delivery destination. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html}CreateDelivery}. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   You can configure a single delivery source to send logs to multiple destinations by creating \
   multiple deliveries. You can also create multiple deliveries to configure multiple delivery \
   sources to send logs to the same delivery destination.\n\
  \   \n\
  \    Only some Amazon Web Services services support being configured as a delivery source. These \
   services are listed as {b Supported \\[V2 Permissions\\]} in the table at \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html}Enabling \
   logging from Amazon Web Services services.} \n\
  \    \n\
  \     If you use this operation to update an existing delivery source, all the current delivery \
   source parameters are overwritten with the new parameter values that you specify.\n\
  \     "]

module PutDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_destination_request ->
    ( put_destination_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_destination_request ->
    ( put_destination_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a destination. This operation is used only to create destinations for \
   cross-account subscriptions.\n\n\
  \ A destination encapsulates a physical resource (such as an Amazon Kinesis stream). With a \
   destination, you can subscribe to a real-time stream of log events for a different account, \
   ingested using \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html}PutLogEvents}.\n\
  \ \n\
  \  Through an access policy, a destination controls what is written to it. By default, \
   [PutDestination] does not set any access policy with the destination, which means a \
   cross-account user cannot call \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutSubscriptionFilter.html}PutSubscriptionFilter} \
   against this destination. To enable this, the destination owner must call \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html}PutDestinationPolicy} \
   after [PutDestination].\n\
  \  \n\
  \   To perform a [PutDestination] operation, you must also have the [iam:PassRole] permission.\n\
  \   "]

module PutDestinationPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_destination_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_destination_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an access policy associated with an existing destination. An access policy \
   is an {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html}IAM policy \
   document} that is used to authorize claims to register a subscription filter against a given \
   destination.\n"]

module PutIndexPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_index_policy_request ->
    ( put_index_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_index_policy_request ->
    ( put_index_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a {i field index policy} for the specified log group. Only log groups in the \
   Standard log class support field index policies. For more information about log classes, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html}Log \
   classes}.\n\n\
  \ You can use field index policies to create {i field indexes} on fields found in log events in \
   the log group. Creating field indexes speeds up and lowers the costs for CloudWatch Logs \
   Insights queries that reference those field indexes, because these queries attempt to skip the \
   processing of log events that are known to not match the indexed field. Good fields to index \
   are fields that you often need to query for and fields or values that match only a small \
   fraction of the total log events. Common examples of indexes include request ID, session ID, \
   userID, and instance IDs. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html}Create \
   field indexes to improve query performance and reduce costs}.\n\
  \ \n\
  \  You can configure indexed fields as {i facets} to enable interactive exploration and \
   filtering of your logs in the CloudWatch Logs Insights console. Facets allow you to view value \
   distributions and counts for indexed fields without running queries. When you create a field \
   index, you can optionally set it as a facet to enable this interactive analysis capability. For \
   more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Facets.html}Use \
   facets to group and explore logs}.\n\
  \  \n\
  \   To find the fields that are in your log group events, use the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogGroupFields.html}GetLogGroupFields} \
   operation.\n\
  \   \n\
  \    For example, suppose you have created a field index for [requestId]. Then, any CloudWatch \
   Logs Insights query on that log group that includes \n\
  \    {[\n\
  \    requestId = {i value} \n\
  \    ]}\n\
  \     or \n\
  \    {[\n\
  \    requestId IN \\[{i value}, {i value}, ...\\]\n\
  \    ]}\n\
  \     will process fewer log events to reduce costs, and have improved performance.\n\
  \    \n\
  \     CloudWatch Logs provides default field indexes for all log groups in the Standard log \
   class. Default field indexes are automatically available for the following fields: \n\
  \     \n\
  \      {ul\n\
  \            {-   [@logStream] \n\
  \                \n\
  \                 }\n\
  \            {-   [@aws.region] \n\
  \                \n\
  \                 }\n\
  \            {-   [@aws.account] \n\
  \                \n\
  \                 }\n\
  \            {-   [@source.log] \n\
  \                \n\
  \                 }\n\
  \            {-   [traceId] \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   Default field indexes are in addition to any custom field indexes you define within your \
   policy. Default field indexes are not counted towards your field index quota. \n\
  \   \n\
  \    Each index policy has the following quotas and restrictions:\n\
  \    \n\
  \     {ul\n\
  \           {-  As many as 20 fields can be included in the policy.\n\
  \               \n\
  \                }\n\
  \           {-  Each field name can include as many as 100 characters.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   Matches of log events to the names of indexed fields are case-sensitive. For example, a \
   field index of [RequestId] won't match a log event containing [requestId].\n\
  \   \n\
  \    Log group-level field index policies created with [PutIndexPolicy] override account-level \
   field index policies created with \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html}PutAccountPolicy} \
   that apply to log groups. If you use [PutIndexPolicy] to create a field index policy for a log \
   group, that log group uses only that policy for log group-level indexing, including any facet \
   configurations. The log group ignores any account-wide field index policy that applies to log \
   groups, but data source-based account policies may still apply.\n\
  \    "]

module PutIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_integration_request ->
    ( put_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_integration_request ->
    ( put_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an integration between CloudWatch Logs and another service in this account. Currently, \
   only integrations with OpenSearch Service are supported, and currently you can have only one \
   integration in your account.\n\n\
  \ Integrating with OpenSearch Service makes it possible for you to create curated vended logs \
   dashboards, powered by OpenSearch Service analytics. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-OpenSearch-Dashboards.html}Vended \
   log dashboards powered by Amazon OpenSearch Service}.\n\
  \ \n\
  \  You can use this operation only to create a new integration. You can't modify an existing \
   integration.\n\
  \  "]

module PutLogEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataAlreadyAcceptedException of data_already_accepted_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSequenceTokenException of invalid_sequence_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `UnrecognizedClientException of unrecognized_client_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_log_events_request ->
    ( put_log_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataAlreadyAcceptedException of data_already_accepted_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSequenceTokenException of invalid_sequence_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `UnrecognizedClientException of unrecognized_client_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_log_events_request ->
    ( put_log_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataAlreadyAcceptedException of data_already_accepted_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSequenceTokenException of invalid_sequence_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `UnrecognizedClientException of unrecognized_client_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Uploads a batch of log events to the specified log stream.\n\n\
  \  The sequence token is now ignored in [PutLogEvents] actions. [PutLogEvents] actions are \
   always accepted and never return [InvalidSequenceTokenException] or \
   [DataAlreadyAcceptedException] even if the sequence token is not valid. You can use parallel \
   [PutLogEvents] actions on the same log stream. \n\
  \  \n\
  \    The batch of events must satisfy the following constraints:\n\
  \    \n\
  \     {ul\n\
  \           {-  The maximum batch size is 1,048,576 bytes. This size is calculated as the sum of \
   all event messages in UTF-8, plus 26 bytes for each log event.\n\
  \               \n\
  \                }\n\
  \           {-  Events more than 2 hours in the future are rejected while processing remaining \
   valid events.\n\
  \               \n\
  \                }\n\
  \           {-  Events older than 14 days or preceding the log group's retention period are \
   rejected while processing remaining valid events.\n\
  \               \n\
  \                }\n\
  \           {-  The log events in the batch must be in chronological order by their timestamp. \
   The timestamp is the time that the event occurred, expressed as the number of milliseconds \
   after [Jan 1, 1970 00:00:00 UTC]. (In Amazon Web Services Tools for PowerShell and the Amazon \
   Web Services SDK for .NET, the timestamp is specified in .NET format: [yyyy-mm-ddThh:mm:ss]. \
   For example, [2017-09-15T13:45:30].) \n\
  \               \n\
  \                }\n\
  \           {-   A batch of log events in a single request must be in a chronological order. \
   Otherwise, the operation fails.\n\
  \               \n\
  \                }\n\
  \           {-  Each log event can be no larger than 1 MB.\n\
  \               \n\
  \                }\n\
  \           {-  The maximum number of log events in a batch is 10,000.\n\
  \               \n\
  \                }\n\
  \           {-  For valid events (within 14 days in the past to 2 hours in future), the time \
   span in a single batch cannot exceed 24 hours. Otherwise, the operation fails.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \    The quota of five requests per second per log stream has been removed. Instead, \
   [PutLogEvents] actions are throttled based on a per-second per-account quota. You can request \
   an increase to the per-second throttling quota by using the Service Quotas service.\n\
  \    \n\
  \      If a call to [PutLogEvents] returns \"UnrecognizedClientException\" the most likely cause \
   is a non-valid Amazon Web Services access key ID or secret key. \n\
  \      "]

module PutLogGroupDeletionProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_log_group_deletion_protection_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_log_group_deletion_protection_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables or disables deletion protection for the specified log group. When enabled on a log \
   group, deletion protection blocks all deletion operations until it is explicitly disabled.\n\n\
  \ For information about the parameters that are common to all actions, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/CommonParameters.html}Common \
   Parameters}.\n\
  \ "]

module PutMetricFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_metric_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_metric_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a metric filter and associates it with the specified log group. With metric \
   filters, you can configure rules to extract metric data from log events ingested through \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html}PutLogEvents}.\n\n\
  \ The maximum number of metric filters that can be associated with a log group is 100.\n\
  \ \n\
  \  Using regular expressions in filter patterns is supported. For these filters, there is a \
   quota of two regular expression patterns within a single filter pattern. There is also a quota \
   of five regular expression patterns per log group. For more information about using regular \
   expressions in filter patterns, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html} Filter \
   pattern syntax for metric filters, subscription filters, filter log events, and Live Tail}.\n\
  \  \n\
  \   When you create a metric filter, you can also optionally assign a unit and dimensions to the \
   metric that is created.\n\
  \   \n\
  \     Metrics extracted from log events are charged as custom metrics. To prevent unexpected \
   high charges, do not specify high-cardinality fields such as [IPAddress] or [requestID] as \
   dimensions. Each different value found for a dimension is treated as a separate metric and \
   accrues charges as a separate custom metric. \n\
  \     \n\
  \      CloudWatch Logs might disable a metric filter if it generates 1,000 different name/value \
   pairs for your specified dimensions within one hour.\n\
  \      \n\
  \       You can also set up a billing alarm to alert you if your charges are higher than \
   expected. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html} \
   Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services Charges}. \n\
  \       \n\
  \        "]

module PutQueryDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_query_definition_request ->
    ( put_query_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_query_definition_request ->
    ( put_query_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a query definition for CloudWatch Logs Insights. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html}Analyzing Log \
   Data with CloudWatch Logs Insights}.\n\n\
  \ To update a query definition, specify its [queryDefinitionId] in your request. The values of \
   [name], [queryString], and [logGroupNames] are changed to the values that you specify in your \
   update operation. No current values are retained from the current query definition. For \
   example, imagine updating a current query definition that includes log groups. If you don't \
   specify the [logGroupNames] parameter in your update operation, the query definition changes to \
   contain no log groups.\n\
  \ \n\
  \  You must have the [logs:PutQueryDefinition] permission to be able to perform this operation.\n\
  \  "]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a resource policy allowing other Amazon Web Services services to put log \
   events to this account, such as Amazon Route 53. This API has the following restrictions:\n\n\
  \ {ul\n\
  \       {-   {b Supported actions} - Policy only supports [logs:PutLogEvents] and \
   [logs:CreateLogStream ] actions\n\
  \           \n\
  \            }\n\
  \       {-   {b Supported principals} - Policy only applies when operations are invoked by \
   Amazon Web Services service principals (not IAM users, roles, or cross-account principals\n\
  \           \n\
  \            }\n\
  \       {-   {b Policy limits} - An account can have a maximum of 10 policies without \
   resourceARN and one per LogGroup resourceARN\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    Resource policies with actions invoked by non-Amazon Web Services service principals (such \
   as IAM users, roles, or other Amazon Web Services accounts) will not be enforced. For access \
   control involving these principals, use the IAM policies.\n\
  \    \n\
  \     "]

module PutRetentionPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_retention_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_retention_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the retention of the specified log group. With a retention policy, you can configure the \
   number of days for which to retain log events in the specified log group.\n\n\
  \  CloudWatch Logs doesn't immediately delete log events when they reach their retention \
   setting. It typically takes up to 72 hours after that before log events are deleted, but in \
   rare situations might take longer.\n\
  \  \n\
  \   To illustrate, imagine that you change a log group to have a longer retention setting when \
   it contains log events that are past the expiration date, but haven't been deleted. Those log \
   events will take up to 72 hours to be deleted after the new retention date is reached. To make \
   sure that log data is deleted permanently, keep a log group at its lower retention setting \
   until 72 hours after the previous retention period ends. Alternatively, wait to change the \
   retention setting until you confirm that the earlier log events are deleted. \n\
  \   \n\
  \    When log events reach their retention setting they are marked for deletion. After they are \
   marked for deletion, they do not add to your archival storage costs anymore, even if they are \
   not actually deleted until later. These log events marked for deletion are also not included \
   when you use an API to retrieve the [storedBytes] value to see how many bytes a log group is \
   storing.\n\
  \    \n\
  \     "]

module PutSubscriptionFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_subscription_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_subscription_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a subscription filter and associates it with the specified log group. With \
   subscription filters, you can subscribe to a real-time stream of log events ingested through \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html}PutLogEvents} \
   and have them delivered to a specific destination. When log events are sent to the receiving \
   service, they are Base64 encoded and compressed with the GZIP format.\n\n\
  \ The following destinations are supported for subscription filters:\n\
  \ \n\
  \  {ul\n\
  \        {-  An Amazon Kinesis data stream belonging to the same account as the subscription \
   filter, for same-account delivery.\n\
  \            \n\
  \             }\n\
  \        {-  A logical destination created with \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html}PutDestination} \
   that belongs to a different account, for cross-account delivery. We currently support Kinesis \
   Data Streams and Firehose as logical destinations.\n\
  \            \n\
  \             }\n\
  \        {-  An Amazon Kinesis Data Firehose delivery stream that belongs to the same account as \
   the subscription filter, for same-account delivery.\n\
  \            \n\
  \             }\n\
  \        {-  An Lambda function that belongs to the same account as the subscription filter, for \
   same-account delivery.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Each log group can have up to two subscription filters associated with it. If you are \
   updating an existing filter, you must specify the correct name in [filterName]. \n\
  \   \n\
  \    Using regular expressions in filter patterns is supported. For these filters, there is a \
   quotas of quota of two regular expression patterns within a single filter pattern. There is \
   also a quota of five regular expression patterns per log group. For more information about \
   using regular expressions in filter patterns, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html} Filter \
   pattern syntax for metric filters, subscription filters, filter log events, and Live Tail}.\n\
  \    \n\
  \     To perform a [PutSubscriptionFilter] operation for any destination except a Lambda \
   function, you must also have the [iam:PassRole] permission.\n\
  \     "]

module PutSyslogConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_syslog_configuration_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_syslog_configuration_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a syslog configuration for a log group. This enables ingestion of syslog \
   data through the specified VPC endpoint into the log group.\n"]

module PutTransformer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_transformer_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_transformer_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a {i log transformer} for a single log group. You use log transformers to \
   transform log events into a different format, making them easier for you to process and \
   analyze. You can also transform logs from different sources into standardized formats that \
   contains relevant, source-specific information.\n\n\
  \ After you have created a transformer, CloudWatch Logs performs the transformations at the time \
   of log ingestion. You can then refer to the transformed versions of the logs during operations \
   such as querying with CloudWatch Logs Insights or creating metric filters or subscription \
   filers.\n\
  \ \n\
  \  You can also use a transformer to copy metadata from metadata keys into the log events \
   themselves. This metadata can include log group name, log stream name, account ID and Region.\n\
  \  \n\
  \   A transformer for a log group is a series of processors, where each processor applies one \
   type of transformation to the log events ingested into this log group. The processors work one \
   after another, in the order that you list them, like a pipeline. For more information about the \
   available processors to use in a transformer, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-Processors} \
   Processors that you can use}.\n\
  \   \n\
  \    Having log events in standardized format enables visibility across your applications for \
   your log analysis, reporting, and alarming needs. CloudWatch Logs provides transformation for \
   common log types with out-of-the-box transformation templates for major Amazon Web Services log \
   sources such as VPC flow logs, Lambda, and Amazon RDS. You can use pre-built transformation \
   templates or create custom transformation policies.\n\
  \    \n\
  \     You can create transformers only for the log groups in the Standard log class.\n\
  \     \n\
  \      You can also set up a transformer at the account level. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html}PutAccountPolicy}. \
   If there is both a log-group level transformer created with [PutTransformer] and an \
   account-level transformer that could apply to the same log group, the log group uses only the \
   log-group level transformer. It ignores the account-level transformer.\n\
  \      "]

module StartLiveTail : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_live_tail_request ->
    ( start_live_tail_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_live_tail_request ->
    ( start_live_tail_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a Live Tail streaming session for one or more log groups. A Live Tail session returns a \
   stream of log events that have been recently ingested in the log groups. For more information, \
   see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs_LiveTail.html}Use \
   Live Tail to view logs in near real time}. \n\n\
  \ The response to this operation is a response stream, over which the server sends live log \
   events and the client receives them.\n\
  \ \n\
  \  The following objects are sent over the stream:\n\
  \  \n\
  \   {ul\n\
  \         {-  A single \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_LiveTailSessionStart.html}LiveTailSessionStart} \
   object is sent at the start of the session.\n\
  \             \n\
  \              }\n\
  \         {-  Every second, a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_LiveTailSessionUpdate.html}LiveTailSessionUpdate} \
   object is sent. Each of these objects contains an array of the actual log events.\n\
  \             \n\
  \              If no new log events were ingested in the past second, the \
   [LiveTailSessionUpdate] object will contain an empty array.\n\
  \              \n\
  \               The array of log events contained in a [LiveTailSessionUpdate] can include as \
   many as 500 log events. If the number of log events matching the request exceeds 500 per \
   second, the log events are sampled down to 500 log events to be included in each \
   [LiveTailSessionUpdate] object.\n\
  \               \n\
  \                If your client consumes the log events slower than the server produces them, \
   CloudWatch Logs buffers up to 10 [LiveTailSessionUpdate] events or 5000 log events, after which \
   it starts dropping the oldest events.\n\
  \                \n\
  \                 }\n\
  \         {-  A \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartLiveTailResponseStream.html#CWL-Type-StartLiveTailResponseStream-SessionStreamingException}SessionStreamingException} \
   object is returned if an unknown error occurs on the server side.\n\
  \             \n\
  \              }\n\
  \         {-  A \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartLiveTailResponseStream.html#CWL-Type-StartLiveTailResponseStream-SessionTimeoutException}SessionTimeoutException} \
   object is returned when the session times out, after it has been kept open for three hours.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    The [StartLiveTail] API routes requests using SDK host prefix injection. SDK versions \
   released before April 1, 2026 route to \n\
  \    {[\n\
  \    streaming-logs.{i Region}.amazonaws.com\n\
  \    ]}\n\
  \    , which does not support VPC endpoints. SDK versions released on or after April 1, 2026 \
   route to \n\
  \    {[\n\
  \    stream-logs.{i Region}.amazonaws.com\n\
  \    ]}\n\
  \    , which supports VPC endpoints. To set up a VPC endpoint for this API, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/cloudwatch-logs-and-interface-VPC.html#create-VPC-endpoint-for-CloudWatchLogs}Creating \
   a VPC endpoint for CloudWatch Logs }.\n\
  \    \n\
  \       You can end a session before it times out by closing the session stream or by closing \
   the client that is receiving the stream. The session also ends if the established connection \
   between the client and the server breaks.\n\
  \       \n\
  \         For examples of using an SDK to start a Live Tail session, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/example_cloudwatch-logs_StartLiveTail_section.html} \
   Start a Live Tail session using an Amazon Web Services SDK}.\n\
  \         "]

module StartQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedQueryException of malformed_query_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_query_request ->
    ( start_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedQueryException of malformed_query_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_query_request ->
    ( start_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedQueryException of malformed_query_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a query of one or more log groups or data sources using CloudWatch Logs Insights. You \
   specify the log groups or data sources and time range to query and the query string to use. You \
   can query up to 10 data sources in a single query.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html}CloudWatch \
   Logs Insights Query Syntax}.\n\
  \ \n\
  \  After you run a query using [StartQuery], the query results are stored by CloudWatch Logs. \
   You can use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html}GetQueryResults} \
   to retrieve the results of a query, using the [queryId] that [StartQuery] returns. \n\
  \  \n\
  \   Interactive queries started with [StartQuery] share concurrency limits with automated \
   scheduled query executions. Both types of queries count toward the same regional concurrent \
   query quota, so high scheduled query activity may affect the availability of concurrent slots \
   for interactive queries.\n\
  \   \n\
  \     To specify the log groups to query, a [StartQuery] operation must include one of the \
   following:\n\
  \     \n\
  \      {ul\n\
  \            {-  Either exactly one of the following parameters: [logGroupName], \
   [logGroupNames], or [logGroupIdentifiers] \n\
  \                \n\
  \                 }\n\
  \            {-  Or the [queryString] must include a [SOURCE] command to select log groups for \
   the query. The [SOURCE] command can select log groups based on log group name prefix, account \
   ID, and log class, or select data sources using dataSource syntax in LogsQL, PPL, and SQL. In \
   LogsQL, the [SOURCE] command also supports filtering by log group tags. \n\
  \                \n\
  \                 For more information about the [SOURCE] command, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax-Source.html}SOURCE}.\n\
  \                 \n\
  \                  }\n\
  \            }\n\
  \    If you have associated a KMS key with the query results in this account, then \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html}StartQuery} \
   uses that key to encrypt the results when it stores them. If no key is associated with query \
   results, the query results are encrypted with the default CloudWatch Logs encryption method.\n\
  \    \n\
  \     Queries time out after 60 minutes of runtime. If your queries are timing out, reduce the \
   time range being searched or partition your query into a number of queries.\n\
  \     \n\
  \      If you are using CloudWatch cross-account observability, you can use this operation in a \
   monitoring account to start a query in a linked source account. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html}CloudWatch \
   cross-account observability}. For a cross-account [StartQuery] operation, the query definition \
   must be defined in the monitoring account.\n\
  \      \n\
  \       You can have up to 100 concurrent CloudWatch Logs insights queries, including queries \
   that have been added to dashboards. \n\
  \       "]

module StopQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_query_request ->
    ( stop_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_query_request ->
    ( stop_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a CloudWatch Logs Insights query that is in progress. If the query has already ended, the \
   operation returns an error indicating that the specified query is not running.\n\n\
  \ This operation can be used to cancel both interactive queries and individual scheduled query \
   executions. When used with scheduled queries, [StopQuery] cancels only the specific execution \
   identified by the query ID, not the scheduled query configuration itself.\n\
  \ "]

module TagLogGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_log_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_log_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The TagLogGroup operation is on the path to deprecation. We recommend that you use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html}TagResource} \
   instead.\n\
  \ \n\
  \   Adds or updates the specified tags for the specified log group.\n\
  \   \n\
  \    To list the tags for a log group, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html}ListTagsForResource}. \
   To remove tags, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html}UntagResource}.\n\
  \    \n\
  \     For more information about tags, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html#log-group-tagging}Tag \
   Log Groups in Amazon CloudWatch Logs} in the {i Amazon CloudWatch Logs User Guide}.\n\
  \     \n\
  \      CloudWatch Logs doesn't support IAM policies that prevent users from assigning specified \
   tags to log groups using the \n\
  \      {[\n\
  \      aws:Resource/{i key-name} \n\
  \      ]}\n\
  \       or [aws:TagKeys] condition keys. For more information about using tags to control \
   access, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html}Controlling \
   access to Amazon Web Services resources using tags}.\n\
  \      "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns one or more tags (key-value pairs) to the specified CloudWatch Logs resource. \
   Currently, the only CloudWatch Logs resources that can be tagged are log groups and \
   destinations. \n\n\
  \ Tags can help you organize and categorize your resources. You can also use them to scope user \
   permissions by granting a user permission to access or change only resources with certain tag \
   values.\n\
  \ \n\
  \  Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as \
   strings of characters.\n\
  \  \n\
  \   You can use the [TagResource] action with a resource that already has tags. If you specify a \
   new tag key for the alarm, this tag is appended to the list of tags associated with the alarm. \
   If you specify a tag key that is already associated with the alarm, the new tag value that you \
   specify replaces the previous value for that tag.\n\
  \   \n\
  \    You can associate as many as 50 tags with a CloudWatch Logs resource.\n\
  \    "]

module TestMetricFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_metric_filter_request ->
    ( test_metric_filter_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_metric_filter_request ->
    ( test_metric_filter_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Tests the filter pattern of a metric filter against a sample of log event messages. You can use \
   this operation to validate the correctness of a metric filter pattern.\n"]

module TestTransformer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidOperationException of invalid_operation_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_transformer_request ->
    ( test_transformer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_transformer_request ->
    ( test_transformer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidOperationException of invalid_operation_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to test a log transformer. You enter the transformer configuration and a set \
   of log events to test with. The operation responds with an array that includes the original log \
   events and the transformed versions.\n"]

module UntagLogGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_log_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_log_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The UntagLogGroup operation is on the path to deprecation. We recommend that you use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html}UntagResource} \
   instead.\n\
  \ \n\
  \   Removes the specified tags from the specified log group.\n\
  \   \n\
  \    To list the tags for a log group, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html}ListTagsForResource}. \
   To add tags, use \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html}TagResource}.\n\
  \    \n\
  \     When using IAM policies to control tag management for CloudWatch Logs log groups, the \
   condition keys [aws:Resource/key-name] and [aws:TagKeys] cannot be used to restrict which tags \
   users can assign. \n\
  \     "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes one or more tags from the specified resource.\n"]

module UpdateAnomaly : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_anomaly_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_anomaly_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to {i suppress} anomaly detection for a specified anomaly or pattern. If you \
   suppress an anomaly, CloudWatch Logs won't report new occurrences of that anomaly and won't \
   update that anomaly with new data. If you suppress a pattern, CloudWatch Logs won't report any \
   anomalies related to that pattern.\n\n\
  \ You must specify either [anomalyId] or [patternId], but you can't specify both parameters in \
   the same operation.\n\
  \ \n\
  \  If you have previously used this operation to suppress detection of a pattern or anomaly, you \
   can use it again to cause CloudWatch Logs to end the suppression. To do this, use this \
   operation and specify the anomaly or pattern to stop suppressing, and omit the \
   [suppressionType] and [suppressionPeriod] parameters.\n\
  \  "]

module UpdateDeliveryConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_delivery_configuration_request ->
    ( update_delivery_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_delivery_configuration_request ->
    ( update_delivery_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to update the configuration of a \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_Delivery.html}delivery} \
   to change either the S3 path pattern or the format of the delivered logs. You can't use this \
   operation to change the source or destination of the delivery.\n"]

module UpdateLogAnomalyDetector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `OperationAbortedException of operation_aborted_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_log_anomaly_detector_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_log_anomaly_detector_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `OperationAbortedException of operation_aborted_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing log anomaly detector.\n"]

module UpdateLookupTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_lookup_table_request ->
    ( update_lookup_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_lookup_table_request ->
    ( update_lookup_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing lookup table by replacing all of its CSV content. After the update \
   completes, queries that use this table will use the new data.\n\n\
  \ This is a full replacement operation. All existing content is replaced with the new CSV data.\n\
  \ "]

module UpdateScheduledQuery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_query_request ->
    ( update_scheduled_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_query_request ->
    ( update_scheduled_query_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing scheduled query with new configuration. This operation uses PUT semantics, \
   allowing modification of query parameters, schedule, and destinations.\n"]
