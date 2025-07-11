open Types
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