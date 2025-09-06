(** Keyspaces client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_update_table_response : resource_arn:ar_n -> unit -> update_table_response

val make_column_definition :
  type_:generic_string -> name:generic_string -> unit -> column_definition

val make_capacity_specification :
  ?write_capacity_units:capacity_units ->
  ?read_capacity_units:capacity_units ->
  throughput_mode:throughput_mode ->
  unit ->
  capacity_specification

val make_encryption_specification :
  ?kms_key_identifier:kms_key_ar_n -> type_:encryption_type -> unit -> encryption_specification

val make_point_in_time_recovery :
  status:point_in_time_recovery_status -> unit -> point_in_time_recovery

val make_time_to_live : status:time_to_live_status -> unit -> time_to_live

val make_client_side_timestamps :
  status:client_side_timestamps_status -> unit -> client_side_timestamps

val make_target_tracking_scaling_policy_configuration :
  ?scale_out_cooldown:integer_object ->
  ?scale_in_cooldown:integer_object ->
  ?disable_scale_in:boolean_object ->
  target_value:double_object ->
  unit ->
  target_tracking_scaling_policy_configuration

val make_auto_scaling_policy :
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration ->
  unit ->
  auto_scaling_policy

val make_auto_scaling_settings :
  ?scaling_policy:auto_scaling_policy ->
  ?maximum_units:capacity_units ->
  ?minimum_units:capacity_units ->
  ?auto_scaling_disabled:boolean_object ->
  unit ->
  auto_scaling_settings

val make_auto_scaling_specification :
  ?read_capacity_auto_scaling:auto_scaling_settings ->
  ?write_capacity_auto_scaling:auto_scaling_settings ->
  unit ->
  auto_scaling_specification

val make_replica_specification :
  ?read_capacity_auto_scaling:auto_scaling_settings ->
  ?read_capacity_units:capacity_units ->
  region:region ->
  unit ->
  replica_specification

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_cdc_specification :
  ?propagate_tags:cdc_propagate_tags ->
  ?tags:tag_list ->
  ?view_type:view_type ->
  status:cdc_status ->
  unit ->
  cdc_specification

val make_update_table_request :
  ?cdc_specification:cdc_specification ->
  ?replica_specifications:replica_specification_list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?client_side_timestamps:client_side_timestamps ->
  ?default_time_to_live:default_time_to_live ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification ->
  ?add_columns:column_definition_list ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  unit ->
  update_table_request

val make_update_keyspace_response : resource_arn:ar_n -> unit -> update_keyspace_response

val make_replication_specification :
  ?region_list:region_list -> replication_strategy:rs -> unit -> replication_specification

val make_update_keyspace_request :
  ?client_side_timestamps:client_side_timestamps ->
  replication_specification:replication_specification ->
  keyspace_name:keyspace_name ->
  unit ->
  update_keyspace_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tags:tag_list -> resource_arn:ar_n -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : tags:tag_list -> resource_arn:ar_n -> unit -> tag_resource_request

val make_table_summary :
  resource_arn:ar_n -> table_name:table_name -> keyspace_name:keyspace_name -> unit -> table_summary

val make_static_column : name:generic_string -> unit -> static_column
val make_partition_key : name:generic_string -> unit -> partition_key
val make_clustering_key : order_by:sort_order -> name:generic_string -> unit -> clustering_key

val make_schema_definition :
  ?static_columns:static_column_list ->
  ?clustering_keys:clustering_key_list ->
  partition_keys:partition_key_list ->
  all_columns:column_definition_list ->
  unit ->
  schema_definition

val make_restore_table_response : restored_table_ar_n:ar_n -> unit -> restore_table_response

val make_restore_table_request :
  ?replica_specifications:replica_specification_list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?tags_override:tag_list ->
  ?point_in_time_recovery_override:point_in_time_recovery ->
  ?encryption_specification_override:encryption_specification ->
  ?capacity_specification_override:capacity_specification ->
  ?restore_timestamp:timestamp ->
  target_table_name:table_name ->
  target_keyspace_name:keyspace_name ->
  source_table_name:table_name ->
  source_keyspace_name:keyspace_name ->
  unit ->
  restore_table_request

val make_replication_group_status :
  ?tables_replication_progress:tables_replication_progress ->
  keyspace_status:keyspace_status ->
  region:region ->
  unit ->
  replication_group_status

val make_capacity_specification_summary :
  ?last_update_to_pay_per_request_timestamp:timestamp ->
  ?write_capacity_units:capacity_units ->
  ?read_capacity_units:capacity_units ->
  throughput_mode:throughput_mode ->
  unit ->
  capacity_specification_summary

val make_replica_specification_summary :
  ?capacity_specification:capacity_specification_summary ->
  ?status:table_status ->
  ?region:region ->
  unit ->
  replica_specification_summary

val make_replica_auto_scaling_specification :
  ?auto_scaling_specification:auto_scaling_specification ->
  ?region:region ->
  unit ->
  replica_auto_scaling_specification

val make_point_in_time_recovery_summary :
  ?earliest_restorable_timestamp:timestamp ->
  status:point_in_time_recovery_status ->
  unit ->
  point_in_time_recovery_summary

val make_list_types_response :
  ?next_token:next_token -> types:type_name_list -> unit -> list_types_response

val make_list_types_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  keyspace_name:keyspace_name ->
  unit ->
  list_types_request

val make_list_tags_for_resource_response :
  ?tags:tag_list -> ?next_token:next_token -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  resource_arn:ar_n ->
  unit ->
  list_tags_for_resource_request

val make_list_tables_response :
  ?tables:table_summary_list -> ?next_token:next_token -> unit -> list_tables_response

val make_list_tables_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  keyspace_name:keyspace_name ->
  unit ->
  list_tables_request

val make_keyspace_summary :
  ?replication_regions:region_list ->
  replication_strategy:rs ->
  resource_arn:ar_n ->
  keyspace_name:keyspace_name ->
  unit ->
  keyspace_summary

val make_list_keyspaces_response :
  ?next_token:next_token -> keyspaces:keyspace_summary_list -> unit -> list_keyspaces_response

val make_list_keyspaces_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_keyspaces_request

val make_field_definition : type_:generic_string -> name:generic_string -> unit -> field_definition

val make_get_type_response :
  ?max_nesting_depth:depth ->
  ?direct_parent_types:type_name_list ->
  ?direct_referring_tables:table_name_list ->
  ?status:type_status ->
  ?last_modified_timestamp:timestamp ->
  ?field_definitions:field_list ->
  keyspace_arn:ar_n ->
  type_name:type_name ->
  keyspace_name:keyspace_name ->
  unit ->
  get_type_response

val make_get_type_request :
  type_name:type_name -> keyspace_name:keyspace_name -> unit -> get_type_request

val make_get_table_auto_scaling_settings_response :
  ?replica_specifications:replica_auto_scaling_specification_list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  resource_arn:ar_n ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  unit ->
  get_table_auto_scaling_settings_response

val make_get_table_auto_scaling_settings_request :
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  unit ->
  get_table_auto_scaling_settings_request

val make_comment : message:Smaws_Lib.Smithy_api.Types.string_ -> unit -> comment

val make_cdc_specification_summary :
  ?view_type:view_type -> status:cdc_status -> unit -> cdc_specification_summary

val make_get_table_response :
  ?cdc_specification:cdc_specification_summary ->
  ?latest_stream_arn:stream_arn ->
  ?replica_specifications:replica_specification_summary_list ->
  ?client_side_timestamps:client_side_timestamps ->
  ?comment:comment ->
  ?default_time_to_live:default_time_to_live ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery_summary ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification_summary ->
  ?schema_definition:schema_definition ->
  ?status:table_status ->
  ?creation_timestamp:timestamp ->
  resource_arn:ar_n ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  unit ->
  get_table_response

val make_get_table_request :
  table_name:table_name -> keyspace_name:keyspace_name -> unit -> get_table_request

val make_get_keyspace_response :
  ?replication_group_statuses:replication_group_status_list ->
  ?replication_regions:region_list ->
  replication_strategy:rs ->
  resource_arn:ar_n ->
  keyspace_name:keyspace_name ->
  unit ->
  get_keyspace_response

val make_get_keyspace_request : keyspace_name:keyspace_name -> unit -> get_keyspace_request

val make_delete_type_response :
  type_name:type_name -> keyspace_arn:ar_n -> unit -> delete_type_response

val make_delete_type_request :
  type_name:type_name -> keyspace_name:keyspace_name -> unit -> delete_type_request

val make_delete_table_response : unit -> unit

val make_delete_table_request :
  table_name:table_name -> keyspace_name:keyspace_name -> unit -> delete_table_request

val make_delete_keyspace_response : unit -> unit
val make_delete_keyspace_request : keyspace_name:keyspace_name -> unit -> delete_keyspace_request

val make_create_type_response :
  type_name:type_name -> keyspace_arn:ar_n -> unit -> create_type_response

val make_create_type_request :
  field_definitions:field_list ->
  type_name:type_name ->
  keyspace_name:keyspace_name ->
  unit ->
  create_type_request

val make_create_table_response : resource_arn:ar_n -> unit -> create_table_response

val make_create_table_request :
  ?cdc_specification:cdc_specification ->
  ?replica_specifications:replica_specification_list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?client_side_timestamps:client_side_timestamps ->
  ?tags:tag_list ->
  ?default_time_to_live:default_time_to_live ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification ->
  ?comment:comment ->
  schema_definition:schema_definition ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  unit ->
  create_table_request

val make_create_keyspace_response : resource_arn:ar_n -> unit -> create_keyspace_response

val make_create_keyspace_request :
  ?replication_specification:replication_specification ->
  ?tags:tag_list ->
  keyspace_name:keyspace_name ->
  unit ->
  create_keyspace_request
(** {1:operations Operations} *)

module CreateKeyspace : sig
  val request :
    Smaws_Lib.Context.t ->
    create_keyspace_request ->
    ( create_keyspace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "The [CreateKeyspace] operation adds a new keyspace to your account. In an Amazon Web Services \
   account, keyspace names must be unique within each Region.\n\n\
  \  [CreateKeyspace] is an asynchronous operation. You can monitor the creation status of the new \
   keyspace by using the [GetKeyspace] operation.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/getting-started.keyspaces.html}Create \
   a keyspace} in the {i Amazon Keyspaces Developer Guide}.\n\
  \  "]

module CreateTable : sig
  val request :
    Smaws_Lib.Context.t ->
    create_table_request ->
    ( create_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "The [CreateTable] operation adds a new table to the specified keyspace. Within a keyspace, \
   table names must be unique.\n\n\
  \  [CreateTable] is an asynchronous operation. When the request is received, the status of the \
   table is set to [CREATING]. You can monitor the creation status of the new table by using the \
   [GetTable] operation, which returns the current [status] of the table. You can start using a \
   table when the status is [ACTIVE].\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/getting-started.tables.html}Create a \
   table} in the {i Amazon Keyspaces Developer Guide}.\n\
  \  "]

module CreateType : sig
  val request :
    Smaws_Lib.Context.t ->
    create_type_request ->
    ( create_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  " The [CreateType] operation creates a new user-defined type in the specified keyspace. \n\n\
  \ To configure the required permissions, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/configure-udt-permissions.html#udt-permissions-create}Permissions \
   to create a UDT} in the {i Amazon Keyspaces Developer Guide}.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/udts.html}User-defined types (UDTs)} \
   in the {i Amazon Keyspaces Developer Guide}. \n\
  \  "]

module DeleteKeyspace : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_keyspace_request ->
    ( delete_keyspace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "The [DeleteKeyspace] operation deletes a keyspace and all of its tables. \n"]

module DeleteTable : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_table_request ->
    ( delete_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "The [DeleteTable] operation deletes a table and all of its data. After a [DeleteTable] request \
   is received, the specified table is in the [DELETING] state until Amazon Keyspaces completes \
   the deletion. If the table is in the [ACTIVE] state, you can delete it. If a table is either in \
   the [CREATING] or [UPDATING] states, then Amazon Keyspaces returns a [ResourceInUseException]. \
   If the specified table does not exist, Amazon Keyspaces returns a [ResourceNotFoundException]. \
   If the table is already in the [DELETING] state, no error is returned.\n"]

module DeleteType : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_type_request ->
    ( delete_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  " The [DeleteType] operation deletes a user-defined type (UDT). You can only delete a type that \
   is not used in a table or another UDT. \n\n\
  \ To configure the required permissions, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/configure-udt-permissions.html#udt-permissions-drop}Permissions \
   to delete a UDT} in the {i Amazon Keyspaces Developer Guide}.\n\
  \ "]

module GetKeyspace : sig
  val request :
    Smaws_Lib.Context.t ->
    get_keyspace_request ->
    ( get_keyspace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns the name of the specified keyspace, the Amazon Resource Name (ARN), the replication \
   strategy, the Amazon Web Services Regions of a multi-Region keyspace, and the status of newly \
   added Regions after an [UpdateKeyspace] operation.\n"]

module GetTable : sig
  val request :
    Smaws_Lib.Context.t ->
    get_table_request ->
    ( get_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns information about the table, including the table's name and current status, the \
   keyspace name, configuration settings, and metadata.\n\n\
  \ To read table metadata using [GetTable], the IAM principal needs [Select] action permissions \
   for the table and the system keyspace.\n\
  \ "]

module GetTableAutoScalingSettings : sig
  val request :
    Smaws_Lib.Context.t ->
    get_table_auto_scaling_settings_request ->
    ( get_table_auto_scaling_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns auto scaling related settings of the specified table in JSON format. If the table is a \
   multi-Region table, the Amazon Web Services Region specific auto scaling settings of the table \
   are included.\n\n\
  \ Amazon Keyspaces auto scaling helps you provision throughput capacity for variable workloads \
   efficiently by increasing and decreasing your table's read and write capacity automatically in \
   response to application traffic. For more information, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/autoscaling.html}Managing throughput \
   capacity automatically with Amazon Keyspaces auto scaling} in the {i Amazon Keyspaces Developer \
   Guide}.\n\
  \ \n\
  \    [GetTableAutoScalingSettings] can't be used as an action in an IAM policy.\n\
  \   \n\
  \     To define permissions for [GetTableAutoScalingSettings], you must allow the following two \
   actions in the IAM policy statement's [Action] element:\n\
  \     \n\
  \      {ul\n\
  \            {-   [application-autoscaling:DescribeScalableTargets] \n\
  \                \n\
  \                 }\n\
  \            {-   [application-autoscaling:DescribeScalingPolicies] \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \  "]

module GetType : sig
  val request :
    Smaws_Lib.Context.t ->
    get_type_request ->
    ( get_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  " The [GetType] operation returns information about the type, for example the field definitions, \
   the timestamp when the type was last modified, the level of nesting, the status, and details \
   about if the type is used in other types and tables. \n\n\
  \ To read keyspace metadata using [GetType], the IAM principal needs [Select] action permissions \
   for the system keyspace. To configure the required permissions, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/configure-udt-permissions.html#udt-permissions-view}Permissions \
   to view a UDT} in the {i Amazon Keyspaces Developer Guide}.\n\
  \ "]

module ListKeyspaces : sig
  val request :
    Smaws_Lib.Context.t ->
    list_keyspaces_request ->
    ( list_keyspaces_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "The [ListKeyspaces] operation returns a list of keyspaces.\n"]

module ListTables : sig
  val request :
    Smaws_Lib.Context.t ->
    list_tables_request ->
    ( list_tables_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "The [ListTables] operation returns a list of tables for a specified keyspace.\n\n\
  \ To read keyspace metadata using [ListTables], the IAM principal needs [Select] action \
   permissions for the system keyspace.\n\
  \ "]

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of all tags associated with the specified Amazon Keyspaces resource.\n\n\
  \ To read keyspace metadata using [ListTagsForResource], the IAM principal needs [Select] action \
   permissions for the specified resource and the system keyspace.\n\
  \ "]

module ListTypes : sig
  val request :
    Smaws_Lib.Context.t ->
    list_types_request ->
    ( list_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  " The [ListTypes] operation returns a list of types for a specified keyspace. \n\n\
  \ To read keyspace metadata using [ListTypes], the IAM principal needs [Select] action \
   permissions for the system keyspace. To configure the required permissions, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/configure-udt-permissions.html#udt-permissions-view}Permissions \
   to view a UDT} in the {i Amazon Keyspaces Developer Guide}.\n\
  \ "]

module RestoreTable : sig
  val request :
    Smaws_Lib.Context.t ->
    restore_table_request ->
    ( restore_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Restores the table to the specified point in time within the [earliest_restorable_timestamp] \
   and the current time. For more information about restore points, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_window} \
   Time window for PITR continuous backups} in the {i Amazon Keyspaces Developer Guide}.\n\n\
  \ Any number of users can execute up to 4 concurrent restores (any type of restore) in a given \
   account.\n\
  \ \n\
  \  When you restore using point in time recovery, Amazon Keyspaces restores your source table's \
   schema and data to the state based on the selected timestamp [(day:hour:minute:second)] to a \
   new table. The Time to Live (TTL) settings are also restored to the state based on the selected \
   timestamp.\n\
  \  \n\
  \   In addition to the table's schema, data, and TTL settings, [RestoreTable] restores the \
   capacity mode, auto scaling settings, encryption settings, and point-in-time recovery settings \
   from the source table. Unlike the table's schema data and TTL settings, which are restored \
   based on the selected timestamp, these settings are always restored based on the table's \
   settings as of the current time or when the table was deleted.\n\
  \   \n\
  \    You can also overwrite these settings during restore:\n\
  \    \n\
  \     {ul\n\
  \           {-  Read/write capacity mode\n\
  \               \n\
  \                }\n\
  \           {-  Provisioned throughput capacity units\n\
  \               \n\
  \                }\n\
  \           {-  Auto scaling settings\n\
  \               \n\
  \                }\n\
  \           {-  Point-in-time (PITR) settings\n\
  \               \n\
  \                }\n\
  \           {-  Tags\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/PointInTimeRecovery_HowItWorks.html#howitworks_backup_settings}PITR \
   restore settings} in the {i Amazon Keyspaces Developer Guide}.\n\
  \   \n\
  \    Note that the following settings are not restored, and you must configure them manually for \
   the new table:\n\
  \    \n\
  \     {ul\n\
  \           {-  Identity and Access Management (IAM) policies\n\
  \               \n\
  \                }\n\
  \           {-  Amazon CloudWatch metrics and alarms\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Associates a set of tags with a Amazon Keyspaces resource. You can then activate these \
   user-defined tags so that they appear on the Cost Management Console for cost allocation \
   tracking. For more information, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/tagging-keyspaces.html}Adding tags and \
   labels to Amazon Keyspaces resources} in the {i Amazon Keyspaces Developer Guide}.\n\n\
  \ For IAM policy examples that show how to control access to Amazon Keyspaces resources based on \
   tags, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/security_iam_id-based-policy-examples.html#security_iam_id-based-policy-examples-tags}Amazon \
   Keyspaces resource access based on tags} in the {i Amazon Keyspaces Developer Guide}.\n\
  \ "]

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Removes the association of tags from a Amazon Keyspaces resource.\n"]

module UpdateKeyspace : sig
  val request :
    Smaws_Lib.Context.t ->
    update_keyspace_request ->
    ( update_keyspace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  " Adds a new Amazon Web Services Region to the keyspace. You can add a new Region to a keyspace \
   that is either a single or a multi-Region keyspace. Amazon Keyspaces is going to replicate all \
   tables in the keyspace to the new Region. To successfully replicate all tables to the new \
   Region, they must use client-side timestamps for conflict resolution. To enable client-side \
   timestamps, specify [clientSideTimestamps.status = enabled] when invoking the API. For more \
   information about client-side timestamps, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/client-side-timestamps.html}Client-side \
   timestamps in Amazon Keyspaces} in the {i Amazon Keyspaces Developer Guide}.\n\n\
  \ To add a Region to a keyspace using the [UpdateKeyspace] API, the IAM principal needs \
   permissions for the following IAM actions:\n\
  \ \n\
  \  {ul\n\
  \        {-   [cassandra:Alter] \n\
  \            \n\
  \             }\n\
  \        {-   [cassandra:AlterMultiRegionResource] \n\
  \            \n\
  \             }\n\
  \        {-   [cassandra:Create] \n\
  \            \n\
  \             }\n\
  \        {-   [cassandra:CreateMultiRegionResource] \n\
  \            \n\
  \             }\n\
  \        {-   [cassandra:Select] \n\
  \            \n\
  \             }\n\
  \        {-   [cassandra:SelectMultiRegionResource] \n\
  \            \n\
  \             }\n\
  \        {-   [cassandra:Modify] \n\
  \            \n\
  \             }\n\
  \        {-   [cassandra:ModifyMultiRegionResource] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   If the keyspace contains a table that is configured in provisioned mode with auto scaling \
   enabled, the following additional IAM actions need to be allowed.\n\
  \   \n\
  \    {ul\n\
  \          {-   [application-autoscaling:RegisterScalableTarget] \n\
  \              \n\
  \               }\n\
  \          {-   [application-autoscaling:DeregisterScalableTarget] \n\
  \              \n\
  \               }\n\
  \          {-   [application-autoscaling:DescribeScalableTargets] \n\
  \              \n\
  \               }\n\
  \          {-   [application-autoscaling:PutScalingPolicy] \n\
  \              \n\
  \               }\n\
  \          {-   [application-autoscaling:DescribeScalingPolicies] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   To use the [UpdateKeyspace] API, the IAM principal also needs permissions to create a \
   service-linked role with the following elements:\n\
  \   \n\
  \    {ul\n\
  \          {-   [iam:CreateServiceLinkedRole] - The {b action} the principal can perform.\n\
  \              \n\
  \               }\n\
  \          {-   \
   [arn:aws:iam::*:role/aws-service-role/replication.cassandra.amazonaws.com/AWSServiceRoleForKeyspacesReplication] \
   - The {b resource} that the action can be performed on. \n\
  \              \n\
  \               }\n\
  \          {-   [iam:AWSServiceName: replication.cassandra.amazonaws.com] - The only Amazon Web \
   Services service that this role can be attached to is Amazon Keyspaces.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/keyspaces/latest/devguide/howitworks_replication_permissions_addReplica.html}Configure \
   the IAM permissions required to add an Amazon Web Services Region to a keyspace} in the {i \
   Amazon Keyspaces Developer Guide}.\n\
  \   "]

(** {1:Serialization and Deserialization} *)
module UpdateTable : sig
  val request :
    Smaws_Lib.Context.t ->
    update_table_request ->
    ( update_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Adds new columns to the table or updates one of the table's settings, for example capacity \
   mode, auto scaling, encryption, point-in-time recovery, or ttl settings. Note that you can only \
   update one specific table setting per update operation.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
