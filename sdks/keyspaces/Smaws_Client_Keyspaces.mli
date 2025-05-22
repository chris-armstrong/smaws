(** 
    Keyspaces client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec rs =
  | SINGLE_REGION [@ocaml.doc ""]
  | MULTI_REGION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec validation_exception =
  {
  message: string option [@ocaml.doc "Description of the error.\n"]}[@@ocaml.doc
                                                                    "The operation failed due to an invalid or malformed request.\n"]
type nonrec update_table_response =
  {
  resource_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the modified table.\n"]}
[@@ocaml.doc ""]
type nonrec column_definition =
  {
  type_: string
    [@ocaml.doc
      "The data type of the column. For a list of available data types, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/cql.elements.html#cql.data-types}Data types} in the {i Amazon Keyspaces Developer Guide}.\n"];
  name: string [@ocaml.doc "The name of the column.\n"]}[@@ocaml.doc
                                                          "The names and data types of regular columns.\n"]
type nonrec throughput_mode =
  | PAY_PER_REQUEST [@ocaml.doc ""]
  | PROVISIONED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec capacity_specification =
  {
  write_capacity_units: int option
    [@ocaml.doc
      "The throughput capacity specified for [write] operations defined in [write capacity units] [(WCUs)].\n"];
  read_capacity_units: int option
    [@ocaml.doc
      "The throughput capacity specified for [read] operations defined in [read capacity units] [(RCUs)].\n"];
  throughput_mode: throughput_mode
    [@ocaml.doc
      "The read/write throughput capacity mode for a table. The options are:\n\n {ul\n       {-   [throughputMode:PAY_PER_REQUEST] and \n           \n            }\n       {-   [throughputMode:PROVISIONED] - Provisioned capacity mode requires [readCapacityUnits] and [writeCapacityUnits] as input.\n           \n            }\n       }\n   The default is [throughput_mode:PAY_PER_REQUEST].\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.\n    "]}
[@@ocaml.doc
  "Amazon Keyspaces has two read/write capacity modes for processing reads and writes on your tables: \n\n {ul\n       {-  On-demand (default)\n           \n            }\n       {-  Provisioned\n           \n            }\n       }\n   The read/write capacity mode that you choose controls how you are charged for read and write throughput and how table throughput capacity is managed.\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.\n    "]
type nonrec encryption_type =
  | CUSTOMER_MANAGED_KMS_KEY [@ocaml.doc ""]
  | AWS_OWNED_KMS_KEY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec encryption_specification =
  {
  kms_key_identifier: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the customer managed KMS key, for example [kms_key_identifier:ARN].\n"];
  type_: encryption_type
    [@ocaml.doc
      "The encryption option specified for the table. You can choose one of the following KMS keys (KMS keys):\n\n {ul\n       {-   [type:AWS_OWNED_KMS_KEY] - This key is owned by Amazon Keyspaces. \n           \n            }\n       {-   [type:CUSTOMER_MANAGED_KMS_KEY] - This key is stored in your account and is created, owned, and managed by you. This option requires the [kms_key_identifier] of the KMS key in Amazon Resource Name (ARN) format as input. \n           \n            }\n       }\n   The default is [type:AWS_OWNED_KMS_KEY]. \n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}Encryption at rest} in the {i Amazon Keyspaces Developer Guide}.\n    "]}
[@@ocaml.doc
  "Amazon Keyspaces encrypts and decrypts the table data at rest transparently and integrates with Key Management Service for storing and managing the encryption key. You can choose one of the following KMS keys (KMS keys):\n\n {ul\n       {-  Amazon Web Services owned key - This is the default encryption type. The key is owned by Amazon Keyspaces (no additional charge). \n           \n            }\n       {-  Customer managed key - This key is stored in your account and is created, owned, and managed by you. You have full control over the customer managed key (KMS charges apply).\n           \n            }\n       }\n   For more information about encryption at rest in Amazon Keyspaces, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}Encryption at rest} in the {i Amazon Keyspaces Developer Guide}.\n   \n    For more information about KMS, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}KMS management service concepts} in the {i Key Management Service Developer Guide}.\n    "]
type nonrec point_in_time_recovery_status =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec point_in_time_recovery =
  {
  status: point_in_time_recovery_status
    [@ocaml.doc
      "The options are:\n\n {ul\n       {-   [status=ENABLED] \n           \n            }\n       {-   [status=DISABLED] \n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "Point-in-time recovery (PITR) helps protect your Amazon Keyspaces tables from accidental write or delete operations by providing you continuous backups of your table data.\n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html}Point-in-time recovery} in the {i Amazon Keyspaces Developer Guide}.\n "]
type nonrec time_to_live_status =
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec time_to_live =
  {
  status: time_to_live_status
    [@ocaml.doc
      "Shows how to enable custom Time to Live (TTL) settings for the specified table.\n"]}
[@@ocaml.doc
  "Enable custom Time to Live (TTL) settings for rows and columns without setting a TTL default for the specified table.\n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL-how-it-works.html#ttl-howitworks_enabling}Enabling TTL on tables} in the {i Amazon Keyspaces Developer Guide}.\n "]
type nonrec client_side_timestamps_status =
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec client_side_timestamps =
  {
  status: client_side_timestamps_status
    [@ocaml.doc
      "Shows how to enable client-side timestamps settings for the specified table.\n"]}
[@@ocaml.doc
  "The client-side timestamp setting of the table.\n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/client-side-timestamps-how-it-works.html}How it works: Amazon Keyspaces client-side timestamps} in the {i Amazon Keyspaces Developer Guide}.\n "]
type nonrec target_tracking_scaling_policy_configuration =
  {
  target_value: float
    [@ocaml.doc
      "Specifies the target value for the target tracking auto scaling policy.\n\n Amazon Keyspaces auto scaling scales up capacity automatically when traffic exceeds this target utilization rate, and then back down when it falls below the target. This ensures that the ratio of consumed capacity to provisioned capacity stays at or near this value. You define [targetValue] as a percentage. A [double] between 20 and 90.\n "];
  scale_out_cooldown: int option
    [@ocaml.doc
      "Specifies a scale out cool down period.\n\n A cooldown period in seconds between scaling activities that lets the table stabilize before another scaling activity starts. \n "];
  scale_in_cooldown: int option
    [@ocaml.doc
      "Specifies a [scale-in] cool down period.\n\n A cooldown period in seconds between scaling activities that lets the table stabilize before another scaling activity starts. \n "];
  disable_scale_in: bool option
    [@ocaml.doc
      "Specifies if [scale-in] is enabled.\n\n When auto scaling automatically decreases capacity for a table, the table {i scales in}. When scaling policies are set, they can't scale in the table lower than its minimum capacity.\n "]}
[@@ocaml.doc
  "The auto scaling policy that scales a table based on the ratio of consumed to provisioned capacity.\n"]
type nonrec auto_scaling_policy =
  {
  target_tracking_scaling_policy_configuration:
    target_tracking_scaling_policy_configuration option
    [@ocaml.doc
      "Auto scaling scales up capacity automatically when traffic exceeds this target utilization rate, and then back down when it falls below the target. A [double] between 20 and 90.\n"]}
[@@ocaml.doc
  "Amazon Keyspaces supports the [target tracking] auto scaling policy. With this policy, Amazon Keyspaces auto scaling ensures that the table's ratio of consumed to provisioned capacity stays at or near the target value that you specify. You define the target value as a percentage between 20 and 90.\n"]
type nonrec auto_scaling_settings =
  {
  scaling_policy: auto_scaling_policy option
    [@ocaml.doc
      "Amazon Keyspaces supports the [target tracking] auto scaling policy. With this policy, Amazon Keyspaces auto scaling ensures that the table's ratio of consumed to provisioned capacity stays at or near the target value that you specify. You define the target value as a percentage between 20 and 90.\n"];
  maximum_units: int option
    [@ocaml.doc
      "Manage costs by specifying the maximum amount of throughput to provision. The value must be between 1 and the max throughput per second quota for your account (40,000 by default).\n"];
  minimum_units: int option
    [@ocaml.doc
      "The minimum level of throughput the table should always be ready to support. The value must be between 1 and the max throughput per second quota for your account (40,000 by default).\n"];
  auto_scaling_disabled: bool option
    [@ocaml.doc
      "This optional parameter enables auto scaling for the table if set to [false].\n"]}
[@@ocaml.doc
  "The optional auto scaling settings for a table with provisioned throughput capacity.\n\n To turn on auto scaling for a table in [throughputMode:PROVISIONED], you must specify the following parameters. \n \n  Configure the minimum and maximum capacity units. The auto scaling policy ensures that capacity never goes below the minimum or above the maximum range.\n  \n   {ul\n         {-   [minimumUnits]: The minimum level of throughput the table should always be ready to support. The value must be between 1 and the max throughput per second quota for your account (40,000 by default).\n             \n              }\n         {-   [maximumUnits]: The maximum level of throughput the table should always be ready to support. The value must be between 1 and the max throughput per second quota for your account (40,000 by default).\n             \n              }\n         {-   [scalingPolicy]: Amazon Keyspaces supports the [target tracking] scaling policy. The auto scaling target is the provisioned capacity of the table. \n             \n              {ul\n                    {-   [targetTrackingScalingPolicyConfiguration]: To define the target tracking policy, you must define the target value. \n                        \n                         {ul\n                               {-   [targetValue]: The target utilization rate of the table. Amazon Keyspaces auto scaling ensures that the ratio of consumed capacity to provisioned capacity stays at or near this value. You define [targetValue] as a percentage. A [double] between 20 and 90. (Required)\n                                   \n                                    }\n                               {-   [disableScaleIn]: A [boolean] that specifies if [scale-in] is disabled or enabled for the table. This parameter is disabled by default. To turn on [scale-in], set the [boolean] value to [FALSE]. This means that capacity for a table can be automatically scaled down on your behalf. (Optional) \n                                   \n                                    }\n                               {-   [scaleInCooldown]: A cooldown period in seconds between scaling activities that lets the table stabilize before another scale in activity starts. If no value is provided, the default is 0. (Optional) \n                                   \n                                    }\n                               {-   [scaleOutCooldown]: A cooldown period in seconds between scaling activities that lets the table stabilize before another scale out activity starts. If no value is provided, the default is 0. (Optional) \n                                   \n                                    }\n                               \n                     }\n                      }\n                    \n          }\n           }\n         }\n   For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.\n   "]
type nonrec auto_scaling_specification =
  {
  read_capacity_auto_scaling: auto_scaling_settings option
    [@ocaml.doc "The auto scaling settings for the table's read capacity.\n"];
  write_capacity_auto_scaling: auto_scaling_settings option
    [@ocaml.doc
      "The auto scaling settings for the table's write capacity.\n"]}
[@@ocaml.doc
  "The optional auto scaling capacity settings for a table in provisioned capacity mode.\n"]
type nonrec replica_specification =
  {
  read_capacity_auto_scaling: auto_scaling_settings option
    [@ocaml.doc
      "The read capacity auto scaling settings for the multi-Region table in the specified Amazon Web Services Region.\n"];
  read_capacity_units: int option
    [@ocaml.doc
      "The provisioned read capacity units for the multi-Region table in the specified Amazon Web Services Region.\n"];
  region: string [@ocaml.doc "The Amazon Web Services Region.\n"]}[@@ocaml.doc
                                                                    "The Amazon Web Services Region specific settings of a multi-Region table.\n\n For a multi-Region table, you can configure the table's read capacity differently per Amazon Web Services Region. You can do this by configuring the following parameters.\n \n  {ul\n        {-   [region]: The Region where these settings are applied. (Required)\n            \n             }\n        {-   [readCapacityUnits]: The provisioned read capacity units. (Optional)\n            \n             }\n        {-   [readCapacityAutoScaling]: The read capacity auto scaling settings for the table. (Optional)\n            \n             }\n        }\n  "]
type nonrec update_table_request =
  {
  replica_specifications: replica_specification list option
    [@ocaml.doc "The Region specific settings of a multi-Regional table.\n"];
  auto_scaling_specification: auto_scaling_specification option
    [@ocaml.doc
      "The optional auto scaling settings to update for a table in provisioned capacity mode. Specifies if the service can manage throughput capacity of a provisioned table automatically on your behalf. Amazon Keyspaces auto scaling helps you provision throughput capacity for variable workloads efficiently by increasing and decreasing your table's read and write capacity automatically in response to application traffic.\n\n If auto scaling is already enabled for the table, you can use [UpdateTable] to update the minimum and maximum values or the auto scaling policy settings independently.\n \n  For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.\n  "];
  client_side_timestamps: client_side_timestamps option
    [@ocaml.doc
      "Enables client-side timestamps for the table. By default, the setting is disabled. You can enable client-side timestamps with the following option:\n\n {ul\n       {-   [status: \"enabled\"] \n           \n            }\n       }\n   Once client-side timestamps are enabled for a table, this setting cannot be disabled.\n   "];
  default_time_to_live: int option
    [@ocaml.doc
      "The default Time to Live setting in seconds for the table.\n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL-how-it-works.html#ttl-howitworks_default_ttl}Setting the default TTL value for a table} in the {i Amazon Keyspaces Developer Guide}.\n "];
  ttl: time_to_live option
    [@ocaml.doc
      "Modifies Time to Live custom settings for the table. The options are:\n\n {ul\n       {-   [status:enabled] \n           \n            }\n       {-   [status:disabled] \n           \n            }\n       }\n   The default is [status:disabled]. After [ttl] is enabled, you can't disable it for the table.\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL.html}Expiring data by using Amazon Keyspaces Time to Live (TTL)} in the {i Amazon Keyspaces Developer Guide}.\n    "];
  point_in_time_recovery: point_in_time_recovery option
    [@ocaml.doc
      "Modifies the [pointInTimeRecovery] settings of the table. The options are:\n\n {ul\n       {-   [status=ENABLED] \n           \n            }\n       {-   [status=DISABLED] \n           \n            }\n       }\n   If it's not specified, the default is [status=DISABLED].\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html}Point-in-time recovery} in the {i Amazon Keyspaces Developer Guide}.\n    "];
  encryption_specification: encryption_specification option
    [@ocaml.doc
      "Modifies the encryption settings of the table. You can choose one of the following KMS key (KMS key):\n\n {ul\n       {-   [type:AWS_OWNED_KMS_KEY] - This key is owned by Amazon Keyspaces. \n           \n            }\n       {-   [type:CUSTOMER_MANAGED_KMS_KEY] - This key is stored in your account and is created, owned, and managed by you. This option requires the [kms_key_identifier] of the KMS key in Amazon Resource Name (ARN) format as input. \n           \n            }\n       }\n   The default is [AWS_OWNED_KMS_KEY].\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}Encryption at rest} in the {i Amazon Keyspaces Developer Guide}.\n    "];
  capacity_specification: capacity_specification option
    [@ocaml.doc
      "Modifies the read/write throughput capacity mode for the table. The options are:\n\n {ul\n       {-   [throughputMode:PAY_PER_REQUEST] and \n           \n            }\n       {-   [throughputMode:PROVISIONED] - Provisioned capacity mode requires [readCapacityUnits] and [writeCapacityUnits] as input.\n           \n            }\n       }\n   The default is [throughput_mode:PAY_PER_REQUEST].\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.\n    "];
  add_columns: column_definition list option
    [@ocaml.doc
      "For each column to be added to the specified table:\n\n {ul\n       {-   [name] - The name of the column.\n           \n            }\n       {-   [type] - An Amazon Keyspaces data type. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/cql.elements.html#cql.data-types}Data types} in the {i Amazon Keyspaces Developer Guide}.\n           \n            }\n       }\n  "];
  table_name: string [@ocaml.doc "The name of the table.\n"];
  keyspace_name: string
    [@ocaml.doc
      "The name of the keyspace the specified table is stored in.\n"]}
[@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception =
  {
  message: string option [@ocaml.doc "Description of the error.\n"]}[@@ocaml.doc
                                                                    "The operation exceeded the service quota for this resource. For more information on service quotas, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/quotas.html}Quotas} in the {i Amazon Keyspaces Developer Guide}.\n"]
type nonrec resource_not_found_exception =
  {
  resource_arn: string option
    [@ocaml.doc
      "The unique identifier in the format of Amazon Resource Name (ARN), for the resource not found.\n"];
  message: string option [@ocaml.doc "Description of the error.\n"]}[@@ocaml.doc
                                                                    "The operation tried to access a keyspace or table that doesn't exist. The resource might not be specified correctly, or its status might not be [ACTIVE].\n"]
type nonrec internal_server_exception =
  {
  message: string option [@ocaml.doc "Description of the error.\n"]}[@@ocaml.doc
                                                                    "Amazon Keyspaces was unable to fully process this request because of an internal server error.\n"]
type nonrec conflict_exception =
  {
  message: string option [@ocaml.doc "Description of the error.\n"]}[@@ocaml.doc
                                                                    "Amazon Keyspaces couldn't complete the requested action. This error may occur if you try to perform an action and the same or a different action is already in progress, or if you try to create a resource that already exists. \n"]
type nonrec access_denied_exception =
  {
  message: string option [@ocaml.doc "Description of the error.\n"]}[@@ocaml.doc
                                                                    "You don't have sufficient access permissions to perform this action. \n"]
type nonrec tag =
  {
  value: string
    [@ocaml.doc
      "The value of the tag. Tag values are case-sensitive and can be null.\n"];
  key: string
    [@ocaml.doc
      "The key of the tag. Tag keys are case sensitive. Each Amazon Keyspaces resource can only have up to one tag with the same key. If you try to add an existing tag (same key), the existing tag value will be updated to the new value.\n"]}
[@@ocaml.doc
  "Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a single Amazon Keyspaces resource.\n\n Amazon Web Services-assigned tag names and values are automatically assigned the [aws:] prefix, which the user cannot assign. Amazon Web Services-assigned tag names do not count towards the tag limit of 50. User-assigned tag names have the prefix [user:] in the Cost Allocation Report. You cannot backdate the application of a tag.\n \n  For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.\n  "]
type nonrec untag_resource_request =
  {
  tags: tag list
    [@ocaml.doc
      "A list of existing tags to be removed from the Amazon Keyspaces resource.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Keyspaces resource that the tags will be removed from. This value is an Amazon Resource Name (ARN).\n"]}
[@@ocaml.doc ""]
type nonrec tag_resource_request =
  {
  tags: tag list
    [@ocaml.doc
      "The tags to be assigned to the Amazon Keyspaces resource.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Amazon Keyspaces resource to which to add tags.\n"]}
[@@ocaml.doc ""]
type nonrec table_summary =
  {
  resource_arn: string
    [@ocaml.doc
      "The unique identifier of the table in the format of an Amazon Resource Name (ARN).\n"];
  table_name: string [@ocaml.doc "The name of the table.\n"];
  keyspace_name: string
    [@ocaml.doc "The name of the keyspace that the table is stored in.\n"]}
[@@ocaml.doc
  "Returns the name of the specified table, the keyspace it is stored in, and the unique identifier in the format of an Amazon Resource Name (ARN).\n"]
type nonrec table_status =
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | RESTORING [@ocaml.doc ""]
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec static_column =
  {
  name: string [@ocaml.doc "The name of the static column.\n"]}[@@ocaml.doc
                                                                 "The static columns of the table. Static columns store values that are shared by all rows in the same partition.\n"]
type nonrec sort_order =
  | ASC [@ocaml.doc ""]
  | DESC [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec partition_key =
  {
  name: string [@ocaml.doc "The name(s) of the partition key column(s).\n"]}
[@@ocaml.doc
  "The partition key portion of the primary key is required and determines how Amazon Keyspaces stores the data. The partition key can be a single column, or it can be a compound value composed of two or more columns.\n"]
type nonrec clustering_key =
  {
  order_by: sort_order
    [@ocaml.doc
      "Sets the ascendant ([ASC]) or descendant ([DESC]) order modifier.\n"];
  name: string [@ocaml.doc "The name(s) of the clustering column(s).\n"]}
[@@ocaml.doc
  "The optional clustering column portion of your primary key determines how the data is clustered and sorted within each partition.\n"]
type nonrec schema_definition =
  {
  static_columns: static_column list option
    [@ocaml.doc
      "The columns that have been defined as [STATIC]. Static columns store values that are shared by all rows in the same partition.\n"];
  clustering_keys: clustering_key list option
    [@ocaml.doc
      "The columns that are part of the clustering key of the table.\n"];
  partition_keys: partition_key list
    [@ocaml.doc
      "The columns that are part of the partition key of the table .\n"];
  all_columns: column_definition list
    [@ocaml.doc "The regular columns of the table.\n"]}[@@ocaml.doc
                                                         "Describes the schema of the table.\n"]
type nonrec restore_table_response =
  {
  restored_table_ar_n: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the restored table.\n"]}
[@@ocaml.doc ""]
type nonrec restore_table_request =
  {
  replica_specifications: replica_specification list option
    [@ocaml.doc
      "The optional Region specific settings of a multi-Regional table.\n"];
  auto_scaling_specification: auto_scaling_specification option
    [@ocaml.doc
      "The optional auto scaling settings for the restored table in provisioned capacity mode. Specifies if the service can manage throughput capacity of a provisioned table automatically on your behalf. Amazon Keyspaces auto scaling helps you provision throughput capacity for variable workloads efficiently by increasing and decreasing your table's read and write capacity automatically in response to application traffic.\n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.\n "];
  tags_override: tag list option
    [@ocaml.doc
      "A list of key-value pair tags to be attached to the restored table. \n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.\n "];
  point_in_time_recovery_override: point_in_time_recovery option
    [@ocaml.doc
      "Specifies the [pointInTimeRecovery] settings for the target table. The options are:\n\n {ul\n       {-   [status=ENABLED] \n           \n            }\n       {-   [status=DISABLED] \n           \n            }\n       }\n   If it's not specified, the default is [status=DISABLED].\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html}Point-in-time recovery} in the {i Amazon Keyspaces Developer Guide}.\n    "];
  encryption_specification_override: encryption_specification option
    [@ocaml.doc
      "Specifies the encryption settings for the target table. You can choose one of the following KMS key (KMS key):\n\n {ul\n       {-   [type:AWS_OWNED_KMS_KEY] - This key is owned by Amazon Keyspaces. \n           \n            }\n       {-   [type:CUSTOMER_MANAGED_KMS_KEY] - This key is stored in your account and is created, owned, and managed by you. This option requires the [kms_key_identifier] of the KMS key in Amazon Resource Name (ARN) format as input. \n           \n            }\n       }\n   The default is [type:AWS_OWNED_KMS_KEY].\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}Encryption at rest} in the {i Amazon Keyspaces Developer Guide}.\n    "];
  capacity_specification_override: capacity_specification option
    [@ocaml.doc
      "Specifies the read/write throughput capacity mode for the target table. The options are:\n\n {ul\n       {-   [throughputMode:PAY_PER_REQUEST] \n           \n            }\n       {-   [throughputMode:PROVISIONED] - Provisioned capacity mode requires [readCapacityUnits] and [writeCapacityUnits] as input.\n           \n            }\n       }\n   The default is [throughput_mode:PAY_PER_REQUEST].\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.\n    "];
  restore_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc "The restore timestamp in ISO 8601 format.\n"];
  target_table_name: string [@ocaml.doc "The name of the target table.\n"];
  target_keyspace_name: string
    [@ocaml.doc "The name of the target keyspace.\n"];
  source_table_name: string [@ocaml.doc "The name of the source table.\n"];
  source_keyspace_name: string
    [@ocaml.doc "The keyspace name of the source table.\n"]}[@@ocaml.doc ""]
type nonrec replication_specification =
  {
  region_list: string list option
    [@ocaml.doc
      " The [regionList] can contain up to six Amazon Web Services Regions where the keyspace is replicated in. \n"];
  replication_strategy: rs
    [@ocaml.doc
      " The [replicationStrategy] of a keyspace, the required value is [SINGLE_REGION] or [MULTI_REGION]. \n"]}
[@@ocaml.doc
  " The replication specification of the keyspace includes:\n\n {ul\n       {-   [regionList] - up to six Amazon Web Services Regions where the keyspace is replicated in.\n           \n            }\n       {-   [replicationStrategy] - the required value is [SINGLE_REGION] or [MULTI_REGION].\n           \n            }\n       }\n  "]
type nonrec capacity_specification_summary =
  {
  last_update_to_pay_per_request_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp of the last operation that changed the provisioned throughput capacity of a table.\n"];
  write_capacity_units: int option
    [@ocaml.doc
      "The throughput capacity specified for [write] operations defined in [write capacity units] [(WCUs)].\n"];
  read_capacity_units: int option
    [@ocaml.doc
      "The throughput capacity specified for [read] operations defined in [read capacity units] [(RCUs)].\n"];
  throughput_mode: throughput_mode
    [@ocaml.doc
      "The read/write throughput capacity mode for a table. The options are:\n\n {ul\n       {-   [throughputMode:PAY_PER_REQUEST] and \n           \n            }\n       {-   [throughputMode:PROVISIONED] - Provisioned capacity mode requires [readCapacityUnits] and [writeCapacityUnits] as input. \n           \n            }\n       }\n   The default is [throughput_mode:PAY_PER_REQUEST].\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.\n    "]}
[@@ocaml.doc
  "The read/write throughput capacity mode for a table. The options are:\n\n {ul\n       {-   [throughputMode:PAY_PER_REQUEST] and \n           \n            }\n       {-   [throughputMode:PROVISIONED].\n           \n            }\n       }\n   For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.\n   "]
type nonrec replica_specification_summary =
  {
  capacity_specification: capacity_specification_summary option
    [@ocaml.doc ""];
  status: table_status option
    [@ocaml.doc
      "The status of the multi-Region table in the specified Amazon Web Services Region.\n"];
  region: string option [@ocaml.doc "The Amazon Web Services Region.\n"]}
[@@ocaml.doc
  "The Region-specific settings of a multi-Region table in the specified Amazon Web Services Region.\n\n If the multi-Region table is using provisioned capacity and has optional auto scaling policies configured, note that the Region specific summary returns both read and write capacity settings. But only Region specific read capacity settings can be configured for a multi-Region table. In a multi-Region table, your write capacity units will be synced across all Amazon Web Services Regions to ensure that there is enough capacity to replicate write events across Regions.\n "]
type nonrec replica_auto_scaling_specification =
  {
  auto_scaling_specification: auto_scaling_specification option
    [@ocaml.doc
      "The auto scaling settings for a multi-Region table in the specified Amazon Web Services Region.\n"];
  region: string option [@ocaml.doc "The Amazon Web Services Region.\n"]}
[@@ocaml.doc
  "The auto scaling settings of a multi-Region table in the specified Amazon Web Services Region.\n"]
type nonrec point_in_time_recovery_summary =
  {
  earliest_restorable_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specifies the earliest possible restore point of the table in ISO 8601 format.\n"];
  status: point_in_time_recovery_status
    [@ocaml.doc
      "Shows if point-in-time recovery is enabled or disabled for the specified table.\n"]}
[@@ocaml.doc "The point-in-time recovery status of the specified table.\n"]
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option [@ocaml.doc "A list of tags.\n"];
  next_token: string option
    [@ocaml.doc
      "A token to specify where to start paginating. This is the [NextToken] from a previously truncated response.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  max_results: int option
    [@ocaml.doc
      "The total number of tags to return in the output. If the total number of tags available is more than the value specified, a [NextToken] is provided in the output. To resume pagination, provide the [NextToken] value as an argument of a subsequent API invocation.\n"];
  next_token: string option
    [@ocaml.doc
      "The pagination token. To resume pagination, provide the [NextToken] value as argument of a subsequent API invocation.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Amazon Keyspaces resource.\n"]}
[@@ocaml.doc ""]
type nonrec list_tables_response =
  {
  tables: table_summary list option [@ocaml.doc "A list of tables.\n"];
  next_token: string option
    [@ocaml.doc
      "A token to specify where to start paginating. This is the [NextToken] from a previously truncated response.\n"]}
[@@ocaml.doc ""]
type nonrec list_tables_request =
  {
  keyspace_name: string [@ocaml.doc "The name of the keyspace.\n"];
  max_results: int option
    [@ocaml.doc
      "The total number of tables to return in the output. If the total number of tables available is more than the value specified, a [NextToken] is provided in the output. To resume pagination, provide the [NextToken] value as an argument of a subsequent API invocation.\n"];
  next_token: string option
    [@ocaml.doc
      "The pagination token. To resume pagination, provide the [NextToken] value as an argument of a subsequent API invocation.\n"]}
[@@ocaml.doc ""]
type nonrec keyspace_summary =
  {
  replication_regions: string list option
    [@ocaml.doc
      " If the [replicationStrategy] of the keyspace is [MULTI_REGION], a list of replication Regions is returned. \n"];
  replication_strategy: rs
    [@ocaml.doc
      " This property specifies if a keyspace is a single Region keyspace or a multi-Region keyspace. The available values are [SINGLE_REGION] or [MULTI_REGION]. \n"];
  resource_arn: string
    [@ocaml.doc
      "The unique identifier of the keyspace in the format of an Amazon Resource Name (ARN).\n"];
  keyspace_name: string [@ocaml.doc "The name of the keyspace.\n"]}[@@ocaml.doc
                                                                    "Represents the properties of a keyspace.\n"]
type nonrec list_keyspaces_response =
  {
  keyspaces: keyspace_summary list [@ocaml.doc "A list of keyspaces.\n"];
  next_token: string option
    [@ocaml.doc
      "A token to specify where to start paginating. This is the [NextToken] from a previously truncated response.\n"]}
[@@ocaml.doc ""]
type nonrec list_keyspaces_request =
  {
  max_results: int option
    [@ocaml.doc
      "The total number of keyspaces to return in the output. If the total number of keyspaces available is more than the value specified, a [NextToken] is provided in the output. To resume pagination, provide the [NextToken] value as an argument of a subsequent API invocation.\n"];
  next_token: string option
    [@ocaml.doc
      "The pagination token. To resume pagination, provide the [NextToken] value as argument of a subsequent API invocation.\n"]}
[@@ocaml.doc ""]
type nonrec get_table_auto_scaling_settings_response =
  {
  replica_specifications: replica_auto_scaling_specification list option
    [@ocaml.doc
      "The Amazon Web Services Region specific settings of a multi-Region table. Returns the settings for all Regions the table is replicated in.\n"];
  auto_scaling_specification: auto_scaling_specification option
    [@ocaml.doc "The auto scaling settings of the table.\n"];
  resource_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the table.\n"];
  table_name: string [@ocaml.doc "The name of the table.\n"];
  keyspace_name: string [@ocaml.doc "The name of the keyspace.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_table_auto_scaling_settings_request =
  {
  table_name: string [@ocaml.doc "The name of the table.\n"];
  keyspace_name: string [@ocaml.doc "The name of the keyspace.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec comment =
  {
  message: string [@ocaml.doc "An optional description of the table.\n"]}
[@@ocaml.doc "An optional comment that describes the table.\n"]
type nonrec get_table_response =
  {
  replica_specifications: replica_specification_summary list option
    [@ocaml.doc
      "Returns the Amazon Web Services Region specific settings of all Regions a multi-Region table is replicated in.\n"];
  client_side_timestamps: client_side_timestamps option
    [@ocaml.doc " The client-side timestamps setting of the table.\n"];
  comment: comment option
    [@ocaml.doc "The the description of the specified table.\n"];
  default_time_to_live: int option
    [@ocaml.doc
      "The default Time to Live settings in seconds of the specified table.\n"];
  ttl: time_to_live option
    [@ocaml.doc "The custom Time to Live settings of the specified table.\n"];
  point_in_time_recovery: point_in_time_recovery_summary option
    [@ocaml.doc
      "The point-in-time recovery status of the specified table.\n"];
  encryption_specification: encryption_specification option
    [@ocaml.doc "The encryption settings of the specified table.\n"];
  capacity_specification: capacity_specification_summary option
    [@ocaml.doc
      "The read/write throughput capacity mode for a table. The options are:\n\n {ul\n       {-   [throughputMode:PAY_PER_REQUEST] \n           \n            }\n       {-   [throughputMode:PROVISIONED] \n           \n            }\n       }\n  "];
  schema_definition: schema_definition option
    [@ocaml.doc "The schema definition of the specified table.\n"];
  status: table_status option
    [@ocaml.doc "The current status of the specified table.\n"];
  creation_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc "The creation timestamp of the specified table.\n"];
  resource_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the specified table.\n"];
  table_name: string [@ocaml.doc "The name of the specified table.\n"];
  keyspace_name: string
    [@ocaml.doc
      "The name of the keyspace that the specified table is stored in.\n"]}
[@@ocaml.doc ""]
type nonrec get_table_request =
  {
  table_name: string [@ocaml.doc "The name of the table.\n"];
  keyspace_name: string
    [@ocaml.doc "The name of the keyspace that the table is stored in.\n"]}
[@@ocaml.doc ""]
type nonrec get_keyspace_response =
  {
  replication_regions: string list option
    [@ocaml.doc
      " If the [replicationStrategy] of the keyspace is [MULTI_REGION], a list of replication Regions is returned. \n"];
  replication_strategy: rs
    [@ocaml.doc
      " Returns the replication strategy of the keyspace. The options are [SINGLE_REGION] or [MULTI_REGION]. \n"];
  resource_arn: string [@ocaml.doc "Returns the ARN of the keyspace.\n"];
  keyspace_name: string [@ocaml.doc "The name of the keyspace.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_keyspace_request =
  {
  keyspace_name: string [@ocaml.doc "The name of the keyspace.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_table_request =
  {
  table_name: string [@ocaml.doc "The name of the table to be deleted.\n"];
  keyspace_name: string
    [@ocaml.doc "The name of the keyspace of the to be deleted table.\n"]}
[@@ocaml.doc ""]
type nonrec delete_keyspace_request =
  {
  keyspace_name: string
    [@ocaml.doc "The name of the keyspace to be deleted.\n"]}[@@ocaml.doc ""]
type nonrec create_table_response =
  {
  resource_arn: string
    [@ocaml.doc
      "The unique identifier of the table in the format of an Amazon Resource Name (ARN).\n"]}
[@@ocaml.doc ""]
type nonrec create_table_request =
  {
  replica_specifications: replica_specification list option
    [@ocaml.doc
      "The optional Amazon Web Services Region specific settings of a multi-Region table. These settings overwrite the general settings of the table for the specified Region. \n\n For a multi-Region table in provisioned capacity mode, you can configure the table's read capacity differently for each Region's replica. The write capacity, however, remains synchronized between all replicas to ensure that there's enough capacity to replicate writes across all Regions. To define the read capacity for a table replica in a specific Region, you can do so by configuring the following parameters.\n \n  {ul\n        {-   [region]: The Region where these settings are applied. (Required)\n            \n             }\n        {-   [readCapacityUnits]: The provisioned read capacity units. (Optional)\n            \n             }\n        {-   [readCapacityAutoScaling]: The read capacity auto scaling settings for the table. (Optional) \n            \n             }\n        }\n  "];
  auto_scaling_specification: auto_scaling_specification option
    [@ocaml.doc
      "The optional auto scaling settings for a table in provisioned capacity mode. Specifies if the service can manage throughput capacity automatically on your behalf.\n\n Auto scaling helps you provision throughput capacity for variable workloads efficiently by increasing and decreasing your table's read and write capacity automatically in response to application traffic. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.\n \n  By default, auto scaling is disabled for a table. \n  "];
  client_side_timestamps: client_side_timestamps option
    [@ocaml.doc
      " Enables client-side timestamps for the table. By default, the setting is disabled. You can enable client-side timestamps with the following option:\n\n {ul\n       {-   [status: \"enabled\"] \n           \n            }\n       }\n   Once client-side timestamps are enabled for a table, this setting cannot be disabled.\n   "];
  tags: tag list option
    [@ocaml.doc
      "A list of key-value pair tags to be attached to the resource. \n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.\n "];
  default_time_to_live: int option
    [@ocaml.doc
      "The default Time to Live setting in seconds for the table.\n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL-how-it-works.html#ttl-howitworks_default_ttl}Setting the default TTL value for a table} in the {i Amazon Keyspaces Developer Guide}.\n "];
  ttl: time_to_live option
    [@ocaml.doc
      "Enables Time to Live custom settings for the table. The options are:\n\n {ul\n       {-   [status:enabled] \n           \n            }\n       {-   [status:disabled] \n           \n            }\n       }\n   The default is [status:disabled]. After [ttl] is enabled, you can't disable it for the table.\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL.html}Expiring data by using Amazon Keyspaces Time to Live (TTL)} in the {i Amazon Keyspaces Developer Guide}.\n    "];
  point_in_time_recovery: point_in_time_recovery option
    [@ocaml.doc
      "Specifies if [pointInTimeRecovery] is enabled or disabled for the table. The options are:\n\n {ul\n       {-   [status=ENABLED] \n           \n            }\n       {-   [status=DISABLED] \n           \n            }\n       }\n   If it's not specified, the default is [status=DISABLED].\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html}Point-in-time recovery} in the {i Amazon Keyspaces Developer Guide}.\n    "];
  encryption_specification: encryption_specification option
    [@ocaml.doc
      "Specifies how the encryption key for encryption at rest is managed for the table. You can choose one of the following KMS key (KMS key):\n\n {ul\n       {-   [type:AWS_OWNED_KMS_KEY] - This key is owned by Amazon Keyspaces. \n           \n            }\n       {-   [type:CUSTOMER_MANAGED_KMS_KEY] - This key is stored in your account and is created, owned, and managed by you. This option requires the [kms_key_identifier] of the KMS key in Amazon Resource Name (ARN) format as input.\n           \n            }\n       }\n   The default is [type:AWS_OWNED_KMS_KEY].\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}Encryption at rest} in the {i Amazon Keyspaces Developer Guide}.\n    "];
  capacity_specification: capacity_specification option
    [@ocaml.doc
      "Specifies the read/write throughput capacity mode for the table. The options are:\n\n {ul\n       {-   [throughputMode:PAY_PER_REQUEST] and \n           \n            }\n       {-   [throughputMode:PROVISIONED] - Provisioned capacity mode requires [readCapacityUnits] and [writeCapacityUnits] as input.\n           \n            }\n       }\n   The default is [throughput_mode:PAY_PER_REQUEST].\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.\n    "];
  comment: comment option
    [@ocaml.doc
      "This parameter allows to enter a description of the table.\n"];
  schema_definition: schema_definition
    [@ocaml.doc
      "The [schemaDefinition] consists of the following parameters.\n\n For each column to be created:\n \n  {ul\n        {-   [name] - The name of the column.\n            \n             }\n        {-   [type] - An Amazon Keyspaces data type. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/cql.elements.html#cql.data-types}Data types} in the {i Amazon Keyspaces Developer Guide}.\n            \n             }\n        }\n   The primary key of the table consists of the following columns:\n   \n    {ul\n          {-   [partitionKeys] - The partition key can be a single column, or it can be a compound value composed of two or more columns. The partition key portion of the primary key is required and determines how Amazon Keyspaces stores your data.\n              \n               }\n          {-   [name] - The name of each partition key column.\n              \n               }\n          {-   [clusteringKeys] - The optional clustering column portion of your primary key determines how the data is clustered and sorted within each partition.\n              \n               }\n          {-   [name] - The name of the clustering column. \n              \n               }\n          {-   [orderBy] - Sets the ascendant ([ASC]) or descendant ([DESC]) order modifier.\n              \n               To define a column as static use [staticColumns] - Static columns store values that are shared by all rows in the same partition:\n               \n                }\n          {-   [name] - The name of the column.\n              \n               }\n          {-   [type] - An Amazon Keyspaces data type.\n              \n               }\n          }\n  "];
  table_name: string [@ocaml.doc "The name of the table.\n"];
  keyspace_name: string
    [@ocaml.doc
      "The name of the keyspace that the table is going to be created in.\n"]}
[@@ocaml.doc ""]
type nonrec create_keyspace_response =
  {
  resource_arn: string
    [@ocaml.doc
      "The unique identifier of the keyspace in the format of an Amazon Resource Name (ARN).\n"]}
[@@ocaml.doc ""]
type nonrec create_keyspace_request =
  {
  replication_specification: replication_specification option
    [@ocaml.doc
      " The replication specification of the keyspace includes:\n\n {ul\n       {-   [replicationStrategy] - the required value is [SINGLE_REGION] or [MULTI_REGION].\n           \n            }\n       {-   [regionList] - if the [replicationStrategy] is [MULTI_REGION], the [regionList] requires the current Region and at least one additional Amazon Web Services Region where the keyspace is going to be replicated in. The maximum number of supported replication Regions including the current Region is six.\n           \n            }\n       }\n  "];
  tags: tag list option
    [@ocaml.doc
      "A list of key-value pair tags to be attached to the keyspace.\n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.\n "];
  keyspace_name: string
    [@ocaml.doc "The name of the keyspace to be created.\n"]}[@@ocaml.doc ""](** {1:builders Builders} *)

val make_update_table_response :
  resource_arn:string -> unit -> update_table_response
val make_column_definition :
  type_:string -> name:string -> unit -> column_definition
val make_capacity_specification :
  ?write_capacity_units:int ->
    ?read_capacity_units:int ->
      throughput_mode:throughput_mode -> unit -> capacity_specification
val make_encryption_specification :
  ?kms_key_identifier:string ->
    type_:encryption_type -> unit -> encryption_specification
val make_point_in_time_recovery :
  status:point_in_time_recovery_status -> unit -> point_in_time_recovery
val make_time_to_live : status:time_to_live_status -> unit -> time_to_live
val make_client_side_timestamps :
  status:client_side_timestamps_status -> unit -> client_side_timestamps
val make_target_tracking_scaling_policy_configuration :
  ?scale_out_cooldown:int ->
    ?scale_in_cooldown:int ->
      ?disable_scale_in:bool ->
        target_value:float ->
          unit -> target_tracking_scaling_policy_configuration
val make_auto_scaling_policy :
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration
    -> unit -> auto_scaling_policy
val make_auto_scaling_settings :
  ?scaling_policy:auto_scaling_policy ->
    ?maximum_units:int ->
      ?minimum_units:int ->
        ?auto_scaling_disabled:bool -> unit -> auto_scaling_settings
val make_auto_scaling_specification :
  ?read_capacity_auto_scaling:auto_scaling_settings ->
    ?write_capacity_auto_scaling:auto_scaling_settings ->
      unit -> auto_scaling_specification
val make_replica_specification :
  ?read_capacity_auto_scaling:auto_scaling_settings ->
    ?read_capacity_units:int ->
      region:string -> unit -> replica_specification
val make_update_table_request :
  ?replica_specifications:replica_specification list ->
    ?auto_scaling_specification:auto_scaling_specification ->
      ?client_side_timestamps:client_side_timestamps ->
        ?default_time_to_live:int ->
          ?ttl:time_to_live ->
            ?point_in_time_recovery:point_in_time_recovery ->
              ?encryption_specification:encryption_specification ->
                ?capacity_specification:capacity_specification ->
                  ?add_columns:column_definition list ->
                    table_name:string ->
                      keyspace_name:string -> unit -> update_table_request
val make_untag_resource_response : unit -> unit
val make_tag : value:string -> key:string -> unit -> tag
val make_untag_resource_request :
  tags:tag list -> resource_arn:string -> unit -> untag_resource_request
val make_tag_resource_response : unit -> unit
val make_tag_resource_request :
  tags:tag list -> resource_arn:string -> unit -> tag_resource_request
val make_table_summary :
  resource_arn:string ->
    table_name:string -> keyspace_name:string -> unit -> table_summary
val make_static_column : name:string -> unit -> static_column
val make_partition_key : name:string -> unit -> partition_key
val make_clustering_key :
  order_by:sort_order -> name:string -> unit -> clustering_key
val make_schema_definition :
  ?static_columns:static_column list ->
    ?clustering_keys:clustering_key list ->
      partition_keys:partition_key list ->
        all_columns:column_definition list -> unit -> schema_definition
val make_restore_table_response :
  restored_table_ar_n:string -> unit -> restore_table_response
val make_restore_table_request :
  ?replica_specifications:replica_specification list ->
    ?auto_scaling_specification:auto_scaling_specification ->
      ?tags_override:tag list ->
        ?point_in_time_recovery_override:point_in_time_recovery ->
          ?encryption_specification_override:encryption_specification ->
            ?capacity_specification_override:capacity_specification ->
              ?restore_timestamp:CoreTypes.Timestamp.t ->
                target_table_name:string ->
                  target_keyspace_name:string ->
                    source_table_name:string ->
                      source_keyspace_name:string ->
                        unit -> restore_table_request
val make_replication_specification :
  ?region_list:string list ->
    replication_strategy:rs -> unit -> replication_specification
val make_capacity_specification_summary :
  ?last_update_to_pay_per_request_timestamp:CoreTypes.Timestamp.t ->
    ?write_capacity_units:int ->
      ?read_capacity_units:int ->
        throughput_mode:throughput_mode ->
          unit -> capacity_specification_summary
val make_replica_specification_summary :
  ?capacity_specification:capacity_specification_summary ->
    ?status:table_status ->
      ?region:string -> unit -> replica_specification_summary
val make_replica_auto_scaling_specification :
  ?auto_scaling_specification:auto_scaling_specification ->
    ?region:string -> unit -> replica_auto_scaling_specification
val make_point_in_time_recovery_summary :
  ?earliest_restorable_timestamp:CoreTypes.Timestamp.t ->
    status:point_in_time_recovery_status ->
      unit -> point_in_time_recovery_summary
val make_list_tags_for_resource_response :
  ?tags:tag list ->
    ?next_token:string -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  ?max_results:int ->
    ?next_token:string ->
      resource_arn:string -> unit -> list_tags_for_resource_request
val make_list_tables_response :
  ?tables:table_summary list ->
    ?next_token:string -> unit -> list_tables_response
val make_list_tables_request :
  ?max_results:int ->
    ?next_token:string -> keyspace_name:string -> unit -> list_tables_request
val make_keyspace_summary :
  ?replication_regions:string list ->
    replication_strategy:rs ->
      resource_arn:string -> keyspace_name:string -> unit -> keyspace_summary
val make_list_keyspaces_response :
  ?next_token:string ->
    keyspaces:keyspace_summary list -> unit -> list_keyspaces_response
val make_list_keyspaces_request :
  ?max_results:int -> ?next_token:string -> unit -> list_keyspaces_request
val make_get_table_auto_scaling_settings_response :
  ?replica_specifications:replica_auto_scaling_specification list ->
    ?auto_scaling_specification:auto_scaling_specification ->
      resource_arn:string ->
        table_name:string ->
          keyspace_name:string ->
            unit -> get_table_auto_scaling_settings_response
val make_get_table_auto_scaling_settings_request :
  table_name:string ->
    keyspace_name:string -> unit -> get_table_auto_scaling_settings_request
val make_comment : message:string -> unit -> comment
val make_get_table_response :
  ?replica_specifications:replica_specification_summary list ->
    ?client_side_timestamps:client_side_timestamps ->
      ?comment:comment ->
        ?default_time_to_live:int ->
          ?ttl:time_to_live ->
            ?point_in_time_recovery:point_in_time_recovery_summary ->
              ?encryption_specification:encryption_specification ->
                ?capacity_specification:capacity_specification_summary ->
                  ?schema_definition:schema_definition ->
                    ?status:table_status ->
                      ?creation_timestamp:CoreTypes.Timestamp.t ->
                        resource_arn:string ->
                          table_name:string ->
                            keyspace_name:string ->
                              unit -> get_table_response
val make_get_table_request :
  table_name:string -> keyspace_name:string -> unit -> get_table_request
val make_get_keyspace_response :
  ?replication_regions:string list ->
    replication_strategy:rs ->
      resource_arn:string ->
        keyspace_name:string -> unit -> get_keyspace_response
val make_get_keyspace_request :
  keyspace_name:string -> unit -> get_keyspace_request
val make_delete_table_response : unit -> unit
val make_delete_table_request :
  table_name:string -> keyspace_name:string -> unit -> delete_table_request
val make_delete_keyspace_response : unit -> unit
val make_delete_keyspace_request :
  keyspace_name:string -> unit -> delete_keyspace_request
val make_create_table_response :
  resource_arn:string -> unit -> create_table_response
val make_create_table_request :
  ?replica_specifications:replica_specification list ->
    ?auto_scaling_specification:auto_scaling_specification ->
      ?client_side_timestamps:client_side_timestamps ->
        ?tags:tag list ->
          ?default_time_to_live:int ->
            ?ttl:time_to_live ->
              ?point_in_time_recovery:point_in_time_recovery ->
                ?encryption_specification:encryption_specification ->
                  ?capacity_specification:capacity_specification ->
                    ?comment:comment ->
                      schema_definition:schema_definition ->
                        table_name:string ->
                          keyspace_name:string ->
                            unit -> create_table_request
val make_create_keyspace_response :
  resource_arn:string -> unit -> create_keyspace_response
val make_create_keyspace_request :
  ?replication_specification:replication_specification ->
    ?tags:tag list -> keyspace_name:string -> unit -> create_keyspace_request(** {1:operations Operations} *)

module CreateKeyspace :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_keyspace_request ->
        (create_keyspace_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "The [CreateKeyspace] operation adds a new keyspace to your account. In an Amazon Web Services account, keyspace names must be unique within each Region.\n\n  [CreateKeyspace] is an asynchronous operation. You can monitor the creation status of the new keyspace by using the [GetKeyspace] operation.\n \n  For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/working-with-keyspaces.html#keyspaces-create}Creating keyspaces} in the {i Amazon Keyspaces Developer Guide}.\n  "]
module CreateTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_table_request ->
        (create_table_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "The [CreateTable] operation adds a new table to the specified keyspace. Within a keyspace, table names must be unique.\n\n  [CreateTable] is an asynchronous operation. When the request is received, the status of the table is set to [CREATING]. You can monitor the creation status of the new table by using the [GetTable] operation, which returns the current [status] of the table. You can start using a table when the status is [ACTIVE].\n \n  For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/working-with-tables.html#tables-create}Creating tables} in the {i Amazon Keyspaces Developer Guide}.\n  "]
module DeleteKeyspace :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_keyspace_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "The [DeleteKeyspace] operation deletes a keyspace and all of its tables. \n"]
module DeleteTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_table_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "The [DeleteTable] operation deletes a table and all of its data. After a [DeleteTable] request is received, the specified table is in the [DELETING] state until Amazon Keyspaces completes the deletion. If the table is in the [ACTIVE] state, you can delete it. If a table is either in the [CREATING] or [UPDATING] states, then Amazon Keyspaces returns a [ResourceInUseException]. If the specified table does not exist, Amazon Keyspaces returns a [ResourceNotFoundException]. If the table is already in the [DELETING] state, no error is returned.\n"]
module GetKeyspace :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_keyspace_request ->
        (get_keyspace_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the name and the Amazon Resource Name (ARN) of the specified table.\n"]
module GetTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_table_request ->
        (get_table_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns information about the table, including the table's name and current status, the keyspace name, configuration settings, and metadata.\n\n To read table metadata using [GetTable], [Select] action permissions for the table and system tables are required to complete the operation.\n "]
module GetTableAutoScalingSettings :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_table_auto_scaling_settings_request ->
        (get_table_auto_scaling_settings_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns auto scaling related settings of the specified table in JSON format. If the table is a multi-Region table, the Amazon Web Services Region specific auto scaling settings of the table are included.\n\n Amazon Keyspaces auto scaling helps you provision throughput capacity for variable workloads efficiently by increasing and decreasing your table's read and write capacity automatically in response to application traffic. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.\n \n    [GetTableAutoScalingSettings] can't be used as an action in an IAM policy.\n   \n     To define permissions for [GetTableAutoScalingSettings], you must allow the following two actions in the IAM policy statement's [Action] element:\n     \n      {ul\n            {-   [application-autoscaling:DescribeScalableTargets] \n                \n                 }\n            {-   [application-autoscaling:DescribeScalingPolicies] \n                \n                 }\n            }\n  "]
module ListKeyspaces :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_keyspaces_request ->
        (list_keyspaces_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Returns a list of keyspaces.\n"]
module ListTables :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tables_request ->
        (list_tables_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Returns a list of tables for a specified keyspace.\n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns a list of all tags associated with the specified Amazon Keyspaces resource.\n"]
module RestoreTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      restore_table_request ->
        (restore_table_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Restores the table to the specified point in time within the [earliest_restorable_timestamp] and the current time. For more information about restore points, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_window} Time window for PITR continuous backups} in the {i Amazon Keyspaces Developer Guide}.\n\n Any number of users can execute up to 4 concurrent restores (any type of restore) in a given account.\n \n  When you restore using point in time recovery, Amazon Keyspaces restores your source table's schema and data to the state based on the selected timestamp [(day:hour:minute:second)] to a new table. The Time to Live (TTL) settings are also restored to the state based on the selected timestamp.\n  \n   In addition to the table's schema, data, and TTL settings, [RestoreTable] restores the capacity mode, auto scaling settings, encryption settings, and point-in-time recovery settings from the source table. Unlike the table's schema data and TTL settings, which are restored based on the selected timestamp, these settings are always restored based on the table's settings as of the current time or when the table was deleted.\n   \n    You can also overwrite these settings during restore:\n    \n     {ul\n           {-  Read/write capacity mode\n               \n                }\n           {-  Provisioned throughput capacity units\n               \n                }\n           {-  Auto scaling settings\n               \n                }\n           {-  Point-in-time (PITR) settings\n               \n                }\n           {-  Tags\n               \n                }\n           }\n   For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_settings}PITR restore settings} in the {i Amazon Keyspaces Developer Guide}.\n   \n    Note that the following settings are not restored, and you must configure them manually for the new table:\n    \n     {ul\n           {-  Identity and Access Management (IAM) policies\n               \n                }\n           {-  Amazon CloudWatch metrics and alarms\n               \n                }\n           }\n  "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Associates a set of tags with a Amazon Keyspaces resource. You can then activate these user-defined tags so that they appear on the Cost Management Console for cost allocation tracking. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.\n\n For IAM policy examples that show how to control access to Amazon Keyspaces resources based on tags, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/security_iam_id-based-policy-examples.html#security_iam_id-based-policy-examples-tags}Amazon Keyspaces resource access based on tags} in the {i Amazon Keyspaces Developer Guide}.\n "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Removes the association of tags from a Amazon Keyspaces resource.\n"]
module UpdateTable :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_table_request ->
        (update_table_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Adds new columns to the table or updates one of the table's settings, for example capacity mode, auto scaling, encryption, point-in-time recovery, or ttl settings. Note that you can only update one specific table setting per update operation.\n"]