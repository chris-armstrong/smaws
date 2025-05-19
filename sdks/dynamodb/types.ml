open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "dynamodb";
      endpointPrefix = "dynamodb";
      version = "2012-08-10";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
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
  statements: batch_statement_request list }[@@ocaml.doc ""]