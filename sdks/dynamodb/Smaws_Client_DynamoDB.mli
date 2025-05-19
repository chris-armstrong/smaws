(** 
    DynamoDB client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type attribute_value =
  | BOOL of bool 
  | NULL of bool 
  | L of attribute_value list 
  | M of map_attribute_value 
  | BS of bytes list 
  | NS of string list 
  | SS of string list 
  | B of bytes 
  | N of string 
  | S of string [@@ocaml.doc
                  "Represents the data for an attribute.\n\n Each attribute value is described as a name-value pair. The name is the data type, and the value is the data itself.\n \n  For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes}Data Types} in the {i Amazon DynamoDB Developer Guide}.\n  "]
and map_attribute_value = (string * attribute_value) list[@@ocaml.doc ""]
type nonrec put_item_input_attribute_map = (string * attribute_value) list
[@@ocaml.doc ""]
type nonrec put_request = {
  item: put_item_input_attribute_map }[@@ocaml.doc
                                        "Represents a request to perform a [PutItem] operation on an item.\n"]
type nonrec key = (string * attribute_value) list[@@ocaml.doc ""]
type nonrec delete_request = {
  key: key }[@@ocaml.doc
              "Represents a request to perform a [DeleteItem] operation on an item.\n"]
type nonrec write_request =
  {
  delete_request: delete_request option ;
  put_request: put_request option }[@@ocaml.doc
                                     "Represents an operation to perform - either [DeleteItem] or [PutItem]. You can only request one of these operations, not both, in a single [WriteRequest]. If you do need to perform both of these operations, you need to provide two separate [WriteRequest] objects.\n"]
type nonrec time_to_live_specification =
  {
  attribute_name: string ;
  enabled: bool }[@@ocaml.doc
                   "Represents the settings used to enable or disable Time to Live (TTL) for the specified table.\n"]
type nonrec update_time_to_live_output =
  {
  time_to_live_specification: time_to_live_specification option }[@@ocaml.doc
                                                                   ""]
type nonrec update_time_to_live_input =
  {
  time_to_live_specification: time_to_live_specification ;
  table_name: string }[@@ocaml.doc
                        "Represents the input of an [UpdateTimeToLive] operation.\n"]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The operation tried to access a nonexistent table or index. The resource might not be specified correctly, or its status might not be [ACTIVE].\n"]
type nonrec resource_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "The operation conflicts with the resource's availability. For example, you attempted to recreate an existing table, or tried to delete a table currently in the [CREATING] state.\n"]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "There is no limit to the number of daily on-demand backups that can be taken. \n\n For most purposes, up to 500 simultaneous table operations are allowed per account. These operations include [CreateTable], [UpdateTable], [DeleteTable],[UpdateTimeToLive], [RestoreTableFromBackup], and [RestoreTableToPointInTime]. \n \n  When you are creating a table with one or more secondary indexes, you can have up to 250 such requests running at a time. However, if the table or index specifications are complex, then DynamoDB might temporarily reduce the number of concurrent operations.\n  \n   When importing into DynamoDB, up to 50 simultaneous import table operations are allowed per account.\n   \n    There is a soft account quota of 2,500 tables.\n    \n     GetRecords was called with a value of more than 1000 for the limit request parameter.\n     \n      More than 2 processes are reading from the same streams shard at the same time. Exceeding this limit may result in request throttling.\n      "]
type nonrec invalid_endpoint_exception = {
  message: string option }[@@ocaml.doc ""]
type nonrec internal_server_error = {
  message: string option }[@@ocaml.doc
                            "An error occurred on the server side.\n"]
type nonrec table_status =
  | ARCHIVED 
  | ARCHIVING 
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS 
  | ACTIVE 
  | DELETING 
  | UPDATING 
  | CREATING [@@ocaml.doc ""]
type nonrec index_status =
  | ACTIVE 
  | DELETING 
  | UPDATING 
  | CREATING [@@ocaml.doc ""]
type nonrec auto_scaling_target_tracking_scaling_policy_configuration_description =
  {
  target_value: float ;
  scale_out_cooldown: int option ;
  scale_in_cooldown: int option ;
  disable_scale_in: bool option }[@@ocaml.doc
                                   "Represents the properties of a target tracking scaling policy.\n"]
type nonrec auto_scaling_policy_description =
  {
  target_tracking_scaling_policy_configuration:
    auto_scaling_target_tracking_scaling_policy_configuration_description
      option
    ;
  policy_name: string option }[@@ocaml.doc
                                "Represents the properties of the scaling policy.\n"]
type nonrec auto_scaling_settings_description =
  {
  scaling_policies: auto_scaling_policy_description list option ;
  auto_scaling_role_arn: string option ;
  auto_scaling_disabled: bool option ;
  maximum_units: int option ;
  minimum_units: int option }[@@ocaml.doc
                               "Represents the auto scaling settings for a global table or global secondary index.\n"]
type nonrec replica_global_secondary_index_auto_scaling_description =
  {
  provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  index_status: index_status option ;
  index_name: string option }[@@ocaml.doc
                               "Represents the auto scaling configuration for a replica global secondary index.\n"]
type nonrec replica_status =
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS 
  | REGION_DISABLED 
  | ACTIVE 
  | DELETING 
  | UPDATING 
  | CREATION_FAILED 
  | CREATING [@@ocaml.doc ""]
type nonrec replica_auto_scaling_description =
  {
  replica_status: replica_status option ;
  replica_provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  replica_provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  global_secondary_indexes:
    replica_global_secondary_index_auto_scaling_description list option ;
  region_name: string option }[@@ocaml.doc
                                "Represents the auto scaling settings of the replica.\n"]
type nonrec table_auto_scaling_description =
  {
  replicas: replica_auto_scaling_description list option ;
  table_status: table_status option ;
  table_name: string option }[@@ocaml.doc
                               "Represents the auto scaling configuration for a global table.\n"]
type nonrec update_table_replica_auto_scaling_output =
  {
  table_auto_scaling_description: table_auto_scaling_description option }
[@@ocaml.doc ""]
type nonrec auto_scaling_target_tracking_scaling_policy_configuration_update =
  {
  target_value: float ;
  scale_out_cooldown: int option ;
  scale_in_cooldown: int option ;
  disable_scale_in: bool option }[@@ocaml.doc
                                   "Represents the settings of a target tracking scaling policy that will be modified.\n"]
type nonrec auto_scaling_policy_update =
  {
  target_tracking_scaling_policy_configuration:
    auto_scaling_target_tracking_scaling_policy_configuration_update ;
  policy_name: string option }[@@ocaml.doc
                                "Represents the auto scaling policy to be modified.\n"]
type nonrec auto_scaling_settings_update =
  {
  scaling_policy_update: auto_scaling_policy_update option ;
  auto_scaling_role_arn: string option ;
  auto_scaling_disabled: bool option ;
  maximum_units: int option ;
  minimum_units: int option }[@@ocaml.doc
                               "Represents the auto scaling settings to be modified for a global table or global secondary index.\n"]
type nonrec global_secondary_index_auto_scaling_update =
  {
  provisioned_write_capacity_auto_scaling_update:
    auto_scaling_settings_update option ;
  index_name: string option }[@@ocaml.doc
                               "Represents the auto scaling settings of a global secondary index for a global table that will be modified.\n"]
type nonrec replica_global_secondary_index_auto_scaling_update =
  {
  provisioned_read_capacity_auto_scaling_update:
    auto_scaling_settings_update option ;
  index_name: string option }[@@ocaml.doc
                               "Represents the auto scaling settings of a global secondary index for a replica that will be modified.\n"]
type nonrec replica_auto_scaling_update =
  {
  replica_provisioned_read_capacity_auto_scaling_update:
    auto_scaling_settings_update option ;
  replica_global_secondary_index_updates:
    replica_global_secondary_index_auto_scaling_update list option ;
  region_name: string }[@@ocaml.doc
                         "Represents the auto scaling settings of a replica that will be modified.\n"]
type nonrec update_table_replica_auto_scaling_input =
  {
  replica_updates: replica_auto_scaling_update list option ;
  provisioned_write_capacity_auto_scaling_update:
    auto_scaling_settings_update option ;
  table_name: string ;
  global_secondary_index_updates:
    global_secondary_index_auto_scaling_update list option }[@@ocaml.doc ""]
type nonrec scalar_attribute_type =
  | B 
  | N 
  | S [@@ocaml.doc ""]
type nonrec attribute_definition =
  {
  attribute_type: scalar_attribute_type ;
  attribute_name: string }[@@ocaml.doc
                            "Represents an attribute for describing the schema for the table and indexes.\n"]
type nonrec key_type =
  | RANGE 
  | HASH [@@ocaml.doc ""]
type nonrec key_schema_element =
  {
  key_type: key_type ;
  attribute_name: string }[@@ocaml.doc
                            "Represents {i a single element} of a key schema. A key schema specifies the attributes that make up the primary key of a table, or the key attributes of an index.\n\n A [KeySchemaElement] represents exactly one attribute of the primary key. For example, a simple primary key would be represented by one [KeySchemaElement] (for the partition key). A composite primary key would require one [KeySchemaElement] for the partition key, and another [KeySchemaElement] for the sort key.\n \n  A [KeySchemaElement] must be a scalar, top-level attribute (not a nested attribute). The data type must be one of String, Number, or Binary. The attribute cannot be nested within a List or a Map.\n  "]
type nonrec provisioned_throughput_description =
  {
  write_capacity_units: int option ;
  read_capacity_units: int option ;
  number_of_decreases_today: int option ;
  last_decrease_date_time: CoreTypes.Timestamp.t option ;
  last_increase_date_time: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                                           "Represents the provisioned throughput settings for the table, consisting of read and write capacity units, along with data about increases and decreases.\n"]
type nonrec billing_mode =
  | PAY_PER_REQUEST 
  | PROVISIONED [@@ocaml.doc ""]
type nonrec billing_mode_summary =
  {
  last_update_to_pay_per_request_date_time: CoreTypes.Timestamp.t option ;
  billing_mode: billing_mode option }[@@ocaml.doc
                                       "Contains the details for the read/write capacity mode. This page talks about [PROVISIONED] and [PAY_PER_REQUEST] billing modes. For more information about these modes, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html}Read/write capacity mode}.\n\n  You may need to switch to on-demand mode at least once in order to return a [BillingModeSummary] response.\n  \n   "]
type nonrec projection_type =
  | INCLUDE 
  | KEYS_ONLY 
  | ALL [@@ocaml.doc ""]
type nonrec projection =
  {
  non_key_attributes: string list option ;
  projection_type: projection_type option }[@@ocaml.doc
                                             "Represents attributes that are copied (projected) from the table into an index. These are in addition to the primary key attributes and index key attributes, which are automatically projected.\n"]
type nonrec local_secondary_index_description =
  {
  index_arn: string option ;
  item_count: int option ;
  index_size_bytes: int option ;
  projection: projection option ;
  key_schema: key_schema_element list option ;
  index_name: string option }[@@ocaml.doc
                               "Represents the properties of a local secondary index.\n"]
type nonrec on_demand_throughput =
  {
  max_write_request_units: int option ;
  max_read_request_units: int option }[@@ocaml.doc
                                        "Sets the maximum number of read and write units for the specified on-demand table. If you use this parameter, you must specify [MaxReadRequestUnits], [MaxWriteRequestUnits], or both.\n"]
type nonrec global_secondary_index_description =
  {
  on_demand_throughput: on_demand_throughput option ;
  index_arn: string option ;
  item_count: int option ;
  index_size_bytes: int option ;
  provisioned_throughput: provisioned_throughput_description option ;
  backfilling: bool option ;
  index_status: index_status option ;
  projection: projection option ;
  key_schema: key_schema_element list option ;
  index_name: string option }[@@ocaml.doc
                               "Represents the properties of a global secondary index.\n"]
type nonrec stream_view_type =
  | KEYS_ONLY 
  | NEW_AND_OLD_IMAGES 
  | OLD_IMAGE 
  | NEW_IMAGE [@@ocaml.doc ""]
type nonrec stream_specification =
  {
  stream_view_type: stream_view_type option ;
  stream_enabled: bool }[@@ocaml.doc
                          "Represents the DynamoDB Streams configuration for a table in DynamoDB.\n"]
type nonrec provisioned_throughput_override =
  {
  read_capacity_units: int option }[@@ocaml.doc
                                     "Replica-specific provisioned throughput settings. If not specified, uses the source table's provisioned throughput settings.\n"]
type nonrec on_demand_throughput_override =
  {
  max_read_request_units: int option }[@@ocaml.doc
                                        "Overrides the on-demand throughput settings for this replica table. If you don't specify a value for this parameter, it uses the source table's on-demand throughput settings.\n"]
type nonrec replica_global_secondary_index_description =
  {
  on_demand_throughput_override: on_demand_throughput_override option ;
  provisioned_throughput_override: provisioned_throughput_override option ;
  index_name: string option }[@@ocaml.doc
                               "Represents the properties of a replica global secondary index.\n"]
type nonrec table_class =
  | STANDARD_INFREQUENT_ACCESS 
  | STANDARD [@@ocaml.doc ""]
type nonrec table_class_summary =
  {
  last_update_date_time: CoreTypes.Timestamp.t option ;
  table_class: table_class option }[@@ocaml.doc
                                     "Contains details of the table class.\n"]
type nonrec replica_description =
  {
  replica_table_class_summary: table_class_summary option ;
  replica_inaccessible_date_time: CoreTypes.Timestamp.t option ;
  global_secondary_indexes:
    replica_global_secondary_index_description list option ;
  on_demand_throughput_override: on_demand_throughput_override option ;
  provisioned_throughput_override: provisioned_throughput_override option ;
  kms_master_key_id: string option ;
  replica_status_percent_progress: string option ;
  replica_status_description: string option ;
  replica_status: replica_status option ;
  region_name: string option }[@@ocaml.doc
                                "Contains the details of the replica.\n"]
type nonrec restore_summary =
  {
  restore_in_progress: bool ;
  restore_date_time: CoreTypes.Timestamp.t ;
  source_table_arn: string option ;
  source_backup_arn: string option }[@@ocaml.doc
                                      "Contains details for the restore.\n"]
type nonrec sse_status =
  | UPDATING 
  | DISABLED 
  | DISABLING 
  | ENABLED 
  | ENABLING [@@ocaml.doc ""]
type nonrec sse_type =
  | KMS 
  | AES256 [@@ocaml.doc ""]
type nonrec sse_description =
  {
  inaccessible_encryption_date_time: CoreTypes.Timestamp.t option ;
  kms_master_key_arn: string option ;
  sse_type: sse_type option ;
  status: sse_status option }[@@ocaml.doc
                               "The description of the server-side encryption status on the specified table.\n"]
type nonrec archival_summary =
  {
  archival_backup_arn: string option ;
  archival_reason: string option ;
  archival_date_time: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                                      "Contains details of a table archival operation.\n"]
type nonrec table_description =
  {
  on_demand_throughput: on_demand_throughput option ;
  deletion_protection_enabled: bool option ;
  table_class_summary: table_class_summary option ;
  archival_summary: archival_summary option ;
  sse_description: sse_description option ;
  restore_summary: restore_summary option ;
  replicas: replica_description list option ;
  global_table_version: string option ;
  latest_stream_arn: string option ;
  latest_stream_label: string option ;
  stream_specification: stream_specification option ;
  global_secondary_indexes: global_secondary_index_description list option ;
  local_secondary_indexes: local_secondary_index_description list option ;
  billing_mode_summary: billing_mode_summary option ;
  table_id: string option ;
  table_arn: string option ;
  item_count: int option ;
  table_size_bytes: int option ;
  provisioned_throughput: provisioned_throughput_description option ;
  creation_date_time: CoreTypes.Timestamp.t option ;
  table_status: table_status option ;
  key_schema: key_schema_element list option ;
  table_name: string option ;
  attribute_definitions: attribute_definition list option }[@@ocaml.doc
                                                             "Represents the properties of a table.\n"]
type nonrec update_table_output =
  {
  table_description: table_description option }[@@ocaml.doc
                                                 "Represents the output of an [UpdateTable] operation.\n"]
type nonrec provisioned_throughput =
  {
  write_capacity_units: int ;
  read_capacity_units: int }[@@ocaml.doc
                              "Represents the provisioned throughput settings for a specified table or index. The settings can be modified using the [UpdateTable] operation.\n\n For current minimum and maximum provisioned throughput values, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html}Service, Account, and Table Quotas} in the {i Amazon DynamoDB Developer Guide}.\n "]
type nonrec update_global_secondary_index_action =
  {
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput option ;
  index_name: string }[@@ocaml.doc
                        "Represents the new provisioned throughput settings to be applied to a global secondary index.\n"]
type nonrec create_global_secondary_index_action =
  {
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput option ;
  projection: projection ;
  key_schema: key_schema_element list ;
  index_name: string }[@@ocaml.doc
                        "Represents a new global secondary index to be added to an existing table.\n"]
type nonrec delete_global_secondary_index_action = {
  index_name: string }[@@ocaml.doc
                        "Represents a global secondary index to be deleted from an existing table.\n"]
type nonrec global_secondary_index_update =
  {
  delete: delete_global_secondary_index_action option ;
  create: create_global_secondary_index_action option ;
  update: update_global_secondary_index_action option }[@@ocaml.doc
                                                         "Represents one of the following:\n\n {ul\n       {-  A new global secondary index to be added to an existing table.\n           \n            }\n       {-  New provisioned throughput parameters for an existing global secondary index.\n           \n            }\n       {-  An existing global secondary index to be removed from an existing table.\n           \n            }\n       }\n  "]
type nonrec sse_specification =
  {
  kms_master_key_id: string option ;
  sse_type: sse_type option ;
  enabled: bool option }[@@ocaml.doc
                          "Represents the settings used to enable server-side encryption.\n"]
type nonrec replica_global_secondary_index =
  {
  on_demand_throughput_override: on_demand_throughput_override option ;
  provisioned_throughput_override: provisioned_throughput_override option ;
  index_name: string }[@@ocaml.doc
                        "Represents the properties of a replica global secondary index.\n"]
type nonrec create_replication_group_member_action =
  {
  table_class_override: table_class option ;
  global_secondary_indexes: replica_global_secondary_index list option ;
  on_demand_throughput_override: on_demand_throughput_override option ;
  provisioned_throughput_override: provisioned_throughput_override option ;
  kms_master_key_id: string option ;
  region_name: string }[@@ocaml.doc "Represents a replica to be created.\n"]
type nonrec update_replication_group_member_action =
  {
  table_class_override: table_class option ;
  global_secondary_indexes: replica_global_secondary_index list option ;
  on_demand_throughput_override: on_demand_throughput_override option ;
  provisioned_throughput_override: provisioned_throughput_override option ;
  kms_master_key_id: string option ;
  region_name: string }[@@ocaml.doc "Represents a replica to be modified.\n"]
type nonrec delete_replication_group_member_action = {
  region_name: string }[@@ocaml.doc "Represents a replica to be deleted.\n"]
type nonrec replication_group_update =
  {
  delete: delete_replication_group_member_action option ;
  update: update_replication_group_member_action option ;
  create: create_replication_group_member_action option }[@@ocaml.doc
                                                           "Represents one of the following:\n\n {ul\n       {-  A new replica to be added to an existing regional table or global table. This request invokes the [CreateTableReplica] action in the destination Region.\n           \n            }\n       {-  New parameters for an existing replica. This request invokes the [UpdateTable] action in the destination Region.\n           \n            }\n       {-  An existing replica to be deleted. The request invokes the [DeleteTableReplica] action in the destination Region, deleting the replica and all if its items in the destination Region.\n           \n            }\n       }\n    When you manually remove a table or global table replica, you do not automatically remove any associated scalable targets, scaling policies, or CloudWatch alarms.\n    \n     "]
type nonrec update_table_input =
  {
  on_demand_throughput: on_demand_throughput option ;
  deletion_protection_enabled: bool option ;
  table_class: table_class option ;
  replica_updates: replication_group_update list option ;
  sse_specification: sse_specification option ;
  stream_specification: stream_specification option ;
  global_secondary_index_updates: global_secondary_index_update list option ;
  provisioned_throughput: provisioned_throughput option ;
  billing_mode: billing_mode option ;
  table_name: string ;
  attribute_definitions: attribute_definition list option }[@@ocaml.doc
                                                             "Represents the input of an [UpdateTable] operation.\n"]
type nonrec destination_status =
  | UPDATING 
  | ENABLE_FAILED 
  | DISABLED 
  | DISABLING 
  | ACTIVE 
  | ENABLING [@@ocaml.doc ""]
type nonrec approximate_creation_date_time_precision =
  | MICROSECOND 
  | MILLISECOND [@@ocaml.doc ""]
type nonrec update_kinesis_streaming_configuration =
  {
  approximate_creation_date_time_precision:
    approximate_creation_date_time_precision option }[@@ocaml.doc
                                                       "Enables updating the configuration for Kinesis Streaming.\n"]
type nonrec update_kinesis_streaming_destination_output =
  {
  update_kinesis_streaming_configuration:
    update_kinesis_streaming_configuration option ;
  destination_status: destination_status option ;
  stream_arn: string option ;
  table_name: string option }[@@ocaml.doc ""]
type nonrec update_kinesis_streaming_destination_input =
  {
  update_kinesis_streaming_configuration:
    update_kinesis_streaming_configuration option ;
  stream_arn: string ;
  table_name: string }[@@ocaml.doc ""]
type nonrec attribute_map = (string * attribute_value) list[@@ocaml.doc ""]
type nonrec capacity =
  {
  capacity_units: float option ;
  write_capacity_units: float option ;
  read_capacity_units: float option }[@@ocaml.doc
                                       "Represents the amount of provisioned throughput capacity consumed on a table or an index.\n"]
type nonrec secondary_indexes_capacity_map = (string * capacity) list
[@@ocaml.doc ""]
type nonrec consumed_capacity =
  {
  global_secondary_indexes: secondary_indexes_capacity_map option ;
  local_secondary_indexes: secondary_indexes_capacity_map option ;
  table: capacity option ;
  write_capacity_units: float option ;
  read_capacity_units: float option ;
  capacity_units: float option ;
  table_name: string option }[@@ocaml.doc
                               "The capacity units consumed by an operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. [ConsumedCapacity] is only returned if the request asked for it. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html}Provisioned capacity mode} in the {i Amazon DynamoDB Developer Guide}.\n"]
type nonrec item_collection_key_attribute_map =
  (string * attribute_value) list[@@ocaml.doc ""]
type nonrec item_collection_metrics =
  {
  size_estimate_range_g_b: float list option ;
  item_collection_key: item_collection_key_attribute_map option }[@@ocaml.doc
                                                                   "Information about item collections, if any, that were affected by the operation. [ItemCollectionMetrics] is only returned if the request asked for it. If the table does not have any local secondary indexes, this information is not returned in the response.\n"]
type nonrec update_item_output =
  {
  item_collection_metrics: item_collection_metrics option ;
  consumed_capacity: consumed_capacity option ;
  attributes: attribute_map option }[@@ocaml.doc
                                      "Represents the output of an [UpdateItem] operation.\n"]
type nonrec attribute_action =
  | DELETE 
  | PUT 
  | ADD [@@ocaml.doc ""]
type nonrec attribute_value_update =
  {
  action: attribute_action option ;
  value: attribute_value option }[@@ocaml.doc
                                   "For the [UpdateItem] operation, represents the attributes to be modified, the action to perform on each, and the new value for each.\n\n  You cannot use [UpdateItem] to update any primary key attributes. Instead, you will need to delete the item, and then use [PutItem] to create a new item with new attributes.\n  \n    Attribute values cannot be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests with empty values will be rejected with a [ValidationException] exception.\n    "]
type nonrec attribute_updates = (string * attribute_value_update) list
[@@ocaml.doc ""]
type nonrec comparison_operator =
  | BEGINS_WITH 
  | NOT_CONTAINS 
  | CONTAINS 
  | NULL 
  | NOT_NULL 
  | BETWEEN 
  | GT 
  | GE 
  | LT 
  | LE 
  | IN 
  | NE 
  | EQ [@@ocaml.doc ""]
type nonrec expected_attribute_value =
  {
  attribute_value_list: attribute_value list option ;
  comparison_operator: comparison_operator option ;
  exists: bool option ;
  value: attribute_value option }[@@ocaml.doc
                                   "Represents a condition to be compared with an attribute value. This condition can be used with [DeleteItem], [PutItem], or [UpdateItem] operations; if the comparison evaluates to true, the operation succeeds; if not, the operation fails. You can use [ExpectedAttributeValue] in one of two different ways:\n\n {ul\n       {-  Use [AttributeValueList] to specify one or more values to compare against an attribute. Use [ComparisonOperator] to specify how you want to perform the comparison. If the comparison evaluates to true, then the conditional operation succeeds.\n           \n            }\n       {-  Use [Value] to specify a value that DynamoDB will compare against an attribute. If the values match, then [ExpectedAttributeValue] evaluates to true and the conditional operation succeeds. Optionally, you can also set [Exists] to false, indicating that you {i do not} expect to find the attribute value in the table. In this case, the conditional operation succeeds only if the comparison evaluates to false.\n           \n            }\n       }\n    [Value] and [Exists] are incompatible with [AttributeValueList] and [ComparisonOperator]. Note that if you use both sets of parameters at once, DynamoDB will return a [ValidationException] exception.\n   "]
type nonrec expected_attribute_map = (string * expected_attribute_value) list
[@@ocaml.doc ""]
type nonrec conditional_operator =
  | OR 
  | AND [@@ocaml.doc ""]
type nonrec return_value =
  | UPDATED_NEW 
  | ALL_NEW 
  | UPDATED_OLD 
  | ALL_OLD 
  | NONE [@@ocaml.doc ""]
type nonrec return_consumed_capacity =
  | NONE 
  | TOTAL 
  | INDEXES [@@ocaml.doc
              "Determines the level of detail about either provisioned or on-demand throughput consumption that is returned in the response:\n\n {ul\n       {-   [INDEXES] - The response includes the aggregate [ConsumedCapacity] for the operation, together with [ConsumedCapacity] for each table and secondary index that was accessed.\n           \n            Note that some operations, such as [GetItem] and [BatchGetItem], do not access any indexes at all. In these cases, specifying [INDEXES] will only return [ConsumedCapacity] information for table(s).\n            \n             }\n       {-   [TOTAL] - The response includes only the aggregate [ConsumedCapacity] for the operation.\n           \n            }\n       {-   [NONE] - No [ConsumedCapacity] details are included in the response.\n           \n            }\n       }\n  "]
type nonrec return_item_collection_metrics =
  | NONE 
  | SIZE [@@ocaml.doc ""]
type nonrec expression_attribute_name_map = (string * string) list[@@ocaml.doc
                                                                    ""]
type nonrec expression_attribute_value_map = (string * attribute_value) list
[@@ocaml.doc ""]
type nonrec return_values_on_condition_check_failure =
  | NONE 
  | ALL_OLD [@@ocaml.doc ""]
type nonrec update_item_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: expression_attribute_value_map option ;
  expression_attribute_names: expression_attribute_name_map option ;
  condition_expression: string option ;
  update_expression: string option ;
  return_item_collection_metrics: return_item_collection_metrics option ;
  return_consumed_capacity: return_consumed_capacity option ;
  return_values: return_value option ;
  conditional_operator: conditional_operator option ;
  expected: expected_attribute_map option ;
  attribute_updates: attribute_updates option ;
  key: key ;
  table_name: string }[@@ocaml.doc
                        "Represents the input of an [UpdateItem] operation.\n"]
type nonrec transaction_conflict_exception = {
  message: string option }[@@ocaml.doc
                            "Operation was rejected because there is an ongoing transaction for the item.\n"]
type nonrec request_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "Throughput exceeds the current throughput quota for your account. Please contact {{:https://aws.amazon.com/support}Amazon Web Services Support} to request a quota increase.\n"]
type nonrec provisioned_throughput_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "Your request rate is too high. The Amazon Web Services SDKs for DynamoDB automatically retry requests that receive this exception. Your request is eventually successful, unless your retry queue is too large to finish. Reduce the frequency of requests and use exponential backoff. For more information, go to {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Programming.Errors.html#Programming.Errors.RetryAndBackoff}Error Retries and Exponential Backoff} in the {i Amazon DynamoDB Developer Guide}.\n"]
type nonrec item_collection_size_limit_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "An item collection is too large. This exception is only returned for tables that have one or more local secondary indexes.\n"]
type nonrec conditional_check_failed_exception =
  {
  item: attribute_map option ;
  message: string option }[@@ocaml.doc
                            "A condition specified in the operation could not be evaluated.\n"]
type nonrec replica_global_secondary_index_settings_description =
  {
  provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  provisioned_write_capacity_units: int option ;
  provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  provisioned_read_capacity_units: int option ;
  index_status: index_status option ;
  index_name: string }[@@ocaml.doc
                        "Represents the properties of a global secondary index.\n"]
type nonrec replica_settings_description =
  {
  replica_table_class_summary: table_class_summary option ;
  replica_global_secondary_index_settings:
    replica_global_secondary_index_settings_description list option ;
  replica_provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  replica_provisioned_write_capacity_units: int option ;
  replica_provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  replica_provisioned_read_capacity_units: int option ;
  replica_billing_mode_summary: billing_mode_summary option ;
  replica_status: replica_status option ;
  region_name: string }[@@ocaml.doc
                         "Represents the properties of a replica.\n"]
type nonrec update_global_table_settings_output =
  {
  replica_settings: replica_settings_description list option ;
  global_table_name: string option }[@@ocaml.doc ""]
type nonrec global_table_global_secondary_index_settings_update =
  {
  provisioned_write_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option ;
  provisioned_write_capacity_units: int option ;
  index_name: string }[@@ocaml.doc
                        "Represents the settings of a global secondary index for a global table that will be modified.\n"]
type nonrec replica_global_secondary_index_settings_update =
  {
  provisioned_read_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option ;
  provisioned_read_capacity_units: int option ;
  index_name: string }[@@ocaml.doc
                        "Represents the settings of a global secondary index for a global table that will be modified.\n"]
type nonrec replica_settings_update =
  {
  replica_table_class: table_class option ;
  replica_global_secondary_index_settings_update:
    replica_global_secondary_index_settings_update list option ;
  replica_provisioned_read_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option ;
  replica_provisioned_read_capacity_units: int option ;
  region_name: string }[@@ocaml.doc
                         "Represents the settings for a global table in a Region that will be modified.\n"]
type nonrec update_global_table_settings_input =
  {
  replica_settings_update: replica_settings_update list option ;
  global_table_global_secondary_index_settings_update:
    global_table_global_secondary_index_settings_update list option ;
  global_table_provisioned_write_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option ;
  global_table_provisioned_write_capacity_units: int option ;
  global_table_billing_mode: billing_mode option ;
  global_table_name: string }[@@ocaml.doc ""]
type nonrec replica_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The specified replica is no longer part of the global table.\n"]
type nonrec index_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The operation tried to access a nonexistent index.\n"]
type nonrec global_table_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The specified global table does not exist.\n"]
type nonrec global_table_status =
  | UPDATING 
  | DELETING 
  | ACTIVE 
  | CREATING [@@ocaml.doc ""]
type nonrec global_table_description =
  {
  global_table_name: string option ;
  global_table_status: global_table_status option ;
  creation_date_time: CoreTypes.Timestamp.t option ;
  global_table_arn: string option ;
  replication_group: replica_description list option }[@@ocaml.doc
                                                        "Contains details about the global table.\n"]
type nonrec update_global_table_output =
  {
  global_table_description: global_table_description option }[@@ocaml.doc ""]
type nonrec create_replica_action = {
  region_name: string }[@@ocaml.doc "Represents a replica to be added.\n"]
type nonrec delete_replica_action = {
  region_name: string }[@@ocaml.doc "Represents a replica to be removed.\n"]
type nonrec replica_update =
  {
  delete: delete_replica_action option ;
  create: create_replica_action option }[@@ocaml.doc
                                          "Represents one of the following:\n\n {ul\n       {-  A new replica to be added to an existing global table.\n           \n            }\n       {-  New parameters for an existing replica.\n           \n            }\n       {-  An existing replica to be removed from an existing global table.\n           \n            }\n       }\n  "]
type nonrec update_global_table_input =
  {
  replica_updates: replica_update list ;
  global_table_name: string }[@@ocaml.doc ""]
type nonrec table_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "A source table with the name [TableName] does not currently exist within the subscriber's account or the subscriber is operating in the wrong Amazon Web Services Region.\n"]
type nonrec replica_already_exists_exception = {
  message: string option }[@@ocaml.doc
                            "The specified replica is already part of the global table.\n"]
type nonrec contributor_insights_status =
  | FAILED 
  | DISABLED 
  | DISABLING 
  | ENABLED 
  | ENABLING [@@ocaml.doc ""]
type nonrec update_contributor_insights_output =
  {
  contributor_insights_status: contributor_insights_status option ;
  index_name: string option ;
  table_name: string option }[@@ocaml.doc ""]
type nonrec contributor_insights_action =
  | DISABLE 
  | ENABLE [@@ocaml.doc ""]
type nonrec update_contributor_insights_input =
  {
  contributor_insights_action: contributor_insights_action ;
  index_name: string option ;
  table_name: string }[@@ocaml.doc ""]
type nonrec continuous_backups_status =
  | DISABLED 
  | ENABLED [@@ocaml.doc ""]
type nonrec point_in_time_recovery_status =
  | DISABLED 
  | ENABLED [@@ocaml.doc ""]
type nonrec point_in_time_recovery_description =
  {
  latest_restorable_date_time: CoreTypes.Timestamp.t option ;
  earliest_restorable_date_time: CoreTypes.Timestamp.t option ;
  point_in_time_recovery_status: point_in_time_recovery_status option }
[@@ocaml.doc
  "The description of the point in time settings applied to the table.\n"]
type nonrec continuous_backups_description =
  {
  point_in_time_recovery_description:
    point_in_time_recovery_description option ;
  continuous_backups_status: continuous_backups_status }[@@ocaml.doc
                                                          "Represents the continuous backups and point in time recovery settings on the table.\n"]
type nonrec update_continuous_backups_output =
  {
  continuous_backups_description: continuous_backups_description option }
[@@ocaml.doc ""]
type nonrec point_in_time_recovery_specification =
  {
  point_in_time_recovery_enabled: bool }[@@ocaml.doc
                                          "Represents the settings used to enable point in time recovery.\n"]
type nonrec update_continuous_backups_input =
  {
  point_in_time_recovery_specification: point_in_time_recovery_specification ;
  table_name: string }[@@ocaml.doc ""]
type nonrec continuous_backups_unavailable_exception =
  {
  message: string option }[@@ocaml.doc
                            "Backups have not yet been enabled for this table.\n"]
type nonrec update =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: expression_attribute_value_map option ;
  expression_attribute_names: expression_attribute_name_map option ;
  condition_expression: string option ;
  table_name: string ;
  update_expression: string ;
  key: key }[@@ocaml.doc
              "Represents a request to perform an [UpdateItem] operation.\n"]
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec transaction_in_progress_exception = {
  message: string option }[@@ocaml.doc
                            "The transaction with the given request token is already in progress.\n\n  Recommended Settings \n \n    This is a general recommendation for handling the [TransactionInProgressException]. These settings help ensure that the client retries will trigger completion of the ongoing [TransactWriteItems] request. \n   \n     {ul\n           {-   Set [clientExecutionTimeout] to a value that allows at least one retry to be processed after 5 seconds have elapsed since the first attempt for the [TransactWriteItems] operation. \n               \n                }\n           {-   Set [socketTimeout] to a value a little lower than the [requestTimeout] setting. \n               \n                }\n           {-   [requestTimeout] should be set based on the time taken for the individual retries of a single HTTP request for your use case, but setting it to 1 second or higher should work well to reduce chances of retries and [TransactionInProgressException] errors. \n               \n                }\n           {-   Use exponential backoff when retrying and tune backoff if needed. \n               \n                }\n           }\n    Assuming {{:https://github.com/aws/aws-sdk-java/blob/fd409dee8ae23fb8953e0bb4dbde65536a7e0514/aws-java-sdk-core/src/main/java/com/amazonaws/retry/PredefinedRetryPolicies.java#L97}default retry policy}, example timeout settings based on the guidelines above are as follows: \n   \n    Example timeline:\n    \n     {ul\n           {-  0-1000 first attempt\n               \n                }\n           {-  1000-1500 first sleep/delay (default retry policy uses 500 ms as base delay for 4xx errors)\n               \n                }\n           {-  1500-2500 second attempt\n               \n                }\n           {-  2500-3500 second sleep/delay (500 * 2, exponential backoff)\n               \n                }\n           {-  3500-4500 third attempt\n               \n                }\n           {-  4500-6500 third sleep/delay (500 * 2^2)\n               \n                }\n           {-  6500-7500 fourth attempt (this can trigger inline recovery since 5 seconds have elapsed since the first attempt reached TC)\n               \n                }\n           }\n  "]
type nonrec cancellation_reason =
  {
  message: string option ;
  code: string option ;
  item: attribute_map option }[@@ocaml.doc
                                "An ordered list of errors for each item in the request which caused the transaction to get cancelled. The values of the list are ordered according to the ordering of the [TransactWriteItems] request parameter. If no error occurred for the associated item an error with a Null code and Null message will be present. \n"]
type nonrec transaction_canceled_exception =
  {
  cancellation_reasons: cancellation_reason list option ;
  message: string option }[@@ocaml.doc
                            "The entire transaction request was canceled.\n\n DynamoDB cancels a [TransactWriteItems] request under the following circumstances:\n \n  {ul\n        {-  A condition in one of the condition expressions is not met.\n            \n             }\n        {-  A table in the [TransactWriteItems] request is in a different account or region.\n            \n             }\n        {-  More than one action in the [TransactWriteItems] operation targets the same item.\n            \n             }\n        {-  There is insufficient provisioned capacity for the transaction to be completed.\n            \n             }\n        {-  An item size becomes too large (larger than 400 KB), or a local secondary index (LSI) becomes too large, or a similar validation error occurs because of changes made by the transaction.\n            \n             }\n        {-  There is a user error, such as an invalid data format.\n            \n             }\n        {-   There is an ongoing [TransactWriteItems] operation that conflicts with a concurrent [TransactWriteItems] request. In this case the [TransactWriteItems] operation fails with a [TransactionCanceledException]. \n            \n             }\n        }\n   DynamoDB cancels a [TransactGetItems] request under the following circumstances:\n   \n    {ul\n          {-  There is an ongoing [TransactGetItems] operation that conflicts with a concurrent [PutItem], [UpdateItem], [DeleteItem] or [TransactWriteItems] request. In this case the [TransactGetItems] operation fails with a [TransactionCanceledException].\n              \n               }\n          {-  A table in the [TransactGetItems] request is in a different account or region.\n              \n               }\n          {-  There is insufficient provisioned capacity for the transaction to be completed.\n              \n               }\n          {-  There is a user error, such as an invalid data format.\n              \n               }\n          }\n    If using Java, DynamoDB lists the cancellation reasons on the [CancellationReasons] property. This property is not set for other languages. Transaction cancellation reasons are ordered in the order of requested items, if an item has no error it will have [None] code and [Null] message.\n    \n      Cancellation reason codes and possible error messages:\n      \n       {ul\n             {-  No Errors:\n                 \n                  {ul\n                        {-  Code: [None] \n                            \n                             }\n                        {-  Message: [null] \n                            \n                             }\n                        \n              }\n               }\n             {-  Conditional Check Failed:\n                 \n                  {ul\n                        {-  Code: [ConditionalCheckFailed] \n                            \n                             }\n                        {-  Message: The conditional request failed. \n                            \n                             }\n                        \n              }\n               }\n             {-  Item Collection Size Limit Exceeded:\n                 \n                  {ul\n                        {-  Code: [ItemCollectionSizeLimitExceeded] \n                            \n                             }\n                        {-  Message: Collection size exceeded.\n                            \n                             }\n                        \n              }\n               }\n             {-  Transaction Conflict:\n                 \n                  {ul\n                        {-  Code: [TransactionConflict] \n                            \n                             }\n                        {-  Message: Transaction is ongoing for the item.\n                            \n                             }\n                        \n              }\n               }\n             {-  Provisioned Throughput Exceeded:\n                 \n                  {ul\n                        {-  Code: [ProvisionedThroughputExceeded] \n                            \n                             }\n                        {-  Messages:\n                            \n                             {ul\n                                   {-  The level of configured provisioned throughput for the table was exceeded. Consider increasing your provisioning level with the UpdateTable API.\n                                       \n                                         This Message is received when provisioned throughput is exceeded is on a provisioned DynamoDB table.\n                                         \n                                           }\n                                   {-  The level of configured provisioned throughput for one or more global secondary indexes of the table was exceeded. Consider increasing your provisioning level for the under-provisioned global secondary indexes with the UpdateTable API.\n                                       \n                                         This message is returned when provisioned throughput is exceeded is on a provisioned GSI.\n                                         \n                                           }\n                                   \n                         }\n                          }\n                        \n              }\n               }\n             {-  Throttling Error:\n                 \n                  {ul\n                        {-  Code: [ThrottlingError] \n                            \n                             }\n                        {-  Messages: \n                            \n                             {ul\n                                   {-  Throughput exceeds the current capacity of your table or index. DynamoDB is automatically scaling your table or index so please try again shortly. If exceptions persist, check if you have a hot key: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-partition-key-design.html.\n                                       \n                                         This message is returned when writes get throttled on an On-Demand table as DynamoDB is automatically scaling the table.\n                                         \n                                           }\n                                   {-  Throughput exceeds the current capacity for one or more global secondary indexes. DynamoDB is automatically scaling your index so please try again shortly.\n                                       \n                                         This message is returned when writes get throttled on an On-Demand GSI as DynamoDB is automatically scaling the GSI.\n                                         \n                                           }\n                                   \n                         }\n                          }\n                        \n              }\n               }\n             {-  Validation Error:\n                 \n                  {ul\n                        {-  Code: [ValidationError] \n                            \n                             }\n                        {-  Messages: \n                            \n                             {ul\n                                   {-  One or more parameter values were invalid.\n                                       \n                                        }\n                                   {-  The update expression attempted to update the secondary index key beyond allowed size limits.\n                                       \n                                        }\n                                   {-  The update expression attempted to update the secondary index key to unsupported type.\n                                       \n                                        }\n                                   {-  An operand in the update expression has an incorrect data type.\n                                       \n                                        }\n                                   {-  Item size to update has exceeded the maximum allowed size.\n                                       \n                                        }\n                                   {-  Number overflow. Attempting to store a number with magnitude larger than supported range.\n                                       \n                                        }\n                                   {-  Type mismatch for attribute to update.\n                                       \n                                        }\n                                   {-  Nesting Levels have exceeded supported limits.\n                                       \n                                        }\n                                   {-  The document path provided in the update expression is invalid for update.\n                                       \n                                        }\n                                   {-  The provided expression refers to an attribute that does not exist in the item.\n                                       \n                                        }\n                                   \n                         }\n                          }\n                        \n              }\n               }\n             }\n  "]
type nonrec item_collection_metrics_per_table =
  (string * item_collection_metrics list) list[@@ocaml.doc ""]
type nonrec transact_write_items_output =
  {
  item_collection_metrics: item_collection_metrics_per_table option ;
  consumed_capacity: consumed_capacity list option }[@@ocaml.doc ""]
type nonrec condition_check =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: expression_attribute_value_map option ;
  expression_attribute_names: expression_attribute_name_map option ;
  condition_expression: string ;
  table_name: string ;
  key: key }[@@ocaml.doc
              "Represents a request to perform a check that an item exists or to check the condition of specific attributes of the item.\n"]
type nonrec put =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: expression_attribute_value_map option ;
  expression_attribute_names: expression_attribute_name_map option ;
  condition_expression: string option ;
  table_name: string ;
  item: put_item_input_attribute_map }[@@ocaml.doc
                                        "Represents a request to perform a [PutItem] operation.\n"]
type nonrec delete =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: expression_attribute_value_map option ;
  expression_attribute_names: expression_attribute_name_map option ;
  condition_expression: string option ;
  table_name: string ;
  key: key }[@@ocaml.doc
              "Represents a request to perform a [DeleteItem] operation.\n"]
type nonrec transact_write_item =
  {
  update: update option ;
  delete: delete option ;
  put: put option ;
  condition_check: condition_check option }[@@ocaml.doc
                                             "A list of requests that can perform update, put, delete, or check operations on multiple items in one or more tables atomically.\n"]
type nonrec transact_write_items_input =
  {
  client_request_token: string option ;
  return_item_collection_metrics: return_item_collection_metrics option ;
  return_consumed_capacity: return_consumed_capacity option ;
  transact_items: transact_write_item list }[@@ocaml.doc ""]
type nonrec idempotent_parameter_mismatch_exception =
  {
  message: string option }[@@ocaml.doc
                            "DynamoDB rejected the request because you retried a request with a different payload but with an idempotent token that was already used.\n"]
type nonrec item_response = {
  item: attribute_map option }[@@ocaml.doc
                                "Details for the requested item.\n"]
type nonrec transact_get_items_output =
  {
  responses: item_response list option ;
  consumed_capacity: consumed_capacity list option }[@@ocaml.doc ""]
type nonrec get =
  {
  expression_attribute_names: expression_attribute_name_map option ;
  projection_expression: string option ;
  table_name: string ;
  key: key }[@@ocaml.doc
              "Specifies an item and related attribute values to retrieve in a [TransactGetItem] object.\n"]
type nonrec transact_get_item = {
  get: get }[@@ocaml.doc
              "Specifies an item to be retrieved as part of the transaction.\n"]
type nonrec transact_get_items_input =
  {
  return_consumed_capacity: return_consumed_capacity option ;
  transact_items: transact_get_item list }[@@ocaml.doc ""]
type nonrec time_to_live_status =
  | DISABLED 
  | ENABLED 
  | DISABLING 
  | ENABLING [@@ocaml.doc ""]
type nonrec time_to_live_description =
  {
  attribute_name: string option ;
  time_to_live_status: time_to_live_status option }[@@ocaml.doc
                                                     "The description of the Time to Live (TTL) status on the specified table. \n"]
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a single DynamoDB table. \n\n Amazon Web Services-assigned tag names and values are automatically assigned the [aws:] prefix, which the user cannot assign. Amazon Web Services-assigned tag names do not count towards the tag limit of 50. User-assigned tag names have the prefix [user:] in the Cost Allocation Report. You cannot backdate the application of a tag.\n \n  For an overview on tagging DynamoDB resources, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html}Tagging for DynamoDB} in the {i Amazon DynamoDB Developer Guide}.\n  "]
type nonrec tag_resource_input = {
  tags: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec table_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "A target table with the specified name is either being created or deleted. \n"]
type nonrec global_secondary_index =
  {
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput option ;
  projection: projection ;
  key_schema: key_schema_element list ;
  index_name: string }[@@ocaml.doc
                        "Represents the properties of a global secondary index.\n"]
type nonrec table_creation_parameters =
  {
  global_secondary_indexes: global_secondary_index list option ;
  sse_specification: sse_specification option ;
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput option ;
  billing_mode: billing_mode option ;
  key_schema: key_schema_element list ;
  attribute_definitions: attribute_definition list ;
  table_name: string }[@@ocaml.doc
                        " The parameters for the table created as part of the import operation. \n"]
type nonrec table_already_exists_exception = {
  message: string option }[@@ocaml.doc
                            "A target table with the specified name already exists. \n"]
type nonrec local_secondary_index_info =
  {
  projection: projection option ;
  key_schema: key_schema_element list option ;
  index_name: string option }[@@ocaml.doc
                               "Represents the properties of a local secondary index for the table when the backup was created.\n"]
type nonrec global_secondary_index_info =
  {
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput option ;
  projection: projection option ;
  key_schema: key_schema_element list option ;
  index_name: string option }[@@ocaml.doc
                               "Represents the properties of a global secondary index for the table when the backup was created.\n"]
type nonrec source_table_feature_details =
  {
  sse_description: sse_description option ;
  time_to_live_description: time_to_live_description option ;
  stream_description: stream_specification option ;
  global_secondary_indexes: global_secondary_index_info list option ;
  local_secondary_indexes: local_secondary_index_info list option }[@@ocaml.doc
                                                                    "Contains the details of the features enabled on the table when the backup was created. For example, LSIs, GSIs, streams, TTL. \n"]
type nonrec source_table_details =
  {
  billing_mode: billing_mode option ;
  item_count: int option ;
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput ;
  table_creation_date_time: CoreTypes.Timestamp.t ;
  key_schema: key_schema_element list ;
  table_size_bytes: int option ;
  table_arn: string option ;
  table_id: string ;
  table_name: string }[@@ocaml.doc
                        "Contains the details of the table when the backup was created. \n"]
type nonrec select =
  | COUNT 
  | SPECIFIC_ATTRIBUTES 
  | ALL_PROJECTED_ATTRIBUTES 
  | ALL_ATTRIBUTES [@@ocaml.doc ""]
type nonrec scan_output =
  {
  consumed_capacity: consumed_capacity option ;
  last_evaluated_key: key option ;
  scanned_count: int option ;
  count: int option ;
  items: attribute_map list option }[@@ocaml.doc
                                      "Represents the output of a [Scan] operation.\n"]
type nonrec condition =
  {
  comparison_operator: comparison_operator ;
  attribute_value_list: attribute_value list option }[@@ocaml.doc
                                                       "Represents the selection criteria for a [Query] or [Scan] operation:\n\n {ul\n       {-  For a [Query] operation, [Condition] is used for specifying the [KeyConditions] to use when querying a table or an index. For [KeyConditions], only the following comparison operators are supported:\n           \n             [EQ | LE | LT | GE | GT | BEGINS_WITH | BETWEEN] \n            \n              [Condition] is also used in a [QueryFilter], which evaluates the query results and returns only the desired values.\n             \n              }\n       {-  For a [Scan] operation, [Condition] is used in a [ScanFilter], which evaluates the scan results and returns only the desired values.\n           \n            }\n       }\n  "]
type nonrec filter_condition_map = (string * condition) list[@@ocaml.doc ""]
type nonrec scan_input =
  {
  consistent_read: bool option ;
  expression_attribute_values: expression_attribute_value_map option ;
  expression_attribute_names: expression_attribute_name_map option ;
  filter_expression: string option ;
  projection_expression: string option ;
  segment: int option ;
  total_segments: int option ;
  return_consumed_capacity: return_consumed_capacity option ;
  exclusive_start_key: key option ;
  conditional_operator: conditional_operator option ;
  scan_filter: filter_condition_map option ;
  select: select option ;
  limit: int option ;
  attributes_to_get: string list option ;
  index_name: string option ;
  table_name: string }[@@ocaml.doc
                        "Represents the input of a [Scan] operation.\n"]
type nonrec s3_sse_algorithm =
  | KMS 
  | AES256 [@@ocaml.doc ""]
type nonrec s3_bucket_source =
  {
  s3_key_prefix: string option ;
  s3_bucket: string ;
  s3_bucket_owner: string option }[@@ocaml.doc
                                    " The S3 bucket that is being imported from. \n"]
type nonrec restore_table_to_point_in_time_output =
  {
  table_description: table_description option }[@@ocaml.doc ""]
type nonrec local_secondary_index =
  {
  projection: projection ;
  key_schema: key_schema_element list ;
  index_name: string }[@@ocaml.doc
                        "Represents the properties of a local secondary index.\n"]
type nonrec restore_table_to_point_in_time_input =
  {
  sse_specification_override: sse_specification option ;
  on_demand_throughput_override: on_demand_throughput option ;
  provisioned_throughput_override: provisioned_throughput option ;
  local_secondary_index_override: local_secondary_index list option ;
  global_secondary_index_override: global_secondary_index list option ;
  billing_mode_override: billing_mode option ;
  restore_date_time: CoreTypes.Timestamp.t option ;
  use_latest_restorable_time: bool option ;
  target_table_name: string ;
  source_table_name: string option ;
  source_table_arn: string option }[@@ocaml.doc ""]
type nonrec point_in_time_recovery_unavailable_exception =
  {
  message: string option }[@@ocaml.doc
                            "Point in time recovery has not yet been enabled for this source table.\n"]
type nonrec invalid_restore_time_exception = {
  message: string option }[@@ocaml.doc
                            "An invalid restore time was specified. RestoreDateTime must be between EarliestRestorableDateTime and LatestRestorableDateTime.\n"]
type nonrec restore_table_from_backup_output =
  {
  table_description: table_description option }[@@ocaml.doc ""]
type nonrec restore_table_from_backup_input =
  {
  sse_specification_override: sse_specification option ;
  on_demand_throughput_override: on_demand_throughput option ;
  provisioned_throughput_override: provisioned_throughput option ;
  local_secondary_index_override: local_secondary_index list option ;
  global_secondary_index_override: global_secondary_index list option ;
  billing_mode_override: billing_mode option ;
  backup_arn: string ;
  target_table_name: string }[@@ocaml.doc ""]
type nonrec backup_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "Backup not found for the given BackupARN. \n"]
type nonrec backup_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "There is another ongoing conflicting backup control plane operation on the table. The backup is either being created, deleted or restored to a table.\n"]
type nonrec replica = {
  region_name: string option }[@@ocaml.doc
                                "Represents the properties of a replica.\n"]
type nonrec query_output =
  {
  consumed_capacity: consumed_capacity option ;
  last_evaluated_key: key option ;
  scanned_count: int option ;
  count: int option ;
  items: attribute_map list option }[@@ocaml.doc
                                      "Represents the output of a [Query] operation.\n"]
type nonrec key_conditions = (string * condition) list[@@ocaml.doc ""]
type nonrec query_input =
  {
  expression_attribute_values: expression_attribute_value_map option ;
  expression_attribute_names: expression_attribute_name_map option ;
  key_condition_expression: string option ;
  filter_expression: string option ;
  projection_expression: string option ;
  return_consumed_capacity: return_consumed_capacity option ;
  exclusive_start_key: key option ;
  scan_index_forward: bool option ;
  conditional_operator: conditional_operator option ;
  query_filter: filter_condition_map option ;
  key_conditions: key_conditions option ;
  consistent_read: bool option ;
  limit: int option ;
  attributes_to_get: string list option ;
  select: select option ;
  index_name: string option ;
  table_name: string }[@@ocaml.doc
                        "Represents the input of a [Query] operation.\n"]
type nonrec put_resource_policy_output = {
  revision_id: string option }[@@ocaml.doc ""]
type nonrec put_resource_policy_input =
  {
  confirm_remove_self_resource_access: bool option ;
  expected_revision_id: string option ;
  policy: string ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec policy_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The operation tried to access a nonexistent resource-based policy.\n\n If you specified an [ExpectedRevisionId], it's possible that a policy is present for the resource but its revision ID didn't match the expected value.\n "]
type nonrec put_item_output =
  {
  item_collection_metrics: item_collection_metrics option ;
  consumed_capacity: consumed_capacity option ;
  attributes: attribute_map option }[@@ocaml.doc
                                      "Represents the output of a [PutItem] operation.\n"]
type nonrec put_item_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: expression_attribute_value_map option ;
  expression_attribute_names: expression_attribute_name_map option ;
  condition_expression: string option ;
  conditional_operator: conditional_operator option ;
  return_item_collection_metrics: return_item_collection_metrics option ;
  return_consumed_capacity: return_consumed_capacity option ;
  return_values: return_value option ;
  expected: expected_attribute_map option ;
  item: put_item_input_attribute_map ;
  table_name: string }[@@ocaml.doc
                        "Represents the input of a [PutItem] operation.\n"]
type nonrec batch_statement_error_code_enum =
  | DuplicateItem 
  | AccessDenied 
  | ResourceNotFound 
  | InternalServerError 
  | ThrottlingError 
  | TransactionConflict 
  | ProvisionedThroughputExceeded 
  | ValidationError 
  | RequestLimitExceeded 
  | ItemCollectionSizeLimitExceeded 
  | ConditionalCheckFailed [@@ocaml.doc ""]
type nonrec batch_statement_error =
  {
  item: attribute_map option ;
  message: string option ;
  code: batch_statement_error_code_enum option }[@@ocaml.doc
                                                  " An error associated with a statement in a PartiQL batch that was run. \n"]
type nonrec batch_statement_response =
  {
  item: attribute_map option ;
  table_name: string option ;
  error: batch_statement_error option }[@@ocaml.doc
                                         " A PartiQL batch statement response.. \n"]
type nonrec batch_statement_request =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  consistent_read: bool option ;
  parameters: attribute_value list option ;
  statement: string }[@@ocaml.doc " A PartiQL batch statement request. \n"]
type nonrec parameterized_statement =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  parameters: attribute_value list option ;
  statement: string }[@@ocaml.doc
                       " Represents a PartiQL statement that uses parameters. \n"]
type nonrec list_tags_of_resource_output =
  {
  next_token: string option ;
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_of_resource_input =
  {
  next_token: string option ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec list_tables_output =
  {
  last_evaluated_table_name: string option ;
  table_names: string list option }[@@ocaml.doc
                                     "Represents the output of a [ListTables] operation.\n"]
type nonrec list_tables_input =
  {
  limit: int option ;
  exclusive_start_table_name: string option }[@@ocaml.doc
                                               "Represents the input of a [ListTables] operation.\n"]
type nonrec import_status =
  | FAILED 
  | CANCELLED 
  | CANCELLING 
  | COMPLETED 
  | IN_PROGRESS [@@ocaml.doc ""]
type nonrec input_format =
  | CSV 
  | ION 
  | DYNAMODB_JSON [@@ocaml.doc ""]
type nonrec import_summary =
  {
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  input_format: input_format option ;
  cloud_watch_log_group_arn: string option ;
  s3_bucket_source: s3_bucket_source option ;
  table_arn: string option ;
  import_status: import_status option ;
  import_arn: string option }[@@ocaml.doc
                               " Summary information about the source file for the import. \n"]
type nonrec list_imports_output =
  {
  next_token: string option ;
  import_summary_list: import_summary list option }[@@ocaml.doc ""]
type nonrec list_imports_input =
  {
  next_token: string option ;
  page_size: int option ;
  table_arn: string option }[@@ocaml.doc ""]
type nonrec global_table =
  {
  replication_group: replica list option ;
  global_table_name: string option }[@@ocaml.doc
                                      "Represents the properties of a global table.\n"]
type nonrec list_global_tables_output =
  {
  last_evaluated_global_table_name: string option ;
  global_tables: global_table list option }[@@ocaml.doc ""]
type nonrec list_global_tables_input =
  {
  region_name: string option ;
  limit: int option ;
  exclusive_start_global_table_name: string option }[@@ocaml.doc ""]
type nonrec export_status =
  | FAILED 
  | COMPLETED 
  | IN_PROGRESS [@@ocaml.doc ""]
type nonrec export_type =
  | INCREMENTAL_EXPORT 
  | FULL_EXPORT [@@ocaml.doc ""]
type nonrec export_summary =
  {
  export_type: export_type option ;
  export_status: export_status option ;
  export_arn: string option }[@@ocaml.doc
                               "Summary information about an export task.\n"]
type nonrec list_exports_output =
  {
  next_token: string option ;
  export_summaries: export_summary list option }[@@ocaml.doc ""]
type nonrec list_exports_input =
  {
  next_token: string option ;
  max_results: int option ;
  table_arn: string option }[@@ocaml.doc ""]
type nonrec contributor_insights_summary =
  {
  contributor_insights_status: contributor_insights_status option ;
  index_name: string option ;
  table_name: string option }[@@ocaml.doc
                               "Represents a Contributor Insights summary entry.\n"]
type nonrec list_contributor_insights_output =
  {
  next_token: string option ;
  contributor_insights_summaries: contributor_insights_summary list option }
[@@ocaml.doc ""]
type nonrec list_contributor_insights_input =
  {
  max_results: int option ;
  next_token: string option ;
  table_name: string option }[@@ocaml.doc ""]
type nonrec backup_status =
  | AVAILABLE 
  | DELETED 
  | CREATING [@@ocaml.doc ""]
type nonrec backup_type =
  | AWS_BACKUP 
  | SYSTEM 
  | USER [@@ocaml.doc ""]
type nonrec backup_summary =
  {
  backup_size_bytes: int option ;
  backup_type: backup_type option ;
  backup_status: backup_status option ;
  backup_expiry_date_time: CoreTypes.Timestamp.t option ;
  backup_creation_date_time: CoreTypes.Timestamp.t option ;
  backup_name: string option ;
  backup_arn: string option ;
  table_arn: string option ;
  table_id: string option ;
  table_name: string option }[@@ocaml.doc
                               "Contains details for the backup.\n"]
type nonrec list_backups_output =
  {
  last_evaluated_backup_arn: string option ;
  backup_summaries: backup_summary list option }[@@ocaml.doc ""]
type nonrec backup_type_filter =
  | ALL 
  | AWS_BACKUP 
  | SYSTEM 
  | USER [@@ocaml.doc ""]
type nonrec list_backups_input =
  {
  backup_type: backup_type_filter option ;
  exclusive_start_backup_arn: string option ;
  time_range_upper_bound: CoreTypes.Timestamp.t option ;
  time_range_lower_bound: CoreTypes.Timestamp.t option ;
  limit: int option ;
  table_name: string option }[@@ocaml.doc ""]
type nonrec enable_kinesis_streaming_configuration =
  {
  approximate_creation_date_time_precision:
    approximate_creation_date_time_precision option }[@@ocaml.doc
                                                       "Enables setting the configuration for Kinesis Streaming.\n"]
type nonrec kinesis_streaming_destination_output =
  {
  enable_kinesis_streaming_configuration:
    enable_kinesis_streaming_configuration option ;
  destination_status: destination_status option ;
  stream_arn: string option ;
  table_name: string option }[@@ocaml.doc ""]
type nonrec kinesis_streaming_destination_input =
  {
  enable_kinesis_streaming_configuration:
    enable_kinesis_streaming_configuration option ;
  stream_arn: string ;
  table_name: string }[@@ocaml.doc ""]
type nonrec kinesis_data_stream_destination =
  {
  approximate_creation_date_time_precision:
    approximate_creation_date_time_precision option ;
  destination_status_description: string option ;
  destination_status: destination_status option ;
  stream_arn: string option }[@@ocaml.doc
                               "Describes a Kinesis data stream destination.\n"]
type nonrec keys_and_attributes =
  {
  expression_attribute_names: expression_attribute_name_map option ;
  projection_expression: string option ;
  consistent_read: bool option ;
  attributes_to_get: string list option ;
  keys: key list }[@@ocaml.doc
                    "Represents a set of primary keys and, for each key, the attributes to retrieve from the table.\n\n For each primary key, you must provide {i all} of the key attributes. For example, with a simple primary key, you only need to provide the partition key. For a composite primary key, you must provide {i both} the partition key and the sort key.\n "]
type nonrec invalid_export_time_exception = {
  message: string option }[@@ocaml.doc
                            "The specified [ExportTime] is outside of the point in time recovery window.\n"]
type nonrec csv_options =
  {
  header_list: string list option ;
  delimiter: string option }[@@ocaml.doc
                              " Processing options for the CSV file being imported. \n"]
type nonrec input_format_options = {
  csv: csv_options option }[@@ocaml.doc
                             " The format options for the data that was imported into the target table. There is one value, CsvOption.\n"]
type nonrec input_compression_type =
  | NONE 
  | ZSTD 
  | GZIP [@@ocaml.doc ""]
type nonrec export_view_type =
  | NEW_AND_OLD_IMAGES 
  | NEW_IMAGE [@@ocaml.doc ""]
type nonrec incremental_export_specification =
  {
  export_view_type: export_view_type option ;
  export_to_time: CoreTypes.Timestamp.t option ;
  export_from_time: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                                    "Optional object containing the parameters specific to an incremental export.\n"]
type nonrec import_table_description =
  {
  failure_message: string option ;
  failure_code: string option ;
  imported_item_count: int option ;
  processed_item_count: int option ;
  processed_size_bytes: int option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  table_creation_parameters: table_creation_parameters option ;
  input_compression_type: input_compression_type option ;
  input_format_options: input_format_options option ;
  input_format: input_format option ;
  cloud_watch_log_group_arn: string option ;
  error_count: int option ;
  s3_bucket_source: s3_bucket_source option ;
  client_token: string option ;
  table_id: string option ;
  table_arn: string option ;
  import_status: import_status option ;
  import_arn: string option }[@@ocaml.doc
                               " Represents the properties of the table being imported into. \n"]
type nonrec import_table_output =
  {
  import_table_description: import_table_description }[@@ocaml.doc ""]
type nonrec import_table_input =
  {
  table_creation_parameters: table_creation_parameters ;
  input_compression_type: input_compression_type option ;
  input_format_options: input_format_options option ;
  input_format: input_format ;
  s3_bucket_source: s3_bucket_source ;
  client_token: string option }[@@ocaml.doc ""]
type nonrec import_conflict_exception = {
  message: string option }[@@ocaml.doc
                            " There was a conflict when importing from the specified S3 source. This can occur when the current import conflicts with a previous import request that had the same client token. \n"]
type nonrec import_not_found_exception = {
  message: string option }[@@ocaml.doc
                            " The specified import was not found. \n"]
type nonrec global_table_already_exists_exception = {
  message: string option }[@@ocaml.doc
                            "The specified global table already exists.\n"]
type nonrec get_resource_policy_output =
  {
  revision_id: string option ;
  policy: string option }[@@ocaml.doc ""]
type nonrec get_resource_policy_input = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec get_item_output =
  {
  consumed_capacity: consumed_capacity option ;
  item: attribute_map option }[@@ocaml.doc
                                "Represents the output of a [GetItem] operation.\n"]
type nonrec get_item_input =
  {
  expression_attribute_names: expression_attribute_name_map option ;
  projection_expression: string option ;
  return_consumed_capacity: return_consumed_capacity option ;
  consistent_read: bool option ;
  attributes_to_get: string list option ;
  key: key ;
  table_name: string }[@@ocaml.doc
                        "Represents the input of a [GetItem] operation.\n"]
type nonrec failure_exception =
  {
  exception_description: string option ;
  exception_name: string option }[@@ocaml.doc
                                   "Represents a failure a contributor insights operation.\n"]
type nonrec export_format =
  | ION 
  | DYNAMODB_JSON [@@ocaml.doc ""]
type nonrec export_description =
  {
  incremental_export_specification: incremental_export_specification option ;
  export_type: export_type option ;
  item_count: int option ;
  billed_size_bytes: int option ;
  export_format: export_format option ;
  failure_message: string option ;
  failure_code: string option ;
  s3_sse_kms_key_id: string option ;
  s3_sse_algorithm: s3_sse_algorithm option ;
  s3_prefix: string option ;
  s3_bucket_owner: string option ;
  s3_bucket: string option ;
  client_token: string option ;
  export_time: CoreTypes.Timestamp.t option ;
  table_id: string option ;
  table_arn: string option ;
  export_manifest: string option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  export_status: export_status option ;
  export_arn: string option }[@@ocaml.doc
                               "Represents the properties of the exported table.\n"]
type nonrec export_table_to_point_in_time_output =
  {
  export_description: export_description option }[@@ocaml.doc ""]
type nonrec export_table_to_point_in_time_input =
  {
  incremental_export_specification: incremental_export_specification option ;
  export_type: export_type option ;
  export_format: export_format option ;
  s3_sse_kms_key_id: string option ;
  s3_sse_algorithm: s3_sse_algorithm option ;
  s3_prefix: string option ;
  s3_bucket_owner: string option ;
  s3_bucket: string ;
  client_token: string option ;
  export_time: CoreTypes.Timestamp.t option ;
  table_arn: string }[@@ocaml.doc ""]
type nonrec export_conflict_exception = {
  message: string option }[@@ocaml.doc
                            "There was a conflict when writing to the specified S3 bucket.\n"]
type nonrec export_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The specified export was not found.\n"]
type nonrec execute_transaction_output =
  {
  consumed_capacity: consumed_capacity list option ;
  responses: item_response list option }[@@ocaml.doc ""]
type nonrec execute_transaction_input =
  {
  return_consumed_capacity: return_consumed_capacity option ;
  client_request_token: string option ;
  transact_statements: parameterized_statement list }[@@ocaml.doc ""]
type nonrec execute_statement_output =
  {
  last_evaluated_key: key option ;
  consumed_capacity: consumed_capacity option ;
  next_token: string option ;
  items: attribute_map list option }[@@ocaml.doc ""]
type nonrec execute_statement_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  limit: int option ;
  return_consumed_capacity: return_consumed_capacity option ;
  next_token: string option ;
  consistent_read: bool option ;
  parameters: attribute_value list option ;
  statement: string }[@@ocaml.doc ""]
type nonrec duplicate_item_exception = {
  message: string option }[@@ocaml.doc
                            " There was an attempt to insert an item with the same primary key as an item that already exists in the DynamoDB table.\n"]
type nonrec endpoint = {
  cache_period_in_minutes: int ;
  address: string }[@@ocaml.doc "An endpoint information details.\n"]
type nonrec describe_time_to_live_output =
  {
  time_to_live_description: time_to_live_description option }[@@ocaml.doc ""]
type nonrec describe_time_to_live_input = {
  table_name: string }[@@ocaml.doc ""]
type nonrec describe_table_replica_auto_scaling_output =
  {
  table_auto_scaling_description: table_auto_scaling_description option }
[@@ocaml.doc ""]
type nonrec describe_table_replica_auto_scaling_input = {
  table_name: string }[@@ocaml.doc ""]
type nonrec describe_table_output = {
  table: table_description option }[@@ocaml.doc
                                     "Represents the output of a [DescribeTable] operation.\n"]
type nonrec describe_table_input = {
  table_name: string }[@@ocaml.doc
                        "Represents the input of a [DescribeTable] operation.\n"]
type nonrec describe_limits_output =
  {
  table_max_write_capacity_units: int option ;
  table_max_read_capacity_units: int option ;
  account_max_write_capacity_units: int option ;
  account_max_read_capacity_units: int option }[@@ocaml.doc
                                                 "Represents the output of a [DescribeLimits] operation.\n"]
type nonrec describe_limits_input = unit
type nonrec describe_kinesis_streaming_destination_output =
  {
  kinesis_data_stream_destinations:
    kinesis_data_stream_destination list option ;
  table_name: string option }[@@ocaml.doc ""]
type nonrec describe_kinesis_streaming_destination_input =
  {
  table_name: string }[@@ocaml.doc ""]
type nonrec describe_import_output =
  {
  import_table_description: import_table_description }[@@ocaml.doc ""]
type nonrec describe_import_input = {
  import_arn: string }[@@ocaml.doc ""]
type nonrec describe_global_table_settings_output =
  {
  replica_settings: replica_settings_description list option ;
  global_table_name: string option }[@@ocaml.doc ""]
type nonrec describe_global_table_settings_input =
  {
  global_table_name: string }[@@ocaml.doc ""]
type nonrec describe_global_table_output =
  {
  global_table_description: global_table_description option }[@@ocaml.doc ""]
type nonrec describe_global_table_input = {
  global_table_name: string }[@@ocaml.doc ""]
type nonrec describe_export_output =
  {
  export_description: export_description option }[@@ocaml.doc ""]
type nonrec describe_export_input = {
  export_arn: string }[@@ocaml.doc ""]
type nonrec describe_endpoints_response = {
  endpoints: endpoint list }[@@ocaml.doc ""]
type nonrec describe_endpoints_request = unit
type nonrec describe_contributor_insights_output =
  {
  failure_exception: failure_exception option ;
  last_update_date_time: CoreTypes.Timestamp.t option ;
  contributor_insights_status: contributor_insights_status option ;
  contributor_insights_rule_list: string list option ;
  index_name: string option ;
  table_name: string option }[@@ocaml.doc ""]
type nonrec describe_contributor_insights_input =
  {
  index_name: string option ;
  table_name: string }[@@ocaml.doc ""]
type nonrec describe_continuous_backups_output =
  {
  continuous_backups_description: continuous_backups_description option }
[@@ocaml.doc ""]
type nonrec describe_continuous_backups_input = {
  table_name: string }[@@ocaml.doc ""]
type nonrec backup_details =
  {
  backup_expiry_date_time: CoreTypes.Timestamp.t option ;
  backup_creation_date_time: CoreTypes.Timestamp.t ;
  backup_type: backup_type ;
  backup_status: backup_status ;
  backup_size_bytes: int option ;
  backup_name: string ;
  backup_arn: string }[@@ocaml.doc
                        "Contains the details of the backup created for the table.\n"]
type nonrec backup_description =
  {
  source_table_feature_details: source_table_feature_details option ;
  source_table_details: source_table_details option ;
  backup_details: backup_details option }[@@ocaml.doc
                                           "Contains the description of the backup created for the table.\n"]
type nonrec describe_backup_output =
  {
  backup_description: backup_description option }[@@ocaml.doc ""]
type nonrec describe_backup_input = {
  backup_arn: string }[@@ocaml.doc ""]
type nonrec delete_table_output =
  {
  table_description: table_description option }[@@ocaml.doc
                                                 "Represents the output of a [DeleteTable] operation.\n"]
type nonrec delete_table_input = {
  table_name: string }[@@ocaml.doc
                        "Represents the input of a [DeleteTable] operation.\n"]
type nonrec delete_resource_policy_output = {
  revision_id: string option }[@@ocaml.doc ""]
type nonrec delete_resource_policy_input =
  {
  expected_revision_id: string option ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec delete_item_output =
  {
  item_collection_metrics: item_collection_metrics option ;
  consumed_capacity: consumed_capacity option ;
  attributes: attribute_map option }[@@ocaml.doc
                                      "Represents the output of a [DeleteItem] operation.\n"]
type nonrec delete_item_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: expression_attribute_value_map option ;
  expression_attribute_names: expression_attribute_name_map option ;
  condition_expression: string option ;
  return_item_collection_metrics: return_item_collection_metrics option ;
  return_consumed_capacity: return_consumed_capacity option ;
  return_values: return_value option ;
  conditional_operator: conditional_operator option ;
  expected: expected_attribute_map option ;
  key: key ;
  table_name: string }[@@ocaml.doc
                        "Represents the input of a [DeleteItem] operation.\n"]
type nonrec delete_backup_output =
  {
  backup_description: backup_description option }[@@ocaml.doc ""]
type nonrec delete_backup_input = {
  backup_arn: string }[@@ocaml.doc ""]
type nonrec create_table_output =
  {
  table_description: table_description option }[@@ocaml.doc
                                                 "Represents the output of a [CreateTable] operation.\n"]
type nonrec create_table_input =
  {
  on_demand_throughput: on_demand_throughput option ;
  resource_policy: string option ;
  deletion_protection_enabled: bool option ;
  table_class: table_class option ;
  tags: tag list option ;
  sse_specification: sse_specification option ;
  stream_specification: stream_specification option ;
  provisioned_throughput: provisioned_throughput option ;
  billing_mode: billing_mode option ;
  global_secondary_indexes: global_secondary_index list option ;
  local_secondary_indexes: local_secondary_index list option ;
  key_schema: key_schema_element list ;
  table_name: string ;
  attribute_definitions: attribute_definition list }[@@ocaml.doc
                                                      "Represents the input of a [CreateTable] operation.\n"]
type nonrec create_global_table_output =
  {
  global_table_description: global_table_description option }[@@ocaml.doc ""]
type nonrec create_global_table_input =
  {
  replication_group: replica list ;
  global_table_name: string }[@@ocaml.doc ""]
type nonrec create_backup_output = {
  backup_details: backup_details option }[@@ocaml.doc ""]
type nonrec create_backup_input = {
  backup_name: string ;
  table_name: string }[@@ocaml.doc ""]
type nonrec batch_write_item_request_map = (string * write_request list) list
[@@ocaml.doc ""]
type nonrec batch_write_item_output =
  {
  consumed_capacity: consumed_capacity list option ;
  item_collection_metrics: item_collection_metrics_per_table option ;
  unprocessed_items: batch_write_item_request_map option }[@@ocaml.doc
                                                            "Represents the output of a [BatchWriteItem] operation.\n"]
type nonrec batch_write_item_input =
  {
  return_item_collection_metrics: return_item_collection_metrics option ;
  return_consumed_capacity: return_consumed_capacity option ;
  request_items: batch_write_item_request_map }[@@ocaml.doc
                                                 "Represents the input of a [BatchWriteItem] operation.\n"]
type nonrec batch_get_response_map = (string * attribute_map list) list
[@@ocaml.doc ""]
type nonrec batch_get_request_map = (string * keys_and_attributes) list
[@@ocaml.doc ""]
type nonrec batch_get_item_output =
  {
  consumed_capacity: consumed_capacity list option ;
  unprocessed_keys: batch_get_request_map option ;
  responses: batch_get_response_map option }[@@ocaml.doc
                                              "Represents the output of a [BatchGetItem] operation.\n"]
type nonrec batch_get_item_input =
  {
  return_consumed_capacity: return_consumed_capacity option ;
  request_items: batch_get_request_map }[@@ocaml.doc
                                          "Represents the input of a [BatchGetItem] operation.\n"]
type nonrec batch_execute_statement_output =
  {
  consumed_capacity: consumed_capacity list option ;
  responses: batch_statement_response list option }[@@ocaml.doc ""]
type nonrec batch_execute_statement_input =
  {
  return_consumed_capacity: return_consumed_capacity option ;
  statements: batch_statement_request list }[@@ocaml.doc ""](** {1:builders Builders} *)

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
val make_describe_limits_input : unit -> describe_limits_input
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
val make_describe_endpoints_request : unit -> describe_endpoints_request
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

module BatchExecuteStatement : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_execute_statement_input ->
        (batch_execute_statement_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `RequestLimitExceeded of request_limit_exceeded
            
        ]
      ) result
  (** This operation allows you to perform batch reads or writes on data stored in DynamoDB, using PartiQL. Each read statement in a [BatchExecuteStatement] must specify an equality condition on all key attributes. This enforces that each [SELECT] statement in a batch returns at most a single item.

  The entire batch must consist of either read statements or write statements, you cannot mix both in one batch.
  
     A HTTP 200 response does not mean that all statements in the BatchExecuteStatement succeeded. Error details for individual statements can be found under the {{:https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_BatchStatementResponse.html#DDB-Type-BatchStatementResponse-Error}Error} field of the [BatchStatementResponse] for each statement.
     
       *)

  
end

module BatchGetItem : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_item_input ->
        (batch_get_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  [@@ocaml.doc {| The [BatchGetItem] operation returns the attributes of one or more items from one or more tables. You identify requested items by primary key.

 A single operation can retrieve up to 16 MB of data, which can contain as many as 100 items. [BatchGetItem] returns a partial result if the response size limit is exceeded, the table's provisioned throughput is exceeded, more than 1MB per partition is requested, or an internal processing failure occurs. If a partial result is returned, the operation returns a value for [UnprocessedKeys]. You can use this value to retry the operation starting with the next item to get.
 
   If you request more than 100 items, [BatchGetItem] returns a [ValidationException] with the message "Too many items requested for the BatchGetItem call."
   
     For example, if you ask to retrieve 100 items, but each individual item is 300 KB in size, the system returns 52 items (so as not to exceed the 16 MB limit). It also returns an appropriate [UnprocessedKeys] value so you can get the next page of results. If desired, your application can include its own logic to assemble the pages of results into one dataset.
     
      If {i none} of the items can be processed due to insufficient provisioned throughput on all of the tables in the request, then [BatchGetItem] returns a [ProvisionedThroughputExceededException]. If {i at least one} of the items is successfully processed, then [BatchGetItem] completes successfully, while returning the keys of the unread items in [UnprocessedKeys].
      
        If DynamoDB returns any unprocessed items, you should retry the batch operation on those items. However, {i we strongly recommend that you use an exponential backoff algorithm}. If you retry the batch operation immediately, the underlying read or write requests can still fail due to throttling on the individual tables. If you delay the batch operation using exponential backoff, the individual requests in the batch are much more likely to succeed.
        
         For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ErrorHandling.html#BatchOperations}Batch Operations and Error Handling} in the {i Amazon DynamoDB Developer Guide}.
         
           By default, [BatchGetItem] performs eventually consistent reads on every table in the request. If you want strongly consistent reads instead, you can set [ConsistentRead] to [true] for any or all tables.
           
            In order to minimize response latency, [BatchGetItem] may retrieve items in parallel.
            
             When designing your application, keep in mind that DynamoDB does not return items in any particular order. To help parse the response by item, include the primary key values for the items in your request in the [ProjectionExpression] parameter.
             
              If a requested item does not exist, it is not returned in the result. Requests for nonexistent items consume the minimum read capacity units according to the type of read. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#CapacityUnitCalculations}Working with Tables} in the {i Amazon DynamoDB Developer Guide}.
               |}]

  
end

module BatchWriteItem : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_write_item_input ->
        (batch_write_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ItemCollectionSizeLimitExceededException of item_collection_size_limit_exceeded_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** The [BatchWriteItem] operation puts or deletes multiple items in one or more tables. A single call to [BatchWriteItem] can transmit up to 16MB of data over the network, consisting of up to 25 item put or delete operations. While individual items can be up to 400 KB once stored, it's important to note that an item's representation might be greater than 400KB while being sent in DynamoDB's JSON format for the API call. For more details on this distinction, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html}Naming Rules and Data Types}.

   [BatchWriteItem] cannot update items. If you perform a [BatchWriteItem] operation on an existing item, that item's values will be overwritten by the operation and it will appear like it was updated. To update items, we recommend you use the [UpdateItem] action.
  
    The individual [PutItem] and [DeleteItem] operations specified in [BatchWriteItem] are atomic; however [BatchWriteItem] as a whole is not. If any requested operations fail because the table's provisioned throughput is exceeded or an internal processing failure occurs, the failed operations are returned in the [UnprocessedItems] response parameter. You can investigate and optionally resend the requests. Typically, you would call [BatchWriteItem] in a loop. Each iteration would check for unprocessed items and submit a new [BatchWriteItem] request with those unprocessed items until all items have been processed.
    
     If {i none} of the items can be processed due to insufficient provisioned throughput on all of the tables in the request, then [BatchWriteItem] returns a [ProvisionedThroughputExceededException].
     
       If DynamoDB returns any unprocessed items, you should retry the batch operation on those items. However, {i we strongly recommend that you use an exponential backoff algorithm}. If you retry the batch operation immediately, the underlying read or write requests can still fail due to throttling on the individual tables. If you delay the batch operation using exponential backoff, the individual requests in the batch are much more likely to succeed.
       
        For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ErrorHandling.html#Programming.Errors.BatchOperations}Batch Operations and Error Handling} in the {i Amazon DynamoDB Developer Guide}.
        
          With [BatchWriteItem], you can efficiently write or delete large amounts of data, such as from Amazon EMR, or copy data from another database into DynamoDB. In order to improve performance with these large-scale operations, [BatchWriteItem] does not behave in the same way as individual [PutItem] and [DeleteItem] calls would. For example, you cannot specify conditions on individual put and delete requests, and [BatchWriteItem] does not return deleted items in the response.
          
           If you use a programming language that supports concurrency, you can use threads to write items in parallel. Your application must include the necessary logic to manage the threads. With languages that don't support threading, you must update or delete the specified items one at a time. In both situations, [BatchWriteItem] performs the specified put and delete operations in parallel, giving you the power of the thread pool approach without having to introduce complexity into your application.
           
            Parallel processing reduces latency, but each specified put and delete request consumes the same number of write capacity units whether it is processed in parallel or not. Delete operations on nonexistent items consume one write capacity unit.
            
             If one or more of the following is true, DynamoDB rejects the entire batch write operation:
             
              {ul
                    {-  One or more tables specified in the [BatchWriteItem] request does not exist.
                        
                         }
                    {-  Primary key attributes specified on an item in the request do not match those in the corresponding table's primary key schema.
                        
                         }
                    {-  You try to perform multiple operations on the same item in the same [BatchWriteItem] request. For example, you cannot put and delete the same item in the same [BatchWriteItem] request. 
                        
                         }
                    {-   Your request contains at least two items with identical hash and range keys (which essentially is two put operations). 
                        
                         }
                    {-  There are more than 25 requests in the batch.
                        
                         }
                    {-  Any individual item in a batch exceeds 400 KB.
                        
                         }
                    {-  The total request size exceeds 16 MB.
                        
                         }
                    {-  Any individual items with keys exceeding the key length limits. For a partition key, the limit is 2048 bytes and for a sort key, the limit is 1024 bytes.
                        
                         }
                    }
   *)

  
end

module CreateBackup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_backup_input ->
        (create_backup_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BackupInUseException of backup_in_use_exception
            | `ContinuousBackupsUnavailableException of continuous_backups_unavailable_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `TableInUseException of table_in_use_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
  (** Creates a backup for an existing table.

  Each time you create an on-demand backup, the entire table data is backed up. There is no limit to the number of on-demand backups that can be taken. 
 
   When you create an on-demand backup, a time marker of the request is cataloged, and the backup is created asynchronously, by applying all changes until the time of the request to the last full table snapshot. Backup requests are processed instantaneously and become available for restore within minutes. 
  
   You can call [CreateBackup] at a maximum rate of 50 times per second.
   
    All backups in DynamoDB work without consuming any provisioned throughput on the table.
    
      If you submit a backup request on 2018-12-14 at 14:25:00, the backup is guaranteed to contain all data committed to the table up to 14:24:00, and data committed after 14:26:00 will not be. The backup might contain data modifications made between 14:24:00 and 14:26:00. On-demand backup does not support causal consistency. 
     
       Along with data, the following are also included on the backups: 
      
       {ul
             {-  Global secondary indexes (GSIs)
                 
                  }
             {-  Local secondary indexes (LSIs)
                 
                  }
             {-  Streams
                 
                  }
             {-  Provisioned read and write capacity
                 
                  }
             }
   *)

  
end

module CreateGlobalTable : sig
  val request :
    Smaws_Lib.Context.t ->
      create_global_table_input ->
        (create_global_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `GlobalTableAlreadyExistsException of global_table_already_exists_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
  (** Creates a global table from an existing table. A global table creates a replication relationship between two or more DynamoDB tables with the same table name in the provided Regions. 

  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).
  
   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.
   
     If you want to add a new replica table to a global table, each of the following conditions must be true:
     
      {ul
            {-  The table must have the same primary key as all of the other replicas.
                
                 }
            {-  The table must have the same name as all of the other replicas.
                
                 }
            {-  The table must have DynamoDB Streams enabled, with the stream containing both the new and the old images of the item.
                
                 }
            {-  None of the replica tables in the global table can contain any data.
                
                 }
            }
    If global secondary indexes are specified, then the following conditions must also be met: 
   
    {ul
          {-   The global secondary indexes must have the same name. 
              
               }
          {-   The global secondary indexes must have the same hash key and sort key (if present). 
              
               }
          }
    If local secondary indexes are specified, then the following conditions must also be met: 
   
    {ul
          {-   The local secondary indexes must have the same name. 
              
               }
          {-   The local secondary indexes must have the same hash key and sort key (if present). 
              
               }
          }
     Write capacity settings should be set consistently across your replica tables and secondary indexes. DynamoDB strongly recommends enabling auto scaling to manage the write capacity settings for all of your global tables replicas and indexes. 
    
      If you prefer to manage write capacity settings manually, you should provision equal replicated write capacity units to your replica tables. You should also provision equal replicated write capacity units to matching secondary indexes across your global table. 
     
       *)

  
end

module CreateTable : sig
  val request :
    Smaws_Lib.Context.t ->
      create_table_input ->
        (create_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** The [CreateTable] operation adds a new table to your account. In an Amazon Web Services account, table names must be unique within each Region. That is, you can have two tables with same name if you create the tables in different Regions.

  [CreateTable] is an asynchronous operation. Upon receiving a [CreateTable] request, DynamoDB immediately returns a response with a [TableStatus] of [CREATING]. After the table is created, DynamoDB sets the [TableStatus] to [ACTIVE]. You can perform read and write operations only on an [ACTIVE] table. 
 
  You can optionally define secondary indexes on the new table, as part of the [CreateTable] operation. If you want to create multiple tables with secondary indexes on them, you must create the tables sequentially. Only one table with secondary indexes can be in the [CREATING] state at any given time.
  
   You can use the [DescribeTable] action to check the table status.
    *)

  
end

module DeleteBackup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_backup_input ->
        (delete_backup_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BackupInUseException of backup_in_use_exception
            | `BackupNotFoundException of backup_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** Deletes an existing backup of a table.

 You can call [DeleteBackup] at a maximum rate of 10 times per second.
  *)

  
end

module DeleteItem : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_item_input ->
        (delete_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ItemCollectionSizeLimitExceededException of item_collection_size_limit_exceeded_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionConflictException of transaction_conflict_exception
            
        ]
      ) result
  (** Deletes a single item in a table by primary key. You can perform a conditional delete operation that deletes the item if it exists, or if it has an expected attribute value.

 In addition to deleting an item, you can also return the item's attribute values in the same operation, using the [ReturnValues] parameter.
 
  Unless you specify conditions, the [DeleteItem] is an idempotent operation; running it multiple times on the same item or attribute does {i not} result in an error response.
  
   Conditional deletes are useful for deleting items only if specific conditions are met. If those conditions are met, DynamoDB performs the delete. Otherwise, the item is not deleted.
    *)

  
end

module DeleteResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_policy_input ->
        (delete_resource_policy_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `PolicyNotFoundException of policy_not_found_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Deletes the resource-based policy attached to the resource, which can be a table or stream.

  [DeleteResourcePolicy] is an idempotent operation; running it multiple times on the same resource {i doesn't} result in an error response, unless you specify an [ExpectedRevisionId], which will then return a [PolicyNotFoundException].
 
   To make sure that you don't inadvertently lock yourself out of your own resources, the root principal in your Amazon Web Services account can perform [DeleteResourcePolicy] requests, even if your resource-based policy explicitly denies the root principal's access. 
   
       [DeleteResourcePolicy] is an asynchronous operation. If you issue a [GetResourcePolicy] request immediately after running the [DeleteResourcePolicy] request, DynamoDB might still return the deleted policy. This is because the policy for your resource might not have been deleted yet. Wait for a few seconds, and then try the [GetResourcePolicy] request again.
      
        *)

  
end

module DeleteTable : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_table_input ->
        (delete_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** The [DeleteTable] operation deletes a table and all of its items. After a [DeleteTable] request, the specified table is in the [DELETING] state until DynamoDB completes the deletion. If the table is in the [ACTIVE] state, you can delete it. If a table is in [CREATING] or [UPDATING] states, then DynamoDB returns a [ResourceInUseException]. If the specified table does not exist, DynamoDB returns a [ResourceNotFoundException]. If table is already in the [DELETING] state, no error is returned. 

  For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version). 
  
     DynamoDB might continue to accept data read and write operations, such as [GetItem] and [PutItem], on a table in the [DELETING] state until the table deletion is complete.
     
       When you delete a table, any indexes on that table are also deleted.
       
        If you have DynamoDB Streams enabled on the table, then the corresponding stream on that table goes into the [DISABLED] state, and the stream is automatically deleted after 24 hours.
        
         Use the [DescribeTable] action to check the status of the table. 
          *)

  
end

module DescribeBackup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_backup_input ->
        (describe_backup_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BackupNotFoundException of backup_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
  (** Describes an existing backup of a table.

 You can call [DescribeBackup] at a maximum rate of 10 times per second.
  *)

  
end

module DescribeContinuousBackups : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_continuous_backups_input ->
        (describe_continuous_backups_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
  (** Checks the status of continuous backups and point in time recovery on the specified table. Continuous backups are [ENABLED] on all tables at table creation. If point in time recovery is enabled, [PointInTimeRecoveryStatus] will be set to ENABLED.

  After continuous backups and point in time recovery are enabled, you can restore to any point in time within [EarliestRestorableDateTime] and [LatestRestorableDateTime]. 
 
   [LatestRestorableDateTime] is typically 5 minutes before the current time. You can restore your table to any point in time during the last 35 days. 
  
   You can call [DescribeContinuousBackups] at a maximum rate of 10 times per second.
    *)

  
end

module DescribeContributorInsights : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_contributor_insights_input ->
        (describe_contributor_insights_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns information about contributor insights for a given table or global secondary index.
 *)

  
end

module DescribeEndpoints : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_endpoints_request ->
        (describe_endpoints_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** Returns the regional endpoint information. For more information on policy permissions, please see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/inter-network-traffic-privacy.html#inter-network-traffic-DescribeEndpoints}Internetwork traffic privacy}.
 *)

  
end

module DescribeExport : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_export_input ->
        (describe_export_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExportNotFoundException of export_not_found_exception
            | `InternalServerError of internal_server_error
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** Describes an existing table export.
 *)

  
end

module DescribeGlobalTable : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_global_table_input ->
        (describe_global_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `GlobalTableNotFoundException of global_table_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
  (** Returns information about the specified global table.

  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).
  
   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.
   
     *)

  
end

module DescribeGlobalTableSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_global_table_settings_input ->
        (describe_global_table_settings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `GlobalTableNotFoundException of global_table_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
  (** Describes Region-specific settings for a global table.

  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).
  
   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.
   
     *)

  
end

module DescribeImport : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_import_input ->
        (describe_import_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ImportNotFoundException of import_not_found_exception
            
        ]
      ) result
  (**  Represents the properties of the import. 
 *)

  
end

module DescribeKinesisStreamingDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_kinesis_streaming_destination_input ->
        (describe_kinesis_streaming_destination_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns information about the status of Kinesis streaming.
 *)

  
end

module DescribeLimits : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_limits_input ->
        (describe_limits_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
  (** Returns the current provisioned-capacity quotas for your Amazon Web Services account in a Region, both for the Region as a whole and for any one DynamoDB table that you create there.

 When you establish an Amazon Web Services account, the account has initial quotas on the maximum read capacity units and write capacity units that you can provision across all of your DynamoDB tables in a given Region. Also, there are per-table quotas that apply when you create a table there. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html}Service, Account, and Table Quotas} page in the {i Amazon DynamoDB Developer Guide}.
 
  Although you can increase these quotas by filing a case at {{:https://console.aws.amazon.com/support/home#/}Amazon Web Services Support Center}, obtaining the increase is not instantaneous. The [DescribeLimits] action lets you write code to compare the capacity you are currently using to those quotas imposed by your account so that you have enough time to apply for an increase before you hit a quota.
  
   For example, you could use one of the Amazon Web Services SDKs to do the following:
   
    {ol
          {-  Call [DescribeLimits] for a particular Region to obtain your current account quotas on provisioned capacity there.
              
               }
          {-  Create a variable to hold the aggregate read capacity units provisioned for all your tables in that Region, and one to hold the aggregate write capacity units. Zero them both.
              
               }
          {-  Call [ListTables] to obtain a list of all your DynamoDB tables.
              
               }
          {-  For each table name listed by [ListTables], do the following:
              
               {ul
                     {-  Call [DescribeTable] with the table name.
                         
                          }
                     {-  Use the data returned by [DescribeTable] to add the read capacity units and write capacity units provisioned for the table itself to your variables.
                         
                          }
                     {-  If the table has one or more global secondary indexes (GSIs), loop over these GSIs and add their provisioned capacity values to your variables as well.
                         
                          }
                     
           }
            }
          {-  Report the account quotas for that Region returned by [DescribeLimits], along with the total current provisioned capacity levels you have calculated.
              
               }
          }
   This will let you see whether you are getting close to your account-level quotas.
   
    The per-table quotas apply only when you are creating a new table. They restrict the sum of the provisioned capacity of the new table itself and all its global secondary indexes.
    
     For existing tables and their GSIs, DynamoDB doesn't let you increase provisioned capacity extremely rapidly, but the only quota that applies is that the aggregate provisioned capacity over all your tables and GSIs cannot exceed either of the per-account quotas.
     
        [DescribeLimits] should only be called periodically. You can expect throttling errors if you call it more than once in a minute.
       
         The [DescribeLimits] Request element has no content.
          *)

  
end

module DescribeTable : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_table_input ->
        (describe_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns information about the table, including the current status of the table, when it was created, the primary key schema, and any indexes on the table.

  For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version). 
  
     If you issue a [DescribeTable] request immediately after a [CreateTable] request, DynamoDB might return a [ResourceNotFoundException]. This is because [DescribeTable] uses an eventually consistent query, and the metadata for your table might not be available at that moment. Wait for a few seconds, and then try the [DescribeTable] request again.
     
       *)

  
end

module DescribeTableReplicaAutoScaling : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_table_replica_auto_scaling_input ->
        (describe_table_replica_auto_scaling_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Describes auto scaling settings across replicas of the global table at once.

  For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version).
  
    *)

  
end

module DescribeTimeToLive : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_time_to_live_input ->
        (describe_time_to_live_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Gives a description of the Time to Live (TTL) status on the specified table. 
 *)

  
end

module DisableKinesisStreamingDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      kinesis_streaming_destination_input ->
        (kinesis_streaming_destination_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Stops replication from the DynamoDB table to the Kinesis data stream. This is done without deleting either of the resources.
 *)

  
end

module EnableKinesisStreamingDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      kinesis_streaming_destination_input ->
        (kinesis_streaming_destination_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Starts table data replication to the specified Kinesis data stream at a timestamp chosen during the enable workflow. If this operation doesn't return results immediately, use DescribeKinesisStreamingDestination to check if streaming to the Kinesis data stream is ACTIVE.
 *)

  
end

module ExecuteStatement : sig
  val request :
    Smaws_Lib.Context.t ->
      execute_statement_input ->
        (execute_statement_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `DuplicateItemException of duplicate_item_exception
            | `InternalServerError of internal_server_error
            | `ItemCollectionSizeLimitExceededException of item_collection_size_limit_exceeded_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionConflictException of transaction_conflict_exception
            
        ]
      ) result
  (** This operation allows you to perform reads and singleton writes on data stored in DynamoDB, using PartiQL.

 For PartiQL reads ([SELECT] statement), if the total number of processed items exceeds the maximum dataset size limit of 1 MB, the read stops and results are returned to the user as a [LastEvaluatedKey] value to continue the read in a subsequent operation. If the filter criteria in [WHERE] clause does not match any data, the read will return an empty result set.
 
  A single [SELECT] statement response can return up to the maximum number of items (if using the Limit parameter) or a maximum of 1 MB of data (and then apply any filtering to the results using [WHERE] clause). If [LastEvaluatedKey] is present in the response, you need to paginate the result set. If [NextToken] is present, you need to paginate the result set and include [NextToken].
   *)

  
end

module ExecuteTransaction : sig
  val request :
    Smaws_Lib.Context.t ->
      execute_transaction_input ->
        (execute_transaction_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
            | `InternalServerError of internal_server_error
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionCanceledException of transaction_canceled_exception
            | `TransactionInProgressException of transaction_in_progress_exception
            
        ]
      ) result
  (** This operation allows you to perform transactional reads or writes on data stored in DynamoDB, using PartiQL.

  The entire transaction must consist of either read statements or write statements, you cannot mix both in one transaction. The EXISTS function is an exception and can be used to check the condition of specific attributes of the item in a similar manner to [ConditionCheck] in the {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/transaction-apis.html#transaction-apis-txwriteitems}TransactWriteItems} API.
  
    *)

  
end

module ExportTableToPointInTime : sig
  val request :
    Smaws_Lib.Context.t ->
      export_table_to_point_in_time_input ->
        (export_table_to_point_in_time_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExportConflictException of export_conflict_exception
            | `InternalServerError of internal_server_error
            | `InvalidExportTimeException of invalid_export_time_exception
            | `LimitExceededException of limit_exceeded_exception
            | `PointInTimeRecoveryUnavailableException of point_in_time_recovery_unavailable_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
  (** Exports table data to an S3 bucket. The table must have point in time recovery enabled, and you can export data from any time within the point in time recovery window.
 *)

  
end

module GetItem : sig
  val request :
    Smaws_Lib.Context.t ->
      get_item_input ->
        (get_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** The [GetItem] operation returns a set of attributes for the item with the given primary key. If there is no matching item, [GetItem] does not return any data and there will be no [Item] element in the response.

  [GetItem] provides an eventually consistent read by default. If your application requires a strongly consistent read, set [ConsistentRead] to [true]. Although a strongly consistent read might take more time than an eventually consistent read, it always returns the last updated value.
  *)

  
end

module GetResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_policy_input ->
        (get_resource_policy_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `PolicyNotFoundException of policy_not_found_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns the resource-based policy document attached to the resource, which can be a table or stream, in JSON format.

  [GetResourcePolicy] follows an {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html} {i eventually consistent} } model. The following list describes the outcomes when you issue the [GetResourcePolicy] request immediately after issuing another request:
 
  {ul
        {-  If you issue a [GetResourcePolicy] request immediately after a [PutResourcePolicy] request, DynamoDB might return a [PolicyNotFoundException].
            
             }
        {-  If you issue a [GetResourcePolicy]request immediately after a [DeleteResourcePolicy] request, DynamoDB might return the policy that was present before the deletion request.
            
             }
        {-  If you issue a [GetResourcePolicy] request immediately after a [CreateTable] request, which includes a resource-based policy, DynamoDB might return a [ResourceNotFoundException] or a [PolicyNotFoundException].
            
             }
        }
   Because [GetResourcePolicy] uses an {i eventually consistent} query, the metadata for your policy or table might not be available at that moment. Wait for a few seconds, and then retry the [GetResourcePolicy] request.
   
    After a [GetResourcePolicy] request returns a policy created using the [PutResourcePolicy] request, the policy will be applied in the authorization of requests to the resource. Because this process is eventually consistent, it will take some time to apply the policy to all requests to a resource. Policies that you attach while creating a table using the [CreateTable] request will always be applied to all requests for that table.
     *)

  
end

module ImportTable : sig
  val request :
    Smaws_Lib.Context.t ->
      import_table_input ->
        (import_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ImportConflictException of import_conflict_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (**  Imports table data from an S3 bucket. 
 *)

  
end

module ListBackups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_backups_input ->
        (list_backups_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
  (** List DynamoDB backups that are associated with an Amazon Web Services account and weren't made with Amazon Web Services Backup. To list these backups for a given table, specify [TableName]. [ListBackups] returns a paginated list of results with at most 1 MB worth of items in a page. You can also specify a maximum number of entries to be returned in a page.

 In the request, start time is inclusive, but end time is exclusive. Note that these boundaries are for the time at which the original backup was requested.
 
  You can call [ListBackups] a maximum of five times per second.
  
   If you want to retrieve the complete list of backups made with Amazon Web Services Backup, use the {{:https://docs.aws.amazon.com/aws-backup/latest/devguide/API_ListBackupJobs.html}Amazon Web Services Backup list API.} 
    *)

  
end

module ListContributorInsights : sig
  val request :
    Smaws_Lib.Context.t ->
      list_contributor_insights_input ->
        (list_contributor_insights_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns a list of ContributorInsightsSummary for a table and all its global secondary indexes.
 *)

  
end

module ListExports : sig
  val request :
    Smaws_Lib.Context.t ->
      list_exports_input ->
        (list_exports_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** Lists completed exports within the past 90 days.
 *)

  
end

module ListGlobalTables : sig
  val request :
    Smaws_Lib.Context.t ->
      list_global_tables_input ->
        (list_global_tables_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
  (** Lists all global tables that have a replica in the specified Region.

  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).
  
   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.
   
     *)

  
end

module ListImports : sig
  val request :
    Smaws_Lib.Context.t ->
      list_imports_input ->
        (list_imports_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (**  Lists completed imports within the past 90 days. 
 *)

  
end

module ListTables : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tables_input ->
        (list_tables_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
  (** Returns an array of table names associated with the current account and endpoint. The output from [ListTables] is paginated, with each page returning a maximum of 100 table names.
 *)

  
end

module ListTagsOfResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_of_resource_input ->
        (list_tags_of_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** List all tags on an Amazon DynamoDB resource. You can call ListTagsOfResource up to 10 times per second, per account.

 For an overview on tagging DynamoDB resources, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html}Tagging for DynamoDB} in the {i Amazon DynamoDB Developer Guide}.
  *)

  
end

module PutItem : sig
  val request :
    Smaws_Lib.Context.t ->
      put_item_input ->
        (put_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ItemCollectionSizeLimitExceededException of item_collection_size_limit_exceeded_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionConflictException of transaction_conflict_exception
            
        ]
      ) result
  (** Creates a new item, or replaces an old item with a new item. If an item that has the same primary key as the new item already exists in the specified table, the new item completely replaces the existing item. You can perform a conditional put operation (add a new item if one with the specified primary key doesn't exist), or replace an existing item if it has certain attribute values. You can return the item's attribute values in the same operation, using the [ReturnValues] parameter.

 When you add an item, the primary key attributes are the only required attributes. 
 
  Empty String and Binary attribute values are allowed. Attribute values of type String and Binary must have a length greater than zero if the attribute is used as a key attribute for a table or index. Set type attributes cannot be empty. 
  
   Invalid Requests with empty values will be rejected with a [ValidationException] exception.
   
     To prevent a new item from replacing an existing item, use a conditional expression that contains the [attribute_not_exists] function with the name of the attribute being used as the partition key for the table. Since every record must contain that attribute, the [attribute_not_exists] function will only succeed if no matching item exists.
     
       For more information about [PutItem], see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithItems.html}Working with Items} in the {i Amazon DynamoDB Developer Guide}.
        *)

  
end

module PutResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_policy_input ->
        (put_resource_policy_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `PolicyNotFoundException of policy_not_found_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Attaches a resource-based policy document to the resource, which can be a table or stream. When you attach a resource-based policy using this API, the policy application is {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html} {i eventually consistent} }.

  [PutResourcePolicy] is an idempotent operation; running it multiple times on the same resource using the same policy document will return the same revision ID. If you specify an [ExpectedRevisionId] that doesn't match the current policy's [RevisionId], the [PolicyNotFoundException] will be returned.
 
    [PutResourcePolicy] is an asynchronous operation. If you issue a [GetResourcePolicy] request immediately after a [PutResourcePolicy] request, DynamoDB might return your previous policy, if there was one, or return the [PolicyNotFoundException]. This is because [GetResourcePolicy] uses an eventually consistent query, and the metadata for your policy or table might not be available at that moment. Wait for a few seconds, and then try the [GetResourcePolicy] request again.
   
     *)

  
end

module Query : sig
  val request :
    Smaws_Lib.Context.t ->
      query_input ->
        (query_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** You must provide the name of the partition key attribute and a single value for that attribute. [Query] returns all items with that partition key value. Optionally, you can provide a sort key attribute and use a comparison operator to refine the search results.

 Use the [KeyConditionExpression] parameter to provide a specific value for the partition key. The [Query] operation will return all of the items from the table or index with that partition key value. You can optionally narrow the scope of the [Query] operation by specifying a sort key value and a comparison operator in [KeyConditionExpression]. To further refine the [Query] results, you can optionally provide a [FilterExpression]. A [FilterExpression] determines which items within the results should be returned to you. All of the other results are discarded. 
 
   A [Query] operation always returns a result set. If no matching items are found, the result set will be empty. Queries that do not return results consume the minimum number of read capacity units for that type of read operation. 
  
     DynamoDB calculates the number of read capacity units consumed based on item size, not on the amount of data that is returned to an application. The number of capacity units consumed will be the same whether you request all of the attributes (the default behavior) or just some of them (using a projection expression). The number will also be the same whether or not you use a [FilterExpression]. 
    
       [Query] results are always sorted by the sort key value. If the data type of the sort key is Number, the results are returned in numeric order; otherwise, the results are returned in order of UTF-8 bytes. By default, the sort order is ascending. To reverse the order, set the [ScanIndexForward] parameter to false. 
      
        A single [Query] operation will read up to the maximum number of items set (if using the [Limit] parameter) or a maximum of 1 MB of data and then apply any filtering to the results using [FilterExpression]. If [LastEvaluatedKey] is present in the response, you will need to paginate the result set. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Query.html#Query.Pagination}Paginating the Results} in the {i Amazon DynamoDB Developer Guide}. 
       
         [FilterExpression] is applied after a [Query] finishes, but before the results are returned. A [FilterExpression] cannot contain partition key or sort key attributes. You need to specify those attributes in the [KeyConditionExpression]. 
        
           A [Query] operation can return an empty result set and a [LastEvaluatedKey] if all the items read for the page of results are filtered out. 
          
            You can query a table, a local secondary index, or a global secondary index. For a query on a table or on a local secondary index, you can set the [ConsistentRead] parameter to [true] and obtain a strongly consistent result. Global secondary indexes support eventually consistent reads only, so do not specify [ConsistentRead] when querying a global secondary index.
             *)

  
end

module RestoreTableFromBackup : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_table_from_backup_input ->
        (restore_table_from_backup_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BackupInUseException of backup_in_use_exception
            | `BackupNotFoundException of backup_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `TableAlreadyExistsException of table_already_exists_exception
            | `TableInUseException of table_in_use_exception
            
        ]
      ) result
  (** Creates a new table from an existing backup. Any number of users can execute up to 50 concurrent restores (any type of restore) in a given account. 

 You can call [RestoreTableFromBackup] at a maximum rate of 10 times per second.
 
  You must manually set up the following on the restored table:
  
   {ul
         {-  Auto scaling policies
             
              }
         {-  IAM policies
             
              }
         {-  Amazon CloudWatch metrics and alarms
             
              }
         {-  Tags
             
              }
         {-  Stream settings
             
              }
         {-  Time to Live (TTL) settings
             
              }
         }
   *)

  
end

module RestoreTableToPointInTime : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_table_to_point_in_time_input ->
        (restore_table_to_point_in_time_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `InvalidRestoreTimeException of invalid_restore_time_exception
            | `LimitExceededException of limit_exceeded_exception
            | `PointInTimeRecoveryUnavailableException of point_in_time_recovery_unavailable_exception
            | `TableAlreadyExistsException of table_already_exists_exception
            | `TableInUseException of table_in_use_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
  (** Restores the specified table to the specified point in time within [EarliestRestorableDateTime] and [LatestRestorableDateTime]. You can restore your table to any point in time during the last 35 days. Any number of users can execute up to 50 concurrent restores (any type of restore) in a given account. 

 When you restore using point in time recovery, DynamoDB restores your table data to the state based on the selected date and time (day:hour:minute:second) to a new table. 
 
  Along with data, the following are also included on the new restored table using point in time recovery: 
  
   {ul
         {-  Global secondary indexes (GSIs)
             
              }
         {-  Local secondary indexes (LSIs)
             
              }
         {-  Provisioned read and write capacity
             
              }
         {-  Encryption settings
             
                All these settings come from the current settings of the source table at the time of restore. 
               
                 }
         }
   You must manually set up the following on the restored table:
   
    {ul
          {-  Auto scaling policies
              
               }
          {-  IAM policies
              
               }
          {-  Amazon CloudWatch metrics and alarms
              
               }
          {-  Tags
              
               }
          {-  Stream settings
              
               }
          {-  Time to Live (TTL) settings
              
               }
          {-  Point in time recovery settings
              
               }
          }
   *)

  
end

module Scan : sig
  val request :
    Smaws_Lib.Context.t ->
      scan_input ->
        (scan_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** The [Scan] operation returns one or more items and item attributes by accessing every item in a table or a secondary index. To have DynamoDB return fewer items, you can provide a [FilterExpression] operation.

 If the total size of scanned items exceeds the maximum dataset size limit of 1 MB, the scan completes and results are returned to the user. The [LastEvaluatedKey] value is also returned and the requestor can use the [LastEvaluatedKey] to continue the scan in a subsequent operation. Each scan response also includes number of items that were scanned (ScannedCount) as part of the request. If using a [FilterExpression], a scan result can result in no items meeting the criteria and the [Count] will result in zero. If you did not use a [FilterExpression] in the scan request, then [Count] is the same as [ScannedCount].
 
    [Count] and [ScannedCount] only return the count of items specific to a single scan request and, unless the table is less than 1MB, do not represent the total number of items in the table. 
   
     A single [Scan] operation first reads up to the maximum number of items set (if using the [Limit] parameter) or a maximum of 1 MB of data and then applies any filtering to the results if a [FilterExpression] is provided. If [LastEvaluatedKey] is present in the response, pagination is required to complete the full table scan. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.Pagination}Paginating the Results} in the {i Amazon DynamoDB Developer Guide}.
     
       [Scan] operations proceed sequentially; however, for faster performance on a large table or secondary index, applications can request a parallel [Scan] operation by providing the [Segment] and [TotalSegments] parameters. For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.ParallelScan}Parallel Scan} in the {i Amazon DynamoDB Developer Guide}.
      
       By default, a [Scan] uses eventually consistent reads when accessing the items in a table. Therefore, the results from an eventually consistent [Scan] may not include the latest item changes at the time the scan iterates through each item in the table. If you require a strongly consistent read of each item as the scan iterates through the items in the table, you can set the [ConsistentRead] parameter to true. Strong consistency only relates to the consistency of the read at the item level.
       
          DynamoDB does not provide snapshot isolation for a scan operation when the [ConsistentRead] parameter is set to true. Thus, a DynamoDB scan operation does not guarantee that all reads in a scan see a consistent snapshot of the table when the scan operation was requested. 
         
           *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Associate a set of tags with an Amazon DynamoDB resource. You can then activate these user-defined tags so that they appear on the Billing and Cost Management console for cost allocation tracking. You can call TagResource up to five times per second, per account. 

 For an overview on tagging DynamoDB resources, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html}Tagging for DynamoDB} in the {i Amazon DynamoDB Developer Guide}.
  *)

  
end

module TransactGetItems : sig
  val request :
    Smaws_Lib.Context.t ->
      transact_get_items_input ->
        (transact_get_items_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionCanceledException of transaction_canceled_exception
            
        ]
      ) result
  (**  [TransactGetItems] is a synchronous operation that atomically retrieves multiple items from one or more tables (but not from indexes) in a single account and Region. A [TransactGetItems] call can contain up to 100 [TransactGetItem] objects, each of which contains a [Get] structure that specifies an item to retrieve from a table in the account and Region. A call to [TransactGetItems] cannot retrieve items from tables in more than one Amazon Web Services account or Region. The aggregate size of the items in the transaction cannot exceed 4 MB.

 DynamoDB rejects the entire [TransactGetItems] request if any of the following is true:
 
  {ul
        {-  A conflicting operation is in the process of updating an item to be read.
            
             }
        {-  There is insufficient provisioned capacity for the transaction to be completed.
            
             }
        {-  There is a user error, such as an invalid data format.
            
             }
        {-  The aggregate size of the items in the transaction exceeded 4 MB.
            
             }
        }
   *)

  
end

module TransactWriteItems : sig
  val request :
    Smaws_Lib.Context.t ->
      transact_write_items_input ->
        (transact_write_items_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionCanceledException of transaction_canceled_exception
            | `TransactionInProgressException of transaction_in_progress_exception
            
        ]
      ) result
  (**  [TransactWriteItems] is a synchronous write operation that groups up to 100 action requests. These actions can target items in different tables, but not in different Amazon Web Services accounts or Regions, and no two actions can target the same item. For example, you cannot both [ConditionCheck] and [Update] the same item. The aggregate size of the items in the transaction cannot exceed 4 MB.

 The actions are completed atomically so that either all of them succeed, or all of them fail. They are defined by the following objects:
 
  {ul
        {-   [Put]  —   Initiates a [PutItem] operation to write a new item. This structure specifies the primary key of the item to be written, the name of the table to write it in, an optional condition expression that must be satisfied for the write to succeed, a list of the item's attributes, and a field indicating whether to retrieve the item's attributes if the condition is not met.
            
             }
        {-   [Update]  —   Initiates an [UpdateItem] operation to update an existing item. This structure specifies the primary key of the item to be updated, the name of the table where it resides, an optional condition expression that must be satisfied for the update to succeed, an expression that defines one or more attributes to be updated, and a field indicating whether to retrieve the item's attributes if the condition is not met.
            
             }
        {-   [Delete]  —   Initiates a [DeleteItem] operation to delete an existing item. This structure specifies the primary key of the item to be deleted, the name of the table where it resides, an optional condition expression that must be satisfied for the deletion to succeed, and a field indicating whether to retrieve the item's attributes if the condition is not met.
            
             }
        {-   [ConditionCheck]  —   Applies a condition to an item that is not being modified by the transaction. This structure specifies the primary key of the item to be checked, the name of the table where it resides, a condition expression that must be satisfied for the transaction to succeed, and a field indicating whether to retrieve the item's attributes if the condition is not met.
            
             }
        }
   DynamoDB rejects the entire [TransactWriteItems] request if any of the following is true:
   
    {ul
          {-  A condition in one of the condition expressions is not met.
              
               }
          {-  An ongoing operation is in the process of updating the same item.
              
               }
          {-  There is insufficient provisioned capacity for the transaction to be completed.
              
               }
          {-  An item size becomes too large (bigger than 400 KB), a local secondary index (LSI) becomes too large, or a similar validation error occurs because of changes made by the transaction.
              
               }
          {-  The aggregate size of the items in the transaction exceeds 4 MB.
              
               }
          {-  There is a user error, such as an invalid data format.
              
               }
          }
   *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Removes the association of tags from an Amazon DynamoDB resource. You can call [UntagResource] up to five times per second, per account. 

 For an overview on tagging DynamoDB resources, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html}Tagging for DynamoDB} in the {i Amazon DynamoDB Developer Guide}.
  *)

  
end

module UpdateContinuousBackups : sig
  val request :
    Smaws_Lib.Context.t ->
      update_continuous_backups_input ->
        (update_continuous_backups_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ContinuousBackupsUnavailableException of continuous_backups_unavailable_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
  (**  [UpdateContinuousBackups] enables or disables point in time recovery for the specified table. A successful [UpdateContinuousBackups] call returns the current [ContinuousBackupsDescription]. Continuous backups are [ENABLED] on all tables at table creation. If point in time recovery is enabled, [PointInTimeRecoveryStatus] will be set to ENABLED.

  Once continuous backups and point in time recovery are enabled, you can restore to any point in time within [EarliestRestorableDateTime] and [LatestRestorableDateTime]. 
 
   [LatestRestorableDateTime] is typically 5 minutes before the current time. You can restore your table to any point in time during the last 35 days. 
   *)

  
end

module UpdateContributorInsights : sig
  val request :
    Smaws_Lib.Context.t ->
      update_contributor_insights_input ->
        (update_contributor_insights_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Updates the status for contributor insights for a specific table or index. CloudWatch Contributor Insights for DynamoDB graphs display the partition key and (if applicable) sort key of frequently accessed items and frequently throttled items in plaintext. If you require the use of Amazon Web Services Key Management Service (KMS) to encrypt this table’s partition key and sort key data with an Amazon Web Services managed key or customer managed key, you should not enable CloudWatch Contributor Insights for DynamoDB for this table.
 *)

  
end

module UpdateGlobalTable : sig
  val request :
    Smaws_Lib.Context.t ->
      update_global_table_input ->
        (update_global_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `GlobalTableNotFoundException of global_table_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ReplicaAlreadyExistsException of replica_already_exists_exception
            | `ReplicaNotFoundException of replica_not_found_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
  (** Adds or removes replicas in the specified global table. The global table must already exist to be able to use this operation. Any replica to be added must be empty, have the same name as the global table, have the same key schema, have DynamoDB Streams enabled, and have the same provisioned and maximum write capacity units.

  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).
  
   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.
   
       For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version). If you are using global tables {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Version 2019.11.21} you can use {{:https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_UpdateTable.html}UpdateTable} instead. 
      
        Although you can use [UpdateGlobalTable] to add replicas and remove replicas in a single request, for simplicity we recommend that you issue separate requests for adding or removing replicas. 
       
          If global secondary indexes are specified, then the following conditions must also be met: 
         
          {ul
                {-   The global secondary indexes must have the same name. 
                    
                     }
                {-   The global secondary indexes must have the same hash key and sort key (if present). 
                    
                     }
                {-   The global secondary indexes must have the same provisioned and maximum write capacity units. 
                    
                     }
                }
   *)

  
end

module UpdateGlobalTableSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_global_table_settings_input ->
        (update_global_table_settings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `GlobalTableNotFoundException of global_table_not_found_exception
            | `IndexNotFoundException of index_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ReplicaNotFoundException of replica_not_found_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** Updates settings for a global table.

  This documentation is for version 2017.11.29 (Legacy) of global tables, which should be avoided for new global tables. Customers should use {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html}Global Tables version 2019.11.21 (Current)} when possible, because it provides greater flexibility, higher efficiency, and consumes less write capacity than 2017.11.29 (Legacy).
  
   To determine which version you're using, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.DetermineVersion.html}Determining the global table version you are using}. To update existing global tables from version 2017.11.29 (Legacy) to version 2019.11.21 (Current), see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_upgrade.html}Upgrading global tables}.
   
     *)

  
end

module UpdateItem : sig
  val request :
    Smaws_Lib.Context.t ->
      update_item_input ->
        (update_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ItemCollectionSizeLimitExceededException of item_collection_size_limit_exceeded_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionConflictException of transaction_conflict_exception
            
        ]
      ) result
  (** Edits an existing item's attributes, or adds a new item to the table if it does not already exist. You can put, delete, or add attribute values. You can also perform a conditional update on an existing item (insert a new attribute name-value pair if it doesn't exist, or replace an existing name-value pair if it has certain expected attribute values).

 You can also return the item's attribute values in the same [UpdateItem] operation using the [ReturnValues] parameter.
  *)

  
end

module UpdateKinesisStreamingDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      update_kinesis_streaming_destination_input ->
        (update_kinesis_streaming_destination_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** The command to update the Kinesis stream destination.
 *)

  
end

module UpdateTable : sig
  val request :
    Smaws_Lib.Context.t ->
      update_table_input ->
        (update_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Modifies the provisioned throughput settings, global secondary indexes, or DynamoDB Streams settings for a given table.

  For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version). 
  
    You can only perform one of the following operations at once:
    
     {ul
           {-  Modify the provisioned throughput settings of the table.
               
                }
           {-  Remove a global secondary index from the table.
               
                }
           {-  Create a new global secondary index on the table. After the index begins backfilling, you can use [UpdateTable] to perform other operations.
               
                }
           }
    [UpdateTable] is an asynchronous operation; while it's executing, the table status changes from [ACTIVE] to [UPDATING]. While it's [UPDATING], you can't issue another [UpdateTable] request. When the table returns to the [ACTIVE] state, the [UpdateTable] operation is complete.
    *)

  
end

module UpdateTableReplicaAutoScaling : sig
  val request :
    Smaws_Lib.Context.t ->
      update_table_replica_auto_scaling_input ->
        (update_table_replica_auto_scaling_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Updates auto scaling settings on your global tables at once.

  For global tables, this operation only applies to global tables using Version 2019.11.21 (Current version). 
  
    *)

  
end

module UpdateTimeToLive : sig
  val request :
    Smaws_Lib.Context.t ->
      update_time_to_live_input ->
        (update_time_to_live_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** The [UpdateTimeToLive] method enables or disables Time to Live (TTL) for the specified table. A successful [UpdateTimeToLive] call returns the current [TimeToLiveSpecification]. It can take up to one hour for the change to fully process. Any additional [UpdateTimeToLive] calls for the same table during this one hour duration result in a [ValidationException]. 

 TTL compares the current time in epoch time format to the time stored in the TTL attribute of an item. If the epoch time value stored in the attribute is less than the current time, the item is marked as expired and subsequently deleted.
 
    The epoch time format is the number of seconds elapsed since 12:00:00 AM January 1, 1970 UTC. 
   
     DynamoDB deletes expired items on a best-effort basis to ensure availability of throughput for other data operations. 
     
       DynamoDB typically deletes expired items within two days of expiration. The exact duration within which an item gets deleted after expiration is specific to the nature of the workload. Items that have expired and not been deleted will still show up in reads, queries, and scans.
       
         As items are deleted, they are removed from any local secondary index and global secondary index immediately in the same eventually consistent way as a standard delete operation.
         
          For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html}Time To Live} in the Amazon DynamoDB Developer Guide. 
           *)

  
end

