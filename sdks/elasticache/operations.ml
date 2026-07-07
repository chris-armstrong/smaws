open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module AddTagsToResource = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `CacheSecurityGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupNotFoundFault"
    | `CacheSubnetGroupNotFoundFault _ -> "com.amazonaws.elasticache#CacheSubnetGroupNotFoundFault"
    | `InvalidARNFault _ -> "com.amazonaws.elasticache#InvalidARNFault"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `InvalidServerlessCacheSnapshotStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheSnapshotStateFault"
    | `InvalidServerlessCacheStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheStateFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | `ReservedCacheNodeNotFoundFault _ ->
        "com.amazonaws.elasticache#ReservedCacheNodeNotFoundFault"
    | `ServerlessCacheNotFoundFault _ -> "com.amazonaws.elasticache#ServerlessCacheNotFoundFault"
    | `ServerlessCacheSnapshotNotFoundFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotNotFoundFault"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.elasticache#SnapshotNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | `UserGroupNotFoundFault _ -> "com.amazonaws.elasticache#UserGroupNotFoundFault"
    | `UserNotFoundFault _ -> "com.amazonaws.elasticache#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidARN" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_arn_fault_of_xml
        with
        | Ok s -> `InvalidARNFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedCacheNodeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_cache_node_not_found_fault_of_xml
        with
        | Ok s -> `ReservedCacheNodeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_not_found_fault_of_xml
        with
        | Ok s -> `UserGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_not_found_fault_of_xml
        with
        | Ok s -> `UserNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_tags_to_resource_message) =
    let fields = add_tags_to_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddTagsToResource"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:tag_list_message_of_xml ~error_deserializer

  let request_with_metadata context (request : add_tags_to_resource_message) =
    let fields = add_tags_to_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddTagsToResource"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:tag_list_message_of_xml ~error_deserializer
end

module AuthorizeCacheSecurityGroupIngress = struct
  let error_to_string = function
    | `AuthorizationAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#AuthorizationAlreadyExistsFault"
    | `CacheSecurityGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupNotFoundFault"
    | `InvalidCacheSecurityGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidCacheSecurityGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_already_exists_fault_of_xml
        with
        | Ok s -> `AuthorizationAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : authorize_cache_security_group_ingress_message) =
    let fields = authorize_cache_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AuthorizeCacheSecurityGroupIngress"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:authorize_cache_security_group_ingress_result_of_xml ~error_deserializer

  let request_with_metadata context (request : authorize_cache_security_group_ingress_message) =
    let fields = authorize_cache_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AuthorizeCacheSecurityGroupIngress"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:authorize_cache_security_group_ingress_result_of_xml ~error_deserializer
end

module BatchApplyUpdateAction = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ServiceUpdateNotFoundFault _ -> "com.amazonaws.elasticache#ServiceUpdateNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceUpdateNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_update_not_found_fault_of_xml
        with
        | Ok s -> `ServiceUpdateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : batch_apply_update_action_message) =
    let fields = batch_apply_update_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"BatchApplyUpdateAction"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:update_action_results_message_of_xml ~error_deserializer

  let request_with_metadata context (request : batch_apply_update_action_message) =
    let fields = batch_apply_update_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"BatchApplyUpdateAction"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:update_action_results_message_of_xml ~error_deserializer
end

module BatchStopUpdateAction = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ServiceUpdateNotFoundFault _ -> "com.amazonaws.elasticache#ServiceUpdateNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceUpdateNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_update_not_found_fault_of_xml
        with
        | Ok s -> `ServiceUpdateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : batch_stop_update_action_message) =
    let fields = batch_stop_update_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"BatchStopUpdateAction"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:update_action_results_message_of_xml ~error_deserializer

  let request_with_metadata context (request : batch_stop_update_action_message) =
    let fields = batch_stop_update_action_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"BatchStopUpdateAction"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:update_action_results_message_of_xml ~error_deserializer
end

module CompleteMigration = struct
  let error_to_string = function
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | `ReplicationGroupNotUnderMigrationFault _ ->
        "com.amazonaws.elasticache#ReplicationGroupNotUnderMigrationFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotUnderMigrationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_under_migration_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotUnderMigrationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : complete_migration_message) =
    let fields = complete_migration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CompleteMigration"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:complete_migration_response_of_xml ~error_deserializer

  let request_with_metadata context (request : complete_migration_message) =
    let fields = complete_migration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CompleteMigration"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:complete_migration_response_of_xml ~error_deserializer
end

module CopyServerlessCacheSnapshot = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidServerlessCacheSnapshotStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheSnapshotStateFault"
    | `ServerlessCacheSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotAlreadyExistsFault"
    | `ServerlessCacheSnapshotNotFoundFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotNotFoundFault"
    | `ServerlessCacheSnapshotQuotaExceededFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotQuotaExceededFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : copy_serverless_cache_snapshot_request) =
    let fields = copy_serverless_cache_snapshot_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CopyServerlessCacheSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:copy_serverless_cache_snapshot_response_of_xml ~error_deserializer

  let request_with_metadata context (request : copy_serverless_cache_snapshot_request) =
    let fields = copy_serverless_cache_snapshot_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CopyServerlessCacheSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:copy_serverless_cache_snapshot_response_of_xml ~error_deserializer
end

module CopySnapshot = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidSnapshotStateFault _ -> "com.amazonaws.elasticache#InvalidSnapshotStateFault"
    | `SnapshotAlreadyExistsFault _ -> "com.amazonaws.elasticache#SnapshotAlreadyExistsFault"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.elasticache#SnapshotNotFoundFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.elasticache#SnapshotQuotaExceededFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `SnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : copy_snapshot_message) =
    let fields = copy_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CopySnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:copy_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : copy_snapshot_message) =
    let fields = copy_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CopySnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:copy_snapshot_result_of_xml ~error_deserializer
end

module CreateCacheCluster = struct
  let error_to_string = function
    | `CacheClusterAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#CacheClusterAlreadyExistsFault"
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `CacheSecurityGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupNotFoundFault"
    | `CacheSubnetGroupNotFoundFault _ -> "com.amazonaws.elasticache#CacheSubnetGroupNotFoundFault"
    | `ClusterQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#ClusterQuotaForCustomerExceededFault"
    | `InsufficientCacheClusterCapacityFault _ ->
        "com.amazonaws.elasticache#InsufficientCacheClusterCapacityFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.elasticache#InvalidVPCNetworkStateFault"
    | `NodeQuotaForClusterExceededFault _ ->
        "com.amazonaws.elasticache#NodeQuotaForClusterExceededFault"
    | `NodeQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#NodeQuotaForCustomerExceededFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_already_exists_fault_of_xml
        with
        | Ok s -> `CacheClusterAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterQuotaForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientCacheClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cache_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientCacheClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeQuotaForClusterExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_quota_for_cluster_exceeded_fault_of_xml
        with
        | Ok s -> `NodeQuotaForClusterExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeQuotaForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `NodeQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_cache_cluster_message) =
    let fields = create_cache_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateCacheCluster"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_cache_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_cache_cluster_message) =
    let fields = create_cache_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateCacheCluster"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_cache_cluster_result_of_xml ~error_deserializer
end

module CreateCacheParameterGroup = struct
  let error_to_string = function
    | `CacheParameterGroupAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupAlreadyExistsFault"
    | `CacheParameterGroupQuotaExceededFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupQuotaExceededFault"
    | `InvalidCacheParameterGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidCacheParameterGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheParameterGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_already_exists_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheParameterGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_cache_parameter_group_message) =
    let fields = create_cache_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateCacheParameterGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_cache_parameter_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_cache_parameter_group_message) =
    let fields = create_cache_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateCacheParameterGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_cache_parameter_group_result_of_xml ~error_deserializer
end

module CreateCacheSecurityGroup = struct
  let error_to_string = function
    | `CacheSecurityGroupAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupAlreadyExistsFault"
    | `CacheSecurityGroupQuotaExceededFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupQuotaExceededFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheSecurityGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_already_exists_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "QuotaExceeded.CacheSecurityGroup" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_cache_security_group_message) =
    let fields = create_cache_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateCacheSecurityGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_cache_security_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_cache_security_group_message) =
    let fields = create_cache_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateCacheSecurityGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_cache_security_group_result_of_xml ~error_deserializer
end

module CreateCacheSubnetGroup = struct
  let error_to_string = function
    | `CacheSubnetGroupAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#CacheSubnetGroupAlreadyExistsFault"
    | `CacheSubnetGroupQuotaExceededFault _ ->
        "com.amazonaws.elasticache#CacheSubnetGroupQuotaExceededFault"
    | `CacheSubnetQuotaExceededFault _ -> "com.amazonaws.elasticache#CacheSubnetQuotaExceededFault"
    | `InvalidSubnet _ -> "com.amazonaws.elasticache#InvalidSubnet"
    | `SubnetNotAllowedFault _ -> "com.amazonaws.elasticache#SubnetNotAllowedFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheSubnetGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_group_already_exists_fault_of_xml
        with
        | Ok s -> `CacheSubnetGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSubnetGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `CacheSubnetGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSubnetQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_quota_exceeded_fault_of_xml
        with
        | Ok s -> `CacheSubnetQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubnetNotAllowedFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subnet_not_allowed_fault_of_xml
        with
        | Ok s -> `SubnetNotAllowedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_cache_subnet_group_message) =
    let fields = create_cache_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateCacheSubnetGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_cache_subnet_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_cache_subnet_group_message) =
    let fields = create_cache_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateCacheSubnetGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_cache_subnet_group_result_of_xml ~error_deserializer
end

module CreateGlobalReplicationGroup = struct
  let error_to_string = function
    | `GlobalReplicationGroupAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#GlobalReplicationGroupAlreadyExistsFault"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalReplicationGroupAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_replication_group_already_exists_fault_of_xml
        with
        | Ok s -> `GlobalReplicationGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_global_replication_group_message) =
    let fields = create_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_global_replication_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_global_replication_group_message) =
    let fields = create_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_global_replication_group_result_of_xml ~error_deserializer
end

module CreateReplicationGroup = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `CacheSecurityGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupNotFoundFault"
    | `CacheSubnetGroupNotFoundFault _ -> "com.amazonaws.elasticache#CacheSubnetGroupNotFoundFault"
    | `ClusterQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#ClusterQuotaForCustomerExceededFault"
    | `GlobalReplicationGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#GlobalReplicationGroupNotFoundFault"
    | `InsufficientCacheClusterCapacityFault _ ->
        "com.amazonaws.elasticache#InsufficientCacheClusterCapacityFault"
    | `InvalidCacheClusterStateFault _ -> "com.amazonaws.elasticache#InvalidCacheClusterStateFault"
    | `InvalidGlobalReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidGlobalReplicationGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidUserGroupStateFault _ -> "com.amazonaws.elasticache#InvalidUserGroupStateFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.elasticache#InvalidVPCNetworkStateFault"
    | `NodeGroupsPerReplicationGroupQuotaExceededFault _ ->
        "com.amazonaws.elasticache#NodeGroupsPerReplicationGroupQuotaExceededFault"
    | `NodeQuotaForClusterExceededFault _ ->
        "com.amazonaws.elasticache#NodeQuotaForClusterExceededFault"
    | `NodeQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#NodeQuotaForCustomerExceededFault"
    | `ReplicationGroupAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#ReplicationGroupAlreadyExistsFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | `UserGroupNotFoundFault _ -> "com.amazonaws.elasticache#UserGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ClusterQuotaForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "GlobalReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_replication_group_not_found_fault_of_xml
        with
        | Ok s -> `GlobalReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientCacheClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cache_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientCacheClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidUserGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_user_group_state_fault_of_xml
        with
        | Ok s -> `InvalidUserGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeGroupsPerReplicationGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_groups_per_replication_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `NodeGroupsPerReplicationGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeQuotaForClusterExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_quota_for_cluster_exceeded_fault_of_xml
        with
        | Ok s -> `NodeQuotaForClusterExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeQuotaForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `NodeQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_already_exists_fault_of_xml
        with
        | Ok s -> `ReplicationGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_not_found_fault_of_xml
        with
        | Ok s -> `UserGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_replication_group_message) =
    let fields = create_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_replication_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_replication_group_message) =
    let fields = create_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_replication_group_result_of_xml ~error_deserializer
end

module CreateServerlessCache = struct
  let error_to_string = function
    | `InvalidCredentialsException _ -> "com.amazonaws.elasticache#InvalidCredentialsException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidServerlessCacheStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheStateFault"
    | `InvalidUserGroupStateFault _ -> "com.amazonaws.elasticache#InvalidUserGroupStateFault"
    | `ServerlessCacheAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheAlreadyExistsFault"
    | `ServerlessCacheNotFoundFault _ -> "com.amazonaws.elasticache#ServerlessCacheNotFoundFault"
    | `ServerlessCacheQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheQuotaForCustomerExceededFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | `UserGroupNotFoundFault _ -> "com.amazonaws.elasticache#UserGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidCredentialsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_credentials_exception_of_xml
        with
        | Ok s -> `InvalidCredentialsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidUserGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_user_group_state_fault_of_xml
        with
        | Ok s -> `InvalidUserGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_already_exists_fault_of_xml
        with
        | Ok s -> `ServerlessCacheAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheQuotaForCustomerExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `ServerlessCacheQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_not_found_fault_of_xml
        with
        | Ok s -> `UserGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_serverless_cache_request) =
    let fields = create_serverless_cache_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateServerlessCache"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_serverless_cache_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_serverless_cache_request) =
    let fields = create_serverless_cache_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateServerlessCache"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_serverless_cache_response_of_xml ~error_deserializer
end

module CreateServerlessCacheSnapshot = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidServerlessCacheStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheStateFault"
    | `ServerlessCacheNotFoundFault _ -> "com.amazonaws.elasticache#ServerlessCacheNotFoundFault"
    | `ServerlessCacheSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotAlreadyExistsFault"
    | `ServerlessCacheSnapshotQuotaExceededFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotQuotaExceededFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_serverless_cache_snapshot_request) =
    let fields = create_serverless_cache_snapshot_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateServerlessCacheSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_serverless_cache_snapshot_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_serverless_cache_snapshot_request) =
    let fields = create_serverless_cache_snapshot_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateServerlessCacheSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_serverless_cache_snapshot_response_of_xml ~error_deserializer
end

module CreateSnapshot = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `InvalidCacheClusterStateFault _ -> "com.amazonaws.elasticache#InvalidCacheClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | `SnapshotAlreadyExistsFault _ -> "com.amazonaws.elasticache#SnapshotAlreadyExistsFault"
    | `SnapshotFeatureNotSupportedFault _ ->
        "com.amazonaws.elasticache#SnapshotFeatureNotSupportedFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.elasticache#SnapshotQuotaExceededFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `SnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotFeatureNotSupportedFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_feature_not_supported_fault_of_xml
        with
        | Ok s -> `SnapshotFeatureNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_snapshot_message) =
    let fields = create_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_snapshot_message) =
    let fields = create_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:create_snapshot_result_of_xml ~error_deserializer
end

module CreateUser = struct
  let error_to_string = function
    | `DuplicateUserNameFault _ -> "com.amazonaws.elasticache#DuplicateUserNameFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | `UserAlreadyExistsFault _ -> "com.amazonaws.elasticache#UserAlreadyExistsFault"
    | `UserQuotaExceededFault _ -> "com.amazonaws.elasticache#UserQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DuplicateUserName" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_user_name_fault_of_xml
        with
        | Ok s -> `DuplicateUserNameFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_already_exists_fault_of_xml
        with
        | Ok s -> `UserAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_quota_exceeded_fault_of_xml
        with
        | Ok s -> `UserQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_user_message) =
    let fields = create_user_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateUser"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_of_xml ~error_deserializer

  let request_with_metadata context (request : create_user_message) =
    let fields = create_user_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateUser"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_of_xml ~error_deserializer
end

module CreateUserGroup = struct
  let error_to_string = function
    | `DefaultUserRequired _ -> "com.amazonaws.elasticache#DefaultUserRequired"
    | `DuplicateUserNameFault _ -> "com.amazonaws.elasticache#DuplicateUserNameFault"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | `UserGroupAlreadyExistsFault _ -> "com.amazonaws.elasticache#UserGroupAlreadyExistsFault"
    | `UserGroupQuotaExceededFault _ -> "com.amazonaws.elasticache#UserGroupQuotaExceededFault"
    | `UserNotFoundFault _ -> "com.amazonaws.elasticache#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DefaultUserRequired" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:default_user_required_of_xml
        with
        | Ok s -> `DefaultUserRequired s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicateUserName" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_user_name_fault_of_xml
        with
        | Ok s -> `DuplicateUserNameFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_already_exists_fault_of_xml
        with
        | Ok s -> `UserGroupAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `UserGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_not_found_fault_of_xml
        with
        | Ok s -> `UserNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_user_group_message) =
    let fields = create_user_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateUserGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_group_of_xml ~error_deserializer

  let request_with_metadata context (request : create_user_group_message) =
    let fields = create_user_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateUserGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_group_of_xml ~error_deserializer
end

module DecreaseNodeGroupsInGlobalReplicationGroup = struct
  let error_to_string = function
    | `GlobalReplicationGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#GlobalReplicationGroupNotFoundFault"
    | `InvalidGlobalReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidGlobalReplicationGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_replication_group_not_found_fault_of_xml
        with
        | Ok s -> `GlobalReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : decrease_node_groups_in_global_replication_group_message) =
    let fields = decrease_node_groups_in_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DecreaseNodeGroupsInGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:decrease_node_groups_in_global_replication_group_result_of_xml
      ~error_deserializer

  let request_with_metadata context
      (request : decrease_node_groups_in_global_replication_group_message) =
    let fields = decrease_node_groups_in_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DecreaseNodeGroupsInGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:decrease_node_groups_in_global_replication_group_result_of_xml
      ~error_deserializer
end

module DecreaseReplicaCount = struct
  let error_to_string = function
    | `ClusterQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#ClusterQuotaForCustomerExceededFault"
    | `InsufficientCacheClusterCapacityFault _ ->
        "com.amazonaws.elasticache#InsufficientCacheClusterCapacityFault"
    | `InvalidCacheClusterStateFault _ -> "com.amazonaws.elasticache#InvalidCacheClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.elasticache#InvalidVPCNetworkStateFault"
    | `NodeGroupsPerReplicationGroupQuotaExceededFault _ ->
        "com.amazonaws.elasticache#NodeGroupsPerReplicationGroupQuotaExceededFault"
    | `NodeQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#NodeQuotaForCustomerExceededFault"
    | `NoOperationFault _ -> "com.amazonaws.elasticache#NoOperationFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterQuotaForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientCacheClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cache_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientCacheClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeGroupsPerReplicationGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_groups_per_replication_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `NodeGroupsPerReplicationGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeQuotaForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `NodeQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoOperationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_operation_fault_of_xml
        with
        | Ok s -> `NoOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : decrease_replica_count_message) =
    let fields = decrease_replica_count_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DecreaseReplicaCount"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:decrease_replica_count_result_of_xml ~error_deserializer

  let request_with_metadata context (request : decrease_replica_count_message) =
    let fields = decrease_replica_count_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DecreaseReplicaCount"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:decrease_replica_count_result_of_xml ~error_deserializer
end

module DeleteCacheCluster = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `InvalidCacheClusterStateFault _ -> "com.amazonaws.elasticache#InvalidCacheClusterStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `SnapshotAlreadyExistsFault _ -> "com.amazonaws.elasticache#SnapshotAlreadyExistsFault"
    | `SnapshotFeatureNotSupportedFault _ ->
        "com.amazonaws.elasticache#SnapshotFeatureNotSupportedFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.elasticache#SnapshotQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `SnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotFeatureNotSupportedFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_feature_not_supported_fault_of_xml
        with
        | Ok s -> `SnapshotFeatureNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_cache_cluster_message) =
    let fields = delete_cache_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteCacheCluster"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_cache_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_cache_cluster_message) =
    let fields = delete_cache_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteCacheCluster"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_cache_cluster_result_of_xml ~error_deserializer
end

module DeleteCacheParameterGroup = struct
  let error_to_string = function
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `InvalidCacheParameterGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidCacheParameterGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_cache_parameter_group_message) =
    let fields = delete_cache_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteCacheParameterGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_cache_parameter_group_message) =
    let fields = delete_cache_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteCacheParameterGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteCacheSecurityGroup = struct
  let error_to_string = function
    | `CacheSecurityGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupNotFoundFault"
    | `InvalidCacheSecurityGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidCacheSecurityGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_cache_security_group_message) =
    let fields = delete_cache_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteCacheSecurityGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_cache_security_group_message) =
    let fields = delete_cache_security_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteCacheSecurityGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteCacheSubnetGroup = struct
  let error_to_string = function
    | `CacheSubnetGroupInUse _ -> "com.amazonaws.elasticache#CacheSubnetGroupInUse"
    | `CacheSubnetGroupNotFoundFault _ -> "com.amazonaws.elasticache#CacheSubnetGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheSubnetGroupInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_group_in_use_of_xml
        with
        | Ok s -> `CacheSubnetGroupInUse s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_cache_subnet_group_message) =
    let fields = delete_cache_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteCacheSubnetGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_cache_subnet_group_message) =
    let fields = delete_cache_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteCacheSubnetGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteGlobalReplicationGroup = struct
  let error_to_string = function
    | `GlobalReplicationGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#GlobalReplicationGroupNotFoundFault"
    | `InvalidGlobalReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidGlobalReplicationGroupStateFault"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_replication_group_not_found_fault_of_xml
        with
        | Ok s -> `GlobalReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_global_replication_group_message) =
    let fields = delete_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_global_replication_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_global_replication_group_message) =
    let fields = delete_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_global_replication_group_result_of_xml ~error_deserializer
end

module DeleteReplicationGroup = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | `SnapshotAlreadyExistsFault _ -> "com.amazonaws.elasticache#SnapshotAlreadyExistsFault"
    | `SnapshotFeatureNotSupportedFault _ ->
        "com.amazonaws.elasticache#SnapshotFeatureNotSupportedFault"
    | `SnapshotQuotaExceededFault _ -> "com.amazonaws.elasticache#SnapshotQuotaExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `SnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotFeatureNotSupportedFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_feature_not_supported_fault_of_xml
        with
        | Ok s -> `SnapshotFeatureNotSupportedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_quota_exceeded_fault_of_xml
        with
        | Ok s -> `SnapshotQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_replication_group_message) =
    let fields = delete_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_replication_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_replication_group_message) =
    let fields = delete_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_replication_group_result_of_xml ~error_deserializer
end

module DeleteServerlessCache = struct
  let error_to_string = function
    | `InvalidCredentialsException _ -> "com.amazonaws.elasticache#InvalidCredentialsException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidServerlessCacheStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheStateFault"
    | `ServerlessCacheNotFoundFault _ -> "com.amazonaws.elasticache#ServerlessCacheNotFoundFault"
    | `ServerlessCacheSnapshotAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotAlreadyExistsFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidCredentialsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_credentials_exception_of_xml
        with
        | Ok s -> `InvalidCredentialsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotAlreadyExistsFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_already_exists_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_serverless_cache_request) =
    let fields = delete_serverless_cache_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteServerlessCache"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_serverless_cache_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_serverless_cache_request) =
    let fields = delete_serverless_cache_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteServerlessCache"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_serverless_cache_response_of_xml ~error_deserializer
end

module DeleteServerlessCacheSnapshot = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidServerlessCacheSnapshotStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheSnapshotStateFault"
    | `ServerlessCacheSnapshotNotFoundFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_serverless_cache_snapshot_request) =
    let fields = delete_serverless_cache_snapshot_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteServerlessCacheSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_serverless_cache_snapshot_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_serverless_cache_snapshot_request) =
    let fields = delete_serverless_cache_snapshot_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteServerlessCacheSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_serverless_cache_snapshot_response_of_xml ~error_deserializer
end

module DeleteSnapshot = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidSnapshotStateFault _ -> "com.amazonaws.elasticache#InvalidSnapshotStateFault"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.elasticache#SnapshotNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSnapshotState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_snapshot_message) =
    let fields = delete_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_snapshot_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_snapshot_message) =
    let fields = delete_snapshot_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:delete_snapshot_result_of_xml ~error_deserializer
end

module DeleteUser = struct
  let error_to_string = function
    | `DefaultUserAssociatedToUserGroupFault _ ->
        "com.amazonaws.elasticache#DefaultUserAssociatedToUserGroupFault"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidUserStateFault _ -> "com.amazonaws.elasticache#InvalidUserStateFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `UserNotFoundFault _ -> "com.amazonaws.elasticache#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DefaultUserAssociatedToUserGroup" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:default_user_associated_to_user_group_fault_of_xml
        with
        | Ok s -> `DefaultUserAssociatedToUserGroupFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidUserState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_user_state_fault_of_xml
        with
        | Ok s -> `InvalidUserStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_not_found_fault_of_xml
        with
        | Ok s -> `UserNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_user_message) =
    let fields = delete_user_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteUser"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_user_message) =
    let fields = delete_user_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteUser"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_of_xml ~error_deserializer
end

module DeleteUserGroup = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidUserGroupStateFault _ -> "com.amazonaws.elasticache#InvalidUserGroupStateFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `UserGroupNotFoundFault _ -> "com.amazonaws.elasticache#UserGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidUserGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_user_group_state_fault_of_xml
        with
        | Ok s -> `InvalidUserGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_not_found_fault_of_xml
        with
        | Ok s -> `UserGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_user_group_message) =
    let fields = delete_user_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteUserGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_group_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_user_group_message) =
    let fields = delete_user_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteUserGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_group_of_xml ~error_deserializer
end

module DescribeCacheClusters = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cache_clusters_message) =
    let fields = describe_cache_clusters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeCacheClusters"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_cluster_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cache_clusters_message) =
    let fields = describe_cache_clusters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeCacheClusters"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_cluster_message_of_xml ~error_deserializer
end

module DescribeCacheEngineVersions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cache_engine_versions_message) =
    let fields = describe_cache_engine_versions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeCacheEngineVersions"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_engine_version_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cache_engine_versions_message) =
    let fields = describe_cache_engine_versions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeCacheEngineVersions"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_engine_version_message_of_xml ~error_deserializer
end

module DescribeCacheParameterGroups = struct
  let error_to_string = function
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cache_parameter_groups_message) =
    let fields = describe_cache_parameter_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeCacheParameterGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_parameter_groups_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cache_parameter_groups_message) =
    let fields = describe_cache_parameter_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeCacheParameterGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_parameter_groups_message_of_xml ~error_deserializer
end

module DescribeCacheParameters = struct
  let error_to_string = function
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cache_parameters_message) =
    let fields = describe_cache_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeCacheParameters"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_parameter_group_details_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cache_parameters_message) =
    let fields = describe_cache_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeCacheParameters"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_parameter_group_details_of_xml ~error_deserializer
end

module DescribeCacheSecurityGroups = struct
  let error_to_string = function
    | `CacheSecurityGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cache_security_groups_message) =
    let fields = describe_cache_security_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeCacheSecurityGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_security_group_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cache_security_groups_message) =
    let fields = describe_cache_security_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeCacheSecurityGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_security_group_message_of_xml ~error_deserializer
end

module DescribeCacheSubnetGroups = struct
  let error_to_string = function
    | `CacheSubnetGroupNotFoundFault _ -> "com.amazonaws.elasticache#CacheSubnetGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_cache_subnet_groups_message) =
    let fields = describe_cache_subnet_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeCacheSubnetGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_subnet_group_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_cache_subnet_groups_message) =
    let fields = describe_cache_subnet_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeCacheSubnetGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_subnet_group_message_of_xml ~error_deserializer
end

module DescribeEngineDefaultParameters = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_engine_default_parameters_message) =
    let fields = describe_engine_default_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEngineDefaultParameters"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_engine_default_parameters_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_engine_default_parameters_message) =
    let fields = describe_engine_default_parameters_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEngineDefaultParameters"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_engine_default_parameters_result_of_xml ~error_deserializer
end

module DescribeEvents = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_events_message) =
    let fields = describe_events_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEvents"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:events_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_events_message) =
    let fields = describe_events_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEvents"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:events_message_of_xml ~error_deserializer
end

module DescribeGlobalReplicationGroups = struct
  let error_to_string = function
    | `GlobalReplicationGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#GlobalReplicationGroupNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_replication_group_not_found_fault_of_xml
        with
        | Ok s -> `GlobalReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_global_replication_groups_message) =
    let fields = describe_global_replication_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeGlobalReplicationGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_global_replication_groups_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_global_replication_groups_message) =
    let fields = describe_global_replication_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeGlobalReplicationGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_global_replication_groups_result_of_xml ~error_deserializer
end

module DescribeReplicationGroups = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_replication_groups_message) =
    let fields = describe_replication_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeReplicationGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:replication_group_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_replication_groups_message) =
    let fields = describe_replication_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeReplicationGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:replication_group_message_of_xml ~error_deserializer
end

module DescribeReservedCacheNodes = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ReservedCacheNodeNotFoundFault _ ->
        "com.amazonaws.elasticache#ReservedCacheNodeNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedCacheNodeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_cache_node_not_found_fault_of_xml
        with
        | Ok s -> `ReservedCacheNodeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_reserved_cache_nodes_message) =
    let fields = describe_reserved_cache_nodes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeReservedCacheNodes"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:reserved_cache_node_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_reserved_cache_nodes_message) =
    let fields = describe_reserved_cache_nodes_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeReservedCacheNodes"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:reserved_cache_node_message_of_xml ~error_deserializer
end

module DescribeReservedCacheNodesOfferings = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ReservedCacheNodesOfferingNotFoundFault _ ->
        "com.amazonaws.elasticache#ReservedCacheNodesOfferingNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedCacheNodesOfferingNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_cache_nodes_offering_not_found_fault_of_xml
        with
        | Ok s -> `ReservedCacheNodesOfferingNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_reserved_cache_nodes_offerings_message) =
    let fields = describe_reserved_cache_nodes_offerings_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeReservedCacheNodesOfferings"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:reserved_cache_nodes_offering_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_reserved_cache_nodes_offerings_message) =
    let fields = describe_reserved_cache_nodes_offerings_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeReservedCacheNodesOfferings"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:reserved_cache_nodes_offering_message_of_xml ~error_deserializer
end

module DescribeServerlessCacheSnapshots = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ServerlessCacheNotFoundFault _ -> "com.amazonaws.elasticache#ServerlessCacheNotFoundFault"
    | `ServerlessCacheSnapshotNotFoundFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_serverless_cache_snapshots_request) =
    let fields = describe_serverless_cache_snapshots_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeServerlessCacheSnapshots"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_serverless_cache_snapshots_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_serverless_cache_snapshots_request) =
    let fields = describe_serverless_cache_snapshots_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeServerlessCacheSnapshots"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_serverless_cache_snapshots_response_of_xml ~error_deserializer
end

module DescribeServerlessCaches = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ServerlessCacheNotFoundFault _ -> "com.amazonaws.elasticache#ServerlessCacheNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_serverless_caches_request) =
    let fields = describe_serverless_caches_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeServerlessCaches"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_serverless_caches_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_serverless_caches_request) =
    let fields = describe_serverless_caches_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeServerlessCaches"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_serverless_caches_response_of_xml ~error_deserializer
end

module DescribeServiceUpdates = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ServiceUpdateNotFoundFault _ -> "com.amazonaws.elasticache#ServiceUpdateNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceUpdateNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_update_not_found_fault_of_xml
        with
        | Ok s -> `ServiceUpdateNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_service_updates_message) =
    let fields = describe_service_updates_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeServiceUpdates"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:service_updates_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_service_updates_message) =
    let fields = describe_service_updates_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeServiceUpdates"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:service_updates_message_of_xml ~error_deserializer
end

module DescribeSnapshots = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.elasticache#SnapshotNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_snapshots_message) =
    let fields = describe_snapshots_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeSnapshots"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_snapshots_list_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_snapshots_message) =
    let fields = describe_snapshots_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeSnapshots"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_snapshots_list_message_of_xml ~error_deserializer
end

module DescribeUpdateActions = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_update_actions_message) =
    let fields = describe_update_actions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeUpdateActions"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:update_actions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_update_actions_message) =
    let fields = describe_update_actions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeUpdateActions"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:update_actions_message_of_xml ~error_deserializer
end

module DescribeUserGroups = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `UserGroupNotFoundFault _ -> "com.amazonaws.elasticache#UserGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_not_found_fault_of_xml
        with
        | Ok s -> `UserGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_user_groups_message) =
    let fields = describe_user_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeUserGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_user_groups_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_user_groups_message) =
    let fields = describe_user_groups_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeUserGroups"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_user_groups_result_of_xml ~error_deserializer
end

module DescribeUsers = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `UserNotFoundFault _ -> "com.amazonaws.elasticache#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_not_found_fault_of_xml
        with
        | Ok s -> `UserNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_users_message) =
    let fields = describe_users_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeUsers"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_users_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_users_message) =
    let fields = describe_users_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeUsers"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:describe_users_result_of_xml ~error_deserializer
end

module DisassociateGlobalReplicationGroup = struct
  let error_to_string = function
    | `GlobalReplicationGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#GlobalReplicationGroupNotFoundFault"
    | `InvalidGlobalReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidGlobalReplicationGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_replication_group_not_found_fault_of_xml
        with
        | Ok s -> `GlobalReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disassociate_global_replication_group_message) =
    let fields = disassociate_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisassociateGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:disassociate_global_replication_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : disassociate_global_replication_group_message) =
    let fields = disassociate_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DisassociateGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:disassociate_global_replication_group_result_of_xml ~error_deserializer
end

module ExportServerlessCacheSnapshot = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidServerlessCacheSnapshotStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheSnapshotStateFault"
    | `ServerlessCacheSnapshotNotFoundFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : export_serverless_cache_snapshot_request) =
    let fields = export_serverless_cache_snapshot_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ExportServerlessCacheSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:export_serverless_cache_snapshot_response_of_xml ~error_deserializer

  let request_with_metadata context (request : export_serverless_cache_snapshot_request) =
    let fields = export_serverless_cache_snapshot_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ExportServerlessCacheSnapshot"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:export_serverless_cache_snapshot_response_of_xml ~error_deserializer
end

module FailoverGlobalReplicationGroup = struct
  let error_to_string = function
    | `GlobalReplicationGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#GlobalReplicationGroupNotFoundFault"
    | `InvalidGlobalReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidGlobalReplicationGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_replication_group_not_found_fault_of_xml
        with
        | Ok s -> `GlobalReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : failover_global_replication_group_message) =
    let fields = failover_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"FailoverGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:failover_global_replication_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : failover_global_replication_group_message) =
    let fields = failover_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"FailoverGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:failover_global_replication_group_result_of_xml ~error_deserializer
end

module IncreaseNodeGroupsInGlobalReplicationGroup = struct
  let error_to_string = function
    | `GlobalReplicationGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#GlobalReplicationGroupNotFoundFault"
    | `InvalidGlobalReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidGlobalReplicationGroupStateFault"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_replication_group_not_found_fault_of_xml
        with
        | Ok s -> `GlobalReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : increase_node_groups_in_global_replication_group_message) =
    let fields = increase_node_groups_in_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"IncreaseNodeGroupsInGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:increase_node_groups_in_global_replication_group_result_of_xml
      ~error_deserializer

  let request_with_metadata context
      (request : increase_node_groups_in_global_replication_group_message) =
    let fields = increase_node_groups_in_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"IncreaseNodeGroupsInGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:increase_node_groups_in_global_replication_group_result_of_xml
      ~error_deserializer
end

module IncreaseReplicaCount = struct
  let error_to_string = function
    | `ClusterQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#ClusterQuotaForCustomerExceededFault"
    | `InsufficientCacheClusterCapacityFault _ ->
        "com.amazonaws.elasticache#InsufficientCacheClusterCapacityFault"
    | `InvalidCacheClusterStateFault _ -> "com.amazonaws.elasticache#InvalidCacheClusterStateFault"
    | `InvalidKMSKeyFault _ -> "com.amazonaws.elasticache#InvalidKMSKeyFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.elasticache#InvalidVPCNetworkStateFault"
    | `NodeGroupsPerReplicationGroupQuotaExceededFault _ ->
        "com.amazonaws.elasticache#NodeGroupsPerReplicationGroupQuotaExceededFault"
    | `NodeQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#NodeQuotaForCustomerExceededFault"
    | `NoOperationFault _ -> "com.amazonaws.elasticache#NoOperationFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ClusterQuotaForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cluster_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `ClusterQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientCacheClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cache_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientCacheClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidKMSKeyFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_kms_key_fault_of_xml
        with
        | Ok s -> `InvalidKMSKeyFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeGroupsPerReplicationGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_groups_per_replication_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `NodeGroupsPerReplicationGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeQuotaForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `NodeQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoOperationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_operation_fault_of_xml
        with
        | Ok s -> `NoOperationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : increase_replica_count_message) =
    let fields = increase_replica_count_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"IncreaseReplicaCount"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:increase_replica_count_result_of_xml ~error_deserializer

  let request_with_metadata context (request : increase_replica_count_message) =
    let fields = increase_replica_count_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"IncreaseReplicaCount"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:increase_replica_count_result_of_xml ~error_deserializer
end

module ListAllowedNodeTypeModifications = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_allowed_node_type_modifications_message) =
    let fields = list_allowed_node_type_modifications_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListAllowedNodeTypeModifications"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:allowed_node_type_modifications_message_of_xml ~error_deserializer

  let request_with_metadata context (request : list_allowed_node_type_modifications_message) =
    let fields = list_allowed_node_type_modifications_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListAllowedNodeTypeModifications"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:allowed_node_type_modifications_message_of_xml ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `CacheSecurityGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupNotFoundFault"
    | `CacheSubnetGroupNotFoundFault _ -> "com.amazonaws.elasticache#CacheSubnetGroupNotFoundFault"
    | `InvalidARNFault _ -> "com.amazonaws.elasticache#InvalidARNFault"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `InvalidServerlessCacheSnapshotStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheSnapshotStateFault"
    | `InvalidServerlessCacheStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheStateFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | `ReservedCacheNodeNotFoundFault _ ->
        "com.amazonaws.elasticache#ReservedCacheNodeNotFoundFault"
    | `ServerlessCacheNotFoundFault _ -> "com.amazonaws.elasticache#ServerlessCacheNotFoundFault"
    | `ServerlessCacheSnapshotNotFoundFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotNotFoundFault"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.elasticache#SnapshotNotFoundFault"
    | `UserGroupNotFoundFault _ -> "com.amazonaws.elasticache#UserGroupNotFoundFault"
    | `UserNotFoundFault _ -> "com.amazonaws.elasticache#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidARN" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_arn_fault_of_xml
        with
        | Ok s -> `InvalidARNFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedCacheNodeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_cache_node_not_found_fault_of_xml
        with
        | Ok s -> `ReservedCacheNodeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_not_found_fault_of_xml
        with
        | Ok s -> `UserGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_not_found_fault_of_xml
        with
        | Ok s -> `UserNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_tags_for_resource_message) =
    let fields = list_tags_for_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListTagsForResource"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:tag_list_message_of_xml ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_message) =
    let fields = list_tags_for_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListTagsForResource"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:tag_list_message_of_xml ~error_deserializer
end

module ModifyCacheCluster = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `CacheSecurityGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupNotFoundFault"
    | `InsufficientCacheClusterCapacityFault _ ->
        "com.amazonaws.elasticache#InsufficientCacheClusterCapacityFault"
    | `InvalidCacheClusterStateFault _ -> "com.amazonaws.elasticache#InvalidCacheClusterStateFault"
    | `InvalidCacheSecurityGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidCacheSecurityGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.elasticache#InvalidVPCNetworkStateFault"
    | `NodeQuotaForClusterExceededFault _ ->
        "com.amazonaws.elasticache#NodeQuotaForClusterExceededFault"
    | `NodeQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#NodeQuotaForCustomerExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientCacheClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cache_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientCacheClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeQuotaForClusterExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_quota_for_cluster_exceeded_fault_of_xml
        with
        | Ok s -> `NodeQuotaForClusterExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeQuotaForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `NodeQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_cache_cluster_message) =
    let fields = modify_cache_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyCacheCluster"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_cache_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_cache_cluster_message) =
    let fields = modify_cache_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyCacheCluster"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_cache_cluster_result_of_xml ~error_deserializer
end

module ModifyCacheParameterGroup = struct
  let error_to_string = function
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `InvalidCacheParameterGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidCacheParameterGroupStateFault"
    | `InvalidGlobalReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidGlobalReplicationGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_cache_parameter_group_message) =
    let fields = modify_cache_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyCacheParameterGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_parameter_group_name_message_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_cache_parameter_group_message) =
    let fields = modify_cache_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyCacheParameterGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_parameter_group_name_message_of_xml ~error_deserializer
end

module ModifyCacheSubnetGroup = struct
  let error_to_string = function
    | `CacheSubnetGroupNotFoundFault _ -> "com.amazonaws.elasticache#CacheSubnetGroupNotFoundFault"
    | `CacheSubnetQuotaExceededFault _ -> "com.amazonaws.elasticache#CacheSubnetQuotaExceededFault"
    | `InvalidSubnet _ -> "com.amazonaws.elasticache#InvalidSubnet"
    | `SubnetInUse _ -> "com.amazonaws.elasticache#SubnetInUse"
    | `SubnetNotAllowedFault _ -> "com.amazonaws.elasticache#SubnetNotAllowedFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSubnetQuotaExceededFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_quota_exceeded_fault_of_xml
        with
        | Ok s -> `CacheSubnetQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_of_xml
        with
        | Ok s -> `InvalidSubnet s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubnetInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subnet_in_use_of_xml
        with
        | Ok s -> `SubnetInUse s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubnetNotAllowedFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subnet_not_allowed_fault_of_xml
        with
        | Ok s -> `SubnetNotAllowedFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_cache_subnet_group_message) =
    let fields = modify_cache_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyCacheSubnetGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_cache_subnet_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_cache_subnet_group_message) =
    let fields = modify_cache_subnet_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyCacheSubnetGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_cache_subnet_group_result_of_xml ~error_deserializer
end

module ModifyGlobalReplicationGroup = struct
  let error_to_string = function
    | `GlobalReplicationGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#GlobalReplicationGroupNotFoundFault"
    | `InvalidGlobalReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidGlobalReplicationGroupStateFault"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_replication_group_not_found_fault_of_xml
        with
        | Ok s -> `GlobalReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_global_replication_group_message) =
    let fields = modify_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_global_replication_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_global_replication_group_message) =
    let fields = modify_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_global_replication_group_result_of_xml ~error_deserializer
end

module ModifyReplicationGroup = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `CacheSecurityGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupNotFoundFault"
    | `InsufficientCacheClusterCapacityFault _ ->
        "com.amazonaws.elasticache#InsufficientCacheClusterCapacityFault"
    | `InvalidCacheClusterStateFault _ -> "com.amazonaws.elasticache#InvalidCacheClusterStateFault"
    | `InvalidCacheSecurityGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidCacheSecurityGroupStateFault"
    | `InvalidKMSKeyFault _ -> "com.amazonaws.elasticache#InvalidKMSKeyFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `InvalidUserGroupStateFault _ -> "com.amazonaws.elasticache#InvalidUserGroupStateFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.elasticache#InvalidVPCNetworkStateFault"
    | `NodeQuotaForClusterExceededFault _ ->
        "com.amazonaws.elasticache#NodeQuotaForClusterExceededFault"
    | `NodeQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#NodeQuotaForCustomerExceededFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | `UserGroupNotFoundFault _ -> "com.amazonaws.elasticache#UserGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientCacheClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cache_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientCacheClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidKMSKeyFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_kms_key_fault_of_xml
        with
        | Ok s -> `InvalidKMSKeyFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidUserGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_user_group_state_fault_of_xml
        with
        | Ok s -> `InvalidUserGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeQuotaForClusterExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_quota_for_cluster_exceeded_fault_of_xml
        with
        | Ok s -> `NodeQuotaForClusterExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeQuotaForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `NodeQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_not_found_fault_of_xml
        with
        | Ok s -> `UserGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_replication_group_message) =
    let fields = modify_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_replication_group_result_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_replication_group_message) =
    let fields = modify_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_replication_group_result_of_xml ~error_deserializer
end

module ModifyReplicationGroupShardConfiguration = struct
  let error_to_string = function
    | `InsufficientCacheClusterCapacityFault _ ->
        "com.amazonaws.elasticache#InsufficientCacheClusterCapacityFault"
    | `InvalidCacheClusterStateFault _ -> "com.amazonaws.elasticache#InvalidCacheClusterStateFault"
    | `InvalidKMSKeyFault _ -> "com.amazonaws.elasticache#InvalidKMSKeyFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `InvalidVPCNetworkStateFault _ -> "com.amazonaws.elasticache#InvalidVPCNetworkStateFault"
    | `NodeGroupsPerReplicationGroupQuotaExceededFault _ ->
        "com.amazonaws.elasticache#NodeGroupsPerReplicationGroupQuotaExceededFault"
    | `NodeQuotaForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#NodeQuotaForCustomerExceededFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientCacheClusterCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_cache_cluster_capacity_fault_of_xml
        with
        | Ok s -> `InsufficientCacheClusterCapacityFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidKMSKeyFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_kms_key_fault_of_xml
        with
        | Ok s -> `InvalidKMSKeyFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidVPCNetworkStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_vpc_network_state_fault_of_xml
        with
        | Ok s -> `InvalidVPCNetworkStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeGroupsPerReplicationGroupQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_groups_per_replication_group_quota_exceeded_fault_of_xml
        with
        | Ok s -> `NodeGroupsPerReplicationGroupQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeQuotaForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_quota_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `NodeQuotaForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_replication_group_shard_configuration_message) =
    let fields = modify_replication_group_shard_configuration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyReplicationGroupShardConfiguration"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_replication_group_shard_configuration_result_of_xml
      ~error_deserializer

  let request_with_metadata context (request : modify_replication_group_shard_configuration_message)
      =
    let fields = modify_replication_group_shard_configuration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"ModifyReplicationGroupShardConfiguration"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_replication_group_shard_configuration_result_of_xml
      ~error_deserializer
end

module ModifyServerlessCache = struct
  let error_to_string = function
    | `InvalidCredentialsException _ -> "com.amazonaws.elasticache#InvalidCredentialsException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidServerlessCacheStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheStateFault"
    | `InvalidUserGroupStateFault _ -> "com.amazonaws.elasticache#InvalidUserGroupStateFault"
    | `ServerlessCacheNotFoundFault _ -> "com.amazonaws.elasticache#ServerlessCacheNotFoundFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `UserGroupNotFoundFault _ -> "com.amazonaws.elasticache#UserGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidCredentialsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_credentials_exception_of_xml
        with
        | Ok s -> `InvalidCredentialsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidUserGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_user_group_state_fault_of_xml
        with
        | Ok s -> `InvalidUserGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_not_found_fault_of_xml
        with
        | Ok s -> `UserGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_serverless_cache_request) =
    let fields = modify_serverless_cache_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyServerlessCache"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_serverless_cache_response_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_serverless_cache_request) =
    let fields = modify_serverless_cache_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyServerlessCache"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:modify_serverless_cache_response_of_xml ~error_deserializer
end

module ModifyUser = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidUserStateFault _ -> "com.amazonaws.elasticache#InvalidUserStateFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `UserNotFoundFault _ -> "com.amazonaws.elasticache#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidUserState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_user_state_fault_of_xml
        with
        | Ok s -> `InvalidUserStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_not_found_fault_of_xml
        with
        | Ok s -> `UserNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_user_message) =
    let fields = modify_user_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyUser"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_user_message) =
    let fields = modify_user_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyUser"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_of_xml ~error_deserializer
end

module ModifyUserGroup = struct
  let error_to_string = function
    | `DefaultUserRequired _ -> "com.amazonaws.elasticache#DefaultUserRequired"
    | `DuplicateUserNameFault _ -> "com.amazonaws.elasticache#DuplicateUserNameFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidUserGroupStateFault _ -> "com.amazonaws.elasticache#InvalidUserGroupStateFault"
    | `ServiceLinkedRoleNotFoundFault _ ->
        "com.amazonaws.elasticache#ServiceLinkedRoleNotFoundFault"
    | `UserGroupNotFoundFault _ -> "com.amazonaws.elasticache#UserGroupNotFoundFault"
    | `UserNotFoundFault _ -> "com.amazonaws.elasticache#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DefaultUserRequired" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:default_user_required_of_xml
        with
        | Ok s -> `DefaultUserRequired s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicateUserName" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_user_name_fault_of_xml
        with
        | Ok s -> `DuplicateUserNameFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidUserGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_user_group_state_fault_of_xml
        with
        | Ok s -> `InvalidUserGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_not_found_fault_of_xml
        with
        | Ok s -> `ServiceLinkedRoleNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_not_found_fault_of_xml
        with
        | Ok s -> `UserGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_not_found_fault_of_xml
        with
        | Ok s -> `UserNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_user_group_message) =
    let fields = modify_user_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyUserGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_group_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_user_group_message) =
    let fields = modify_user_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyUserGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:user_group_of_xml ~error_deserializer
end

module PurchaseReservedCacheNodesOffering = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `ReservedCacheNodeAlreadyExistsFault _ ->
        "com.amazonaws.elasticache#ReservedCacheNodeAlreadyExistsFault"
    | `ReservedCacheNodeQuotaExceededFault _ ->
        "com.amazonaws.elasticache#ReservedCacheNodeQuotaExceededFault"
    | `ReservedCacheNodesOfferingNotFoundFault _ ->
        "com.amazonaws.elasticache#ReservedCacheNodesOfferingNotFoundFault"
    | `TagQuotaPerResourceExceeded _ -> "com.amazonaws.elasticache#TagQuotaPerResourceExceeded"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedCacheNodeAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_cache_node_already_exists_fault_of_xml
        with
        | Ok s -> `ReservedCacheNodeAlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedCacheNodeQuotaExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_cache_node_quota_exceeded_fault_of_xml
        with
        | Ok s -> `ReservedCacheNodeQuotaExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedCacheNodesOfferingNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_cache_nodes_offering_not_found_fault_of_xml
        with
        | Ok s -> `ReservedCacheNodesOfferingNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagQuotaPerResourceExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_quota_per_resource_exceeded_of_xml
        with
        | Ok s -> `TagQuotaPerResourceExceeded s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : purchase_reserved_cache_nodes_offering_message) =
    let fields = purchase_reserved_cache_nodes_offering_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PurchaseReservedCacheNodesOffering"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:purchase_reserved_cache_nodes_offering_result_of_xml ~error_deserializer

  let request_with_metadata context (request : purchase_reserved_cache_nodes_offering_message) =
    let fields = purchase_reserved_cache_nodes_offering_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PurchaseReservedCacheNodesOffering"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:purchase_reserved_cache_nodes_offering_result_of_xml ~error_deserializer
end

module RebalanceSlotsInGlobalReplicationGroup = struct
  let error_to_string = function
    | `GlobalReplicationGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#GlobalReplicationGroupNotFoundFault"
    | `InvalidGlobalReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidGlobalReplicationGroupStateFault"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GlobalReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:global_replication_group_not_found_fault_of_xml
        with
        | Ok s -> `GlobalReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : rebalance_slots_in_global_replication_group_message) =
    let fields = rebalance_slots_in_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RebalanceSlotsInGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:rebalance_slots_in_global_replication_group_result_of_xml
      ~error_deserializer

  let request_with_metadata context (request : rebalance_slots_in_global_replication_group_message)
      =
    let fields = rebalance_slots_in_global_replication_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"RebalanceSlotsInGlobalReplicationGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:rebalance_slots_in_global_replication_group_result_of_xml
      ~error_deserializer
end

module RebootCacheCluster = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `InvalidCacheClusterStateFault _ -> "com.amazonaws.elasticache#InvalidCacheClusterStateFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reboot_cache_cluster_message) =
    let fields = reboot_cache_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RebootCacheCluster"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:reboot_cache_cluster_result_of_xml ~error_deserializer

  let request_with_metadata context (request : reboot_cache_cluster_message) =
    let fields = reboot_cache_cluster_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RebootCacheCluster"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:reboot_cache_cluster_result_of_xml ~error_deserializer
end

module RemoveTagsFromResource = struct
  let error_to_string = function
    | `CacheClusterNotFoundFault _ -> "com.amazonaws.elasticache#CacheClusterNotFoundFault"
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `CacheSecurityGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupNotFoundFault"
    | `CacheSubnetGroupNotFoundFault _ -> "com.amazonaws.elasticache#CacheSubnetGroupNotFoundFault"
    | `InvalidARNFault _ -> "com.amazonaws.elasticache#InvalidARNFault"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `InvalidServerlessCacheSnapshotStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheSnapshotStateFault"
    | `InvalidServerlessCacheStateFault _ ->
        "com.amazonaws.elasticache#InvalidServerlessCacheStateFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | `ReservedCacheNodeNotFoundFault _ ->
        "com.amazonaws.elasticache#ReservedCacheNodeNotFoundFault"
    | `ServerlessCacheNotFoundFault _ -> "com.amazonaws.elasticache#ServerlessCacheNotFoundFault"
    | `ServerlessCacheSnapshotNotFoundFault _ ->
        "com.amazonaws.elasticache#ServerlessCacheSnapshotNotFoundFault"
    | `SnapshotNotFoundFault _ -> "com.amazonaws.elasticache#SnapshotNotFoundFault"
    | `TagNotFoundFault _ -> "com.amazonaws.elasticache#TagNotFoundFault"
    | `UserGroupNotFoundFault _ -> "com.amazonaws.elasticache#UserGroupNotFoundFault"
    | `UserNotFoundFault _ -> "com.amazonaws.elasticache#UserNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheClusterNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_cluster_not_found_fault_of_xml
        with
        | Ok s -> `CacheClusterNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSubnetGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_subnet_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSubnetGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidARN" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_arn_fault_of_xml
        with
        | Ok s -> `InvalidARNFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheSnapshotStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_snapshot_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheSnapshotStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidServerlessCacheStateFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_serverless_cache_state_fault_of_xml
        with
        | Ok s -> `InvalidServerlessCacheStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReservedCacheNodeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:reserved_cache_node_not_found_fault_of_xml
        with
        | Ok s -> `ReservedCacheNodeNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServerlessCacheSnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:serverless_cache_snapshot_not_found_fault_of_xml
        with
        | Ok s -> `ServerlessCacheSnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SnapshotNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:snapshot_not_found_fault_of_xml
        with
        | Ok s -> `SnapshotNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_not_found_fault_of_xml
        with
        | Ok s -> `TagNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_group_not_found_fault_of_xml
        with
        | Ok s -> `UserGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_not_found_fault_of_xml
        with
        | Ok s -> `UserNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_tags_from_resource_message) =
    let fields = remove_tags_from_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveTagsFromResource"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:tag_list_message_of_xml ~error_deserializer

  let request_with_metadata context (request : remove_tags_from_resource_message) =
    let fields = remove_tags_from_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemoveTagsFromResource"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:tag_list_message_of_xml ~error_deserializer
end

module ResetCacheParameterGroup = struct
  let error_to_string = function
    | `CacheParameterGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheParameterGroupNotFoundFault"
    | `InvalidCacheParameterGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidCacheParameterGroupStateFault"
    | `InvalidGlobalReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidGlobalReplicationGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CacheParameterGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_parameter_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheParameterGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheParameterGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_parameter_group_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheParameterGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGlobalReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_global_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidGlobalReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reset_cache_parameter_group_message) =
    let fields = reset_cache_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ResetCacheParameterGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_parameter_group_name_message_of_xml ~error_deserializer

  let request_with_metadata context (request : reset_cache_parameter_group_message) =
    let fields = reset_cache_parameter_group_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ResetCacheParameterGroup"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:cache_parameter_group_name_message_of_xml ~error_deserializer
end

module RevokeCacheSecurityGroupIngress = struct
  let error_to_string = function
    | `AuthorizationNotFoundFault _ -> "com.amazonaws.elasticache#AuthorizationNotFoundFault"
    | `CacheSecurityGroupNotFoundFault _ ->
        "com.amazonaws.elasticache#CacheSecurityGroupNotFoundFault"
    | `InvalidCacheSecurityGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidCacheSecurityGroupStateFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_not_found_fault_of_xml
        with
        | Ok s -> `AuthorizationNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CacheSecurityGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cache_security_group_not_found_fault_of_xml
        with
        | Ok s -> `CacheSecurityGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheSecurityGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_security_group_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheSecurityGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : revoke_cache_security_group_ingress_message) =
    let fields = revoke_cache_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RevokeCacheSecurityGroupIngress"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:revoke_cache_security_group_ingress_result_of_xml ~error_deserializer

  let request_with_metadata context (request : revoke_cache_security_group_ingress_message) =
    let fields = revoke_cache_security_group_ingress_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RevokeCacheSecurityGroupIngress"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:revoke_cache_security_group_ingress_result_of_xml ~error_deserializer
end

module StartMigration = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `ReplicationGroupAlreadyUnderMigrationFault _ ->
        "com.amazonaws.elasticache#ReplicationGroupAlreadyUnderMigrationFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupAlreadyUnderMigrationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_already_under_migration_fault_of_xml
        with
        | Ok s -> `ReplicationGroupAlreadyUnderMigrationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : start_migration_message) =
    let fields = start_migration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StartMigration"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:start_migration_response_of_xml ~error_deserializer

  let request_with_metadata context (request : start_migration_message) =
    let fields = start_migration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StartMigration"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:start_migration_response_of_xml ~error_deserializer
end

module TestFailover = struct
  let error_to_string = function
    | `APICallRateForCustomerExceededFault _ ->
        "com.amazonaws.elasticache#APICallRateForCustomerExceededFault"
    | `InvalidCacheClusterStateFault _ -> "com.amazonaws.elasticache#InvalidCacheClusterStateFault"
    | `InvalidKMSKeyFault _ -> "com.amazonaws.elasticache#InvalidKMSKeyFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.elasticache#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `NodeGroupNotFoundFault _ -> "com.amazonaws.elasticache#NodeGroupNotFoundFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | `TestFailoverNotAvailableFault _ -> "com.amazonaws.elasticache#TestFailoverNotAvailableFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "APICallRateForCustomerExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:api_call_rate_for_customer_exceeded_fault_of_xml
        with
        | Ok s -> `APICallRateForCustomerExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCacheClusterState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cache_cluster_state_fault_of_xml
        with
        | Ok s -> `InvalidCacheClusterStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidKMSKeyFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_kms_key_fault_of_xml
        with
        | Ok s -> `InvalidKMSKeyFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NodeGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:node_group_not_found_fault_of_xml
        with
        | Ok s -> `NodeGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TestFailoverNotAvailableFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:test_failover_not_available_fault_of_xml
        with
        | Ok s -> `TestFailoverNotAvailableFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : test_failover_message) =
    let fields = test_failover_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TestFailover"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:test_failover_result_of_xml ~error_deserializer

  let request_with_metadata context (request : test_failover_message) =
    let fields = test_failover_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TestFailover"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:test_failover_result_of_xml ~error_deserializer
end

module TestMigration = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.elasticache#InvalidParameterValueException"
    | `InvalidReplicationGroupStateFault _ ->
        "com.amazonaws.elasticache#InvalidReplicationGroupStateFault"
    | `ReplicationGroupAlreadyUnderMigrationFault _ ->
        "com.amazonaws.elasticache#ReplicationGroupAlreadyUnderMigrationFault"
    | `ReplicationGroupNotFoundFault _ -> "com.amazonaws.elasticache#ReplicationGroupNotFoundFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidReplicationGroupState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_replication_group_state_fault_of_xml
        with
        | Ok s -> `InvalidReplicationGroupStateFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupAlreadyUnderMigrationFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_already_under_migration_fault_of_xml
        with
        | Ok s -> `ReplicationGroupAlreadyUnderMigrationFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplicationGroupNotFoundFault" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replication_group_not_found_fault_of_xml
        with
        | Ok s -> `ReplicationGroupNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : test_migration_message) =
    let fields = test_migration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TestMigration"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:test_migration_response_of_xml ~error_deserializer

  let request_with_metadata context (request : test_migration_message) =
    let fields = test_migration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TestMigration"
      ~xmlNamespace:"http://elasticache.amazonaws.com/doc/2015-02-02/" ~service ~context ~fields
      ~output_deserializer:test_migration_response_of_xml ~error_deserializer
end
