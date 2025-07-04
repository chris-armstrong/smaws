(** 
    DynamoDB client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type attribute_value =
  | BOOL of bool
  [@ocaml.doc
    "An attribute of type Boolean. For example:\n\n  [\"BOOL\": true] \n "]
  | NULL of bool
  [@ocaml.doc
    "An attribute of type Null. For example:\n\n  [\"NULL\": true] \n "]
  | L of attribute_value list
  [@ocaml.doc
    "An attribute of type List. For example:\n\n  [\"L\": \\[ {\"S\": \"Cookies\"} , {\"S\": \"Coffee\"}, {\"N\": \"3.14159\"}\\]] \n "]
  | M of map_attribute_value
  [@ocaml.doc
    "An attribute of type Map. For example:\n\n  [\"M\": {\"Name\": {\"S\": \"Joe\"}, \"Age\": {\"N\": \"35\"}}] \n "]
  | BS of bytes list
  [@ocaml.doc
    "An attribute of type Binary Set. For example:\n\n  [\"BS\": \\[\"U3Vubnk=\", \"UmFpbnk=\", \"U25vd3k=\"\\]] \n "]
  | NS of string list
  [@ocaml.doc
    "An attribute of type Number Set. For example:\n\n  [\"NS\": \\[\"42.2\", \"-19\", \"7.5\", \"3.14\"\\]] \n \n  Numbers are sent across the network to DynamoDB as strings, to maximize compatibility across languages and libraries. However, DynamoDB treats them as number type attributes for mathematical operations.\n  "]
  | SS of string list
  [@ocaml.doc
    "An attribute of type String Set. For example:\n\n  [\"SS\": \\[\"Giraffe\", \"Hippo\" ,\"Zebra\"\\]] \n "]
  | B of bytes
  [@ocaml.doc
    "An attribute of type Binary. For example:\n\n  [\"B\": \"dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk\"] \n "]
  | N of string
  [@ocaml.doc
    "An attribute of type Number. For example:\n\n  [\"N\": \"123.45\"] \n \n  Numbers are sent across the network to DynamoDB as strings, to maximize compatibility across languages and libraries. However, DynamoDB treats them as number type attributes for mathematical operations.\n  "]
  | S of string
  [@ocaml.doc
    "An attribute of type String. For example:\n\n  [\"S\": \"Hello\"] \n "]
[@@ocaml.doc
  "Represents the data for an attribute.\n\n Each attribute value is described as a name-value pair. The name is the data type, and the value is the data itself.\n \n  For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes}Data Types} in the {i Amazon DynamoDB Developer Guide}.\n  "]
and map_attribute_value = (string * attribute_value) list[@@ocaml.doc ""]
type nonrec put_item_input_attribute_map = (string * attribute_value) list
[@@ocaml.doc ""]
type nonrec put_request =
  {
  item: put_item_input_attribute_map
    [@ocaml.doc
      "A map of attribute name to attribute values, representing the primary key of an item to be processed by [PutItem]. All of the table's primary key attributes must be specified, and their data types must match those of the table's key schema. If any attributes are present in the item that are part of an index key schema for the table, their types must match the index key schema.\n"]}
[@@ocaml.doc
  "Represents a request to perform a [PutItem] operation on an item.\n"]
type nonrec key = (string * attribute_value) list[@@ocaml.doc ""]
type nonrec delete_request =
  {
  key: key
    [@ocaml.doc
      "A map of attribute name to attribute values, representing the primary key of the item to delete. All of the table's primary key attributes must be specified, and their data types must match those of the table's key schema.\n"]}
[@@ocaml.doc
  "Represents a request to perform a [DeleteItem] operation on an item.\n"]
type nonrec write_request =
  {
  delete_request: delete_request option
    [@ocaml.doc "A request to perform a [DeleteItem] operation.\n"];
  put_request: put_request option
    [@ocaml.doc "A request to perform a [PutItem] operation.\n"]}[@@ocaml.doc
                                                                   "Represents an operation to perform - either [DeleteItem] or [PutItem]. You can only request one of these operations, not both, in a single [WriteRequest]. If you do need to perform both of these operations, you need to provide two separate [WriteRequest] objects.\n"]
type nonrec time_to_live_specification =
  {
  attribute_name: string
    [@ocaml.doc
      "The name of the TTL attribute used to store the expiration time for items in the table.\n"];
  enabled: bool
    [@ocaml.doc
      "Indicates whether TTL is to be enabled (true) or disabled (false) on the table.\n"]}
[@@ocaml.doc
  "Represents the settings used to enable or disable Time to Live (TTL) for the specified table.\n"]
type nonrec update_time_to_live_output =
  {
  time_to_live_specification: time_to_live_specification option
    [@ocaml.doc
      "Represents the output of an [UpdateTimeToLive] operation.\n"]}
[@@ocaml.doc ""]
type nonrec update_time_to_live_input =
  {
  time_to_live_specification: time_to_live_specification
    [@ocaml.doc
      "Represents the settings used to enable or disable Time to Live for the specified table.\n"];
  table_name: string
    [@ocaml.doc
      "The name of the table to be configured. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc "Represents the input of an [UpdateTimeToLive] operation.\n"]
type nonrec resource_not_found_exception =
  {
  message: string option
    [@ocaml.doc "The resource which is being requested does not exist.\n"]}
[@@ocaml.doc
  "The operation tried to access a nonexistent table or index. The resource might not be specified correctly, or its status might not be [ACTIVE].\n"]
type nonrec resource_in_use_exception =
  {
  message: string option
    [@ocaml.doc
      "The resource which is being attempted to be changed is in use.\n"]}
[@@ocaml.doc
  "The operation conflicts with the resource's availability. For example, you attempted to recreate an existing table, or tried to delete a table currently in the [CREATING] state.\n"]
type nonrec limit_exceeded_exception =
  {
  message: string option
    [@ocaml.doc "Too many operations for a given subscriber.\n"]}[@@ocaml.doc
                                                                   "There is no limit to the number of daily on-demand backups that can be taken. \n\n For most purposes, up to 500 simultaneous table operations are allowed per account. These operations include [CreateTable], [UpdateTable], [DeleteTable],[UpdateTimeToLive], [RestoreTableFromBackup], and [RestoreTableToPointInTime]. \n \n  When you are creating a table with one or more secondary indexes, you can have up to 250 such requests running at a time. However, if the table or index specifications are complex, then DynamoDB might temporarily reduce the number of concurrent operations.\n  \n   When importing into DynamoDB, up to 50 simultaneous import table operations are allowed per account.\n   \n    There is a soft account quota of 2,500 tables.\n    \n     GetRecords was called with a value of more than 1000 for the limit request parameter.\n     \n      More than 2 processes are reading from the same streams shard at the same time. Exceeding this limit may result in request throttling.\n      "]
type nonrec invalid_endpoint_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec internal_server_error =
  {
  message: string option
    [@ocaml.doc
      "The server encountered an internal error trying to fulfill the request.\n"]}
[@@ocaml.doc "An error occurred on the server side.\n"]
type nonrec table_status =
  | ARCHIVED [@ocaml.doc ""]
  | ARCHIVING [@ocaml.doc ""]
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec index_status =
  | ACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec auto_scaling_target_tracking_scaling_policy_configuration_description =
  {
  target_value: float
    [@ocaml.doc
      "The target value for the metric. The range is 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).\n"];
  scale_out_cooldown: int option
    [@ocaml.doc
      "The amount of time, in seconds, after a scale out activity completes before another scale out activity can start. While the cooldown period is in effect, the capacity that has been added by the previous scale out event that initiated the cooldown is calculated as part of the desired capacity for the next scale out. You should continuously (but not excessively) scale out.\n"];
  scale_in_cooldown: int option
    [@ocaml.doc
      "The amount of time, in seconds, after a scale in activity completes before another scale in activity can start. The cooldown period is used to block subsequent scale in requests until it has expired. You should scale in conservatively to protect your application's availability. However, if another alarm triggers a scale out policy during the cooldown period after a scale-in, application auto scaling scales out your scalable target immediately. \n"];
  disable_scale_in: bool option
    [@ocaml.doc
      "Indicates whether scale in by the target tracking policy is disabled. If the value is true, scale in is disabled and the target tracking policy won't remove capacity from the scalable resource. Otherwise, scale in is enabled and the target tracking policy can remove capacity from the scalable resource. The default value is false.\n"]}
[@@ocaml.doc
  "Represents the properties of a target tracking scaling policy.\n"]
type nonrec auto_scaling_policy_description =
  {
  target_tracking_scaling_policy_configuration:
    auto_scaling_target_tracking_scaling_policy_configuration_description
      option
    [@ocaml.doc
      "Represents a target tracking scaling policy configuration.\n"];
  policy_name: string option [@ocaml.doc "The name of the scaling policy.\n"]}
[@@ocaml.doc "Represents the properties of the scaling policy.\n"]
type nonrec auto_scaling_settings_description =
  {
  scaling_policies: auto_scaling_policy_description list option
    [@ocaml.doc "Information about the scaling policies.\n"];
  auto_scaling_role_arn: string option
    [@ocaml.doc "Role ARN used for configuring the auto scaling policy.\n"];
  auto_scaling_disabled: bool option
    [@ocaml.doc
      "Disabled auto scaling for this global table or global secondary index.\n"];
  maximum_units: int option
    [@ocaml.doc
      "The maximum capacity units that a global table or global secondary index should be scaled up to.\n"];
  minimum_units: int option
    [@ocaml.doc
      "The minimum capacity units that a global table or global secondary index should be scaled down to.\n"]}
[@@ocaml.doc
  "Represents the auto scaling settings for a global table or global secondary index.\n"]
type nonrec replica_global_secondary_index_auto_scaling_description =
  {
  provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option [@ocaml.doc ""];
  provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option [@ocaml.doc ""];
  index_status: index_status option
    [@ocaml.doc
      "The current state of the replica global secondary index:\n\n {ul\n       {-   [CREATING] - The index is being created.\n           \n            }\n       {-   [UPDATING] - The table/index configuration is being updated. The table/index remains available for data operations when [UPDATING] \n           \n            }\n       {-   [DELETING] - The index is being deleted.\n           \n            }\n       {-   [ACTIVE] - The index is ready for use.\n           \n            }\n       }\n  "];
  index_name: string option
    [@ocaml.doc "The name of the global secondary index.\n"]}[@@ocaml.doc
                                                               "Represents the auto scaling configuration for a replica global secondary index.\n"]
type nonrec replica_status =
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS [@ocaml.doc ""]
  | REGION_DISABLED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | CREATION_FAILED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec replica_auto_scaling_description =
  {
  replica_status: replica_status option
    [@ocaml.doc
      "The current state of the replica:\n\n {ul\n       {-   [CREATING] - The replica is being created.\n           \n            }\n       {-   [UPDATING] - The replica is being updated.\n           \n            }\n       {-   [DELETING] - The replica is being deleted.\n           \n            }\n       {-   [ACTIVE] - The replica is ready for use.\n           \n            }\n       }\n  "];
  replica_provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option [@ocaml.doc ""];
  replica_provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option [@ocaml.doc ""];
  global_secondary_indexes:
    replica_global_secondary_index_auto_scaling_description list option
    [@ocaml.doc
      "Replica-specific global secondary index auto scaling settings.\n"];
  region_name: string option
    [@ocaml.doc "The Region where the replica exists.\n"]}[@@ocaml.doc
                                                            "Represents the auto scaling settings of the replica.\n"]
type nonrec table_auto_scaling_description =
  {
  replicas: replica_auto_scaling_description list option
    [@ocaml.doc "Represents replicas of the global table.\n"];
  table_status: table_status option
    [@ocaml.doc
      "The current state of the table:\n\n {ul\n       {-   [CREATING] - The table is being created.\n           \n            }\n       {-   [UPDATING] - The table is being updated.\n           \n            }\n       {-   [DELETING] - The table is being deleted.\n           \n            }\n       {-   [ACTIVE] - The table is ready for use.\n           \n            }\n       }\n  "];
  table_name: string option [@ocaml.doc "The name of the table.\n"]}[@@ocaml.doc
                                                                    "Represents the auto scaling configuration for a global table.\n"]
type nonrec update_table_replica_auto_scaling_output =
  {
  table_auto_scaling_description: table_auto_scaling_description option
    [@ocaml.doc
      "Returns information about the auto scaling settings of a table with replicas.\n"]}
[@@ocaml.doc ""]
type nonrec auto_scaling_target_tracking_scaling_policy_configuration_update =
  {
  target_value: float
    [@ocaml.doc
      "The target value for the metric. The range is 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).\n"];
  scale_out_cooldown: int option
    [@ocaml.doc
      "The amount of time, in seconds, after a scale out activity completes before another scale out activity can start. While the cooldown period is in effect, the capacity that has been added by the previous scale out event that initiated the cooldown is calculated as part of the desired capacity for the next scale out. You should continuously (but not excessively) scale out.\n"];
  scale_in_cooldown: int option
    [@ocaml.doc
      "The amount of time, in seconds, after a scale in activity completes before another scale in activity can start. The cooldown period is used to block subsequent scale in requests until it has expired. You should scale in conservatively to protect your application's availability. However, if another alarm triggers a scale out policy during the cooldown period after a scale-in, application auto scaling scales out your scalable target immediately. \n"];
  disable_scale_in: bool option
    [@ocaml.doc
      "Indicates whether scale in by the target tracking policy is disabled. If the value is true, scale in is disabled and the target tracking policy won't remove capacity from the scalable resource. Otherwise, scale in is enabled and the target tracking policy can remove capacity from the scalable resource. The default value is false.\n"]}
[@@ocaml.doc
  "Represents the settings of a target tracking scaling policy that will be modified.\n"]
type nonrec auto_scaling_policy_update =
  {
  target_tracking_scaling_policy_configuration:
    auto_scaling_target_tracking_scaling_policy_configuration_update
    [@ocaml.doc
      "Represents a target tracking scaling policy configuration.\n"];
  policy_name: string option [@ocaml.doc "The name of the scaling policy.\n"]}
[@@ocaml.doc "Represents the auto scaling policy to be modified.\n"]
type nonrec auto_scaling_settings_update =
  {
  scaling_policy_update: auto_scaling_policy_update option
    [@ocaml.doc
      "The scaling policy to apply for scaling target global table or global secondary index capacity units.\n"];
  auto_scaling_role_arn: string option
    [@ocaml.doc "Role ARN used for configuring auto scaling policy.\n"];
  auto_scaling_disabled: bool option
    [@ocaml.doc
      "Disabled auto scaling for this global table or global secondary index.\n"];
  maximum_units: int option
    [@ocaml.doc
      "The maximum capacity units that a global table or global secondary index should be scaled up to.\n"];
  minimum_units: int option
    [@ocaml.doc
      "The minimum capacity units that a global table or global secondary index should be scaled down to.\n"]}
[@@ocaml.doc
  "Represents the auto scaling settings to be modified for a global table or global secondary index.\n"]
type nonrec global_secondary_index_auto_scaling_update =
  {
  provisioned_write_capacity_auto_scaling_update:
    auto_scaling_settings_update option [@ocaml.doc ""];
  index_name: string option
    [@ocaml.doc "The name of the global secondary index.\n"]}[@@ocaml.doc
                                                               "Represents the auto scaling settings of a global secondary index for a global table that will be modified.\n"]
type nonrec replica_global_secondary_index_auto_scaling_update =
  {
  provisioned_read_capacity_auto_scaling_update:
    auto_scaling_settings_update option [@ocaml.doc ""];
  index_name: string option
    [@ocaml.doc "The name of the global secondary index.\n"]}[@@ocaml.doc
                                                               "Represents the auto scaling settings of a global secondary index for a replica that will be modified.\n"]
type nonrec replica_auto_scaling_update =
  {
  replica_provisioned_read_capacity_auto_scaling_update:
    auto_scaling_settings_update option [@ocaml.doc ""];
  replica_global_secondary_index_updates:
    replica_global_secondary_index_auto_scaling_update list option
    [@ocaml.doc
      "Represents the auto scaling settings of global secondary indexes that will be modified.\n"];
  region_name: string [@ocaml.doc "The Region where the replica exists.\n"]}
[@@ocaml.doc
  "Represents the auto scaling settings of a replica that will be modified.\n"]
type nonrec update_table_replica_auto_scaling_input =
  {
  replica_updates: replica_auto_scaling_update list option
    [@ocaml.doc
      "Represents the auto scaling settings of replicas of the table that will be modified.\n"];
  provisioned_write_capacity_auto_scaling_update:
    auto_scaling_settings_update option [@ocaml.doc ""];
  table_name: string
    [@ocaml.doc
      "The name of the global table to be updated. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"];
  global_secondary_index_updates:
    global_secondary_index_auto_scaling_update list option
    [@ocaml.doc
      "Represents the auto scaling settings of the global secondary indexes of the replica to be updated.\n"]}
[@@ocaml.doc ""]
type nonrec scalar_attribute_type =
  | B [@ocaml.doc ""]
  | N [@ocaml.doc ""]
  | S [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec attribute_definition =
  {
  attribute_type: scalar_attribute_type
    [@ocaml.doc
      "The data type for the attribute, where:\n\n {ul\n       {-   [S] - the attribute is of type String\n           \n            }\n       {-   [N] - the attribute is of type Number\n           \n            }\n       {-   [B] - the attribute is of type Binary\n           \n            }\n       }\n  "];
  attribute_name: string [@ocaml.doc "A name for the attribute.\n"]}[@@ocaml.doc
                                                                    "Represents an attribute for describing the schema for the table and indexes.\n"]
type nonrec key_type =
  | RANGE [@ocaml.doc ""]
  | HASH [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec key_schema_element =
  {
  key_type: key_type
    [@ocaml.doc
      "The role that this key attribute will assume:\n\n {ul\n       {-   [HASH] - partition key\n           \n            }\n       {-   [RANGE] - sort key\n           \n            }\n       }\n    The partition key of an item is also known as its {i hash attribute}. The term \"hash attribute\" derives from DynamoDB's usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.\n    \n     The sort key of an item is also known as its {i range attribute}. The term \"range attribute\" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.\n     \n      "];
  attribute_name: string [@ocaml.doc "The name of a key attribute.\n"]}
[@@ocaml.doc
  "Represents {i a single element} of a key schema. A key schema specifies the attributes that make up the primary key of a table, or the key attributes of an index.\n\n A [KeySchemaElement] represents exactly one attribute of the primary key. For example, a simple primary key would be represented by one [KeySchemaElement] (for the partition key). A composite primary key would require one [KeySchemaElement] for the partition key, and another [KeySchemaElement] for the sort key.\n \n  A [KeySchemaElement] must be a scalar, top-level attribute (not a nested attribute). The data type must be one of String, Number, or Binary. The attribute cannot be nested within a List or a Map.\n  "]
type nonrec provisioned_throughput_description =
  {
  write_capacity_units: int option
    [@ocaml.doc
      "The maximum number of writes consumed per second before DynamoDB returns a [ThrottlingException].\n"];
  read_capacity_units: int option
    [@ocaml.doc
      "The maximum number of strongly consistent reads consumed per second before DynamoDB returns a [ThrottlingException]. Eventually consistent reads require less effort than strongly consistent reads, so a setting of 50 [ReadCapacityUnits] per second provides 100 eventually consistent [ReadCapacityUnits] per second.\n"];
  number_of_decreases_today: int option
    [@ocaml.doc
      "The number of provisioned throughput decreases for this table during this UTC calendar day. For current maximums on provisioned throughput decreases, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html}Service, Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.\n"];
  last_decrease_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time of the last provisioned throughput decrease for this table.\n"];
  last_increase_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time of the last provisioned throughput increase for this table.\n"]}
[@@ocaml.doc
  "Represents the provisioned throughput settings for the table, consisting of read and write capacity units, along with data about increases and decreases.\n"]
type nonrec billing_mode =
  | PAY_PER_REQUEST [@ocaml.doc ""]
  | PROVISIONED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec billing_mode_summary =
  {
  last_update_to_pay_per_request_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Represents the time when [PAY_PER_REQUEST] was last set as the read/write capacity mode.\n"];
  billing_mode: billing_mode option
    [@ocaml.doc
      "Controls how you are charged for read and write throughput and how you manage capacity. This setting can be changed later.\n\n {ul\n       {-   [PROVISIONED] - Sets the read/write capacity mode to [PROVISIONED]. We recommend using [PROVISIONED] for predictable workloads.\n           \n            }\n       {-   [PAY_PER_REQUEST] - Sets the read/write capacity mode to [PAY_PER_REQUEST]. We recommend using [PAY_PER_REQUEST] for unpredictable workloads. \n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "Contains the details for the read/write capacity mode. This page talks about [PROVISIONED] and [PAY_PER_REQUEST] billing modes. For more information about these modes, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html}Read/write capacity mode}.\n\n  You may need to switch to on-demand mode at least once in order to return a [BillingModeSummary] response.\n  \n   "]
type nonrec projection_type =
  | INCLUDE [@ocaml.doc ""]
  | KEYS_ONLY [@ocaml.doc ""]
  | ALL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec projection =
  {
  non_key_attributes: string list option
    [@ocaml.doc
      "Represents the non-key attribute names which will be projected into the index.\n\n For local secondary indexes, the total count of [NonKeyAttributes] summed across all of the local secondary indexes, must not exceed 100. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.\n "];
  projection_type: projection_type option
    [@ocaml.doc
      "The set of attributes that are projected into the index:\n\n {ul\n       {-   [KEYS_ONLY] - Only the index and primary keys are projected into the index.\n           \n            }\n       {-   [INCLUDE] - In addition to the attributes described in [KEYS_ONLY], the secondary index will include other non-key attributes that you specify.\n           \n            }\n       {-   [ALL] - All of the table attributes are projected into the index.\n           \n            }\n       }\n   When using the DynamoDB console, [ALL] is selected by default.\n   "]}
[@@ocaml.doc
  "Represents attributes that are copied (projected) from the table into an index. These are in addition to the primary key attributes and index key attributes, which are automatically projected.\n"]
type nonrec local_secondary_index_description =
  {
  index_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that uniquely identifies the index.\n"];
  item_count: int option
    [@ocaml.doc
      "The number of items in the specified index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.\n"];
  index_size_bytes: int option
    [@ocaml.doc
      "The total size of the specified index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.\n"];
  projection: projection option
    [@ocaml.doc
      "Represents attributes that are copied (projected) from the table into the global secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. \n"];
  key_schema: key_schema_element list option
    [@ocaml.doc
      "The complete key schema for the local secondary index, consisting of one or more pairs of attribute names and key types:\n\n {ul\n       {-   [HASH] - partition key\n           \n            }\n       {-   [RANGE] - sort key\n           \n            }\n       }\n    The partition key of an item is also known as its {i hash attribute}. The term \"hash attribute\" derives from DynamoDB's usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.\n    \n     The sort key of an item is also known as its {i range attribute}. The term \"range attribute\" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.\n     \n      "];
  index_name: string option
    [@ocaml.doc "Represents the name of the local secondary index.\n"]}
[@@ocaml.doc "Represents the properties of a local secondary index.\n"]
type nonrec on_demand_throughput =
  {
  max_write_request_units: int option
    [@ocaml.doc
      "Maximum number of write request units for the specified table.\n\n To specify a maximum [OnDemandThroughput] on your table, set the value of [MaxWriteRequestUnits] as greater than or equal to 1. To remove the maximum [OnDemandThroughput] that is currently set on your table, set the value of [MaxWriteRequestUnits] to -1.\n "];
  max_read_request_units: int option
    [@ocaml.doc
      "Maximum number of read request units for the specified table.\n\n To specify a maximum [OnDemandThroughput] on your table, set the value of [MaxReadRequestUnits] as greater than or equal to 1. To remove the maximum [OnDemandThroughput] that is currently set on your table, set the value of [MaxReadRequestUnits] to -1.\n "]}
[@@ocaml.doc
  "Sets the maximum number of read and write units for the specified on-demand table. If you use this parameter, you must specify [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.\n"]
type nonrec global_secondary_index_description =
  {
  on_demand_throughput: on_demand_throughput option
    [@ocaml.doc
      "The maximum number of read and write units for the specified global secondary index. If you use this parameter, you must specify [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.\n"];
  index_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that uniquely identifies the index.\n"];
  item_count: int option
    [@ocaml.doc
      "The number of items in the specified index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.\n"];
  index_size_bytes: int option
    [@ocaml.doc
      "The total size of the specified index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.\n"];
  provisioned_throughput: provisioned_throughput_description option
    [@ocaml.doc
      "Represents the provisioned throughput settings for the specified global secondary index.\n\n For current minimum and maximum provisioned throughput values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html}Service, Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.\n "];
  backfilling: bool option
    [@ocaml.doc
      "Indicates whether the index is currently backfilling. {i Backfilling} is the process of reading items from the table and determining whether they can be added to the index. (Not all items will qualify: For example, a partition key cannot have any duplicate values.) If an item can be added to the index, DynamoDB will do so. After all items have been processed, the backfilling operation is complete and [Backfilling] is false.\n\n You can delete an index that is being created during the [Backfilling] phase when [IndexStatus] is set to CREATING and [Backfilling] is true. You can't delete the index that is being created when [IndexStatus] is set to CREATING and [Backfilling] is false. \n \n   For indexes that were created during a [CreateTable] operation, the [Backfilling] attribute does not appear in the [DescribeTable] output.\n   \n    "];
  index_status: index_status option
    [@ocaml.doc
      "The current state of the global secondary index:\n\n {ul\n       {-   [CREATING] - The index is being created.\n           \n            }\n       {-   [UPDATING] - The index is being updated.\n           \n            }\n       {-   [DELETING] - The index is being deleted.\n           \n            }\n       {-   [ACTIVE] - The index is ready for use.\n           \n            }\n       }\n  "];
  projection: projection option
    [@ocaml.doc
      "Represents attributes that are copied (projected) from the table into the global secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. \n"];
  key_schema: key_schema_element list option
    [@ocaml.doc
      "The complete key schema for a global secondary index, which consists of one or more pairs of attribute names and key types:\n\n {ul\n       {-   [HASH] - partition key\n           \n            }\n       {-   [RANGE] - sort key\n           \n            }\n       }\n    The partition key of an item is also known as its {i hash attribute}. The term \"hash attribute\" derives from DynamoDB's usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.\n    \n     The sort key of an item is also known as its {i range attribute}. The term \"range attribute\" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.\n     \n      "];
  index_name: string option
    [@ocaml.doc "The name of the global secondary index.\n"]}[@@ocaml.doc
                                                               "Represents the properties of a global secondary index.\n"]
type nonrec stream_view_type =
  | KEYS_ONLY [@ocaml.doc ""]
  | NEW_AND_OLD_IMAGES [@ocaml.doc ""]
  | OLD_IMAGE [@ocaml.doc ""]
  | NEW_IMAGE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec stream_specification =
  {
  stream_view_type: stream_view_type option
    [@ocaml.doc
      " When an item in the table is modified, [StreamViewType] determines what information is written to the stream for this table. Valid values for [StreamViewType] are:\n\n {ul\n       {-   [KEYS_ONLY] - Only the key attributes of the modified item are written to the stream.\n           \n            }\n       {-   [NEW_IMAGE] - The entire item, as it appears after it was modified, is written to the stream.\n           \n            }\n       {-   [OLD_IMAGE] - The entire item, as it appeared before it was modified, is written to the stream.\n           \n            }\n       {-   [NEW_AND_OLD_IMAGES] - Both the new and the old item images of the item are written to the stream.\n           \n            }\n       }\n  "];
  stream_enabled: bool
    [@ocaml.doc
      "Indicates whether DynamoDB Streams is enabled (true) or disabled (false) on the table.\n"]}
[@@ocaml.doc
  "Represents the DynamoDB Streams configuration for a table in DynamoDB.\n"]
type nonrec provisioned_throughput_override =
  {
  read_capacity_units: int option
    [@ocaml.doc
      "Replica-specific read capacity units. If not specified, uses the source table's read capacity settings.\n"]}
[@@ocaml.doc
  "Replica-specific provisioned throughput settings. If not specified, uses the source table's provisioned throughput settings.\n"]
type nonrec on_demand_throughput_override =
  {
  max_read_request_units: int option
    [@ocaml.doc
      "Maximum number of read request units for the specified replica table.\n"]}
[@@ocaml.doc
  "Overrides the on-demand throughput settings for this replica table. If you don't specify a value for this parameter, it uses the source table's on-demand throughput settings.\n"]
type nonrec replica_global_secondary_index_description =
  {
  on_demand_throughput_override: on_demand_throughput_override option
    [@ocaml.doc
      "Overrides the maximum on-demand throughput for the specified global secondary index in the specified replica table.\n"];
  provisioned_throughput_override: provisioned_throughput_override option
    [@ocaml.doc
      "If not described, uses the source table GSI's read capacity settings.\n"];
  index_name: string option
    [@ocaml.doc "The name of the global secondary index.\n"]}[@@ocaml.doc
                                                               "Represents the properties of a replica global secondary index.\n"]
type nonrec table_class =
  | STANDARD_INFREQUENT_ACCESS [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec table_class_summary =
  {
  last_update_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time at which the table class was last updated.\n"];
  table_class: table_class option
    [@ocaml.doc
      "The table class of the specified table. Valid values are [STANDARD] and [STANDARD_INFREQUENT_ACCESS].\n"]}
[@@ocaml.doc "Contains details of the table class.\n"]
type nonrec replica_description =
  {
  replica_table_class_summary: table_class_summary option [@ocaml.doc ""];
  replica_inaccessible_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time at which the replica was first detected as inaccessible. To determine cause of inaccessibility check the [ReplicaStatus] property.\n"];
  global_secondary_indexes:
    replica_global_secondary_index_description list option
    [@ocaml.doc "Replica-specific global secondary index settings.\n"];
  on_demand_throughput_override: on_demand_throughput_override option
    [@ocaml.doc
      "Overrides the maximum on-demand throughput settings for the specified replica table.\n"];
  provisioned_throughput_override: provisioned_throughput_override option
    [@ocaml.doc
      "Replica-specific provisioned throughput. If not described, uses the source table's provisioned throughput settings.\n"];
  kms_master_key_id: string option
    [@ocaml.doc
      "The KMS key of the replica that will be used for KMS encryption.\n"];
  replica_status_percent_progress: string option
    [@ocaml.doc
      "Specifies the progress of a Create, Update, or Delete action on the replica as a percentage.\n"];
  replica_status_description: string option
    [@ocaml.doc "Detailed information about the replica status.\n"];
  replica_status: replica_status option
    [@ocaml.doc
      "The current state of the replica:\n\n {ul\n       {-   [CREATING] - The replica is being created.\n           \n            }\n       {-   [UPDATING] - The replica is being updated.\n           \n            }\n       {-   [DELETING] - The replica is being deleted.\n           \n            }\n       {-   [ACTIVE] - The replica is ready for use.\n           \n            }\n       {-   [REGION_DISABLED] - The replica is inaccessible because the Amazon Web Services Region has been disabled.\n           \n             If the Amazon Web Services Region remains inaccessible for more than 20 hours, DynamoDB will remove this replica from the replication group. The replica will not be deleted and replication will stop from and to this region.\n             \n               }\n       {-   [INACCESSIBLE_ENCRYPTION_CREDENTIALS ] - The KMS key used to encrypt the table is inaccessible.\n           \n             If the KMS key remains inaccessible for more than 20 hours, DynamoDB will remove this replica from the replication group. The replica will not be deleted and replication will stop from and to this region.\n             \n               }\n       }\n  "];
  region_name: string option [@ocaml.doc "The name of the Region.\n"]}
[@@ocaml.doc "Contains the details of the replica.\n"]
type nonrec restore_summary =
  {
  restore_in_progress: bool
    [@ocaml.doc "Indicates if a restore is in progress or not.\n"];
  restore_date_time: CoreTypes.Timestamp.t
    [@ocaml.doc "Point in time or source backup time.\n"];
  source_table_arn: string option
    [@ocaml.doc
      "The ARN of the source table of the backup that is being restored.\n"];
  source_backup_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the backup from which the table was restored.\n"]}
[@@ocaml.doc "Contains details for the restore.\n"]
type nonrec sse_status =
  | UPDATING [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sse_type =
  | KMS [@ocaml.doc ""]
  | AES256 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sse_description =
  {
  inaccessible_encryption_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Indicates the time, in UNIX epoch date format, when DynamoDB detected that the table's KMS key was inaccessible. This attribute will automatically be cleared when DynamoDB detects that the table's KMS key is accessible again. DynamoDB will initiate the table archival process when table's KMS key remains inaccessible for more than seven days from this date.\n"];
  kms_master_key_arn: string option
    [@ocaml.doc "The KMS key ARN used for the KMS encryption.\n"];
  sse_type: sse_type option
    [@ocaml.doc
      "Server-side encryption type. The only supported value is:\n\n {ul\n       {-   [KMS] - Server-side encryption that uses Key Management Service. The key is stored in your account and is managed by KMS (KMS charges apply).\n           \n            }\n       }\n  "];
  status: sse_status option
    [@ocaml.doc
      "Represents the current state of server-side encryption. The only supported values are:\n\n {ul\n       {-   [ENABLED] - Server-side encryption is enabled.\n           \n            }\n       {-   [UPDATING] - Server-side encryption is being updated.\n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "The description of the server-side encryption status on the specified table.\n"]
type nonrec archival_summary =
  {
  archival_backup_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the backup the table was archived to, when applicable in the archival reason. If you wish to restore this backup to the same table name, you will need to delete the original table.\n"];
  archival_reason: string option
    [@ocaml.doc
      "The reason DynamoDB archived the table. Currently, the only possible value is:\n\n {ul\n       {-   [INACCESSIBLE_ENCRYPTION_CREDENTIALS] - The table was archived due to the table's KMS key being inaccessible for more than seven days. An On-Demand backup was created at the archival time.\n           \n            }\n       }\n  "];
  archival_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when table archival was initiated by DynamoDB, in UNIX epoch time format.\n"]}
[@@ocaml.doc "Contains details of a table archival operation.\n"]
type nonrec table_description =
  {
  on_demand_throughput: on_demand_throughput option
    [@ocaml.doc
      "The maximum number of read and write units for the specified on-demand table. If you use this parameter, you must specify [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.\n"];
  deletion_protection_enabled: bool option
    [@ocaml.doc
      "Indicates whether deletion protection is enabled (true) or disabled (false) on the table.\n"];
  table_class_summary: table_class_summary option
    [@ocaml.doc "Contains details of the table class.\n"];
  archival_summary: archival_summary option
    [@ocaml.doc "Contains information about the table archive.\n"];
  sse_description: sse_description option
    [@ocaml.doc
      "The description of the server-side encryption status on the specified table.\n"];
  restore_summary: restore_summary option
    [@ocaml.doc "Contains details for the restore.\n"];
  replicas: replica_description list option
    [@ocaml.doc "Represents replicas of the table.\n"];
  global_table_version: string option
    [@ocaml.doc
      "Represents the version of {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}global tables} in use, if the table is replicated across Amazon Web Services Regions.\n"];
  latest_stream_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that uniquely identifies the latest stream for this table.\n"];
  latest_stream_label: string option
    [@ocaml.doc
      "A timestamp, in ISO 8601 format, for this stream.\n\n Note that [LatestStreamLabel] is not a unique identifier for the stream, because it is possible that a stream from another table might have the same timestamp. However, the combination of the following three elements is guaranteed to be unique:\n \n  {ul\n        {-  Amazon Web Services customer ID\n            \n             }\n        {-  Table name\n            \n             }\n        {-   [StreamLabel] \n            \n             }\n        }\n  "];
  stream_specification: stream_specification option
    [@ocaml.doc
      "The current DynamoDB Streams configuration for the table.\n"];
  global_secondary_indexes: global_secondary_index_description list option
    [@ocaml.doc
      "The global secondary indexes, if any, on the table. Each index is scoped to a given partition key value. Each element is composed of:\n\n {ul\n       {-   [Backfilling] - If true, then the index is currently in the backfilling phase. Backfilling occurs only when a new global secondary index is added to the table. It is the process by which DynamoDB populates the new index with data from the table. (This attribute does not appear for indexes that were created during a [CreateTable] operation.) \n           \n             You can delete an index that is being created during the [Backfilling] phase when [IndexStatus] is set to CREATING and [Backfilling] is true. You can't delete the index that is being created when [IndexStatus] is set to CREATING and [Backfilling] is false. (This attribute does not appear for indexes that were created during a [CreateTable] operation.)\n            \n             }\n       {-   [IndexName] - The name of the global secondary index.\n           \n            }\n       {-   [IndexSizeBytes] - The total size of the global secondary index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. \n           \n            }\n       {-   [IndexStatus] - The current status of the global secondary index:\n           \n            {ul\n                  {-   [CREATING] - The index is being created.\n                      \n                       }\n                  {-   [UPDATING] - The index is being updated.\n                      \n                       }\n                  {-   [DELETING] - The index is being deleted.\n                      \n                       }\n                  {-   [ACTIVE] - The index is ready for use.\n                      \n                       }\n                  \n        }\n         }\n       {-   [ItemCount] - The number of items in the global secondary index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. \n           \n            }\n       {-   [KeySchema] - Specifies the complete index key schema. The attribute names in the key schema must be between 1 and 255 characters (inclusive). The key schema must begin with the same partition key as the table.\n           \n            }\n       {-   [Projection] - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:\n           \n            {ul\n                  {-   [ProjectionType] - One of the following:\n                      \n                       {ul\n                             {-   [KEYS_ONLY] - Only the index and primary keys are projected into the index.\n                                 \n                                  }\n                             {-   [INCLUDE] - In addition to the attributes described in [KEYS_ONLY], the secondary index will include other non-key attributes that you specify.\n                                 \n                                  }\n                             {-   [ALL] - All of the table attributes are projected into the index.\n                                 \n                                  }\n                             \n                   }\n                    }\n                  {-   [NonKeyAttributes] - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in [NonKeyAttributes], summed across all of the secondary indexes, must not exceed 100. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.\n                      \n                       }\n                  \n        }\n         }\n       {-   [ProvisionedThroughput] - The provisioned throughput settings for the global secondary index, consisting of read and write capacity units, along with data about increases and decreases. \n           \n            }\n       }\n   If the table is in the [DELETING] state, no information about indexes will be returned.\n   "];
  local_secondary_indexes: local_secondary_index_description list option
    [@ocaml.doc
      "Represents one or more local secondary indexes on the table. Each index is scoped to a given partition key value. Tables with one or more local secondary indexes are subject to an item collection size limit, where the amount of data within a given item collection cannot exceed 10 GB. Each element is composed of:\n\n {ul\n       {-   [IndexName] - The name of the local secondary index.\n           \n            }\n       {-   [KeySchema] - Specifies the complete index key schema. The attribute names in the key schema must be between 1 and 255 characters (inclusive). The key schema must begin with the same partition key as the table.\n           \n            }\n       {-   [Projection] - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:\n           \n            {ul\n                  {-   [ProjectionType] - One of the following:\n                      \n                       {ul\n                             {-   [KEYS_ONLY] - Only the index and primary keys are projected into the index.\n                                 \n                                  }\n                             {-   [INCLUDE] - Only the specified table attributes are projected into the index. The list of projected attributes is in [NonKeyAttributes].\n                                 \n                                  }\n                             {-   [ALL] - All of the table attributes are projected into the index.\n                                 \n                                  }\n                             \n                   }\n                    }\n                  {-   [NonKeyAttributes] - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in [NonKeyAttributes], summed across all of the secondary indexes, must not exceed 100. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.\n                      \n                       }\n                  \n        }\n         }\n       {-   [IndexSizeBytes] - Represents the total size of the index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.\n           \n            }\n       {-   [ItemCount] - Represents the number of items in the index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.\n           \n            }\n       }\n   If the table is in the [DELETING] state, no information about indexes will be returned.\n   "];
  billing_mode_summary: billing_mode_summary option
    [@ocaml.doc "Contains the details for the read/write capacity mode.\n"];
  table_id: string option
    [@ocaml.doc
      "Unique identifier for the table for which the backup was created. \n"];
  table_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that uniquely identifies the table.\n"];
  item_count: int option
    [@ocaml.doc
      "The number of items in the specified table. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.\n"];
  table_size_bytes: int option
    [@ocaml.doc
      "The total size of the specified table, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.\n"];
  provisioned_throughput: provisioned_throughput_description option
    [@ocaml.doc
      "The provisioned throughput settings for the table, consisting of read and write capacity units, along with data about increases and decreases.\n"];
  creation_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when the table was created, in {{:http://www.epochconverter.com/}UNIX epoch time} format.\n"];
  table_status: table_status option
    [@ocaml.doc
      "The current state of the table:\n\n {ul\n       {-   [CREATING] - The table is being created.\n           \n            }\n       {-   [UPDATING] - The table/index configuration is being updated. The table/index remains available for data operations when [UPDATING].\n           \n            }\n       {-   [DELETING] - The table is being deleted.\n           \n            }\n       {-   [ACTIVE] - The table is ready for use.\n           \n            }\n       {-   [INACCESSIBLE_ENCRYPTION_CREDENTIALS] - The KMS key used to encrypt the table in inaccessible. Table operations may fail due to failure to use the KMS key. DynamoDB will initiate the table archival process when a table's KMS key remains inaccessible for more than seven days. \n           \n            }\n       {-   [ARCHIVING] - The table is being archived. Operations are not allowed until archival is complete. \n           \n            }\n       {-   [ARCHIVED] - The table has been archived. See the ArchivalReason for more information. \n           \n            }\n       }\n  "];
  key_schema: key_schema_element list option
    [@ocaml.doc
      "The primary key structure for the table. Each [KeySchemaElement] consists of:\n\n {ul\n       {-   [AttributeName] - The name of the attribute.\n           \n            }\n       {-   [KeyType] - The role of the attribute:\n           \n            {ul\n                  {-   [HASH] - partition key\n                      \n                       }\n                  {-   [RANGE] - sort key\n                      \n                       }\n                  \n        }\n          The partition key of an item is also known as its {i hash attribute}. The term \"hash attribute\" derives from DynamoDB's usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.\n          \n           The sort key of an item is also known as its {i range attribute}. The term \"range attribute\" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.\n           \n             }\n       }\n   For more information about primary keys, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html#DataModelPrimaryKey}Primary Key} in the {i Amazon DynamoDB Developer Guide}.\n   "];
  table_name: string option [@ocaml.doc "The name of the table.\n"];
  attribute_definitions: attribute_definition list option
    [@ocaml.doc
      "An array of [AttributeDefinition] objects. Each of these objects describes one attribute in the table and index key schema.\n\n Each [AttributeDefinition] object in this array is composed of:\n \n  {ul\n        {-   [AttributeName] - The name of the attribute.\n            \n             }\n        {-   [AttributeType] - The data type for the attribute.\n            \n             }\n        }\n  "]}
[@@ocaml.doc "Represents the properties of a table.\n"]
type nonrec update_table_output =
  {
  table_description: table_description option
    [@ocaml.doc "Represents the properties of the table.\n"]}[@@ocaml.doc
                                                               "Represents the output of an [UpdateTable] operation.\n"]
type nonrec provisioned_throughput =
  {
  write_capacity_units: int
    [@ocaml.doc
      "The maximum number of writes consumed per second before DynamoDB returns a [ThrottlingException]. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughput.html}Specifying Read and Write Requirements} in the {i Amazon DynamoDB Developer Guide}.\n\n If read/write capacity mode is [PAY_PER_REQUEST] the value is set to 0.\n "];
  read_capacity_units: int
    [@ocaml.doc
      "The maximum number of strongly consistent reads consumed per second before DynamoDB returns a [ThrottlingException]. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughput.html}Specifying Read and Write Requirements} in the {i Amazon DynamoDB Developer Guide}.\n\n If read/write capacity mode is [PAY_PER_REQUEST] the value is set to 0.\n "]}
[@@ocaml.doc
  "Represents the provisioned throughput settings for a specified table or index. The settings can be modified using the [UpdateTable] operation.\n\n For current minimum and maximum provisioned throughput values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html}Service, Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.\n "]
type nonrec update_global_secondary_index_action =
  {
  on_demand_throughput: on_demand_throughput option
    [@ocaml.doc
      "Updates the maximum number of read and write units for the specified global secondary index. If you use this parameter, you must specify [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.\n"];
  provisioned_throughput: provisioned_throughput option
    [@ocaml.doc
      "Represents the provisioned throughput settings for the specified global secondary index.\n\n For current minimum and maximum provisioned throughput values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html}Service, Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.\n "];
  index_name: string
    [@ocaml.doc "The name of the global secondary index to be updated.\n"]}
[@@ocaml.doc
  "Represents the new provisioned throughput settings to be applied to a global secondary index.\n"]
type nonrec create_global_secondary_index_action =
  {
  on_demand_throughput: on_demand_throughput option
    [@ocaml.doc
      "The maximum number of read and write units for the global secondary index being created. If you use this parameter, you must specify [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.\n"];
  provisioned_throughput: provisioned_throughput option
    [@ocaml.doc
      "Represents the provisioned throughput settings for the specified global secondary index.\n\n For current minimum and maximum provisioned throughput values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html}Service, Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.\n "];
  projection: projection
    [@ocaml.doc
      "Represents attributes that are copied (projected) from the table into an index. These are in addition to the primary key attributes and index key attributes, which are automatically projected.\n"];
  key_schema: key_schema_element list
    [@ocaml.doc "The key schema for the global secondary index.\n"];
  index_name: string
    [@ocaml.doc "The name of the global secondary index to be created.\n"]}
[@@ocaml.doc
  "Represents a new global secondary index to be added to an existing table.\n"]
type nonrec delete_global_secondary_index_action =
  {
  index_name: string
    [@ocaml.doc "The name of the global secondary index to be deleted.\n"]}
[@@ocaml.doc
  "Represents a global secondary index to be deleted from an existing table.\n"]
type nonrec global_secondary_index_update =
  {
  delete: delete_global_secondary_index_action option
    [@ocaml.doc
      "The name of an existing global secondary index to be removed.\n"];
  create: create_global_secondary_index_action option
    [@ocaml.doc
      "The parameters required for creating a global secondary index on an existing table:\n\n {ul\n       {-   [IndexName ] \n           \n            }\n       {-   [KeySchema ] \n           \n            }\n       {-   [AttributeDefinitions ] \n           \n            }\n       {-   [Projection ] \n           \n            }\n       {-   [ProvisionedThroughput ] \n           \n            }\n       }\n  "];
  update: update_global_secondary_index_action option
    [@ocaml.doc
      "The name of an existing global secondary index, along with new provisioned throughput settings to be applied to that index.\n"]}
[@@ocaml.doc
  "Represents one of the following:\n\n {ul\n       {-  A new global secondary index to be added to an existing table.\n           \n            }\n       {-  New provisioned throughput parameters for an existing global secondary index.\n           \n            }\n       {-  An existing global secondary index to be removed from an existing table.\n           \n            }\n       }\n  "]
type nonrec sse_specification =
  {
  kms_master_key_id: string option
    [@ocaml.doc
      "The KMS key that should be used for the KMS encryption. To specify a key, use its key ID, Amazon Resource Name (ARN), alias name, or alias ARN. Note that you should only provide this parameter if the key is different from the default DynamoDB key [alias/aws/dynamodb].\n"];
  sse_type: sse_type option
    [@ocaml.doc
      "Server-side encryption type. The only supported value is:\n\n {ul\n       {-   [KMS] - Server-side encryption that uses Key Management Service. The key is stored in your account and is managed by KMS (KMS charges apply).\n           \n            }\n       }\n  "];
  enabled: bool option
    [@ocaml.doc
      "Indicates whether server-side encryption is done using an Amazon Web Services managed key or an Amazon Web Services owned key. If enabled (true), server-side encryption type is set to [KMS] and an Amazon Web Services managed key is used (KMS charges apply). If disabled (false) or not specified, server-side encryption is set to Amazon Web Services owned key.\n"]}
[@@ocaml.doc
  "Represents the settings used to enable server-side encryption.\n"]
type nonrec replica_global_secondary_index =
  {
  on_demand_throughput_override: on_demand_throughput_override option
    [@ocaml.doc
      "Overrides the maximum on-demand throughput settings for the specified global secondary index in the specified replica table.\n"];
  provisioned_throughput_override: provisioned_throughput_override option
    [@ocaml.doc
      "Replica table GSI-specific provisioned throughput. If not specified, uses the source table GSI's read capacity settings.\n"];
  index_name: string [@ocaml.doc "The name of the global secondary index.\n"]}
[@@ocaml.doc
  "Represents the properties of a replica global secondary index.\n"]
type nonrec create_replication_group_member_action =
  {
  table_class_override: table_class option
    [@ocaml.doc
      "Replica-specific table class. If not specified, uses the source table's table class.\n"];
  global_secondary_indexes: replica_global_secondary_index list option
    [@ocaml.doc "Replica-specific global secondary index settings.\n"];
  on_demand_throughput_override: on_demand_throughput_override option
    [@ocaml.doc
      "The maximum on-demand throughput settings for the specified replica table being created. You can only modify [MaxReadRequestUnits], because you can't modify [MaxWriteRequestUnits] for individual replica tables. \n"];
  provisioned_throughput_override: provisioned_throughput_override option
    [@ocaml.doc
      "Replica-specific provisioned throughput. If not specified, uses the source table's provisioned throughput settings.\n"];
  kms_master_key_id: string option
    [@ocaml.doc
      "The KMS key that should be used for KMS encryption in the new replica. To specify a key, use its key ID, Amazon Resource Name (ARN), alias name, or alias ARN. Note that you should only provide this parameter if the key is different from the default DynamoDB KMS key [alias/aws/dynamodb].\n"];
  region_name: string
    [@ocaml.doc "The Region where the new replica will be created.\n"]}
[@@ocaml.doc "Represents a replica to be created.\n"]
type nonrec update_replication_group_member_action =
  {
  table_class_override: table_class option
    [@ocaml.doc
      "Replica-specific table class. If not specified, uses the source table's table class.\n"];
  global_secondary_indexes: replica_global_secondary_index list option
    [@ocaml.doc "Replica-specific global secondary index settings.\n"];
  on_demand_throughput_override: on_demand_throughput_override option
    [@ocaml.doc
      "Overrides the maximum on-demand throughput for the replica table.\n"];
  provisioned_throughput_override: provisioned_throughput_override option
    [@ocaml.doc
      "Replica-specific provisioned throughput. If not specified, uses the source table's provisioned throughput settings.\n"];
  kms_master_key_id: string option
    [@ocaml.doc
      "The KMS key of the replica that should be used for KMS encryption. To specify a key, use its key ID, Amazon Resource Name (ARN), alias name, or alias ARN. Note that you should only provide this parameter if the key is different from the default DynamoDB KMS key [alias/aws/dynamodb].\n"];
  region_name: string [@ocaml.doc "The Region where the replica exists.\n"]}
[@@ocaml.doc "Represents a replica to be modified.\n"]
type nonrec delete_replication_group_member_action =
  {
  region_name: string [@ocaml.doc "The Region where the replica exists.\n"]}
[@@ocaml.doc "Represents a replica to be deleted.\n"]
type nonrec replication_group_update =
  {
  delete: delete_replication_group_member_action option
    [@ocaml.doc
      "The parameters required for deleting a replica for the table.\n"];
  update: update_replication_group_member_action option
    [@ocaml.doc
      "The parameters required for updating a replica for the table.\n"];
  create: create_replication_group_member_action option
    [@ocaml.doc
      "The parameters required for creating a replica for the table.\n"]}
[@@ocaml.doc
  "Represents one of the following:\n\n {ul\n       {-  A new replica to be added to an existing regional table or global table. This request invokes the [CreateTableReplica] action in the destination Region.\n           \n            }\n       {-  New parameters for an existing replica. This request invokes the [UpdateTable] action in the destination Region.\n           \n            }\n       {-  An existing replica to be deleted. The request invokes the [DeleteTableReplica] action in the destination Region, deleting the replica and all if its items in the destination Region.\n           \n            }\n       }\n    When you manually remove a table or global table replica, you do not automatically remove any associated scalable targets, scaling policies, or CloudWatch alarms.\n    \n     "]
type nonrec update_table_input =
  {
  on_demand_throughput: on_demand_throughput option
    [@ocaml.doc
      "Updates the maximum number of read and write units for the specified table in on-demand capacity mode. If you use this parameter, you must specify [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.\n"];
  deletion_protection_enabled: bool option
    [@ocaml.doc
      "Indicates whether deletion protection is to be enabled (true) or disabled (false) on the table.\n"];
  table_class: table_class option
    [@ocaml.doc
      "The table class of the table to be updated. Valid values are [STANDARD] and [STANDARD_INFREQUENT_ACCESS].\n"];
  replica_updates: replication_group_update list option
    [@ocaml.doc
      "A list of replica update actions (create, delete, or update) for the table.\n\n  For global tables, this property only applies to global tables using Version 2019.11.21 (Current version). \n  \n   "];
  sse_specification: sse_specification option
    [@ocaml.doc
      "The new server-side encryption settings for the specified table.\n"];
  stream_specification: stream_specification option
    [@ocaml.doc
      "Represents the DynamoDB Streams configuration for the table.\n\n  You receive a [ValidationException] if you try to enable a stream on a table that already has a stream, or if you try to disable a stream on a table that doesn't have a stream.\n  \n   "];
  global_secondary_index_updates: global_secondary_index_update list option
    [@ocaml.doc
      "An array of one or more global secondary indexes for the table. For each index in the array, you can request one action:\n\n {ul\n       {-   [Create] - add a new global secondary index to the table.\n           \n            }\n       {-   [Update] - modify the provisioned throughput settings of an existing global secondary index.\n           \n            }\n       {-   [Delete] - remove a global secondary index from the table.\n           \n            }\n       }\n   You can create or delete only one global secondary index per [UpdateTable] operation.\n   \n    For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.OnlineOps.html}Managing Global Secondary Indexes} in the {i Amazon DynamoDB Developer Guide}. \n    "];
  provisioned_throughput: provisioned_throughput option
    [@ocaml.doc
      "The new provisioned throughput settings for the specified table or index.\n"];
  billing_mode: billing_mode option
    [@ocaml.doc
      "Controls how you are charged for read and write throughput and how you manage capacity. When switching from pay-per-request to provisioned capacity, initial provisioned capacity values must be set. The initial provisioned capacity values are estimated based on the consumed read and write capacity of your table and global secondary indexes over the past 30 minutes.\n\n {ul\n       {-   [PROVISIONED] - We recommend using [PROVISIONED] for predictable workloads. [PROVISIONED] sets the billing mode to {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html}Provisioned capacity mode}.\n           \n            }\n       {-   [PAY_PER_REQUEST] - We recommend using [PAY_PER_REQUEST] for unpredictable workloads. [PAY_PER_REQUEST] sets the billing mode to {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html}On-demand capacity mode}. \n           \n            }\n       }\n  "];
  table_name: string
    [@ocaml.doc
      "The name of the table to be updated. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"];
  attribute_definitions: attribute_definition list option
    [@ocaml.doc
      "An array of attributes that describe the key schema for the table and indexes. If you are adding a new global secondary index to the table, [AttributeDefinitions] must include the key element(s) of the new index.\n"]}
[@@ocaml.doc "Represents the input of an [UpdateTable] operation.\n"]
type nonrec destination_status =
  | UPDATING [@ocaml.doc ""]
  | ENABLE_FAILED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec approximate_creation_date_time_precision =
  | MICROSECOND [@ocaml.doc ""]
  | MILLISECOND [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_kinesis_streaming_configuration =
  {
  approximate_creation_date_time_precision:
    approximate_creation_date_time_precision option
    [@ocaml.doc
      "Enables updating the precision of Kinesis data stream timestamp. \n"]}
[@@ocaml.doc "Enables updating the configuration for Kinesis Streaming.\n"]
type nonrec update_kinesis_streaming_destination_output =
  {
  update_kinesis_streaming_configuration:
    update_kinesis_streaming_configuration option
    [@ocaml.doc
      "The command to update the Kinesis streaming destination configuration.\n"];
  destination_status: destination_status option
    [@ocaml.doc
      "The status of the attempt to update the Kinesis streaming destination output.\n"];
  stream_arn: string option
    [@ocaml.doc "The ARN for the Kinesis stream input.\n"];
  table_name: string option
    [@ocaml.doc
      "The table name for the Kinesis streaming destination output.\n"]}
[@@ocaml.doc ""]
type nonrec update_kinesis_streaming_destination_input =
  {
  update_kinesis_streaming_configuration:
    update_kinesis_streaming_configuration option
    [@ocaml.doc "The command to update the Kinesis stream configuration.\n"];
  stream_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the Kinesis stream input.\n"];
  table_name: string
    [@ocaml.doc
      "The table name for the Kinesis streaming destination input. You can also provide the ARN of the table in this parameter.\n"]}
[@@ocaml.doc ""]
type nonrec attribute_map = (string * attribute_value) list[@@ocaml.doc ""]
type nonrec capacity =
  {
  capacity_units: float option
    [@ocaml.doc
      "The total number of capacity units consumed on a table or an index.\n"];
  write_capacity_units: float option
    [@ocaml.doc
      "The total number of write capacity units consumed on a table or an index.\n"];
  read_capacity_units: float option
    [@ocaml.doc
      "The total number of read capacity units consumed on a table or an index.\n"]}
[@@ocaml.doc
  "Represents the amount of provisioned throughput capacity consumed on a table or an index.\n"]
type nonrec secondary_indexes_capacity_map = (string * capacity) list
[@@ocaml.doc ""]
type nonrec consumed_capacity =
  {
  global_secondary_indexes: secondary_indexes_capacity_map option
    [@ocaml.doc
      "The amount of throughput consumed on each global index affected by the operation.\n"];
  local_secondary_indexes: secondary_indexes_capacity_map option
    [@ocaml.doc
      "The amount of throughput consumed on each local index affected by the operation.\n"];
  table: capacity option
    [@ocaml.doc
      "The amount of throughput consumed on the table affected by the operation.\n"];
  write_capacity_units: float option
    [@ocaml.doc
      "The total number of write capacity units consumed by the operation.\n"];
  read_capacity_units: float option
    [@ocaml.doc
      "The total number of read capacity units consumed by the operation.\n"];
  capacity_units: float option
    [@ocaml.doc
      "The total number of capacity units consumed by the operation.\n"];
  table_name: string option
    [@ocaml.doc
      "The name of the table that was affected by the operation. If you had specified the Amazon Resource Name (ARN) of a table in the input, you'll see the table ARN in the response.\n"]}
[@@ocaml.doc
  "The capacity units consumed by an operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. [ConsumedCapacity] is only returned if the request asked for it. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html}Provisioned capacity mode} in the {i Amazon DynamoDB Developer Guide}.\n"]
type nonrec item_collection_key_attribute_map =
  (string * attribute_value) list[@@ocaml.doc ""]
type nonrec item_collection_metrics =
  {
  size_estimate_range_g_b: float list option
    [@ocaml.doc
      "An estimate of item collection size, in gigabytes. This value is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on that table. Use this estimate to measure whether a local secondary index is approaching its size limit.\n\n The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.\n "];
  item_collection_key: item_collection_key_attribute_map option
    [@ocaml.doc
      "The partition key value of the item collection. This value is the same as the partition key value of the item.\n"]}
[@@ocaml.doc
  "Information about item collections, if any, that were affected by the operation. [ItemCollectionMetrics] is only returned if the request asked for it. If the table does not have any local secondary indexes, this information is not returned in the response.\n"]
type nonrec update_item_output =
  {
  item_collection_metrics: item_collection_metrics option
    [@ocaml.doc
      "Information about item collections, if any, that were affected by the [UpdateItem] operation. [ItemCollectionMetrics] is only returned if the [ReturnItemCollectionMetrics] parameter was specified. If the table does not have any local secondary indexes, this information is not returned in the response.\n\n Each [ItemCollectionMetrics] element consists of:\n \n  {ul\n        {-   [ItemCollectionKey] - The partition key value of the item collection. This is the same as the partition key value of the item itself.\n            \n             }\n        {-   [SizeEstimateRangeGB] - An estimate of item collection size, in gigabytes. This value is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on that table. Use this estimate to measure whether a local secondary index is approaching its size limit.\n            \n             The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.\n             \n              }\n        }\n  "];
  consumed_capacity: consumed_capacity option
    [@ocaml.doc
      "The capacity units consumed by the [UpdateItem] operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity] parameter was specified. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#write-operation-consumption}Capacity unity consumption for write operations} in the {i Amazon DynamoDB Developer Guide}.\n"];
  attributes: attribute_map option
    [@ocaml.doc
      "A map of attribute values as they appear before or after the [UpdateItem] operation, as determined by the [ReturnValues] parameter.\n\n The [Attributes] map is only present if the update was successful and [ReturnValues] was specified as something other than [NONE] in the request. Each element represents one attribute.\n "]}
[@@ocaml.doc "Represents the output of an [UpdateItem] operation.\n"]
type nonrec attribute_action =
  | DELETE [@ocaml.doc ""]
  | PUT [@ocaml.doc ""]
  | ADD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec attribute_value_update =
  {
  action: attribute_action option
    [@ocaml.doc
      "Specifies how to perform the update. Valid values are [PUT] (default), [DELETE], and [ADD]. The behavior depends on whether the specified primary key already exists in the table.\n\n  {b If an item with the specified {i Key} is found in the table:} \n \n  {ul\n        {-   [PUT] - Adds the specified attribute to the item. If the attribute already exists, it is replaced by the new value. \n            \n             }\n        {-   [DELETE] - If no value is specified, the attribute and its value are removed from the item. The data type of the specified value must match the existing value's data type.\n            \n             If a {i set} of values is specified, then those values are subtracted from the old set. For example, if the attribute value was the set [\\[a,b,c\\]] and the [DELETE] action specified [\\[a,c\\]], then the final attribute value would be [\\[b\\]]. Specifying an empty set is an error.\n             \n              }\n        {-   [ADD] - If the attribute does not already exist, then the attribute and its values are added to the item. If the attribute does exist, then the behavior of [ADD] depends on the data type of the attribute:\n            \n             {ul\n                   {-  If the existing attribute is a number, and if [Value] is also a number, then the [Value] is mathematically added to the existing attribute. If [Value] is a negative number, then it is subtracted from the existing attribute.\n                       \n                          If you use [ADD] to increment or decrement a number value for an item that doesn't exist before the update, DynamoDB uses 0 as the initial value.\n                         \n                          In addition, if you use [ADD] to update an existing item, and intend to increment or decrement an attribute value which does not yet exist, DynamoDB uses [0] as the initial value. For example, suppose that the item you want to update does not yet have an attribute named {i itemcount}, but you decide to [ADD] the number [3] to this attribute anyway, even though it currently does not exist. DynamoDB will create the {i itemcount} attribute, set its initial value to [0], and finally add [3] to it. The result will be a new {i itemcount} attribute in the item, with a value of [3].\n                          \n                            }\n                   {-  If the existing data type is a set, and if the [Value] is also a set, then the [Value] is added to the existing set. (This is a {i set} operation, not mathematical addition.) For example, if the attribute value was the set [\\[1,2\\]], and the [ADD] action specified [\\[3\\]], then the final attribute value would be [\\[1,2,3\\]]. An error occurs if an Add action is specified for a set attribute and the attribute type specified does not match the existing set type. \n                       \n                        Both sets must have the same primitive data type. For example, if the existing data type is a set of strings, the [Value] must also be a set of strings. The same holds true for number sets and binary sets.\n                        \n                         }\n                   \n         }\n          This action is only valid for an existing attribute whose data type is number or is a set. Do not use [ADD] for any other data types.\n          \n           }\n        }\n    {b If no item with the specified {i Key} is found:} \n   \n    {ul\n          {-   [PUT] - DynamoDB creates a new item with the specified primary key, and then adds the attribute. \n              \n               }\n          {-   [DELETE] - Nothing happens; there is no attribute to delete.\n              \n               }\n          {-   [ADD] - DynamoDB creates a new item with the supplied primary key and number (or set) for the attribute value. The only data types allowed are number, number set, string set or binary set.\n              \n               }\n          }\n  "];
  value: attribute_value option
    [@ocaml.doc
      "Represents the data for an attribute.\n\n Each attribute value is described as a name-value pair. The name is the data type, and the value is the data itself.\n \n  For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes}Data Types} in the {i Amazon DynamoDB Developer Guide}. \n  "]}
[@@ocaml.doc
  "For the [UpdateItem] operation, represents the attributes to be modified, the action to perform on each, and the new value for each.\n\n  You cannot use [UpdateItem] to update any primary key attributes. Instead, you will need to delete the item, and then use [PutItem] to create a new item with new attributes.\n  \n    Attribute values cannot be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests with empty values will be rejected with a [ValidationException] exception.\n    "]
type nonrec attribute_updates = (string * attribute_value_update) list
[@@ocaml.doc ""]
type nonrec comparison_operator =
  | BEGINS_WITH [@ocaml.doc ""]
  | NOT_CONTAINS [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | NULL [@ocaml.doc ""]
  | NOT_NULL [@ocaml.doc ""]
  | BETWEEN [@ocaml.doc ""]
  | GT [@ocaml.doc ""]
  | GE [@ocaml.doc ""]
  | LT [@ocaml.doc ""]
  | LE [@ocaml.doc ""]
  | IN [@ocaml.doc ""]
  | NE [@ocaml.doc ""]
  | EQ [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec expected_attribute_value =
  {
  attribute_value_list: attribute_value list option
    [@ocaml.doc
      "One or more values to evaluate against the supplied attribute. The number of values in the list depends on the [ComparisonOperator] being used.\n\n For type Number, value comparisons are numeric.\n \n  String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, [a] is greater than [A], and [a] is greater than [B]. For a list of code values, see {{:http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}.\n  \n   For Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.\n   \n    For information on specifying data types in JSON, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataFormat.html}JSON Data Format} in the {i Amazon DynamoDB Developer Guide}.\n    "];
  comparison_operator: comparison_operator option
    [@ocaml.doc
      "A comparator for evaluating attributes in the [AttributeValueList]. For example, equals, greater than, less than, etc.\n\n The following comparison operators are available:\n \n   [EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS |\n                BEGINS_WITH | IN | BETWEEN] \n  \n   The following are descriptions of each comparison operator.\n   \n    {ul\n          {-   [EQ] : Equal. [EQ] is supported for all data types, including lists and maps.\n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not equal [{\"NS\":\\[\"6\", \"2\",\n                    \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [NE] : Not equal. [NE] is supported for all data types, including lists and maps.\n              \n                [AttributeValueList] can contain only one [AttributeValue] of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an [AttributeValue] of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not equal [{\"NS\":\\[\"6\", \"2\",\n                    \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [LE] : Less than or equal. \n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, or Binary (not a set type). If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not compare to [{\"NS\":\\[\"6\", \"2\", \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [LT] : Less than. \n              \n                [AttributeValueList] can contain only one [AttributeValue] of type String, Number, or Binary (not a set type). If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not compare to [{\"NS\":\\[\"6\", \"2\",\n                        \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [GE] : Greater than or equal. \n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, or Binary (not a set type). If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not compare to [{\"NS\":\\[\"6\", \"2\", \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [GT] : Greater than. \n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, or Binary (not a set type). If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not compare to [{\"NS\":\\[\"6\", \"2\", \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [NOT_NULL] : The attribute exists. [NOT_NULL] is supported for all data types, including lists and maps.\n              \n                This operator tests for the existence of an attribute, not its data type. If the data type of attribute \"[a]\" is null, and you evaluate it using [NOT_NULL], the result is a Boolean [true]. This result is because the attribute \"[a]\" exists; its data type is not relevant to the [NOT_NULL] comparison operator.\n                \n                  }\n          {-   [NULL] : The attribute does not exist. [NULL] is supported for all data types, including lists and maps.\n              \n                This operator tests for the nonexistence of an attribute, not its data type. If the data type of attribute \"[a]\" is null, and you evaluate it using [NULL], the result is a Boolean [false]. This is because the attribute \"[a]\" exists; its data type is not relevant to the [NULL] comparison operator.\n                \n                  }\n          {-   [CONTAINS] : Checks for a subsequence, or value in a set.\n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is of type String, then the operator checks for a substring match. If the target attribute of the comparison is of type Binary, then the operator looks for a subsequence of the target that matches the input. If the target attribute of the comparison is a set (\"[SS]\", \"[NS]\", or \"[BS]\"), then the operator evaluates to true if it finds an exact match with any member of the set.\n               \n                CONTAINS is supported for lists: When evaluating \"[a CONTAINS b]\", \"[a]\" can be a list; however, \"[b]\" cannot be a set, a map, or a list.\n                \n                 }\n          {-   [NOT_CONTAINS] : Checks for absence of a subsequence, or absence of a value in a set.\n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is a String, then the operator checks for the absence of a substring match. If the target attribute of the comparison is Binary, then the operator checks for the absence of a subsequence of the target that matches the input. If the target attribute of the comparison is a set (\"[SS]\", \"[NS]\", or \"[BS]\"), then the operator evaluates to true if it {i does not} find an exact match with any member of the set.\n               \n                NOT_CONTAINS is supported for lists: When evaluating \"[a NOT CONTAINS\n                        b]\", \"[a]\" can be a list; however, \"[b]\" cannot be a set, a map, or a list.\n                \n                 }\n          {-   [BEGINS_WITH] : Checks for a prefix. \n              \n                [AttributeValueList] can contain only one [AttributeValue] of type String or Binary (not a Number or a set type). The target attribute of the comparison must be of type String or Binary (not a Number or a set type).\n               \n                \n                \n                 }\n          {-   [IN] : Checks for matching elements in a list.\n              \n                [AttributeValueList] can contain one or more [AttributeValue] elements of type String, Number, or Binary. These attributes are compared against an existing attribute of an item. If any elements of the input are equal to the item attribute, the expression evaluates to true.\n               \n                }\n          {-   [BETWEEN] : Greater than or equal to the first value, and less than or equal to the second value. \n              \n                [AttributeValueList] must contain two [AttributeValue] elements of the same type, either String, Number, or Binary (not a set type). A target attribute matches if the target value is greater than, or equal to, the first element and less than, or equal to, the second element. If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not compare to [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not compare to [{\"NS\":\\[\"6\", \"2\",\n                        \"1\"\\]}] \n               \n                }\n          }\n  "];
  exists: bool option
    [@ocaml.doc
      "Causes DynamoDB to evaluate the value before attempting a conditional operation:\n\n {ul\n       {-  If [Exists] is [true], DynamoDB will check to see if that attribute value already exists in the table. If it is found, then the operation succeeds. If it is not found, the operation fails with a [ConditionCheckFailedException].\n           \n            }\n       {-  If [Exists] is [false], DynamoDB assumes that the attribute value does not exist in the table. If in fact the value does not exist, then the assumption is valid and the operation succeeds. If the value is found, despite the assumption that it does not exist, the operation fails with a [ConditionCheckFailedException].\n           \n            }\n       }\n   The default setting for [Exists] is [true]. If you supply a [Value] all by itself, DynamoDB assumes the attribute exists: You don't have to set [Exists] to [true], because it is implied.\n   \n    DynamoDB returns a [ValidationException] if:\n    \n     {ul\n           {-   [Exists] is [true] but there is no [Value] to check. (You expect a value to exist, but don't specify what that value is.)\n               \n                }\n           {-   [Exists] is [false] but you also provide a [Value]. (You cannot expect an attribute to have a value, while also expecting it not to exist.)\n               \n                }\n           }\n  "];
  value: attribute_value option
    [@ocaml.doc
      "Represents the data for the expected attribute.\n\n Each attribute value is described as a name-value pair. The name is the data type, and the value is the data itself.\n \n  For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes}Data Types} in the {i Amazon DynamoDB Developer Guide}.\n  "]}
[@@ocaml.doc
  "Represents a condition to be compared with an attribute value. This condition can be used with [DeleteItem], [PutItem], or [UpdateItem] operations; if the comparison evaluates to true, the operation succeeds; if not, the operation fails. You can use [ExpectedAttributeValue] in one of two different ways:\n\n {ul\n       {-  Use [AttributeValueList] to specify one or more values to compare against an attribute. Use [ComparisonOperator] to specify how you want to perform the comparison. If the comparison evaluates to true, then the conditional operation succeeds.\n           \n            }\n       {-  Use [Value] to specify a value that DynamoDB will compare against an attribute. If the values match, then [ExpectedAttributeValue] evaluates to true and the conditional operation succeeds. Optionally, you can also set [Exists] to false, indicating that you {i do not} expect to find the attribute value in the table. In this case, the conditional operation succeeds only if the comparison evaluates to false.\n           \n            }\n       }\n    [Value] and [Exists] are incompatible with [AttributeValueList] and [ComparisonOperator]. Note that if you use both sets of parameters at once, DynamoDB will return a [ValidationException] exception.\n   "]
type nonrec expected_attribute_map = (string * expected_attribute_value) list
[@@ocaml.doc ""]
type nonrec conditional_operator =
  | OR [@ocaml.doc ""]
  | AND [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec return_value =
  | UPDATED_NEW [@ocaml.doc ""]
  | ALL_NEW [@ocaml.doc ""]
  | UPDATED_OLD [@ocaml.doc ""]
  | ALL_OLD [@ocaml.doc ""]
  | NONE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec return_consumed_capacity =
  | NONE [@ocaml.doc ""]
  | TOTAL [@ocaml.doc ""]
  | INDEXES [@ocaml.doc ""][@@ocaml.doc
                             "Determines the level of detail about either provisioned or on-demand throughput consumption that is returned in the response:\n\n {ul\n       {-   [INDEXES] - The response includes the aggregate [ConsumedCapacity] for the operation, together with [ConsumedCapacity] for each table and secondary index that was accessed.\n           \n            Note that some operations, such as [GetItem] and [BatchGetItem], do not access any indexes at all. In these cases, specifying [INDEXES] will only return [ConsumedCapacity] information for table(s).\n            \n             }\n       {-   [TOTAL] - The response includes only the aggregate [ConsumedCapacity] for the operation.\n           \n            }\n       {-   [NONE] - No [ConsumedCapacity] details are included in the response.\n           \n            }\n       }\n  "]
type nonrec return_item_collection_metrics =
  | NONE [@ocaml.doc ""]
  | SIZE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec expression_attribute_name_map = (string * string) list[@@ocaml.doc
                                                                    ""]
type nonrec expression_attribute_value_map = (string * attribute_value) list
[@@ocaml.doc ""]
type nonrec return_values_on_condition_check_failure =
  | NONE [@ocaml.doc ""]
  | ALL_OLD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_item_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option
    [@ocaml.doc
      "An optional parameter that returns the item attributes for an [UpdateItem] operation that failed a condition check.\n\n There is no additional cost associated with requesting a return value aside from the small network and processing overhead of receiving a larger response. No read capacity units are consumed.\n "];
  expression_attribute_values: expression_attribute_value_map option
    [@ocaml.doc
      "One or more values that can be substituted in an expression.\n\n Use the {b :} (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the [ProductStatus] attribute was one of the following: \n \n   [Available | Backordered | Discontinued] \n  \n   You would first need to specify [ExpressionAttributeValues] as follows:\n   \n     [{ \":avail\":{\"S\":\"Available\"}, \":back\":{\"S\":\"Backordered\"},\n                \":disc\":{\"S\":\"Discontinued\"} }] \n    \n     You could then use these values in an expression, such as this:\n     \n       [ProductStatus IN (:avail, :back, :disc)] \n      \n       For more information on expression attribute values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html}Condition Expressions} in the {i Amazon DynamoDB Developer Guide}.\n       "];
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in an expression. The following are some use cases for using [ExpressionAttributeNames]:\n\n {ul\n       {-  To access an attribute whose name conflicts with a DynamoDB reserved word.\n           \n            }\n       {-  To create a placeholder for repeating occurrences of an attribute name in an expression.\n           \n            }\n       {-  To prevent special characters in an attribute name from being misinterpreted in an expression.\n           \n            }\n       }\n   Use the {b #} character in an expression to dereference an attribute name. For example, consider the following attribute name:\n   \n    {ul\n          {-   [Percentile] \n              \n               }\n          }\n   The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html}Reserved Words} in the {i Amazon DynamoDB Developer Guide}.) To work around this, you could specify the following for [ExpressionAttributeNames]:\n   \n    {ul\n          {-   [{\"#P\":\"Percentile\"}] \n              \n               }\n          }\n   You could then use this substitution in an expression, as in this example:\n   \n    {ul\n          {-   [#P = :val] \n              \n               }\n          }\n    Tokens that begin with the {b :} character are {i expression attribute values}, which are placeholders for the actual value at runtime.\n    \n      For more information about expression attribute names, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Specifying Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n      "];
  condition_expression: string option
    [@ocaml.doc
      "A condition that must be satisfied in order for a conditional update to succeed.\n\n An expression can contain any of the following:\n \n  {ul\n        {-  Functions: [attribute_exists | attribute_not_exists | attribute_type |\n                        contains | begins_with | size] \n            \n             These function names are case-sensitive.\n             \n              }\n        {-  Comparison operators: [= | <> |\n            < | > | <= | >= |\n            BETWEEN | IN ] \n            \n             }\n        {-   Logical operators: [AND | OR | NOT] \n            \n             }\n        }\n   For more information about condition expressions, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html}Specifying Conditions} in the {i Amazon DynamoDB Developer Guide}.\n   "];
  update_expression: string option
    [@ocaml.doc
      "An expression that defines one or more attributes to be updated, the action to be performed on them, and new values for them.\n\n The following action values are available for [UpdateExpression].\n \n  {ul\n        {-   [SET] - Adds one or more attributes and values to an item. If any of these attributes already exist, they are replaced by the new values. You can also use [SET] to add or subtract from an attribute that is of type Number. For example: [SET myNum = myNum + :val] \n            \n              [SET] supports the following functions:\n             \n              {ul\n                    {-   [if_not_exists (path, operand)] - if the item does not contain an attribute at the specified path, then [if_not_exists] evaluates to operand; otherwise, it evaluates to path. You can use this function to avoid overwriting an attribute that may already be present in the item.\n                        \n                         }\n                    {-   [list_append (operand, operand)] - evaluates to a list with a new element added to it. You can append the new element to the start or the end of the list by reversing the order of the operands.\n                        \n                         }\n                    \n         }\n          These function names are case-sensitive.\n          \n           }\n        {-   [REMOVE] - Removes one or more attributes from an item.\n            \n             }\n        {-   [ADD] - Adds the specified value to the item, if the attribute does not already exist. If the attribute does exist, then the behavior of [ADD] depends on the data type of the attribute:\n            \n             {ul\n                   {-  If the existing attribute is a number, and if [Value] is also a number, then [Value] is mathematically added to the existing attribute. If [Value] is a negative number, then it is subtracted from the existing attribute.\n                       \n                         If you use [ADD] to increment or decrement a number value for an item that doesn't exist before the update, DynamoDB uses [0] as the initial value.\n                         \n                          Similarly, if you use [ADD] for an existing item to increment or decrement an attribute value that doesn't exist before the update, DynamoDB uses [0] as the initial value. For example, suppose that the item you want to update doesn't have an attribute named [itemcount], but you decide to [ADD] the number [3] to this attribute anyway. DynamoDB will create the [itemcount] attribute, set its initial value to [0], and finally add [3] to it. The result will be a new [itemcount] attribute in the item, with a value of [3].\n                          \n                            }\n                   {-  If the existing data type is a set and if [Value] is also a set, then [Value] is added to the existing set. For example, if the attribute value is the set [\\[1,2\\]], and the [ADD] action specified [\\[3\\]], then the final attribute value is [\\[1,2,3\\]]. An error occurs if an [ADD] action is specified for a set attribute and the attribute type specified does not match the existing set type. \n                       \n                        Both sets must have the same primitive data type. For example, if the existing data type is a set of strings, the [Value] must also be a set of strings.\n                        \n                         }\n                   \n         }\n           The [ADD] action only supports Number and set data types. In addition, [ADD] can only be used on top-level attributes, not nested attributes.\n           \n             }\n        {-   [DELETE] - Deletes an element from a set.\n            \n             If a set of values is specified, then those values are subtracted from the old set. For example, if the attribute value was the set [\\[a,b,c\\]] and the [DELETE] action specifies [\\[a,c\\]], then the final attribute value is [\\[b\\]]. Specifying an empty set is an error.\n             \n               The [DELETE] action only supports set data types. In addition, [DELETE] can only be used on top-level attributes, not nested attributes.\n               \n                 }\n        }\n   You can have many actions in a single expression, such as the following: [SET\n                a=:value1, b=:value2 DELETE :value3, :value4, :value5] \n   \n    For more information on update expressions, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.Modifying.html}Modifying Items and Attributes} in the {i Amazon DynamoDB Developer Guide}.\n    "];
  return_item_collection_metrics: return_item_collection_metrics option
    [@ocaml.doc
      "Determines whether item collection metrics are returned. If set to [SIZE], the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to [NONE] (the default), no statistics are returned.\n"];
  return_consumed_capacity: return_consumed_capacity option [@ocaml.doc ""];
  return_values: return_value option
    [@ocaml.doc
      "Use [ReturnValues] if you want to get the item attributes as they appear before or after they are successfully updated. For [UpdateItem], the valid values are:\n\n {ul\n       {-   [NONE] - If [ReturnValues] is not specified, or if its value is [NONE], then nothing is returned. (This setting is the default for [ReturnValues].)\n           \n            }\n       {-   [ALL_OLD] - Returns all of the attributes of the item, as they appeared before the UpdateItem operation.\n           \n            }\n       {-   [UPDATED_OLD] - Returns only the updated attributes, as they appeared before the UpdateItem operation.\n           \n            }\n       {-   [ALL_NEW] - Returns all of the attributes of the item, as they appear after the UpdateItem operation.\n           \n            }\n       {-   [UPDATED_NEW] - Returns only the updated attributes, as they appear after the UpdateItem operation.\n           \n            }\n       }\n   There is no additional cost associated with requesting a return value aside from the small network and processing overhead of receiving a larger response. No read capacity units are consumed.\n   \n    The values returned are strongly consistent.\n    "];
  conditional_operator: conditional_operator option
    [@ocaml.doc
      "This is a legacy parameter. Use [ConditionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html}ConditionalOperator} in the {i Amazon DynamoDB Developer Guide}.\n"];
  expected: expected_attribute_map option
    [@ocaml.doc
      "This is a legacy parameter. Use [ConditionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html}Expected} in the {i Amazon DynamoDB Developer Guide}.\n"];
  attribute_updates: attribute_updates option
    [@ocaml.doc
      "This is a legacy parameter. Use [UpdateExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributeUpdates.html}AttributeUpdates} in the {i Amazon DynamoDB Developer Guide}.\n"];
  key: key
    [@ocaml.doc
      "The primary key of the item to be updated. Each element consists of an attribute name and a value for that attribute.\n\n For the primary key, you must provide all of the attributes. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide values for both the partition key and the sort key.\n "];
  table_name: string
    [@ocaml.doc
      "The name of the table containing the item to update. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc "Represents the input of an [UpdateItem] operation.\n"]
type nonrec transaction_conflict_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Operation was rejected because there is an ongoing transaction for the item.\n"]
type nonrec request_limit_exceeded = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Throughput exceeds the current throughput quota for your account. Please contact {{:https://aws.amazon.com/support}Amazon Web Services Support} to request a quota increase.\n"]
type nonrec provisioned_throughput_exceeded_exception =
  {
  message: string option
    [@ocaml.doc
      "You exceeded your maximum allowed provisioned throughput.\n"]}
[@@ocaml.doc
  "Your request rate is too high. The Amazon Web Services SDKs for DynamoDB automatically retry requests that receive this exception. Your request is eventually successful, unless your retry queue is too large to finish. Reduce the frequency of requests and use exponential backoff. For more information, go to {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Programming.Errors.html#Programming.Errors.RetryAndBackoff}Error Retries and Exponential Backoff} in the {i Amazon DynamoDB Developer Guide}.\n"]
type nonrec item_collection_size_limit_exceeded_exception =
  {
  message: string option
    [@ocaml.doc
      "The total size of an item collection has exceeded the maximum limit of 10 gigabytes.\n"]}
[@@ocaml.doc
  "An item collection is too large. This exception is only returned for tables that have one or more local secondary indexes.\n"]
type nonrec conditional_check_failed_exception =
  {
  item: attribute_map option
    [@ocaml.doc "Item which caused the [ConditionalCheckFailedException].\n"];
  message: string option [@ocaml.doc "The conditional request failed.\n"]}
[@@ocaml.doc
  "A condition specified in the operation could not be evaluated.\n"]
type nonrec replica_global_secondary_index_settings_description =
  {
  provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option
    [@ocaml.doc
      "Auto scaling settings for a global secondary index replica's write capacity units.\n"];
  provisioned_write_capacity_units: int option
    [@ocaml.doc
      "The maximum number of writes consumed per second before DynamoDB returns a [ThrottlingException].\n"];
  provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option
    [@ocaml.doc
      "Auto scaling settings for a global secondary index replica's read capacity units.\n"];
  provisioned_read_capacity_units: int option
    [@ocaml.doc
      "The maximum number of strongly consistent reads consumed per second before DynamoDB returns a [ThrottlingException].\n"];
  index_status: index_status option
    [@ocaml.doc
      " The current status of the global secondary index:\n\n {ul\n       {-   [CREATING] - The global secondary index is being created.\n           \n            }\n       {-   [UPDATING] - The global secondary index is being updated.\n           \n            }\n       {-   [DELETING] - The global secondary index is being deleted.\n           \n            }\n       {-   [ACTIVE] - The global secondary index is ready for use.\n           \n            }\n       }\n  "];
  index_name: string
    [@ocaml.doc
      "The name of the global secondary index. The name must be unique among all other indexes on this table.\n"]}
[@@ocaml.doc "Represents the properties of a global secondary index.\n"]
type nonrec replica_settings_description =
  {
  replica_table_class_summary: table_class_summary option [@ocaml.doc ""];
  replica_global_secondary_index_settings:
    replica_global_secondary_index_settings_description list option
    [@ocaml.doc
      "Replica global secondary index settings for the global table.\n"];
  replica_provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option
    [@ocaml.doc
      "Auto scaling settings for a global table replica's write capacity units.\n"];
  replica_provisioned_write_capacity_units: int option
    [@ocaml.doc
      "The maximum number of writes consumed per second before DynamoDB returns a [ThrottlingException]. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput}Specifying Read and Write Requirements} in the {i Amazon DynamoDB Developer Guide}.\n"];
  replica_provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option
    [@ocaml.doc
      "Auto scaling settings for a global table replica's read capacity units.\n"];
  replica_provisioned_read_capacity_units: int option
    [@ocaml.doc
      "The maximum number of strongly consistent reads consumed per second before DynamoDB returns a [ThrottlingException]. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput}Specifying Read and Write Requirements} in the {i Amazon DynamoDB Developer Guide}. \n"];
  replica_billing_mode_summary: billing_mode_summary option
    [@ocaml.doc "The read/write capacity mode of the replica.\n"];
  replica_status: replica_status option
    [@ocaml.doc
      "The current state of the Region:\n\n {ul\n       {-   [CREATING] - The Region is being created.\n           \n            }\n       {-   [UPDATING] - The Region is being updated.\n           \n            }\n       {-   [DELETING] - The Region is being deleted.\n           \n            }\n       {-   [ACTIVE] - The Region is ready for use.\n           \n            }\n       }\n  "];
  region_name: string [@ocaml.doc "The Region name of the replica.\n"]}
[@@ocaml.doc "Represents the properties of a replica.\n"]
type nonrec update_global_table_settings_output =
  {
  replica_settings: replica_settings_description list option
    [@ocaml.doc "The Region-specific settings for the global table.\n"];
  global_table_name: string option
    [@ocaml.doc "The name of the global table.\n"]}[@@ocaml.doc ""]
type nonrec global_table_global_secondary_index_settings_update =
  {
  provisioned_write_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option
    [@ocaml.doc
      "Auto scaling settings for managing a global secondary index's write capacity units.\n"];
  provisioned_write_capacity_units: int option
    [@ocaml.doc
      "The maximum number of writes consumed per second before DynamoDB returns a [ThrottlingException.] \n"];
  index_name: string
    [@ocaml.doc
      "The name of the global secondary index. The name must be unique among all other indexes on this table.\n"]}
[@@ocaml.doc
  "Represents the settings of a global secondary index for a global table that will be modified.\n"]
type nonrec replica_global_secondary_index_settings_update =
  {
  provisioned_read_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option
    [@ocaml.doc
      "Auto scaling settings for managing a global secondary index replica's read capacity units.\n"];
  provisioned_read_capacity_units: int option
    [@ocaml.doc
      "The maximum number of strongly consistent reads consumed per second before DynamoDB returns a [ThrottlingException].\n"];
  index_name: string
    [@ocaml.doc
      "The name of the global secondary index. The name must be unique among all other indexes on this table.\n"]}
[@@ocaml.doc
  "Represents the settings of a global secondary index for a global table that will be modified.\n"]
type nonrec replica_settings_update =
  {
  replica_table_class: table_class option
    [@ocaml.doc
      "Replica-specific table class. If not specified, uses the source table's table class.\n"];
  replica_global_secondary_index_settings_update:
    replica_global_secondary_index_settings_update list option
    [@ocaml.doc
      "Represents the settings of a global secondary index for a global table that will be modified.\n"];
  replica_provisioned_read_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option
    [@ocaml.doc
      "Auto scaling settings for managing a global table replica's read capacity units.\n"];
  replica_provisioned_read_capacity_units: int option
    [@ocaml.doc
      "The maximum number of strongly consistent reads consumed per second before DynamoDB returns a [ThrottlingException]. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput}Specifying Read and Write Requirements} in the {i Amazon DynamoDB Developer Guide}. \n"];
  region_name: string [@ocaml.doc "The Region of the replica to be added.\n"]}
[@@ocaml.doc
  "Represents the settings for a global table in a Region that will be modified.\n"]
type nonrec update_global_table_settings_input =
  {
  replica_settings_update: replica_settings_update list option
    [@ocaml.doc
      "Represents the settings for a global table in a Region that will be modified.\n"];
  global_table_global_secondary_index_settings_update:
    global_table_global_secondary_index_settings_update list option
    [@ocaml.doc
      "Represents the settings of a global secondary index for a global table that will be modified.\n"];
  global_table_provisioned_write_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option
    [@ocaml.doc
      "Auto scaling settings for managing provisioned write capacity for the global table.\n"];
  global_table_provisioned_write_capacity_units: int option
    [@ocaml.doc
      "The maximum number of writes consumed per second before DynamoDB returns a [ThrottlingException.] \n"];
  global_table_billing_mode: billing_mode option
    [@ocaml.doc
      "The billing mode of the global table. If [GlobalTableBillingMode] is not specified, the global table defaults to [PROVISIONED] capacity billing mode.\n\n {ul\n       {-   [PROVISIONED] - We recommend using [PROVISIONED] for predictable workloads. [PROVISIONED] sets the billing mode to {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html}Provisioned capacity mode}.\n           \n            }\n       {-   [PAY_PER_REQUEST] - We recommend using [PAY_PER_REQUEST] for unpredictable workloads. [PAY_PER_REQUEST] sets the billing mode to {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html}On-demand capacity mode}. \n           \n            }\n       }\n  "];
  global_table_name: string [@ocaml.doc "The name of the global table\n"]}
[@@ocaml.doc ""]
type nonrec replica_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified replica is no longer part of the global table.\n"]
type nonrec index_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation tried to access a nonexistent index.\n"]
type nonrec global_table_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified global table does not exist.\n"]
type nonrec global_table_status =
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec global_table_description =
  {
  global_table_name: string option [@ocaml.doc "The global table name.\n"];
  global_table_status: global_table_status option
    [@ocaml.doc
      "The current state of the global table:\n\n {ul\n       {-   [CREATING] - The global table is being created.\n           \n            }\n       {-   [UPDATING] - The global table is being updated.\n           \n            }\n       {-   [DELETING] - The global table is being deleted.\n           \n            }\n       {-   [ACTIVE] - The global table is ready for use.\n           \n            }\n       }\n  "];
  creation_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The creation time of the global table.\n"];
  global_table_arn: string option
    [@ocaml.doc "The unique identifier of the global table.\n"];
  replication_group: replica_description list option
    [@ocaml.doc "The Regions where the global table has replicas.\n"]}
[@@ocaml.doc "Contains details about the global table.\n"]
type nonrec update_global_table_output =
  {
  global_table_description: global_table_description option
    [@ocaml.doc "Contains the details of the global table.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec create_replica_action =
  {
  region_name: string [@ocaml.doc "The Region of the replica to be added.\n"]}
[@@ocaml.doc "Represents a replica to be added.\n"]
type nonrec delete_replica_action =
  {
  region_name: string
    [@ocaml.doc "The Region of the replica to be removed.\n"]}[@@ocaml.doc
                                                                "Represents a replica to be removed.\n"]
type nonrec replica_update =
  {
  delete: delete_replica_action option
    [@ocaml.doc "The name of the existing replica to be removed.\n"];
  create: create_replica_action option
    [@ocaml.doc
      "The parameters required for creating a replica on an existing global table.\n"]}
[@@ocaml.doc
  "Represents one of the following:\n\n {ul\n       {-  A new replica to be added to an existing global table.\n           \n            }\n       {-  New parameters for an existing replica.\n           \n            }\n       {-  An existing replica to be removed from an existing global table.\n           \n            }\n       }\n  "]
type nonrec update_global_table_input =
  {
  replica_updates: replica_update list
    [@ocaml.doc
      "A list of Regions that should be added or removed from the global table.\n"];
  global_table_name: string [@ocaml.doc "The global table name.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec table_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "A source table with the name [TableName] does not currently exist within the subscriber's account or the subscriber is operating in the wrong Amazon Web Services Region.\n"]
type nonrec replica_already_exists_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified replica is already part of the global table.\n"]
type nonrec contributor_insights_status =
  | FAILED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_contributor_insights_output =
  {
  contributor_insights_status: contributor_insights_status option
    [@ocaml.doc "The status of contributor insights\n"];
  index_name: string option
    [@ocaml.doc "The name of the global secondary index, if applicable.\n"];
  table_name: string option [@ocaml.doc "The name of the table.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec contributor_insights_action =
  | DISABLE [@ocaml.doc ""]
  | ENABLE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_contributor_insights_input =
  {
  contributor_insights_action: contributor_insights_action
    [@ocaml.doc "Represents the contributor insights action.\n"];
  index_name: string option
    [@ocaml.doc "The global secondary index name, if applicable.\n"];
  table_name: string
    [@ocaml.doc
      "The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc ""]
type nonrec continuous_backups_status =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec point_in_time_recovery_status =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec point_in_time_recovery_description =
  {
  latest_restorable_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " [LatestRestorableDateTime] is typically 5 minutes before the current time. \n"];
  earliest_restorable_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specifies the earliest point in time you can restore your table to. You can restore your table to any point in time during the last 35 days. \n"];
  point_in_time_recovery_status: point_in_time_recovery_status option
    [@ocaml.doc
      "The current state of point in time recovery:\n\n {ul\n       {-   [ENABLED] - Point in time recovery is enabled.\n           \n            }\n       {-   [DISABLED] - Point in time recovery is disabled.\n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "The description of the point in time settings applied to the table.\n"]
type nonrec continuous_backups_description =
  {
  point_in_time_recovery_description:
    point_in_time_recovery_description option
    [@ocaml.doc
      "The description of the point in time recovery settings applied to the table.\n"];
  continuous_backups_status: continuous_backups_status
    [@ocaml.doc
      " [ContinuousBackupsStatus] can be one of the following states: ENABLED, DISABLED\n"]}
[@@ocaml.doc
  "Represents the continuous backups and point in time recovery settings on the table.\n"]
type nonrec update_continuous_backups_output =
  {
  continuous_backups_description: continuous_backups_description option
    [@ocaml.doc
      "Represents the continuous backups and point in time recovery settings on the table.\n"]}
[@@ocaml.doc ""]
type nonrec point_in_time_recovery_specification =
  {
  point_in_time_recovery_enabled: bool
    [@ocaml.doc
      "Indicates whether point in time recovery is enabled (true) or disabled (false) on the table.\n"]}
[@@ocaml.doc
  "Represents the settings used to enable point in time recovery.\n"]
type nonrec update_continuous_backups_input =
  {
  point_in_time_recovery_specification: point_in_time_recovery_specification
    [@ocaml.doc
      "Represents the settings used to enable point in time recovery.\n"];
  table_name: string
    [@ocaml.doc
      "The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc ""]
type nonrec continuous_backups_unavailable_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Backups have not yet been enabled for this table.\n"]
type nonrec update =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option
    [@ocaml.doc
      "Use [ReturnValuesOnConditionCheckFailure] to get the item attributes if the [Update] condition fails. For [ReturnValuesOnConditionCheckFailure], the valid values are: NONE and ALL_OLD.\n"];
  expression_attribute_values: expression_attribute_value_map option
    [@ocaml.doc
      "One or more values that can be substituted in an expression.\n"];
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in an expression.\n"];
  condition_expression: string option
    [@ocaml.doc
      "A condition that must be satisfied in order for a conditional update to succeed.\n"];
  table_name: string
    [@ocaml.doc
      "Name of the table for the [UpdateItem] request. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"];
  update_expression: string
    [@ocaml.doc
      "An expression that defines one or more attributes to be updated, the action to be performed on them, and new value(s) for them.\n"];
  key: key
    [@ocaml.doc
      "The primary key of the item to be updated. Each element consists of an attribute name and a value for that attribute.\n"]}
[@@ocaml.doc "Represents a request to perform an [UpdateItem] operation.\n"]
type nonrec untag_resource_input =
  {
  tag_keys: string list
    [@ocaml.doc
      "A list of tag keys. Existing tags of the resource whose keys are members of this list will be removed from the DynamoDB resource.\n"];
  resource_arn: string
    [@ocaml.doc
      "The DynamoDB resource that the tags will be removed from. This value is an Amazon Resource Name (ARN).\n"]}
[@@ocaml.doc ""]
type nonrec transaction_in_progress_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The transaction with the given request token is already in progress.\n\n  Recommended Settings \n \n    This is a general recommendation for handling the [TransactionInProgressException]. These settings help ensure that the client retries will trigger completion of the ongoing [TransactWriteItems] request. \n   \n     {ul\n           {-   Set [clientExecutionTimeout] to a value that allows at least one retry to be processed after 5 seconds have elapsed since the first attempt for the [TransactWriteItems] operation. \n               \n                }\n           {-   Set [socketTimeout] to a value a little lower than the [requestTimeout] setting. \n               \n                }\n           {-   [requestTimeout] should be set based on the time taken for the individual retries of a single HTTP request for your use case, but setting it to 1 second or higher should work well to reduce chances of retries and [TransactionInProgressException] errors. \n               \n                }\n           {-   Use exponential backoff when retrying and tune backoff if needed. \n               \n                }\n           }\n    Assuming {{:https://github.com/aws/aws-sdk-java/blob/fd409dee8ae23fb8953e0bb4dbde65536a7e0514/aws-java-sdk-core/src/main/java/com/amazonaws/retry/PredefinedRetryPolicies.java#L97}default retry policy}, example timeout settings based on the guidelines above are as follows: \n   \n    Example timeline:\n    \n     {ul\n           {-  0-1000 first attempt\n               \n                }\n           {-  1000-1500 first sleep/delay (default retry policy uses 500 ms as base delay for 4xx errors)\n               \n                }\n           {-  1500-2500 second attempt\n               \n                }\n           {-  2500-3500 second sleep/delay (500 * 2, exponential backoff)\n               \n                }\n           {-  3500-4500 third attempt\n               \n                }\n           {-  4500-6500 third sleep/delay (500 * 2^2)\n               \n                }\n           {-  6500-7500 fourth attempt (this can trigger inline recovery since 5 seconds have elapsed since the first attempt reached TC)\n               \n                }\n           }\n  "]
type nonrec cancellation_reason =
  {
  message: string option
    [@ocaml.doc "Cancellation reason message description.\n"];
  code: string option
    [@ocaml.doc "Status code for the result of the cancelled transaction.\n"];
  item: attribute_map option
    [@ocaml.doc
      "Item in the request which caused the transaction to get cancelled.\n"]}
[@@ocaml.doc
  "An ordered list of errors for each item in the request which caused the transaction to get cancelled. The values of the list are ordered according to the ordering of the [TransactWriteItems] request parameter. If no error occurred for the associated item an error with a Null code and Null message will be present. \n"]
type nonrec transaction_canceled_exception =
  {
  cancellation_reasons: cancellation_reason list option
    [@ocaml.doc "A list of cancellation reasons.\n"];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The entire transaction request was canceled.\n\n DynamoDB cancels a [TransactWriteItems] request under the following circumstances:\n \n  {ul\n        {-  A condition in one of the condition expressions is not met.\n            \n             }\n        {-  A table in the [TransactWriteItems] request is in a different account or region.\n            \n             }\n        {-  More than one action in the [TransactWriteItems] operation targets the same item.\n            \n             }\n        {-  There is insufficient provisioned capacity for the transaction to be completed.\n            \n             }\n        {-  An item size becomes too large (larger than 400 KB), or a local secondary index (LSI) becomes too large, or a similar validation error occurs because of changes made by the transaction.\n            \n             }\n        {-  There is a user error, such as an invalid data format.\n            \n             }\n        {-   There is an ongoing [TransactWriteItems] operation that conflicts with a concurrent [TransactWriteItems] request. In this case the [TransactWriteItems] operation fails with a [TransactionCanceledException]. \n            \n             }\n        }\n   DynamoDB cancels a [TransactGetItems] request under the following circumstances:\n   \n    {ul\n          {-  There is an ongoing [TransactGetItems] operation that conflicts with a concurrent [PutItem], [UpdateItem], [DeleteItem] or [TransactWriteItems] request. In this case the [TransactGetItems] operation fails with a [TransactionCanceledException].\n              \n               }\n          {-  A table in the [TransactGetItems] request is in a different account or region.\n              \n               }\n          {-  There is insufficient provisioned capacity for the transaction to be completed.\n              \n               }\n          {-  There is a user error, such as an invalid data format.\n              \n               }\n          }\n    If using Java, DynamoDB lists the cancellation reasons on the [CancellationReasons] property. This property is not set for other languages. Transaction cancellation reasons are ordered in the order of requested items, if an item has no error it will have [None] code and [Null] message.\n    \n      Cancellation reason codes and possible error messages:\n      \n       {ul\n             {-  No Errors:\n                 \n                  {ul\n                        {-  Code: [None] \n                            \n                             }\n                        {-  Message: [null] \n                            \n                             }\n                        \n              }\n               }\n             {-  Conditional Check Failed:\n                 \n                  {ul\n                        {-  Code: [ConditionalCheckFailed] \n                            \n                             }\n                        {-  Message: The conditional request failed. \n                            \n                             }\n                        \n              }\n               }\n             {-  Item Collection Size Limit Exceeded:\n                 \n                  {ul\n                        {-  Code: [ItemCollectionSizeLimitExceeded] \n                            \n                             }\n                        {-  Message: Collection size exceeded.\n                            \n                             }\n                        \n              }\n               }\n             {-  Transaction Conflict:\n                 \n                  {ul\n                        {-  Code: [TransactionConflict] \n                            \n                             }\n                        {-  Message: Transaction is ongoing for the item.\n                            \n                             }\n                        \n              }\n               }\n             {-  Provisioned Throughput Exceeded:\n                 \n                  {ul\n                        {-  Code: [ProvisionedThroughputExceeded] \n                            \n                             }\n                        {-  Messages:\n                            \n                             {ul\n                                   {-  The level of configured provisioned throughput for the table was exceeded. Consider increasing your provisioning level with the UpdateTable API.\n                                       \n                                         This Message is received when provisioned throughput is exceeded is on a provisioned DynamoDB table.\n                                         \n                                           }\n                                   {-  The level of configured provisioned throughput for one or more global secondary indexes of the table was exceeded. Consider increasing your provisioning level for the under-provisioned global secondary indexes with the UpdateTable API.\n                                       \n                                         This message is returned when provisioned throughput is exceeded is on a provisioned GSI.\n                                         \n                                           }\n                                   \n                         }\n                          }\n                        \n              }\n               }\n             {-  Throttling Error:\n                 \n                  {ul\n                        {-  Code: [ThrottlingError] \n                            \n                             }\n                        {-  Messages: \n                            \n                             {ul\n                                   {-  Throughput exceeds the current capacity of your table or index. DynamoDB is automatically scaling your table or index so please try again shortly. If exceptions persist, check if you have a hot key: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-partition-key-design.html.\n                                       \n                                         This message is returned when writes get throttled on an On-Demand table as DynamoDB is automatically scaling the table.\n                                         \n                                           }\n                                   {-  Throughput exceeds the current capacity for one or more global secondary indexes. DynamoDB is automatically scaling your index so please try again shortly.\n                                       \n                                         This message is returned when writes get throttled on an On-Demand GSI as DynamoDB is automatically scaling the GSI.\n                                         \n                                           }\n                                   \n                         }\n                          }\n                        \n              }\n               }\n             {-  Validation Error:\n                 \n                  {ul\n                        {-  Code: [ValidationError] \n                            \n                             }\n                        {-  Messages: \n                            \n                             {ul\n                                   {-  One or more parameter values were invalid.\n                                       \n                                        }\n                                   {-  The update expression attempted to update the secondary index key beyond allowed size limits.\n                                       \n                                        }\n                                   {-  The update expression attempted to update the secondary index key to unsupported type.\n                                       \n                                        }\n                                   {-  An operand in the update expression has an incorrect data type.\n                                       \n                                        }\n                                   {-  Item size to update has exceeded the maximum allowed size.\n                                       \n                                        }\n                                   {-  Number overflow. Attempting to store a number with magnitude larger than supported range.\n                                       \n                                        }\n                                   {-  Type mismatch for attribute to update.\n                                       \n                                        }\n                                   {-  Nesting Levels have exceeded supported limits.\n                                       \n                                        }\n                                   {-  The document path provided in the update expression is invalid for update.\n                                       \n                                        }\n                                   {-  The provided expression refers to an attribute that does not exist in the item.\n                                       \n                                        }\n                                   \n                         }\n                          }\n                        \n              }\n               }\n             }\n  "]
type nonrec item_collection_metrics_per_table =
  (string * item_collection_metrics list) list[@@ocaml.doc ""]
type nonrec transact_write_items_output =
  {
  item_collection_metrics: item_collection_metrics_per_table option
    [@ocaml.doc
      "A list of tables that were processed by [TransactWriteItems] and, for each table, information about any item collections that were affected by individual [UpdateItem], [PutItem], or [DeleteItem] operations. \n"];
  consumed_capacity: consumed_capacity list option
    [@ocaml.doc
      "The capacity units consumed by the entire [TransactWriteItems] operation. The values of the list are ordered according to the ordering of the [TransactItems] request parameter. \n"]}
[@@ocaml.doc ""]
type nonrec condition_check =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option
    [@ocaml.doc
      "Use [ReturnValuesOnConditionCheckFailure] to get the item attributes if the [ConditionCheck] condition fails. For [ReturnValuesOnConditionCheckFailure], the valid values are: NONE and ALL_OLD.\n"];
  expression_attribute_values: expression_attribute_value_map option
    [@ocaml.doc
      "One or more values that can be substituted in an expression. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ConditionExpressions.html}Condition expressions} in the {i Amazon DynamoDB Developer Guide}.\n"];
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in an expression. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ExpressionAttributeNames.html}Expression attribute names} in the {i Amazon DynamoDB Developer Guide}.\n"];
  condition_expression: string
    [@ocaml.doc
      "A condition that must be satisfied in order for a conditional update to succeed. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ConditionExpressions.html}Condition expressions} in the {i Amazon DynamoDB Developer Guide}.\n"];
  table_name: string
    [@ocaml.doc
      "Name of the table for the check item request. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"];
  key: key
    [@ocaml.doc
      "The primary key of the item to be checked. Each element consists of an attribute name and a value for that attribute.\n"]}
[@@ocaml.doc
  "Represents a request to perform a check that an item exists or to check the condition of specific attributes of the item.\n"]
type nonrec put =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option
    [@ocaml.doc
      "Use [ReturnValuesOnConditionCheckFailure] to get the item attributes if the [Put] condition fails. For [ReturnValuesOnConditionCheckFailure], the valid values are: NONE and ALL_OLD.\n"];
  expression_attribute_values: expression_attribute_value_map option
    [@ocaml.doc
      "One or more values that can be substituted in an expression.\n"];
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in an expression.\n"];
  condition_expression: string option
    [@ocaml.doc
      "A condition that must be satisfied in order for a conditional update to succeed.\n"];
  table_name: string
    [@ocaml.doc
      "Name of the table in which to write the item. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"];
  item: put_item_input_attribute_map
    [@ocaml.doc
      "A map of attribute name to attribute values, representing the primary key of the item to be written by [PutItem]. All of the table's primary key attributes must be specified, and their data types must match those of the table's key schema. If any attributes are present in the item that are part of an index key schema for the table, their types must match the index key schema. \n"]}
[@@ocaml.doc "Represents a request to perform a [PutItem] operation.\n"]
type nonrec delete =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option
    [@ocaml.doc
      "Use [ReturnValuesOnConditionCheckFailure] to get the item attributes if the [Delete] condition fails. For [ReturnValuesOnConditionCheckFailure], the valid values are: NONE and ALL_OLD.\n"];
  expression_attribute_values: expression_attribute_value_map option
    [@ocaml.doc
      "One or more values that can be substituted in an expression.\n"];
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in an expression.\n"];
  condition_expression: string option
    [@ocaml.doc
      "A condition that must be satisfied in order for a conditional delete to succeed.\n"];
  table_name: string
    [@ocaml.doc
      "Name of the table in which the item to be deleted resides. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"];
  key: key
    [@ocaml.doc
      "The primary key of the item to be deleted. Each element consists of an attribute name and a value for that attribute.\n"]}
[@@ocaml.doc "Represents a request to perform a [DeleteItem] operation.\n"]
type nonrec transact_write_item =
  {
  update: update option
    [@ocaml.doc "A request to perform an [UpdateItem] operation.\n"];
  delete: delete option
    [@ocaml.doc "A request to perform a [DeleteItem] operation.\n"];
  put: put option
    [@ocaml.doc "A request to perform a [PutItem] operation.\n"];
  condition_check: condition_check option
    [@ocaml.doc "A request to perform a check item operation.\n"]}[@@ocaml.doc
                                                                    "A list of requests that can perform update, put, delete, or check operations on multiple items in one or more tables atomically.\n"]
type nonrec transact_write_items_input =
  {
  client_request_token: string option
    [@ocaml.doc
      "Providing a [ClientRequestToken] makes the call to [TransactWriteItems] idempotent, meaning that multiple identical calls have the same effect as one single call.\n\n Although multiple identical calls using the same client request token produce the same result on the server (no side effects), the responses to the calls might not be the same. If the [ReturnConsumedCapacity] parameter is set, then the initial [TransactWriteItems] call returns the amount of write capacity units consumed in making the changes. Subsequent [TransactWriteItems] calls with the same client token return the number of read capacity units consumed in reading the item.\n \n  A client request token is valid for 10 minutes after the first request that uses it is completed. After 10 minutes, any request with the same client token is treated as a new request. Do not resubmit the same request with the same client token for more than 10 minutes, or the result might not be idempotent.\n  \n   If you submit a request with the same client token but a change in other parameters within the 10-minute idempotency window, DynamoDB returns an [IdempotentParameterMismatch] exception.\n   "];
  return_item_collection_metrics: return_item_collection_metrics option
    [@ocaml.doc
      "Determines whether item collection metrics are returned. If set to [SIZE], the response includes statistics about item collections (if any), that were modified during the operation and are returned in the response. If set to [NONE] (the default), no statistics are returned. \n"];
  return_consumed_capacity: return_consumed_capacity option [@ocaml.doc ""];
  transact_items: transact_write_item list
    [@ocaml.doc
      "An ordered array of up to 100 [TransactWriteItem] objects, each of which contains a [ConditionCheck], [Put], [Update], or [Delete] object. These can operate on items in different tables, but the tables must reside in the same Amazon Web Services account and Region, and no two of them can operate on the same item. \n"]}
[@@ocaml.doc ""]
type nonrec idempotent_parameter_mismatch_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "DynamoDB rejected the request because you retried a request with a different payload but with an idempotent token that was already used.\n"]
type nonrec item_response =
  {
  item: attribute_map option
    [@ocaml.doc
      "Map of attribute data consisting of the data type and attribute value.\n"]}
[@@ocaml.doc "Details for the requested item.\n"]
type nonrec transact_get_items_output =
  {
  responses: item_response list option
    [@ocaml.doc
      "An ordered array of up to 100 [ItemResponse] objects, each of which corresponds to the [TransactGetItem] object in the same position in the {i TransactItems} array. Each [ItemResponse] object contains a Map of the name-value pairs that are the projected attributes of the requested item.\n\n If a requested item could not be retrieved, the corresponding [ItemResponse] object is Null, or if the requested item has no projected attributes, the corresponding [ItemResponse] object is an empty Map. \n "];
  consumed_capacity: consumed_capacity list option
    [@ocaml.doc
      "If the {i ReturnConsumedCapacity} value was [TOTAL], this is an array of [ConsumedCapacity] objects, one for each table addressed by [TransactGetItem] objects in the {i TransactItems} parameter. These [ConsumedCapacity] objects report the read-capacity units consumed by the [TransactGetItems] call in that table.\n"]}
[@@ocaml.doc ""]
type nonrec get =
  {
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in the ProjectionExpression parameter.\n"];
  projection_expression: string option
    [@ocaml.doc
      "A string that identifies one or more attributes of the specified item to retrieve from the table. The attributes in the expression must be separated by commas. If no attribute names are specified, then all attributes of the specified item are returned. If any of the requested attributes are not found, they do not appear in the result.\n"];
  table_name: string
    [@ocaml.doc
      "The name of the table from which to retrieve the specified item. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"];
  key: key
    [@ocaml.doc
      "A map of attribute names to [AttributeValue] objects that specifies the primary key of the item to retrieve.\n"]}
[@@ocaml.doc
  "Specifies an item and related attribute values to retrieve in a [TransactGetItem] object.\n"]
type nonrec transact_get_item =
  {
  get: get
    [@ocaml.doc
      "Contains the primary key that identifies the item to get, together with the name of the table that contains the item, and optionally the specific attributes of the item to retrieve.\n"]}
[@@ocaml.doc
  "Specifies an item to be retrieved as part of the transaction.\n"]
type nonrec transact_get_items_input =
  {
  return_consumed_capacity: return_consumed_capacity option
    [@ocaml.doc
      "A value of [TOTAL] causes consumed capacity information to be returned, and a value of [NONE] prevents that information from being returned. No other value is valid.\n"];
  transact_items: transact_get_item list
    [@ocaml.doc
      "An ordered array of up to 100 [TransactGetItem] objects, each of which contains a [Get] structure.\n"]}
[@@ocaml.doc ""]
type nonrec time_to_live_status =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec time_to_live_description =
  {
  attribute_name: string option
    [@ocaml.doc " The name of the TTL attribute for items in the table.\n"];
  time_to_live_status: time_to_live_status option
    [@ocaml.doc " The TTL status for the table.\n"]}[@@ocaml.doc
                                                      "The description of the Time to Live (TTL) status on the specified table. \n"]
type nonrec tag =
  {
  value: string
    [@ocaml.doc
      "The value of the tag. Tag values are case-sensitive and can be null.\n"];
  key: string
    [@ocaml.doc
      "The key of the tag. Tag keys are case sensitive. Each DynamoDB table can only have up to one tag with the same key. If you try to add an existing tag (same key), the existing tag value will be updated to the new value.\n"]}
[@@ocaml.doc
  "Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a single DynamoDB table. \n\n Amazon Web Services-assigned tag names and values are automatically assigned the [aws:] prefix, which the user cannot assign. Amazon Web Services-assigned tag names do not count towards the tag limit of 50. User-assigned tag names have the prefix [user:] in the Cost Allocation Report. You cannot backdate the application of a tag.\n \n  For an overview on tagging DynamoDB resources, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html}Tagging for DynamoDB} in the {i Amazon DynamoDB Developer Guide}.\n  "]
type nonrec tag_resource_input =
  {
  tags: tag list
    [@ocaml.doc "The tags to be assigned to the Amazon DynamoDB resource.\n"];
  resource_arn: string
    [@ocaml.doc
      "Identifies the Amazon DynamoDB resource to which tags should be added. This value is an Amazon Resource Name (ARN).\n"]}
[@@ocaml.doc ""]
type nonrec table_in_use_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "A target table with the specified name is either being created or deleted. \n"]
type nonrec global_secondary_index =
  {
  on_demand_throughput: on_demand_throughput option
    [@ocaml.doc
      "The maximum number of read and write units for the specified global secondary index. If you use this parameter, you must specify [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.\n"];
  provisioned_throughput: provisioned_throughput option
    [@ocaml.doc
      "Represents the provisioned throughput settings for the specified global secondary index.\n\n For current minimum and maximum provisioned throughput values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html}Service, Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.\n "];
  projection: projection
    [@ocaml.doc
      "Represents attributes that are copied (projected) from the table into the global secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. \n"];
  key_schema: key_schema_element list
    [@ocaml.doc
      "The complete key schema for a global secondary index, which consists of one or more pairs of attribute names and key types:\n\n {ul\n       {-   [HASH] - partition key\n           \n            }\n       {-   [RANGE] - sort key\n           \n            }\n       }\n    The partition key of an item is also known as its {i hash attribute}. The term \"hash attribute\" derives from DynamoDB's usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.\n    \n     The sort key of an item is also known as its {i range attribute}. The term \"range attribute\" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.\n     \n      "];
  index_name: string
    [@ocaml.doc
      "The name of the global secondary index. The name must be unique among all other indexes on this table.\n"]}
[@@ocaml.doc "Represents the properties of a global secondary index.\n"]
type nonrec table_creation_parameters =
  {
  global_secondary_indexes: global_secondary_index list option
    [@ocaml.doc
      " The Global Secondary Indexes (GSI) of the table to be created as part of the import operation. \n"];
  sse_specification: sse_specification option [@ocaml.doc ""];
  on_demand_throughput: on_demand_throughput option [@ocaml.doc ""];
  provisioned_throughput: provisioned_throughput option [@ocaml.doc ""];
  billing_mode: billing_mode option
    [@ocaml.doc
      " The billing mode for provisioning the table created as part of the import operation. \n"];
  key_schema: key_schema_element list
    [@ocaml.doc
      " The primary key and option sort key of the table created as part of the import operation. \n"];
  attribute_definitions: attribute_definition list
    [@ocaml.doc
      " The attributes of the table created as part of the import operation. \n"];
  table_name: string
    [@ocaml.doc
      " The name of the table created as part of the import operation. \n"]}
[@@ocaml.doc
  " The parameters for the table created as part of the import operation. \n"]
type nonrec table_already_exists_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "A target table with the specified name already exists. \n"]
type nonrec local_secondary_index_info =
  {
  projection: projection option
    [@ocaml.doc
      "Represents attributes that are copied (projected) from the table into the global secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. \n"];
  key_schema: key_schema_element list option
    [@ocaml.doc
      "The complete key schema for a local secondary index, which consists of one or more pairs of attribute names and key types:\n\n {ul\n       {-   [HASH] - partition key\n           \n            }\n       {-   [RANGE] - sort key\n           \n            }\n       }\n    The partition key of an item is also known as its {i hash attribute}. The term \"hash attribute\" derives from DynamoDB's usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.\n    \n     The sort key of an item is also known as its {i range attribute}. The term \"range attribute\" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.\n     \n      "];
  index_name: string option
    [@ocaml.doc "Represents the name of the local secondary index.\n"]}
[@@ocaml.doc
  "Represents the properties of a local secondary index for the table when the backup was created.\n"]
type nonrec global_secondary_index_info =
  {
  on_demand_throughput: on_demand_throughput option [@ocaml.doc ""];
  provisioned_throughput: provisioned_throughput option
    [@ocaml.doc
      "Represents the provisioned throughput settings for the specified global secondary index. \n"];
  projection: projection option
    [@ocaml.doc
      "Represents attributes that are copied (projected) from the table into the global secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. \n"];
  key_schema: key_schema_element list option
    [@ocaml.doc
      "The complete key schema for a global secondary index, which consists of one or more pairs of attribute names and key types:\n\n {ul\n       {-   [HASH] - partition key\n           \n            }\n       {-   [RANGE] - sort key\n           \n            }\n       }\n    The partition key of an item is also known as its {i hash attribute}. The term \"hash attribute\" derives from DynamoDB's usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.\n    \n     The sort key of an item is also known as its {i range attribute}. The term \"range attribute\" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.\n     \n      "];
  index_name: string option
    [@ocaml.doc "The name of the global secondary index.\n"]}[@@ocaml.doc
                                                               "Represents the properties of a global secondary index for the table when the backup was created.\n"]
type nonrec source_table_feature_details =
  {
  sse_description: sse_description option
    [@ocaml.doc
      "The description of the server-side encryption status on the table when the backup was created.\n"];
  time_to_live_description: time_to_live_description option
    [@ocaml.doc
      "Time to Live settings on the table when the backup was created.\n"];
  stream_description: stream_specification option
    [@ocaml.doc
      "Stream settings on the table when the backup was created.\n"];
  global_secondary_indexes: global_secondary_index_info list option
    [@ocaml.doc
      "Represents the GSI properties for the table when the backup was created. It includes the IndexName, KeySchema, Projection, and ProvisionedThroughput for the GSIs on the table at the time of backup. \n"];
  local_secondary_indexes: local_secondary_index_info list option
    [@ocaml.doc
      "Represents the LSI properties for the table when the backup was created. It includes the IndexName, KeySchema and Projection for the LSIs on the table at the time of backup. \n"]}
[@@ocaml.doc
  "Contains the details of the features enabled on the table when the backup was created. For example, LSIs, GSIs, streams, TTL. \n"]
type nonrec source_table_details =
  {
  billing_mode: billing_mode option
    [@ocaml.doc
      "Controls how you are charged for read and write throughput and how you manage capacity. This setting can be changed later.\n\n {ul\n       {-   [PROVISIONED] - Sets the read/write capacity mode to [PROVISIONED]. We recommend using [PROVISIONED] for predictable workloads.\n           \n            }\n       {-   [PAY_PER_REQUEST] - Sets the read/write capacity mode to [PAY_PER_REQUEST]. We recommend using [PAY_PER_REQUEST] for unpredictable workloads. \n           \n            }\n       }\n  "];
  item_count: int option
    [@ocaml.doc
      "Number of items in the table. Note that this is an approximate value. \n"];
  on_demand_throughput: on_demand_throughput option [@ocaml.doc ""];
  provisioned_throughput: provisioned_throughput
    [@ocaml.doc
      "Read IOPs and Write IOPS on the table when the backup was created.\n"];
  table_creation_date_time: CoreTypes.Timestamp.t
    [@ocaml.doc "Time when the source table was created. \n"];
  key_schema: key_schema_element list [@ocaml.doc "Schema of the table. \n"];
  table_size_bytes: int option
    [@ocaml.doc
      "Size of the table in bytes. Note that this is an approximate value.\n"];
  table_arn: string option
    [@ocaml.doc "ARN of the table for which backup was created. \n"];
  table_id: string
    [@ocaml.doc
      "Unique identifier for the table for which the backup was created. \n"];
  table_name: string
    [@ocaml.doc "The name of the table for which the backup was created. \n"]}
[@@ocaml.doc
  "Contains the details of the table when the backup was created. \n"]
type nonrec select =
  | COUNT [@ocaml.doc ""]
  | SPECIFIC_ATTRIBUTES [@ocaml.doc ""]
  | ALL_PROJECTED_ATTRIBUTES [@ocaml.doc ""]
  | ALL_ATTRIBUTES [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec scan_output =
  {
  consumed_capacity: consumed_capacity option
    [@ocaml.doc
      "The capacity units consumed by the [Scan] operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity] parameter was specified. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#read-operation-consumption}Capacity unit consumption for read operations} in the {i Amazon DynamoDB Developer Guide}.\n"];
  last_evaluated_key: key option
    [@ocaml.doc
      "The primary key of the item where the operation stopped, inclusive of the previous result set. Use this value to start a new operation, excluding this value in the new request.\n\n If [LastEvaluatedKey] is empty, then the \"last page\" of results has been processed and there is no more data to be retrieved.\n \n  If [LastEvaluatedKey] is not empty, it does not necessarily mean that there is more data in the result set. The only way to know when you have reached the end of the result set is when [LastEvaluatedKey] is empty.\n  "];
  scanned_count: int option
    [@ocaml.doc
      "The number of items evaluated, before any [ScanFilter] is applied. A high [ScannedCount] value with few, or no, [Count] results indicates an inefficient [Scan] operation. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count}Count and ScannedCount} in the {i Amazon DynamoDB Developer Guide}.\n\n If you did not use a filter in the request, then [ScannedCount] is the same as [Count].\n "];
  count: int option
    [@ocaml.doc
      "The number of items in the response.\n\n If you set [ScanFilter] in the request, then [Count] is the number of items returned after the filter was applied, and [ScannedCount] is the number of matching items before the filter was applied.\n \n  If you did not use a filter in the request, then [Count] is the same as [ScannedCount].\n  "];
  items: attribute_map list option
    [@ocaml.doc
      "An array of item attributes that match the scan criteria. Each element in this array consists of an attribute name and the value for that attribute.\n"]}
[@@ocaml.doc "Represents the output of a [Scan] operation.\n"]
type nonrec condition =
  {
  comparison_operator: comparison_operator
    [@ocaml.doc
      "A comparator for evaluating attributes. For example, equals, greater than, less than, etc.\n\n The following comparison operators are available:\n \n   [EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS |\n                BEGINS_WITH | IN | BETWEEN] \n  \n   The following are descriptions of each comparison operator.\n   \n    {ul\n          {-   [EQ] : Equal. [EQ] is supported for all data types, including lists and maps.\n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not equal [{\"NS\":\\[\"6\", \"2\",\n                    \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [NE] : Not equal. [NE] is supported for all data types, including lists and maps.\n              \n                [AttributeValueList] can contain only one [AttributeValue] of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an [AttributeValue] of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not equal [{\"NS\":\\[\"6\", \"2\",\n                    \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [LE] : Less than or equal. \n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, or Binary (not a set type). If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not compare to [{\"NS\":\\[\"6\", \"2\", \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [LT] : Less than. \n              \n                [AttributeValueList] can contain only one [AttributeValue] of type String, Number, or Binary (not a set type). If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not compare to [{\"NS\":\\[\"6\", \"2\",\n                        \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [GE] : Greater than or equal. \n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, or Binary (not a set type). If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not compare to [{\"NS\":\\[\"6\", \"2\", \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [GT] : Greater than. \n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, or Binary (not a set type). If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not equal [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not compare to [{\"NS\":\\[\"6\", \"2\", \"1\"\\]}].\n               \n                \n                \n                 }\n          {-   [NOT_NULL] : The attribute exists. [NOT_NULL] is supported for all data types, including lists and maps.\n              \n                This operator tests for the existence of an attribute, not its data type. If the data type of attribute \"[a]\" is null, and you evaluate it using [NOT_NULL], the result is a Boolean [true]. This result is because the attribute \"[a]\" exists; its data type is not relevant to the [NOT_NULL] comparison operator.\n                \n                  }\n          {-   [NULL] : The attribute does not exist. [NULL] is supported for all data types, including lists and maps.\n              \n                This operator tests for the nonexistence of an attribute, not its data type. If the data type of attribute \"[a]\" is null, and you evaluate it using [NULL], the result is a Boolean [false]. This is because the attribute \"[a]\" exists; its data type is not relevant to the [NULL] comparison operator.\n                \n                  }\n          {-   [CONTAINS] : Checks for a subsequence, or value in a set.\n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is of type String, then the operator checks for a substring match. If the target attribute of the comparison is of type Binary, then the operator looks for a subsequence of the target that matches the input. If the target attribute of the comparison is a set (\"[SS]\", \"[NS]\", or \"[BS]\"), then the operator evaluates to true if it finds an exact match with any member of the set.\n               \n                CONTAINS is supported for lists: When evaluating \"[a CONTAINS b]\", \"[a]\" can be a list; however, \"[b]\" cannot be a set, a map, or a list.\n                \n                 }\n          {-   [NOT_CONTAINS] : Checks for absence of a subsequence, or absence of a value in a set.\n              \n                [AttributeValueList] can contain only one [AttributeValue] element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is a String, then the operator checks for the absence of a substring match. If the target attribute of the comparison is Binary, then the operator checks for the absence of a subsequence of the target that matches the input. If the target attribute of the comparison is a set (\"[SS]\", \"[NS]\", or \"[BS]\"), then the operator evaluates to true if it {i does not} find an exact match with any member of the set.\n               \n                NOT_CONTAINS is supported for lists: When evaluating \"[a NOT CONTAINS\n                        b]\", \"[a]\" can be a list; however, \"[b]\" cannot be a set, a map, or a list.\n                \n                 }\n          {-   [BEGINS_WITH] : Checks for a prefix. \n              \n                [AttributeValueList] can contain only one [AttributeValue] of type String or Binary (not a Number or a set type). The target attribute of the comparison must be of type String or Binary (not a Number or a set type).\n               \n                \n                \n                 }\n          {-   [IN] : Checks for matching elements in a list.\n              \n                [AttributeValueList] can contain one or more [AttributeValue] elements of type String, Number, or Binary. These attributes are compared against an existing attribute of an item. If any elements of the input are equal to the item attribute, the expression evaluates to true.\n               \n                }\n          {-   [BETWEEN] : Greater than or equal to the first value, and less than or equal to the second value. \n              \n                [AttributeValueList] must contain two [AttributeValue] elements of the same type, either String, Number, or Binary (not a set type). A target attribute matches if the target value is greater than, or equal to, the first element and less than, or equal to, the second element. If an item contains an [AttributeValue] element of a different type than the one provided in the request, the value does not match. For example, [{\"S\":\"6\"}] does not compare to [{\"N\":\"6\"}]. Also, [{\"N\":\"6\"}] does not compare to [{\"NS\":\\[\"6\", \"2\",\n                        \"1\"\\]}] \n               \n                }\n          }\n   For usage examples of [AttributeValueList] and [ComparisonOperator], see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html}Legacy Conditional Parameters} in the {i Amazon DynamoDB Developer Guide}.\n   "];
  attribute_value_list: attribute_value list option
    [@ocaml.doc
      "One or more values to evaluate against the supplied attribute. The number of values in the list depends on the [ComparisonOperator] being used.\n\n For type Number, value comparisons are numeric.\n \n  String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, [a] is greater than [A], and [a] is greater than [B]. For a list of code values, see {{:http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}.\n  \n   For Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.\n   "]}
[@@ocaml.doc
  "Represents the selection criteria for a [Query] or [Scan] operation:\n\n {ul\n       {-  For a [Query] operation, [Condition] is used for specifying the [KeyConditions] to use when querying a table or an index. For [KeyConditions], only the following comparison operators are supported:\n           \n             [EQ | LE | LT | GE | GT | BEGINS_WITH | BETWEEN] \n            \n              [Condition] is also used in a [QueryFilter], which evaluates the query results and returns only the desired values.\n             \n              }\n       {-  For a [Scan] operation, [Condition] is used in a [ScanFilter], which evaluates the scan results and returns only the desired values.\n           \n            }\n       }\n  "]
type nonrec filter_condition_map = (string * condition) list[@@ocaml.doc ""]
type nonrec scan_input =
  {
  consistent_read: bool option
    [@ocaml.doc
      "A Boolean value that determines the read consistency model during the scan:\n\n {ul\n       {-  If [ConsistentRead] is [false], then the data returned from [Scan] might not contain the results from other recently completed write operations ([PutItem], [UpdateItem], or [DeleteItem]).\n           \n            }\n       {-  If [ConsistentRead] is [true], then all of the write operations that completed before the [Scan] began are guaranteed to be contained in the [Scan] response.\n           \n            }\n       }\n   The default setting for [ConsistentRead] is [false].\n   \n    The [ConsistentRead] parameter is not supported on global secondary indexes. If you scan a global secondary index with [ConsistentRead] set to true, you will receive a [ValidationException].\n    "];
  expression_attribute_values: expression_attribute_value_map option
    [@ocaml.doc
      "One or more values that can be substituted in an expression.\n\n Use the {b :} (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the [ProductStatus] attribute was one of the following: \n \n   [Available | Backordered | Discontinued] \n  \n   You would first need to specify [ExpressionAttributeValues] as follows:\n   \n     [{ \":avail\":{\"S\":\"Available\"}, \":back\":{\"S\":\"Backordered\"},\n                \":disc\":{\"S\":\"Discontinued\"} }] \n    \n     You could then use these values in an expression, such as this:\n     \n       [ProductStatus IN (:avail, :back, :disc)] \n      \n       For more information on expression attribute values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html}Condition Expressions} in the {i Amazon DynamoDB Developer Guide}.\n       "];
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in an expression. The following are some use cases for using [ExpressionAttributeNames]:\n\n {ul\n       {-  To access an attribute whose name conflicts with a DynamoDB reserved word.\n           \n            }\n       {-  To create a placeholder for repeating occurrences of an attribute name in an expression.\n           \n            }\n       {-  To prevent special characters in an attribute name from being misinterpreted in an expression.\n           \n            }\n       }\n   Use the {b #} character in an expression to dereference an attribute name. For example, consider the following attribute name:\n   \n    {ul\n          {-   [Percentile] \n              \n               }\n          }\n   The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html}Reserved Words} in the {i Amazon DynamoDB Developer Guide}). To work around this, you could specify the following for [ExpressionAttributeNames]:\n   \n    {ul\n          {-   [{\"#P\":\"Percentile\"}] \n              \n               }\n          }\n   You could then use this substitution in an expression, as in this example:\n   \n    {ul\n          {-   [#P = :val] \n              \n               }\n          }\n    Tokens that begin with the {b :} character are {i expression attribute values}, which are placeholders for the actual value at runtime.\n    \n      For more information on expression attribute names, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Specifying Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n      "];
  filter_expression: string option
    [@ocaml.doc
      "A string that contains conditions that DynamoDB applies after the [Scan] operation, but before the data is returned to you. Items that do not satisfy the [FilterExpression] criteria are not returned.\n\n  A [FilterExpression] is applied after the items have already been read; the process of filtering does not consume any additional read capacity units.\n  \n    For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.FilterExpression}Filter Expressions} in the {i Amazon DynamoDB Developer Guide}.\n    "];
  projection_expression: string option
    [@ocaml.doc
      "A string that identifies one or more attributes to retrieve from the specified table or index. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.\n\n If no attribute names are specified, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.\n \n  For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Specifying Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n  "];
  segment: int option
    [@ocaml.doc
      "For a parallel [Scan] request, [Segment] identifies an individual segment to be scanned by an application worker.\n\n Segment IDs are zero-based, so the first segment is always 0. For example, if you want to use four application threads to scan a table or an index, then the first thread specifies a [Segment] value of 0, the second thread specifies 1, and so on.\n \n  The value of [LastEvaluatedKey] returned from a parallel [Scan] request must be used as [ExclusiveStartKey] with the same segment ID in a subsequent [Scan] operation.\n  \n   The value for [Segment] must be greater than or equal to 0, and less than the value provided for [TotalSegments].\n   \n    If you provide [Segment], you must also provide [TotalSegments].\n    "];
  total_segments: int option
    [@ocaml.doc
      "For a parallel [Scan] request, [TotalSegments] represents the total number of segments into which the [Scan] operation will be divided. The value of [TotalSegments] corresponds to the number of application workers that will perform the parallel scan. For example, if you want to use four application threads to scan a table or an index, specify a [TotalSegments] value of 4.\n\n The value for [TotalSegments] must be greater than or equal to 1, and less than or equal to 1000000. If you specify a [TotalSegments] value of 1, the [Scan] operation will be sequential rather than parallel.\n \n  If you specify [TotalSegments], you must also specify [Segment].\n  "];
  return_consumed_capacity: return_consumed_capacity option [@ocaml.doc ""];
  exclusive_start_key: key option
    [@ocaml.doc
      "The primary key of the first item that this operation will evaluate. Use the value that was returned for [LastEvaluatedKey] in the previous operation.\n\n The data type for [ExclusiveStartKey] must be String, Number or Binary. No set data types are allowed.\n \n  In a parallel scan, a [Scan] request that includes [ExclusiveStartKey] must specify the same segment whose previous [Scan] returned the corresponding value of [LastEvaluatedKey].\n  "];
  conditional_operator: conditional_operator option
    [@ocaml.doc
      "This is a legacy parameter. Use [FilterExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html}ConditionalOperator} in the {i Amazon DynamoDB Developer Guide}.\n"];
  scan_filter: filter_condition_map option
    [@ocaml.doc
      "This is a legacy parameter. Use [FilterExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ScanFilter.html}ScanFilter} in the {i Amazon DynamoDB Developer Guide}.\n"];
  select: select option
    [@ocaml.doc
      "The attributes to be returned in the result. You can retrieve all item attributes, specific item attributes, the count of matching items, or in the case of an index, some or all of the attributes projected into the index.\n\n {ul\n       {-   [ALL_ATTRIBUTES] - Returns all of the item attributes from the specified table or index. If you query a local secondary index, then for each matching item in the index, DynamoDB fetches the entire item from the parent table. If the index is configured to project all item attributes, then all of the data can be obtained from the local secondary index, and no fetching is required.\n           \n            }\n       {-   [ALL_PROJECTED_ATTRIBUTES] - Allowed only when querying an index. Retrieves all attributes that have been projected into the index. If the index is configured to project all attributes, this return value is equivalent to specifying [ALL_ATTRIBUTES].\n           \n            }\n       {-   [COUNT] - Returns the number of matching items, rather than the matching items themselves. Note that this uses the same quantity of read capacity units as getting the items, and is subject to the same item size calculations.\n           \n            }\n       {-   [SPECIFIC_ATTRIBUTES] - Returns only the attributes listed in [ProjectionExpression]. This return value is equivalent to specifying [ProjectionExpression] without specifying any value for [Select].\n           \n            If you query or scan a local secondary index and request only attributes that are projected into that index, the operation reads only the index and not the table. If any of the requested attributes are not projected into the local secondary index, DynamoDB fetches each of these attributes from the parent table. This extra fetching incurs additional throughput cost and latency.\n            \n             If you query or scan a global secondary index, you can only request attributes that are projected into the index. Global secondary index queries cannot fetch attributes from the parent table.\n             \n              }\n       }\n   If neither [Select] nor [ProjectionExpression] are specified, DynamoDB defaults to [ALL_ATTRIBUTES] when accessing a table, and [ALL_PROJECTED_ATTRIBUTES] when accessing an index. You cannot use both [Select] and [ProjectionExpression] together in a single request, unless the value for [Select] is [SPECIFIC_ATTRIBUTES]. (This usage is equivalent to specifying [ProjectionExpression] without any value for [Select].)\n   \n     If you use the [ProjectionExpression] parameter, then the value for [Select] can only be [SPECIFIC_ATTRIBUTES]. Any other value for [Select] will return an error.\n     \n      "];
  limit: int option
    [@ocaml.doc
      "The maximum number of items to evaluate (not necessarily the number of matching items). If DynamoDB processes the number of items up to the limit while processing the results, it stops the operation and returns the matching values up to that point, and a key in [LastEvaluatedKey] to apply in a subsequent operation, so that you can pick up where you left off. Also, if the processed dataset size exceeds 1 MB before DynamoDB reaches this limit, it stops the operation and returns the matching values up to the limit, and a key in [LastEvaluatedKey] to apply in a subsequent operation to continue the operation. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html}Working with Queries} in the {i Amazon DynamoDB Developer Guide}.\n"];
  attributes_to_get: string list option
    [@ocaml.doc
      "This is a legacy parameter. Use [ProjectionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html}AttributesToGet} in the {i Amazon DynamoDB Developer Guide}.\n"];
  index_name: string option
    [@ocaml.doc
      "The name of a secondary index to scan. This index can be any local secondary index or global secondary index. Note that if you use the [IndexName] parameter, you must also provide [TableName].\n"];
  table_name: string
    [@ocaml.doc
      "The name of the table containing the requested items or if you provide [IndexName], the name of the table to which that index belongs.\n\n You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n "]}
[@@ocaml.doc "Represents the input of a [Scan] operation.\n"]
type nonrec s3_sse_algorithm =
  | KMS [@ocaml.doc ""]
  | AES256 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec s3_bucket_source =
  {
  s3_key_prefix: string option
    [@ocaml.doc
      " The key prefix shared by all S3 Objects that are being imported. \n"];
  s3_bucket: string
    [@ocaml.doc " The S3 bucket that is being imported from. \n"];
  s3_bucket_owner: string option
    [@ocaml.doc
      " The account number of the S3 bucket that is being imported from. If the bucket is owned by the requester this is optional. \n"]}
[@@ocaml.doc " The S3 bucket that is being imported from. \n"]
type nonrec restore_table_to_point_in_time_output =
  {
  table_description: table_description option
    [@ocaml.doc "Represents the properties of a table.\n"]}[@@ocaml.doc ""]
type nonrec local_secondary_index =
  {
  projection: projection
    [@ocaml.doc
      "Represents attributes that are copied (projected) from the table into the local secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. \n"];
  key_schema: key_schema_element list
    [@ocaml.doc
      "The complete key schema for the local secondary index, consisting of one or more pairs of attribute names and key types:\n\n {ul\n       {-   [HASH] - partition key\n           \n            }\n       {-   [RANGE] - sort key\n           \n            }\n       }\n    The partition key of an item is also known as its {i hash attribute}. The term \"hash attribute\" derives from DynamoDB's usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.\n    \n     The sort key of an item is also known as its {i range attribute}. The term \"range attribute\" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.\n     \n      "];
  index_name: string
    [@ocaml.doc
      "The name of the local secondary index. The name must be unique among all other indexes on this table.\n"]}
[@@ocaml.doc "Represents the properties of a local secondary index.\n"]
type nonrec restore_table_to_point_in_time_input =
  {
  sse_specification_override: sse_specification option
    [@ocaml.doc
      "The new server-side encryption settings for the restored table.\n"];
  on_demand_throughput_override: on_demand_throughput option [@ocaml.doc ""];
  provisioned_throughput_override: provisioned_throughput option
    [@ocaml.doc "Provisioned throughput settings for the restored table.\n"];
  local_secondary_index_override: local_secondary_index list option
    [@ocaml.doc
      "List of local secondary indexes for the restored table. The indexes provided should match existing secondary indexes. You can choose to exclude some or all of the indexes at the time of restore.\n"];
  global_secondary_index_override: global_secondary_index list option
    [@ocaml.doc
      "List of global secondary indexes for the restored table. The indexes provided should match existing secondary indexes. You can choose to exclude some or all of the indexes at the time of restore.\n"];
  billing_mode_override: billing_mode option
    [@ocaml.doc "The billing mode of the restored table.\n"];
  restore_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "Time in the past to restore the table to.\n"];
  use_latest_restorable_time: bool option
    [@ocaml.doc
      "Restore the table to the latest possible time. [LatestRestorableDateTime] is typically 5 minutes before the current time. \n"];
  target_table_name: string
    [@ocaml.doc
      "The name of the new table to which it must be restored to.\n"];
  source_table_name: string option
    [@ocaml.doc "Name of the source table that is being restored.\n"];
  source_table_arn: string option
    [@ocaml.doc
      "The DynamoDB table that will be restored. This value is an Amazon Resource Name (ARN).\n"]}
[@@ocaml.doc ""]
type nonrec point_in_time_recovery_unavailable_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Point in time recovery has not yet been enabled for this source table.\n"]
type nonrec invalid_restore_time_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "An invalid restore time was specified. RestoreDateTime must be between EarliestRestorableDateTime and LatestRestorableDateTime.\n"]
type nonrec restore_table_from_backup_output =
  {
  table_description: table_description option
    [@ocaml.doc
      "The description of the table created from an existing backup.\n"]}
[@@ocaml.doc ""]
type nonrec restore_table_from_backup_input =
  {
  sse_specification_override: sse_specification option
    [@ocaml.doc
      "The new server-side encryption settings for the restored table.\n"];
  on_demand_throughput_override: on_demand_throughput option [@ocaml.doc ""];
  provisioned_throughput_override: provisioned_throughput option
    [@ocaml.doc "Provisioned throughput settings for the restored table.\n"];
  local_secondary_index_override: local_secondary_index list option
    [@ocaml.doc
      "List of local secondary indexes for the restored table. The indexes provided should match existing secondary indexes. You can choose to exclude some or all of the indexes at the time of restore.\n"];
  global_secondary_index_override: global_secondary_index list option
    [@ocaml.doc
      "List of global secondary indexes for the restored table. The indexes provided should match existing secondary indexes. You can choose to exclude some or all of the indexes at the time of restore.\n"];
  billing_mode_override: billing_mode option
    [@ocaml.doc "The billing mode of the restored table.\n"];
  backup_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) associated with the backup.\n"];
  target_table_name: string
    [@ocaml.doc
      "The name of the new table to which the backup must be restored.\n"]}
[@@ocaml.doc ""]
type nonrec backup_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Backup not found for the given BackupARN. \n"]
type nonrec backup_in_use_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "There is another ongoing conflicting backup control plane operation on the table. The backup is either being created, deleted or restored to a table.\n"]
type nonrec replica =
  {
  region_name: string option
    [@ocaml.doc "The Region where the replica needs to be created.\n"]}
[@@ocaml.doc "Represents the properties of a replica.\n"]
type nonrec query_output =
  {
  consumed_capacity: consumed_capacity option
    [@ocaml.doc
      "The capacity units consumed by the [Query] operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity] parameter was specified. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#read-operation-consumption}Capacity unit consumption for read operations} in the {i Amazon DynamoDB Developer Guide}.\n"];
  last_evaluated_key: key option
    [@ocaml.doc
      "The primary key of the item where the operation stopped, inclusive of the previous result set. Use this value to start a new operation, excluding this value in the new request.\n\n If [LastEvaluatedKey] is empty, then the \"last page\" of results has been processed and there is no more data to be retrieved.\n \n  If [LastEvaluatedKey] is not empty, it does not necessarily mean that there is more data in the result set. The only way to know when you have reached the end of the result set is when [LastEvaluatedKey] is empty.\n  "];
  scanned_count: int option
    [@ocaml.doc
      "The number of items evaluated, before any [QueryFilter] is applied. A high [ScannedCount] value with few, or no, [Count] results indicates an inefficient [Query] operation. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count}Count and ScannedCount} in the {i Amazon DynamoDB Developer Guide}.\n\n If you did not use a filter in the request, then [ScannedCount] is the same as [Count].\n "];
  count: int option
    [@ocaml.doc
      "The number of items in the response.\n\n If you used a [QueryFilter] in the request, then [Count] is the number of items returned after the filter was applied, and [ScannedCount] is the number of matching items before the filter was applied.\n \n  If you did not use a filter in the request, then [Count] and [ScannedCount] are the same.\n  "];
  items: attribute_map list option
    [@ocaml.doc
      "An array of item attributes that match the query criteria. Each element in this array consists of an attribute name and the value for that attribute.\n"]}
[@@ocaml.doc "Represents the output of a [Query] operation.\n"]
type nonrec key_conditions = (string * condition) list[@@ocaml.doc ""]
type nonrec query_input =
  {
  expression_attribute_values: expression_attribute_value_map option
    [@ocaml.doc
      "One or more values that can be substituted in an expression.\n\n Use the {b :} (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the {i ProductStatus} attribute was one of the following: \n \n   [Available | Backordered | Discontinued] \n  \n   You would first need to specify [ExpressionAttributeValues] as follows:\n   \n     [{ \":avail\":{\"S\":\"Available\"}, \":back\":{\"S\":\"Backordered\"},\n                \":disc\":{\"S\":\"Discontinued\"} }] \n    \n     You could then use these values in an expression, such as this:\n     \n       [ProductStatus IN (:avail, :back, :disc)] \n      \n       For more information on expression attribute values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html}Specifying Conditions} in the {i Amazon DynamoDB Developer Guide}.\n       "];
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in an expression. The following are some use cases for using [ExpressionAttributeNames]:\n\n {ul\n       {-  To access an attribute whose name conflicts with a DynamoDB reserved word.\n           \n            }\n       {-  To create a placeholder for repeating occurrences of an attribute name in an expression.\n           \n            }\n       {-  To prevent special characters in an attribute name from being misinterpreted in an expression.\n           \n            }\n       }\n   Use the {b #} character in an expression to dereference an attribute name. For example, consider the following attribute name:\n   \n    {ul\n          {-   [Percentile] \n              \n               }\n          }\n   The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html}Reserved Words} in the {i Amazon DynamoDB Developer Guide}). To work around this, you could specify the following for [ExpressionAttributeNames]:\n   \n    {ul\n          {-   [{\"#P\":\"Percentile\"}] \n              \n               }\n          }\n   You could then use this substitution in an expression, as in this example:\n   \n    {ul\n          {-   [#P = :val] \n              \n               }\n          }\n    Tokens that begin with the {b :} character are {i expression attribute values}, which are placeholders for the actual value at runtime.\n    \n      For more information on expression attribute names, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Specifying Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n      "];
  key_condition_expression: string option
    [@ocaml.doc
      "The condition that specifies the key values for items to be retrieved by the [Query] action.\n\n The condition must perform an equality test on a single partition key value.\n \n  The condition can optionally perform one of several comparison tests on a single sort key value. This allows [Query] to retrieve one item with a given partition key value and sort key value, or several items that have the same partition key value but different sort key values.\n  \n   The partition key equality test is required, and must be specified in the following format:\n   \n     [partitionKeyName] {i =} [:partitionkeyval] \n    \n     If you also want to provide a condition for the sort key, it must be combined using [AND] with the condition for the sort key. Following is an example, using the {b =} comparison operator for the sort key:\n     \n       [partitionKeyName] [=] [:partitionkeyval] [AND] [sortKeyName] [=] [:sortkeyval] \n      \n       Valid comparisons for the sort key condition are as follows:\n       \n        {ul\n              {-   [sortKeyName] [=] [:sortkeyval] - true if the sort key value is equal to [:sortkeyval].\n                  \n                   }\n              {-   [sortKeyName] [<] [:sortkeyval] - true if the sort key value is less than [:sortkeyval].\n                  \n                   }\n              {-   [sortKeyName] [<=] [:sortkeyval] - true if the sort key value is less than or equal to [:sortkeyval].\n                  \n                   }\n              {-   [sortKeyName] [>] [:sortkeyval] - true if the sort key value is greater than [:sortkeyval].\n                  \n                   }\n              {-   [sortKeyName] [>= ] [:sortkeyval] - true if the sort key value is greater than or equal to [:sortkeyval].\n                  \n                   }\n              {-   [sortKeyName] [BETWEEN] [:sortkeyval1] [AND] [:sortkeyval2] - true if the sort key value is greater than or equal to [:sortkeyval1], and less than or equal to [:sortkeyval2].\n                  \n                   }\n              {-   [begins_with (] [sortKeyName], [:sortkeyval] [)] - true if the sort key value begins with a particular operand. (You cannot use this function with a sort key that is of type Number.) Note that the function name [begins_with] is case-sensitive.\n                  \n                   }\n              }\n   Use the [ExpressionAttributeValues] parameter to replace tokens such as [:partitionval] and [:sortval] with actual values at runtime.\n   \n    You can optionally use the [ExpressionAttributeNames] parameter to replace the names of the partition key and sort key with placeholder tokens. This option might be necessary if an attribute name conflicts with a DynamoDB reserved word. For example, the following [KeyConditionExpression] parameter causes an error because {i Size} is a reserved word:\n    \n     {ul\n           {-   [Size = :myval] \n               \n                }\n           }\n   To work around this, define a placeholder (such a [#S]) to represent the attribute name {i Size}. [KeyConditionExpression] then is as follows:\n   \n    {ul\n          {-   [#S = :myval] \n              \n               }\n          }\n   For a list of reserved words, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html}Reserved Words} in the {i Amazon DynamoDB Developer Guide}.\n   \n    For more information on [ExpressionAttributeNames] and [ExpressionAttributeValues], see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html}Using Placeholders for Attribute Names and Values} in the {i Amazon DynamoDB Developer Guide}.\n    "];
  filter_expression: string option
    [@ocaml.doc
      "A string that contains conditions that DynamoDB applies after the [Query] operation, but before the data is returned to you. Items that do not satisfy the [FilterExpression] criteria are not returned.\n\n A [FilterExpression] does not allow key attributes. You cannot define a filter expression based on a partition key or a sort key.\n \n   A [FilterExpression] is applied after the items have already been read; the process of filtering does not consume any additional read capacity units.\n   \n     For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Query.FilterExpression.html}Filter Expressions} in the {i Amazon DynamoDB Developer Guide}.\n     "];
  projection_expression: string option
    [@ocaml.doc
      "A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.\n\n If no attribute names are specified, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.\n \n  For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Accessing Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n  "];
  return_consumed_capacity: return_consumed_capacity option [@ocaml.doc ""];
  exclusive_start_key: key option
    [@ocaml.doc
      "The primary key of the first item that this operation will evaluate. Use the value that was returned for [LastEvaluatedKey] in the previous operation.\n\n The data type for [ExclusiveStartKey] must be String, Number, or Binary. No set data types are allowed.\n "];
  scan_index_forward: bool option
    [@ocaml.doc
      "Specifies the order for index traversal: If [true] (default), the traversal is performed in ascending order; if [false], the traversal is performed in descending order. \n\n Items with the same partition key value are stored in sorted order by sort key. If the sort key data type is Number, the results are stored in numeric order. For type String, the results are stored in order of UTF-8 bytes. For type Binary, DynamoDB treats each byte of the binary data as unsigned.\n \n  If [ScanIndexForward] is [true], DynamoDB returns the results in the order in which they are stored (by sort key value). This is the default behavior. If [ScanIndexForward] is [false], DynamoDB reads the results in reverse order by sort key value, and then returns the results to the client.\n  "];
  conditional_operator: conditional_operator option
    [@ocaml.doc
      "This is a legacy parameter. Use [FilterExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html}ConditionalOperator} in the {i Amazon DynamoDB Developer Guide}.\n"];
  query_filter: filter_condition_map option
    [@ocaml.doc
      "This is a legacy parameter. Use [FilterExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.QueryFilter.html}QueryFilter} in the {i Amazon DynamoDB Developer Guide}.\n"];
  key_conditions: key_conditions option
    [@ocaml.doc
      "This is a legacy parameter. Use [KeyConditionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.KeyConditions.html}KeyConditions} in the {i Amazon DynamoDB Developer Guide}.\n"];
  consistent_read: bool option
    [@ocaml.doc
      "Determines the read consistency model: If set to [true], then the operation uses strongly consistent reads; otherwise, the operation uses eventually consistent reads.\n\n Strongly consistent reads are not supported on global secondary indexes. If you query a global secondary index with [ConsistentRead] set to [true], you will receive a [ValidationException].\n "];
  limit: int option
    [@ocaml.doc
      "The maximum number of items to evaluate (not necessarily the number of matching items). If DynamoDB processes the number of items up to the limit while processing the results, it stops the operation and returns the matching values up to that point, and a key in [LastEvaluatedKey] to apply in a subsequent operation, so that you can pick up where you left off. Also, if the processed dataset size exceeds 1 MB before DynamoDB reaches this limit, it stops the operation and returns the matching values up to the limit, and a key in [LastEvaluatedKey] to apply in a subsequent operation to continue the operation. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html}Query and Scan} in the {i Amazon DynamoDB Developer Guide}.\n"];
  attributes_to_get: string list option
    [@ocaml.doc
      "This is a legacy parameter. Use [ProjectionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html}AttributesToGet} in the {i Amazon DynamoDB Developer Guide}.\n"];
  select: select option
    [@ocaml.doc
      "The attributes to be returned in the result. You can retrieve all item attributes, specific item attributes, the count of matching items, or in the case of an index, some or all of the attributes projected into the index.\n\n {ul\n       {-   [ALL_ATTRIBUTES] - Returns all of the item attributes from the specified table or index. If you query a local secondary index, then for each matching item in the index, DynamoDB fetches the entire item from the parent table. If the index is configured to project all item attributes, then all of the data can be obtained from the local secondary index, and no fetching is required.\n           \n            }\n       {-   [ALL_PROJECTED_ATTRIBUTES] - Allowed only when querying an index. Retrieves all attributes that have been projected into the index. If the index is configured to project all attributes, this return value is equivalent to specifying [ALL_ATTRIBUTES].\n           \n            }\n       {-   [COUNT] - Returns the number of matching items, rather than the matching items themselves. Note that this uses the same quantity of read capacity units as getting the items, and is subject to the same item size calculations.\n           \n            }\n       {-   [SPECIFIC_ATTRIBUTES] - Returns only the attributes listed in [ProjectionExpression]. This return value is equivalent to specifying [ProjectionExpression] without specifying any value for [Select].\n           \n            If you query or scan a local secondary index and request only attributes that are projected into that index, the operation will read only the index and not the table. If any of the requested attributes are not projected into the local secondary index, DynamoDB fetches each of these attributes from the parent table. This extra fetching incurs additional throughput cost and latency.\n            \n             If you query or scan a global secondary index, you can only request attributes that are projected into the index. Global secondary index queries cannot fetch attributes from the parent table.\n             \n              }\n       }\n   If neither [Select] nor [ProjectionExpression] are specified, DynamoDB defaults to [ALL_ATTRIBUTES] when accessing a table, and [ALL_PROJECTED_ATTRIBUTES] when accessing an index. You cannot use both [Select] and [ProjectionExpression] together in a single request, unless the value for [Select] is [SPECIFIC_ATTRIBUTES]. (This usage is equivalent to specifying [ProjectionExpression] without any value for [Select].)\n   \n     If you use the [ProjectionExpression] parameter, then the value for [Select] can only be [SPECIFIC_ATTRIBUTES]. Any other value for [Select] will return an error.\n     \n      "];
  index_name: string option
    [@ocaml.doc
      "The name of an index to query. This index can be any local secondary index or global secondary index on the table. Note that if you use the [IndexName] parameter, you must also provide [TableName.] \n"];
  table_name: string
    [@ocaml.doc
      "The name of the table containing the requested items. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc "Represents the input of a [Query] operation.\n"]
type nonrec put_resource_policy_output =
  {
  revision_id: string option
    [@ocaml.doc
      "A unique string that represents the revision ID of the policy. If you're comparing revision IDs, make sure to always use string comparison logic.\n"]}
[@@ocaml.doc ""]
type nonrec put_resource_policy_input =
  {
  confirm_remove_self_resource_access: bool option
    [@ocaml.doc
      "Set this parameter to [true] to confirm that you want to remove your permissions to change the policy of this resource in the future.\n"];
  expected_revision_id: string option
    [@ocaml.doc
      "A string value that you can use to conditionally update your policy. You can provide the revision ID of your existing policy to make mutating requests against that policy.\n\n  When you provide an expected revision ID, if the revision ID of the existing policy on the resource doesn't match or if there's no policy attached to the resource, your request will be rejected with a [PolicyNotFoundException].\n  \n    To conditionally attach a policy when no policy exists for the resource, specify [NO_POLICY] for the revision ID.\n    "];
  policy: string
    [@ocaml.doc
      "An Amazon Web Services resource-based policy document in JSON format.\n\n {ul\n       {-  The maximum size supported for a resource-based policy document is 20 KB. DynamoDB counts whitespaces when calculating the size of a policy against this limit.\n           \n            }\n       {-  Within a resource-based policy, if the action for a DynamoDB service-linked role (SLR) to replicate data for a global table is denied, adding or deleting a replica will fail with an error.\n           \n            }\n       }\n   For a full list of all considerations that apply while attaching a resource-based policy, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/rbac-considerations.html}Resource-based policy considerations}.\n   "];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the DynamoDB resource to which the policy will be attached. The resources you can specify include tables and streams.\n\n You can control index permissions using the base table's policy. To specify the same permission level for your table and its indexes, you can provide both the table and index Amazon Resource Name (ARN)s in the [Resource] field of a given [Statement] in your policy document. Alternatively, to specify different permissions for your table, indexes, or both, you can define multiple [Statement] fields in your policy document.\n "]}
[@@ocaml.doc ""]
type nonrec policy_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation tried to access a nonexistent resource-based policy.\n\n If you specified an [ExpectedRevisionId], it's possible that a policy is present for the resource but its revision ID didn't match the expected value.\n "]
type nonrec put_item_output =
  {
  item_collection_metrics: item_collection_metrics option
    [@ocaml.doc
      "Information about item collections, if any, that were affected by the [PutItem] operation. [ItemCollectionMetrics] is only returned if the [ReturnItemCollectionMetrics] parameter was specified. If the table does not have any local secondary indexes, this information is not returned in the response.\n\n Each [ItemCollectionMetrics] element consists of:\n \n  {ul\n        {-   [ItemCollectionKey] - The partition key value of the item collection. This is the same as the partition key value of the item itself.\n            \n             }\n        {-   [SizeEstimateRangeGB] - An estimate of item collection size, in gigabytes. This value is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on that table. Use this estimate to measure whether a local secondary index is approaching its size limit.\n            \n             The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.\n             \n              }\n        }\n  "];
  consumed_capacity: consumed_capacity option
    [@ocaml.doc
      "The capacity units consumed by the [PutItem] operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity] parameter was specified. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#write-operation-consumption}Capacity unity consumption for write operations} in the {i Amazon DynamoDB Developer Guide}.\n"];
  attributes: attribute_map option
    [@ocaml.doc
      "The attribute values as they appeared before the [PutItem] operation, but only if [ReturnValues] is specified as [ALL_OLD] in the request. Each element consists of an attribute name and an attribute value.\n"]}
[@@ocaml.doc "Represents the output of a [PutItem] operation.\n"]
type nonrec put_item_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option
    [@ocaml.doc
      "An optional parameter that returns the item attributes for a [PutItem] operation that failed a condition check.\n\n There is no additional cost associated with requesting a return value aside from the small network and processing overhead of receiving a larger response. No read capacity units are consumed.\n "];
  expression_attribute_values: expression_attribute_value_map option
    [@ocaml.doc
      "One or more values that can be substituted in an expression.\n\n Use the {b :} (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the {i ProductStatus} attribute was one of the following: \n \n   [Available | Backordered | Discontinued] \n  \n   You would first need to specify [ExpressionAttributeValues] as follows:\n   \n     [{ \":avail\":{\"S\":\"Available\"}, \":back\":{\"S\":\"Backordered\"},\n                \":disc\":{\"S\":\"Discontinued\"} }] \n    \n     You could then use these values in an expression, such as this:\n     \n       [ProductStatus IN (:avail, :back, :disc)] \n      \n       For more information on expression attribute values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html}Condition Expressions} in the {i Amazon DynamoDB Developer Guide}.\n       "];
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in an expression. The following are some use cases for using [ExpressionAttributeNames]:\n\n {ul\n       {-  To access an attribute whose name conflicts with a DynamoDB reserved word.\n           \n            }\n       {-  To create a placeholder for repeating occurrences of an attribute name in an expression.\n           \n            }\n       {-  To prevent special characters in an attribute name from being misinterpreted in an expression.\n           \n            }\n       }\n   Use the {b #} character in an expression to dereference an attribute name. For example, consider the following attribute name:\n   \n    {ul\n          {-   [Percentile] \n              \n               }\n          }\n   The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html}Reserved Words} in the {i Amazon DynamoDB Developer Guide}). To work around this, you could specify the following for [ExpressionAttributeNames]:\n   \n    {ul\n          {-   [{\"#P\":\"Percentile\"}] \n              \n               }\n          }\n   You could then use this substitution in an expression, as in this example:\n   \n    {ul\n          {-   [#P = :val] \n              \n               }\n          }\n    Tokens that begin with the {b :} character are {i expression attribute values}, which are placeholders for the actual value at runtime.\n    \n      For more information on expression attribute names, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Specifying Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n      "];
  condition_expression: string option
    [@ocaml.doc
      "A condition that must be satisfied in order for a conditional [PutItem] operation to succeed.\n\n An expression can contain any of the following:\n \n  {ul\n        {-  Functions: [attribute_exists | attribute_not_exists | attribute_type |\n                        contains | begins_with | size] \n            \n             These function names are case-sensitive.\n             \n              }\n        {-  Comparison operators: [= | <> |\n            < | > | <= | >= |\n            BETWEEN | IN ] \n            \n             }\n        {-   Logical operators: [AND | OR | NOT] \n            \n             }\n        }\n   For more information on condition expressions, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html}Condition Expressions} in the {i Amazon DynamoDB Developer Guide}.\n   "];
  conditional_operator: conditional_operator option
    [@ocaml.doc
      "This is a legacy parameter. Use [ConditionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html}ConditionalOperator} in the {i Amazon DynamoDB Developer Guide}.\n"];
  return_item_collection_metrics: return_item_collection_metrics option
    [@ocaml.doc
      "Determines whether item collection metrics are returned. If set to [SIZE], the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to [NONE] (the default), no statistics are returned.\n"];
  return_consumed_capacity: return_consumed_capacity option [@ocaml.doc ""];
  return_values: return_value option
    [@ocaml.doc
      "Use [ReturnValues] if you want to get the item attributes as they appeared before they were updated with the [PutItem] request. For [PutItem], the valid values are:\n\n {ul\n       {-   [NONE] - If [ReturnValues] is not specified, or if its value is [NONE], then nothing is returned. (This setting is the default for [ReturnValues].)\n           \n            }\n       {-   [ALL_OLD] - If [PutItem] overwrote an attribute name-value pair, then the content of the old item is returned.\n           \n            }\n       }\n   The values returned are strongly consistent.\n   \n    There is no additional cost associated with requesting a return value aside from the small network and processing overhead of receiving a larger response. No read capacity units are consumed.\n    \n      The [ReturnValues] parameter is used by several DynamoDB operations; however, [PutItem] does not recognize any values other than [NONE] or [ALL_OLD].\n      \n       "];
  expected: expected_attribute_map option
    [@ocaml.doc
      "This is a legacy parameter. Use [ConditionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html}Expected} in the {i Amazon DynamoDB Developer Guide}.\n"];
  item: put_item_input_attribute_map
    [@ocaml.doc
      "A map of attribute name/value pairs, one for each attribute. Only the primary key attributes are required; you can optionally provide other attribute name-value pairs for the item.\n\n You must provide all of the attributes for the primary key. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide both values for both the partition key and the sort key.\n \n  If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.\n  \n   Empty String and Binary attribute values are allowed. Attribute values of type String and Binary must have a length greater than zero if the attribute is used as a key attribute for a table or index.\n   \n    For more information about primary keys, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.CoreComponents.html#HowItWorks.CoreComponents.PrimaryKey}Primary Key} in the {i Amazon DynamoDB Developer Guide}.\n    \n     Each element in the [Item] map is an [AttributeValue] object.\n     "];
  table_name: string
    [@ocaml.doc
      "The name of the table to contain the item. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc "Represents the input of a [PutItem] operation.\n"]
type nonrec batch_statement_error_code_enum =
  | DuplicateItem [@ocaml.doc ""]
  | AccessDenied [@ocaml.doc ""]
  | ResourceNotFound [@ocaml.doc ""]
  | InternalServerError [@ocaml.doc ""]
  | ThrottlingError [@ocaml.doc ""]
  | TransactionConflict [@ocaml.doc ""]
  | ProvisionedThroughputExceeded [@ocaml.doc ""]
  | ValidationError [@ocaml.doc ""]
  | RequestLimitExceeded [@ocaml.doc ""]
  | ItemCollectionSizeLimitExceeded [@ocaml.doc ""]
  | ConditionalCheckFailed [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec batch_statement_error =
  {
  item: attribute_map option
    [@ocaml.doc
      "The item which caused the condition check to fail. This will be set if ReturnValuesOnConditionCheckFailure is specified as [ALL_OLD].\n"];
  message: string option
    [@ocaml.doc
      " The error message associated with the PartiQL batch response. \n"];
  code: batch_statement_error_code_enum option
    [@ocaml.doc
      " The error code associated with the failed PartiQL batch statement. \n"]}
[@@ocaml.doc
  " An error associated with a statement in a PartiQL batch that was run. \n"]
type nonrec batch_statement_response =
  {
  item: attribute_map option
    [@ocaml.doc
      " A DynamoDB item associated with a BatchStatementResponse \n"];
  table_name: string option
    [@ocaml.doc
      " The table name associated with a failed PartiQL batch statement. \n"];
  error: batch_statement_error option
    [@ocaml.doc
      " The error associated with a failed PartiQL batch statement. \n"]}
[@@ocaml.doc " A PartiQL batch statement response.. \n"]
type nonrec batch_statement_request =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option
    [@ocaml.doc
      "An optional parameter that returns the item attributes for a PartiQL batch request operation that failed a condition check.\n\n There is no additional cost associated with requesting a return value aside from the small network and processing overhead of receiving a larger response. No read capacity units are consumed.\n "];
  consistent_read: bool option
    [@ocaml.doc " The read consistency of the PartiQL batch request. \n"];
  parameters: attribute_value list option
    [@ocaml.doc
      " The parameters associated with a PartiQL statement in the batch request. \n"];
  statement: string [@ocaml.doc " A valid PartiQL statement. \n"]}[@@ocaml.doc
                                                                    " A PartiQL batch statement request. \n"]
type nonrec parameterized_statement =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option
    [@ocaml.doc
      "An optional parameter that returns the item attributes for a PartiQL [ParameterizedStatement] operation that failed a condition check.\n\n There is no additional cost associated with requesting a return value aside from the small network and processing overhead of receiving a larger response. No read capacity units are consumed.\n "];
  parameters: attribute_value list option
    [@ocaml.doc " The parameter values. \n"];
  statement: string
    [@ocaml.doc " A PartiQL statement that uses parameters. \n"]}[@@ocaml.doc
                                                                   " Represents a PartiQL statement that uses parameters. \n"]
type nonrec list_tags_of_resource_output =
  {
  next_token: string option
    [@ocaml.doc
      "If this value is returned, there are additional results to be displayed. To retrieve them, call ListTagsOfResource again, with NextToken set to this value.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tags currently associated with the Amazon DynamoDB resource.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_of_resource_input =
  {
  next_token: string option
    [@ocaml.doc
      "An optional string that, if supplied, must be copied from the output of a previous call to ListTagOfResource. When provided in this manner, this API fetches the next page of results.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon DynamoDB resource with tags to be listed. This value is an Amazon Resource Name (ARN).\n"]}
[@@ocaml.doc ""]
type nonrec list_tables_output =
  {
  last_evaluated_table_name: string option
    [@ocaml.doc
      "The name of the last table in the current page of results. Use this value as the [ExclusiveStartTableName] in a new request to obtain the next page of results, until all the table names are returned.\n\n If you do not receive a [LastEvaluatedTableName] value in the response, this means that there are no more table names to be retrieved.\n "];
  table_names: string list option
    [@ocaml.doc
      "The names of the tables associated with the current account at the current endpoint. The maximum size of this array is 100.\n\n If [LastEvaluatedTableName] also appears in the output, you can use this value as the [ExclusiveStartTableName] parameter in a subsequent [ListTables] request and obtain the next page of results.\n "]}
[@@ocaml.doc "Represents the output of a [ListTables] operation.\n"]
type nonrec list_tables_input =
  {
  limit: int option
    [@ocaml.doc
      "A maximum number of table names to return. If this parameter is not specified, the limit is 100.\n"];
  exclusive_start_table_name: string option
    [@ocaml.doc
      "The first table name that this operation will evaluate. Use the value that was returned for [LastEvaluatedTableName] in a previous operation, so that you can obtain the next page of results.\n"]}
[@@ocaml.doc "Represents the input of a [ListTables] operation.\n"]
type nonrec import_status =
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | CANCELLING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec input_format =
  | CSV [@ocaml.doc ""]
  | ION [@ocaml.doc ""]
  | DYNAMODB_JSON [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec import_summary =
  {
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The time at which this import task ended. (Does this include the successful complete creation of the table it was imported to?) \n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc " The time at which this import task began. \n"];
  input_format: input_format option
    [@ocaml.doc
      " The format of the source data. Valid values are [CSV], [DYNAMODB_JSON] or [ION].\n"];
  cloud_watch_log_group_arn: string option
    [@ocaml.doc
      " The Amazon Resource Number (ARN) of the Cloudwatch Log Group associated with this import task. \n"];
  s3_bucket_source: s3_bucket_source option
    [@ocaml.doc
      " The path and S3 bucket of the source file that is being imported. This includes the S3Bucket (required), S3KeyPrefix (optional) and S3BucketOwner (optional if the bucket is owned by the requester). \n"];
  table_arn: string option
    [@ocaml.doc
      " The Amazon Resource Number (ARN) of the table being imported into. \n"];
  import_status: import_status option
    [@ocaml.doc " The status of the import operation. \n"];
  import_arn: string option
    [@ocaml.doc
      " The Amazon Resource Number (ARN) corresponding to the import request. \n"]}
[@@ocaml.doc " Summary information about the source file for the import. \n"]
type nonrec list_imports_output =
  {
  next_token: string option
    [@ocaml.doc
      " If this value is returned, there are additional results to be displayed. To retrieve them, call [ListImports] again, with [NextToken] set to this value. \n"];
  import_summary_list: import_summary list option
    [@ocaml.doc " A list of [ImportSummary] objects. \n"]}[@@ocaml.doc ""]
type nonrec list_imports_input =
  {
  next_token: string option
    [@ocaml.doc
      " An optional string that, if supplied, must be copied from the output of a previous call to [ListImports]. When provided in this manner, the API fetches the next page of results. \n"];
  page_size: int option
    [@ocaml.doc
      " The number of [ImportSummary ]objects returned in a single page. \n"];
  table_arn: string option
    [@ocaml.doc
      " The Amazon Resource Name (ARN) associated with the table that was imported to. \n"]}
[@@ocaml.doc ""]
type nonrec global_table =
  {
  replication_group: replica list option
    [@ocaml.doc "The Regions where the global table has replicas.\n"];
  global_table_name: string option [@ocaml.doc "The global table name.\n"]}
[@@ocaml.doc "Represents the properties of a global table.\n"]
type nonrec list_global_tables_output =
  {
  last_evaluated_global_table_name: string option
    [@ocaml.doc "Last evaluated global table name.\n"];
  global_tables: global_table list option
    [@ocaml.doc "List of global table names.\n"]}[@@ocaml.doc ""]
type nonrec list_global_tables_input =
  {
  region_name: string option
    [@ocaml.doc "Lists the global tables in a specific Region.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of table names to return, if the parameter is not specified DynamoDB defaults to 100.\n\n If the number of global tables DynamoDB finds reaches this limit, it stops the operation and returns the table names collected up to that point, with a table name in the [LastEvaluatedGlobalTableName] to apply in a subsequent operation to the [ExclusiveStartGlobalTableName] parameter.\n "];
  exclusive_start_global_table_name: string option
    [@ocaml.doc
      "The first global table name that this operation will evaluate.\n"]}
[@@ocaml.doc ""]
type nonrec export_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec export_type =
  | INCREMENTAL_EXPORT [@ocaml.doc ""]
  | FULL_EXPORT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec export_summary =
  {
  export_type: export_type option
    [@ocaml.doc
      "The type of export that was performed. Valid values are [FULL_EXPORT] or [INCREMENTAL_EXPORT].\n"];
  export_status: export_status option
    [@ocaml.doc
      "Export can be in one of the following states: IN_PROGRESS, COMPLETED, or FAILED.\n"];
  export_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the export.\n"]}[@@ocaml.doc
                                                                    "Summary information about an export task.\n"]
type nonrec list_exports_output =
  {
  next_token: string option
    [@ocaml.doc
      "If this value is returned, there are additional results to be displayed. To retrieve them, call [ListExports] again, with [NextToken] set to this value.\n"];
  export_summaries: export_summary list option
    [@ocaml.doc "A list of [ExportSummary] objects.\n"]}[@@ocaml.doc ""]
type nonrec list_exports_input =
  {
  next_token: string option
    [@ocaml.doc
      "An optional string that, if supplied, must be copied from the output of a previous call to [ListExports]. When provided in this manner, the API fetches the next page of results.\n"];
  max_results: int option
    [@ocaml.doc "Maximum number of results to return per page.\n"];
  table_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) associated with the exported table.\n"]}
[@@ocaml.doc ""]
type nonrec contributor_insights_summary =
  {
  contributor_insights_status: contributor_insights_status option
    [@ocaml.doc
      "Describes the current status for contributor insights for the given table and index, if applicable.\n"];
  index_name: string option
    [@ocaml.doc "Name of the index associated with the summary, if any.\n"];
  table_name: string option
    [@ocaml.doc "Name of the table associated with the summary.\n"]}[@@ocaml.doc
                                                                    "Represents a Contributor Insights summary entry.\n"]
type nonrec list_contributor_insights_output =
  {
  next_token: string option
    [@ocaml.doc "A token to go to the next page if there is one.\n"];
  contributor_insights_summaries: contributor_insights_summary list option
    [@ocaml.doc "A list of ContributorInsightsSummary.\n"]}[@@ocaml.doc ""]
type nonrec list_contributor_insights_input =
  {
  max_results: int option
    [@ocaml.doc "Maximum number of results to return per page.\n"];
  next_token: string option
    [@ocaml.doc "A token to for the desired page, if there is one.\n"];
  table_name: string option
    [@ocaml.doc
      "The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc ""]
type nonrec backup_status =
  | AVAILABLE [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec backup_type =
  | AWS_BACKUP [@ocaml.doc ""]
  | SYSTEM [@ocaml.doc ""]
  | USER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec backup_summary =
  {
  backup_size_bytes: int option [@ocaml.doc "Size of the backup in bytes.\n"];
  backup_type: backup_type option
    [@ocaml.doc
      "BackupType:\n\n {ul\n       {-   [USER] - You create and manage these using the on-demand backup feature.\n           \n            }\n       {-   [SYSTEM] - If you delete a table with point-in-time recovery enabled, a [SYSTEM] backup is automatically created and is retained for 35 days (at no additional cost). System backups allow you to restore the deleted table to the state it was in just before the point of deletion. \n           \n            }\n       {-   [AWS_BACKUP] - On-demand backup created by you from Backup service.\n           \n            }\n       }\n  "];
  backup_status: backup_status option
    [@ocaml.doc
      "Backup can be in one of the following states: CREATING, ACTIVE, DELETED.\n"];
  backup_expiry_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Time at which the automatic on-demand backup created by DynamoDB will expire. This [SYSTEM] on-demand backup expires automatically 35 days after its creation.\n"];
  backup_creation_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "Time at which the backup was created.\n"];
  backup_name: string option [@ocaml.doc "Name of the specified backup.\n"];
  backup_arn: string option [@ocaml.doc "ARN associated with the backup.\n"];
  table_arn: string option [@ocaml.doc "ARN associated with the table.\n"];
  table_id: string option [@ocaml.doc "Unique identifier for the table.\n"];
  table_name: string option [@ocaml.doc "Name of the table.\n"]}[@@ocaml.doc
                                                                  "Contains details for the backup.\n"]
type nonrec list_backups_output =
  {
  last_evaluated_backup_arn: string option
    [@ocaml.doc
      " The ARN of the backup last evaluated when the current page of results was returned, inclusive of the current page of results. This value may be specified as the [ExclusiveStartBackupArn] of a new [ListBackups] operation in order to fetch the next page of results. \n\n  If [LastEvaluatedBackupArn] is empty, then the last page of results has been processed and there are no more results to be retrieved. \n \n   If [LastEvaluatedBackupArn] is not empty, this may or may not indicate that there is more data to be returned. All results are guaranteed to have been returned if and only if no value for [LastEvaluatedBackupArn] is returned. \n  "];
  backup_summaries: backup_summary list option
    [@ocaml.doc "List of [BackupSummary] objects.\n"]}[@@ocaml.doc ""]
type nonrec backup_type_filter =
  | ALL [@ocaml.doc ""]
  | AWS_BACKUP [@ocaml.doc ""]
  | SYSTEM [@ocaml.doc ""]
  | USER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_backups_input =
  {
  backup_type: backup_type_filter option
    [@ocaml.doc
      "The backups from the table specified by [BackupType] are listed.\n\n Where [BackupType] can be:\n \n  {ul\n        {-   [USER] - On-demand backup created by you. (The default setting if no other backup types are specified.)\n            \n             }\n        {-   [SYSTEM] - On-demand backup automatically created by DynamoDB.\n            \n             }\n        {-   [ALL] - All types of on-demand backups (USER and SYSTEM).\n            \n             }\n        }\n  "];
  exclusive_start_backup_arn: string option
    [@ocaml.doc
      " [LastEvaluatedBackupArn] is the Amazon Resource Name (ARN) of the backup last evaluated when the current page of results was returned, inclusive of the current page of results. This value may be specified as the [ExclusiveStartBackupArn] of a new [ListBackups] operation in order to fetch the next page of results. \n"];
  time_range_upper_bound: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Only backups created before this time are listed. [TimeRangeUpperBound] is exclusive. \n"];
  time_range_lower_bound: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Only backups created after this time are listed. [TimeRangeLowerBound] is inclusive.\n"];
  limit: int option
    [@ocaml.doc "Maximum number of backups to return at once.\n"];
  table_name: string option
    [@ocaml.doc
      "Lists the backups from the table specified in [TableName]. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc ""]
type nonrec enable_kinesis_streaming_configuration =
  {
  approximate_creation_date_time_precision:
    approximate_creation_date_time_precision option
    [@ocaml.doc
      "Toggle for the precision of Kinesis data stream timestamp. The values are either [MILLISECOND] or [MICROSECOND].\n"]}
[@@ocaml.doc "Enables setting the configuration for Kinesis Streaming.\n"]
type nonrec kinesis_streaming_destination_output =
  {
  enable_kinesis_streaming_configuration:
    enable_kinesis_streaming_configuration option
    [@ocaml.doc
      "The destination for the Kinesis streaming information that is being enabled.\n"];
  destination_status: destination_status option
    [@ocaml.doc "The current status of the replication.\n"];
  stream_arn: string option
    [@ocaml.doc "The ARN for the specific Kinesis data stream.\n"];
  table_name: string option
    [@ocaml.doc "The name of the table being modified.\n"]}[@@ocaml.doc ""]
type nonrec kinesis_streaming_destination_input =
  {
  enable_kinesis_streaming_configuration:
    enable_kinesis_streaming_configuration option
    [@ocaml.doc
      "The source for the Kinesis streaming information that is being enabled.\n"];
  stream_arn: string [@ocaml.doc "The ARN for a Kinesis data stream.\n"];
  table_name: string
    [@ocaml.doc
      "The name of the DynamoDB table. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc ""]
type nonrec kinesis_data_stream_destination =
  {
  approximate_creation_date_time_precision:
    approximate_creation_date_time_precision option
    [@ocaml.doc
      "The precision of the Kinesis data stream timestamp. The values are either [MILLISECOND] or [MICROSECOND].\n"];
  destination_status_description: string option
    [@ocaml.doc
      "The human-readable string that corresponds to the replica status.\n"];
  destination_status: destination_status option
    [@ocaml.doc "The current status of replication.\n"];
  stream_arn: string option
    [@ocaml.doc "The ARN for a specific Kinesis data stream.\n"]}[@@ocaml.doc
                                                                   "Describes a Kinesis data stream destination.\n"]
type nonrec keys_and_attributes =
  {
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in an expression. The following are some use cases for using [ExpressionAttributeNames]:\n\n {ul\n       {-  To access an attribute whose name conflicts with a DynamoDB reserved word.\n           \n            }\n       {-  To create a placeholder for repeating occurrences of an attribute name in an expression.\n           \n            }\n       {-  To prevent special characters in an attribute name from being misinterpreted in an expression.\n           \n            }\n       }\n   Use the {b #} character in an expression to dereference an attribute name. For example, consider the following attribute name:\n   \n    {ul\n          {-   [Percentile] \n              \n               }\n          }\n   The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html}Reserved Words} in the {i Amazon DynamoDB Developer Guide}). To work around this, you could specify the following for [ExpressionAttributeNames]:\n   \n    {ul\n          {-   [{\"#P\":\"Percentile\"}] \n              \n               }\n          }\n   You could then use this substitution in an expression, as in this example:\n   \n    {ul\n          {-   [#P = :val] \n              \n               }\n          }\n    Tokens that begin with the {b :} character are {i expression attribute values}, which are placeholders for the actual value at runtime.\n    \n      For more information on expression attribute names, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Accessing Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n      "];
  projection_expression: string option
    [@ocaml.doc
      "A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the [ProjectionExpression] must be separated by commas.\n\n If no attribute names are specified, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.\n \n  For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Accessing Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n  "];
  consistent_read: bool option
    [@ocaml.doc
      "The consistency of a read operation. If set to [true], then a strongly consistent read is used; otherwise, an eventually consistent read is used.\n"];
  attributes_to_get: string list option
    [@ocaml.doc
      "This is a legacy parameter. Use [ProjectionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html}Legacy Conditional Parameters} in the {i Amazon DynamoDB Developer Guide}.\n"];
  keys: key list
    [@ocaml.doc
      "The primary key attribute values that define the items and the attributes associated with the items.\n"]}
[@@ocaml.doc
  "Represents a set of primary keys and, for each key, the attributes to retrieve from the table.\n\n For each primary key, you must provide {i all} of the key attributes. For example, with a simple primary key, you only need to provide the partition key. For a composite primary key, you must provide {i both} the partition key and the sort key.\n "]
type nonrec invalid_export_time_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified [ExportTime] is outside of the point in time recovery window.\n"]
type nonrec csv_options =
  {
  header_list: string list option
    [@ocaml.doc
      " List of the headers used to specify a common header for all source CSV files being imported. If this field is specified then the first line of each CSV file is treated as data instead of the header. If this field is not specified the the first line of each CSV file is treated as the header. \n"];
  delimiter: string option
    [@ocaml.doc
      " The delimiter used for separating items in the CSV file being imported. \n"]}
[@@ocaml.doc " Processing options for the CSV file being imported. \n"]
type nonrec input_format_options =
  {
  csv: csv_options option
    [@ocaml.doc
      " The options for imported source files in CSV format. The values are Delimiter and HeaderList. \n"]}
[@@ocaml.doc
  " The format options for the data that was imported into the target table. There is one value, CsvOption.\n"]
type nonrec input_compression_type =
  | NONE [@ocaml.doc ""]
  | ZSTD [@ocaml.doc ""]
  | GZIP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec export_view_type =
  | NEW_AND_OLD_IMAGES [@ocaml.doc ""]
  | NEW_IMAGE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec incremental_export_specification =
  {
  export_view_type: export_view_type option
    [@ocaml.doc
      "The view type that was chosen for the export. Valid values are [NEW_AND_OLD_IMAGES] and [NEW_IMAGES]. The default value is [NEW_AND_OLD_IMAGES].\n"];
  export_to_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Time in the past which provides the exclusive end range for the export table's data, counted in seconds from the start of the Unix epoch. The incremental export will reflect the table's state just prior to this point in time. If this is not provided, the latest time with data available will be used.\n"];
  export_from_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Time in the past which provides the inclusive start range for the export table's data, counted in seconds from the start of the Unix epoch. The incremental export will reflect the table's state including and after this point in time.\n"]}
[@@ocaml.doc
  "Optional object containing the parameters specific to an incremental export.\n"]
type nonrec import_table_description =
  {
  failure_message: string option
    [@ocaml.doc
      " The error message corresponding to the failure that the import job ran into during execution. \n"];
  failure_code: string option
    [@ocaml.doc
      " The error code corresponding to the failure that the import job ran into during execution. \n"];
  imported_item_count: int option
    [@ocaml.doc
      " The number of items successfully imported into the new table. \n"];
  processed_item_count: int option
    [@ocaml.doc
      " The total number of items processed from the source file. \n"];
  processed_size_bytes: int option
    [@ocaml.doc
      " The total size of data processed from the source file, in Bytes. \n"];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The time at which the creation of the table associated with this import task completed. \n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc " The time when this import task started. \n"];
  table_creation_parameters: table_creation_parameters option
    [@ocaml.doc
      " The parameters for the new table that is being imported into. \n"];
  input_compression_type: input_compression_type option
    [@ocaml.doc
      " The compression options for the data that has been imported into the target table. The values are NONE, GZIP, or ZSTD. \n"];
  input_format_options: input_format_options option
    [@ocaml.doc
      " The format options for the data that was imported into the target table. There is one value, CsvOption. \n"];
  input_format: input_format option
    [@ocaml.doc
      " The format of the source data going into the target table. \n"];
  cloud_watch_log_group_arn: string option
    [@ocaml.doc
      " The Amazon Resource Number (ARN) of the Cloudwatch Log Group associated with the target table. \n"];
  error_count: int option
    [@ocaml.doc
      " The number of errors occurred on importing the source file into the target table. \n"];
  s3_bucket_source: s3_bucket_source option
    [@ocaml.doc
      " Values for the S3 bucket the source file is imported from. Includes bucket name (required), key prefix (optional) and bucket account owner ID (optional). \n"];
  client_token: string option
    [@ocaml.doc
      " The client token that was provided for the import task. Reusing the client token on retry makes a call to [ImportTable] idempotent. \n"];
  table_id: string option
    [@ocaml.doc
      " The table id corresponding to the table created by import table process. \n"];
  table_arn: string option
    [@ocaml.doc
      " The Amazon Resource Number (ARN) of the table being imported into. \n"];
  import_status: import_status option
    [@ocaml.doc " The status of the import. \n"];
  import_arn: string option
    [@ocaml.doc
      " The Amazon Resource Number (ARN) corresponding to the import request. \n"]}
[@@ocaml.doc
  " Represents the properties of the table being imported into. \n"]
type nonrec import_table_output =
  {
  import_table_description: import_table_description
    [@ocaml.doc
      " Represents the properties of the table created for the import, and parameters of the import. The import parameters include import status, how many items were processed, and how many errors were encountered. \n"]}
[@@ocaml.doc ""]
type nonrec import_table_input =
  {
  table_creation_parameters: table_creation_parameters
    [@ocaml.doc "Parameters for the table to import the data into. \n"];
  input_compression_type: input_compression_type option
    [@ocaml.doc
      " Type of compression to be used on the input coming from the imported table. \n"];
  input_format_options: input_format_options option
    [@ocaml.doc
      " Additional properties that specify how the input is formatted, \n"];
  input_format: input_format
    [@ocaml.doc
      " The format of the source data. Valid values for [ImportFormat] are [CSV], [DYNAMODB_JSON] or [ION]. \n"];
  s3_bucket_source: s3_bucket_source
    [@ocaml.doc " The S3 bucket that provides the source for the import. \n"];
  client_token: string option
    [@ocaml.doc
      "Providing a [ClientToken] makes the call to [ImportTableInput] idempotent, meaning that multiple identical calls have the same effect as one single call.\n\n A client token is valid for 8 hours after the first request that uses it is completed. After 8 hours, any request with the same client token is treated as a new request. Do not resubmit the same request with the same client token for more than 8 hours, or the result might not be idempotent.\n \n  If you submit a request with the same client token but a change in other parameters within the 8-hour idempotency window, DynamoDB returns an [IdempotentParameterMismatch] exception.\n  "]}
[@@ocaml.doc ""]
type nonrec import_conflict_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           " There was a conflict when importing from the specified S3 source. This can occur when the current import conflicts with a previous import request that had the same client token. \n"]
type nonrec import_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           " The specified import was not found. \n"]
type nonrec global_table_already_exists_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified global table already exists.\n"]
type nonrec get_resource_policy_output =
  {
  revision_id: string option
    [@ocaml.doc
      "A unique string that represents the revision ID of the policy. If you're comparing revision IDs, make sure to always use string comparison logic.\n"];
  policy: string option
    [@ocaml.doc
      "The resource-based policy document attached to the resource, which can be a table or stream, in JSON format.\n"]}
[@@ocaml.doc ""]
type nonrec get_resource_policy_input =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the DynamoDB resource to which the policy is attached. The resources you can specify include tables and streams.\n"]}
[@@ocaml.doc ""]
type nonrec get_item_output =
  {
  consumed_capacity: consumed_capacity option
    [@ocaml.doc
      "The capacity units consumed by the [GetItem] operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity] parameter was specified. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#read-operation-consumption}Capacity unit consumption for read operations} in the {i Amazon DynamoDB Developer Guide}.\n"];
  item: attribute_map option
    [@ocaml.doc
      "A map of attribute names to [AttributeValue] objects, as specified by [ProjectionExpression].\n"]}
[@@ocaml.doc "Represents the output of a [GetItem] operation.\n"]
type nonrec get_item_input =
  {
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in an expression. The following are some use cases for using [ExpressionAttributeNames]:\n\n {ul\n       {-  To access an attribute whose name conflicts with a DynamoDB reserved word.\n           \n            }\n       {-  To create a placeholder for repeating occurrences of an attribute name in an expression.\n           \n            }\n       {-  To prevent special characters in an attribute name from being misinterpreted in an expression.\n           \n            }\n       }\n   Use the {b #} character in an expression to dereference an attribute name. For example, consider the following attribute name:\n   \n    {ul\n          {-   [Percentile] \n              \n               }\n          }\n   The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html}Reserved Words} in the {i Amazon DynamoDB Developer Guide}). To work around this, you could specify the following for [ExpressionAttributeNames]:\n   \n    {ul\n          {-   [{\"#P\":\"Percentile\"}] \n              \n               }\n          }\n   You could then use this substitution in an expression, as in this example:\n   \n    {ul\n          {-   [#P = :val] \n              \n               }\n          }\n    Tokens that begin with the {b :} character are {i expression attribute values}, which are placeholders for the actual value at runtime.\n    \n      For more information on expression attribute names, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Specifying Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n      "];
  projection_expression: string option
    [@ocaml.doc
      "A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.\n\n If no attribute names are specified, then all attributes are returned. If any of the requested attributes are not found, they do not appear in the result.\n \n  For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Specifying Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n  "];
  return_consumed_capacity: return_consumed_capacity option [@ocaml.doc ""];
  consistent_read: bool option
    [@ocaml.doc
      "Determines the read consistency model: If set to [true], then the operation uses strongly consistent reads; otherwise, the operation uses eventually consistent reads.\n"];
  attributes_to_get: string list option
    [@ocaml.doc
      "This is a legacy parameter. Use [ProjectionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html}AttributesToGet} in the {i Amazon DynamoDB Developer Guide}.\n"];
  key: key
    [@ocaml.doc
      "A map of attribute names to [AttributeValue] objects, representing the primary key of the item to retrieve.\n\n For the primary key, you must provide all of the attributes. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide values for both the partition key and the sort key.\n "];
  table_name: string
    [@ocaml.doc
      "The name of the table containing the requested item. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc "Represents the input of a [GetItem] operation.\n"]
type nonrec failure_exception =
  {
  exception_description: string option
    [@ocaml.doc "Description of the failure.\n"];
  exception_name: string option [@ocaml.doc "Exception name.\n"]}[@@ocaml.doc
                                                                   "Represents a failure a contributor insights operation.\n"]
type nonrec export_format =
  | ION [@ocaml.doc ""]
  | DYNAMODB_JSON [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec export_description =
  {
  incremental_export_specification: incremental_export_specification option
    [@ocaml.doc
      "Optional object containing the parameters specific to an incremental export.\n"];
  export_type: export_type option
    [@ocaml.doc
      "The type of export that was performed. Valid values are [FULL_EXPORT] or [INCREMENTAL_EXPORT].\n"];
  item_count: int option [@ocaml.doc "The number of items exported.\n"];
  billed_size_bytes: int option
    [@ocaml.doc "The billable size of the table export.\n"];
  export_format: export_format option
    [@ocaml.doc
      "The format of the exported data. Valid values for [ExportFormat] are [DYNAMODB_JSON] or [ION].\n"];
  failure_message: string option
    [@ocaml.doc "Export failure reason description.\n"];
  failure_code: string option
    [@ocaml.doc "Status code for the result of the failed export.\n"];
  s3_sse_kms_key_id: string option
    [@ocaml.doc
      "The ID of the KMS managed key used to encrypt the S3 bucket where export data is stored (if applicable).\n"];
  s3_sse_algorithm: s3_sse_algorithm option
    [@ocaml.doc
      "Type of encryption used on the bucket where export data is stored. Valid values for [S3SseAlgorithm] are:\n\n {ul\n       {-   [AES256] - server-side encryption with Amazon S3 managed keys\n           \n            }\n       {-   [KMS] - server-side encryption with KMS managed keys\n           \n            }\n       }\n  "];
  s3_prefix: string option
    [@ocaml.doc
      "The Amazon S3 bucket prefix used as the file name and path of the exported snapshot.\n"];
  s3_bucket_owner: string option
    [@ocaml.doc
      "The ID of the Amazon Web Services account that owns the bucket containing the export.\n"];
  s3_bucket: string option
    [@ocaml.doc "The name of the Amazon S3 bucket containing the export.\n"];
  client_token: string option
    [@ocaml.doc
      "The client token that was provided for the export task. A client token makes calls to [ExportTableToPointInTimeInput] idempotent, meaning that multiple identical calls have the same effect as one single call.\n"];
  export_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "Point in time from which table data was exported.\n"];
  table_id: string option
    [@ocaml.doc "Unique ID of the table that was exported.\n"];
  table_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the table that was exported.\n"];
  export_manifest: string option
    [@ocaml.doc "The name of the manifest file for the export task.\n"];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time at which the export task completed.\n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time at which the export task began.\n"];
  export_status: export_status option
    [@ocaml.doc
      "Export can be in one of the following states: IN_PROGRESS, COMPLETED, or FAILED.\n"];
  export_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the table export.\n"]}
[@@ocaml.doc "Represents the properties of the exported table.\n"]
type nonrec export_table_to_point_in_time_output =
  {
  export_description: export_description option
    [@ocaml.doc "Contains a description of the table export.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec export_table_to_point_in_time_input =
  {
  incremental_export_specification: incremental_export_specification option
    [@ocaml.doc
      "Optional object containing the parameters specific to an incremental export.\n"];
  export_type: export_type option
    [@ocaml.doc
      "Choice of whether to execute as a full export or incremental export. Valid values are FULL_EXPORT or INCREMENTAL_EXPORT. The default value is FULL_EXPORT. If INCREMENTAL_EXPORT is provided, the IncrementalExportSpecification must also be used.\n"];
  export_format: export_format option
    [@ocaml.doc
      "The format for the exported data. Valid values for [ExportFormat] are [DYNAMODB_JSON] or [ION].\n"];
  s3_sse_kms_key_id: string option
    [@ocaml.doc
      "The ID of the KMS managed key used to encrypt the S3 bucket where export data will be stored (if applicable).\n"];
  s3_sse_algorithm: s3_sse_algorithm option
    [@ocaml.doc
      "Type of encryption used on the bucket where export data will be stored. Valid values for [S3SseAlgorithm] are:\n\n {ul\n       {-   [AES256] - server-side encryption with Amazon S3 managed keys\n           \n            }\n       {-   [KMS] - server-side encryption with KMS managed keys\n           \n            }\n       }\n  "];
  s3_prefix: string option
    [@ocaml.doc
      "The Amazon S3 bucket prefix to use as the file name and path of the exported snapshot.\n"];
  s3_bucket_owner: string option
    [@ocaml.doc
      "The ID of the Amazon Web Services account that owns the bucket the export will be stored in.\n\n  S3BucketOwner is a required parameter when exporting to a S3 bucket in another account.\n  \n   "];
  s3_bucket: string
    [@ocaml.doc
      "The name of the Amazon S3 bucket to export the snapshot to.\n"];
  client_token: string option
    [@ocaml.doc
      "Providing a [ClientToken] makes the call to [ExportTableToPointInTimeInput] idempotent, meaning that multiple identical calls have the same effect as one single call.\n\n A client token is valid for 8 hours after the first request that uses it is completed. After 8 hours, any request with the same client token is treated as a new request. Do not resubmit the same request with the same client token for more than 8 hours, or the result might not be idempotent.\n \n  If you submit a request with the same client token but a change in other parameters within the 8-hour idempotency window, DynamoDB returns an [ImportConflictException].\n  "];
  export_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Time in the past from which to export table data, counted in seconds from the start of the Unix epoch. The table export will be a snapshot of the table's state at this point in time.\n"];
  table_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) associated with the table to export.\n"]}
[@@ocaml.doc ""]
type nonrec export_conflict_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "There was a conflict when writing to the specified S3 bucket.\n"]
type nonrec export_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified export was not found.\n"]
type nonrec execute_transaction_output =
  {
  consumed_capacity: consumed_capacity list option
    [@ocaml.doc
      "The capacity units consumed by the entire operation. The values of the list are ordered according to the ordering of the statements.\n"];
  responses: item_response list option
    [@ocaml.doc "The response to a PartiQL transaction.\n"]}[@@ocaml.doc ""]
type nonrec execute_transaction_input =
  {
  return_consumed_capacity: return_consumed_capacity option
    [@ocaml.doc
      "Determines the level of detail about either provisioned or on-demand throughput consumption that is returned in the response. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_TransactGetItems.html}TransactGetItems} and {{:https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_TransactWriteItems.html}TransactWriteItems}.\n"];
  client_request_token: string option
    [@ocaml.doc
      "Set this value to get remaining results, if [NextToken] was returned in the statement response.\n"];
  transact_statements: parameterized_statement list
    [@ocaml.doc
      "The list of PartiQL statements representing the transaction to run.\n"]}
[@@ocaml.doc ""]
type nonrec execute_statement_output =
  {
  last_evaluated_key: key option
    [@ocaml.doc
      "The primary key of the item where the operation stopped, inclusive of the previous result set. Use this value to start a new operation, excluding this value in the new request. If [LastEvaluatedKey] is empty, then the \"last page\" of results has been processed and there is no more data to be retrieved. If [LastEvaluatedKey] is not empty, it does not necessarily mean that there is more data in the result set. The only way to know when you have reached the end of the result set is when [LastEvaluatedKey] is empty. \n"];
  consumed_capacity: consumed_capacity option [@ocaml.doc ""];
  next_token: string option
    [@ocaml.doc
      "If the response of a read request exceeds the response payload limit DynamoDB will set this value in the response. If set, you can use that this value in the subsequent request to get the remaining results.\n"];
  items: attribute_map list option
    [@ocaml.doc
      "If a read operation was used, this property will contain the result of the read operation; a map of attribute names and their values. For the write operations this value will be empty.\n"]}
[@@ocaml.doc ""]
type nonrec execute_statement_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option
    [@ocaml.doc
      "An optional parameter that returns the item attributes for an [ExecuteStatement] operation that failed a condition check.\n\n There is no additional cost associated with requesting a return value aside from the small network and processing overhead of receiving a larger response. No read capacity units are consumed.\n "];
  limit: int option
    [@ocaml.doc
      "The maximum number of items to evaluate (not necessarily the number of matching items). If DynamoDB processes the number of items up to the limit while processing the results, it stops the operation and returns the matching values up to that point, along with a key in [LastEvaluatedKey] to apply in a subsequent operation so you can pick up where you left off. Also, if the processed dataset size exceeds 1 MB before DynamoDB reaches this limit, it stops the operation and returns the matching values up to the limit, and a key in [LastEvaluatedKey] to apply in a subsequent operation to continue the operation. \n"];
  return_consumed_capacity: return_consumed_capacity option [@ocaml.doc ""];
  next_token: string option
    [@ocaml.doc
      "Set this value to get remaining results, if [NextToken] was returned in the statement response.\n"];
  consistent_read: bool option
    [@ocaml.doc
      "The consistency of a read operation. If set to [true], then a strongly consistent read is used; otherwise, an eventually consistent read is used.\n"];
  parameters: attribute_value list option
    [@ocaml.doc "The parameters for the PartiQL statement, if any.\n"];
  statement: string
    [@ocaml.doc "The PartiQL statement representing the operation to run.\n"]}
[@@ocaml.doc ""]
type nonrec duplicate_item_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           " There was an attempt to insert an item with the same primary key as an item that already exists in the DynamoDB table.\n"]
type nonrec endpoint =
  {
  cache_period_in_minutes: int
    [@ocaml.doc "Endpoint cache time to live (TTL) value.\n"];
  address: string [@ocaml.doc "IP address of the endpoint.\n"]}[@@ocaml.doc
                                                                 "An endpoint information details.\n"]
type nonrec describe_time_to_live_output =
  {
  time_to_live_description: time_to_live_description option [@ocaml.doc "\n"]}
[@@ocaml.doc ""]
type nonrec describe_time_to_live_input =
  {
  table_name: string
    [@ocaml.doc
      "The name of the table to be described. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc ""]
type nonrec describe_table_replica_auto_scaling_output =
  {
  table_auto_scaling_description: table_auto_scaling_description option
    [@ocaml.doc "Represents the auto scaling properties of the table.\n"]}
[@@ocaml.doc ""]
type nonrec describe_table_replica_auto_scaling_input =
  {
  table_name: string
    [@ocaml.doc
      "The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc ""]
type nonrec describe_table_output =
  {
  table: table_description option
    [@ocaml.doc "The properties of the table.\n"]}[@@ocaml.doc
                                                    "Represents the output of a [DescribeTable] operation.\n"]
type nonrec describe_table_input =
  {
  table_name: string
    [@ocaml.doc
      "The name of the table to describe. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc "Represents the input of a [DescribeTable] operation.\n"]
type nonrec describe_limits_output =
  {
  table_max_write_capacity_units: int option
    [@ocaml.doc
      "The maximum write capacity units that your account allows you to provision for a new table that you are creating in this Region, including the write capacity units provisioned for its global secondary indexes (GSIs).\n"];
  table_max_read_capacity_units: int option
    [@ocaml.doc
      "The maximum read capacity units that your account allows you to provision for a new table that you are creating in this Region, including the read capacity units provisioned for its global secondary indexes (GSIs).\n"];
  account_max_write_capacity_units: int option
    [@ocaml.doc
      "The maximum total write capacity units that your account allows you to provision across all of your tables in this Region.\n"];
  account_max_read_capacity_units: int option
    [@ocaml.doc
      "The maximum total read capacity units that your account allows you to provision across all of your tables in this Region.\n"]}
[@@ocaml.doc "Represents the output of a [DescribeLimits] operation.\n"]
type nonrec describe_kinesis_streaming_destination_output =
  {
  kinesis_data_stream_destinations:
    kinesis_data_stream_destination list option
    [@ocaml.doc
      "The list of replica structures for the table being described.\n"];
  table_name: string option
    [@ocaml.doc "The name of the table being described.\n"]}[@@ocaml.doc ""]
type nonrec describe_kinesis_streaming_destination_input =
  {
  table_name: string
    [@ocaml.doc
      "The name of the table being described. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc ""]
type nonrec describe_import_output =
  {
  import_table_description: import_table_description
    [@ocaml.doc
      " Represents the properties of the table created for the import, and parameters of the import. The import parameters include import status, how many items were processed, and how many errors were encountered. \n"]}
[@@ocaml.doc ""]
type nonrec describe_import_input =
  {
  import_arn: string
    [@ocaml.doc
      " The Amazon Resource Name (ARN) associated with the table you're importing to. \n"]}
[@@ocaml.doc ""]
type nonrec describe_global_table_settings_output =
  {
  replica_settings: replica_settings_description list option
    [@ocaml.doc "The Region-specific settings for the global table.\n"];
  global_table_name: string option
    [@ocaml.doc "The name of the global table.\n"]}[@@ocaml.doc ""]
type nonrec describe_global_table_settings_input =
  {
  global_table_name: string
    [@ocaml.doc "The name of the global table to describe.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec describe_global_table_output =
  {
  global_table_description: global_table_description option
    [@ocaml.doc "Contains the details of the global table.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec describe_global_table_input =
  {
  global_table_name: string [@ocaml.doc "The name of the global table.\n"]}
[@@ocaml.doc ""]
type nonrec describe_export_output =
  {
  export_description: export_description option
    [@ocaml.doc "Represents the properties of the export.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec describe_export_input =
  {
  export_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) associated with the export.\n"]}
[@@ocaml.doc ""]
type nonrec describe_endpoints_response =
  {
  endpoints: endpoint list [@ocaml.doc "List of endpoints.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec describe_contributor_insights_output =
  {
  failure_exception: failure_exception option
    [@ocaml.doc
      "Returns information about the last failure that was encountered.\n\n The most common exceptions for a FAILED status are:\n \n  {ul\n        {-  LimitExceededException - Per-account Amazon CloudWatch Contributor Insights rule limit reached. Please disable Contributor Insights for other tables/indexes OR disable Contributor Insights rules before retrying.\n            \n             }\n        {-  AccessDeniedException - Amazon CloudWatch Contributor Insights rules cannot be modified due to insufficient permissions.\n            \n             }\n        {-  AccessDeniedException - Failed to create service-linked role for Contributor Insights due to insufficient permissions.\n            \n             }\n        {-  InternalServerError - Failed to create Amazon CloudWatch Contributor Insights rules. Please retry request.\n            \n             }\n        }\n  "];
  last_update_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "Timestamp of the last time the status was changed.\n"];
  contributor_insights_status: contributor_insights_status option
    [@ocaml.doc "Current status of contributor insights.\n"];
  contributor_insights_rule_list: string list option
    [@ocaml.doc
      "List of names of the associated contributor insights rules.\n"];
  index_name: string option
    [@ocaml.doc "The name of the global secondary index being described.\n"];
  table_name: string option
    [@ocaml.doc "The name of the table being described.\n"]}[@@ocaml.doc ""]
type nonrec describe_contributor_insights_input =
  {
  index_name: string option
    [@ocaml.doc
      "The name of the global secondary index to describe, if applicable.\n"];
  table_name: string
    [@ocaml.doc
      "The name of the table to describe. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc ""]
type nonrec describe_continuous_backups_output =
  {
  continuous_backups_description: continuous_backups_description option
    [@ocaml.doc
      "Represents the continuous backups and point in time recovery settings on the table.\n"]}
[@@ocaml.doc ""]
type nonrec describe_continuous_backups_input =
  {
  table_name: string
    [@ocaml.doc
      "Name of the table for which the customer wants to check the continuous backups and point in time recovery settings.\n\n You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n "]}
[@@ocaml.doc ""]
type nonrec backup_details =
  {
  backup_expiry_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Time at which the automatic on-demand backup created by DynamoDB will expire. This [SYSTEM] on-demand backup expires automatically 35 days after its creation.\n"];
  backup_creation_date_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "Time at which the backup was created. This is the request time of the backup. \n"];
  backup_type: backup_type
    [@ocaml.doc
      "BackupType:\n\n {ul\n       {-   [USER] - You create and manage these using the on-demand backup feature.\n           \n            }\n       {-   [SYSTEM] - If you delete a table with point-in-time recovery enabled, a [SYSTEM] backup is automatically created and is retained for 35 days (at no additional cost). System backups allow you to restore the deleted table to the state it was in just before the point of deletion. \n           \n            }\n       {-   [AWS_BACKUP] - On-demand backup created by you from Backup service.\n           \n            }\n       }\n  "];
  backup_status: backup_status
    [@ocaml.doc
      "Backup can be in one of the following states: CREATING, ACTIVE, DELETED. \n"];
  backup_size_bytes: int option
    [@ocaml.doc
      "Size of the backup in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.\n"];
  backup_name: string [@ocaml.doc "Name of the requested backup.\n"];
  backup_arn: string [@ocaml.doc "ARN associated with the backup.\n"]}
[@@ocaml.doc "Contains the details of the backup created for the table.\n"]
type nonrec backup_description =
  {
  source_table_feature_details: source_table_feature_details option
    [@ocaml.doc
      "Contains the details of the features enabled on the table when the backup was created. For example, LSIs, GSIs, streams, TTL.\n"];
  source_table_details: source_table_details option
    [@ocaml.doc
      "Contains the details of the table when the backup was created. \n"];
  backup_details: backup_details option
    [@ocaml.doc
      "Contains the details of the backup created for the table. \n"]}
[@@ocaml.doc
  "Contains the description of the backup created for the table.\n"]
type nonrec describe_backup_output =
  {
  backup_description: backup_description option
    [@ocaml.doc
      "Contains the description of the backup created for the table.\n"]}
[@@ocaml.doc ""]
type nonrec describe_backup_input =
  {
  backup_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) associated with the backup.\n"]}
[@@ocaml.doc ""]
type nonrec delete_table_output =
  {
  table_description: table_description option
    [@ocaml.doc "Represents the properties of a table.\n"]}[@@ocaml.doc
                                                             "Represents the output of a [DeleteTable] operation.\n"]
type nonrec delete_table_input =
  {
  table_name: string
    [@ocaml.doc
      "The name of the table to delete. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc "Represents the input of a [DeleteTable] operation.\n"]
type nonrec delete_resource_policy_output =
  {
  revision_id: string option
    [@ocaml.doc
      "A unique string that represents the revision ID of the policy. If you're comparing revision IDs, make sure to always use string comparison logic.\n\n This value will be empty if you make a request against a resource without a policy.\n "]}
[@@ocaml.doc ""]
type nonrec delete_resource_policy_input =
  {
  expected_revision_id: string option
    [@ocaml.doc
      "A string value that you can use to conditionally delete your policy. When you provide an expected revision ID, if the revision ID of the existing policy on the resource doesn't match or if there's no policy attached to the resource, the request will fail and return a [PolicyNotFoundException].\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the DynamoDB resource from which the policy will be removed. The resources you can specify include tables and streams. If you remove the policy of a table, it will also remove the permissions for the table's indexes defined in that policy document. This is because index permissions are defined in the table's policy.\n"]}
[@@ocaml.doc ""]
type nonrec delete_item_output =
  {
  item_collection_metrics: item_collection_metrics option
    [@ocaml.doc
      "Information about item collections, if any, that were affected by the [DeleteItem] operation. [ItemCollectionMetrics] is only returned if the [ReturnItemCollectionMetrics] parameter was specified. If the table does not have any local secondary indexes, this information is not returned in the response.\n\n Each [ItemCollectionMetrics] element consists of:\n \n  {ul\n        {-   [ItemCollectionKey] - The partition key value of the item collection. This is the same as the partition key value of the item itself.\n            \n             }\n        {-   [SizeEstimateRangeGB] - An estimate of item collection size, in gigabytes. This value is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on that table. Use this estimate to measure whether a local secondary index is approaching its size limit.\n            \n             The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.\n             \n              }\n        }\n  "];
  consumed_capacity: consumed_capacity option
    [@ocaml.doc
      "The capacity units consumed by the [DeleteItem] operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. [ConsumedCapacity] is only returned if the [ReturnConsumedCapacity] parameter was specified. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html}Provisioned capacity mode} in the {i Amazon DynamoDB Developer Guide}.\n"];
  attributes: attribute_map option
    [@ocaml.doc
      "A map of attribute names to [AttributeValue] objects, representing the item as it appeared before the [DeleteItem] operation. This map appears in the response only if [ReturnValues] was specified as [ALL_OLD] in the request.\n"]}
[@@ocaml.doc "Represents the output of a [DeleteItem] operation.\n"]
type nonrec delete_item_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option
    [@ocaml.doc
      "An optional parameter that returns the item attributes for a [DeleteItem] operation that failed a condition check.\n\n There is no additional cost associated with requesting a return value aside from the small network and processing overhead of receiving a larger response. No read capacity units are consumed.\n "];
  expression_attribute_values: expression_attribute_value_map option
    [@ocaml.doc
      "One or more values that can be substituted in an expression.\n\n Use the {b :} (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the {i ProductStatus} attribute was one of the following: \n \n   [Available | Backordered | Discontinued] \n  \n   You would first need to specify [ExpressionAttributeValues] as follows:\n   \n     [{ \":avail\":{\"S\":\"Available\"}, \":back\":{\"S\":\"Backordered\"},\n                \":disc\":{\"S\":\"Discontinued\"} }] \n    \n     You could then use these values in an expression, such as this:\n     \n       [ProductStatus IN (:avail, :back, :disc)] \n      \n       For more information on expression attribute values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html}Condition Expressions} in the {i Amazon DynamoDB Developer Guide}.\n       "];
  expression_attribute_names: expression_attribute_name_map option
    [@ocaml.doc
      "One or more substitution tokens for attribute names in an expression. The following are some use cases for using [ExpressionAttributeNames]:\n\n {ul\n       {-  To access an attribute whose name conflicts with a DynamoDB reserved word.\n           \n            }\n       {-  To create a placeholder for repeating occurrences of an attribute name in an expression.\n           \n            }\n       {-  To prevent special characters in an attribute name from being misinterpreted in an expression.\n           \n            }\n       }\n   Use the {b #} character in an expression to dereference an attribute name. For example, consider the following attribute name:\n   \n    {ul\n          {-   [Percentile] \n              \n               }\n          }\n   The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html}Reserved Words} in the {i Amazon DynamoDB Developer Guide}). To work around this, you could specify the following for [ExpressionAttributeNames]:\n   \n    {ul\n          {-   [{\"#P\":\"Percentile\"}] \n              \n               }\n          }\n   You could then use this substitution in an expression, as in this example:\n   \n    {ul\n          {-   [#P = :val] \n              \n               }\n          }\n    Tokens that begin with the {b :} character are {i expression attribute values}, which are placeholders for the actual value at runtime.\n    \n      For more information on expression attribute names, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Specifying Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n      "];
  condition_expression: string option
    [@ocaml.doc
      "A condition that must be satisfied in order for a conditional [DeleteItem] to succeed.\n\n An expression can contain any of the following:\n \n  {ul\n        {-  Functions: [attribute_exists | attribute_not_exists | attribute_type |\n                        contains | begins_with | size] \n            \n             These function names are case-sensitive.\n             \n              }\n        {-  Comparison operators: [= | <> |\n            < | > | <= | >= |\n            BETWEEN | IN ] \n            \n             }\n        {-   Logical operators: [AND | OR | NOT] \n            \n             }\n        }\n   For more information about condition expressions, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html}Condition Expressions} in the {i Amazon DynamoDB Developer Guide}.\n   "];
  return_item_collection_metrics: return_item_collection_metrics option
    [@ocaml.doc
      "Determines whether item collection metrics are returned. If set to [SIZE], the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to [NONE] (the default), no statistics are returned.\n"];
  return_consumed_capacity: return_consumed_capacity option [@ocaml.doc ""];
  return_values: return_value option
    [@ocaml.doc
      "Use [ReturnValues] if you want to get the item attributes as they appeared before they were deleted. For [DeleteItem], the valid values are:\n\n {ul\n       {-   [NONE] - If [ReturnValues] is not specified, or if its value is [NONE], then nothing is returned. (This setting is the default for [ReturnValues].)\n           \n            }\n       {-   [ALL_OLD] - The content of the old item is returned.\n           \n            }\n       }\n   There is no additional cost associated with requesting a return value aside from the small network and processing overhead of receiving a larger response. No read capacity units are consumed.\n   \n     The [ReturnValues] parameter is used by several DynamoDB operations; however, [DeleteItem] does not recognize any values other than [NONE] or [ALL_OLD].\n     \n      "];
  conditional_operator: conditional_operator option
    [@ocaml.doc
      "This is a legacy parameter. Use [ConditionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html}ConditionalOperator} in the {i Amazon DynamoDB Developer Guide}.\n"];
  expected: expected_attribute_map option
    [@ocaml.doc
      "This is a legacy parameter. Use [ConditionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html}Expected} in the {i Amazon DynamoDB Developer Guide}.\n"];
  key: key
    [@ocaml.doc
      "A map of attribute names to [AttributeValue] objects, representing the primary key of the item to delete.\n\n For the primary key, you must provide all of the key attributes. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide values for both the partition key and the sort key.\n "];
  table_name: string
    [@ocaml.doc
      "The name of the table from which to delete the item. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc "Represents the input of a [DeleteItem] operation.\n"]
type nonrec delete_backup_output =
  {
  backup_description: backup_description option
    [@ocaml.doc
      "Contains the description of the backup created for the table.\n"]}
[@@ocaml.doc ""]
type nonrec delete_backup_input =
  {
  backup_arn: string [@ocaml.doc "The ARN associated with the backup.\n"]}
[@@ocaml.doc ""]
type nonrec create_table_output =
  {
  table_description: table_description option
    [@ocaml.doc "Represents the properties of the table.\n"]}[@@ocaml.doc
                                                               "Represents the output of a [CreateTable] operation.\n"]
type nonrec create_table_input =
  {
  on_demand_throughput: on_demand_throughput option
    [@ocaml.doc
      "Sets the maximum number of read and write units for the specified table in on-demand capacity mode. If you use this parameter, you must specify [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.\n"];
  resource_policy: string option
    [@ocaml.doc
      "An Amazon Web Services resource-based policy document in JSON format that will be attached to the table.\n\n When you attach a resource-based policy while creating a table, the policy application is {i strongly consistent}.\n \n  The maximum size supported for a resource-based policy document is 20 KB. DynamoDB counts whitespaces when calculating the size of a policy against this limit. For a full list of all considerations that apply for resource-based policies, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/rbac-considerations.html}Resource-based policy considerations}.\n  \n    You need to specify the [CreateTable] and [PutResourcePolicy] IAM actions for authorizing a user to create a table with a resource-based policy.\n    \n     "];
  deletion_protection_enabled: bool option
    [@ocaml.doc
      "Indicates whether deletion protection is to be enabled (true) or disabled (false) on the table.\n"];
  table_class: table_class option
    [@ocaml.doc
      "The table class of the new table. Valid values are [STANDARD] and [STANDARD_INFREQUENT_ACCESS].\n"];
  tags: tag list option
    [@ocaml.doc
      "A list of key-value pairs to label the table. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html}Tagging for DynamoDB}.\n"];
  sse_specification: sse_specification option
    [@ocaml.doc
      "Represents the settings used to enable server-side encryption.\n"];
  stream_specification: stream_specification option
    [@ocaml.doc
      "The settings for DynamoDB Streams on the table. These settings consist of:\n\n {ul\n       {-   [StreamEnabled] - Indicates whether DynamoDB Streams is to be enabled (true) or disabled (false).\n           \n            }\n       {-   [StreamViewType] - When an item in the table is modified, [StreamViewType] determines what information is written to the table's stream. Valid values for [StreamViewType] are:\n           \n            {ul\n                  {-   [KEYS_ONLY] - Only the key attributes of the modified item are written to the stream.\n                      \n                       }\n                  {-   [NEW_IMAGE] - The entire item, as it appears after it was modified, is written to the stream.\n                      \n                       }\n                  {-   [OLD_IMAGE] - The entire item, as it appeared before it was modified, is written to the stream.\n                      \n                       }\n                  {-   [NEW_AND_OLD_IMAGES] - Both the new and the old item images of the item are written to the stream.\n                      \n                       }\n                  \n        }\n         }\n       }\n  "];
  provisioned_throughput: provisioned_throughput option
    [@ocaml.doc
      "Represents the provisioned throughput settings for a specified table or index. The settings can be modified using the [UpdateTable] operation.\n\n  If you set BillingMode as [PROVISIONED], you must specify this property. If you set BillingMode as [PAY_PER_REQUEST], you cannot specify this property.\n \n  For current minimum and maximum provisioned throughput values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html}Service, Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.\n  "];
  billing_mode: billing_mode option
    [@ocaml.doc
      "Controls how you are charged for read and write throughput and how you manage capacity. This setting can be changed later.\n\n {ul\n       {-   [PROVISIONED] - We recommend using [PROVISIONED] for predictable workloads. [PROVISIONED] sets the billing mode to {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html}Provisioned capacity mode}.\n           \n            }\n       {-   [PAY_PER_REQUEST] - We recommend using [PAY_PER_REQUEST] for unpredictable workloads. [PAY_PER_REQUEST] sets the billing mode to {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html}On-demand capacity mode}. \n           \n            }\n       }\n  "];
  global_secondary_indexes: global_secondary_index list option
    [@ocaml.doc
      "One or more global secondary indexes (the maximum is 20) to be created on the table. Each global secondary index in the array includes the following:\n\n {ul\n       {-   [IndexName] - The name of the global secondary index. Must be unique only for this table.\n           \n            \n            \n             }\n       {-   [KeySchema] - Specifies the key schema for the global secondary index.\n           \n            }\n       {-   [Projection] - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:\n           \n            {ul\n                  {-   [ProjectionType] - One of the following:\n                      \n                       {ul\n                             {-   [KEYS_ONLY] - Only the index and primary keys are projected into the index.\n                                 \n                                  }\n                             {-   [INCLUDE] - Only the specified table attributes are projected into the index. The list of projected attributes is in [NonKeyAttributes].\n                                 \n                                  }\n                             {-   [ALL] - All of the table attributes are projected into the index.\n                                 \n                                  }\n                             \n                   }\n                    }\n                  {-   [NonKeyAttributes] - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in [NonKeyAttributes], summed across all of the secondary indexes, must not exceed 100. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.\n                      \n                       }\n                  \n        }\n         }\n       {-   [ProvisionedThroughput] - The provisioned throughput settings for the global secondary index, consisting of read and write capacity units.\n           \n            }\n       }\n  "];
  local_secondary_indexes: local_secondary_index list option
    [@ocaml.doc
      "One or more local secondary indexes (the maximum is 5) to be created on the table. Each index is scoped to a given partition key value. There is a 10 GB size limit per partition key value; otherwise, the size of a local secondary index is unconstrained.\n\n Each local secondary index in the array includes the following:\n \n  {ul\n        {-   [IndexName] - The name of the local secondary index. Must be unique only for this table.\n            \n             \n             \n              }\n        {-   [KeySchema] - Specifies the key schema for the local secondary index. The key schema must begin with the same partition key as the table.\n            \n             }\n        {-   [Projection] - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:\n            \n             {ul\n                   {-   [ProjectionType] - One of the following:\n                       \n                        {ul\n                              {-   [KEYS_ONLY] - Only the index and primary keys are projected into the index.\n                                  \n                                   }\n                              {-   [INCLUDE] - Only the specified table attributes are projected into the index. The list of projected attributes is in [NonKeyAttributes].\n                                  \n                                   }\n                              {-   [ALL] - All of the table attributes are projected into the index.\n                                  \n                                   }\n                              \n                    }\n                     }\n                   {-   [NonKeyAttributes] - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in [NonKeyAttributes], summed across all of the secondary indexes, must not exceed 100. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.\n                       \n                        }\n                   \n         }\n          }\n        }\n  "];
  key_schema: key_schema_element list
    [@ocaml.doc
      "Specifies the attributes that make up the primary key for a table or an index. The attributes in [KeySchema] must also be defined in the [AttributeDefinitions] array. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html}Data Model} in the {i Amazon DynamoDB Developer Guide}.\n\n Each [KeySchemaElement] in the array is composed of:\n \n  {ul\n        {-   [AttributeName] - The name of this key attribute.\n            \n             }\n        {-   [KeyType] - The role that the key attribute will assume:\n            \n             {ul\n                   {-   [HASH] - partition key\n                       \n                        }\n                   {-   [RANGE] - sort key\n                       \n                        }\n                   \n         }\n          }\n        }\n    The partition key of an item is also known as its {i hash attribute}. The term \"hash attribute\" derives from the DynamoDB usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.\n    \n     The sort key of an item is also known as its {i range attribute}. The term \"range attribute\" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.\n     \n       For a simple primary key (partition key), you must provide exactly one element with a [KeyType] of [HASH].\n       \n        For a composite primary key (partition key and sort key), you must provide exactly two elements, in this order: The first element must have a [KeyType] of [HASH], and the second element must have a [KeyType] of [RANGE].\n        \n         For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#WorkingWithTables.primary.key}Working with Tables} in the {i Amazon DynamoDB Developer Guide}.\n         "];
  table_name: string
    [@ocaml.doc
      "The name of the table to create. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"];
  attribute_definitions: attribute_definition list
    [@ocaml.doc
      "An array of attributes that describe the key schema for the table and indexes.\n"]}
[@@ocaml.doc "Represents the input of a [CreateTable] operation.\n"]
type nonrec create_global_table_output =
  {
  global_table_description: global_table_description option
    [@ocaml.doc "Contains the details of the global table.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec create_global_table_input =
  {
  replication_group: replica list
    [@ocaml.doc "The Regions where the global table needs to be created.\n"];
  global_table_name: string [@ocaml.doc "The global table name.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_backup_output =
  {
  backup_details: backup_details option
    [@ocaml.doc
      "Contains the details of the backup created for the table.\n"]}
[@@ocaml.doc ""]
type nonrec create_backup_input =
  {
  backup_name: string [@ocaml.doc "Specified name for the backup.\n"];
  table_name: string
    [@ocaml.doc
      "The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this parameter.\n"]}
[@@ocaml.doc ""]
type nonrec batch_write_item_request_map = (string * write_request list) list
[@@ocaml.doc ""]
type nonrec batch_write_item_output =
  {
  consumed_capacity: consumed_capacity list option
    [@ocaml.doc
      "The capacity units consumed by the entire [BatchWriteItem] operation.\n\n Each element consists of:\n \n  {ul\n        {-   [TableName] - The table that consumed the provisioned throughput.\n            \n             }\n        {-   [CapacityUnits] - The total number of capacity units consumed.\n            \n             }\n        }\n  "];
  item_collection_metrics: item_collection_metrics_per_table option
    [@ocaml.doc
      "A list of tables that were processed by [BatchWriteItem] and, for each table, information about any item collections that were affected by individual [DeleteItem] or [PutItem] operations.\n\n Each entry consists of the following subelements:\n \n  {ul\n        {-   [ItemCollectionKey] - The partition key value of the item collection. This is the same as the partition key value of the item.\n            \n             }\n        {-   [SizeEstimateRangeGB] - An estimate of item collection size, expressed in GB. This is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on the table. Use this estimate to measure whether a local secondary index is approaching its size limit.\n            \n             The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.\n             \n              }\n        }\n  "];
  unprocessed_items: batch_write_item_request_map option
    [@ocaml.doc
      "A map of tables and requests against those tables that were not processed. The [UnprocessedItems] value is in the same form as [RequestItems], so you can provide this value directly to a subsequent [BatchWriteItem] operation. For more information, see [RequestItems] in the Request Parameters section.\n\n Each [UnprocessedItems] entry consists of a table name or table ARN and, for that table, a list of operations to perform ([DeleteRequest] or [PutRequest]).\n \n  {ul\n        {-   [DeleteRequest] - Perform a [DeleteItem] operation on the specified item. The item to be deleted is identified by a [Key] subelement:\n            \n             {ul\n                   {-   [Key] - A map of primary key attribute values that uniquely identify the item. Each entry in this map consists of an attribute name and an attribute value.\n                       \n                        }\n                   \n         }\n          }\n        {-   [PutRequest] - Perform a [PutItem] operation on the specified item. The item to be put is identified by an [Item] subelement:\n            \n             {ul\n                   {-   [Item] - A map of attributes and their values. Each entry in this map consists of an attribute name and an attribute value. Attribute values must not be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests that contain empty values will be rejected with a [ValidationException] exception.\n                       \n                        If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.\n                        \n                         }\n                   \n         }\n          }\n        }\n   If there are no unprocessed items remaining, the response contains an empty [UnprocessedItems] map.\n   "]}
[@@ocaml.doc "Represents the output of a [BatchWriteItem] operation.\n"]
type nonrec batch_write_item_input =
  {
  return_item_collection_metrics: return_item_collection_metrics option
    [@ocaml.doc
      "Determines whether item collection metrics are returned. If set to [SIZE], the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to [NONE] (the default), no statistics are returned.\n"];
  return_consumed_capacity: return_consumed_capacity option [@ocaml.doc ""];
  request_items: batch_write_item_request_map
    [@ocaml.doc
      "A map of one or more table names or table ARNs and, for each table, a list of operations to be performed ([DeleteRequest] or [PutRequest]). Each element in the map consists of the following:\n\n {ul\n       {-   [DeleteRequest] - Perform a [DeleteItem] operation on the specified item. The item to be deleted is identified by a [Key] subelement:\n           \n            {ul\n                  {-   [Key] - A map of primary key attribute values that uniquely identify the item. Each entry in this map consists of an attribute name and an attribute value. For each primary key, you must provide {i all} of the key attributes. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide values for {i both} the partition key and the sort key.\n                      \n                       }\n                  \n        }\n         }\n       {-   [PutRequest] - Perform a [PutItem] operation on the specified item. The item to be put is identified by an [Item] subelement:\n           \n            {ul\n                  {-   [Item] - A map of attributes and their values. Each entry in this map consists of an attribute name and an attribute value. Attribute values must not be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests that contain empty values are rejected with a [ValidationException] exception.\n                      \n                       If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.\n                       \n                        }\n                  \n        }\n         }\n       }\n  "]}
[@@ocaml.doc "Represents the input of a [BatchWriteItem] operation.\n"]
type nonrec batch_get_response_map = (string * attribute_map list) list
[@@ocaml.doc ""]
type nonrec batch_get_request_map = (string * keys_and_attributes) list
[@@ocaml.doc ""]
type nonrec batch_get_item_output =
  {
  consumed_capacity: consumed_capacity list option
    [@ocaml.doc
      "The read capacity units consumed by the entire [BatchGetItem] operation.\n\n Each element consists of:\n \n  {ul\n        {-   [TableName] - The table that consumed the provisioned throughput.\n            \n             }\n        {-   [CapacityUnits] - The total number of capacity units consumed.\n            \n             }\n        }\n  "];
  unprocessed_keys: batch_get_request_map option
    [@ocaml.doc
      "A map of tables and their respective keys that were not processed with the current response. The [UnprocessedKeys] value is in the same form as [RequestItems], so the value can be provided directly to a subsequent [BatchGetItem] operation. For more information, see [RequestItems] in the Request Parameters section.\n\n Each element consists of:\n \n  {ul\n        {-   [Keys] - An array of primary key attribute values that define specific items in the table.\n            \n             }\n        {-   [ProjectionExpression] - One or more attributes to be retrieved from the table or index. By default, all attributes are returned. If a requested attribute is not found, it does not appear in the result.\n            \n             }\n        {-   [ConsistentRead] - The consistency of a read operation. If set to [true], then a strongly consistent read is used; otherwise, an eventually consistent read is used.\n            \n             }\n        }\n   If there are no unprocessed keys remaining, the response contains an empty [UnprocessedKeys] map.\n   "];
  responses: batch_get_response_map option
    [@ocaml.doc
      "A map of table name or table ARN to a list of items. Each object in [Responses] consists of a table name or ARN, along with a map of attribute data consisting of the data type and attribute value.\n"]}
[@@ocaml.doc "Represents the output of a [BatchGetItem] operation.\n"]
type nonrec batch_get_item_input =
  {
  return_consumed_capacity: return_consumed_capacity option [@ocaml.doc ""];
  request_items: batch_get_request_map
    [@ocaml.doc
      "A map of one or more table names or table ARNs and, for each table, a map that describes one or more items to retrieve from that table. Each table name or ARN can be used only once per [BatchGetItem] request.\n\n Each element in the map of items to retrieve consists of the following:\n \n  {ul\n        {-   [ConsistentRead] - If [true], a strongly consistent read is used; if [false] (the default), an eventually consistent read is used.\n            \n             }\n        {-   [ExpressionAttributeNames] - One or more substitution tokens for attribute names in the [ProjectionExpression] parameter. The following are some use cases for using [ExpressionAttributeNames]:\n            \n             {ul\n                   {-  To access an attribute whose name conflicts with a DynamoDB reserved word.\n                       \n                        }\n                   {-  To create a placeholder for repeating occurrences of an attribute name in an expression.\n                       \n                        }\n                   {-  To prevent special characters in an attribute name from being misinterpreted in an expression.\n                       \n                        }\n                   \n         }\n          Use the {b #} character in an expression to dereference an attribute name. For example, consider the following attribute name:\n          \n           {ul\n                 {-   [Percentile] \n                     \n                      }\n                 \n         }\n          The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html}Reserved Words} in the {i Amazon DynamoDB Developer Guide}). To work around this, you could specify the following for [ExpressionAttributeNames]:\n          \n           {ul\n                 {-   [{\"#P\":\"Percentile\"}] \n                     \n                      }\n                 \n         }\n          You could then use this substitution in an expression, as in this example:\n          \n           {ul\n                 {-   [#P = :val] \n                     \n                      }\n                 \n         }\n           Tokens that begin with the {b :} character are {i expression attribute values}, which are placeholders for the actual value at runtime.\n           \n             For more information about expression attribute names, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Accessing Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n             \n              }\n        {-   [Keys] - An array of primary key attribute values that define specific items in the table. For each primary key, you must provide {i all} of the key attributes. For example, with a simple primary key, you only need to provide the partition key value. For a composite key, you must provide {i both} the partition key value and the sort key value.\n            \n             }\n        {-   [ProjectionExpression] - A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.\n            \n             If no attribute names are specified, then all attributes are returned. If any of the requested attributes are not found, they do not appear in the result.\n             \n              For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html}Accessing Item Attributes} in the {i Amazon DynamoDB Developer Guide}.\n              \n               }\n        {-   [AttributesToGet] - This is a legacy parameter. Use [ProjectionExpression] instead. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html}AttributesToGet} in the {i Amazon DynamoDB Developer Guide}. \n            \n             }\n        }\n  "]}
[@@ocaml.doc "Represents the input of a [BatchGetItem] operation.\n"]
type nonrec batch_execute_statement_output =
  {
  consumed_capacity: consumed_capacity list option
    [@ocaml.doc
      "The capacity units consumed by the entire operation. The values of the list are ordered according to the ordering of the statements.\n"];
  responses: batch_statement_response list option
    [@ocaml.doc
      "The response to each PartiQL statement in the batch. The values of the list are ordered according to the ordering of the request statements.\n"]}
[@@ocaml.doc ""]
type nonrec batch_execute_statement_input =
  {
  return_consumed_capacity: return_consumed_capacity option [@ocaml.doc ""];
  statements: batch_statement_request list
    [@ocaml.doc
      "The list of PartiQL statements representing the batch to run.\n"]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_put_request :
  item:put_item_input_attribute_map -> unit -> put_request
val make_delete_request : key:key -> unit -> delete_request
val make_write_request :
  ?delete_request:delete_request ->
    ?put_request:put_request -> unit -> write_request
val make_time_to_live_specification :
  attribute_name:string -> enabled:bool -> unit -> time_to_live_specification
val make_update_time_to_live_output :
  ?time_to_live_specification:time_to_live_specification ->
    unit -> update_time_to_live_output
val make_update_time_to_live_input :
  time_to_live_specification:time_to_live_specification ->
    table_name:string -> unit -> update_time_to_live_input
val
  make_auto_scaling_target_tracking_scaling_policy_configuration_description
  :
  ?scale_out_cooldown:int ->
    ?scale_in_cooldown:int ->
      ?disable_scale_in:bool ->
        target_value:float ->
          unit ->
            auto_scaling_target_tracking_scaling_policy_configuration_description
val make_auto_scaling_policy_description :
  ?target_tracking_scaling_policy_configuration:auto_scaling_target_tracking_scaling_policy_configuration_description
    -> ?policy_name:string -> unit -> auto_scaling_policy_description
val make_auto_scaling_settings_description :
  ?scaling_policies:auto_scaling_policy_description list ->
    ?auto_scaling_role_arn:string ->
      ?auto_scaling_disabled:bool ->
        ?maximum_units:int ->
          ?minimum_units:int -> unit -> auto_scaling_settings_description
val make_replica_global_secondary_index_auto_scaling_description :
  ?provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description
    ->
    ?provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description
      ->
      ?index_status:index_status ->
        ?index_name:string ->
          unit -> replica_global_secondary_index_auto_scaling_description
val make_replica_auto_scaling_description :
  ?replica_status:replica_status ->
    ?replica_provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description
      ->
      ?replica_provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description
        ->
        ?global_secondary_indexes:replica_global_secondary_index_auto_scaling_description
          list ->
          ?region_name:string -> unit -> replica_auto_scaling_description
val make_table_auto_scaling_description :
  ?replicas:replica_auto_scaling_description list ->
    ?table_status:table_status ->
      ?table_name:string -> unit -> table_auto_scaling_description
val make_update_table_replica_auto_scaling_output :
  ?table_auto_scaling_description:table_auto_scaling_description ->
    unit -> update_table_replica_auto_scaling_output
val make_auto_scaling_target_tracking_scaling_policy_configuration_update :
  ?scale_out_cooldown:int ->
    ?scale_in_cooldown:int ->
      ?disable_scale_in:bool ->
        target_value:float ->
          unit ->
            auto_scaling_target_tracking_scaling_policy_configuration_update
val make_auto_scaling_policy_update :
  ?policy_name:string ->
    target_tracking_scaling_policy_configuration:auto_scaling_target_tracking_scaling_policy_configuration_update
      -> unit -> auto_scaling_policy_update
val make_auto_scaling_settings_update :
  ?scaling_policy_update:auto_scaling_policy_update ->
    ?auto_scaling_role_arn:string ->
      ?auto_scaling_disabled:bool ->
        ?maximum_units:int ->
          ?minimum_units:int -> unit -> auto_scaling_settings_update
val make_global_secondary_index_auto_scaling_update :
  ?provisioned_write_capacity_auto_scaling_update:auto_scaling_settings_update
    ->
    ?index_name:string -> unit -> global_secondary_index_auto_scaling_update
val make_replica_global_secondary_index_auto_scaling_update :
  ?provisioned_read_capacity_auto_scaling_update:auto_scaling_settings_update
    ->
    ?index_name:string ->
      unit -> replica_global_secondary_index_auto_scaling_update
val make_replica_auto_scaling_update :
  ?replica_provisioned_read_capacity_auto_scaling_update:auto_scaling_settings_update
    ->
    ?replica_global_secondary_index_updates:replica_global_secondary_index_auto_scaling_update
      list -> region_name:string -> unit -> replica_auto_scaling_update
val make_update_table_replica_auto_scaling_input :
  ?replica_updates:replica_auto_scaling_update list ->
    ?provisioned_write_capacity_auto_scaling_update:auto_scaling_settings_update
      ->
      ?global_secondary_index_updates:global_secondary_index_auto_scaling_update
        list ->
        table_name:string -> unit -> update_table_replica_auto_scaling_input
val make_attribute_definition :
  attribute_type:scalar_attribute_type ->
    attribute_name:string -> unit -> attribute_definition
val make_key_schema_element :
  key_type:key_type -> attribute_name:string -> unit -> key_schema_element
val make_provisioned_throughput_description :
  ?write_capacity_units:int ->
    ?read_capacity_units:int ->
      ?number_of_decreases_today:int ->
        ?last_decrease_date_time:CoreTypes.Timestamp.t ->
          ?last_increase_date_time:CoreTypes.Timestamp.t ->
            unit -> provisioned_throughput_description
val make_billing_mode_summary :
  ?last_update_to_pay_per_request_date_time:CoreTypes.Timestamp.t ->
    ?billing_mode:billing_mode -> unit -> billing_mode_summary
val make_projection :
  ?non_key_attributes:string list ->
    ?projection_type:projection_type -> unit -> projection
val make_local_secondary_index_description :
  ?index_arn:string ->
    ?item_count:int ->
      ?index_size_bytes:int ->
        ?projection:projection ->
          ?key_schema:key_schema_element list ->
            ?index_name:string -> unit -> local_secondary_index_description
val make_on_demand_throughput :
  ?max_write_request_units:int ->
    ?max_read_request_units:int -> unit -> on_demand_throughput
val make_global_secondary_index_description :
  ?on_demand_throughput:on_demand_throughput ->
    ?index_arn:string ->
      ?item_count:int ->
        ?index_size_bytes:int ->
          ?provisioned_throughput:provisioned_throughput_description ->
            ?backfilling:bool ->
              ?index_status:index_status ->
                ?projection:projection ->
                  ?key_schema:key_schema_element list ->
                    ?index_name:string ->
                      unit -> global_secondary_index_description
val make_stream_specification :
  ?stream_view_type:stream_view_type ->
    stream_enabled:bool -> unit -> stream_specification
val make_provisioned_throughput_override :
  ?read_capacity_units:int -> unit -> provisioned_throughput_override
val make_on_demand_throughput_override :
  ?max_read_request_units:int -> unit -> on_demand_throughput_override
val make_replica_global_secondary_index_description :
  ?on_demand_throughput_override:on_demand_throughput_override ->
    ?provisioned_throughput_override:provisioned_throughput_override ->
      ?index_name:string ->
        unit -> replica_global_secondary_index_description
val make_table_class_summary :
  ?last_update_date_time:CoreTypes.Timestamp.t ->
    ?table_class:table_class -> unit -> table_class_summary
val make_replica_description :
  ?replica_table_class_summary:table_class_summary ->
    ?replica_inaccessible_date_time:CoreTypes.Timestamp.t ->
      ?global_secondary_indexes:replica_global_secondary_index_description
        list ->
        ?on_demand_throughput_override:on_demand_throughput_override ->
          ?provisioned_throughput_override:provisioned_throughput_override ->
            ?kms_master_key_id:string ->
              ?replica_status_percent_progress:string ->
                ?replica_status_description:string ->
                  ?replica_status:replica_status ->
                    ?region_name:string -> unit -> replica_description
val make_restore_summary :
  ?source_table_arn:string ->
    ?source_backup_arn:string ->
      restore_in_progress:bool ->
        restore_date_time:CoreTypes.Timestamp.t -> unit -> restore_summary
val make_sse_description :
  ?inaccessible_encryption_date_time:CoreTypes.Timestamp.t ->
    ?kms_master_key_arn:string ->
      ?sse_type:sse_type -> ?status:sse_status -> unit -> sse_description
val make_archival_summary :
  ?archival_backup_arn:string ->
    ?archival_reason:string ->
      ?archival_date_time:CoreTypes.Timestamp.t -> unit -> archival_summary
val make_table_description :
  ?on_demand_throughput:on_demand_throughput ->
    ?deletion_protection_enabled:bool ->
      ?table_class_summary:table_class_summary ->
        ?archival_summary:archival_summary ->
          ?sse_description:sse_description ->
            ?restore_summary:restore_summary ->
              ?replicas:replica_description list ->
                ?global_table_version:string ->
                  ?latest_stream_arn:string ->
                    ?latest_stream_label:string ->
                      ?stream_specification:stream_specification ->
                        ?global_secondary_indexes:global_secondary_index_description
                          list ->
                          ?local_secondary_indexes:local_secondary_index_description
                            list ->
                            ?billing_mode_summary:billing_mode_summary ->
                              ?table_id:string ->
                                ?table_arn:string ->
                                  ?item_count:int ->
                                    ?table_size_bytes:int ->
                                      ?provisioned_throughput:provisioned_throughput_description
                                        ->
                                        ?creation_date_time:CoreTypes.Timestamp.t
                                          ->
                                          ?table_status:table_status ->
                                            ?key_schema:key_schema_element
                                              list ->
                                              ?table_name:string ->
                                                ?attribute_definitions:attribute_definition
                                                  list ->
                                                  unit -> table_description
val make_update_table_output :
  ?table_description:table_description -> unit -> update_table_output
val make_provisioned_throughput :
  write_capacity_units:int ->
    read_capacity_units:int -> unit -> provisioned_throughput
val make_update_global_secondary_index_action :
  ?on_demand_throughput:on_demand_throughput ->
    ?provisioned_throughput:provisioned_throughput ->
      index_name:string -> unit -> update_global_secondary_index_action
val make_create_global_secondary_index_action :
  ?on_demand_throughput:on_demand_throughput ->
    ?provisioned_throughput:provisioned_throughput ->
      projection:projection ->
        key_schema:key_schema_element list ->
          index_name:string -> unit -> create_global_secondary_index_action
val make_delete_global_secondary_index_action :
  index_name:string -> unit -> delete_global_secondary_index_action
val make_global_secondary_index_update :
  ?delete:delete_global_secondary_index_action ->
    ?create:create_global_secondary_index_action ->
      ?update:update_global_secondary_index_action ->
        unit -> global_secondary_index_update
val make_sse_specification :
  ?kms_master_key_id:string ->
    ?sse_type:sse_type -> ?enabled:bool -> unit -> sse_specification
val make_replica_global_secondary_index :
  ?on_demand_throughput_override:on_demand_throughput_override ->
    ?provisioned_throughput_override:provisioned_throughput_override ->
      index_name:string -> unit -> replica_global_secondary_index
val make_create_replication_group_member_action :
  ?table_class_override:table_class ->
    ?global_secondary_indexes:replica_global_secondary_index list ->
      ?on_demand_throughput_override:on_demand_throughput_override ->
        ?provisioned_throughput_override:provisioned_throughput_override ->
          ?kms_master_key_id:string ->
            region_name:string ->
              unit -> create_replication_group_member_action
val make_update_replication_group_member_action :
  ?table_class_override:table_class ->
    ?global_secondary_indexes:replica_global_secondary_index list ->
      ?on_demand_throughput_override:on_demand_throughput_override ->
        ?provisioned_throughput_override:provisioned_throughput_override ->
          ?kms_master_key_id:string ->
            region_name:string ->
              unit -> update_replication_group_member_action
val make_delete_replication_group_member_action :
  region_name:string -> unit -> delete_replication_group_member_action
val make_replication_group_update :
  ?delete:delete_replication_group_member_action ->
    ?update:update_replication_group_member_action ->
      ?create:create_replication_group_member_action ->
        unit -> replication_group_update
val make_update_table_input :
  ?on_demand_throughput:on_demand_throughput ->
    ?deletion_protection_enabled:bool ->
      ?table_class:table_class ->
        ?replica_updates:replication_group_update list ->
          ?sse_specification:sse_specification ->
            ?stream_specification:stream_specification ->
              ?global_secondary_index_updates:global_secondary_index_update
                list ->
                ?provisioned_throughput:provisioned_throughput ->
                  ?billing_mode:billing_mode ->
                    ?attribute_definitions:attribute_definition list ->
                      table_name:string -> unit -> update_table_input
val make_update_kinesis_streaming_configuration :
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision
    -> unit -> update_kinesis_streaming_configuration
val make_update_kinesis_streaming_destination_output :
  ?update_kinesis_streaming_configuration:update_kinesis_streaming_configuration
    ->
    ?destination_status:destination_status ->
      ?stream_arn:string ->
        ?table_name:string ->
          unit -> update_kinesis_streaming_destination_output
val make_update_kinesis_streaming_destination_input :
  ?update_kinesis_streaming_configuration:update_kinesis_streaming_configuration
    ->
    stream_arn:string ->
      table_name:string -> unit -> update_kinesis_streaming_destination_input
val make_capacity :
  ?capacity_units:float ->
    ?write_capacity_units:float ->
      ?read_capacity_units:float -> unit -> capacity
val make_consumed_capacity :
  ?global_secondary_indexes:secondary_indexes_capacity_map ->
    ?local_secondary_indexes:secondary_indexes_capacity_map ->
      ?table:capacity ->
        ?write_capacity_units:float ->
          ?read_capacity_units:float ->
            ?capacity_units:float ->
              ?table_name:string -> unit -> consumed_capacity
val make_item_collection_metrics :
  ?size_estimate_range_g_b:float list ->
    ?item_collection_key:item_collection_key_attribute_map ->
      unit -> item_collection_metrics
val make_update_item_output :
  ?item_collection_metrics:item_collection_metrics ->
    ?consumed_capacity:consumed_capacity ->
      ?attributes:attribute_map -> unit -> update_item_output
val make_attribute_value_update :
  ?action:attribute_action ->
    ?value:attribute_value -> unit -> attribute_value_update
val make_expected_attribute_value :
  ?attribute_value_list:attribute_value list ->
    ?comparison_operator:comparison_operator ->
      ?exists:bool ->
        ?value:attribute_value -> unit -> expected_attribute_value
val make_update_item_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure
    ->
    ?expression_attribute_values:expression_attribute_value_map ->
      ?expression_attribute_names:expression_attribute_name_map ->
        ?condition_expression:string ->
          ?update_expression:string ->
            ?return_item_collection_metrics:return_item_collection_metrics ->
              ?return_consumed_capacity:return_consumed_capacity ->
                ?return_values:return_value ->
                  ?conditional_operator:conditional_operator ->
                    ?expected:expected_attribute_map ->
                      ?attribute_updates:attribute_updates ->
                        key:key ->
                          table_name:string -> unit -> update_item_input
val make_replica_global_secondary_index_settings_description :
  ?provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description
    ->
    ?provisioned_write_capacity_units:int ->
      ?provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description
        ->
        ?provisioned_read_capacity_units:int ->
          ?index_status:index_status ->
            index_name:string ->
              unit -> replica_global_secondary_index_settings_description
val make_replica_settings_description :
  ?replica_table_class_summary:table_class_summary ->
    ?replica_global_secondary_index_settings:replica_global_secondary_index_settings_description
      list ->
      ?replica_provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description
        ->
        ?replica_provisioned_write_capacity_units:int ->
          ?replica_provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description
            ->
            ?replica_provisioned_read_capacity_units:int ->
              ?replica_billing_mode_summary:billing_mode_summary ->
                ?replica_status:replica_status ->
                  region_name:string -> unit -> replica_settings_description
val make_update_global_table_settings_output :
  ?replica_settings:replica_settings_description list ->
    ?global_table_name:string -> unit -> update_global_table_settings_output
val make_global_table_global_secondary_index_settings_update :
  ?provisioned_write_capacity_auto_scaling_settings_update:auto_scaling_settings_update
    ->
    ?provisioned_write_capacity_units:int ->
      index_name:string ->
        unit -> global_table_global_secondary_index_settings_update
val make_replica_global_secondary_index_settings_update :
  ?provisioned_read_capacity_auto_scaling_settings_update:auto_scaling_settings_update
    ->
    ?provisioned_read_capacity_units:int ->
      index_name:string ->
        unit -> replica_global_secondary_index_settings_update
val make_replica_settings_update :
  ?replica_table_class:table_class ->
    ?replica_global_secondary_index_settings_update:replica_global_secondary_index_settings_update
      list ->
      ?replica_provisioned_read_capacity_auto_scaling_settings_update:auto_scaling_settings_update
        ->
        ?replica_provisioned_read_capacity_units:int ->
          region_name:string -> unit -> replica_settings_update
val make_update_global_table_settings_input :
  ?replica_settings_update:replica_settings_update list ->
    ?global_table_global_secondary_index_settings_update:global_table_global_secondary_index_settings_update
      list ->
      ?global_table_provisioned_write_capacity_auto_scaling_settings_update:auto_scaling_settings_update
        ->
        ?global_table_provisioned_write_capacity_units:int ->
          ?global_table_billing_mode:billing_mode ->
            global_table_name:string ->
              unit -> update_global_table_settings_input
val make_global_table_description :
  ?global_table_name:string ->
    ?global_table_status:global_table_status ->
      ?creation_date_time:CoreTypes.Timestamp.t ->
        ?global_table_arn:string ->
          ?replication_group:replica_description list ->
            unit -> global_table_description
val make_update_global_table_output :
  ?global_table_description:global_table_description ->
    unit -> update_global_table_output
val make_create_replica_action :
  region_name:string -> unit -> create_replica_action
val make_delete_replica_action :
  region_name:string -> unit -> delete_replica_action
val make_replica_update :
  ?delete:delete_replica_action ->
    ?create:create_replica_action -> unit -> replica_update
val make_update_global_table_input :
  replica_updates:replica_update list ->
    global_table_name:string -> unit -> update_global_table_input
val make_update_contributor_insights_output :
  ?contributor_insights_status:contributor_insights_status ->
    ?index_name:string ->
      ?table_name:string -> unit -> update_contributor_insights_output
val make_update_contributor_insights_input :
  ?index_name:string ->
    contributor_insights_action:contributor_insights_action ->
      table_name:string -> unit -> update_contributor_insights_input
val make_point_in_time_recovery_description :
  ?latest_restorable_date_time:CoreTypes.Timestamp.t ->
    ?earliest_restorable_date_time:CoreTypes.Timestamp.t ->
      ?point_in_time_recovery_status:point_in_time_recovery_status ->
        unit -> point_in_time_recovery_description
val make_continuous_backups_description :
  ?point_in_time_recovery_description:point_in_time_recovery_description ->
    continuous_backups_status:continuous_backups_status ->
      unit -> continuous_backups_description
val make_update_continuous_backups_output :
  ?continuous_backups_description:continuous_backups_description ->
    unit -> update_continuous_backups_output
val make_point_in_time_recovery_specification :
  point_in_time_recovery_enabled:bool ->
    unit -> point_in_time_recovery_specification
val make_update_continuous_backups_input :
  point_in_time_recovery_specification:point_in_time_recovery_specification
    -> table_name:string -> unit -> update_continuous_backups_input
val make_update :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure
    ->
    ?expression_attribute_values:expression_attribute_value_map ->
      ?expression_attribute_names:expression_attribute_name_map ->
        ?condition_expression:string ->
          table_name:string ->
            update_expression:string -> key:key -> unit -> update
val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit -> untag_resource_input
val make_cancellation_reason :
  ?message:string ->
    ?code:string -> ?item:attribute_map -> unit -> cancellation_reason
val make_transact_write_items_output :
  ?item_collection_metrics:item_collection_metrics_per_table ->
    ?consumed_capacity:consumed_capacity list ->
      unit -> transact_write_items_output
val make_condition_check :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure
    ->
    ?expression_attribute_values:expression_attribute_value_map ->
      ?expression_attribute_names:expression_attribute_name_map ->
        condition_expression:string ->
          table_name:string -> key:key -> unit -> condition_check
val make_put :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure
    ->
    ?expression_attribute_values:expression_attribute_value_map ->
      ?expression_attribute_names:expression_attribute_name_map ->
        ?condition_expression:string ->
          table_name:string ->
            item:put_item_input_attribute_map -> unit -> put
val make_delete :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure
    ->
    ?expression_attribute_values:expression_attribute_value_map ->
      ?expression_attribute_names:expression_attribute_name_map ->
        ?condition_expression:string ->
          table_name:string -> key:key -> unit -> delete
val make_transact_write_item :
  ?update:update ->
    ?delete:delete ->
      ?put:put ->
        ?condition_check:condition_check -> unit -> transact_write_item
val make_transact_write_items_input :
  ?client_request_token:string ->
    ?return_item_collection_metrics:return_item_collection_metrics ->
      ?return_consumed_capacity:return_consumed_capacity ->
        transact_items:transact_write_item list ->
          unit -> transact_write_items_input
val make_item_response : ?item:attribute_map -> unit -> item_response
val make_transact_get_items_output :
  ?responses:item_response list ->
    ?consumed_capacity:consumed_capacity list ->
      unit -> transact_get_items_output
val make_get :
  ?expression_attribute_names:expression_attribute_name_map ->
    ?projection_expression:string ->
      table_name:string -> key:key -> unit -> get
val make_transact_get_item : get:get -> unit -> transact_get_item
val make_transact_get_items_input :
  ?return_consumed_capacity:return_consumed_capacity ->
    transact_items:transact_get_item list -> unit -> transact_get_items_input
val make_time_to_live_description :
  ?attribute_name:string ->
    ?time_to_live_status:time_to_live_status ->
      unit -> time_to_live_description
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_resource_input :
  tags:tag list -> resource_arn:string -> unit -> tag_resource_input
val make_global_secondary_index :
  ?on_demand_throughput:on_demand_throughput ->
    ?provisioned_throughput:provisioned_throughput ->
      projection:projection ->
        key_schema:key_schema_element list ->
          index_name:string -> unit -> global_secondary_index
val make_table_creation_parameters :
  ?global_secondary_indexes:global_secondary_index list ->
    ?sse_specification:sse_specification ->
      ?on_demand_throughput:on_demand_throughput ->
        ?provisioned_throughput:provisioned_throughput ->
          ?billing_mode:billing_mode ->
            key_schema:key_schema_element list ->
              attribute_definitions:attribute_definition list ->
                table_name:string -> unit -> table_creation_parameters
val make_local_secondary_index_info :
  ?projection:projection ->
    ?key_schema:key_schema_element list ->
      ?index_name:string -> unit -> local_secondary_index_info
val make_global_secondary_index_info :
  ?on_demand_throughput:on_demand_throughput ->
    ?provisioned_throughput:provisioned_throughput ->
      ?projection:projection ->
        ?key_schema:key_schema_element list ->
          ?index_name:string -> unit -> global_secondary_index_info
val make_source_table_feature_details :
  ?sse_description:sse_description ->
    ?time_to_live_description:time_to_live_description ->
      ?stream_description:stream_specification ->
        ?global_secondary_indexes:global_secondary_index_info list ->
          ?local_secondary_indexes:local_secondary_index_info list ->
            unit -> source_table_feature_details
val make_source_table_details :
  ?billing_mode:billing_mode ->
    ?item_count:int ->
      ?on_demand_throughput:on_demand_throughput ->
        ?table_size_bytes:int ->
          ?table_arn:string ->
            provisioned_throughput:provisioned_throughput ->
              table_creation_date_time:CoreTypes.Timestamp.t ->
                key_schema:key_schema_element list ->
                  table_id:string ->
                    table_name:string -> unit -> source_table_details
val make_scan_output :
  ?consumed_capacity:consumed_capacity ->
    ?last_evaluated_key:key ->
      ?scanned_count:int ->
        ?count:int -> ?items:attribute_map list -> unit -> scan_output
val make_condition :
  ?attribute_value_list:attribute_value list ->
    comparison_operator:comparison_operator -> unit -> condition
val make_scan_input :
  ?consistent_read:bool ->
    ?expression_attribute_values:expression_attribute_value_map ->
      ?expression_attribute_names:expression_attribute_name_map ->
        ?filter_expression:string ->
          ?projection_expression:string ->
            ?segment:int ->
              ?total_segments:int ->
                ?return_consumed_capacity:return_consumed_capacity ->
                  ?exclusive_start_key:key ->
                    ?conditional_operator:conditional_operator ->
                      ?scan_filter:filter_condition_map ->
                        ?select:select ->
                          ?limit:int ->
                            ?attributes_to_get:string list ->
                              ?index_name:string ->
                                table_name:string -> unit -> scan_input
val make_s3_bucket_source :
  ?s3_key_prefix:string ->
    ?s3_bucket_owner:string -> s3_bucket:string -> unit -> s3_bucket_source
val make_restore_table_to_point_in_time_output :
  ?table_description:table_description ->
    unit -> restore_table_to_point_in_time_output
val make_local_secondary_index :
  projection:projection ->
    key_schema:key_schema_element list ->
      index_name:string -> unit -> local_secondary_index
val make_restore_table_to_point_in_time_input :
  ?sse_specification_override:sse_specification ->
    ?on_demand_throughput_override:on_demand_throughput ->
      ?provisioned_throughput_override:provisioned_throughput ->
        ?local_secondary_index_override:local_secondary_index list ->
          ?global_secondary_index_override:global_secondary_index list ->
            ?billing_mode_override:billing_mode ->
              ?restore_date_time:CoreTypes.Timestamp.t ->
                ?use_latest_restorable_time:bool ->
                  ?source_table_name:string ->
                    ?source_table_arn:string ->
                      target_table_name:string ->
                        unit -> restore_table_to_point_in_time_input
val make_restore_table_from_backup_output :
  ?table_description:table_description ->
    unit -> restore_table_from_backup_output
val make_restore_table_from_backup_input :
  ?sse_specification_override:sse_specification ->
    ?on_demand_throughput_override:on_demand_throughput ->
      ?provisioned_throughput_override:provisioned_throughput ->
        ?local_secondary_index_override:local_secondary_index list ->
          ?global_secondary_index_override:global_secondary_index list ->
            ?billing_mode_override:billing_mode ->
              backup_arn:string ->
                target_table_name:string ->
                  unit -> restore_table_from_backup_input
val make_replica : ?region_name:string -> unit -> replica
val make_query_output :
  ?consumed_capacity:consumed_capacity ->
    ?last_evaluated_key:key ->
      ?scanned_count:int ->
        ?count:int -> ?items:attribute_map list -> unit -> query_output
val make_query_input :
  ?expression_attribute_values:expression_attribute_value_map ->
    ?expression_attribute_names:expression_attribute_name_map ->
      ?key_condition_expression:string ->
        ?filter_expression:string ->
          ?projection_expression:string ->
            ?return_consumed_capacity:return_consumed_capacity ->
              ?exclusive_start_key:key ->
                ?scan_index_forward:bool ->
                  ?conditional_operator:conditional_operator ->
                    ?query_filter:filter_condition_map ->
                      ?key_conditions:key_conditions ->
                        ?consistent_read:bool ->
                          ?limit:int ->
                            ?attributes_to_get:string list ->
                              ?select:select ->
                                ?index_name:string ->
                                  table_name:string -> unit -> query_input
val make_put_resource_policy_output :
  ?revision_id:string -> unit -> put_resource_policy_output
val make_put_resource_policy_input :
  ?confirm_remove_self_resource_access:bool ->
    ?expected_revision_id:string ->
      policy:string ->
        resource_arn:string -> unit -> put_resource_policy_input
val make_put_item_output :
  ?item_collection_metrics:item_collection_metrics ->
    ?consumed_capacity:consumed_capacity ->
      ?attributes:attribute_map -> unit -> put_item_output
val make_put_item_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure
    ->
    ?expression_attribute_values:expression_attribute_value_map ->
      ?expression_attribute_names:expression_attribute_name_map ->
        ?condition_expression:string ->
          ?conditional_operator:conditional_operator ->
            ?return_item_collection_metrics:return_item_collection_metrics ->
              ?return_consumed_capacity:return_consumed_capacity ->
                ?return_values:return_value ->
                  ?expected:expected_attribute_map ->
                    item:put_item_input_attribute_map ->
                      table_name:string -> unit -> put_item_input
val make_batch_statement_error :
  ?item:attribute_map ->
    ?message:string ->
      ?code:batch_statement_error_code_enum -> unit -> batch_statement_error
val make_batch_statement_response :
  ?item:attribute_map ->
    ?table_name:string ->
      ?error:batch_statement_error -> unit -> batch_statement_response
val make_batch_statement_request :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure
    ->
    ?consistent_read:bool ->
      ?parameters:attribute_value list ->
        statement:string -> unit -> batch_statement_request
val make_parameterized_statement :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure
    ->
    ?parameters:attribute_value list ->
      statement:string -> unit -> parameterized_statement
val make_list_tags_of_resource_output :
  ?next_token:string ->
    ?tags:tag list -> unit -> list_tags_of_resource_output
val make_list_tags_of_resource_input :
  ?next_token:string ->
    resource_arn:string -> unit -> list_tags_of_resource_input
val make_list_tables_output :
  ?last_evaluated_table_name:string ->
    ?table_names:string list -> unit -> list_tables_output
val make_list_tables_input :
  ?limit:int ->
    ?exclusive_start_table_name:string -> unit -> list_tables_input
val make_import_summary :
  ?end_time:CoreTypes.Timestamp.t ->
    ?start_time:CoreTypes.Timestamp.t ->
      ?input_format:input_format ->
        ?cloud_watch_log_group_arn:string ->
          ?s3_bucket_source:s3_bucket_source ->
            ?table_arn:string ->
              ?import_status:import_status ->
                ?import_arn:string -> unit -> import_summary
val make_list_imports_output :
  ?next_token:string ->
    ?import_summary_list:import_summary list -> unit -> list_imports_output
val make_list_imports_input :
  ?next_token:string ->
    ?page_size:int -> ?table_arn:string -> unit -> list_imports_input
val make_global_table :
  ?replication_group:replica list ->
    ?global_table_name:string -> unit -> global_table
val make_list_global_tables_output :
  ?last_evaluated_global_table_name:string ->
    ?global_tables:global_table list -> unit -> list_global_tables_output
val make_list_global_tables_input :
  ?region_name:string ->
    ?limit:int ->
      ?exclusive_start_global_table_name:string ->
        unit -> list_global_tables_input
val make_export_summary :
  ?export_type:export_type ->
    ?export_status:export_status ->
      ?export_arn:string -> unit -> export_summary
val make_list_exports_output :
  ?next_token:string ->
    ?export_summaries:export_summary list -> unit -> list_exports_output
val make_list_exports_input :
  ?next_token:string ->
    ?max_results:int -> ?table_arn:string -> unit -> list_exports_input
val make_contributor_insights_summary :
  ?contributor_insights_status:contributor_insights_status ->
    ?index_name:string ->
      ?table_name:string -> unit -> contributor_insights_summary
val make_list_contributor_insights_output :
  ?next_token:string ->
    ?contributor_insights_summaries:contributor_insights_summary list ->
      unit -> list_contributor_insights_output
val make_list_contributor_insights_input :
  ?max_results:int ->
    ?next_token:string ->
      ?table_name:string -> unit -> list_contributor_insights_input
val make_backup_summary :
  ?backup_size_bytes:int ->
    ?backup_type:backup_type ->
      ?backup_status:backup_status ->
        ?backup_expiry_date_time:CoreTypes.Timestamp.t ->
          ?backup_creation_date_time:CoreTypes.Timestamp.t ->
            ?backup_name:string ->
              ?backup_arn:string ->
                ?table_arn:string ->
                  ?table_id:string ->
                    ?table_name:string -> unit -> backup_summary
val make_list_backups_output :
  ?last_evaluated_backup_arn:string ->
    ?backup_summaries:backup_summary list -> unit -> list_backups_output
val make_list_backups_input :
  ?backup_type:backup_type_filter ->
    ?exclusive_start_backup_arn:string ->
      ?time_range_upper_bound:CoreTypes.Timestamp.t ->
        ?time_range_lower_bound:CoreTypes.Timestamp.t ->
          ?limit:int -> ?table_name:string -> unit -> list_backups_input
val make_enable_kinesis_streaming_configuration :
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision
    -> unit -> enable_kinesis_streaming_configuration
val make_kinesis_streaming_destination_output :
  ?enable_kinesis_streaming_configuration:enable_kinesis_streaming_configuration
    ->
    ?destination_status:destination_status ->
      ?stream_arn:string ->
        ?table_name:string -> unit -> kinesis_streaming_destination_output
val make_kinesis_streaming_destination_input :
  ?enable_kinesis_streaming_configuration:enable_kinesis_streaming_configuration
    ->
    stream_arn:string ->
      table_name:string -> unit -> kinesis_streaming_destination_input
val make_kinesis_data_stream_destination :
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision
    ->
    ?destination_status_description:string ->
      ?destination_status:destination_status ->
        ?stream_arn:string -> unit -> kinesis_data_stream_destination
val make_keys_and_attributes :
  ?expression_attribute_names:expression_attribute_name_map ->
    ?projection_expression:string ->
      ?consistent_read:bool ->
        ?attributes_to_get:string list ->
          keys:key list -> unit -> keys_and_attributes
val make_csv_options :
  ?header_list:string list -> ?delimiter:string -> unit -> csv_options
val make_input_format_options :
  ?csv:csv_options -> unit -> input_format_options
val make_incremental_export_specification :
  ?export_view_type:export_view_type ->
    ?export_to_time:CoreTypes.Timestamp.t ->
      ?export_from_time:CoreTypes.Timestamp.t ->
        unit -> incremental_export_specification
val make_import_table_description :
  ?failure_message:string ->
    ?failure_code:string ->
      ?imported_item_count:int ->
        ?processed_item_count:int ->
          ?processed_size_bytes:int ->
            ?end_time:CoreTypes.Timestamp.t ->
              ?start_time:CoreTypes.Timestamp.t ->
                ?table_creation_parameters:table_creation_parameters ->
                  ?input_compression_type:input_compression_type ->
                    ?input_format_options:input_format_options ->
                      ?input_format:input_format ->
                        ?cloud_watch_log_group_arn:string ->
                          ?error_count:int ->
                            ?s3_bucket_source:s3_bucket_source ->
                              ?client_token:string ->
                                ?table_id:string ->
                                  ?table_arn:string ->
                                    ?import_status:import_status ->
                                      ?import_arn:string ->
                                        unit -> import_table_description
val make_import_table_output :
  import_table_description:import_table_description ->
    unit -> import_table_output
val make_import_table_input :
  ?input_compression_type:input_compression_type ->
    ?input_format_options:input_format_options ->
      ?client_token:string ->
        table_creation_parameters:table_creation_parameters ->
          input_format:input_format ->
            s3_bucket_source:s3_bucket_source -> unit -> import_table_input
val make_get_resource_policy_output :
  ?revision_id:string -> ?policy:string -> unit -> get_resource_policy_output
val make_get_resource_policy_input :
  resource_arn:string -> unit -> get_resource_policy_input
val make_get_item_output :
  ?consumed_capacity:consumed_capacity ->
    ?item:attribute_map -> unit -> get_item_output
val make_get_item_input :
  ?expression_attribute_names:expression_attribute_name_map ->
    ?projection_expression:string ->
      ?return_consumed_capacity:return_consumed_capacity ->
        ?consistent_read:bool ->
          ?attributes_to_get:string list ->
            key:key -> table_name:string -> unit -> get_item_input
val make_failure_exception :
  ?exception_description:string ->
    ?exception_name:string -> unit -> failure_exception
val make_export_description :
  ?incremental_export_specification:incremental_export_specification ->
    ?export_type:export_type ->
      ?item_count:int ->
        ?billed_size_bytes:int ->
          ?export_format:export_format ->
            ?failure_message:string ->
              ?failure_code:string ->
                ?s3_sse_kms_key_id:string ->
                  ?s3_sse_algorithm:s3_sse_algorithm ->
                    ?s3_prefix:string ->
                      ?s3_bucket_owner:string ->
                        ?s3_bucket:string ->
                          ?client_token:string ->
                            ?export_time:CoreTypes.Timestamp.t ->
                              ?table_id:string ->
                                ?table_arn:string ->
                                  ?export_manifest:string ->
                                    ?end_time:CoreTypes.Timestamp.t ->
                                      ?start_time:CoreTypes.Timestamp.t ->
                                        ?export_status:export_status ->
                                          ?export_arn:string ->
                                            unit -> export_description
val make_export_table_to_point_in_time_output :
  ?export_description:export_description ->
    unit -> export_table_to_point_in_time_output
val make_export_table_to_point_in_time_input :
  ?incremental_export_specification:incremental_export_specification ->
    ?export_type:export_type ->
      ?export_format:export_format ->
        ?s3_sse_kms_key_id:string ->
          ?s3_sse_algorithm:s3_sse_algorithm ->
            ?s3_prefix:string ->
              ?s3_bucket_owner:string ->
                ?client_token:string ->
                  ?export_time:CoreTypes.Timestamp.t ->
                    s3_bucket:string ->
                      table_arn:string ->
                        unit -> export_table_to_point_in_time_input
val make_execute_transaction_output :
  ?consumed_capacity:consumed_capacity list ->
    ?responses:item_response list -> unit -> execute_transaction_output
val make_execute_transaction_input :
  ?return_consumed_capacity:return_consumed_capacity ->
    ?client_request_token:string ->
      transact_statements:parameterized_statement list ->
        unit -> execute_transaction_input
val make_execute_statement_output :
  ?last_evaluated_key:key ->
    ?consumed_capacity:consumed_capacity ->
      ?next_token:string ->
        ?items:attribute_map list -> unit -> execute_statement_output
val make_execute_statement_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure
    ->
    ?limit:int ->
      ?return_consumed_capacity:return_consumed_capacity ->
        ?next_token:string ->
          ?consistent_read:bool ->
            ?parameters:attribute_value list ->
              statement:string -> unit -> execute_statement_input
val make_endpoint :
  cache_period_in_minutes:int -> address:string -> unit -> endpoint
val make_describe_time_to_live_output :
  ?time_to_live_description:time_to_live_description ->
    unit -> describe_time_to_live_output
val make_describe_time_to_live_input :
  table_name:string -> unit -> describe_time_to_live_input
val make_describe_table_replica_auto_scaling_output :
  ?table_auto_scaling_description:table_auto_scaling_description ->
    unit -> describe_table_replica_auto_scaling_output
val make_describe_table_replica_auto_scaling_input :
  table_name:string -> unit -> describe_table_replica_auto_scaling_input
val make_describe_table_output :
  ?table:table_description -> unit -> describe_table_output
val make_describe_table_input :
  table_name:string -> unit -> describe_table_input
val make_describe_limits_output :
  ?table_max_write_capacity_units:int ->
    ?table_max_read_capacity_units:int ->
      ?account_max_write_capacity_units:int ->
        ?account_max_read_capacity_units:int ->
          unit -> describe_limits_output
val make_describe_limits_input : unit -> unit
val make_describe_kinesis_streaming_destination_output :
  ?kinesis_data_stream_destinations:kinesis_data_stream_destination list ->
    ?table_name:string ->
      unit -> describe_kinesis_streaming_destination_output
val make_describe_kinesis_streaming_destination_input :
  table_name:string -> unit -> describe_kinesis_streaming_destination_input
val make_describe_import_output :
  import_table_description:import_table_description ->
    unit -> describe_import_output
val make_describe_import_input :
  import_arn:string -> unit -> describe_import_input
val make_describe_global_table_settings_output :
  ?replica_settings:replica_settings_description list ->
    ?global_table_name:string ->
      unit -> describe_global_table_settings_output
val make_describe_global_table_settings_input :
  global_table_name:string -> unit -> describe_global_table_settings_input
val make_describe_global_table_output :
  ?global_table_description:global_table_description ->
    unit -> describe_global_table_output
val make_describe_global_table_input :
  global_table_name:string -> unit -> describe_global_table_input
val make_describe_export_output :
  ?export_description:export_description -> unit -> describe_export_output
val make_describe_export_input :
  export_arn:string -> unit -> describe_export_input
val make_describe_endpoints_response :
  endpoints:endpoint list -> unit -> describe_endpoints_response
val make_describe_endpoints_request : unit -> unit
val make_describe_contributor_insights_output :
  ?failure_exception:failure_exception ->
    ?last_update_date_time:CoreTypes.Timestamp.t ->
      ?contributor_insights_status:contributor_insights_status ->
        ?contributor_insights_rule_list:string list ->
          ?index_name:string ->
            ?table_name:string ->
              unit -> describe_contributor_insights_output
val make_describe_contributor_insights_input :
  ?index_name:string ->
    table_name:string -> unit -> describe_contributor_insights_input
val make_describe_continuous_backups_output :
  ?continuous_backups_description:continuous_backups_description ->
    unit -> describe_continuous_backups_output
val make_describe_continuous_backups_input :
  table_name:string -> unit -> describe_continuous_backups_input
val make_backup_details :
  ?backup_expiry_date_time:CoreTypes.Timestamp.t ->
    ?backup_size_bytes:int ->
      backup_creation_date_time:CoreTypes.Timestamp.t ->
        backup_type:backup_type ->
          backup_status:backup_status ->
            backup_name:string -> backup_arn:string -> unit -> backup_details
val make_backup_description :
  ?source_table_feature_details:source_table_feature_details ->
    ?source_table_details:source_table_details ->
      ?backup_details:backup_details -> unit -> backup_description
val make_describe_backup_output :
  ?backup_description:backup_description -> unit -> describe_backup_output
val make_describe_backup_input :
  backup_arn:string -> unit -> describe_backup_input
val make_delete_table_output :
  ?table_description:table_description -> unit -> delete_table_output
val make_delete_table_input : table_name:string -> unit -> delete_table_input
val make_delete_resource_policy_output :
  ?revision_id:string -> unit -> delete_resource_policy_output
val make_delete_resource_policy_input :
  ?expected_revision_id:string ->
    resource_arn:string -> unit -> delete_resource_policy_input
val make_delete_item_output :
  ?item_collection_metrics:item_collection_metrics ->
    ?consumed_capacity:consumed_capacity ->
      ?attributes:attribute_map -> unit -> delete_item_output
val make_delete_item_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure
    ->
    ?expression_attribute_values:expression_attribute_value_map ->
      ?expression_attribute_names:expression_attribute_name_map ->
        ?condition_expression:string ->
          ?return_item_collection_metrics:return_item_collection_metrics ->
            ?return_consumed_capacity:return_consumed_capacity ->
              ?return_values:return_value ->
                ?conditional_operator:conditional_operator ->
                  ?expected:expected_attribute_map ->
                    key:key -> table_name:string -> unit -> delete_item_input
val make_delete_backup_output :
  ?backup_description:backup_description -> unit -> delete_backup_output
val make_delete_backup_input :
  backup_arn:string -> unit -> delete_backup_input
val make_create_table_output :
  ?table_description:table_description -> unit -> create_table_output
val make_create_table_input :
  ?on_demand_throughput:on_demand_throughput ->
    ?resource_policy:string ->
      ?deletion_protection_enabled:bool ->
        ?table_class:table_class ->
          ?tags:tag list ->
            ?sse_specification:sse_specification ->
              ?stream_specification:stream_specification ->
                ?provisioned_throughput:provisioned_throughput ->
                  ?billing_mode:billing_mode ->
                    ?global_secondary_indexes:global_secondary_index list ->
                      ?local_secondary_indexes:local_secondary_index list ->
                        key_schema:key_schema_element list ->
                          table_name:string ->
                            attribute_definitions:attribute_definition list
                              -> unit -> create_table_input
val make_create_global_table_output :
  ?global_table_description:global_table_description ->
    unit -> create_global_table_output
val make_create_global_table_input :
  replication_group:replica list ->
    global_table_name:string -> unit -> create_global_table_input
val make_create_backup_output :
  ?backup_details:backup_details -> unit -> create_backup_output
val make_create_backup_input :
  backup_name:string -> table_name:string -> unit -> create_backup_input
val make_batch_write_item_output :
  ?consumed_capacity:consumed_capacity list ->
    ?item_collection_metrics:item_collection_metrics_per_table ->
      ?unprocessed_items:batch_write_item_request_map ->
        unit -> batch_write_item_output
val make_batch_write_item_input :
  ?return_item_collection_metrics:return_item_collection_metrics ->
    ?return_consumed_capacity:return_consumed_capacity ->
      request_items:batch_write_item_request_map ->
        unit -> batch_write_item_input
val make_batch_get_item_output :
  ?consumed_capacity:consumed_capacity list ->
    ?unprocessed_keys:batch_get_request_map ->
      ?responses:batch_get_response_map -> unit -> batch_get_item_output
val make_batch_get_item_input :
  ?return_consumed_capacity:return_consumed_capacity ->
    request_items:batch_get_request_map -> unit -> batch_get_item_input
val make_batch_execute_statement_output :
  ?consumed_capacity:consumed_capacity list ->
    ?responses:batch_statement_response list ->
      unit -> batch_execute_statement_output
val make_batch_execute_statement_input :
  ?return_consumed_capacity:return_consumed_capacity ->
    statements:batch_statement_request list ->
      unit -> batch_execute_statement_input(** {1:operations Operations} *)

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