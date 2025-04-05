(** 
    Keyspaces client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec rs =
  | SINGLE_REGION 
  | MULTI_REGION 
type nonrec validation_exception = {
  message: string option }
type nonrec update_table_response = {
  resource_arn: string }
type nonrec column_definition = {
  type_: string ;
  name: string }
type nonrec throughput_mode =
  | PAY_PER_REQUEST 
  | PROVISIONED 
type nonrec capacity_specification =
  {
  write_capacity_units: int option ;
  read_capacity_units: int option ;
  throughput_mode: throughput_mode }
type nonrec encryption_type =
  | CUSTOMER_MANAGED_KMS_KEY 
  | AWS_OWNED_KMS_KEY 
type nonrec encryption_specification =
  {
  kms_key_identifier: string option ;
  type_: encryption_type }
type nonrec point_in_time_recovery_status =
  | ENABLED 
  | DISABLED 
type nonrec point_in_time_recovery = {
  status: point_in_time_recovery_status }
type nonrec time_to_live_status =
  | ENABLED 
type nonrec time_to_live = {
  status: time_to_live_status }
type nonrec client_side_timestamps_status =
  | ENABLED 
type nonrec client_side_timestamps = {
  status: client_side_timestamps_status }
type nonrec target_tracking_scaling_policy_configuration =
  {
  target_value: float ;
  scale_out_cooldown: int option ;
  scale_in_cooldown: int option ;
  disable_scale_in: bool option }
type nonrec auto_scaling_policy =
  {
  target_tracking_scaling_policy_configuration:
    target_tracking_scaling_policy_configuration option }
type nonrec auto_scaling_settings =
  {
  scaling_policy: auto_scaling_policy option ;
  maximum_units: int option ;
  minimum_units: int option ;
  auto_scaling_disabled: bool option }
type nonrec auto_scaling_specification =
  {
  read_capacity_auto_scaling: auto_scaling_settings option ;
  write_capacity_auto_scaling: auto_scaling_settings option }
type nonrec replica_specification =
  {
  read_capacity_auto_scaling: auto_scaling_settings option ;
  read_capacity_units: int option ;
  region: string }
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
  keyspace_name: string }
type nonrec service_quota_exceeded_exception = {
  message: string option }
type nonrec resource_not_found_exception =
  {
  resource_arn: string option ;
  message: string option }
type nonrec internal_server_exception = {
  message: string option }
type nonrec conflict_exception = {
  message: string option }
type nonrec access_denied_exception = {
  message: string option }
type nonrec untag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }
type nonrec untag_resource_request = {
  tags: tag list ;
  resource_arn: string }
type nonrec tag_resource_response = unit
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_arn: string }
type nonrec table_summary =
  {
  resource_arn: string ;
  table_name: string ;
  keyspace_name: string }
type nonrec table_status =
  | ACTIVE 
  | CREATING 
  | UPDATING 
  | DELETING 
  | DELETED 
  | RESTORING 
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS 
type nonrec static_column = {
  name: string }
type nonrec sort_order =
  | ASC 
  | DESC 
type nonrec partition_key = {
  name: string }
type nonrec clustering_key = {
  order_by: sort_order ;
  name: string }
type nonrec schema_definition =
  {
  static_columns: static_column list option ;
  clustering_keys: clustering_key list option ;
  partition_keys: partition_key list ;
  all_columns: column_definition list }
type nonrec restore_table_response = {
  restored_table_ar_n: string }
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
  source_keyspace_name: string }
type nonrec replication_specification =
  {
  region_list: string list option ;
  replication_strategy: rs }
type nonrec capacity_specification_summary =
  {
  last_update_to_pay_per_request_timestamp: CoreTypes.Timestamp.t option ;
  write_capacity_units: int option ;
  read_capacity_units: int option ;
  throughput_mode: throughput_mode }
type nonrec replica_specification_summary =
  {
  capacity_specification: capacity_specification_summary option ;
  status: table_status option ;
  region: string option }
type nonrec replica_auto_scaling_specification =
  {
  auto_scaling_specification: auto_scaling_specification option ;
  region: string option }
type nonrec point_in_time_recovery_summary =
  {
  earliest_restorable_timestamp: CoreTypes.Timestamp.t option ;
  status: point_in_time_recovery_status }
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option ;
  next_token: string option }
type nonrec list_tags_for_resource_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource_arn: string }
type nonrec list_tables_response =
  {
  tables: table_summary list option ;
  next_token: string option }
type nonrec list_tables_request =
  {
  keyspace_name: string ;
  max_results: int option ;
  next_token: string option }
type nonrec keyspace_summary =
  {
  replication_regions: string list option ;
  replication_strategy: rs ;
  resource_arn: string ;
  keyspace_name: string }
type nonrec list_keyspaces_response =
  {
  keyspaces: keyspace_summary list ;
  next_token: string option }
type nonrec list_keyspaces_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec get_table_auto_scaling_settings_response =
  {
  replica_specifications: replica_auto_scaling_specification list option ;
  auto_scaling_specification: auto_scaling_specification option ;
  resource_arn: string ;
  table_name: string ;
  keyspace_name: string }
type nonrec get_table_auto_scaling_settings_request =
  {
  table_name: string ;
  keyspace_name: string }
type nonrec comment = {
  message: string }
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
  keyspace_name: string }
type nonrec get_table_request = {
  table_name: string ;
  keyspace_name: string }
type nonrec get_keyspace_response =
  {
  replication_regions: string list option ;
  replication_strategy: rs ;
  resource_arn: string ;
  keyspace_name: string }
type nonrec get_keyspace_request = {
  keyspace_name: string }
type nonrec delete_table_response = unit
type nonrec delete_table_request =
  {
  table_name: string ;
  keyspace_name: string }
type nonrec delete_keyspace_response = unit
type nonrec delete_keyspace_request = {
  keyspace_name: string }
type nonrec create_table_response = {
  resource_arn: string }
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
  keyspace_name: string }
type nonrec create_keyspace_response = {
  resource_arn: string }
type nonrec create_keyspace_request =
  {
  replication_specification: replication_specification option ;
  tags: tag list option ;
  keyspace_name: string }(** {1:builders Builders} *)

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
  (** 
    The [CreateKeyspace] operation adds a new keyspace to your account. In an Amazon Web Services account, keyspace names must be unique within each Region.
    
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
  (** 
    The [CreateTable] operation adds a new table to the specified keyspace. Within a keyspace, table names must be unique.
    
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
  (** 
    The [DeleteKeyspace] operation deletes a keyspace and all of its tables.
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
  (** 
    The [DeleteTable] operation deletes a table and all of its data. After a [DeleteTable] request is received, the specified table is in the [DELETING] state until Amazon Keyspaces completes the deletion. If the table is in the [ACTIVE] state, you can delete it. If a table is either in the [CREATING] or [UPDATING] states, then Amazon Keyspaces returns a [ResourceInUseException]. If the specified table does not exist, Amazon Keyspaces returns a [ResourceNotFoundException]. If the table is already in the [DELETING] state, no error is returned.
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
  (** 
    Returns the name and the Amazon Resource Name (ARN) of the specified table.
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
  (** 
    Returns information about the table, including the table's name and current status, the keyspace name, configuration settings, and metadata.
    
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
  (** 
    Returns auto scaling related settings of the specified table in JSON format. If the table is a multi-Region table, the Amazon Web Services Region specific auto scaling settings of the table are included.
    
     Amazon Keyspaces auto scaling helps you provision throughput capacity for variable workloads efficiently by increasing and decreasing your table's read and write capacity automatically in response to application traffic. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer Guide}.
     
      [GetTableAutoScalingSettings] can't be used as an action in an IAM policy.
      
       To define permissions for [GetTableAutoScalingSettings], you must allow the following two actions in the IAM policy statement's [Action] element:
       
        {ul
             {- [application-autoscaling:DescribeScalableTargets]
                
                }
              {- [application-autoscaling:DescribeScalingPolicies]
                 
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
  (** 
    Returns a list of keyspaces.
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
  (** 
    Returns a list of tables for a specified keyspace.
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
  (** 
    Returns a list of all tags associated with the specified Amazon Keyspaces resource.
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
  (** 
    Restores the table to the specified point in time within the [earliest_restorable_timestamp] and the current time. For more information about restore points, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_window}Time window for PITR continuous backups} in the {i Amazon Keyspaces Developer Guide}.
    
     Any number of users can execute up to 4 concurrent restores (any type of restore) in a given account.
     
      When you restore using point in time recovery, Amazon Keyspaces restores your source table's schema and data to the state based on the selected timestamp [(day:hour:minute:second)] to a new table. The Time to Live (TTL) settings are also restored to the state based on the selected timestamp.
      
       In addition to the table's schema, data, and TTL settings, [RestoreTable] restores the capacity mode, auto scaling settings, encryption settings, and point-in-time recovery settings from the source table. Unlike the table's schema data and TTL settings, which are restored based on the selected timestamp, these settings are always restored based on the table's settings as of the current time or when the table was deleted.
       
        You can also overwrite these settings during restore:
        
         {ul
              {- Read/write capacity mode
                 
                 }
               {- Provisioned throughput capacity units
                  
                  }
               {- Auto scaling settings
                  
                  }
               {- Point-in-time (PITR) settings
                  
                  }
               {- Tags
                  
                  }
              
      }
       For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_settings}PITR restore settings} in the {i Amazon Keyspaces Developer Guide}.
       
        Note that the following settings are not restored, and you must configure them manually for the new table:
        
         {ul
              {- Identity and Access Management (IAM) policies
                 
                 }
               {- Amazon CloudWatch metrics and alarms
                  
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
  (** 
    Associates a set of tags with a Amazon Keyspaces resource. You can then activate these user-defined tags so that they appear on the Cost Management Console for cost allocation tracking. For more information, see {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.
    
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
  (** 
    Removes the association of tags from a Amazon Keyspaces resource.
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
  (** 
    Adds new columns to the table or updates one of the table's settings, for example capacity mode, auto scaling, encryption, point-in-time recovery, or ttl settings. Note that you can only update one specific table setting per update operation.
     *)

  
end

