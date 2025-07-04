open Types
module BatchExecuteStatement :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_execute_statement_input ->
        (batch_execute_statement_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `RequestLimitExceeded of request_limit_exceeded ]) result
end[@@ocaml.doc
     "This operation allows you to perform batch reads or writes on data stored in DynamoDB, using PartiQL. Each read statement in a [BatchExecuteStatement] must specify an equality condition on all key attributes. This enforces that each [SELECT] statement in a batch returns at most a single item.\n\n  The entire batch must consist of either read statements or write statements, you cannot mix both in one batch.\n  \n     A HTTP 200 response does not mean that all statements in the BatchExecuteStatement succeeded. Error details for individual statements can be found under the {{:https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_BatchStatementResponse.html#DDB-Type-BatchStatementResponse-Error}Error} field of the [BatchStatementResponse] for each statement.\n     \n      "]
module BatchGetItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_item_input ->
        (batch_get_item_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "The [BatchGetItem] operation returns the attributes of one or more items from one or more tables. You identify requested items by primary key.\n\n A single operation can retrieve up to 16 MB of data, which can contain as many as 100 items. [BatchGetItem] returns a partial result if the response size limit is exceeded, the table's provisioned throughput is exceeded, more than 1MB per partition is requested, or an internal processing failure occurs. If a partial result is returned, the operation returns a value for [UnprocessedKeys]. You can use this value to retry the operation starting with the next item to get.\n \n   If you request more than 100 items, [BatchGetItem] returns a [ValidationException] with the message \"Too many items requested for the BatchGetItem call.\"\n   \n     For example, if you ask to retrieve 100 items, but each individual item is 300 KB in size, the system returns 52 items (so as not to exceed the 16 MB limit). It also returns an appropriate [UnprocessedKeys] value so you can get the next page of results. If desired, your application can include its own logic to assemble the pages of results into one dataset.\n     \n      If {i none} of the items can be processed due to insufficient provisioned throughput on all of the tables in the request, then [BatchGetItem] returns a [ProvisionedThroughputExceededException]. If {i at least one} of the items is successfully processed, then [BatchGetItem] completes successfully, while returning the keys of the unread items in [UnprocessedKeys].\n      \n        If DynamoDB returns any unprocessed items, you should retry the batch operation on those items. However, {i we strongly recommend that you use an exponential backoff algorithm}. If you retry the batch operation immediately, the underlying read or write requests can still fail due to throttling on the individual tables. If you delay the batch operation using exponential backoff, the individual requests in the batch are much more likely to succeed.\n        \n         For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ErrorHandling.html#BatchOperations}Batch Operations and Error Handling} in the {i Amazon DynamoDB Developer Guide}.\n         \n           By default, [BatchGetItem] performs eventually consistent reads on every table in the request. If you want strongly consistent reads instead, you can set [ConsistentRead] to [true] for any or all tables.\n           \n            In order to minimize response latency, [BatchGetItem] may retrieve items in parallel.\n            \n             When designing your application, keep in mind that DynamoDB does not return items in any particular order. To help parse the response by item, include the primary key values for the items in your request in the [ProjectionExpression] parameter.\n             \n              If a requested item does not exist, it is not returned in the result. Requests for nonexistent items consume the minimum read capacity units according to the type of read. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#CapacityUnitCalculations}Working with Tables} in the {i Amazon DynamoDB Developer Guide}.\n              "]
module BatchWriteItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_write_item_input ->
        (batch_write_item_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ItemCollectionSizeLimitExceededException of
              item_collection_size_limit_exceeded_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "The [BatchWriteItem] operation puts or deletes multiple items in one or more tables. A single call to [BatchWriteItem] can transmit up to 16MB of data over the network, consisting of up to 25 item put or delete operations. While individual items can be up to 400 KB once stored, it's important to note that an item's representation might be greater than 400KB while being sent in DynamoDB's JSON format for the API call. For more details on this distinction, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html}Naming Rules and Data Types}.\n\n   [BatchWriteItem] cannot update items. If you perform a [BatchWriteItem] operation on an existing item, that item's values will be overwritten by the operation and it will appear like it was updated. To update items, we recommend you use the [UpdateItem] action.\n  \n    The individual [PutItem] and [DeleteItem] operations specified in [BatchWriteItem] are atomic; however [BatchWriteItem] as a whole is not. If any requested operations fail because the table's provisioned throughput is exceeded or an internal processing failure occurs, the failed operations are returned in the [UnprocessedItems] response parameter. You can investigate and optionally resend the requests. Typically, you would call [BatchWriteItem] in a loop. Each iteration would check for unprocessed items and submit a new [BatchWriteItem] request with those unprocessed items until all items have been processed.\n    \n     If {i none} of the items can be processed due to insufficient provisioned throughput on all of the tables in the request, then [BatchWriteItem] returns a [ProvisionedThroughputExceededException].\n     \n       If DynamoDB returns any unprocessed items, you should retry the batch operation on those items. However, {i we strongly recommend that you use an exponential backoff algorithm}. If you retry the batch operation immediately, the underlying read or write requests can still fail due to throttling on the individual tables. If you delay the batch operation using exponential backoff, the individual requests in the batch are much more likely to succeed.\n       \n        For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ErrorHandling.html#Programming.Errors.BatchOperations}Batch Operations and Error Handling} in the {i Amazon DynamoDB Developer Guide}.\n        \n          With [BatchWriteItem], you can efficiently write or delete large amounts of data, such as from Amazon EMR, or copy data from another database into DynamoDB. In order to improve performance with these large-scale operations, [BatchWriteItem] does not behave in the same way as individual [PutItem] and [DeleteItem] calls would. For example, you cannot specify conditions on individual put and delete requests, and [BatchWriteItem] does not return deleted items in the response.\n          \n           If you use a programming language that supports concurrency, you can use threads to write items in parallel. Your application must include the necessary logic to manage the threads. With languages that don't support threading, you must update or delete the specified items one at a time. In both situations, [BatchWriteItem] performs the specified put and delete operations in parallel, giving you the power of the thread pool approach without having to introduce complexity into your application.\n           \n            Parallel processing reduces latency, but each specified put and delete request consumes the same number of write capacity units whether it is processed in parallel or not. Delete operations on nonexistent items consume one write capacity unit.\n            \n             If one or more of the following is true, DynamoDB rejects the entire batch write operation:\n             \n              {ul\n                    {-  One or more tables specified in the [BatchWriteItem] request does not exist.\n                        \n                         }\n                    {-  Primary key attributes specified on an item in the request do not match those in the corresponding table's primary key schema.\n                        \n                         }\n                    {-  You try to perform multiple operations on the same item in the same [BatchWriteItem] request. For example, you cannot put and delete the same item in the same [BatchWriteItem] request. \n                        \n                         }\n                    {-   Your request contains at least two items with identical hash and range keys (which essentially is two put operations). \n                        \n                         }\n                    {-  There are more than 25 requests in the batch.\n                        \n                         }\n                    {-  Any individual item in a batch exceeds 400 KB.\n                        \n                         }\n                    {-  The total request size exceeds 16 MB.\n                        \n                         }\n                    {-  Any individual items with keys exceeding the key length limits. For a partition key, the limit is 2048 bytes and for a sort key, the limit is 1024 bytes.\n                        \n                         }\n                    }\n  "]
module CreateBackup :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_backup_input ->
        (create_backup_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BackupInUseException of backup_in_use_exception 
          | `ContinuousBackupsUnavailableException of
              continuous_backups_unavailable_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `TableInUseException of table_in_use_exception 
          | `TableNotFoundException of table_not_found_exception ]) result
end[@@ocaml.doc
     "Creates a backup for an existing table.\n\n  Each time you create an on-demand backup, the entire table data is backed up. There is no limit to the number of on-demand backups that can be taken. \n \n   When you create an on-demand backup, a time marker of the request is cataloged, and the backup is created asynchronously, by applying all changes until the time of the request to the last full table snapshot. Backup requests are processed instantaneously and become available for restore within minutes. \n  \n   You can call [CreateBackup] at a maximum rate of 50 times per second.\n   \n    All backups in DynamoDB work without consuming any provisioned throughput on the table.\n    \n      If you submit a backup request on 2018-12-14 at 14:25:00, the backup is guaranteed to contain all data committed to the table up to 14:24:00, and data committed after 14:26:00 will not be. The backup might contain data modifications made between 14:24:00 and 14:26:00. On-demand backup does not support causal consistency. \n     \n       Along with data, the following are also included on the backups: \n      \n       {ul\n             {-  Global secondary indexes (GSIs)\n                 \n                  }\n             {-  Local secondary indexes (LSIs)\n                 \n                  }\n             {-  Streams\n                 \n                  }\n             {-  Provisioned read and write capacity\n                 \n                  }\n             }\n  "]
module CreateGlobalTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_global_table_input ->
        (create_global_table_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `GlobalTableAlreadyExistsException of
              global_table_already_exists_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `TableNotFoundException of table_not_found_exception ]) result
end[@@ocaml.doc
     "Creates a global table from an existing table. A global table creates a replication relationship between two or more DynamoDB tables with the same table name in the provided Regions. \n\n  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).\n  \n   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.\n   \n     If you want to add a new replica table to a global table, each of the following conditions must be true:\n     \n      {ul\n            {-  The table must have the same primary key as all of the other replicas.\n                \n                 }\n            {-  The table must have the same name as all of the other replicas.\n                \n                 }\n            {-  The table must have DynamoDB Streams enabled, with the stream containing both the new and the old images of the item.\n                \n                 }\n            {-  None of the replica tables in the global table can contain any data.\n                \n                 }\n            }\n    If global secondary indexes are specified, then the following conditions must also be met: \n   \n    {ul\n          {-   The global secondary indexes must have the same name. \n              \n               }\n          {-   The global secondary indexes must have the same hash key and sort key (if present). \n              \n               }\n          }\n    If local secondary indexes are specified, then the following conditions must also be met: \n   \n    {ul\n          {-   The local secondary indexes must have the same name. \n              \n               }\n          {-   The local secondary indexes must have the same hash key and sort key (if present). \n              \n               }\n          }\n     Write capacity settings should be set consistently across your replica tables and secondary indexes. DynamoDB strongly recommends enabling auto scaling to manage the write capacity settings for all of your global tables replicas and indexes. \n    \n      If you prefer to manage write capacity settings manually, you should provision equal replicated write capacity units to your replica tables. You should also provision equal replicated write capacity units to matching secondary indexes across your global table. \n     \n      "]
module CreateTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_table_input ->
        (create_table_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc
     "The [CreateTable] operation adds a new table to your account. In an Amazon Web Services account, table names must be unique within each Region. That is, you can have two tables with same name if you create the tables in different Regions.\n\n  [CreateTable] is an asynchronous operation. Upon receiving a [CreateTable] request, DynamoDB immediately returns a response with a [TableStatus] of [CREATING]. After the table is created, DynamoDB sets the [TableStatus] to [ACTIVE]. You can perform read and write operations only on an [ACTIVE] table. \n \n  You can optionally define secondary indexes on the new table, as part of the [CreateTable] operation. If you want to create multiple tables with secondary indexes on them, you must create the tables sequentially. Only one table with secondary indexes can be in the [CREATING] state at any given time.\n  \n   You can use the [DescribeTable] action to check the table status.\n   "]
module DeleteBackup :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_backup_input ->
        (delete_backup_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BackupInUseException of backup_in_use_exception 
          | `BackupNotFoundException of backup_not_found_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Deletes an existing backup of a table.\n\n You can call [DeleteBackup] at a maximum rate of 10 times per second.\n "]
module DeleteItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_item_input ->
        (delete_item_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConditionalCheckFailedException of
              conditional_check_failed_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ItemCollectionSizeLimitExceededException of
              item_collection_size_limit_exceeded_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TransactionConflictException of transaction_conflict_exception ])
          result
end[@@ocaml.doc
     "Deletes a single item in a table by primary key. You can perform a conditional delete operation that deletes the item if it exists, or if it has an expected attribute value.\n\n In addition to deleting an item, you can also return the item's attribute values in the same operation, using the [ReturnValues] parameter.\n \n  Unless you specify conditions, the [DeleteItem] is an idempotent operation; running it multiple times on the same item or attribute does {i not} result in an error response.\n  \n   Conditional deletes are useful for deleting items only if specific conditions are met. If those conditions are met, DynamoDB performs the delete. Otherwise, the item is not deleted.\n   "]
module DeleteResourcePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_policy_input ->
        (delete_resource_policy_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `PolicyNotFoundException of policy_not_found_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Deletes the resource-based policy attached to the resource, which can be a table or stream.\n\n  [DeleteResourcePolicy] is an idempotent operation; running it multiple times on the same resource {i doesn't} result in an error response, unless you specify an [ExpectedRevisionId], which will then return a [PolicyNotFoundException].\n \n   To make sure that you don't inadvertently lock yourself out of your own resources, the root principal in your Amazon Web Services account can perform [DeleteResourcePolicy] requests, even if your resource-based policy explicitly denies the root principal's access. \n   \n       [DeleteResourcePolicy] is an asynchronous operation. If you issue a [GetResourcePolicy] request immediately after running the [DeleteResourcePolicy] request, DynamoDB might still return the deleted policy. This is because the policy for your resource might not have been deleted yet. Wait for a few seconds, and then try the [GetResourcePolicy] request again.\n      \n       "]
module DeleteTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_table_input ->
        (delete_table_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "The [DeleteTable] operation deletes a table and all of its items. After a [DeleteTable] request, the specified table is in the [DELETING] state until DynamoDB completes the deletion. If the table is in the [ACTIVE] state, you can delete it. If a table is in [CREATING] or [UPDATING] states, then DynamoDB returns a [ResourceInUseException]. If the specified table does not exist, DynamoDB returns a [ResourceNotFoundException]. If table is already in the [DELETING] state, no error is returned. \n\n  For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version). \n  \n     DynamoDB might continue to accept data read and write operations, such as [GetItem] and [PutItem], on a table in the [DELETING] state until the table deletion is complete.\n     \n       When you delete a table, any indexes on that table are also deleted.\n       \n        If you have DynamoDB Streams enabled on the table, then the corresponding stream on that table goes into the [DISABLED] state, and the stream is automatically deleted after 24 hours.\n        \n         Use the [DescribeTable] action to check the status of the table. \n         "]
module DescribeBackup :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_backup_input ->
        (describe_backup_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BackupNotFoundException of backup_not_found_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception ]) result
end[@@ocaml.doc
     "Describes an existing backup of a table.\n\n You can call [DescribeBackup] at a maximum rate of 10 times per second.\n "]
module DescribeContinuousBackups :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_continuous_backups_input ->
        (describe_continuous_backups_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `TableNotFoundException of table_not_found_exception ]) result
end[@@ocaml.doc
     "Checks the status of continuous backups and point in time recovery on the specified table. Continuous backups are [ENABLED] on all tables at table creation. If point in time recovery is enabled, [PointInTimeRecoveryStatus] will be set to ENABLED.\n\n  After continuous backups and point in time recovery are enabled, you can restore to any point in time within [EarliestRestorableDateTime] and [LatestRestorableDateTime]. \n \n   [LatestRestorableDateTime] is typically 5 minutes before the current time. You can restore your table to any point in time during the last 35 days. \n  \n   You can call [DescribeContinuousBackups] at a maximum rate of 10 times per second.\n   "]
module DescribeContributorInsights :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_contributor_insights_input ->
        (describe_contributor_insights_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns information about contributor insights for a given table or global secondary index.\n"]
module DescribeEndpoints :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (describe_endpoints_response, [> Smaws_Lib.Protocols.AwsJson.error])
          result
end[@@ocaml.doc
     "Returns the regional endpoint information. For more information on policy permissions, please see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/inter-network-traffic-privacy.html#inter-network-traffic-DescribeEndpoints}Internetwork traffic privacy}.\n"]
module DescribeExport :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_export_input ->
        (describe_export_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExportNotFoundException of export_not_found_exception 
          | `InternalServerError of internal_server_error 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc "Describes an existing table export.\n"]
module DescribeGlobalTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_global_table_input ->
        (describe_global_table_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `GlobalTableNotFoundException of global_table_not_found_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception ]) result
end[@@ocaml.doc
     "Returns information about the specified global table.\n\n  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).\n  \n   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.\n   \n    "]
module DescribeGlobalTableSettings :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_global_table_settings_input ->
        (describe_global_table_settings_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `GlobalTableNotFoundException of global_table_not_found_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception ]) result
end[@@ocaml.doc
     "Describes Region-specific settings for a global table.\n\n  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).\n  \n   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.\n   \n    "]
module DescribeImport :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_import_input ->
        (describe_import_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ImportNotFoundException of import_not_found_exception ]) result
end[@@ocaml.doc " Represents the properties of the import. \n"]
module DescribeKinesisStreamingDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_kinesis_streaming_destination_input ->
        (describe_kinesis_streaming_destination_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns information about the status of Kinesis streaming.\n"]
module DescribeLimits :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (describe_limits_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception ]) result
end[@@ocaml.doc
     "Returns the current provisioned-capacity quotas for your Amazon Web Services account in a Region, both for the Region as a whole and for any one DynamoDB table that you create there.\n\n When you establish an Amazon Web Services account, the account has initial quotas on the maximum read capacity units and write capacity units that you can provision across all of your DynamoDB tables in a given Region. Also, there are per-table quotas that apply when you create a table there. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html}Service, Account, and Table Quotas} page in the {i Amazon DynamoDB Developer Guide}.\n \n  Although you can increase these quotas by filing a case at {{:https://console.aws.amazon.com/support/home#/}Amazon Web Services Support Center}, obtaining the increase is not instantaneous. The [DescribeLimits] action lets you write code to compare the capacity you are currently using to those quotas imposed by your account so that you have enough time to apply for an increase before you hit a quota.\n  \n   For example, you could use one of the Amazon Web Services SDKs to do the following:\n   \n    {ol\n          {-  Call [DescribeLimits] for a particular Region to obtain your current account quotas on provisioned capacity there.\n              \n               }\n          {-  Create a variable to hold the aggregate read capacity units provisioned for all your tables in that Region, and one to hold the aggregate write capacity units. Zero them both.\n              \n               }\n          {-  Call [ListTables] to obtain a list of all your DynamoDB tables.\n              \n               }\n          {-  For each table name listed by [ListTables], do the following:\n              \n               {ul\n                     {-  Call [DescribeTable] with the table name.\n                         \n                          }\n                     {-  Use the data returned by [DescribeTable] to add the read capacity units and write capacity units provisioned for the table itself to your variables.\n                         \n                          }\n                     {-  If the table has one or more global secondary indexes (GSIs), loop over these GSIs and add their provisioned capacity values to your variables as well.\n                         \n                          }\n                     \n           }\n            }\n          {-  Report the account quotas for that Region returned by [DescribeLimits], along with the total current provisioned capacity levels you have calculated.\n              \n               }\n          }\n   This will let you see whether you are getting close to your account-level quotas.\n   \n    The per-table quotas apply only when you are creating a new table. They restrict the sum of the provisioned capacity of the new table itself and all its global secondary indexes.\n    \n     For existing tables and their GSIs, DynamoDB doesn't let you increase provisioned capacity extremely rapidly, but the only quota that applies is that the aggregate provisioned capacity over all your tables and GSIs cannot exceed either of the per-account quotas.\n     \n        [DescribeLimits] should only be called periodically. You can expect throttling errors if you call it more than once in a minute.\n       \n         The [DescribeLimits] Request element has no content.\n         "]
module DescribeTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_table_input ->
        (describe_table_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns information about the table, including the current status of the table, when it was created, the primary key schema, and any indexes on the table.\n\n  For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version). \n  \n     If you issue a [DescribeTable] request immediately after a [CreateTable] request, DynamoDB might return a [ResourceNotFoundException]. This is because [DescribeTable] uses an eventually consistent query, and the metadata for your table might not be available at that moment. Wait for a few seconds, and then try the [DescribeTable] request again.\n     \n      "]
module DescribeTableReplicaAutoScaling :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_table_replica_auto_scaling_input ->
        (describe_table_replica_auto_scaling_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Describes auto scaling settings across replicas of the global table at once.\n\n  For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version).\n  \n   "]
module DescribeTimeToLive :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_time_to_live_input ->
        (describe_time_to_live_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Gives a description of the Time to Live (TTL) status on the specified table. \n"]
module DisableKinesisStreamingDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      kinesis_streaming_destination_input ->
        (kinesis_streaming_destination_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Stops replication from the DynamoDB table to the Kinesis data stream. This is done without deleting either of the resources.\n"]
module EnableKinesisStreamingDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      kinesis_streaming_destination_input ->
        (kinesis_streaming_destination_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Starts table data replication to the specified Kinesis data stream at a timestamp chosen during the enable workflow. If this operation doesn't return results immediately, use DescribeKinesisStreamingDestination to check if streaming to the Kinesis data stream is ACTIVE.\n"]
module ExecuteStatement :
sig
  val request :
    Smaws_Lib.Context.t ->
      execute_statement_input ->
        (execute_statement_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConditionalCheckFailedException of
              conditional_check_failed_exception 
          | `DuplicateItemException of duplicate_item_exception 
          | `InternalServerError of internal_server_error 
          | `ItemCollectionSizeLimitExceededException of
              item_collection_size_limit_exceeded_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TransactionConflictException of transaction_conflict_exception ])
          result
end[@@ocaml.doc
     "This operation allows you to perform reads and singleton writes on data stored in DynamoDB, using PartiQL.\n\n For PartiQL reads ([SELECT] statement), if the total number of processed items exceeds the maximum dataset size limit of 1 MB, the read stops and results are returned to the user as a [LastEvaluatedKey] value to continue the read in a subsequent operation. If the filter criteria in [WHERE] clause does not match any data, the read will return an empty result set.\n \n  A single [SELECT] statement response can return up to the maximum number of items (if using the Limit parameter) or a maximum of 1 MB of data (and then apply any filtering to the results using [WHERE] clause). If [LastEvaluatedKey] is present in the response, you need to paginate the result set. If [NextToken] is present, you need to paginate the result set and include [NextToken].\n  "]
module ExecuteTransaction :
sig
  val request :
    Smaws_Lib.Context.t ->
      execute_transaction_input ->
        (execute_transaction_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `IdempotentParameterMismatchException of
              idempotent_parameter_mismatch_exception 
          | `InternalServerError of internal_server_error 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TransactionCanceledException of transaction_canceled_exception 
          | `TransactionInProgressException of
              transaction_in_progress_exception ])
          result
end[@@ocaml.doc
     "This operation allows you to perform transactional reads or writes on data stored in DynamoDB, using PartiQL.\n\n  The entire transaction must consist of either read statements or write statements, you cannot mix both in one transaction. The EXISTS function is an exception and can be used to check the condition of specific attributes of the item in a similar manner to [ConditionCheck] in the {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/transaction-apis.html#transaction-apis-txwriteitems}TransactWriteItems} API.\n  \n   "]
module ExportTableToPointInTime :
sig
  val request :
    Smaws_Lib.Context.t ->
      export_table_to_point_in_time_input ->
        (export_table_to_point_in_time_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExportConflictException of export_conflict_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidExportTimeException of invalid_export_time_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `PointInTimeRecoveryUnavailableException of
              point_in_time_recovery_unavailable_exception 
          | `TableNotFoundException of table_not_found_exception ]) result
end[@@ocaml.doc
     "Exports table data to an S3 bucket. The table must have point in time recovery enabled, and you can export data from any time within the point in time recovery window.\n"]
module GetItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_item_input ->
        (get_item_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "The [GetItem] operation returns a set of attributes for the item with the given primary key. If there is no matching item, [GetItem] does not return any data and there will be no [Item] element in the response.\n\n  [GetItem] provides an eventually consistent read by default. If your application requires a strongly consistent read, set [ConsistentRead] to [true]. Although a strongly consistent read might take more time than an eventually consistent read, it always returns the last updated value.\n "]
module GetResourcePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_policy_input ->
        (get_resource_policy_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `PolicyNotFoundException of policy_not_found_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns the resource-based policy document attached to the resource, which can be a table or stream, in JSON format.\n\n  [GetResourcePolicy] follows an {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html} {i eventually consistent} } model. The following list describes the outcomes when you issue the [GetResourcePolicy] request immediately after issuing another request:\n \n  {ul\n        {-  If you issue a [GetResourcePolicy] request immediately after a [PutResourcePolicy] request, DynamoDB might return a [PolicyNotFoundException].\n            \n             }\n        {-  If you issue a [GetResourcePolicy]request immediately after a [DeleteResourcePolicy] request, DynamoDB might return the policy that was present before the deletion request.\n            \n             }\n        {-  If you issue a [GetResourcePolicy] request immediately after a [CreateTable] request, which includes a resource-based policy, DynamoDB might return a [ResourceNotFoundException] or a [PolicyNotFoundException].\n            \n             }\n        }\n   Because [GetResourcePolicy] uses an {i eventually consistent} query, the metadata for your policy or table might not be available at that moment. Wait for a few seconds, and then retry the [GetResourcePolicy] request.\n   \n    After a [GetResourcePolicy] request returns a policy created using the [PutResourcePolicy] request, the policy will be applied in the authorization of requests to the resource. Because this process is eventually consistent, it will take some time to apply the policy to all requests to a resource. Policies that you attach while creating a table using the [CreateTable] request will always be applied to all requests for that table.\n    "]
module ImportTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      import_table_input ->
        (import_table_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ImportConflictException of import_conflict_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc " Imports table data from an S3 bucket. \n"]
module ListBackups :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_backups_input ->
        (list_backups_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception ]) result
end[@@ocaml.doc
     "List DynamoDB backups that are associated with an Amazon Web Services account and weren't made with Amazon Web Services Backup. To list these backups for a given table, specify [TableName]. [ListBackups] returns a paginated list of results with at most 1 MB worth of items in a page. You can also specify a maximum number of entries to be returned in a page.\n\n In the request, start time is inclusive, but end time is exclusive. Note that these boundaries are for the time at which the original backup was requested.\n \n  You can call [ListBackups] a maximum of five times per second.\n  \n   If you want to retrieve the complete list of backups made with Amazon Web Services Backup, use the {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_ListBackupJobs.html}Amazon Web Services Backup list API.} \n   "]
module ListContributorInsights :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_contributor_insights_input ->
        (list_contributor_insights_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns a list of ContributorInsightsSummary for a table and all its global secondary indexes.\n"]
module ListExports :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_exports_input ->
        (list_exports_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc "Lists completed exports within the past 90 days.\n"]
module ListGlobalTables :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_global_tables_input ->
        (list_global_tables_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception ]) result
end[@@ocaml.doc
     "Lists all global tables that have a replica in the specified Region.\n\n  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).\n  \n   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.\n   \n    "]
module ListImports :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_imports_input ->
        (list_imports_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc " Lists completed imports within the past 90 days. \n"]
module ListTables :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tables_input ->
        (list_tables_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception ]) result
end[@@ocaml.doc
     "Returns an array of table names associated with the current account and endpoint. The output from [ListTables] is paginated, with each page returning a maximum of 100 table names.\n"]
module ListTagsOfResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_of_resource_input ->
        (list_tags_of_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "List all tags on an Amazon DynamoDB resource. You can call ListTagsOfResource up to 10 times per second, per account.\n\n For an overview on tagging DynamoDB resources, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html}Tagging for DynamoDB} in the {i Amazon DynamoDB Developer Guide}.\n "]
module PutItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_item_input ->
        (put_item_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConditionalCheckFailedException of
              conditional_check_failed_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ItemCollectionSizeLimitExceededException of
              item_collection_size_limit_exceeded_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TransactionConflictException of transaction_conflict_exception ])
          result
end[@@ocaml.doc
     "Creates a new item, or replaces an old item with a new item. If an item that has the same primary key as the new item already exists in the specified table, the new item completely replaces the existing item. You can perform a conditional put operation (add a new item if one with the specified primary key doesn't exist), or replace an existing item if it has certain attribute values. You can return the item's attribute values in the same operation, using the [ReturnValues] parameter.\n\n When you add an item, the primary key attributes are the only required attributes. \n \n  Empty String and Binary attribute values are allowed. Attribute values of type String and Binary must have a length greater than zero if the attribute is used as a key attribute for a table or index. Set type attributes cannot be empty. \n  \n   Invalid Requests with empty values will be rejected with a [ValidationException] exception.\n   \n     To prevent a new item from replacing an existing item, use a conditional expression that contains the [attribute_not_exists] function with the name of the attribute being used as the partition key for the table. Since every record must contain that attribute, the [attribute_not_exists] function will only succeed if no matching item exists.\n     \n       For more information about [PutItem], see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithItems.html}Working with Items} in the {i Amazon DynamoDB Developer Guide}.\n       "]
module PutResourcePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_policy_input ->
        (put_resource_policy_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `PolicyNotFoundException of policy_not_found_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Attaches a resource-based policy document to the resource, which can be a table or stream. When you attach a resource-based policy using this API, the policy application is {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html} {i eventually consistent} }.\n\n  [PutResourcePolicy] is an idempotent operation; running it multiple times on the same resource using the same policy document will return the same revision ID. If you specify an [ExpectedRevisionId] that doesn't match the current policy's [RevisionId], the [PolicyNotFoundException] will be returned.\n \n    [PutResourcePolicy] is an asynchronous operation. If you issue a [GetResourcePolicy] request immediately after a [PutResourcePolicy] request, DynamoDB might return your previous policy, if there was one, or return the [PolicyNotFoundException]. This is because [GetResourcePolicy] uses an eventually consistent query, and the metadata for your policy or table might not be available at that moment. Wait for a few seconds, and then try the [GetResourcePolicy] request again.\n   \n    "]
module Query :
sig
  val request :
    Smaws_Lib.Context.t ->
      query_input ->
        (query_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "You must provide the name of the partition key attribute and a single value for that attribute. [Query] returns all items with that partition key value. Optionally, you can provide a sort key attribute and use a comparison operator to refine the search results.\n\n Use the [KeyConditionExpression] parameter to provide a specific value for the partition key. The [Query] operation will return all of the items from the table or index with that partition key value. You can optionally narrow the scope of the [Query] operation by specifying a sort key value and a comparison operator in [KeyConditionExpression]. To further refine the [Query] results, you can optionally provide a [FilterExpression]. A [FilterExpression] determines which items within the results should be returned to you. All of the other results are discarded. \n \n   A [Query] operation always returns a result set. If no matching items are found, the result set will be empty. Queries that do not return results consume the minimum number of read capacity units for that type of read operation. \n  \n     DynamoDB calculates the number of read capacity units consumed based on item size, not on the amount of data that is returned to an application. The number of capacity units consumed will be the same whether you request all of the attributes (the default behavior) or just some of them (using a projection expression). The number will also be the same whether or not you use a [FilterExpression]. \n    \n       [Query] results are always sorted by the sort key value. If the data type of the sort key is Number, the results are returned in numeric order; otherwise, the results are returned in order of UTF-8 bytes. By default, the sort order is ascending. To reverse the order, set the [ScanIndexForward] parameter to false. \n      \n        A single [Query] operation will read up to the maximum number of items set (if using the [Limit] parameter) or a maximum of 1 MB of data and then apply any filtering to the results using [FilterExpression]. If [LastEvaluatedKey] is present in the response, you will need to paginate the result set. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Query.html#Query.Pagination}Paginating the Results} in the {i Amazon DynamoDB Developer Guide}. \n       \n         [FilterExpression] is applied after a [Query] finishes, but before the results are returned. A [FilterExpression] cannot contain partition key or sort key attributes. You need to specify those attributes in the [KeyConditionExpression]. \n        \n           A [Query] operation can return an empty result set and a [LastEvaluatedKey] if all the items read for the page of results are filtered out. \n          \n            You can query a table, a local secondary index, or a global secondary index. For a query on a table or on a local secondary index, you can set the [ConsistentRead] parameter to [true] and obtain a strongly consistent result. Global secondary indexes support eventually consistent reads only, so do not specify [ConsistentRead] when querying a global secondary index.\n            "]
module RestoreTableFromBackup :
sig
  val request :
    Smaws_Lib.Context.t ->
      restore_table_from_backup_input ->
        (restore_table_from_backup_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BackupInUseException of backup_in_use_exception 
          | `BackupNotFoundException of backup_not_found_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `TableAlreadyExistsException of table_already_exists_exception 
          | `TableInUseException of table_in_use_exception ]) result
end[@@ocaml.doc
     "Creates a new table from an existing backup. Any number of users can execute up to 50 concurrent restores (any type of restore) in a given account. \n\n You can call [RestoreTableFromBackup] at a maximum rate of 10 times per second.\n \n  You must manually set up the following on the restored table:\n  \n   {ul\n         {-  Auto scaling policies\n             \n              }\n         {-  IAM policies\n             \n              }\n         {-  Amazon CloudWatch metrics and alarms\n             \n              }\n         {-  Tags\n             \n              }\n         {-  Stream settings\n             \n              }\n         {-  Time to Live (TTL) settings\n             \n              }\n         }\n  "]
module RestoreTableToPointInTime :
sig
  val request :
    Smaws_Lib.Context.t ->
      restore_table_to_point_in_time_input ->
        (restore_table_to_point_in_time_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `InvalidRestoreTimeException of invalid_restore_time_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `PointInTimeRecoveryUnavailableException of
              point_in_time_recovery_unavailable_exception 
          | `TableAlreadyExistsException of table_already_exists_exception 
          | `TableInUseException of table_in_use_exception 
          | `TableNotFoundException of table_not_found_exception ]) result
end[@@ocaml.doc
     "Restores the specified table to the specified point in time within [EarliestRestorableDateTime] and [LatestRestorableDateTime]. You can restore your table to any point in time during the last 35 days. Any number of users can execute up to 50 concurrent restores (any type of restore) in a given account. \n\n When you restore using point in time recovery, DynamoDB restores your table data to the state based on the selected date and time (day:hour:minute:second) to a new table. \n \n  Along with data, the following are also included on the new restored table using point in time recovery: \n  \n   {ul\n         {-  Global secondary indexes (GSIs)\n             \n              }\n         {-  Local secondary indexes (LSIs)\n             \n              }\n         {-  Provisioned read and write capacity\n             \n              }\n         {-  Encryption settings\n             \n                All these settings come from the current settings of the source table at the time of restore. \n               \n                 }\n         }\n   You must manually set up the following on the restored table:\n   \n    {ul\n          {-  Auto scaling policies\n              \n               }\n          {-  IAM policies\n              \n               }\n          {-  Amazon CloudWatch metrics and alarms\n              \n               }\n          {-  Tags\n              \n               }\n          {-  Stream settings\n              \n               }\n          {-  Time to Live (TTL) settings\n              \n               }\n          {-  Point in time recovery settings\n              \n               }\n          }\n  "]
module Scan :
sig
  val request :
    Smaws_Lib.Context.t ->
      scan_input ->
        (scan_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "The [Scan] operation returns one or more items and item attributes by accessing every item in a table or a secondary index. To have DynamoDB return fewer items, you can provide a [FilterExpression] operation.\n\n If the total size of scanned items exceeds the maximum dataset size limit of 1 MB, the scan completes and results are returned to the user. The [LastEvaluatedKey] value is also returned and the requestor can use the [LastEvaluatedKey] to continue the scan in a subsequent operation. Each scan response also includes number of items that were scanned (ScannedCount) as part of the request. If using a [FilterExpression], a scan result can result in no items meeting the criteria and the [Count] will result in zero. If you did not use a [FilterExpression] in the scan request, then [Count] is the same as [ScannedCount].\n \n    [Count] and [ScannedCount] only return the count of items specific to a single scan request and, unless the table is less than 1MB, do not represent the total number of items in the table. \n   \n     A single [Scan] operation first reads up to the maximum number of items set (if using the [Limit] parameter) or a maximum of 1 MB of data and then applies any filtering to the results if a [FilterExpression] is provided. If [LastEvaluatedKey] is present in the response, pagination is required to complete the full table scan. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.Pagination}Paginating the Results} in the {i Amazon DynamoDB Developer Guide}.\n     \n       [Scan] operations proceed sequentially; however, for faster performance on a large table or secondary index, applications can request a parallel [Scan] operation by providing the [Segment] and [TotalSegments] parameters. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.ParallelScan}Parallel Scan} in the {i Amazon DynamoDB Developer Guide}.\n      \n       By default, a [Scan] uses eventually consistent reads when accessing the items in a table. Therefore, the results from an eventually consistent [Scan] may not include the latest item changes at the time the scan iterates through each item in the table. If you require a strongly consistent read of each item as the scan iterates through the items in the table, you can set the [ConsistentRead] parameter to true. Strong consistency only relates to the consistency of the read at the item level.\n       \n          DynamoDB does not provide snapshot isolation for a scan operation when the [ConsistentRead] parameter is set to true. Thus, a DynamoDB scan operation does not guarantee that all reads in a scan see a consistent snapshot of the table when the scan operation was requested. \n         \n          "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Associate a set of tags with an Amazon DynamoDB resource. You can then activate these user-defined tags so that they appear on the Billing and Cost Management console for cost allocation tracking. You can call TagResource up to five times per second, per account. \n\n For an overview on tagging DynamoDB resources, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html}Tagging for DynamoDB} in the {i Amazon DynamoDB Developer Guide}.\n "]
module TransactGetItems :
sig
  val request :
    Smaws_Lib.Context.t ->
      transact_get_items_input ->
        (transact_get_items_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TransactionCanceledException of transaction_canceled_exception ])
          result
end[@@ocaml.doc
     " [TransactGetItems] is a synchronous operation that atomically retrieves multiple items from one or more tables (but not from indexes) in a single account and Region. A [TransactGetItems] call can contain up to 100 [TransactGetItem] objects, each of which contains a [Get] structure that specifies an item to retrieve from a table in the account and Region. A call to [TransactGetItems] cannot retrieve items from tables in more than one Amazon Web Services account or Region. The aggregate size of the items in the transaction cannot exceed 4 MB.\n\n DynamoDB rejects the entire [TransactGetItems] request if any of the following is true:\n \n  {ul\n        {-  A conflicting operation is in the process of updating an item to be read.\n            \n             }\n        {-  There is insufficient provisioned capacity for the transaction to be completed.\n            \n             }\n        {-  There is a user error, such as an invalid data format.\n            \n             }\n        {-  The aggregate size of the items in the transaction exceeded 4 MB.\n            \n             }\n        }\n  "]
module TransactWriteItems :
sig
  val request :
    Smaws_Lib.Context.t ->
      transact_write_items_input ->
        (transact_write_items_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `IdempotentParameterMismatchException of
              idempotent_parameter_mismatch_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TransactionCanceledException of transaction_canceled_exception 
          | `TransactionInProgressException of
              transaction_in_progress_exception ])
          result
end[@@ocaml.doc
     " [TransactWriteItems] is a synchronous write operation that groups up to 100 action requests. These actions can target items in different tables, but not in different Amazon Web Services accounts or Regions, and no two actions can target the same item. For example, you cannot both [ConditionCheck] and [Update] the same item. The aggregate size of the items in the transaction cannot exceed 4 MB.\n\n The actions are completed atomically so that either all of them succeed, or all of them fail. They are defined by the following objects:\n \n  {ul\n        {-   [Put] \194\160\226\128\148 \194\160 Initiates a [PutItem] operation to write a new item. This structure specifies the primary key of the item to be written, the name of the table to write it in, an optional condition expression that must be satisfied for the write to succeed, a list of the item's attributes, and a field indicating whether to retrieve the item's attributes if the condition is not met.\n            \n             }\n        {-   [Update] \194\160\226\128\148 \194\160 Initiates an [UpdateItem] operation to update an existing item. This structure specifies the primary key of the item to be updated, the name of the table where it resides, an optional condition expression that must be satisfied for the update to succeed, an expression that defines one or more attributes to be updated, and a field indicating whether to retrieve the item's attributes if the condition is not met.\n            \n             }\n        {-   [Delete] \194\160\226\128\148 \194\160 Initiates a [DeleteItem] operation to delete an existing item. This structure specifies the primary key of the item to be deleted, the name of the table where it resides, an optional condition expression that must be satisfied for the deletion to succeed, and a field indicating whether to retrieve the item's attributes if the condition is not met.\n            \n             }\n        {-   [ConditionCheck] \194\160\226\128\148 \194\160 Applies a condition to an item that is not being modified by the transaction. This structure specifies the primary key of the item to be checked, the name of the table where it resides, a condition expression that must be satisfied for the transaction to succeed, and a field indicating whether to retrieve the item's attributes if the condition is not met.\n            \n             }\n        }\n   DynamoDB rejects the entire [TransactWriteItems] request if any of the following is true:\n   \n    {ul\n          {-  A condition in one of the condition expressions is not met.\n              \n               }\n          {-  An ongoing operation is in the process of updating the same item.\n              \n               }\n          {-  There is insufficient provisioned capacity for the transaction to be completed.\n              \n               }\n          {-  An item size becomes too large (bigger than 400 KB), a local secondary index (LSI) becomes too large, or a similar validation error occurs because of changes made by the transaction.\n              \n               }\n          {-  The aggregate size of the items in the transaction exceeds 4 MB.\n              \n               }\n          {-  There is a user error, such as an invalid data format.\n              \n               }\n          }\n  "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes the association of tags from an Amazon DynamoDB resource. You can call [UntagResource] up to five times per second, per account. \n\n For an overview on tagging DynamoDB resources, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html}Tagging for DynamoDB} in the {i Amazon DynamoDB Developer Guide}.\n "]
module UpdateContinuousBackups :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_continuous_backups_input ->
        (update_continuous_backups_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ContinuousBackupsUnavailableException of
              continuous_backups_unavailable_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `TableNotFoundException of table_not_found_exception ]) result
end[@@ocaml.doc
     " [UpdateContinuousBackups] enables or disables point in time recovery for the specified table. A successful [UpdateContinuousBackups] call returns the current [ContinuousBackupsDescription]. Continuous backups are [ENABLED] on all tables at table creation. If point in time recovery is enabled, [PointInTimeRecoveryStatus] will be set to ENABLED.\n\n  Once continuous backups and point in time recovery are enabled, you can restore to any point in time within [EarliestRestorableDateTime] and [LatestRestorableDateTime]. \n \n   [LatestRestorableDateTime] is typically 5 minutes before the current time. You can restore your table to any point in time during the last 35 days. \n  "]
module UpdateContributorInsights :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_contributor_insights_input ->
        (update_contributor_insights_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates the status for contributor insights for a specific table or index. CloudWatch Contributor Insights for DynamoDB graphs display the partition key and (if applicable) sort key of frequently accessed items and frequently throttled items in plaintext. If you require the use of Amazon Web Services Key Management Service (KMS) to encrypt this table\226\128\153s partition key and sort key data with an Amazon Web Services managed key or customer managed key, you should not enable CloudWatch Contributor Insights for DynamoDB for this table.\n"]
module UpdateGlobalTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_global_table_input ->
        (update_global_table_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `GlobalTableNotFoundException of global_table_not_found_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ReplicaAlreadyExistsException of
              replica_already_exists_exception 
          | `ReplicaNotFoundException of replica_not_found_exception 
          | `TableNotFoundException of table_not_found_exception ]) result
end[@@ocaml.doc
     "Adds or removes replicas in the specified global table. The global table must already exist to be able to use this operation. Any replica to be added must be empty, have the same name as the global table, have the same key schema, have DynamoDB Streams enabled, and have the same provisioned and maximum write capacity units.\n\n  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).\n  \n   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.\n   \n       For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version). If you are using global tables {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Version 2019.11.21} you can use {{:https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_UpdateTable.html}UpdateTable} instead. \n      \n        Although you can use [UpdateGlobalTable] to add replicas and remove replicas in a single request, for simplicity we recommend that you issue separate requests for adding or removing replicas. \n       \n          If global secondary indexes are specified, then the following conditions must also be met: \n         \n          {ul\n                {-   The global secondary indexes must have the same name. \n                    \n                     }\n                {-   The global secondary indexes must have the same hash key and sort key (if present). \n                    \n                     }\n                {-   The global secondary indexes must have the same provisioned and maximum write capacity units. \n                    \n                     }\n                }\n  "]
module UpdateGlobalTableSettings :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_global_table_settings_input ->
        (update_global_table_settings_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `GlobalTableNotFoundException of global_table_not_found_exception 
          | `IndexNotFoundException of index_not_found_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ReplicaNotFoundException of replica_not_found_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc
     "Updates settings for a global table.\n\n  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).\n  \n   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.\n   \n    "]
module UpdateItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_item_input ->
        (update_item_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConditionalCheckFailedException of
              conditional_check_failed_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `ItemCollectionSizeLimitExceededException of
              item_collection_size_limit_exceeded_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `RequestLimitExceeded of request_limit_exceeded 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TransactionConflictException of transaction_conflict_exception ])
          result
end[@@ocaml.doc
     "Edits an existing item's attributes, or adds a new item to the table if it does not already exist. You can put, delete, or add attribute values. You can also perform a conditional update on an existing item (insert a new attribute name-value pair if it doesn't exist, or replace an existing name-value pair if it has certain expected attribute values).\n\n You can also return the item's attribute values in the same [UpdateItem] operation using the [ReturnValues] parameter.\n "]
module UpdateKinesisStreamingDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_kinesis_streaming_destination_input ->
        (update_kinesis_streaming_destination_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "The command to update the Kinesis stream destination.\n"]
module UpdateTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_table_input ->
        (update_table_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Modifies the provisioned throughput settings, global secondary indexes, or DynamoDB Streams settings for a given table.\n\n  For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version). \n  \n    You can only perform one of the following operations at once:\n    \n     {ul\n           {-  Modify the provisioned throughput settings of the table.\n               \n                }\n           {-  Remove a global secondary index from the table.\n               \n                }\n           {-  Create a new global secondary index on the table. After the index begins backfilling, you can use [UpdateTable] to perform other operations.\n               \n                }\n           }\n    [UpdateTable] is an asynchronous operation; while it's executing, the table status changes from [ACTIVE] to [UPDATING]. While it's [UPDATING], you can't issue another [UpdateTable] request. When the table returns to the [ACTIVE] state, the [UpdateTable] operation is complete.\n   "]
module UpdateTableReplicaAutoScaling :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_table_replica_auto_scaling_input ->
        (update_table_replica_auto_scaling_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates auto scaling settings on your global tables at once.\n\n  For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version). \n  \n   "]
module UpdateTimeToLive :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_time_to_live_input ->
        (update_time_to_live_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidEndpointException of invalid_endpoint_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "The [UpdateTimeToLive] method enables or disables Time to Live (TTL) for the specified table. A successful [UpdateTimeToLive] call returns the current [TimeToLiveSpecification]. It can take up to one hour for the change to fully process. Any additional [UpdateTimeToLive] calls for the same table during this one hour duration result in a [ValidationException]. \n\n TTL compares the current time in epoch time format to the time stored in the TTL attribute of an item. If the epoch time value stored in the attribute is less than the current time, the item is marked as expired and subsequently deleted.\n \n    The epoch time format is the number of seconds elapsed since 12:00:00 AM January 1, 1970 UTC. \n   \n     DynamoDB deletes expired items on a best-effort basis to ensure availability of throughput for other data operations. \n     \n       DynamoDB typically deletes expired items within two days of expiration. The exact duration within which an item gets deleted after expiration is specific to the nature of the workload. Items that have expired and not been deleted will still show up in reads, queries, and scans.\n       \n         As items are deleted, they are removed from any local secondary index and global secondary index immediately in the same eventually consistent way as a standard delete operation.\n         \n          For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html}Time To Live} in the Amazon DynamoDB Developer Guide. \n          "]