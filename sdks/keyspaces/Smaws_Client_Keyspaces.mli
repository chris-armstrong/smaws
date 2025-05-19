(** 
    Keyspaces client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec rs =
  | SINGLE_REGION 
  | MULTI_REGION [@@ocaml.doc ""]
type nonrec validation_exception = {
  message: string option }[@@ocaml.doc
                            "The operation failed due to an invalid or malformed request.\n"]
type nonrec update_table_response = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec column_definition = {
  type_: string ;
  name: string }[@@ocaml.doc
                  "The names and data types of regular columns.\n"]
type nonrec throughput_mode =
  | PAY_PER_REQUEST 
  | PROVISIONED [@@ocaml.doc ""]
type nonrec capacity_specification =
  {
  write_capacity_units: int option ;
  read_capacity_units: int option ;
  throughput_mode: throughput_mode }[@@ocaml.doc
                                      "Amazon Keyspaces has two read/write capacity modes for processing reads and writes on your tables: \n\n {ul\n       {-  On-demand (default)\n           \n            }\n       {-  Provisioned\n           \n            }\n       }\n   The read/write capacity mode that you choose controls how you are charged for read and write throughput and how table throughput capacity is managed.\n   \n    For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.\n    "]
type nonrec encryption_type =
  | CUSTOMER_MANAGED_KMS_KEY 
  | AWS_OWNED_KMS_KEY [@@ocaml.doc ""]
type nonrec encryption_specification =
  {
  kms_key_identifier: string option ;
  type_: encryption_type }[@@ocaml.doc
                            "Amazon Keyspaces encrypts and decrypts the table data at rest transparently and integrates with Key Management Service for storing and managing the encryption key. You can choose one of the following KMS keys (KMS keys):\n\n {ul\n       {-  Amazon Web Services owned key - This is the default encryption type. The key is owned by Amazon Keyspaces (no additional charge). \n           \n            }\n       {-  Customer managed key - This key is stored in your account and is created, owned, and managed by you. You have full control over the customer managed key (KMS charges apply).\n           \n            }\n       }\n   For more information about encryption at rest in Amazon Keyspaces, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}Encryption at rest} in the {i Amazon Keyspaces Developer Guide}.\n   \n    For more information about KMS, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/EncryptionAtRest.html}KMS management service concepts} in the {i Key Management Service Developer Guide}.\n    "]
type nonrec point_in_time_recovery_status =
  | ENABLED 
  | DISABLED [@@ocaml.doc ""]
type nonrec point_in_time_recovery = {
  status: point_in_time_recovery_status }[@@ocaml.doc
                                           "Point-in-time recovery (PITR) helps protect your Amazon Keyspaces tables from accidental write or delete operations by providing you continuous backups of your table data.\n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery.html}Point-in-time recovery} in the {i Amazon Keyspaces Developer Guide}.\n "]
type nonrec time_to_live_status =
  | ENABLED [@@ocaml.doc ""]
type nonrec time_to_live = {
  status: time_to_live_status }[@@ocaml.doc
                                 "Enable custom Time to Live (TTL) settings for rows and columns without setting a TTL default for the specified table.\n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/TTL-how-it-works.html#ttl-howitworks_enabling}Enabling TTL on tables} in the {i Amazon Keyspaces Developer Guide}.\n "]
type nonrec client_side_timestamps_status =
  | ENABLED [@@ocaml.doc ""]
type nonrec client_side_timestamps = {
  status: client_side_timestamps_status }[@@ocaml.doc
                                           "The client-side timestamp setting of the table.\n\n For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/client-side-timestamps-how-it-works.html}How it works: Amazon Keyspaces client-side timestamps} in the {i Amazon Keyspaces Developer Guide}.\n "]
type nonrec target_tracking_scaling_policy_configuration =
  {
  target_value: float ;
  scale_out_cooldown: int option ;
  scale_in_cooldown: int option ;
  disable_scale_in: bool option }[@@ocaml.doc
                                   "The auto scaling policy that scales a table based on the ratio of consumed to provisioned capacity.\n"]
type nonrec auto_scaling_policy =
  {
  target_tracking_scaling_policy_configuration:
    target_tracking_scaling_policy_configuration option }[@@ocaml.doc
                                                           "Amazon Keyspaces supports the [target tracking] auto scaling policy. With this policy, Amazon Keyspaces auto scaling ensures that the table's ratio of consumed to provisioned capacity stays at or near the target value that you specify. You define the target value as a percentage between 20 and 90.\n"]
type nonrec auto_scaling_settings =
  {
  scaling_policy: auto_scaling_policy option ;
  maximum_units: int option ;
  minimum_units: int option ;
  auto_scaling_disabled: bool option }[@@ocaml.doc
                                        "The optional auto scaling settings for a table with provisioned throughput capacity.\n\n To turn on auto scaling for a table in [throughputMode:PROVISIONED], you must specify the following parameters. \n \n  Configure the minimum and maximum capacity units. The auto scaling policy ensures that capacity never goes below the minimum or above the maximum range.\n  \n   {ul\n         {-   [minimumUnits]: The minimum level of throughput the table should always be ready to support. The value must be between 1 and the max throughput per second quota for your account (40,000 by default).\n             \n              }\n         {-   [maximumUnits]: The maximum level of throughput the table should always be ready to support. The value must be between 1 and the max throughput per second quota for your account (40,000 by default).\n             \n              }\n         {-   [scalingPolicy]: Amazon Keyspaces supports the [target tracking] scaling policy. The auto scaling target is the provisioned capacity of the table. \n             \n              {ul\n                    {-   [targetTrackingScalingPolicyConfiguration]: To define the target tracking policy, you must define the target value. \n                        \n                         {ul\n                               {-   [targetValue]: The target utilization rate of the table. Amazon Keyspaces auto scaling ensures that the ratio of consumed capacity to provisioned capacity stays at or near this value. You define [targetValue] as a percentage. A [double] between 20 and 90. (Required)\n                                   \n                                    }\n                               {-   [disableScaleIn]: A [boolean] that specifies if [scale-in] is disabled or enabled for the table. This parameter is disabled by default. To turn on [scale-in], set the [boolean] value to [FALSE]. This means that capacity for a table can be automatically scaled down on your behalf. (Optional) \n                                   \n                                    }\n                               {-   [scaleInCooldown]: A cooldown period in seconds between scaling activities that lets the table stabilize before another scale in activity starts. If no value is provided, the default is 0. (Optional) \n                                   \n                                    }\n                               {-   [scaleOutCooldown]: A cooldown period in seconds between scaling activities that lets the table stabilize before another scale out activity starts. If no value is provided, the default is 0. (Optional) \n                                   \n                                    }\n                               \n                     }\n                      }\n                    \n          }\n           }\n         }\n   For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.\n   "]
type nonrec auto_scaling_specification =
  {
  read_capacity_auto_scaling: auto_scaling_settings option ;
  write_capacity_auto_scaling: auto_scaling_settings option }[@@ocaml.doc
                                                               "The optional auto scaling capacity settings for a table in provisioned capacity mode.\n"]
type nonrec replica_specification =
  {
  read_capacity_auto_scaling: auto_scaling_settings option ;
  read_capacity_units: int option ;
  region: string }[@@ocaml.doc
                    "The Amazon Web Services Region specific settings of a multi-Region table.\n\n For a multi-Region table, you can configure the table's read capacity differently per Amazon Web Services Region. You can do this by configuring the following parameters.\n \n  {ul\n        {-   [region]: The Region where these settings are applied. (Required)\n            \n             }\n        {-   [readCapacityUnits]: The provisioned read capacity units. (Optional)\n            \n             }\n        {-   [readCapacityAutoScaling]: The read capacity auto scaling settings for the table. (Optional)\n            \n             }\n        }\n  "]
type nonrec update_table_request =
  {
  replica_specifications: replica_specification list option ;
  auto_scaling_specification: auto_scaling_specification option ;
  client_side_timestamps: client_side_timestamps option ;
  default_time_to_live: int option ;
  ttl: time_to_live option ;
  point_in_time_recovery: point_in_time_recovery option ;
  encryption_specification: encryption_specification option ;
  capacity_specification: capacity_specification option ;
  add_columns: column_definition list option ;
  table_name: string ;
  keyspace_name: string }[@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "The operation exceeded the service quota for this resource. For more information on service quotas, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/quotas.html}Quotas} in the {i Amazon Keyspaces Developer Guide}.\n"]
type nonrec resource_not_found_exception =
  {
  resource_arn: string option ;
  message: string option }[@@ocaml.doc
                            "The operation tried to access a keyspace or table that doesn't exist. The resource might not be specified correctly, or its status might not be [ACTIVE].\n"]
type nonrec internal_server_exception = {
  message: string option }[@@ocaml.doc
                            "Amazon Keyspaces was unable to fully process this request because of an internal server error.\n"]
type nonrec conflict_exception = {
  message: string option }[@@ocaml.doc
                            "Amazon Keyspaces couldn't complete the requested action. This error may occur if you try to perform an action and the same or a different action is already in progress, or if you try to create a resource that already exists. \n"]
type nonrec access_denied_exception = {
  message: string option }[@@ocaml.doc
                            "You don't have sufficient access permissions to perform this action. \n"]
type nonrec untag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a single Amazon Keyspaces resource.\n\n Amazon Web Services-assigned tag names and values are automatically assigned the [aws:] prefix, which the user cannot assign. Amazon Web Services-assigned tag names do not count towards the tag limit of 50. User-assigned tag names have the prefix [user:] in the Cost Allocation Report. You cannot backdate the application of a tag.\n \n  For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.\n  "]
type nonrec untag_resource_request = {
  tags: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec tag_resource_response = unit
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec table_summary =
  {
  resource_arn: string ;
  table_name: string ;
  keyspace_name: string }[@@ocaml.doc
                           "Returns the name of the specified table, the keyspace it is stored in, and the unique identifier in the format of an Amazon Resource Name (ARN).\n"]
type nonrec table_status =
  | ACTIVE 
  | CREATING 
  | UPDATING 
  | DELETING 
  | DELETED 
  | RESTORING 
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS [@@ocaml.doc ""]
type nonrec static_column = {
  name: string }[@@ocaml.doc
                  "The static columns of the table. Static columns store values that are shared by all rows in the same partition.\n"]
type nonrec sort_order =
  | ASC 
  | DESC [@@ocaml.doc ""]
type nonrec partition_key = {
  name: string }[@@ocaml.doc
                  "The partition key portion of the primary key is required and determines how Amazon Keyspaces stores the data. The partition key can be a single column, or it can be a compound value composed of two or more columns.\n"]
type nonrec clustering_key = {
  order_by: sort_order ;
  name: string }[@@ocaml.doc
                  "The optional clustering column portion of your primary key determines how the data is clustered and sorted within each partition.\n"]
type nonrec schema_definition =
  {
  static_columns: static_column list option ;
  clustering_keys: clustering_key list option ;
  partition_keys: partition_key list ;
  all_columns: column_definition list }[@@ocaml.doc
                                         "Describes the schema of the table.\n"]
type nonrec restore_table_response = {
  restored_table_ar_n: string }[@@ocaml.doc ""]
type nonrec restore_table_request =
  {
  replica_specifications: replica_specification list option ;
  auto_scaling_specification: auto_scaling_specification option ;
  tags_override: tag list option ;
  point_in_time_recovery_override: point_in_time_recovery option ;
  encryption_specification_override: encryption_specification option ;
  capacity_specification_override: capacity_specification option ;
  restore_timestamp: CoreTypes.Timestamp.t option ;
  target_table_name: string ;
  target_keyspace_name: string ;
  source_table_name: string ;
  source_keyspace_name: string }[@@ocaml.doc ""]
type nonrec replication_specification =
  {
  region_list: string list option ;
  replication_strategy: rs }[@@ocaml.doc
                              " The replication specification of the keyspace includes:\n\n {ul\n       {-   [regionList] - up to six Amazon Web Services Regions where the keyspace is replicated in.\n           \n            }\n       {-   [replicationStrategy] - the required value is [SINGLE_REGION] or [MULTI_REGION].\n           \n            }\n       }\n  "]
type nonrec capacity_specification_summary =
  {
  last_update_to_pay_per_request_timestamp: CoreTypes.Timestamp.t option ;
  write_capacity_units: int option ;
  read_capacity_units: int option ;
  throughput_mode: throughput_mode }[@@ocaml.doc
                                      "The read/write throughput capacity mode for a table. The options are:\n\n {ul\n       {-   [throughputMode:PAY_PER_REQUEST] and \n           \n            }\n       {-   [throughputMode:PROVISIONED].\n           \n            }\n       }\n   For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/ReadWriteCapacityMode.html}Read/write capacity modes} in the {i Amazon Keyspaces Developer Guide}.\n   "]
type nonrec replica_specification_summary =
  {
  capacity_specification: capacity_specification_summary option ;
  status: table_status option ;
  region: string option }[@@ocaml.doc
                           "The Region-specific settings of a multi-Region table in the specified Amazon Web Services Region.\n\n If the multi-Region table is using provisioned capacity and has optional auto scaling policies configured, note that the Region specific summary returns both read and write capacity settings. But only Region specific read capacity settings can be configured for a multi-Region table. In a multi-Region table, your write capacity units will be synced across all Amazon Web Services Regions to ensure that there is enough capacity to replicate write events across Regions.\n "]
type nonrec replica_auto_scaling_specification =
  {
  auto_scaling_specification: auto_scaling_specification option ;
  region: string option }[@@ocaml.doc
                           "The auto scaling settings of a multi-Region table in the specified Amazon Web Services Region.\n"]
type nonrec point_in_time_recovery_summary =
  {
  earliest_restorable_timestamp: CoreTypes.Timestamp.t option ;
  status: point_in_time_recovery_status }[@@ocaml.doc
                                           "The point-in-time recovery status of the specified table.\n"]
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec list_tables_response =
  {
  tables: table_summary list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_tables_request =
  {
  keyspace_name: string ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec keyspace_summary =
  {
  replication_regions: string list option ;
  replication_strategy: rs ;
  resource_arn: string ;
  keyspace_name: string }[@@ocaml.doc
                           "Represents the properties of a keyspace.\n"]
type nonrec list_keyspaces_response =
  {
  keyspaces: keyspace_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_keyspaces_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec get_table_auto_scaling_settings_response =
  {
  replica_specifications: replica_auto_scaling_specification list option ;
  auto_scaling_specification: auto_scaling_specification option ;
  resource_arn: string ;
  table_name: string ;
  keyspace_name: string }[@@ocaml.doc ""]
type nonrec get_table_auto_scaling_settings_request =
  {
  table_name: string ;
  keyspace_name: string }[@@ocaml.doc ""]
type nonrec comment = {
  message: string }[@@ocaml.doc
                     "An optional comment that describes the table.\n"]
type nonrec get_table_response =
  {
  replica_specifications: replica_specification_summary list option ;
  client_side_timestamps: client_side_timestamps option ;
  comment: comment option ;
  default_time_to_live: int option ;
  ttl: time_to_live option ;
  point_in_time_recovery: point_in_time_recovery_summary option ;
  encryption_specification: encryption_specification option ;
  capacity_specification: capacity_specification_summary option ;
  schema_definition: schema_definition option ;
  status: table_status option ;
  creation_timestamp: CoreTypes.Timestamp.t option ;
  resource_arn: string ;
  table_name: string ;
  keyspace_name: string }[@@ocaml.doc ""]
type nonrec get_table_request = {
  table_name: string ;
  keyspace_name: string }[@@ocaml.doc ""]
type nonrec get_keyspace_response =
  {
  replication_regions: string list option ;
  replication_strategy: rs ;
  resource_arn: string ;
  keyspace_name: string }[@@ocaml.doc ""]
type nonrec get_keyspace_request = {
  keyspace_name: string }[@@ocaml.doc ""]
type nonrec delete_table_response = unit
type nonrec delete_table_request =
  {
  table_name: string ;
  keyspace_name: string }[@@ocaml.doc ""]
type nonrec delete_keyspace_response = unit
type nonrec delete_keyspace_request = {
  keyspace_name: string }[@@ocaml.doc ""]
type nonrec create_table_response = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec create_table_request =
  {
  replica_specifications: replica_specification list option ;
  auto_scaling_specification: auto_scaling_specification option ;
  client_side_timestamps: client_side_timestamps option ;
  tags: tag list option ;
  default_time_to_live: int option ;
  ttl: time_to_live option ;
  point_in_time_recovery: point_in_time_recovery option ;
  encryption_specification: encryption_specification option ;
  capacity_specification: capacity_specification option ;
  comment: comment option ;
  schema_definition: schema_definition ;
  table_name: string ;
  keyspace_name: string }[@@ocaml.doc ""]
type nonrec create_keyspace_response = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec create_keyspace_request =
  {
  replication_specification: replication_specification option ;
  tags: tag list option ;
  keyspace_name: string }[@@ocaml.doc ""](** {1:builders Builders} *)

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
val make_untag_resource_response : unit -> untag_resource_response
val make_tag : value:string -> key:string -> unit -> tag
val make_untag_resource_request :
  tags:tag list -> resource_arn:string -> unit -> untag_resource_request
val make_tag_resource_response : unit -> tag_resource_response
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
val make_delete_table_response : unit -> delete_table_response
val make_delete_table_request :
  table_name:string -> keyspace_name:string -> unit -> delete_table_request
val make_delete_keyspace_response : unit -> delete_keyspace_response
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

module CreateKeyspace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_keyspace_request ->
        (create_keyspace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** The [CreateKeyspace] operation adds a new keyspace to your account. In an Amazon Web Services account, keyspace names must be unique within each Region.

  [CreateKeyspace] is an asynchronous operation. You can monitor the creation status of the new keyspace by using the [GetKeyspace] operation.
 
  For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/working-with-keyspaces.html#keyspaces-create}Creating keyspaces} in the {i Amazon Keyspaces Developer Guide}.
   *)

  
end

module CreateTable : sig
  val request :
    Smaws_Lib.Context.t ->
      create_table_request ->
        (create_table_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** The [CreateTable] operation adds a new table to the specified keyspace. Within a keyspace, table names must be unique.

  [CreateTable] is an asynchronous operation. When the request is received, the status of the table is set to [CREATING]. You can monitor the creation status of the new table by using the [GetTable] operation, which returns the current [status] of the table. You can start using a table when the status is [ACTIVE].
 
  For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/working-with-tables.html#tables-create}Creating tables} in the {i Amazon Keyspaces Developer Guide}.
   *)

  
end

module DeleteKeyspace : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_keyspace_request ->
        (delete_keyspace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** The [DeleteKeyspace] operation deletes a keyspace and all of its tables. 
 *)

  
end

module DeleteTable : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_table_request ->
        (delete_table_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** The [DeleteTable] operation deletes a table and all of its data. After a [DeleteTable] request is received, the specified table is in the [DELETING] state until Amazon Keyspaces completes the deletion. If the table is in the [ACTIVE] state, you can delete it. If a table is either in the [CREATING] or [UPDATING] states, then Amazon Keyspaces returns a [ResourceInUseException]. If the specified table does not exist, Amazon Keyspaces returns a [ResourceNotFoundException]. If the table is already in the [DELETING] state, no error is returned.
 *)

  
end

module GetKeyspace : sig
  val request :
    Smaws_Lib.Context.t ->
      get_keyspace_request ->
        (get_keyspace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns the name and the Amazon Resource Name (ARN) of the specified table.
 *)

  
end

module GetTable : sig
  val request :
    Smaws_Lib.Context.t ->
      get_table_request ->
        (get_table_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns information about the table, including the table's name and current status, the keyspace name, configuration settings, and metadata.

 To read table metadata using [GetTable], [Select] action permissions for the table and system tables are required to complete the operation.
  *)

  
end

module GetTableAutoScalingSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      get_table_auto_scaling_settings_request ->
        (get_table_auto_scaling_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns auto scaling related settings of the specified table in JSON format. If the table is a multi-Region table, the Amazon Web Services Region specific auto scaling settings of the table are included.

 Amazon Keyspaces auto scaling helps you provision throughput capacity for variable workloads efficiently by increasing and decreasing your table's read and write capacity automatically in response to application traffic. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.
 
    [GetTableAutoScalingSettings] can't be used as an action in an IAM policy.
   
     To define permissions for [GetTableAutoScalingSettings], you must allow the following two actions in the IAM policy statement's [Action] element:
     
      {ul
            {-   [application-autoscaling:DescribeScalableTargets] 
                
                 }
            {-   [application-autoscaling:DescribeScalingPolicies] 
                
                 }
            }
   *)

  
end

module ListKeyspaces : sig
  val request :
    Smaws_Lib.Context.t ->
      list_keyspaces_request ->
        (list_keyspaces_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns a list of keyspaces.
 *)

  
end

module ListTables : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tables_request ->
        (list_tables_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns a list of tables for a specified keyspace.
 *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns a list of all tags associated with the specified Amazon Keyspaces resource.
 *)

  
end

module RestoreTable : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_table_request ->
        (restore_table_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Restores the table to the specified point in time within the [earliest_restorable_timestamp] and the current time. For more information about restore points, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_window} Time window for PITR continuous backups} in the {i Amazon Keyspaces Developer Guide}.

 Any number of users can execute up to 4 concurrent restores (any type of restore) in a given account.
 
  When you restore using point in time recovery, Amazon Keyspaces restores your source table's schema and data to the state based on the selected timestamp [(day:hour:minute:second)] to a new table. The Time to Live (TTL) settings are also restored to the state based on the selected timestamp.
  
   In addition to the table's schema, data, and TTL settings, [RestoreTable] restores the capacity mode, auto scaling settings, encryption settings, and point-in-time recovery settings from the source table. Unlike the table's schema data and TTL settings, which are restored based on the selected timestamp, these settings are always restored based on the table's settings as of the current time or when the table was deleted.
   
    You can also overwrite these settings during restore:
    
     {ul
           {-  Read/write capacity mode
               
                }
           {-  Provisioned throughput capacity units
               
                }
           {-  Auto scaling settings
               
                }
           {-  Point-in-time (PITR) settings
               
                }
           {-  Tags
               
                }
           }
   For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_settings}PITR restore settings} in the {i Amazon Keyspaces Developer Guide}.
   
    Note that the following settings are not restored, and you must configure them manually for the new table:
    
     {ul
           {-  Identity and Access Management (IAM) policies
               
                }
           {-  Amazon CloudWatch metrics and alarms
               
                }
           }
   *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Associates a set of tags with a Amazon Keyspaces resource. You can then activate these user-defined tags so that they appear on the Cost Management Console for cost allocation tracking. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.

 For IAM policy examples that show how to control access to Amazon Keyspaces resources based on tags, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/security_iam_id-based-policy-examples.html#security_iam_id-based-policy-examples-tags}Amazon Keyspaces resource access based on tags} in the {i Amazon Keyspaces Developer Guide}.
  *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Removes the association of tags from a Amazon Keyspaces resource.
 *)

  
end

module UpdateTable : sig
  val request :
    Smaws_Lib.Context.t ->
      update_table_request ->
        (update_table_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Adds new columns to the table or updates one of the table's settings, for example capacity mode, auto scaling, encryption, point-in-time recovery, or ttl settings. Note that you can only update one specific table setting per update operation.
 *)

  
end

